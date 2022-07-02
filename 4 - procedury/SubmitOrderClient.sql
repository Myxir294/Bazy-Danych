CREATE DEFINER=`root`@`localhost` PROCEDURE `SubmitOrderClient`(CLIENT_ID INT, GAME_ID INT, PAYMENT_METHOD enum('przelew_bankowy','karta','blik'), SHIPPMENT_METHOD enum('adres_email','adres_fizyczny','punkt_odbioru'))
this_proc:BEGIN

	DECLARE STOCK INT;
    DECLARE ID INT;
    DECLARE ADDRESS_ID INT;
    DECLARE COPY_ID INT;
    
    SET STOCK = (SELECT ilosc_egzemplarzy FROM gra WHERE id_gry = GAME_ID);
         IF STOCK <= 0 THEN
         SELECT 'Produkt nie ma egzemplarzy';
          LEAVE this_proc;
     END IF;
    
    SET ID = (SELECT id_zamowienia FROM zamowienia ORDER BY id_zamowienia DESC LIMIT 1) + 1;
		IF isnull(ID) THEN
			SET ID = 1;
	END IF;
    SET COPY_ID = (SELECT id_egzemplarza FROM egzemplarz WHERE egzemplarz.id_gry = GAME_ID ORDER BY id_egzemplarza DESC LIMIT 1);
    SET ADDRESS_ID = (SELECT IF(SHIPPMENT_METHOD = "adres_email", NULL, (SELECT klient.id_adresu FROM klient WHERE klient.id_klienta = CLIENT_ID)));
    
    SET FOREIGN_KEY_CHECKS=0;
	INSERT INTO wysylka (id_wysylki, metoda_wysylki, id_adresu)
	VALUES (ID, SHIPPMENT_METHOD, ADDRESS_ID);
				
    INSERT INTO platnosc (id_platnosci, kwota,metoda)
	VALUES (ID, (SELECT gra.cena FROM gra WHERE gra.id_gry = GAME_ID),PAYMENT_METHOD);
    
    UPDATE gra
    SET 
    ilosc_egzemplarzy = STOCK - 1
    WHERE
    id_gry = GAME_ID;
   
    UPDATE egzemplarz
    SET 
    id_zamowienia = ID
    WHERE
    id_egzemplarza = COPY_ID;   
   
    INSERT INTO zamowienia(id_zamowienia, id_klienta, id_platnosci, status_zamowienia, id_wysylki, data_realizacji)
	VALUES(ID, CLIENT_ID, ID, 'nieoplacone', ID, NULL);
    SET FOREIGN_KEY_CHECKS=1;
END