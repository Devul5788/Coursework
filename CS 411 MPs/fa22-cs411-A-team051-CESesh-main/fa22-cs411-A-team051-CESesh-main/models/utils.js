const passport = require('passport');

function ensureAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.redirect('/login');
}

function loginAuthenticated(req, res, next) {
    if (req.isAuthenticated() == 0) {
        return next();
    }
    res.redirect('/dashboard');
}

module.exports.ensureAuthenticated = ensureAuthenticated;
module.exports.loginAuthenticated = loginAuthenticated;
