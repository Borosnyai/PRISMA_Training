-- CreateTable
CREATE TABLE "Vehicle" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "brand" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "price" DECIMAL NOT NULL,
    "numberOfDoors" INTEGER NOT NULL,
    "trunkCapacity" INTEGER NOT NULL,
    "fuelType" TEXT NOT NULL,
    "enginCC" INTEGER,
    "hasABS" BOOLEAN NOT NULL,
    "bikeType" TEXT NOT NULL,
    "payloadCapacity" INTEGER NOT NULL,
    "numberOfAxles" INTEGER NOT NULL,
    "hasSleeper" BOOLEAN NOT NULL
);
