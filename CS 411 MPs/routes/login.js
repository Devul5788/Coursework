// get express & make router
const express = require('express');
const router = express.Router();
const utils = require('./../models/utils');

// passport
passport = require('passport');

// handle the traffic
router.get('/', utils.loginAuthenticated, (req, res) => {
    res.render('login/index');
});

router.get('/auth/spotify/', 
    passport.authenticate('spotify', {
      scope: ['user-read-email', 'user-read-private', 'playlist-read-private', 'user-follow-read', 'user-top-read', 'user-read-recently-played', 'user-library-read'],
      showDialog: true,
    })
);

router.get('/auth/spotify/callback/',
    passport.authenticate('spotify', {failureRedirect: '/login'}),
    function (req, res) {
        res.redirect('/dashboard');
    }
);

// export the router
module.exports = router;
