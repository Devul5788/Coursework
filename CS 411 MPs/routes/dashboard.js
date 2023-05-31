// get express & make router
const express = require('express');
const utils = require('./../models/utils');
const db = require('./../models/db');

const router = express.Router();

// handle the traffic & auth
router.get('/', utils.ensureAuthenticated, async (req, res) => {
    
    /* 
        check for null when invalid. This probably won't happen! Don't forget to include models/db.js :D 
        req.session.passport.user.id gets you the user id from the 'req' object!
    */
    // const token = await db.getUserAuthToken(req.session.passport.user.id);
    // await db.clearAllTables();
    var userName = await db.getUserDisplayNameById(req.session.passport.user.id);
    userName = userName == -1 ? "Unknown" : userName['display_name']; 
    
    var shareCode = await db.getUserShareCodeById(req.session.passport.user.id);
    shareCode = shareCode == -1 ? "Unknown" : shareCode['share_code']; 
    
    var photoUrl = req.session.passport.user.photos[0] ? req.session.passport.user.photos[0].value : "https://1000logos.net/wp-content/uploads/2021/04/Spotify-logo-1536x864.png";
    var data = {
        userData: req.session.passport.user,
        userPhoto: photoUrl,
        userName: userName,
        shareCode: shareCode,
        msg: req.query.msg
    };

    res.render('dashboard/index', data); 
});

// export the router
module.exports = router;
