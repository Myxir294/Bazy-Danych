CREATE DEFINER=`root`@`localhost` PROCEDURE `SubmitPurchase`(ORDER_ID INT)
BEGIN
    UPDATE zamowienia
    SET zamowienia.status_zamowienia = "oplacone"
    WHERE zamowienia.id_zamowienia = ORDER_ID;
END