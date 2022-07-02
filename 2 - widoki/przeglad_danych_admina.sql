CREATE OR REPLACE VIEW przeglad_danych_admina AS
SELECT
    administrator.imie,
    administrator.nazwisko,
    administrator.email,
    administrator.nr_kontakowy,
    administrator.stanowisko,
    administrator.id_administratora,
    adres.miasto,
    adres.kod_pocztowy,
    adres.ulica,
    adres.numer_domu,
    adres.numer_lokalu
FROM
	administrator
    LEFT JOIN adres ON administrator.id_adresu = adres.id_adresu