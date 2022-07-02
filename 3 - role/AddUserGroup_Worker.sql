CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUserGroup_Worker`()
BEGIN
	CREATE ROLE 'pracownik';
    GRANT EXECUTE ON PROCEDURE AddGameCopy TO 'pracownik';
    GRANT EXECUTE ON PROCEDURE AddProduct TO 'pracownik';
    GRANT EXECUTE ON PROCEDURE ChangeMagazynGames TO 'pracownik';
    GRANT EXECUTE ON PROCEDURE DeleteGameCopy TO 'pracownik';
    GRANT EXECUTE ON PROCEDURE SearchProductWorker TO 'pracownik';
    GRANT EXECUTE ON PROCEDURE SendDate TO 'pracownik';
    GRANT EXECUTE ON PROCEDURE SetDateOfRealization TO 'pracownik';
    GRANT EXECUTE ON PROCEDURE ViewALLOrders TO 'pracownik';
    GRANT EXECUTE ON PROCEDURE ViewProductsWorker TO 'pracownik';
	SET GLOBAL activate_all_roles_on_login = ON;
END