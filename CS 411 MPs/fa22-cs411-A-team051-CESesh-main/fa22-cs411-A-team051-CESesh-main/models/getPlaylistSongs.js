const axios = require('axios');

// Returns total/50 playlists of ids as an array
async function GetPlaylistSongs (token, playlist_ids, user_id) {

    var config = {
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        }
    };

        
    var all_songs = [];

    try {

        for (let i = 0; i < playlist_ids.length; i++) { 

            const resp = await axios.get("https://api.spotify.com/v1/playlists/" + playlist_ids[i] + '?fields=tracks.items(limit=50)', config);

            var num = (resp.data['tracks']['limit'] <= 20) ? resp.data['tracks']['limit'] : 20;

            // console.log(num);

            for (let j = 0; j < num; j++) {

                if (resp.data['tracks'] == undefined) continue;
                if (resp.data['tracks']['items'] == undefined) continue;
                if (resp.data['tracks']['items'][j] == undefined) continue;
                if (resp.data['tracks']['items'][j]['track']['name'] == undefined) continue;
                
                var track_name_temp = resp.data['tracks']['items'][j]['track']['name'];
                var track_name = track_name_temp.replace(/'/g, "");
                
                var track_id = resp.data['tracks']['items'][j]['track']['id'];

                var artist_name_temp = resp.data['tracks']['items'][j]['track']['artists'][0]['name'];
                var artist_name = artist_name_temp.replace(/'/g, "");

                var artist_id = resp.data['tracks']['items'][j]['track']['artists'][0]['id'];
                var explct = (resp.data['tracks']['items'][j]['track']['explicit'] == true)? 1:0;
                var duration = resp.data['tracks']['items'][j]['track']['duration_ms'];
                var popularity = resp.data['tracks']['items'][j]['track']['popularity'];
                var img_url = resp.data['tracks']['items'][j]['track']['album']['images'][0] ? resp.data['tracks']['items'][j]['track']['album']['images'][0]['url'] : "none";

                var song_info = {"user_id": user_id,"track_name":track_name, "track_id":track_id, "artist_name": artist_name, "artist_id":artist_id, "explct":explct, "duration":duration, "popularity":popularity, "img_url":img_url};
                // var song_info = {"track_name":track_name, "track_id":track_id, "explct":explct, "duration":duration, "populaity":popularity};

                all_songs.push(song_info);
            }

        }

        // console.log(all_songs);
        return all_songs;

    } catch (err) {
        console.log(err);
    }

    


};

module.exports.GetPlaylistSongs = GetPlaylistSongs;