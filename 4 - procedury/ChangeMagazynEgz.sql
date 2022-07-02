CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeMagazynGames`(COPY_ID INT, MAGAZYN_ID INT)
BEGIN
	UPDATE egzemplarz
    SET egzemplarz.id_magazynu = MAGAZYN_ID
    WHERE egzemplarz.id_egzemplarza = COPY_ID;
END