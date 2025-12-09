import {PrismaClient } from "../generated/prisma/index.js"

const prisma = new PrismaClient();

async function main() {
    console.log("Seeding started...");

    // Clearing Table
    await prisma.vehicle.deleteMany();
    console.log("All members cleared!")

    // CAR
    const car = await prisma.vehicle.create({
        data: {
            brand: "Toyota",
            model: "Camry",
            year: 2025,
            price: 500000,
            vehicleType: "CAR",
            numberOfDoors: 5,
            trunkCapacity: 150,
            fuelType: "gasoline"
        }
    });
    console.log("Car created!", car);

    // motorcycle

    const motorcycle = await prisma.vehicle.create({
        data: {
            brand: "Kawasaki",
            model: "NINJA",
            year: 2024,
            price: 250000,
            vehicleType: "MOTORCYCLE",
            engineCC: 1300,
            hasABS: true,
            bikeType: "sport"


        }
    });
    console.log("Motorcycle created", motorcycle);

    const truck = await prisma.vehicle.create({
        data: {
            brand: "MAN",
            model:  "LKW",
            year: 2022,
            price: 1200000,
            vehicleType: "TRUCK",
            payloadCapacity: 3400, // in Kg
            numberOfAxles: 6,
            hasSleeper: true

        }
    });
    console.log("Truck created", truck);

    
}
main()
    .catch((e)=> console.error(e)) 
    .finally(async() => {
        await prisma.$disconnect();
    });