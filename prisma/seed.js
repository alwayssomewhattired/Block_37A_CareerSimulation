const { prisma } = require("../common");

async function seed() {
  const deleteEverything = await prisma.User.deleteMany({});

  const ned = await prisma.User.create({
    data: {
      username: "ned",
      password: "1234",
      items: {
        create: [
          {
            name: "burger",
            reviews: {
              create: [
                {
                  reviewText: "These fries are so good",
                },
              ],
            },
          },
        ],
      },
    },
  });
}

seed();

module.exports = seed;
