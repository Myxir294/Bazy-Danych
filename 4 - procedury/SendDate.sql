CREATE DEFINER=`root`@`localhost` PROCEDURE `SendDate`(SHIPMENT_ID INT, DATE_SEND datetime)
BEGIN
	UPDATE wysylka
    SET wysylka.data_wysylki= DATE_SEND
    WHERE wysylka.id_wysylki = SHIPMENT_ID;
END