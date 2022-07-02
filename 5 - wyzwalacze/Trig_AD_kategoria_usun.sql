CREATE DEFINER=`root`@`localhost` TRIGGER `kategoria_AFTER_DELETE` AFTER DELETE ON `kategoria` FOR EACH ROW BEGIN
	UPDATE gra
	SET id_kategorii = NULL
	WHERE id_kategorii  = old.id_kategorii;
END