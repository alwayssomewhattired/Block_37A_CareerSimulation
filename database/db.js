const { prisma } = require("../common");
const jwt = require("jsonwebtoken");

const isLoggedIn = async (req, res, next) => {
  const authHeader = req.headers.authorization;
  const token = authHeader?.slice(7);
  if (!token) {
    return next();
  }
  try {
    const { id } = jwt.verify(token, process.env.JWT);
    // console.log(id);
    const user = await getUser(id);
    req.user = user;
    console.log(req.user.id);
    next();
  } catch (error) {
    next(error);
  }
};

const getUser = async (id) => {
  const response = await prisma.User.findFirstOrThrow({
    where: {
      id,
    },
  });
  console.log(response);
  return response;
};

const createUser = async (username, password) => {
  const response = await prisma.User.create({
    data: {
      username,
      password,
    },
  });
  console.log(response);
  return response;
};

const loginUser = async (username, password) => {
  const response = await prisma.User.findFirstOrThrow({
    where: {
      username,
      password,
    },
  });
  console.log(response);
  return response;
};

const getItems = async () => {
  const response = await prisma.Item.findMany({});
  console.log(response);
  return response;
};

const getItem = async (id) => {
  const response = await prisma.Item.findFirstOrThrow({
    where: {
      id,
    },
  });
  console.log(response);
  return response;
};

const getReview = async (itemID) => {
  const response = await prisma.Review.findMany({
    where: {
      itemID,
    },
  });
  console.log(response);
  return response;
};

const getSpecificReview = async (itemID, id) => {
  const response = await prisma.Review.findFirstOrThrow({
    where: {
      itemID,
      id,
    },
  });
  console.log(response);
  return response;
};

const createReview = async (itemID, reviewText, userID, rating) => {
  const response = await prisma.Review.create({
    data: {
      rating,
      reviewText,
      userID,
      itemID,
    },
  });
  console.log(response);
  return response;
};

const getReviews = async (userID) => {
  const response = await prisma.Review.findMany({
    where: {
      userID,
    },
  });
  console.log(response);
  return response;
};

const updateReview = async (userID, id) => {
  const response = await prisma.Review.update({
    where: {
      id,
      userID,
    },
    data: {
      reviewText,
    },
  });
  console.log(response);
  return response;
};

const createComment = async (itemID, reviewID, commentText, userID) => {
  const response = await prisma.Comment.create({
    data: {
      commentText,
      userID,
      itemID,
      reviewID,
    },
  });
  console.log(response);
  return response;
};

const getComments = async (userID) => {
  const response = await prisma.Comment.findMany({
    where: {
      userID,
    },
  });
  console.log(response);
  return response;
};

const updateComment = async (userID, id, commentText) => {
  const response = await prisma.Comment.update({
    where: {
      id,
      userID,
    },
    data: {
      commentText,
    },
  });
  console.log(response);
  return response;
};

const deleteComment = async (userID, id) => {
  const response = await prisma.Comment.delete({
    where: {
      id,
      userID,
    },
  });
  console.log(response);
  return response;
};

const deleteReview = async (userID, id) => {
  const response = await prisma.Review.delete({
    where: {
      id,
      userID,
    },
  });
  console.log(response);
  return response;
};

module.exports = {
  createUser,
  loginUser,
  getUser,
  getItems,
  getItem,
  getReview,
  getSpecificReview,
  createReview,
  isLoggedIn,
  getReviews,
  updateReview,
  createComment,
  getComments,
  updateComment,
  deleteComment,
  deleteReview,
};
