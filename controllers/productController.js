const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient();

async function getProducts(req, res){
    const products = await prisma.product.findMany()
    res.send(products)
}

module.exports = getProducts;