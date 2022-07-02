CREATE DEFINER=`root`@`localhost` PROCEDURE `AddProduct`(argNazwa_gry VARCHAR (100), argrodzaj enum('cyfrowa','Pudelkowa'), argcena double, argid_kategorii int)
BEGIN
	INSERT INTO gra(Nazwa_gry, rodzaj, cena, ilosc_egzemplarzy, id_kategorii) VALUES (argNazwa_gry, argrodzaj, argcena, 0, argid_kategorii);
END