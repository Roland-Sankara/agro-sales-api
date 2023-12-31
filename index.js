const express = require("express");
const userRouter = require("./routes/userRouter");
const categoriesRouter = require("./routes/categoriesRouter");
const productsRouter = require("./routes/productsRouter");
const morgan = require("morgan");
const server = express();

// middleware
server.use(morgan('dev'));
server.use(express.json())
server.use("/api/v1/users", userRouter);
server.use("/api/v1/products", productsRouter);
server.use("/api/v1/categories", categoriesRouter);

server.get("/api/v1/", (req, res) => {
  res.send("Hello World");
});

const PORT = process.env.PORT || 1339;
server.listen(PORT, () => {
  console.log(`Server is listening on Port:${PORT}`);
});
