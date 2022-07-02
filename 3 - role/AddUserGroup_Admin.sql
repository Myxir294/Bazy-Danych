CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUserGroup_Admin`()
BEGIN
	CREATE ROLE 'admin';
    GRANT ALL PRIVILEGES ON baza.* TO 'admin';
	SET GLOBAL activate_all_roles_on_login = ON;
END