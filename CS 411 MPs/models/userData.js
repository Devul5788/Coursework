const axios = require('axios');

// Returns name, id, and image as an array, indexed respectively
// Format of image - JSON object
// {
//   "url": "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228\n",
//   "height": 300,
//   "width": 300
// }

async function getUserData (token) {
  try {
    var config = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token
      }
    };
    const resp = await axios.get("https://api.spotify.com/v1/me", config);
    var name = resp.data['display_name'];
    var user_id = resp.data['id'];
    var profile_picture = resp.data['images'];
    const name_userid_image = [name, user_id, profile_picture];
    return name_userid_image;

  } catch (err) {
    console.log(err);
  }
};

module.exports.getUserData = getUserData;