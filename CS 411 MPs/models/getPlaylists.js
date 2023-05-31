const axios = require('axios');

// Returns total/50 playlists of ids as an array
async function GetPlaylistIds (token) {
  try {
    var config = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token
      }
    };
    const resp = await axios.get("https://api.spotify.com/v1/me/playlists?limit=50", config);

    var playlists = [];

    var num = (resp.data['total'] <= 50)? resp.data['total'] : 50;
    
    for (let i = 0; i < num; i++) {
        var playlist_id = resp.data['items'][i]['id'];
        playlists.push(playlist_id);
    }
    return playlists;

  } catch (err) {
    console.log(err);
  }
};

module.exports.GetPlaylistIds = GetPlaylistIds;