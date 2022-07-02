CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewOrdersClient`(argument int)
BEGIN
	SELECT * FROM zamowienie_produktow
    WHERE id_klienta = argument;
END