const { prisma } = require("../common");

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

module.exports = {
  createUser,
  loginUser,
  getUser,
  getItems,
  getItem,
  getReview,
};
