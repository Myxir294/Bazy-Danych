CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCategory`(CATEGORY_ID INT)
BEGIN
	DELETE FROM kategoria WHERE id_kategorii = CATEGORY_ID;
END