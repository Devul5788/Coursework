// get express & make router
const express = require('express');
const utils = require('./../models/utils');
const db = require('./../models/db');

// const UserDataModel = require();
const router = express.Router();

// handle the traffic & auth
router.get('/', utils.ensureAuthenticated, async (req, res) => {

    var data = {
        query : req.query.user,
        results : []
    };

    if(data.query) {
        var results = await db.getUsersBySearch(data.query);
        if(results.length) data['results'] = results;
    }

    res.render('search/index', data);
});

// export the router
module.exports = router;
