const jwt = require("jsonwebtoken");

function createToken(data) {
  let token = jwt.sign(data, "secret-key");
  return token;
}

function verifyToken(req, res, next) {
  let authHeader = req.headers.authorization;
  // `Bearer token` e.g Bearer 290hbuyveyuvfiuefiy

  if (authHeader) {
    let token = authHeader.split(" ")[1];
    jwt.verify(token, "secret-key", (err, decoded) => {
      if (err) {
        return res.status(400).json({ error: "Invalid Token Provided", err});
      } else {
        // res.status(200).json({message: "Success", decoded})
        next();
      }
    });
  } else {
    return res.status(400).json({ error: "Auth header missing" });
  }
}

module.exports = {
  createToken,
  verifyToken,
};
