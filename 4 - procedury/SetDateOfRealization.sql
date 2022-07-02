CREATE DEFINER=`root`@`localhost` PROCEDURE `SetDateOfRealization`(SELF_ID INT, ORDER_ID INT, SUBMIT_DATE datetime)
BEGIN
	UPDATE zamowienia
    SET zamowienia.data_realizacji = SUBMIT_DATE,
    zamowienia.status_zamowienia = "zrealizowane",
    zamowienia.id_pracownika = SELF_ID
    WHERE zamowienia.id_zamowienia = ORDER_ID;
    
END