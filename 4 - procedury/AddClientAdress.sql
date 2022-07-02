CREATE DEFINER=`root`@`localhost` PROCEDURE `AddClientAdress`( 
CLIENT_ID int,
CITY VARCHAR(30),
POSTAL_CODE CHAR(6),
STREET VARCHAR(30),
HOUSE INT,
APARTMENT INT
)
BEGIN


    
INSERT INTO adres (miasto,kod_pocztowy,ulica,numer_domu,numer_lokalu) VALUES (CITY,POSTAL_CODE,STREET,HOUSE,APARTMENT);
SELECT @new_id_adresu := id_adresu FROM adres ORDER BY id_adresu DESC LIMIT 1;

UPDATE klient 
SET 
    id_adresu = @new_id_adresu
WHERE
    id_klienta = CLIENT_ID;
 
END