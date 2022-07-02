CREATE OR REPLACE VIEW przegladanie_produktow_klient AS
SELECT
    gra.Nazwa_gry, gra.id_gry, gra.rodzaj, gra.cena,
    gra.ocena, gra.ilosc_egzemplarzy, kategoria.nazwa_kategorii
FROM
	gra LEFT JOIN kategoria ON gra.id_kategorii = kategoria.id_kategorii
