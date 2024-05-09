use pokimon;
/*Función que dado el nombre de una especie devuelve su id*/

drop function muestroId;

delimiter % 
create function muestroId(pnombre varchar(50))
returns int

begin
 return (select id from especie where pnombre like nombre);
 
end;

%

delimiter ;
select muestroId('escuero');

use Stellar;

/*Función que devuelve la densidad de un cuerpo celeste calculándola con su masa y radio. Recibe como parámetro su nombre*/


drop function densidadCuerpo;
delimiter | 
create function densidadCuerpo(pnombre varchar(50))
returns float

begin
declare pdiametro float;
declare  pi float ;
set pi = 3.1416;
set pdiametro = 2*(select radio from  cuerpo_celeste where nombre = pnombre);

return pdiametro*pi;
end ;
|
delimiter ;
select densidadCuerpo('Oikecodi');

/*Función que dado el nombre de una especie devuelve su id*/
drop function  idNombre;
delimiter !!
create function idNombre( pnombre varchar(40))
returns int
begin 
return (select id from especie where nombre= pnombre);
end;
!!
delimiter ;

select idNombre('boqi');

/*Procedimiento que muestra todos los pokimons que pertenecen a una determinada especie*/
use pokimon;

drop procedure todoEspecie;
delimiter |
create procedure todoEspecie(p_especie varchar(50))
begin 
select * from pokimon 
join especie on especie.id = pokimon.id_especie
where especie.nombre = p_especie;

end;
|
delimiter ;

CALL todoEspecie('chorrimander');

/*Función que devuelve 1 si una especie dada es de tipo llama, si no devolverá 0. En caso de que la especie no exista devolverá -1*/

drop function llama;
delimiter |
create function llama(p_NombreEspecie varchar(50))
returns int
begin 
if(select count(*) from especie where nombre =p_NombreEspecie) >0 then 
	if(select tipo1 from especie where nombre= p_NombreEspecie) = 'llama' or (select tipo2 from especie where nombre= p_NombreEspecie) = 'llama' then 
    return 1;
    else
    return 0;
    end if;
	else 
	return -1;
    end if;
end;
|
delimiter ;
select llama('chorrimander');



 
 /*Procedimiento que utilizando la función anterior nos dice mediante texto si la especie de pokimon elegida es tipo llama, no lo es o si no existe*/
 drop procedure llama2 ;
 delimiter |
create procedure llama2(p_nombre int)
begin
if llama(p_nombre) =1 then
select 'es de tipo llama';
elseif llama(p_nombre) =0 then
select 'no es de tipo llama pero si existe';
else 
select 'no existe';
end if;

end;
  |
  delimiter ;
  call llama2('chorrimander');
 
 /*Procedimiento que  recibe el id de un socio y muestra los títulos de los libros que tiene en préstamo*/
 use bibliotecastellar;
 
 drop procedure librosSocio;
 delimiter | 
 create procedure librosSocio(ide int )
 begin
 select libro.titulo from libro 
 join socio_libro on socio_libro.id_libro = libro.id 
 where socio_libro.id_socio = ide;
 end;
 |
 delimiter ;
 call librosSocio(5);
 
 /*Función que dado el nombre de un socio devuelve cuántos libros tiene en préstamo*/
 
 drop function libroPrestamoSocio1;
 delimiter | 
 create function libroPrestamoSocio1(ide int)
 returns int
 begin
 declare numeroLibros int;
  set numeroLibros = ( select count(*) from libro 
 join socio_libro on socio_libro.id_libro = libro.id 
 where socio_libro.id_socio = ide);
 return numeroLibros;
 end;
 |
 delimiter ;
 
 select libroPrestamoSocio1(5);
 /*Procedimiento que devuelve la lista de títulos prestados a un socio solo si este tiene más de 10 préstamos*/
 drop procedure librrosPResitado10 ;
 delimiter |
 create procedure librrosPResitado10(ide int)
 begin
 if(select count(*) from socio_libro where id_socio = ide group by id_socio)>10 then 
	select titulo from libro 
    join socio_libro on socio_libro.id_libro = libro.id 
    where id_socio =ide;
    end if;
 end;
 |
 delimiter ;
 call librrosPResitado10(1);
 select count(*),id_socio from socio_libro group by id_socio;
 
 /*Procedimiento que devuelve la lista de títulos prestados a un socio solo si este tiene más de X préstamos*/
  drop procedure librrosPResitado11 ;
 delimiter |
 create procedure librrosPResitado11(ide int,nuemro_libros_prestados int)
 begin
 if(select count(*) from socio_libro where id_socio = ide group by id_socio)>nuemro_libros_prestados then 
	select titulo from libro 
    join socio_libro on socio_libro.id_libro = libro.id 
    where id_socio =ide;
    end if;
 end;
 |
 delimiter ;
 call librrosPResitado11(1,23);
 select count(*),id_socio from socio_libro group by id_socio;
 
 /*PROCEDIMIENTO*/
 /*Procedimiento que recibe los datos de un nuevo socio y lo inserta en la tabla correspondiente*/
   drop procedure insertaSocio ;
 delimiter |
 create procedure insertaSocio(pnombre varchar(50),pn_prestados int,pcalle varchar(50),pnumero int,pedad int,pd_cuerpo_celeste int,pid_socio_padrino int)
 begin
 insert into Socio(nombre,n_prestados,calle,numero,edad,id_cuerpo_celeste,id_socio_padrino) values(pnombre,pn_prestados,pcalle,pnumero,pedad,pd_cuerpo_celeste,pid_socio_padrino);
 end;
 |
 delimiter ;
 call insertaSocio('Ricardo',25,'nicanorvilla',19,20,2233,23);
 select count(*)from socio ;
 
/
/*Procedimiento para insertar  un nuevo préstamo a partir de los ids de socio y libro. Tras crear el préstamo actualizará el 
número de préstamos del socio utilizando la función anterior*/

/*Función que dado el id del motivador pokimon devuelve cuántos intercambios ha realizado*/

/*Función que dado el id del motivador pokimon devuelve cuántos pokimons tiene*/
/*Procedimiento que inserta un nuevo motivador*/
/*Función que devuelve el ataque total de un pokimon (su ataque base multiplicado por su nivel)*/
/*Función que dado el nombre de un motivador devuelve si tienes pokimons tipo garrampa*/
/*Función que devuelve si un pokimon concreto pertenece a cierto tipo*/
/*Procedimiento que elimina un avatar y lo añade a la tabla fallecidos donde aparecerá el nombre de su casa y un campo con la causa de la muerte y la fecha de 
fallecimiento. La tabla  fallecidos tienes que crearla por tí mism@ antes de empezar a programar el procedimiento*/

/*------------------------------------------------------------------------------*/
/*Función que calcule el número de habitaciones de una casa*/
drop function numero_habitaciones;
delimiter ^^
create function numero_habitaciones (idcasa int)
returns int 
begin 
	if(select count(casa.id) from casa where casa.id = idcasa) >= 1 then
    return (select count(habitacion.id)
    from casa
    join habitacion on habitacion.id_casa = casa.id
    where casa.id = idcasa
    );
	else
    return -1;
    end if;
end;
^^
delimiter ;
/*Utilizando la función anterior crea un procedimiento que inserte una nueva habitación, la relacione con una casa y actualice el 
número de habitaciones de la casa (Transacción)*/
drop function numero_habitaciones;
delimiter ^^
create function numero_habitaciones (idcasa int)
returns int 
begin 
	if(select count(casa.id) from casa where casa.id = idcasa) >= 1 then
    return (select count(habitacion.id)
    from casa
    join habitacion on habitacion.id_casa = casa.id
    where casa.id = idcasa
    );
	else
    return -1;
    end if;
end;
^^
delimiter ;
use stellar;
/*Triggers para tener actualizada la densidad de un cuerpo celeste*/
    delimiter |
CREATE
    TRIGGER acutalizacioDensiad
    before update 
    on cuerpo_celeste for each row
	
    begin
    declare volumen float;
    set volumen = 4/3*(3.14*(select radio from cuerpo_celeste)^3);
    set new.densidad = masa*volumen;
    
    end;
|
delimiter ;


/*Haz las modificaciones pertinentes y crea los triggers necesarios para que cada cuerpo celeste lleve la cuenta de cuántas naves hay aparcadas en él.*/



alter table cuerpo_celeste add n_naves int default 0;
delimiter |
create 
trigger conteo_naves_aparcada
before update 
on cuerpo_celeste for each row
begin
declare n_naves_aparcadas int ;
if(n_naves <> new.n_naves ) then 
set n_naves_aparcadas = (select count(*) from nave group by id_cuerpo_celeste );
set new.n_naves = n_naves_aparcadas;
end if;
end;
|
delimiter ;

drop  trigger conteo_naves_aparcada;


select count(*) from nave group by id_cuerpo_celeste;


delimiter |
create 
trigger conteo_naves_aparcada_insert
after insert 
on nave for each row
begin
declare n_naves_aparcadas int ;

set n_naves_aparcadas = (select count(*) from nave group by id_cuerpo_celeste );
set new.n_naves = n_naves_aparcadas;

end;
|
delimiter ;
drop trigger conteo_naves_aparcada_insert;

update cuerpo_celeste set n_naves = 4 where id = 10;

use cute_examen;
delimiter |
create 
trigger insertar_fecha_entrada
after insert 
on avatar_casa for each row
begin
declare fecha_entrada_nueva date;
declare fecha_entrada date;
set fecha_entrada = (select fecha_entrada  from avatar_casa );
set fecha_entrada_nueva = (select curdate());
set fecha_entrada = fecha_entrada_nueva;
end;
|
delimiter ;

delimiter |
create 
trigger actualizar_fecha_entrada
after update 
on avatar_casa for each row
begin
set fecha_entrada = curdate();
end;
|
delimiter ;

drop  trigger actualizar_fecha_entrada;


alter table socio  add fecha_nacimiento1 date  default '2000-01-01' ;


use bibliotecastellar;
delimiter |
create 
trigger actualizar_fecha_nacimiento
before update 
on socio for each row
begin
declare fecha_nacimiento date;
declare edad_nueva int;
set fecha_nacimiento = ( select fecha_nacimiento1 from socio where id = new.id);
set edad_nueva =(select datediff(curdate(),fecha_nacimiento) from socio where id = new.id)/365;
update socio
set edad  = edad_nueva;
end;
|
delimiter ;
drop trigger actualizar_fecha_nacimiento;
use bibliotecastellar;
delimiter |
create 
trigger actualizar_fecha_nacimiento_insert
after insert 
on socio for each row
begin

declare fecha_nacimiento date;
declare edad_nueva int;
set fecha_nacimiento = ( select fecha_nacimiento1 from socio where id = new.id);
set edad_nueva =(select datediff(curdate(),fecha_nacimiento) from socio where id = new.id)/365;
update socio
set edad  = edad_nueva;
end;
|
delimiter ;
drop  trigger actualizar_fecha_nacimiento_insert;
select * from socio;

  drop procedure insertaSocio1 ;
 delimiter |
 create procedure insertaSocio1(pnombre varchar(50),pn_prestados int,pcalle varchar(50),pnumero int,pedad int,pd_cuerpo_celeste int,pid_socio_padrino int, pfecha_nacimiento date , pfecha_nacimiento1 date)
 begin
 insert into Socio(nombre,n_prestados,calle,numero,edad,id_cuerpo_celeste,id_socio_padrino,fecha_nacimiento,fecha_nacimiento1) values(pnombre,pn_prestados,pcalle,pnumero,pedad,pd_cuerpo_celeste,pid_socio_padrino,pfecha_nacimiento,pfecha_nacimiento1);
 end;
 |
 delimiter ;
 call insertaSocio1('Ricardo',25,'nicanorvilla',19,2,2233,23,'2000-01-01','2003-12-16');
 select count(*)from socio ;
 
use cute_examen;


/*Llevar la cuenta de las habitaciones de cada casa*/


delimiter |
create 
trigger numero_habitaciones_casa
after insert 
on habitacion for each row
begin
update casa set n_habitacion =(select count(*) from habitacion where new.id_casa = id_casa group by id_casa)
 where new.id_casa = id_casa;
end;
|
delimiter ;

delimiter |
create 
trigger numero_habitaciones_casa1
after delete 
on habitacion for each row
begin
update casa set n_habitacion =(select count(*) from habitacion  where old.id = id_casa  group by id_casa) 
where old.casa.id = id_casa;
end;
|
delimiter ;
drop trigger numero_habitaciones_casa1;
drop trigger numero_habitaciones_casa;

select count(*) from habitacion group by id_casa;

/*Trigger que cambia la expresión facial de los avatares que se casan a 'contento'
*/

delimiter |
create 
trigger cambiar_expresion_facial
after update 
on avatar_relacion_avatar for each row
begin
if ( (old.id_avatar_ejerce  = new.id_avatar_ejerce and tipo = 'matrimonio')  or 
(old.id_avatar_recibe  = new.id_avatar_recibe  and tipo = 'matrimonio') ) then 
update avatar set expresion_facial ='contento'; 
end if;
end;
|
delimiter ;

UPDATE avatar_relacion_avatar
SET nombre-de-la-columna = valor[, nombre-de-la-columna=valor]
[WHERE condición]

delimiter |
create 
trigger cambiar_expresion_facial
after insert 
on avatar_relacion_avatar for each row
begin
if ( ((select id from avatar where id= new.id_avatar_ejerce)  = avatar_relacion_avatar.id_avatar_ejerce and avatar_relacion_avatar.tipo = 'matrimonio')  or 
((select id from avatar where id=new.id_avatar_recibe) = avatar_relacion_avatar.id_avatar_recibe  and avatar_relacion_avatar.tipo = 'matrimonio') ) then 
update avatar set expresion_facial ='contento'; 
end if;
end;
|
delimiter ;
drop trigger cambiar_expresion_facial;

drop trigger casados;
delimiter $$
create 
	trigger casados
    after insert
    on avatar_relacion_avatar for each row
    begin
		if(new.tipo = 'matrimonio') then
			update avatar
			set expresion_facial = 'contento'
            where avatar.id = new.id_avatar_ejerce or avatar.id = new.id_avatar_recibe;
        end if;
    end;
    $$
delimiter ;

insert into avatar_relacion_avatar values (1, 2, curdate(), 'matrimonio');


/*Llevar la cuenta de cuántos pokimon hay en cada especie
*/

use pokimon;
alter table especie add n_especimenes int default 0;

delimiter |
create 
trigger numero_pokimos_especie
after insert 
on especie for each row
begin
update especie set n_especimenes =(
select count(*),id_especie from pokimon  where new.id=id group by id_especie)
 where new.id = id;
end;
|
delimiter ;
drop trigger numero_pokimos_especie;


select count(*),id_especie from pokimon  group by id_especie;
insert into pokimon (nombre ,
nivel ,
ataque , 
defensa , 
id_especie , 
id_motivador )values ('alberto',13,22,33,1,2);

delimiter |
create 
trigger numero_pokimos_especie_eliminar
after delete 
on especie for each row
begin
update especie set n_especimenes =(
select count(*),id_especie from pokimon  where old.id=id group by id_especie)
 where old.id = id;
end;
|
delimiter ;


/*Procedimiento que inserta un nuevo objeto y lo asigna a un avatar*/
use cute_examen;
drop procedure insertarObjeto12;
delimiter | 

create procedure insertarObjeto12(ide_avatar int,pnombre varchar(20),ptipo varchar(20),ptamaño varchar(20),  pdescripcion varchar(250))
begin
declare exit handler 
for sqlexception
begin
rollback;
end;
start transaction;
insert into objeto(nombre,tipo,tamaño,descripcion) values(pnombre,ptipo,ptamaño,pdescripcion);
insert into  avatar_objeto(id_avatar,id_objeto,fecha_adquisicion) values(ide_avatar,last_insert_id(),curdate());
commit;
end ;
|
delimiter ;
/*Procedimiento llamado robo que recibe el id de dos avatares y asigna todos los objetos y casas del primer avatar al segundo*/ 
use cute_examen;
drop procedure robo;
delimiter | 

create procedure robo(ide_avatar_robado int,ide_avatar_roba int)
begin
declare exit handler 
for sqlexception
begin
rollback;
end;
start transaction;
		UPDATE avatar_casa SET id_avatar = id_avatar_ladron WHERE id_avatar = id_avatar_robado;
        UPDATE avatar_objeto SET id_avatar = id_avatar_ladron WHERE id_avatar = id_avatar_robado;
    commit;


end ;
|
delimiter ;

/*Función que devuelve el número de objetos que tiene un avatar, (recibe el nombre del avatar). Si el avatar no existe, devolverá -1*/
drop function numeroObjetos;
delimiter | 
create function numeroObjetos( nombreAvatar varchar(50))
returns int
begin
if(select count(*) from avatar  where nombre=nombreAvatar)>0 then
 return (select count(*) from avatar_objeto
 join avatar on avatar.id = avatar_objeto.id_avatar 
where nombre=nombreAvatar
 group by id_avatar);
else  
return -1;
end if;
end ;
|
delimiter ;
select numeroObjetos('DarkSlateBlue');


/*Crea un procedimiento llamado justicia_social mediante el que si un avatar dado (con nombre) tiene más de X objetos, se le quitan todas sus casas*/
 
drop procedure robo;
delimiter | 

create procedure justicia_social(nombreAvatar varchar(50),numeroObjetos int)
begin
declare exit handler 
for sqlexception
begin
rollback;
end;
start transaction;

if(select count(*) from avatar  where nombre=nombreAvatar)>0 then
		if(select count(*) from avatar_objeto
			join avatar on avatar.id = avatar_objeto.id_avatar 
			where avatar.nombre=nombreAvatar
			group by id_avatar )>=numeroObjetos	 then 
	delete from avatar_objeto where (select id from avatar where nombreAvatar=nombre)=id_avatar;	
    end if;
    end if;

commit;
end ;
|
delimiter ;

/*Crea una función que devuelva 1 si un avatar está casado y 0 si no lo está. La función recibirá el nombre del avatar.*/
delimiter |
create function casados(pnombre_avatar varchar(100))
returns int
begin
if (select count(avatar.id)
from avatar where avatar.nombre=pnombre_avatar)>0
then if ( select count(avatar.id)
from avatar join avatar_relacion_avatar on avatar.id=avatar_relacion_avatar.id_avatar_ejerce
where avatar_relacion_avatar.tipo='matrimonio' and avatar.nombre=pnombre_avatar)>0 
or ( select count(avatar.id)
from avatar join avatar_relacion_avatar on avatar.id=avatar_relacion_avatar.id_avatar_recibe
where avatar_relacion_avatar.tipo='matrimonio' and avatar.nombre=pnombre_avatar)>0 
then return 1;
else return 0;
end if;
else return -1;
end if;
end;
|
delimiter ;
select * from avatar;
select * from avatar_relacion_avatar;
select casados('DarkSlateBlue');
select casados('Ms. AliceBlue');

/*Crea un procedimiento que dado el nombre de dos avatares los case solo si ninguno de ellos está casado. Utiliza la función del ejercicio anterior*/

drop procedure if exists casar;

delimiter |

create procedure casar(pnombre_avatar1 varchar(100),pnombre_avatar2 varchar(100))
begin
declare pid_avatar1 int;
declare pid_avatar2 int;
set pid_avatar1=(select avatar.id  from avatar 
where avatar.nombre=pnombre_avatar1);
set pid_avatar2=(select avatar.id  from avatar 
where avatar.nombre=pnombre_avatar2);
if (select count(avatar.id)
from avatar where avatar.nombre=pnombre_avatar1) then 
if (select count(avatar.id)
from avatar where avatar.nombre=pnombre_avatar2)then 
if (select casados(pnombre_avatar1))=0 and (select casados(pnombre_avatar2))=0 then 
insert into avatar_relacion_avatar(id_avatar_ejerce,id_avatar_recibe,fecha,tipo)
values (pid_avatar1,pid_avatar2,curdate(),'matrimonio');
else (select 'alguno de los 2 ya esta casado');
end if;
else (select 'El avatar 2 no existe');
end if;
else (select 'El avatar 1 no existe');
end if;
end;
|
delimiter ;
select * from avatar;
call casar ('Desmodus','Sr. Trent');