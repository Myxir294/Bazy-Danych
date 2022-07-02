CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAdmin`(argnazwisko VARCHAR (255), arg_stanowisko VARCHAR (255), arg_id_admina int)
BEGIN
	SELECT * FROM przeglad_danych_admina
    WHERE nazwisko LIKE concat("%", argnazwisko, "%")
    UNION
	SELECT * FROM przeglad_danych_admina
    WHERE stanowisko LIKE concat("%", arg_stanowisko, "%")
    UNION
	SELECT * FROM przeglad_danych_admina
    WHERE id_administratora LIKE concat("%", arg_id_admina, "%");
END