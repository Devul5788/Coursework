const axios = require('axios');

// Returns array of songs that as an array of JSON objects
async function GetSongAnalysis (token, songs_array) {

    var config = {
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        }
    };

        
    var all_song_analysis = [];

    try {

        for (let i = 0; i < songs_array.length; i+=100) { 

            songs_as_string = '';
            let j = i
            var max = (i + 100 <= songs_array.length)? i+100 : songs_array.length;
            for (; j < max; j++) {

                if (j != songs_array.length - 1) {
                    songs_as_string = songs_as_string + songs_array[j]['track_id'] + ',';

                } else {
                    songs_as_string = songs_as_string + songs_array[j]['track_id'];
                }
            }

            const resp = await axios.get("https://api.spotify.com/v1/audio-features?ids=" + songs_as_string, config);

            var num = (j%100 == 0)? 100 : j;
            
            j = 0;
            for (; j < num; j++) {                

                if (resp.data['audio_features'] == undefined) continue;
                if (resp.data['audio_features'][j] == undefined) continue;
                if (resp.data['audio_features'][j]['id'] == undefined) continue;

                var track_id = resp.data['audio_features'][j]['id'];
                var acousticness = resp.data['audio_features'][j]['acousticness'];
                var danceability = resp.data['audio_features'][j]['danceability'];
                var duration_ms = resp.data['audio_features'][j]['duration_ms'];
                var energy = resp.data['audio_features'][j]['energy'];
                var instrumentalness = resp.data['audio_features'][j]['instrumentalness'];
                var track_key = resp.data['audio_features'][j]['key'];
                var liveness = resp.data['audio_features'][j]['liveness'];
                var loudness = resp.data['audio_features'][j]['loudness'];
                var speechiness = resp.data['audio_features'][j]['speechiness'];
                var tempo = resp.data['audio_features'][j]['tempo'];
                var valence = resp.data['audio_features'][j]['valence'];

                var song_analysis = {"track_id": track_id, "acousticness": acousticness, "danceability": danceability, "duration_ms": duration_ms, "energy": energy, "instrumentalness": instrumentalness, "track_key": track_key, "liveness": liveness, "loudness": loudness, "speechiness": speechiness, "tempo": tempo, "valence": valence};

                all_song_analysis.push(song_analysis);
            }
        }

        // console.log(all_songs);
        return all_song_analysis;

    } catch (err) {
        console.log(err);
    }

};

module.exports.GetSongAnalysis = GetSongAnalysis;