-- CreateTable
CREATE TABLE "Mitglied" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telefon" TEXT
);

-- CreateTable
CREATE TABLE "Trainer" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "telefon" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Kurs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "titel" TEXT NOT NULL,
    "schwierigkeitgrad" INTEGER NOT NULL,
    "beschreibung" TEXT
);

-- CreateTable
CREATE TABLE "Bewertung" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "mitglied_id" INTEGER NOT NULL,
    "trainer_id" INTEGER,
    "kurs_id" INTEGER,
    CONSTRAINT "Bewertung_mitglied_id_fkey" FOREIGN KEY ("mitglied_id") REFERENCES "Mitglied" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Bewertung_trainer_id_fkey" FOREIGN KEY ("trainer_id") REFERENCES "Trainer" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Bewertung_kurs_id_fkey" FOREIGN KEY ("kurs_id") REFERENCES "Kurs" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Warteliste" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "mitgliedId" INTEGER NOT NULL,
    "kurseinheit_id" INTEGER NOT NULL,
    "position" INTEGER NOT NULL,
    CONSTRAINT "Warteliste_mitgliedId_fkey" FOREIGN KEY ("mitgliedId") REFERENCES "Mitglied" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Warteliste_kurseinheit_id_fkey" FOREIGN KEY ("kurseinheit_id") REFERENCES "Kurseinheit" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Buchung" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "mitglied_id" INTEGER NOT NULL,
    "kurseinheit_id" INTEGER NOT NULL,
    CONSTRAINT "Buchung_mitglied_id_fkey" FOREIGN KEY ("mitglied_id") REFERENCES "Mitglied" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Buchung_kurseinheit_id_fkey" FOREIGN KEY ("kurseinheit_id") REFERENCES "Kurseinheit" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Raum" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "bezeichnung" TEXT NOT NULL,
    "kapazitaet" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Kurseinheit" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "trainer_id" INTEGER NOT NULL,
    "raum_id" INTEGER NOT NULL,
    "kurs_id" INTEGER NOT NULL,
    "maxTeilnehmer " INTEGER NOT NULL,
    CONSTRAINT "Kurseinheit_trainer_id_fkey" FOREIGN KEY ("trainer_id") REFERENCES "Trainer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Kurseinheit_raum_id_fkey" FOREIGN KEY ("raum_id") REFERENCES "Raum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Kurseinheit_kurs_id_fkey" FOREIGN KEY ("kurs_id") REFERENCES "Kurs" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Mitglied_email_key" ON "Mitglied"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Trainer_telefon_key" ON "Trainer"("telefon");

-- CreateIndex
CREATE UNIQUE INDEX "Trainer_email_key" ON "Trainer"("email");
