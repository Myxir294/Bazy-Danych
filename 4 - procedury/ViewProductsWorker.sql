CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewProductsWorker`()
BEGIN
	SELECT * FROM przegladanie_produktow_pracownik;
END