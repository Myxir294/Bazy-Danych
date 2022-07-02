CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteAccountAdmin`(Self_ID int, Admin_ID int)
BEGIN

    SET @mail := (SELECT email FROM administrator WHERE id_administratora = Admin_ID);
    SET @query2 = CONCAT('
        DROP USER "',@mail,'"@"localhost" '
        );
	PREPARE stmt2 FROM @query2; EXECUTE stmt2; DEALLOCATE PREPARE stmt2;

	UPDATE pracownik
    SET pracownik.id_administratora = Self_ID
    WHERE pracownik.id_administratora = Admin_ID;
    
	DELETE FROM administrator
    WHERE administrator.id_administratora = Admin_ID;
END