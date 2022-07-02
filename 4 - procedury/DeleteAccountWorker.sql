CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteAccountWorker`(Worker_ID int)
BEGIN

    SET @mail := (SELECT email FROM pracownik WHERE id_pracownika = Worker_ID);
    SET @query3 = CONCAT('
        DROP USER "',@mail,'"@"localhost" '
        );
	PREPARE stmt3 FROM @query3; EXECUTE stmt3; DEALLOCATE PREPARE stmt3;

	UPDATE zamowienia
    SET zamowienia.id_pracownika = NULL
    WHERE zamowienia.id_pracownika = Worker_ID;
    
	DELETE FROM pracownik
    WHERE pracownik.id_pracownika = Worker_ID;
END