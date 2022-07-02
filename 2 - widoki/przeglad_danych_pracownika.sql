CREATE OR REPLACE VIEW przeglad_danych_pracownika AS
SELECT
    pracownik.imie,
    pracownik.nazwisko,
    pracownik.email,
    pracownik.nr_kontakowy,
    pracownik.stanowisko,
    pracownik.id_administratora,
    pracownik.id_pracownika,
    adres.miasto,
    adres.kod_pocztowy,
    adres.ulica,
    adres.numer_domu,
    adres.numer_lokalu
FROM
	pracownik
    LEFT JOIN adres ON pracownik.id_adresu = adres.id_adresu