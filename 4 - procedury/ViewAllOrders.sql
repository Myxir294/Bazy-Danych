CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewALLOrders`()
BEGIN
	SELECT * FROM przeglad_zamowien_full;
END