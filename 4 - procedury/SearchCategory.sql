CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCategory`(argument VARCHAR (255))
BEGIN
	SELECT * FROM kategoria
    WHERE Nazwa_kategorii LIKE concat("%", argument, "%");
END