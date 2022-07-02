CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewProductClient`()
BEGIN
	SELECT * FROM przegladanie_produktow_klient;
END