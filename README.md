# PRISMA Training

Exercises in data modelling with [Prisma ORM](https://www.prisma.io/) and SQLite. Each subdirectory is a standalone project with a schema, migrations and a seed script.

| Project | Topic |
|---|---|
| `01_sti` | Inheritance with **single table inheritance** (vehicles: car, motorcycle, truck in one table) |
| `02_cti` | Inheritance with **class table inheritance** (shared base table plus one table per vehicle type) |
| `03_vehicle_concrete_ti` | Inheritance with **concrete table inheritance** (a separate table per vehicle type) |
| `04_fitgym` | Data model of a gym: members, trainers, courses, rooms, bookings, waiting list, reviews |
| `05_schweinswarzen` | Data model of a school: staff, teachers, students, caretakers, teaching assignments |

## Usage

```bash
cd 01_sti            # or any other project
npm install
echo 'DATABASE_URL="file:./dev.db"' > .env
npx prisma migrate dev
node prisma/seed.mjs
npx prisma studio    # browse the data in the browser
```

## Technologies

Prisma 6, SQLite, Node.js, TypeScript
