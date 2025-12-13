import { PrismaClient } from "../generated/prisma/index.js";

const prisma = new PrismaClient();

async function main() {

    console.log("SEED beginnt...Juhuuuuu!");

    // DELETING
    await prisma.student.deleteMany();
    await prisma.teacher.deleteMany();
    await prisma.careTaker.deleteMany();
    await prisma.staff.deleteMany();

    console.log("Alle Tabellen sind geputzt geworden!");

    // Student1

    const student1 = await prisma.student.create({
        data: {
            first_name: "Harlad",
            last_name: "Töpfer",
            email: "ht@bulme.at",
            telefon: "4545454545454",
            grade: 1
        }
    });

    console.log("student1 created: ", student1);

    // Student2
    const student2 = await prisma.student.create({
        data: {
            first_name: "Ronald",
            last_name: "Wiesel",
            email: "rw@bulme.at",
            telefon: "6868686868668",
            grade: 2
        }
    });

    console.log("student2 created: ", student2);

    // Student2
    const student3 = await prisma.student.create({
        data: {
            first_name: "Hermine",
            last_name: "Bauer",
            email: "hb@bulme.at",
            telefon: "2929292929292929",
            grade: 3
        }
    });

    console.log("Student3 created: ", student3);

    // TEACHER
    const teacher1 = await prisma.staff.create({
        data: {
            first_name: "Professor",
            last_name: "Quirling",
            email: "pq@bulme.at",
            telefon: "494949494949449",
            teacher: {
                create: {
                    subject: "Automatisierungstechnik",
                    
                }
            }

        },
        include: {teacher: true}
    });
    console.log("Teacher1 created: ", teacher1);

    const teacher2 = await prisma.staff.create({
        data: {
            first_name: "Gilderoy",
            last_name: "Festnut",
            email:      "gf@bulme.at",
            telefon:   "394785756565654",
            teacher: {
                create: {
                    subject: "Datenbank",
                }
            }

        },
        include: {teacher: true}
    });
    console.log("Teacher2 created: ", teacher2);

    const teacher3 = await prisma.staff.create({
        data: {
            first_name: "Remus",
            last_name: "Wolf",
            email:      "rw@bulme.at",
            telefon:   "5757575767767676",
            teacher: {
                create: {
                    subject:   "POS",
                }
            }

        },
        include: {teacher: true}
    });
    console.log("Teacher3 created: ", teacher3);

    // Teaching
    await prisma.teaching.createMany({
        data: [
            { teacherId: teacher1.teacher.id, studentId: student1.id},
            {teacherId: teacher2.teacher.id, studentId: student2.id},
            {teacherId: teacher3.teacher.id, studentId: student3.id}   
        ]
    });

        // Aufgabe 2 - getStudent
        async function getStudent(teacherId) {
            return prisma.student.findMany({
                where: {
                    teachings: {
                        some: {
                            teacherId: teacherId
                        }
                    }
                }
            });
            
        }
        // GetStudent tesztelese

        const teacherId = teacher1.teacher.id;
        const students = await getStudent(teacherId);

        console.log("Students taught by teacher with ID " + teacherId + ":", students);

}
main()
    .catch((e) => console.error(e))
    .finally(() => prisma.$disconnect());