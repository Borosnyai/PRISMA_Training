import { PrismaClient } from "../generated/prisma/index.js";

const prisma = new PrismaClient();

async function main() {


    // Deleting first
    await prisma.car.deleteMany();
    await prisma.motorcycle.deleteMany();
    await prisma.truck.deleteMany();

    console.log("All tables are cleared!");

    // Create CAR
    const car = await prisma.car.create({
        data: {
            brand: "Toyota",
            model: "Supersonic",
            year: 2030,
            price: 34567890,
            numberOfDoors: 7,
            trunkCapacity: 3000,  // liters
            fuelType: "diesel"
        }
    });

    console.log("Car created: ", car);

    const motorcycle = await prisma.motorcycle.create({
        data: {
            brand: "Honda",
            model: "Boozoka",
            year: 2034,
            engin_CC: 3500,
            hasABS: true,
            bikeType: "sport"   // "sport"
        }
    });
    console.log("Motorcycle created: ", motorcycle);

    // Creating TRUCK
    const truck = await prisma.truck.create({
        data: {
            brand: "Mercedes",
            model: "TurboXZ",
            year: 2045,
            payloadCapacity: 60000,
            numberOfAxles: 2,
            hasSleeper: true
        }
    });
    console.log("Truck created: ", truck);


}

main()
    .catch((e) => console.error(e))
    .finally(async () => {
        await prisma.$disconnect();
    });
