CREATE DEFINER=`root`@`localhost` PROCEDURE `ChooseShippingMethodClient`(CLIENT_ID INT, ORDER_ID INT, SHIPPING_METHOD ENUM('adres_email','adres_fizyczny','punkt_odbioru'))
BEGIN
	UPDATE wysylka
    SET wysylka.metoda_wysylki = SHIPPING_METHOD
    WHERE wysylka.id_wysylki = (SELECT zamowienia.id_wysylki FROM zamowienia WHERE zamowienia.id_zamowienia = ORDER_ID);
    
    UPDATE wysylka
    SET wysylka.id_adresu = (SELECT IF(SHIPPING_METHOD = "adres_email", NULL, (SELECT klient.id_adresu FROM klient WHERE klient.id_klienta = CLIENT_ID)))
    WHERE wysylka.id_wysylki = (SELECT zamowienia.id_wysylki FROM zamowienia WHERE zamowienia.id_zamowienia = ORDER_ID);
END