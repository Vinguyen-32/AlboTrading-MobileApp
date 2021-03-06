const express = require('express');
const { createUser, getUser, editUser, login, signup, uploadAvatar } = require('../controllers/userController');

const router = express.Router();

router.get('/users/:id', getUser);

router.post('/users', createUser);

router.put('/users/:id', editUser);

router.put('/users/:id/avatar', uploadAvatar);

router.post('/users/login', login);

router.post('/users/signup', signup);

module.exports = router;