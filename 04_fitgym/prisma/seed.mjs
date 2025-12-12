import { PrismaClient } from "../generated/prisma/index.js";

const prisma = new PrismaClient();


async function main() {

    console.log("SEED START");


    // MITGLIED
    const mitglied1 = await prisma.mitglied.create({
        data: {
            first_name: "Alice",
            last_name: "Wonderland",
            email: "ac@hotmail.com",
            telefon: "666",
        },
    });

    const mitglied2 = await prisma.mitglied.create({
        data: {
            first_name: "Mikey",
            last_name: "Mousse",
            email: "mm@hotmail.com",
            telefon: "999",
        },
    });

    // TRAINER
    const trainer1 = await prisma.trainer.create({
        data: {
            first_name: "John",
            last_name: "Wick",
            email: "instinctkilling@you.com",
            telefon: "364758686969",
        },
    });

    // KURS
    const kurs = await prisma.kurs.create({
        data: {
            titel: "Yoga Basics",
            schwierigkeitgrad: 1,
            beschreibung: "Einführungskurs",
        },
    });

    // RAUM
    const raum = await prisma.raum.create({
        data: {
            bezeichnung: "Raum 1",
            kapazitaet: 90,
        },
    });

    // KURSEINHEIT  ✅ ELŐBB!
    const kurseinheit = await prisma.kurseinheit.create({
        data: {
            trainerId: trainer1.id,
            raumId: raum.id,
            kursId: kurs.id,
            maxTeilnehmer: 90,
        },
    });

    // WARTELISTE  ✅ MOST MÁR OK
    await prisma.warteliste.create({
        data: {
            mitgliedId: mitglied2.id,
            kurseinheitId: kurseinheit.id,
            position: 5,
        },
    });

    // BUCHUNG  ✅ EGY Mitglied
    await prisma.buchung.create({
        data: {
            mitgliedId: mitglied1.id,
            kurseinheitId: kurseinheit.id,
        },
    });

    // BEWERTUNG  ✅ CSAK KURS
    await prisma.bewertung.create({
        data: {
            mitgliedId: mitglied1.id,
            kursId: kurs.id,
            rating: 4,
        },
    });

}
main()
    .catch((e) => console.error(e))
    .finally(async () => {
        await prisma.$disconnect();
    });