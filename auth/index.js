const router = require("express").Router();
const jwt = require("jsonwebtoken");

const { createUser, loginUser, getUser } = require("../database/db");

const isLoggedIn = async (req, res, next) => {
  const authHeader = req.headers.authorization;
  const token = authHeader?.slice(7);
  if (!token) {
    return next();
  }
  try {
    const { id } = jwt.verify(token, process.env.JWT);
    const user = await getUser(id);
    req.user = user;
    next();
  } catch (error) {
    next(error);
  }
};

router.post("/register", async (req, res, next) => {
  try {
    const { username, password } = req.body;
    const user = await createUser(username, password);
    const token = jwt.sign({ id: user.id }, process.env.JWT);
    res.status(201).send({ token });
  } catch (error) {
    next(error);
  }
});

router.post("/login", async (req, res, next) => {
  try {
    const { username, password } = req.body;
    const user = await loginUser(username, password);

    if (!user) {
      return res.status(401).send("Invalid login credentials.");
    }

    const token = jwt.sign({ id: user.id }, process.env.JWT);

    res.send({ token });
  } catch (error) {
    next(error);
  }
});

router.get("/me", isLoggedIn, async (req, res, next) => {
  try {
    req.user == undefined
      ? req.status(401).send("No user logged in.")
      : res.status(200).send(req.user);
  } catch (error) {
    next(error);
  }
});

module.exports = router;
