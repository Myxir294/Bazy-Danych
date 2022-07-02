CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCategory`(argument VARCHAR (255))
BEGIN
	INSERT INTO kategoria(Nazwa_kategorii) VALUES (argument);
END