CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUserGroup_Client`()
BEGIN
	CREATE ROLE 'klient';
    GRANT EXECUTE ON PROCEDURE AddClientAdress TO 'klient';
	GRANT EXECUTE ON PROCEDURE ChangeDataClient TO 'klient';
    GRANT EXECUTE ON PROCEDURE DeleteAccountClient TO 'klient';
    GRANT EXECUTE ON PROCEDURE DeleteOrderClient TO 'klient';
    GRANT EXECUTE ON PROCEDURE SearchProductCLient TO 'klient';
    GRANT EXECUTE ON PROCEDURE SubmitOrderClient TO 'klient';
    GRANT EXECUTE ON PROCEDURE SubmitPurchase TO 'klient';
    GRANT EXECUTE ON PROCEDURE ViewOrdersClient TO 'klient';
    GRANT EXECUTE ON PROCEDURE ViewProductClient TO 'klient';
	SET GLOBAL activate_all_roles_on_login = ON;
END