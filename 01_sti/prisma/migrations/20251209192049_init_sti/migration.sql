/*
  Warnings:

  - You are about to drop the `Vehicle` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Vehicle";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "vehicles" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "brand" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "price" DECIMAL NOT NULL,
    "vehicleType" TEXT NOT NULL,
    "numberOfDoors" INTEGER,
    "trunkCapacity" INTEGER,
    "fuelType" TEXT,
    "engineCC" INTEGER,
    "hasABS" BOOLEAN,
    "bikeType" TEXT,
    "payloadCapacity" INTEGER,
    "numberOfAxles" INTEGER,
    "hasSleeper" BOOLEAN
);
