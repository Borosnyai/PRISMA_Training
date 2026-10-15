# PRISMA Training

Übungen zur Datenmodellierung mit [Prisma ORM](https://www.prisma.io/) und SQLite. Jedes Unterverzeichnis ist ein eigenständiges Projekt mit Schema, Migrationen und Seed-Skript.

| Projekt | Thema |
|---|---|
| `01_sti` | Vererbung mit **Single Table Inheritance** (Fahrzeuge: Auto, Motorrad, LKW in einer Tabelle) |
| `02_cti` | Vererbung mit **Class Table Inheritance** (gemeinsame Basistabelle plus Tabellen je Fahrzeugtyp) |
| `03_vehichle_concrete_ti` | Vererbung mit **Concrete Table Inheritance** (eine eigene Tabelle je Fahrzeugtyp) |
| `04_fitgym` | Datenmodell eines Fitnessstudios: Mitglieder, Trainer, Kurse, Räume, Buchungen, Warteliste, Bewertungen |
| `05_schweinswarzen` | Datenmodell einer Schule: Personal, Lehrer, Schüler, Hausmeister, Unterricht |

## Verwendung

```bash
cd 01_sti            # oder ein anderes Projekt
npm install
echo 'DATABASE_URL="file:./dev.db"' > .env
npx prisma migrate dev
node prisma/seed.mjs
npx prisma studio    # Daten im Browser ansehen
```

## Technologien

Prisma 6, SQLite, Node.js, TypeScript
