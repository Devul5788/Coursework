const axios = require('axios');

// Returns 50 Top Songs as a JSON array with the same keys as the column names from Tracks GCP table
async function TopSongs (token) {
  try {
    var config = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token
      }
    };
    const resp = await axios.get("https://api.spotify.com/v1/me/top/tracks?limit=50", config);
    const user_resp = await axios.get("https://api.spotify.com/v1/me", config);
    var user_id = user_resp.data['id'];

    var top_songs = [];
    
    for (let i = 0; i < 50; i++) {
        
       
        var track_name = resp.data['items'][i]['name'];
        var track_id = resp.data['items'][i]['id'];
        var artist_name = resp.data['items'][i]['artists'][0]['name'];
        var artist_id = resp.data['items'][i]['artists'][0]['id'];
        var explct = (resp.data['items'][i]['explicit'] == true)? 1:0;
        var duration = resp.data['items'][i]['duration_ms'];
        var popularity = resp.data['items'][i]['popularity'];
        var img_url = resp.data['items'][i]['album']['images'][0]['url'];

        var song_info = {"user_id": user_id,"track_name":track_name, "track_id":track_id, "artist_name": artist_name, "artist_id":artist_id, "explct":explct, "duration":duration, "populaity":popularity, "img_url":img_url};
        top_songs.push(song_info);
    }
    return top_songs;

  } catch (err) {
    console.log(err);
  }
};

module.exports.TopSongs = TopSongs;