const mysql = require('mysql');
const env = require('dotenv').config();

const getTopSongsFunc = require('./getTopSongs')

const axios = require('axios');

const credentials = {
    host: `${process.env.DB_HOST}`,
    user: `${process.env.DB_USER}`,
    password: `${process.env.DB_PASSWORD}`, 
    database: `${process.env.DB_NAME}`
};

const connection = mysql.createConnection(credentials);

function executeQuery(sqlQuery) {
    return new Promise((resolve, reject) => {
        connection.query(sqlQuery, (err, results, fields) => {
            if(err) reject(err);
            resolve(results);
        });
    });
}

async function setUserAuthToken(user_id, user_access_token, user_code, request_again_auth_token) {
    try {
        await executeQuery(`INSERT IGNORE INTO UserAuthentication VALUES ('${user_id}', '${user_access_token}', '${user_code}', '${request_again_auth_token}')`);
        await executeQuery(`UPDATE UserAuthentication SET user_access_token = '${user_access_token}' WHERE user_id = '${user_id}'`);
    } catch(err) {
        console.log(err);
    }
}

async function getUserAuthToken(userId) {
    try {
        var userToken = await executeQuery(`SELECT user_access_token FROM UserAuthentication WHERE user_id = '${userId}'`);
        if(userToken.length > 0) return userToken[0].user_access_token;
        return null;
    } catch(err) {
        console.log(err);
    }
}

async function setUserDetails(user_id, display_name, email, country, img_url, share_code) {
    try {
        var ret1 = await executeQuery(`SELECT count(*) as res FROM Users WHERE user_id='${user_id}'`);
        if(ret1[0]['res'] == 1) return;
        await executeQuery(`INSERT IGNORE INTO Users VALUES ('${user_id}', '${display_name}', '${email}', '${country}', '${img_url}', '${share_code}')`);
    } catch(err) {
        console.log(err);
    }
}

async function getUsersBySearch(keyword) {
    try {
        var data = await executeQuery(`SELECT display_name from Users WHERE display_name like '%${keyword}%'`);
        return data;
    } catch (err) {
        console.log(err);
    }
}

async function getUserBySharecode(sharecode) {
    try {
        var data = await executeQuery(`SELECT user_id from Users WHERE share_code = '${sharecode}'`);
        return data;
    } catch (err) {
        console.log(err);
    }
}

async function setTracks(songs) {
    try {
        for (let i = 0; i < songs.length; i++) {
            if (songs[i] == undefined) {
                continue;
            }
            await executeQuery(`INSERT IGNORE INTO Tracks VALUES ('${songs[i].track_id}', '${songs[i].artist_name}', '${songs[i].artist_id}', '${songs[i].duration}', '${songs[i].explct}', '${songs[i].track_name}', '${songs[i].popularity}', '${songs[i].img_url}')`);
        }
    } catch(err) {
      console.log(err);
    }
}

async function deleteUserById(userId) {
    try {
        await executeQuery(`DELETE from Users WHERE user_id='${userId}'`);
    } catch (err) {
        console.log(err);
    }
}

async function setAudioFeatures(track_features) {
    try {
        for (let i = 0; i < track_features.length; i++) {
            await executeQuery(`INSERT IGNORE INTO AudioFeatures VALUES ('${track_features[i].track_id}', '${track_features[i].acousticness}', '${track_features[i].danceability}', '${track_features[i].duration_ms}', '${track_features[i].energy}', '${track_features[i].instrumentalness}', '${track_features[i].track_key}', '${track_features[i].liveness}', '${track_features[i].loudness}', '${track_features[i].speechiness}', '${track_features[i].tempo}', '${track_features[i].valence}')`);
        }
    } catch(err) {
        console.log(err);
    }
}

async function updateUserNamebyId(userId, payload) {
    try {
        await executeQuery(`UPDATE Users set display_name='${payload}' WHERE user_id='${userId}'`);
    } catch (err) {
        console.log(err);
    }
}

async function setArtistTrack(songs_with_artists) {
    try {
        for (let i = 0; i < songs_with_artists.length; i++) {
            await executeQuery(`INSERT IGNORE INTO ArtistTrack VALUES ('${songs_with_artists[i].artist_id}', '${songs_with_artists[i].track_id}', '${songs_with_artists[i].artist_id + "@" + songs_with_artists[i].track_id}')`);
        }
    } catch(err) {
        console.log(err);
    }
}

async function setUserTrack(songs_with_artists) {
    try {
        for (let i = 0; i < songs_with_artists.length; i++) {
            await executeQuery(`INSERT IGNORE INTO UserTrack VALUES ('${songs_with_artists[i].user_id}', '${songs_with_artists[i].track_id}', '${songs_with_artists[i].user_id + "@" + songs_with_artists[i].track_id}')`);
        }
    } catch(err) {
        console.log(err);
    }
}

async function setUserArtist(songs_with_artists) {
    try {
        for (let i = 0; i < songs_with_artists.length; i++) {
            await executeQuery(`INSERT IGNORE INTO UserArtist VALUES ('${songs_with_artists[i].user_id}', '${songs_with_artists[i].artist_id}', '${songs_with_artists[i].user_id + "@" + songs_with_artists[i].artist_id}')`);
        }
    } catch(err) {
        console.log(err);
    }
}


async function setArtist(token, songs_with_artists) {
    try {        
        var artists_info = [];

        for (let i = 0; i < songs_with_artists.length; i+=50) { 

            artists_as_string = '';
            let j = i
            var max = (i + 50 <= songs_with_artists.length)? i+50 : songs_with_artists.length;
            for (; j < max; j++) {

                if (j != max - 1) {
                    artists_as_string = artists_as_string + songs_with_artists[j]['artist_id'] + ',';

                } else {
                    artists_as_string = artists_as_string + songs_with_artists[j]['artist_id'];
                }
            }

            var config = {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer ' + token
                }
            };

            const resp = await axios.get("https://api.spotify.com/v1/artists?ids=" + artists_as_string, config);

            var num = (j%50 == 0)? 50 : j;
            
            j = 0;
            for (; j < num; j++) {                

                if (resp.data['artists'] == undefined) continue;
                if (resp.data['artists'][j] == undefined) continue;

                var artist_id = resp.data['artists'][j]['id'];
                var artist_name_temp = resp.data['artists'][j]['name'];
                var artist_name = artist_name_temp.replace(/'/g, "");
                var popularity = resp.data['artists'][j]['popularity'];
                var genres = '';

                let counter = 0;
                for (let k = 0; k < resp.data['artists'][j]['genres'].length; k++) {

                    if (counter + resp.data['artists'][j]['genres'][k].length >= 200) {
                        break;
                    }

                    if ((k + 1 < resp.data['artists'][j]['genres'].length) && (counter + resp.data['artists'][j]['genres'][k + 1].length < 200)) {
                        genres += resp.data['artists'][j]['genres'][k].replace(/'/g, "") + ',';

                    } else {
                        genres += resp.data['artists'][j]['genres'][k].replace(/'/g, "");
                    }
                }

                var artist_info = {"artist_id": artist_id, "artist_name": artist_name, "popularity": popularity, "genres": genres};

                artists_info.push(artist_info);
            }
        }

        // console.log(artists_info);

        for (let i = 0; i < artists_info.length; i++) {
            await executeQuery(`INSERT IGNORE INTO Artists VALUES ('${artists_info[i].artist_id}', '${artists_info[i].artist_name}', '${artists_info[i].popularity}', '${artists_info[i].genres}')`);
        }
    } catch(err) {
        console.log(err);
    }
}

async function getUserDisplayNameById(userId) {
    try {
        var data = await executeQuery(`SELECT display_name FROM Users WHERE user_id='${userId}'`);
        if(data[0]) return data[0];
        return -1;
    } catch(e) {
        console.log(e);
        return -1;
    }
}

async function getUserDetailsById(userId) {
    try {
        var data = await executeQuery(`SELECT display_name, image_url FROM Users WHERE user_id='${userId}'`);
        if(data[0]) return {
            'image_url' : data[0]['image_url'],
            'display_name' : data[0]['display_name']
        };
        return -1;
    } catch(e) {
        console.log(e);
        return -1;
    }
}

async function getUserShareCodeById(userId) {
    try {
        var data = await executeQuery(`SELECT share_code FROM Users WHERE user_id='${userId}'`);
        if(data[0]) return data[0];
        return -1;
    } catch(e) {
        console.log(e);
        return -1;
    }
}

async function clearAllTables() {
    try {
        await executeQuery(`DELETE from UserTrack`);
        await executeQuery(`DELETE from Tracks`);
        await executeQuery(`DELETE from AudioFeatures`);
        await executeQuery(`DELETE from Artists`);
        await executeQuery(`DELETE from ArtistTrack`);
        await executeQuery(`DELETE from UserArtist`);
    } catch (e) {
        console.log(e);
    }
}

async function userInsightsCheck(userId) {
    try {
        temp = await executeQuery(`SELECT COUNT(*) as count from UserTrack WHERE user_id = '${userId}'`);
        return temp[0]['count'];
    } catch (e) {
        console.log(e);
    }
}

async function userInsights(token, user_id_arg) {
    try {
        temp = await executeQuery(`SELECT COUNT(*) as num_songs, AVG(valence) as avg_valence, AVG(track_key) as avg_track_key, AVG(liveness) as avg_liveness, AVG(acoustiness) as avg_acousticness, AVG(danceability) as avg_danceability, AVG(duration_ms)/1000 as avg_seconds, AVG(energy) as avg_energy, AVG(instrumentalness) as avg_instrumentalness, AVG(loudness) as avg_loudness, AVG(speechiness) as avg_speechiness, AVG(tempo) as avg_tempo FROM (SELECT user_id, track_id FROM UserTrack WHERE user_id = '${user_id_arg}') as user_track_for_spe_user NATURAL JOIN AudioFeatures GROUP BY user_id`);
        audio_features_json = {
            "num_songs":temp[0].num_songs, 
            "avg_valence": temp[0].avg_valence.toFixed(2), 
            "avg_track_key": temp[0].avg_track_key.toFixed(2), 
            "avg_liveness": temp[0].avg_liveness.toFixed(2), 
            "avg_acousticness": temp[0].avg_acousticness.toFixed(2), 
            "avg_danceability": temp[0].avg_danceability.toFixed(2), 
            "avg_seconds": temp[0].avg_seconds.toFixed(2), 
            "avg_energy": temp[0].avg_energy.toFixed(2), 
            "avg_instrumentalness": temp[0].avg_instrumentalness.toFixed(2), 
            "avg_loudness": temp[0].avg_loudness.toFixed(2), 
            "avg_speechiness": temp[0].avg_speechiness.toFixed(2), 
            "avg_tempo": temp[0].avg_tempo.toFixed(2)
        };
        return audio_features_json;
    } catch (e) {
        console.log(e);
    }
}

async function AdvancedQuery2() {
    try {
        temp = await executeQuery(`SELECT a.artist_name, COUNT(*) as explicit_count FROM Artists a JOIN Tracks t Using (artist_id) WHERE genres LIKE '%pop%' AND explcit = 1 GROUP BY artist_id HAVING explicit_count > 1 ORDER BY explicit_count DESC Limit 10;`);
        return temp;
    } catch (e) {
        console.log(e);
    }
}

async function AdvancedQuery3() {
    try {
        temp = await executeQuery(`SELECT a.artist_id, a.artist_name, ROUND(AVG(f.energy), 4) as avg_energy FROM Artists a Join Tracks t Using(artist_id) join AudioFeatures f Using(track_id) GROUP BY a.artist_id, a.artist_name ORDER BY avg_energy DESC LIMIT 10;`);
        return temp;
    } catch (e) {
        console.log(e);
    }
}

async function getCommonSongs(user1, user2) {
    try {
        var temp = await executeQuery(`select track_name, img_url from syncTunes.Tracks 
        where track_id in (
            select track_id from syncTunes.UserTrack 
            where user_id = '${user2}' 
                and track_id in (
                    select track_id from syncTunes.UserTrack where user_id = '${user1}'
                )
        )`);
        return temp;
    } catch(e) {
        console.log(e);
    }
}

async function getCommonArtists(user1, user2) {
    try {
        var temp = await executeQuery(`select DISTINCT artist_name
            from syncTunes.ArtistTrack NATURAL JOIN (
            select track_id 
            from syncTunes.Tracks 
            NATURAL JOIN (
                select track_id 
                from syncTunes.UserTrack 
                where user_id = '${user1}' and track_id in (
                                                                select track_id 
                                                                from syncTunes.UserTrack 
                                                                where user_id = '${user2}'
                                                            )
                ) as commonSongs_temp
            order by track_id ASC
            ) as common_songs_id NATURAL JOIN Artists`);
        return temp;
    } catch(e) {
        console.log(e);
    }
}

async function getCompatibility(user1, user2) {
    try {
        var temp = await executeQuery(`call syncTunes.getFeaturesForCommonSongs('${user1}', '${user2}');`);
        return temp[0];
    } catch(e) {
        console.log(e);
    }
}

module.exports.setUserAuthToken = setUserAuthToken;
module.exports.executeQuery = executeQuery;
module.exports.getUserAuthToken = getUserAuthToken;
module.exports.setUserDetails = setUserDetails;
module.exports.getUsersBySearch = getUsersBySearch;
module.exports.getUserBySharecode = getUserBySharecode;
module.exports.deleteUserById = deleteUserById;
module.exports.updateUserNamebyId = updateUserNamebyId;
module.exports.getUserDisplayNameById = getUserDisplayNameById;
module.exports.getUserShareCodeById = getUserShareCodeById;
module.exports.getUserDetailsById = getUserDetailsById;
module.exports.clearAllTables = clearAllTables;

module.exports.setArtistTrack = setArtistTrack;
module.exports.setTracks = setTracks;
module.exports.setAudioFeatures = setAudioFeatures;
module.exports.setUserTrack = setUserTrack;
module.exports.setUserArtist = setUserArtist;
module.exports.setArtist = setArtist;
module.exports.userInsights = userInsights;
module.exports.AdvancedQuery2 = AdvancedQuery2;
module.exports.AdvancedQuery3 = AdvancedQuery3;
module.exports.userInsightsCheck = userInsightsCheck;
module.exports.getCommonSongs = getCommonSongs;
module.exports.getCommonArtists = getCommonArtists;
module.exports.getCompatibility = getCompatibility;
