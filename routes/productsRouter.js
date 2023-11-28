const express = require('express');
const {getProducts, createProduct} = require('../controllers/productController')
const {verifyToken} = require('../utils/jwt')
const router = express.Router();

router.get('/', getProducts)
router.post('/', verifyToken, createProduct)

module.exports = router;