CREATE DEFINER=`root`@`localhost` PROCEDURE `AddGameCopy`(GAME_ID INT, MAGAZYN_ID INT)
BEGIN
	INSERT INTO egzemplarz(id_gry, id_magazynu) VALUES (GAME_ID, MAGAZYN_ID);
END