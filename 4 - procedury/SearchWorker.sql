CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchWorker`(argnazwisko VARCHAR (255), arg_stanowisko VARCHAR (255), arg_id_pracownika int, arg_id_admina int)
BEGIN
	SELECT * FROM przeglad_danych_pracownika
    WHERE nazwisko LIKE concat("%", argnazwisko, "%")
    UNION
	SELECT * FROM przeglad_danych_pracownika
    WHERE stanowisko LIKE concat("%", arg_stanowisko, "%")
    UNION
	SELECT * FROM przeglad_danych_pracownika
    WHERE id_administratora LIKE concat("%", arg_id_admina, "%")
    UNION
	SELECT * FROM przeglad_danych_pracownika
    WHERE id_pracownika LIKE concat("%", arg_id_pracownika, "%");
END