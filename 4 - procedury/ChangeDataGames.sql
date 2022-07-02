CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeDataGames`(GAME_ID INT, FIELD_TO_CHANGE VARCHAR (256), NEW_DATA VARCHAR (256))
BEGIN
	UPDATE gra
    SET gra.Nazwa_gry = NEW_DATA
    WHERE gra.id_gry = GAME_ID AND FIELD_TO_CHANGE LIKE "nazwa";
    
    UPDATE gra
    SET gra.rodzaj = NEW_DATA
    WHERE (gra.id_gry = GAME_ID AND FIELD_TO_CHANGE LIKE "rodzaj") AND (NEW_DATA='Pudelkowa' or NEW_DATA='cyfrowa');
    
    UPDATE gra
    SET gra.id_kategorii = NEW_DATA
    WHERE gra.id_gry = GAME_ID AND FIELD_TO_CHANGE LIKE "kategoria";
    
    UPDATE gra
    SET gra.cena = NEW_DATA
    WHERE gra.id_gry = GAME_ID AND FIELD_TO_CHANGE LIKE "cena";
    
    UPDATE gra
    SET gra.ocena = NEW_DATA
    WHERE gra.id_gry = GAME_ID AND FIELD_TO_CHANGE LIKE "ocena";
END