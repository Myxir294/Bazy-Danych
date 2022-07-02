CREATE OR REPLACE VIEW zamowienie_produktow AS
SELECT
    gra.Nazwa_gry,
    gra.rodzaj,
    gra.cena,
    zamowienia.status_zamowienia,
    zamowienia.data_realizacji,
    zamowienia.id_klienta,
    zamowienia.id_zamowienia,
    platnosc.kwota,
    platnosc.metoda,
    wysylka.metoda_wysylki,
    wysylka.data_wysylki,
    adres.miasto,
    adres.kod_pocztowy,
    adres.ulica,
    adres.numer_domu,
    adres.numer_lokalu
FROM
	egzemplarz
    LEFT JOIN gra ON egzemplarz.id_gry = gra.id_gry
    LEFT JOIN zamowienia ON egzemplarz.id_zamowienia = zamowienia.id_zamowienia
    LEFT JOIN platnosc ON zamowienia.id_platnosci = platnosc.id_platnosci
    LEFT JOIN wysylka ON zamowienia.id_wysylki = wysylka.id_wysylki
    LEFT JOIN adres ON wysylka.id_adresu = adres.id_adresu