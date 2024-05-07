use crunchy;

select personaje.id, count(usuario_personaje.id_personaje) from usuario_personaje 
right join personaje on personaje.id = usuario_personaje.id_personaje group by personaje.id;
/*------------------------------------Funciones----------------------------------------------------------*/

/*personajes de los cuales se hayan comprado 2 o más figuras (1) o que no tenga ninguna figara vendida (0) o que no existan -1 */
drop function personajesVendidos;
delimiter | 
create function personajesVendidos(ide_personaje int)
returns int

begin
declare numeroVentas int;
set numeroVentas = (select count(usuario_personaje.id_personaje) from usuario_personaje 
		right join personaje on personaje.id = usuario_personaje.id_personaje  where ide_personaje= id_personaje group by personaje.id);
        
if(select count(*) from personaje where personaje.id= ide_personaje)>0 then

	if (numeroVentas>=2) then 
		return 1 ;
	elseif (numeroVentas<2 and numeroVentas>0 ) then 
		return 0 ;
	end if;
end if;
return -1;
end ;
|
delimiter ;
select personajesVendidos(1);
/*usarios que tengan mas de 10 animes vistos si tiene 10 o mas 1 si teiene menos 0 */
drop function densidadCuerpo;
delimiter | 
create function densidadCuerpo(ide_personaje int)
returns int
begin

end ;
|
delimiter ;
/*funcion que me duveulve el numero de productos comprados por un  usuario*/
drop function densidadCuerpo;
delimiter | 
create function densidadCuerpo(ide_personaje int)
returns int

begin
end ;
|
delimiter ;
/*--------------------------------------Procedimientos-------------------------------------------------------*/

/*del la funcion numero 4 agregamos un campo a la tabla y añadimos la tabla del usuario */

/*recibiendo el id de un usuario que se  ha visto mas de 10 animes (1) me tiene que devolver el titulo de los animes que se ha vistoy*/

/*dada una id de personaje, si no se ha vendido ninguna vez lo vamos a eliminar y si tiene mas de 5 figuras vendidas le aumentaremos el numero de seguiodres en +1000*/

/*mangakas que han escrito mas de 3 mangas*/

/*usuarios quecomparten su sucrpcion con otro (funcion si/no (si = 1 , no = 0))*/







