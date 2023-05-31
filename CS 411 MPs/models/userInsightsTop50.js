const getTopSongs = require("./getTopSongs");
const getSongAnalysis = require("./getSongAnalysis");

// Returns array of songs that as an array of JSON objects
async function Top50Analysis (token) {

    try {

        top50songs = getTopSongs.TopSongs(token);
        top50songs_analysis = getSongAnalysis.GetSongAnalysis(token, top50songs);

        var avg_acousticness = 0;
        var avg_danceability = 0;
        var avg_duration_ms = 0;
        var avg_energy = 0;
        var avg_instrumentalness = 0;
        var avg_track_key = 0;
        var avg_liveness = 0;
        var avg_loudness = 0;
        var avg_speechiness = 0;
        var avg_tempo = 0;
        var avg_valence = 0;

        for (let i = 0; i < top50songs_analysis.length; i++) {
            avg_acousticness += top50songs_analysis[i]['acousticness'];
            avg_danceability += top50songs_analysis[i]['danceability'];
            avg_duration_ms += top50songs_analysis[i]['duration_ms'];
            avg_energy += top50songs_analysis[i]['energy'];
            avg_instrumentalness += top50songs_analysis[i]['instrumentalness'];
            avg_track_key += top50songs_analysis[i]['track_key'];
            avg_liveness += top50songs_analysis[i]['liveness'];
            avg_loudness += top50songs_analysis[i]['loudness'];
            avg_speechiness += top50songs_analysis[i]['speechiness'];
            avg_tempo += top50songs_analysis[i]['tempo'];
            avg_valence += top50songs_analysis[i]['valence'];
        }

        avg_acousticness /= top50songs_analysis.length;
        avg_danceability /= top50songs_analysis.length;
        avg_duration_ms /= top50songs_analysis.length;
        avg_energy /= top50songs_analysis.length;
        avg_instrumentalness /= top50songs_analysis.length;
        avg_track_key /= top50songs_analysis.length;
        avg_liveness /= top50songs_analysis.length;
        avg_loudness /= top50songs_analysis.length;
        avg_speechiness /= top50songs_analysis.length;
        avg_tempo /= top50songs_analysis.length;
        avg_valence /= top50songs_analysis.length;

        var top3songs = [];
        top3songs.push(top50songs[0], top50songs[1], top50songs[2]);
        audio_features_json = {"top3songs": top3songs, "avg_acousticness": avg_acousticness.toFixed(2), "avg_danceability": avg_danceability.toFixed(2), "avg_seconds": (avg_duration_ms/1000).toFixed(2), "avg_energy": avg_energy.toFixed(2), "avg_instrumentalness": avg_instrumentalness.toFixed(2), "avg_loudness": avg_loudness.toFixed(2), "avg_speechiness": avg_speechiness.toFixed(2), "avg_tempo": avg_tempo.toFixed(2), "avg_liveness": avg_liveness.toFixed(2), "avg_track_key": avg_track_key.toFixed(2), "avg_valence":avg_valence.toFixed(2)};
        return audio_features_json;

    } catch (err) {
        console.log(err);
    }

};

module.exports.Top50Analysis = Top50Analysis;