CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewWorkers`()
BEGIN
	SELECT * FROM przeglad_danych_pracownika;
END