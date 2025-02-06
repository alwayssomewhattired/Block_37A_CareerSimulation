/*
  Warnings:

  - You are about to drop the column `itemUser` on the `Item` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Item" DROP CONSTRAINT "Item_itemUser_fkey";

-- AlterTable
ALTER TABLE "Item" DROP COLUMN "itemUser";
