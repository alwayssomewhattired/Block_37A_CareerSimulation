/*
  Warnings:

  - You are about to drop the column `commentID` on the `Comment` table. All the data in the column will be lost.
  - You are about to drop the column `reviewComment` on the `Comment` table. All the data in the column will be lost.
  - Added the required column `reviewID` to the `Comment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userID` to the `Comment` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_commentID_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_reviewComment_fkey";

-- AlterTable
ALTER TABLE "Comment" DROP COLUMN "commentID",
DROP COLUMN "reviewComment",
ADD COLUMN     "reviewID" TEXT NOT NULL,
ADD COLUMN     "userID" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userID_fkey" FOREIGN KEY ("userID") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_reviewID_fkey" FOREIGN KEY ("reviewID") REFERENCES "Review"("id") ON DELETE CASCADE ON UPDATE CASCADE;
