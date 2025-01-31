/*
  Warnings:

  - You are about to drop the column `commentName` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `reviewName` on the `Review` table. All the data in the column will be lost.
  - Added the required column `commentID` to the `Comment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reviewComment` to the `Comment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `itemID` to the `Review` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reviewID` to the `Review` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_commentName_fkey";

-- DropForeignKey
ALTER TABLE "Review" DROP CONSTRAINT "Review_reviewName_fkey";

-- AlterTable
ALTER TABLE "Comment" DROP COLUMN "commentName",
ADD COLUMN     "commentID" TEXT NOT NULL,
ADD COLUMN     "reviewComment" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Review" DROP COLUMN "reviewName",
ADD COLUMN     "itemID" TEXT NOT NULL,
ADD COLUMN     "reviewID" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_reviewID_fkey" FOREIGN KEY ("reviewID") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_itemID_fkey" FOREIGN KEY ("itemID") REFERENCES "Item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_commentID_fkey" FOREIGN KEY ("commentID") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_reviewComment_fkey" FOREIGN KEY ("reviewComment") REFERENCES "Review"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
