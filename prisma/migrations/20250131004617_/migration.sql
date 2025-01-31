/*
  Warnings:

  - Added the required column `itemID` to the `Review` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Review" ADD COLUMN     "itemID" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_itemID_fkey" FOREIGN KEY ("itemID") REFERENCES "Item"("id") ON DELETE CASCADE ON UPDATE CASCADE;
