-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_commentID_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_reviewComment_fkey";

-- DropForeignKey
ALTER TABLE "Item" DROP CONSTRAINT "Item_itemUser_fkey";

-- DropForeignKey
ALTER TABLE "Review" DROP CONSTRAINT "Review_itemID_fkey";

-- DropForeignKey
ALTER TABLE "Review" DROP CONSTRAINT "Review_reviewID_fkey";

-- AddForeignKey
ALTER TABLE "Item" ADD CONSTRAINT "Item_itemUser_fkey" FOREIGN KEY ("itemUser") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_reviewID_fkey" FOREIGN KEY ("reviewID") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_itemID_fkey" FOREIGN KEY ("itemID") REFERENCES "Item"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_commentID_fkey" FOREIGN KEY ("commentID") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_reviewComment_fkey" FOREIGN KEY ("reviewComment") REFERENCES "Review"("id") ON DELETE CASCADE ON UPDATE CASCADE;
