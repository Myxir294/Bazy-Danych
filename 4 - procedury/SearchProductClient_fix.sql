CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchProductClient`(argument VARCHAR (255))
BEGIN
	SELECT * FROM przegladanie_produktow_klient
    WHERE Nazwa_gry LIKE concat("%", argument, "%")
    UNION
    SELECT * FROM przegladanie_produktow_klient
    WHERE Nazwa_kategorii LIKE concat("%", argument, "%");
END