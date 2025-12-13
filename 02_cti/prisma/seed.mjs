import { PrismaClient } from "../generated/prisma/index.js";

const prisma = new PrismaClient();

async function main() {

    // Deleting all tables
    await prisma.truck.deleteMany();
    await prisma.motorcycle.deleteMany();
    await prisma.car.deleteMany();
    await prisma.vehicle.deleteMany();
    console.log("All tables cleared!");

    // Creating Car
    const carVehicle = await prisma.vehicle.create({
        data: {
            brand: "Toyota",
            model: "Schöne",
            year: 2022,
            price: 235677
        }
    });
    console.log("CarVehicle is created", carVehicle);

    const car = await prisma.car.create({
        data: {
            vehicleid: carVehicle.id,
            numberOfDoors: 6,
            trunkCapacity: 3000, // in liters
            fuelType: "diesel"
        }
    });
    console.log("Car is created", car);

    // Motorcycle
    // Creating Car
    const MotorcycleVehicle = await prisma.vehicle.create({
        data: {
            brand: "Kawasaki",
            model: "NINJA",
            year: 2024,
            price: 1000000
        }
    });
    console.log("MotorcycleVehicle is created", MotorcycleVehicle);

    const motorcycle = await prisma.motorcycle.create({
        data: {
            vehicleid: MotorcycleVehicle.id,
            engineCC: 1200, // engine displacement
            hasABS: true,
            bikeType: "sport"
        }
    });
    console.log("Motorcycle crreated: ", motorcycle);

    // Creating TRUCK
    const TruckVehicle = await prisma.vehicle.create({
        data: {
            brand: "Mercedes",
            model: "Neueste",
            year: 2025,
            price: 100100
        }
    });
    console.log("TruckVehicle is created", TruckVehicle);

    const truck = await prisma.truck.create({
        data: {
            vehicleid: TruckVehicle.id,
            payloadCapacity: 5000, // in kg
            numberOfAxles: 5,
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
