CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteAccountClient`(CLIENT_ID int)
this_proc:BEGIN

	IF EXISTS 
		(SELECT zamowienia.status_zamowienia FROM zamowienia 
		WHERE zamowienia.id_klienta = CLIENT_ID AND zamowienia.status_zamowienia = 'oplacone')
	THEN
		SELECT 'Nie mozna usunac konta gdy zamowienie jest realizowane lub czeka na oplacenie';
		LEAVE this_proc;
	END IF;

	IF EXISTS 
		(SELECT zamowienia.status_zamowienia FROM zamowienia 
		WHERE zamowienia.id_klienta = CLIENT_ID AND zamowienia.status_zamowienia = 'nieoplacone')
	THEN
		SELECT 'Nie mozna usunac konta gdy zamowienie jest realizowane lub czeka na oplacenie';
		LEAVE this_proc;
	END IF;
    
 	UPDATE zamowienia
    SET zamowienia.id_klienta = NULL
    WHERE zamowienia.id_klienta = CLIENT_ID;   
    
	SET @mail := (SELECT email FROM klient WHERE id_klienta = CLIENT_ID);
    SET @query3 = CONCAT('
        DROP USER "',@mail,'"@"localhost" '
        );
	PREPARE stmt3 FROM @query3; EXECUTE stmt3; DEALLOCATE PREPARE stmt3;

    SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM klient
    WHERE id_klienta = CLIENT_ID;
    SET FOREIGN_KEY_CHECKS=1;
END