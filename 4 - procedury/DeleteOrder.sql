CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteOrder`(ORDER_ID INT)
BEGIN
	DELETE FROM zamowienia WHERE id_zamowienia = ORDER_ID;
END