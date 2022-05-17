const express = require('express');
const {createUser, getUser, editUser} = require('../controllers/userController');

const router = express.Router();

router.get('/users/:id', getUser);

router.post('/users', createUser);

router.put('/users/:id', editUser);

module.exports = router;