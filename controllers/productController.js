const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient();

async function getProducts(req, res){
    const products = await prisma.product.findMany({})
    res.status(200).json({message: "success", products})
}

module.exports = getProducts;