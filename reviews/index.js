const router = require("express").Router();

router.get("/:itemId/reviews/:reviewId", async (req, res, next) => {
  try {
  } catch (error) {
    next(error);
  }
});

module.exports = router;
