CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewAdmins`()
BEGIN
	SELECT * FROM przeglad_danych_admina;
END