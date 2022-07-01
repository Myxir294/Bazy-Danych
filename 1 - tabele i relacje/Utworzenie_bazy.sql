CREATE DATABASE baza;
USE baza; 
CREATE TABLE `Zamowienia` (
  `id_zamowienia` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary key',
  `id_klienta` int NULL,
  `id_pracownika` int COMMENT 'not null, unique',
  `id_platnosci` int UNIQUE COMMENT 'not null, unique',
  `status_zamowienia` ENUM ('nieoplacone', 'oplacone', 'zrealizowane') DEFAULT 'nieoplacone' NOT NULL COMMENT '"nieoplacone"/"oplacone"/"zrealizowane"',
  `id_wysylki` int UNIQUE COMMENT 'not null, unique',
  `data_realizacji` datetime COMMENT 'null, moze jeszcze nie byc'
);

CREATE TABLE `Platnosc` (
  `id_platnosci` int PRIMARY KEY COMMENT 'Primary key',
  `kwota` double NOT NULL COMMENT 'not null, kwota > 0',
  `metoda` ENUM ('przelew_bankowy', 'karta', 'blik') NOT NULL COMMENT 'not null, "przelew bankowy" lub "blik" lub "karta"'
);

CREATE TABLE `Wysylka` (
  `id_wysylki` int PRIMARY KEY COMMENT 'Primary key',
  `metoda_wysylki` ENUM ('adres_email', 'adres_fizyczny', 'punkt_odbioru') NOT NULL COMMENT 'not null, "na adres email" v "na adres fizyczny" v "punkt odbioru"',
  `data_wysylki` datetime COMMENT 'null, Do momentu wysłania zamowienia adres null',
  `id_adresu` int 
);

CREATE TABLE `Kategoria` (
  `id_kategorii` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary key',
  `Nazwa_kategorii` varchar(30) UNIQUE NOT NULL COMMENT 'kategoria musi miec zadana nazwe'
);

CREATE TABLE `Egzemplarz` (
  `id_egzemplarza` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary key',
  `id_magazynu` int NOT NULL,
  `id_gry` int NOT NULL COMMENT 'Powiazanie z konkretna gra',
  `id_zamowienia` int COMMENT 'null'
);


CREATE TABLE `Gra` (
  `id_gry` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary key',
  `Nazwa_gry` varchar(100) NOT NULL COMMENT 'not null, Tytul gry',
  `ilosc_egzemplarzy` int DEFAULT 0 NOT NULL COMMENT 'not null, >= 0',
  `rodzaj` ENUM ('cyfrowa', 'Pudelkowa') NOT NULL COMMENT 'not null, "Cyfrowa", "Pudelkowa"',
  `id_kategorii` int COMMENT 'nullable',
  `cena` double NOT NULL COMMENT 'not null, cena > 0',
  `ocena` double COMMENT 'null, ocena >= 0',
  `liczba_ocen` int DEFAULT 0 NOT NULL COMMENT 'not null, >= 0'
);

CREATE TABLE `Klient` (
  `id_klienta` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary key',
  `imie` varchar(30) NOT NULL COMMENT 'not null, Pierwsze imie uzytkownika',
  `nazwisko` varchar(30) NOT NULL COMMENT 'not null, Jedno nazwisko uzytkownika',
  `email` varchar(30) UNIQUE NOT NULL COMMENT 'not null, email kontaktowy uzytkownika',
  `nr_kontakowy` varchar(15) COMMENT 'null, Numer telefonu klienta',
  `id_adresu` int 
);

CREATE TABLE `adres` (
  `id_adresu` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary key',
  `miasto` varchar(30) NOT NULL COMMENT 'not null',
  `kod_pocztowy` char(6) NOT NULL COMMENT 'not null',
  `ulica` varchar(30) COMMENT 'null',
  `numer_domu` int NOT NULL COMMENT 'not null',
  `numer_lokalu` int COMMENT 'null'
);

CREATE TABLE `Pracownik` (
  `id_pracownika` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary key',
  `imie` varchar(30) NOT NULL COMMENT 'not null, Pierwsze imie pracownika',
  `nazwisko` varchar(30) NOT NULL COMMENT 'not null, Jedno nazwisko pracownika',
  `nr_kontakowy` varchar(15) NOT NULL COMMENT 'Numer telefonu pracownika',
  `stanowisko` varchar(50) NOT NULL COMMENT 'Not null',
  `id_administratora` int NOT NULL COMMENT 'Id administratora, ktoremu podlega dany pracownik',
  `email` varchar(30) UNIQUE NOT NULL COMMENT 'not null, email kontaktowy',
  `id_adresu` int NOT NULL
);

CREATE TABLE `Administrator` (
  `id_administratora` int PRIMARY KEY  AUTO_INCREMENT COMMENT 'Primary key',
  `imie` varchar(30) NOT NULL COMMENT 'not null, Pierwsze imie administratora',
  `nazwisko` varchar(30) NOT NULL COMMENT 'not null, Jedno nazwisko administratora',
  `email` varchar(30) UNIQUE NOT NULL COMMENT 'not null, email kontaktowy administratora',
  `nr_kontakowy` varchar(15) NOT NULL COMMENT 'Numer telefonu administratora',
  `stanowisko` varchar(50) NOT NULL COMMENT 'Not null, dokładna nazwa stanowiska w firmie',
  `id_adresu` int NOT NULL COMMENT 'Not null, adres z którym powiazany jest administrator'
);

CREATE INDEX `Zamowienia_index_0` ON `Zamowienia` (`id_klienta`);

CREATE UNIQUE INDEX `Kategoria_index_1` ON `Kategoria` (`Nazwa_kategorii`);

CREATE INDEX `Egzemplarz_index_2` ON `Egzemplarz` (`id_zamowienia`);

CREATE INDEX `Egzemplarz_index_3` ON `Egzemplarz` (`id_magazynu`);

CREATE INDEX `Egzemplarz_index_4` ON `Egzemplarz` (`id_gry`);

CREATE INDEX `Gra_index_5` ON `Gra` (`Nazwa_gry`);

CREATE INDEX `Klient_index_6` ON `Klient` (`imie`, `nazwisko`);

CREATE UNIQUE INDEX `Klient_index_7` ON `Klient` (`email`);

CREATE INDEX `Pracownik_index_8` ON `Pracownik` (`imie`, `nazwisko`);

CREATE INDEX `Pracownik_index_9` ON `Pracownik` (`stanowisko`);

CREATE INDEX `Administrator_index_10` ON `Administrator` (`imie`, `nazwisko`);

CREATE INDEX `Administrator_index_11` ON `Administrator` (`stanowisko`);

ALTER TABLE `Zamowienia` ADD FOREIGN KEY (`id_klienta`) REFERENCES `Klient` (`id_klienta`);

ALTER TABLE `Klient` ADD FOREIGN KEY (`id_adresu`) REFERENCES `adres` (`id_adresu`);

ALTER TABLE `Wysylka` ADD FOREIGN KEY (`id_adresu`) REFERENCES `adres` (`id_adresu`);

ALTER TABLE `Pracownik` ADD FOREIGN KEY (`id_adresu`) REFERENCES `adres` (`id_adresu`);

ALTER TABLE `Administrator` ADD FOREIGN KEY (`id_adresu`) REFERENCES `adres` (`id_adresu`);

ALTER TABLE `Egzemplarz` ADD FOREIGN KEY (`id_zamowienia`) REFERENCES `Zamowienia` (`id_zamowienia`);

ALTER TABLE `Zamowienia` ADD FOREIGN KEY (`id_pracownika`) REFERENCES `Pracownik` (`id_pracownika`);

ALTER TABLE `Platnosc` ADD FOREIGN KEY (`id_platnosci`) REFERENCES `Zamowienia` (`id_platnosci`);

ALTER TABLE `Wysylka` ADD FOREIGN KEY (`id_wysylki`) REFERENCES `Zamowienia` (`id_wysylki`);

ALTER TABLE `Pracownik` ADD FOREIGN KEY (`id_administratora`) REFERENCES `Administrator` (`id_administratora`);

ALTER TABLE `Gra` ADD FOREIGN KEY (`id_kategorii`) REFERENCES `Kategoria` (`id_kategorii`);

ALTER TABLE `Egzemplarz` ADD FOREIGN KEY (`id_gry`) REFERENCES `Gra` (`id_gry`);


