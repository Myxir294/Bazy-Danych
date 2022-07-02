CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeDataAdmin`(Admin_ID INT, FIELD_TO_CHANGE VARCHAR (256), NEW_DATA VARCHAR (256))
BEGIN
	UPDATE administrator
    SET administrator.imie = NEW_DATA
    WHERE administrator.id_administratora = Admin_ID AND FIELD_TO_CHANGE LIKE "imie";
    
 	UPDATE administrator
    SET administrator.nazwisko = NEW_DATA
    WHERE administrator.id_administratora = Admin_ID AND FIELD_TO_CHANGE LIKE "nazwisko";
    
    UPDATE administrator
    SET administrator.nr_kontakowy = NEW_DATA
    WHERE administrator.id_administratora = Admin_ID AND FIELD_TO_CHANGE LIKE "nr_kontakowy";

    UPDATE administrator
    SET administrator.stanowisko = NEW_DATA
    WHERE administrator.id_administratora = Admin_ID AND FIELD_TO_CHANGE LIKE "stanowisko";
    
    UPDATE adres
    SET adres.miasto = NEW_DATA
    WHERE adres.id_adresu = (SELECT administrator.id_adresu FROM administrator WHERE administrator.id_administratora = Admin_ID) AND FIELD_TO_CHANGE LIKE "miasto";
    
    UPDATE adres
    SET adres.kod_pocztowy = NEW_DATA
    WHERE adres.id_adresu = (SELECT administrator.id_adresu FROM administrator WHERE administrator.id_administratora = Admin_ID) AND FIELD_TO_CHANGE LIKE "kod_pocztowy";
    
    UPDATE adres
    SET adres.ulica = NEW_DATA
    WHERE adres.id_adresu = (SELECT administrator.id_adresu FROM administrator WHERE administrator.id_administratora = Admin_ID) AND FIELD_TO_CHANGE LIKE "ulica";
    
    UPDATE adres
    SET adres.numer_domu = NEW_DATA
    WHERE adres.id_adresu = (SELECT administrator.id_adresu FROM administrator WHERE administrator.id_administratora = Admin_ID) AND FIELD_TO_CHANGE LIKE "numer_domu";
    
    UPDATE adres
    SET adres.numer_lokalu = NEW_DATA
    WHERE adres.id_adresu = (SELECT administrator.id_adresu FROM administrator WHERE administrator.id_administratora = Admin_ID) AND FIELD_TO_CHANGE LIKE "numer_lokalu";
END