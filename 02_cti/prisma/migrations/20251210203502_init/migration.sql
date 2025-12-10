-- CreateTable
CREATE TABLE "Vehicle" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "brand" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "price" DECIMAL NOT NULL
);

-- CreateTable
CREATE TABLE "Car" (
    "vehicleid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "numberOfDoors" INTEGER NOT NULL,
    "trunkCapacity" INTEGER NOT NULL,
    "fuelType" TEXT NOT NULL,
    CONSTRAINT "Car_vehicleid_fkey" FOREIGN KEY ("vehicleid") REFERENCES "Vehicle" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Motorcycle" (
    "vehicleid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "engineCC" INTEGER NOT NULL,
    "hasABS" BOOLEAN NOT NULL,
    "bikeType" TEXT NOT NULL,
    CONSTRAINT "Motorcycle_vehicleid_fkey" FOREIGN KEY ("vehicleid") REFERENCES "Vehicle" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Truck" (
    "vehicleid" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "payloadCapacity" INTEGER NOT NULL,
    "numberOfAxles" INTEGER NOT NULL,
    "hasSleeper" BOOLEAN NOT NULL,
    CONSTRAINT "Truck_vehicleid_fkey" FOREIGN KEY ("vehicleid") REFERENCES "Vehicle" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Car_vehicleid_key" ON "Car"("vehicleid");

-- CreateIndex
CREATE UNIQUE INDEX "Motorcycle_vehicleid_key" ON "Motorcycle"("vehicleid");

-- CreateIndex
CREATE UNIQUE INDEX "Truck_vehicleid_key" ON "Truck"("vehicleid");
