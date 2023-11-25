const {PrismaClient} = require('@prisma/client');
const prisma = new PrismaClient()

async function getUsers(req, res){
    const users = await prisma.user.findMany()
    res.send(users)
}

async function createUser(req, res){
    const user = await prisma.user.create({
        data: req.body
    })
    res.status(201).json({message:"sucess", user})
}

module.exports = {
    getUsers,
    createUser
}