// get express & make router
const express = require('express');
const utils = require('./../models/utils');
const db = require('./../models/db');
const GetPlaylistIds = require('./../models/getPlaylists');
const GetPlaylistSongs = require('./../models/getPlaylistSongs');
const GetSongAnalysis = require('./../models/getSongAnalysis');

const router = express.Router();

// handle the traffic & auth
router.get('/', utils.ensureAuthenticated, async (req, res) => {
    var action = req.query.action;
    var payload = req.query.payload;
    var resStatus = {
        'status' : 'fail'
    };
    await doAction(action, payload, resStatus, req.session.passport.user);
    res.send(JSON.stringify(resStatus));
});

async function doAction(action, payload, dataSent, user) {
    if(action == "") return;
    
    if(action == "delete_user") {
        await db.deleteUserById(user.id);
        dataSent.status = 'pass';
    } else if (action == "update_user") {
        await db.updateUserNamebyId(user.id, payload);
        dataSent.status = 'pass';
    } else if (action == "fetch_user") {
        var done = await setAllTables(user.id);
        if(done == 1) dataSent.status = 'pass';
    }
}

async function setAllTables(user_id) {
    try {
        const token = await db.getUserAuthToken(user_id);

        const timestamp1 = Date.now();
        const playlist_ids = await GetPlaylistIds.GetPlaylistIds(token);
        const all_songs_from_playlists = await GetPlaylistSongs.GetPlaylistSongs(token, playlist_ids, user_id);
        const all_songs_from_playlists_analysis = await GetSongAnalysis.GetSongAnalysis(token, all_songs_from_playlists);
        console.log("1. Fetched songs and data");
        
        await db.setTracks(all_songs_from_playlists);
        console.log("2. Set Tracks");

        await db.setAudioFeatures(all_songs_from_playlists_analysis);
        console.log("3. Set Audio Features");

        await db.setArtist(token, all_songs_from_playlists);
        console.log("4. Set Artists");

        await db.setUserTrack(all_songs_from_playlists);
        console.log("5. Set UserTracks");

        await db.setArtistTrack(all_songs_from_playlists);
        console.log("6. Set ArtistTrack");

        await db.setUserArtist(all_songs_from_playlists);
        console.log("7. Set UserArtist");

        const timestamp2 = Date.now();

        console.log((Math.floor(timestamp2/1000) - Math.floor(timestamp1/1000)) + " secs to finish from scratch!");

        return 1;

    } catch (e) {
        console.log(e);
        return -1;
    }
}

// export the router
module.exports = router;
