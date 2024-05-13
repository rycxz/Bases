use crunchy;

/*------------------------------------Funciones----------------------------------------------------------*/
/*usuarios que comparten su suscripción con otro  le entra 2 id de usuario (devuelve 1 si los dos comparen el plan menusual,0 si no y -1 si no existe ))*/

 delimiter |
create function usuarioComparte(ide_usuario int,ide_usario_recibe int)
returns int
begin
/*comprobamos is existen los dos ususarios*/

declare id_plan_usuario1 int;
declare id_plan_usuario2 int ;

if((select id from usuario where id=ide_usuario)) >0 then  
set id_plan_usuario1 = (select id_plan_mensual from usuario_comparte_plan_mensual where id_usuario_paga= ide_usuario );
	 if((select id from usuario where id=ide_usario_recibe)) >0 then  
     set id_plan_usuario2 = (select id_plan_mensual from usuario_comparte_plan_mensual where id_usuario_ratea= ide_usario_recibe );
/*vemos si comparten los dos el plan menusal */
			if(id_plan_usuario1 = id_plan_usuario2)>0 then 
			return 1;
				else 
				return 0;
			end if;
 
		end if; 
 
end if;

 end ;
|
delimiter ;
select usuarioComparte(55,1);
drop function usuarioComparte;

/*personajes de los cuales se hayan comprado 2 o más figuras (1) o que no tenga ninguna figara vendida (0)*/
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
	elseif (numeroVentas<2 and numeroVentas>=0 ) then 
		return 0 ;
	end if;
end if;
return -1;
end ;
|
delimiter ;
select personajesVendidos(60);


/*consulta donde se  ve el resultado */
select personaje.id, count(usuario_personaje.id_personaje) from usuario_personaje 
right join personaje on personaje.id = usuario_personaje.id_personaje group by personaje.id;



/*Funcion que calcula el tiempo que lleva un usiario dada su ide con el servicio*/
drop function tiempoConaLaPlataforma;
delimiter | 
create function tiempoConaLaPlataforma(ide_usuario int)
returns int
begin
/*sacamos la variable que nos interesa */
declare fecha_inicio1 date;
declare fecha_final1 date;
 

set fecha_inicio1=(select fecha_inicio from plan_mensual 
join plan_menusal_usuario on plan_menusal_usuario.id_plan_mensual =plan_mensual.id
join usuario on usuario.id =  plan_menusal_usuario.id_usuario 
where usuario.id =ide_usuario);

set fecha_final1=(select fecha_final from plan_mensual 
join plan_menusal_usuario on plan_menusal_usuario.id_plan_mensual =plan_mensual.id
join usuario on usuario.id =  plan_menusal_usuario.id_usuario 
where usuario.id = ide_usuario);

return (select  datediff(fecha_inicio1,fecha_final1));


end ;
|
delimiter ;

select tiempoConaLaPlataforma(1);


/*--------------------------------------Procedimientos-------------------------------------------------------*/

/*creamos una columna en la tabla usuario donde le asignamos el tiempo que llevan en la plataforma   !!!! puede haber alguno negativo ya que esto no estuvo controlado al hacer la base*/


 delimiter |
create procedure actualizarTablaUsoUsuario(ide_usuario int)
begin
declare exit handler 
for sqlexception
begin
rollback;
end;
start transaction;
if( (select id from usuario where id=ide_usuario)) >0 then                             	
update usuario
set tiempo_de_uso = (select tiempoConaLaPlataforma(ide_usuario));
end if;
commit;
end ;
|
delimiter ;
call actualizarTablaUsoUsuario(1);
drop procedure actualizarTablaUsoUsuario;
select * from usuario ;
/*procedimientop que añade una columna a la tbala usuario en la que  pondra estado_plan_mneusal y si lo compare pondra 1 y si no pondra no 0*/
alter table usuario  add estado_plan_mensual tinyint  default 0 ;


 delimiter |
create procedure compartenPlanMenusal(ide_usuario int,ide_usario_recibe int)
begin
declare exit handler 
for sqlexception
begin
rollback;
end;
start transaction;
if( (select id from usuario where id=ide_usuario)) >0 then   
	if( (select id from usuario where id=ide_usario_recibe)) >0 then   
    if(usuarioComparte(ide_usuario,ide_usario_recibe) = 1 or usuarioComparte(ide_usuario,ide_usario_recibe) = 0 ) then
	update usuario 
    set estado_plan_mensual = (select 1 from usuario where id = ide_usuario );
    	update usuario 
    set estado_plan_mensual =(select 1 from usuario where id = ide_usario_recibe );
    end if;
       end if;
          end if;
commit;
end ;
|
delimiter ;
call compartenPlanMenusal(5,1);
drop procedure compartenPlanMenusal;

/*dada una id de personaje funcion(personajesVendidos), si no se ha vendido ninguna vez le vamos a subir los seguidores en 1000 y 
 si tiene mas de 2 figuras vendidas le aumentaremos el numero de seguiodres en +100*/
 delimiter |
create procedure actualizarSeguidoresPersonaje(ide_personaje int)
begin
 
declare  numeroSeguidoresPersonaje int;
set numeroSeguidoresPersonaje = (select numero_de_seguidores from personaje where id = ide_personaje);
if(select personajesVendidos(ide_personaje)) =1 then 
update personaje set numero_de_seguidores = numeroSeguidoresPersonaje+100 where id = ide_personaje;
elseif(select personajesVendidos(ide_personaje))=0 then 
update personaje set numero_de_seguidores = numeroSeguidoresPersonaje+1000 where id = ide_personaje;
end if;
 
end ;
|
delimiter ;

call actualizarSeguidoresPersonaje(60);
select * from personaje where id = 60;

drop procedure actualizarSeguidoresPersonaje;
/*procediemiento que lleva la cuenta de cuantos mangas a escrito cada magaka y lo añade a la tabla*/

 delimiter |
create procedure a(ide_personaje int)
begin
declare exit handler 
for sqlexception
begin
rollback;
end;
start transaction;
commit;
end ;
|
delimiter ;

/*procedmiento que actualiza el estado de animo de un usuario a triste */

 









