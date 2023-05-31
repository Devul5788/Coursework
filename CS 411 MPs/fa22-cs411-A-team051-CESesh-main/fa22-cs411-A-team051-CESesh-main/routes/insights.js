// get express & make router
const express = require('express');
const utils = require('./../models/utils');
const db = require('./../models/db');

// const UserDataModel = require();
const router = express.Router();

// handle the traffic & auth
router.get('/', utils.ensureAuthenticated, async (req, res) => {
    
    var checkValid = await db.userInsightsCheck(req.session.passport.user.id);
    if(checkValid == 0) {
        res.redirect('/dashboard?msg=empty_fetch');
        return;
    }

    const token = await db.getUserAuthToken(req.session.passport.user.id);
    var userInsights = await db.userInsights(token, req.session.passport.user.id);
    var res2 = await db.AdvancedQuery2();
    var res3 = await db.AdvancedQuery3();

    var data = {
        userInsights: userInsights,
        aq2 : res2,
        aq3 : res3
    };

    res.render('insights/index', data);
});

// export the router
module.exports = router;
