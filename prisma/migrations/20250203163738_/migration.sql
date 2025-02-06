/*
  Warnings:

  - Added the required column `itemID` to the `Comment` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Comment" ADD COLUMN     "itemID" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_itemID_fkey" FOREIGN KEY ("itemID") REFERENCES "Item"("id") ON DELETE CASCADE ON UPDATE CASCADE;
