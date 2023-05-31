// get express & make router
const express = require('express');
const router = express.Router();

// just for testing
const db = require('./../models/db');

// handle the traffic
router.get('/', (req, res) => {
    res.render('index', {user : req.user});
});

// export the router
module.exports = router;
