CREATE DEFINER=`root`@`localhost` PROCEDURE `AddClient`( 
FIRST_NAME VARCHAR (30), 
LAST_NAME VARCHAR (30), 
PHONE_NUMBER VARCHAR (30),  
EMAIL VARCHAR(30),
USER_PASSWORD VARCHAR(30)
)
BEGIN
INSERT INTO klient (imie,nazwisko,nr_kontakowy, email)
VALUES(FIRST_NAME,LAST_NAME,PHONE_NUMBER,EMAIL);
SET @mail := EMAIL;
SET @passwd := USER_PASSWORD;
SET @query1 = CONCAT('
        CREATE USER "',@mail,'"@"localhost" IDENTIFIED BY "',@passwd,'"'
        );
SET @query10 = CONCAT('
        GRANT ',"'klient'",' TO "',@mail,'"@"localhost";'
        );
PREPARE stmt FROM @query1; EXECUTE stmt; DEALLOCATE PREPARE stmt;
PREPARE stmt2 FROM @query10; EXECUTE stmt2; DEALLOCATE PREPARE stmt2;
END