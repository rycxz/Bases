use cute_examen;
/*1 Función que calcula y devuelve cuántos avatares viven en
una casa a partir de su id*/
delimiter |
create function  avataresVievenCasa(ide_casa int)
returns int
begin 
if(select count(*) from casa where id =ide_casa )>0 then
return (select count(*) from avatar_casa where id_casa =ide_casa);
end if;
end;
|
delimiter ;

select avataresVievenCasa(1);

/*2 Función que dado un tipo de habitación y una casa
devuelve cuántas habitaciones de ese tipo hay en esa casa */

delimiter |
create function  tipoHabitaciones(ide_casa int,tipo_habitacion varchar(20))
returns int
begin 
if(select count(*) from casa where id =ide_casa )>0 then
	return (select count(*) from habitacion where tipo = tipo_habitacion and id_casa = ide_casa );
   
end if;
end;
|
delimiter ;
select tipoHabitaciones(8,'garaje');

delimiter |
create procedure cantidadObjetosAvatarTipo(tipoObjeto varchar(30), numero_obj int)
begin
    if (select count(*)  from objeto where tipo = tipoObjeto) >0 then
        SELECT COUNT(avatar_objeto.id_objeto) AS contador_objetos, avatar_objeto.id_avatar 
        from objeto
        join avatar_objeto on avatar_objeto.id_objeto = objeto.id
        where objeto.tipo = tipoObjeto 
		group by avatar_objeto.id_avatar
        having contador_objetos > numero_obj;
    end if;
end |
delimiter ;
drop procedure cantidadObjetosAvatarTipo;
	call cantidadObjetosAvatarTipo('herramienta',3);
    

/*4 Añade el campo n_habitantes a la tabla casa que lleve la
cuenta de cuántos
Avatares viven en cada casa. Programa los triggers
necesarios para
mantener esta cuenta actualizada*/
alter table casa  add n_habitantes int default 0;
/*update insert y delete */
delimiter |
CREATE TRIGGER cuentaHabitantes
before  update 
ON avatar_casa FOR EACH ROW
begin
update  casa set n_habitantes = (select count(*) from avatar_casa where avatar_casa.id_casa = new.id_casa group by  avatar_casa.id_casa) 
	where casa.id = new.id_casa;
end;
|
delimiter ;
drop trigger cuentaHabitantes;
update avatar_casa set id_casa=1 where id_avatar=48;
select * from casa where id =1;

delimiter |
CREATE TRIGGER cuentaHabitantes
before  update 
ON avatar_casa FOR EACH ROW
begin
update  casa set n_habitantes = (select count(*) from avatar_casa where avatar_casa.id_casa = new.id_casa group by  avatar_casa.id_casa) 
	where casa.id = new.id_casa;
end;
|
delimiter ;
drop trigger cuentaHabitantes;
update avatar_casa set id_casa=1 where id_avatar=48;
select * from casa where id =1;

delimiter |
CREATE TRIGGER cuentaHabitantesInsert
after  insert 
ON avatar_casa FOR EACH ROW
begin
update  casa set n_habitantes = (select count(*) from avatar_casa where avatar_casa.id_casa = new.id_casa group by  avatar_casa.id_casa) 
	where casa.id = new.id_casa;
end;
|
delimiter ;
drop trigger cuentaHabitantesInsert;
insert into avatar_casa(id_avatar,id_casa,fecha_entrada) values (88,1,curdate());
select * from casa where id =1;

delimiter |
CREATE TRIGGER cuentaHabitantesDelete
after  delete 
ON avatar_casa FOR EACH ROW
begin
update  casa set n_habitantes = (select count(*) from avatar_casa where avatar_casa.id_casa = old.id_casa group by  avatar_casa.id_casa) 
	where casa.id = old.id_casa;
end;
|
delimiter ;
drop trigger cuentaHabitantesInsert;

/*5 Según la normativa del ayuntamiento, una casa solo puede
tener un garaje, programa los triggers necesarios para que
si una casa va a tener más de un garaje este se convierta en
otra habitación*/

/*insert*/
delimiter |
create trigger normativaAyuntamiento
before insert
on habitacion for each row
begin
if(select count(*) from habitacion where (habitacion.id_casa=new.id_casa) and (habitacion.tipo like 'garaje'))>0 then
set new.tipo = 'habitacion';
end if;
end
|
delimiter ;
drop trigger normativaAyuntamiento;
insert into habitacion (id_casa,tipo) values (1,'garaje');
select * from habitacion where id_casa =1;

/*update*/
delimiter |
create trigger normativaAyuntamientoUpdate
before update
on habitacion for each row
begin
if(select count(*) from habitacion where (habitacion.id_casa=new.id_casa) and (habitacion.tipo like 'garaje'))>0 then
set new.tipo = 'habitacion';
end if;
end
|
delimiter ;
drop trigger normativaAyuntamientoUpdate;

/*6 Procedimiento que asigna una prenda a un avatar.
Comprobará si es un sombrero, calzado, superior o inferior y
lo asignará de la manera correspondiente */
delimiter |
create  procedure asignarTipoPrendaAvatar(ide_ropa int, ide_avatar int)
begin
declare exit handler for sqlexception
begin
rollback ;
end ;
start transaction;

    if ((select count(*) from sombrero where sombrero.id_ropa = ide_ropa) > 0) then
        update avatar set id_sombrero = ide_ropa where avatar.id = ide_avatar;
    end if;

    if ((select count(*) from calzado where calzado.id_ropa = ide_ropa) > 0) then
        update avatar set id_calzado = ide_ropa where avatar.id = ide_avatar;
    end if;

    if ((select count(*) from superior where superior.id_ropa = ide_ropa) > 0) then
        update avatar set id_superior = ide_ropa where avatar.id = ide_avatar;
    end if;

    if ((select count(*) from inferior where inferior.id_ropa = ide_ropa) > 0) then
        update avatar set id_inferior = ide_ropa where avatar.id = ide_avatar;
    end if;

    commit;
end;
|
delimiter ;
drop procedure asignarTipoPrendaAvatar;
call asignarTipoPrendaAvatar(59,1);
select * from avatar where id =1;
