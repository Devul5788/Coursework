// get express & .env
require('dotenv').config();
const express = require('express');
const app = express();

// passport.js & session & db
const session = require('express-session');
const passport = require('passport');
const SpotifyStrategy = require('passport-spotify').Strategy;
const db = require('./models/db');

// get ejs layouts
const expressLayouts = require('express-ejs-layouts');

// get routers from controllers (routes)
const indexRouter = require('./routes/index');
const dashboardRouter = require('./routes/dashboard');
const loginRouter = require('./routes/login');
const insightsRouter = require('./routes/insights');
const compareRouter = require('./routes/compare');
const searchRouter = require('./routes/search');
const ajaxRouter = require('./routes/ajax');

// setup basics
app.set('view engine', 'ejs');
app.set('views', __dirname + '/views');
app.set('layout', 'layouts/layout');
app.use(expressLayouts);
app.use(express.static('public'));

// spotify auth
var authCallbackPath = '/login/auth/spotify/callback/';
passport.serializeUser(function (user, done) {
    done(null, user);
});
passport.deserializeUser(function (obj, done) {
    done(null, obj);
});
passport.use(
    new SpotifyStrategy(
        {
            clientID: process.env.CLIENT_ID,
            clientSecret: process.env.CLIENT_SECRET,
            callbackURL: 'http://localhost:' + `${process.env.PORT}` + authCallbackPath,
        },
        async function (accessToken, refreshToken, expires_in, profile, done) {
            await db.setUserAuthToken(profile.id, accessToken, "USER_CODE", refreshToken);
            var share_code = Date.now();
            await db.setUserDetails(profile.id, profile.displayName, profile.emails[0] ? profile.emails[0].value : 'none', profile.country, profile.photos[0] ? profile.photos[0].value : 'none', share_code);
            process.nextTick(function () {
                return done(null, profile);
            });
        }
    )
);
app.use(session({secret: 'shubham is the best', resave: true, saveUninitialized: true}));
app.use(passport.initialize());
app.use(passport.session());

// sanity check for launch
console.log("Starting SyncTunes...");

// send all traffic to index router in routes
app.use('/', indexRouter);
app.use('/login', loginRouter);
app.use('/dashboard', dashboardRouter);
app.use('/insights', insightsRouter);
app.use('/compare', compareRouter);
app.use('/search', searchRouter);
app.use('/ajax', ajaxRouter);
app.get('/logout', function(req, res, next) {
    req.logout(function(err) {
        if (err) { return next(err); }
        res.redirect('/');
    });
});

// listen at the port, default to 3000
app.listen(process.env.PORT || 3000);
