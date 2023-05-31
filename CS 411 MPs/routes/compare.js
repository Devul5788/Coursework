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

    var data = {
        query : req.query.user,
        results : ''
    };

    data['displayData'] = 0;

    if(data.query) {
        var results = await db.getUserBySharecode(data.query);
        if(results.length) {
            data['results'] = results[0]['user_id'];
            checkValid = await db.userInsightsCheck(data['results']);
            if(checkValid == 0) {
                res.redirect('/dashboard?msg=empty_fetch');
                return;
            }
            if(data['results'] != '') {
                data['displayData'] = await getCompareData(req.session.passport.user.id, data['results']);
            }
        }
    }

    if(data['query'] == undefined || data['results'] != "") data['error'] = 'none';
    else data['error'] = 'block';

    // console.log(data);

    res.render('compare/index', data);
});

async function getCompareData(current_user_id, compare_user_id) {
    data = {
        'current_user' : current_user_id,
        'compare_user' : compare_user_id
    };
    
    var u1 = await db.getUserDetailsById(current_user_id);
    data['current_user_section1'] = u1;

    var u2 = await db.getUserDetailsById(compare_user_id);
    data['compare_user_section1']= u2;

    if(data['current_user_section1']['image_url'] == 'none') {
        data['current_user_section1']['image_url'] = 'https://1000logos.net/wp-content/uploads/2021/04/Spotify-logo-1536x864.png';
    }

    if(data['compare_user_section1']['image_url'] == 'none') {
        data['compare_user_section1']['image_url'] = 'https://1000logos.net/wp-content/uploads/2021/04/Spotify-logo-1536x864.png';
    }

    var current_user_insights = await db.userInsights(null, current_user_id);
    var compare_user_insights = await db.userInsights(null, compare_user_id);

    data['current_user_section2'] = current_user_insights;
    data['compare_user_section2'] = compare_user_insights;

    data['section3'] = await db.getCommonSongs(current_user_id, compare_user_id);
    data['section4'] = await db.getCommonArtists(current_user_id, compare_user_id);
    data['section5'] = await db.getCompatibility(current_user_id, compare_user_id);

    var userComp = {
        'u1' : 0,
        'u2' : 0,
        'avg' : 0,
    }

    var user1dev = data['section5'][1];
    for (const property in user1dev) {
        var dev = Math.abs(user1dev[property]);
        var commanData = Math.abs(data['section5'][0][property]);
        var comp = (commanData - dev) / commanData;
        comp = comp * 12.5;
        userComp['u1'] += comp; 
    }

    var user2dev = data['section5'][2];
    for (const property in user2dev) {
        var dev = Math.abs(user2dev[property]);
        var commanData = Math.abs(data['section5'][0][property]);
        var comp = (commanData - dev) / commanData;
        comp = comp * 12.5;
        userComp['u2'] += comp; 
    }

    userComp['u1'] = Math.abs(userComp['u1'].toFixed(2));
    userComp['u2'] = Math.abs(userComp['u2'].toFixed(2));

    userComp['u1'] = 100 - userComp['u1'];
    userComp['u2'] = 100 - userComp['u2'];
    
    userComp['avg'] = (userComp['u1'] + userComp['u2']) / 2;
    userComp['avg'] = userComp['avg'].toFixed(2);

    data['comp'] = userComp;
    
    for(var i = 0; i < 3; i++) {
        for (const property in data['section5'][i]) {
            data['section5'][i][property] = data['section5'][i][property].toFixed(2);
        }
    }

    return data;
}

// export the router
module.exports = router;
