const morgan = require("morgan");
const express = require("express");
const app = express();
const jwt = require("jsonwebtoken");

app.use(morgan("dev"));
app.use(express.json());

app.use("/api/auth", require("./auth/index"));
app.use("/api/items", require("./items/index"));
app.use("/api/reviews", require("./reviews/index"));
app.use("/api/comments", require("./comments/index"));

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(err.status || 500).send(err.message || "Internal server error.");
});

app.use((req, res) => {
  res.status(404).send("Not Found");
});

module.exports = app;
