CREATE DEFINER=`root`@`localhost` TRIGGER `klient_AFTER_DELETE` AFTER DELETE ON `klient` FOR EACH ROW BEGIN
	DELETE FROM adres 
	WHERE old.id_adresu = adres.id_adresu; 
END