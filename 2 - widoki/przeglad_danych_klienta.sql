CREATE OR REPLACE VIEW przeglad_danych_klienta AS
SELECT
    klient.imie,
    klient.nazwisko,
    klient.email,
    klient.nr_kontakowy,
    adres.miasto,
    adres.kod_pocztowy,
    adres.ulica,
    adres.numer_domu,
    adres.numer_lokalu
FROM
	klient
    LEFT JOIN adres ON klient.id_adresu = adres.id_adresu