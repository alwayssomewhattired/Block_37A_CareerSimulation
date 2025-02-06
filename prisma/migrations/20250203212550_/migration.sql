/*
  Warnings:

  - A unique constraint covering the columns `[userID,itemID]` on the table `Review` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Review_userID_itemID_key" ON "Review"("userID", "itemID");
