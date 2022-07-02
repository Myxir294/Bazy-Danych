CREATE OR REPLACE VIEW przegladanie_produktow_pracownik AS
SELECT
	gra.id_gry,
    gra.Nazwa_gry,
    gra.ilosc_egzemplarzy,
    gra.cena,
    gra.rodzaj,
    kategoria.nazwa_kategorii,
    kategoria.id_kategorii,
    egzemplarz.id_egzemplarza,
    egzemplarz.id_magazynu
FROM
	gra 
    LEFT JOIN kategoria ON gra.id_kategorii = kategoria.id_kategorii
	LEFT JOIN egzemplarz ON gra.id_gry = egzemplarz.id_gry