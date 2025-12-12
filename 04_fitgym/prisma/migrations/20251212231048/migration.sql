/*
  Warnings:

  - You are about to drop the column `kurs_id` on the `Bewertung` table. All the data in the column will be lost.
  - You are about to drop the column `mitglied_id` on the `Bewertung` table. All the data in the column will be lost.
  - You are about to drop the column `trainer_id` on the `Bewertung` table. All the data in the column will be lost.
  - You are about to drop the column `kurseinheit_id` on the `Buchung` table. All the data in the column will be lost.
  - You are about to drop the column `mitglied_id` on the `Buchung` table. All the data in the column will be lost.
  - You are about to drop the column `kurs_id` on the `Kurseinheit` table. All the data in the column will be lost.
  - You are about to drop the column `maxTeilnehmer ` on the `Kurseinheit` table. All the data in the column will be lost.
  - You are about to drop the column `raum_id` on the `Kurseinheit` table. All the data in the column will be lost.
  - You are about to drop the column `trainer_id` on the `Kurseinheit` table. All the data in the column will be lost.
  - You are about to drop the column `kurseinheit_id` on the `Warteliste` table. All the data in the column will be lost.
  - Added the required column `mitgliedId` to the `Bewertung` table without a default value. This is not possible if the table is not empty.
  - Added the required column `kurseinheitId` to the `Buchung` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mitgliedId` to the `Buchung` table without a default value. This is not possible if the table is not empty.
  - Added the required column `kursId` to the `Kurseinheit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `maxTeilnehmer` to the `Kurseinheit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `raumId` to the `Kurseinheit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `trainerId` to the `Kurseinheit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `kurseinheitId` to the `Warteliste` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Bewertung" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "mitgliedId" INTEGER NOT NULL,
    "trainerId" INTEGER,
    "kursId" INTEGER,
    CONSTRAINT "Bewertung_mitgliedId_fkey" FOREIGN KEY ("mitgliedId") REFERENCES "Mitglied" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Bewertung_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "Trainer" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Bewertung_kursId_fkey" FOREIGN KEY ("kursId") REFERENCES "Kurs" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Bewertung" ("comment", "createdAt", "id", "rating") SELECT "comment", "createdAt", "id", "rating" FROM "Bewertung";
DROP TABLE "Bewertung";
ALTER TABLE "new_Bewertung" RENAME TO "Bewertung";
CREATE TABLE "new_Buchung" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "mitgliedId" INTEGER NOT NULL,
    "kurseinheitId" INTEGER NOT NULL,
    CONSTRAINT "Buchung_mitgliedId_fkey" FOREIGN KEY ("mitgliedId") REFERENCES "Mitglied" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Buchung_kurseinheitId_fkey" FOREIGN KEY ("kurseinheitId") REFERENCES "Kurseinheit" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Buchung" ("id") SELECT "id" FROM "Buchung";
DROP TABLE "Buchung";
ALTER TABLE "new_Buchung" RENAME TO "Buchung";
CREATE TABLE "new_Kurseinheit" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "trainerId" INTEGER NOT NULL,
    "raumId" INTEGER NOT NULL,
    "kursId" INTEGER NOT NULL,
    "maxTeilnehmer" INTEGER NOT NULL,
    CONSTRAINT "Kurseinheit_trainerId_fkey" FOREIGN KEY ("trainerId") REFERENCES "Trainer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Kurseinheit_raumId_fkey" FOREIGN KEY ("raumId") REFERENCES "Raum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Kurseinheit_kursId_fkey" FOREIGN KEY ("kursId") REFERENCES "Kurs" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Kurseinheit" ("id") SELECT "id" FROM "Kurseinheit";
DROP TABLE "Kurseinheit";
ALTER TABLE "new_Kurseinheit" RENAME TO "Kurseinheit";
CREATE TABLE "new_Warteliste" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "mitgliedId" INTEGER NOT NULL,
    "kurseinheitId" INTEGER NOT NULL,
    "position" INTEGER NOT NULL,
    CONSTRAINT "Warteliste_mitgliedId_fkey" FOREIGN KEY ("mitgliedId") REFERENCES "Mitglied" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Warteliste_kurseinheitId_fkey" FOREIGN KEY ("kurseinheitId") REFERENCES "Kurseinheit" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Warteliste" ("id", "mitgliedId", "position") SELECT "id", "mitgliedId", "position" FROM "Warteliste";
DROP TABLE "Warteliste";
ALTER TABLE "new_Warteliste" RENAME TO "Warteliste";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
