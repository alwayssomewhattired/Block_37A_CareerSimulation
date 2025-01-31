-- AlterTable
ALTER TABLE "Item" ADD COLUMN     "itemUser" TEXT NOT NULL DEFAULT 'Unknown';

-- AddForeignKey
ALTER TABLE "Item" ADD CONSTRAINT "Item_itemUser_fkey" FOREIGN KEY ("itemUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
