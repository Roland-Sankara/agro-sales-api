const express = require('express');
const {getProducts, createProduct} = require('../controllers/productController')
const {verifyToken} = require('../utils/jwt')
const {validateData, productSchema} = require('../utils/validate');
const router = express.Router();

router.get('/', getProducts)
router.post('/', verifyToken, validateData(productSchema), createProduct)

module.exports = router;