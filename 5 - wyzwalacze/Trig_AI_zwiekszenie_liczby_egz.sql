CREATE DEFINER=`root`@`localhost` TRIGGER `egzemplarz_AFTER_INSERT` AFTER INSERT ON `egzemplarz` FOR EACH ROW BEGIN
	#declare temp int;
    set @liczba_egz_gry=0;
    set @liczba_egz_gry = ( select count(*) from egzemplarz where id_gry = new.id_gry );
    #set temp = @liczba_egz_gry;
    update gra set gra.ilosc_egzemplarzy = @liczba_egz_gry where new.id_gry = id_gry;
    #if( egzemplarz.id_gry = new.id_gry) then
	#set @liczba_egz_gry = @liczba_egz_gry+1;
    #end if;
END