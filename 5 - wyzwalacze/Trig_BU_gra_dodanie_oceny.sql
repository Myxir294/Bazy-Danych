CREATE DEFINER=`root`@`localhost` TRIGGER `gra_BEFORE_UPDATE` BEFORE UPDATE ON `gra` FOR EACH ROW BEGIN
	DECLARE suma int;  
    IF NOT(new.ocena <=> NULL) then
		if( old.ocena is null && new.ocena >0) then
		set @liczba_ocen=1;
		set new.ocena = new.ocena;
		else
		set suma = @liczba_ocen*old.ocena;
		set @liczba_ocen=@liczba_ocen+1;
		set suma = suma + new.ocena;
		set new.ocena = suma/@liczba_ocen;
		end if;
	end if;
    # odpalajac pierwszy raz trigger nalezy wywolac dwie zakomentowane line
	# set @suma=0;
	# set @liczba_ocen=0;
	# w koncowym programie te zmienne powinny byc uruchamiane przy uruchamianiu bazy chyba
END