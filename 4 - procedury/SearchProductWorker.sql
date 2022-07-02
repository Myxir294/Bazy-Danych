CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchProductWorker`(argument VARCHAR (255))
BEGIN
	SELECT * FROM przegladanie_produktow_pracownik
    WHERE Nazwa_gry LIKE concat("%", argument, "%")
    UNION
    SELECT * FROM przegladanie_produktow_pracownik
    WHERE Nazwa_kategorii LIKE concat("%", argument, "%")
    UNION
    SELECT * FROM przegladanie_produktow_pracownik
    WHERE id_egzemplarza LIKE concat("%", argument, "%");    
END