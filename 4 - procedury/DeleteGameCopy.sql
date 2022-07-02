CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGameCopy`(COPY_ID INT)
BEGIN
	DELETE FROM egzemplarz WHERE id_egzemplarza = COPY_ID AND ISNULL(id_zamowienia);
    SELECT ROW_COUNT();
END