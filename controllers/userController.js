const { PrismaClient } = require("@prisma/client");
const { createToken } = require("../utils/jwt");
const prisma = new PrismaClient();

async function getUsers(req, res) {
  const users = await prisma.user.findMany();
  res.send(users);
}

async function createUser(req, res) {
  const user = await prisma.user.create({
    data: req.body,
  });
  res.status(201).json({ message: "sucess", user });
}

async function loginUser(req, res) {
  // user should provide a username and password
  let userDetails = req.body;

  // check if user exists and if their password matched the password set in the database

  try {
    const user = await prisma.user.findUnique({
      where: {
        username: userDetails.username,
      },
    });

    if (user && user.password === userDetails.password) {
      // create a token for them and send it as a response
      let token = createToken({
        id: user.id,
        username: user.username,
      });

      res.status(200).json({ message: "Success", token });
    } else
      res
        .status(404)
        .json({ error: "User Not Found or Incorrect Password Provided" });
  } catch (error) {
    res.json({ errorObject: error.message });
  }
}

module.exports = {
  getUsers,
  createUser,
  loginUser,
};
