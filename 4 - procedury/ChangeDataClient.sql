CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeDataClient`(CLIENT_ID INT, FIELD_TO_CHANGE VARCHAR (256), NEW_DATA VARCHAR (256))
BEGIN
	UPDATE klient
    SET klient.imie = NEW_DATA
    WHERE klient.id_klienta = CLIENT_ID AND FIELD_TO_CHANGE LIKE "imie";
    
    UPDATE klient
    SET klient.nazwisko = NEW_DATA
    WHERE klient.id_klienta = CLIENT_ID AND FIELD_TO_CHANGE LIKE "nazwisko";
    
    UPDATE klient
    SET klient.email = NEW_DATA
    WHERE klient.id_klienta = CLIENT_ID AND FIELD_TO_CHANGE LIKE "email";
    
    UPDATE klient
    SET klient.nr_kontakowy = NEW_DATA
    WHERE klient.id_klienta = CLIENT_ID AND FIELD_TO_CHANGE LIKE "nr_kontakowy";
    
    UPDATE adres
    SET adres.miasto = NEW_DATA
    WHERE adres.id_adresu = (SELECT klient.id_adresu FROM klient WHERE klient.id_klienta = CLIENT_ID) AND FIELD_TO_CHANGE LIKE "miasto";
    
    UPDATE adres
    SET adres.kod_pocztowy = NEW_DATA
    WHERE adres.id_adresu = (SELECT klient.id_adresu FROM klient WHERE klient.id_klienta = CLIENT_ID) AND FIELD_TO_CHANGE LIKE "kod_pocztowy";
    
    UPDATE adres
    SET adres.ulica = NEW_DATA
    WHERE adres.id_adresu = (SELECT klient.id_adresu FROM klient WHERE klient.id_klienta = CLIENT_ID) AND FIELD_TO_CHANGE LIKE "ulica";
    
    UPDATE adres
    SET adres.numer_domu = NEW_DATA
    WHERE adres.id_adresu = (SELECT klient.id_adresu FROM klient WHERE klient.id_klienta = CLIENT_ID) AND FIELD_TO_CHANGE LIKE "numer_domu";
    
    UPDATE adres
    SET adres.numer_lokalu = NEW_DATA
    WHERE adres.id_adresu = (SELECT klient.id_adresu FROM klient WHERE klient.id_klienta = CLIENT_ID) AND FIELD_TO_CHANGE LIKE "numer_lokalu";
END