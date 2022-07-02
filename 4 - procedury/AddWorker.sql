CREATE DEFINER=`root`@`localhost` PROCEDURE `AddWorker`(ADMIN_ID INT, 
FIRST_NAME VARCHAR (30), 
LAST_NAME VARCHAR (30), 
PHONE_NUMBER VARCHAR (30), 
OFFICE VARCHAR(50), 
EMAIL VARCHAR(30), 
CITY VARCHAR(30),
POSTAL_CODE CHAR(6),
STREET VARCHAR(30),
HOUSE INT,
APARTMENT INT,
USER_PASSWORD VARCHAR(30)
)
BEGIN
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO adres (miasto,kod_pocztowy,ulica,numer_domu,numer_lokalu) VALUES (CITY,POSTAL_CODE,STREET,HOUSE,APARTMENT);
SELECT @new_id_adresu := id_adresu FROM adres ORDER BY id_adresu DESC LIMIT 1;
SET @mail := EMAIL;

INSERT INTO pracownik (imie,nazwisko,nr_kontakowy,stanowisko,id_administratora, email, id_adresu)
VALUES(FIRST_NAME,LAST_NAME,PHONE_NUMBER,OFFICE,ADMIN_ID,EMAIL,@new_id_adresu);

SET @mail := EMAIL;
SET @passwd := USER_PASSWORD;
SET @query1 = CONCAT('
        CREATE USER "',@mail,'"@"localhost" IDENTIFIED BY "',@passwd,'"'
        );
SET @query10 = CONCAT('
        GRANT ',"'pracownik'",' TO "',@mail,'"@"localhost";'
        );
PREPARE stmt FROM @query1; EXECUTE stmt; DEALLOCATE PREPARE stmt;
PREPARE stmt2 FROM @query10; EXECUTE stmt2; DEALLOCATE PREPARE stmt2;

SET FOREIGN_KEY_CHECKS=1;
END