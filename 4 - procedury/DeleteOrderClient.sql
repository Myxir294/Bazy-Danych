CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteOrderClient`(ORDER_ID INT)
this_proc:BEGIN

	DECLARE GAME_ID INT;
    DECLARE STATE ENUM('nieoplacone', 'oplacone', 'zrealizowane');
    
	SET STATE = (SELECT status_zamowienia FROM zamowienia WHERE id_zamowienia = ORDER_ID);
	IF STATE != 'nieoplacone' THEN
		SELECT 'Nie mozna cofnac oplaconego lub zrealizowanego zamowienia';
		LEAVE this_proc;
	END IF;
    
    SET GAME_ID = (SELECT id_gry FROM egzemplarz WHERE id_zamowienia = ORDER_ID);
    UPDATE egzemplarz
    SET 
    id_zamowienia = NULL 
    WHERE
    id_zamowienia = ORDER_ID;

	UPDATE gra
    SET 
    ilosc_egzemplarzy = ilosc_egzemplarzy + 1
    WHERE
    id_gry = GAME_ID;
    
	DELETE FROM platnosc
    WHERE platnosc.id_platnosci = ORDER_ID;
    
    DELETE FROM wysylka
    WHERE wysylka.id_wysylki = ORDER_ID;
    
	DELETE FROM zamowienia
    WHERE zamowienia.id_zamowienia = ORDER_ID;
END