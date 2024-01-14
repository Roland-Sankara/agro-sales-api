const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient();

async function getCategories(req, res){
    try {
        const categories = await prisma.category.findMany();
        res.status(200).json({message: "Success", categories});
    } catch (error) {
        res.status(400).json({error})
    }
}

async function createCategory(req, res){
    try {
        const category = await prisma.category.create({
            data: req.body
        });
        res.status(200).json({message: "Success", category});
    } catch (error) {
        res.status(400).json({error})
    }
}

module.exports = {
    getCategories,
    createCategory
};