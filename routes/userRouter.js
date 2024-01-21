const express = require('express');
const {getUsers, createUser, loginUser} = require('../controllers/userController');
const { verifyToken } = require('../utils/jwt');
const router = express.Router();

router.get('/', verifyToken , getUsers)
router.post('/', createUser)
router.post('/login', loginUser)

module.exports = router;