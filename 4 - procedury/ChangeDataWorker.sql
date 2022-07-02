CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeDataWorker`(Worker_ID INT, FIELD_TO_CHANGE VARCHAR (256), NEW_DATA VARCHAR (256))
BEGIN
	UPDATE pracownik
    SET pracownik.imie = NEW_DATA
    WHERE pracownik.id_pracownika = Worker_ID AND FIELD_TO_CHANGE LIKE "imie";
    
 	UPDATE pracownik
    SET pracownik.nazwisko = NEW_DATA
    WHERE pracownik.id_pracownika = Worker_ID AND FIELD_TO_CHANGE LIKE "nazwisko";
    
    UPDATE pracownik
    SET pracownik.nr_kontakowy = NEW_DATA
    WHERE pracownik.id_pracownika = Worker_ID AND FIELD_TO_CHANGE LIKE "nr_kontakowy";

    UPDATE pracownik
    SET pracownik.stanowisko = NEW_DATA
    WHERE pracownik.id_pracownika = Worker_ID AND FIELD_TO_CHANGE LIKE "stanowisko";

    UPDATE pracownik
    SET pracownik.id_administratora = NEW_DATA
    WHERE pracownik.id_pracownika = Worker_ID AND FIELD_TO_CHANGE LIKE "id_administratora";
    
    UPDATE adres
    SET adres.miasto = NEW_DATA
    WHERE adres.id_adresu = (SELECT pracownik.id_adresu FROM pracownik WHERE pracownik.id_pracownika = Worker_ID) AND FIELD_TO_CHANGE LIKE "miasto";
    
    UPDATE adres
    SET adres.kod_pocztowy = NEW_DATA
    WHERE adres.id_adresu = (SELECT pracownik.id_adresu FROM pracownik WHERE pracownik.id_pracownika = Worker_ID) AND FIELD_TO_CHANGE LIKE "kod_pocztowy";
    
    UPDATE adres
    SET adres.ulica = NEW_DATA
    WHERE adres.id_adresu = (SELECT pracownik.id_adresu FROM pracownik WHERE pracownik.id_pracownika = Worker_ID) AND FIELD_TO_CHANGE LIKE "ulica";
    
    UPDATE adres
    SET adres.numer_domu = NEW_DATA
    WHERE adres.id_adresu = (SELECT pracownik.id_adresu FROM pracownik WHERE pracownik.id_pracownika = Worker_ID) AND FIELD_TO_CHANGE LIKE "numer_domu";
    
    UPDATE adres
    SET adres.numer_lokalu = NEW_DATA
    WHERE adres.id_adresu = (SELECT pracownik.id_adresu FROM pracownik WHERE pracownik.id_pracownika = Worker_ID) AND FIELD_TO_CHANGE LIKE "numer_lokalu";
END