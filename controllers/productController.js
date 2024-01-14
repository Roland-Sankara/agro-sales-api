const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient();

async function getProducts(req, res){
    const products = await prisma.product.findMany({
        include: {
            category: true
        }
    })
    res.send(products)
}

async function createProduct(req, res){
    try{
        const products = await prisma.product.create({
            data: req.body
        })
        res.status(201).json({message: "Success", products})
    }catch(error){
        res.status(400).json({error})
    }
}

module.exports = {
    getProducts,
    createProduct
}