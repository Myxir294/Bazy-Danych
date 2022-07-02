CREATE OR REPLACE VIEW przeglad_zamowien_full AS
SELECT
	zamowienia.id_zamowienia,
	zamowienia.id_klienta,
	zamowienia.status_zamowienia,
    zamowienia.data_realizacji,
    klient.imie,
    klient.nazwisko,
    klient.email,
    klient.nr_kontakowy,
    wysylka.data_wysylki,    
    wysylka.metoda_wysylki,   
    egzemplarz.id_egzemplarza,
    egzemplarz.id_magazynu,
    gra.Nazwa_gry,
    gra.ilosc_egzemplarzy,
    gra.rodzaj,
    gra.cena,
    adres.miasto,
    adres.kod_pocztowy,
    adres.ulica,
    adres.numer_domu,
    adres.numer_lokalu
FROM
	zamowienia
    LEFT JOIN klient ON zamowienia.id_klienta = klient.id_klienta
    LEFT JOIN wysylka ON zamowienia.id_wysylki = wysylka.id_wysylki
    LEFT JOIN egzemplarz ON egzemplarz.id_zamowienia = zamowienia.id_zamowienia
    LEFT JOIN gra ON egzemplarz.id_gry = gra.id_gry
    LEFT JOIN adres ON wysylka.id_adresu = adres.id_adresu