use crunchy;
 
/*1-los nombres de listas creadas, los usuarios con su nombre y su fecha de creación y los animes que contienen y las listas creadas a partir de 2019*/
 
select lista.nombre as 'nombre de la lista' ,usuario.nickname as 'nickname del usuario',
lista.fecha_de_creacion as 'fecha de creacion de la lista',anime.nombre as 'nombre del anime' 
from lista
join usuario on usuario.id=lista.id_usuario
join lista_anime on lista_anime.id_lista = lista.id
join anime on anime.id = lista_anime.id_anime
where lista.fecha_de_creacion > date_sub(curdate(),interval 4 year);

/*requisitos:
Al menos 5 consultas deberan trabajar  ́ sobre 3 tablas 1/5
Al menos 5 consultas utilizaran ́ funciones de fecha no repetidas 1/5
*/

/*2-usuarios que pagan un plan mensual y con quien lo comparten*/
select usuario.nickname as 'usuario que paga' ,nombreRata.nickname as 'usuario que ratea'
from usuario
join plan_menusal_usuario on plan_menusal_usuario.id_usuario = usuario.id
join plan_mensual on plan_mensual.id = plan_menusal_usuario.id_plan_mensual
join  metodo_de_pago on metodo_de_pago.id_plan_mensual = plan_mensual.id
join usuario_comparte_plan_mensual on usuario_comparte_plan_mensual.id_plan_mensual = plan_mensual.id
join usuario nombreRata on  nombreRata.id = usuario_comparte_plan_mensual.id_usuario_ratea;

/*requisitos:
Al menos 5 consultas deberan trabajar  ́ sobre 4 tablas 1/5
*/


/*3-personaje que no tengan adaptación animada y el número de veces que un producto suyo se ha vendido*/


/*
select personaje.id
from personaje
join mangas on mangas.id = personaje.id_manga
join genero on genero.id = mangas.id_genero
join anime on anime.id_genero = genero.id;
los que si teiene anime
*/
select personaje.nombre, count(producto.id_personaje) as 'producto de ese personaje'
from personaje
join producto on producto.id_personaje = personaje.id
where personaje.id not in (select personaje.id
from personaje
join mangas on mangas.id = personaje.id_manga
join genero on genero.id = mangas.id_genero
join anime on anime.id_genero = genero.id)
group by producto.id_personaje;

/*requisitos:
Al menos 5 consultas deberan trabajar  ́ sobre 3 tablas 2/5
Al menos 2 consultas contendran ́ subconsultas 1/2
Al menos 4 consultas utilizaran ́ GROUP BY / HAVING 1/4
*/
/*4-la ultima lista se ha creado, el usuario que la creo, el plan de ese usuario y su factura*/
select lista.fecha_de_creacion as 'fecha_lista',usuario.nickname as 'usuario que la creo' ,metodo_de_pago.factura
from usuario
join lista on lista.id_usuario = usuario.id
join plan_menusal_usuario on plan_menusal_usuario.id_usuario = usuario.id
join plan_mensual on plan_menusal_usuario.id_plan_mensual = plan_mensual.id
join metodo_de_pago on metodo_de_pago.id_plan_mensual = plan_mensual.id
having fecha_lista = (select max(lista.fecha_de_creacion)
from lista);



/*requisitos:
Al menos 5 consultas deberan trabajar  ́ sobre 4 tablas 2/5
Al menos 2 consultas contendran ́ subconsultas 2/2
Al menos 4 consultas utilizaran ́ GROUP BY / HAVING 2/4
*/
/*5- Compañías de envió las cuales estén en un atasco el producto que es y al usuario que va destinado*/
select compañia_de_envio.nombre as 'nombre_compañia', compañia_de_envio.estado_del_trafico ,personaje.nombre as 'nombre del producto' , usuario.nickname
from compañia_de_envio
join producto on producto.id_compañia_de_envio = compañia_de_envio.id
 join personaje on personaje.id = producto.id_personaje
 join mangas on mangas.id = personaje.id_manga
 join usuario_mangas on usuario_mangas.id_mangas = mangas.id
 join usuario on usuario.id = usuario_mangas.id_usuario
having estado_del_trafico = 'atasco';

/*requisitos:
Al menos 4 consultas utilizaran ́ GROUP BY / HAVING  2/4
Al menos 5 consultas deberan trabajar  ́ sobre 4 tablas 3/5
*/

/*6-el personajes del que mas pedidos se han echo  con sus animes (si lo tiene) */
select count(*) as 'numero_de_envios',personaje.nombre as 'nombre_personaje' , anime.nombre as 'nombre_anime'
from personaje
join producto on producto.id_personaje = personaje.id
join mangas on mangas.id = personaje.id_manga
join genero on genero.id = mangas.id_genero
join anime on anime.id_genero = genero.id
group by producto.id_personaje
having numero_de_envios= (select max(numero_de_envios)
from(
select count(*) as 'numero_de_envios'
from personaje
join producto on producto.id_personaje = personaje.id
group by producto.id_personaje)
as numero_envios);
/*requisitos:
Al menos 5 consultas deberan trabajar  ́ sobre 4 tablas		 4/5
Al menos 4 consultas utilizaran ́ GROUP BY / HAVING 			3/4
*/
/*7-todos los usuarios que tengan más de 2 año con la plataforma y las veces que han comprado en la tienda (tomaos el curdate () como la fecha máxima de mi base) */
select usuario.nickname ,plan_mensual.fecha_inicio as 'fecha', count(*) as 'veces_comprado_tienda'
from producto
join personaje on personaje.id = producto.id_personaje
join mangas on mangas.id = personaje.id_manga
join usuario_mangas on usuario_mangas.id_mangas = mangas.id
join usuario on usuario.id = usuario_mangas.id_usuario
join plan_menusal_usuario on plan_menusal_usuario.id_usuario = usuario.id
join plan_mensual on plan_mensual.id = plan_menusal_usuario.id_plan_mensual
where plan_mensual.fecha_inicio >date_sub((select max(fecha) from ( select plan_mensual.fecha_inicio as 'fecha' from plan_mensual )as fecha_maxima) ,interval 24 month)
group by producto.id_usuario;



/*requisitos:
Al menos 5 consultas deberan trabajar  ́ sobre 4 tablas		 5/5
Al menos 4 consultas utilizaran ́ GROUP BY / HAVING 			4/4
Al menos 2 consultas contendran ́ subconsultas 3/2
Al menos 5 consultas utilizaran ́ funciones de fecha no repetidas 2/5

*/
/*8-las listas creadas por cada usuario y las litas creadas solo en 2024 */
select usuario.nickname , lista.fecha_de_creacion 
from usuario
left join plan_menusal_usuario on plan_menusal_usuario.id_usuario = usuario.id
left join plan_mensual on  plan_mensual.id = plan_menusal_usuario.id_plan_mensual
left join lista on lista.id_usuario = usuario.id; 

/*requisitos:
Al menos 2 consultas utilizaran ́ OUTER JOIN				1/2
Al menos 5 consultas deberan trabajar  ́ sobre 3 tablas 		3/5
*/

/*9-los usuarios que no han creado una lista y los mangas que se ha leído*/
create view usuario_crea_listas as  
select usuario.id 
from usuario
join lista on lista.id_usuario = usuario.id;

select usuario.nickname , mangas.nombre
from usuario
left join lista on lista.id_usuario = usuario.id
left join usuario_mangas on usuario_mangas.id_usuario = usuario.id
left join mangas on mangas.id = usuario_mangas.id_mangas
where usuario.id not in (select id from usuario_crea_listas) ;


/*requisitos:
Al menos 5 consultas deberan trabajar  ́ sobre 3 tablas 		3/5
Al menos 2 consultas utilizaran ́ OUTER JOIN				2/2
Al menos 5 consultas utilizaran ́ vistas				1/5
*/

/*10-los usuarios que se han acabado un manga en 2022, los nombres de los mangas y su género */

select usuario.nickname,mangas.nombre
from usuario
join usuario_mangas on usuario_mangas.id_usuario = usuario.id
join mangas on mangas.id = usuario_mangas.id_mangas
join genero on genero.id = mangas.id_genero
where year(fecha_final_del_usuario) = year(date_sub(curdate(),interval 2 year));

/*requisitos:
Al menos 5 consultas utilizaran ́ funciones de fecha no repetidas 	3/5 
l menos 5 consultas deberan trabajar  ́ sobre 3 tablas 		4/5  
*/

/*11-los usuarios que tengan el plan mensual de superfan y las listas que han creado desde 2022*/
create view usuarios_super_fan as
select usuario.id as 'usuario_id'
from usuario 
where usuario.id_plan_mensual= 2;

drop view usuarios_super_fan;


select usuario.nickname , lista.nombre
from usuario 
join lista on lista.id_usuario = usuario.id
join usuarios_super_fan on usuarios_super_fan.usuario_id = usuario.id
join lista_anime on lista_anime.id_lista = lista.id
join anime on anime.id = lista_anime.id_anime
where lista.fecha_de_creacion < date_add(curdate(),interval 2 year);

/*requisitos:
Al menos 5 consultas utilizaran ́ funciones de fecha no repetidas 	4/5
Al menos 5 consultas deberan trabajar  ́ sobre 3 tablas 		5/5
Al menos 5 consultas utilizaran ́ vistas				2/5
*/

/*12-usuarios que se han empezado un manga hace 36 meses y que tenga estado de ánimo triste*/
create view usuarios_tristones as 
select usuario.id as 'usuario_id'
from usuario 
where estado_animo = 'triste';
drop view usuarios_tristones;

select usuario.nickname
from usuario 
join usuario_mangas on usuario_mangas.id_usuario = usuario.id
join usuarios_tristones on usuarios_tristones.usuario_id = usuario.id
where month(fecha_final_del_usuario) = month(date_sub(curdate(),interval 36 month));


/*requisitos:
Al menos 5 consultas utilizaran ́ funciones de fecha no repetidas 	5/5 
Al menos 5 consultas utilizaran ́ vistas				3/5
*/



/*13-Usuarios con más de 30 episodios vistos y que se han visto el anime de ‘Death_Note' */
create view usuarios_episoidos_vistos
as 
select usuario.id as 'id_usuarioo', usuario.nickname as 'nombre_user'
from usuario
where usuario.episodios_vistos >30;
drop view usuarios_episoidos_vistos;

select nombre_user
from usuarios_episoidos_vistos
join usuario_anime on usuario_anime.id_usuario = usuarios_episoidos_vistos.id_usuarioo
join anime on anime.id = usuario_anime.id_anime
where anime.nombre = 'Death_Note';

/*requisitos:
 Al menos 5 consultas utilizaran ́ vistas	4/5
*/
/*14-Usuarios que tenga en plan mensual de fan de los cuales que se ha leído un manga con traducción y que tengan subtítulos*/
create view usuarios_fan
as 
select usuario.id as 'id_fan_user', usuario.nickname as 'nombre_user'
from usuario
where usuario.id_plan_mensual = 0;
drop view usuarios_fan;

select nombre_user as 'nombre de usuario'
from usuarios_fan
join usuario_mangas on usuarios_fan.id_fan_user = usuario_mangas.id_usuario
join mangas on mangas.id = usuario_mangas.id_mangas
join traduccion_manga on traduccion_manga.id_manga=  mangas.id
join traducion on traducion.id = traduccion_manga.id_traduccion
where traducion.subtitulos = 1;


/*requisitos:
 Al menos 5 consultas utilizaran ́ vistas				5/5
*/

/*15-personajes que midan más de un 1.90 y que tengan adaptación animada */
create view personajes_altos
as 
select nombre as 'nombre_personajes' , personaje.id as 'id_personaje',id_manga
from personaje
where estatura >= 190;
drop view personajes_altos;

select nombre_personajes
from personajes_altos
join mangas on mangas.id = personajes_altos.id_manga
join genero on mangas.id_genero = genero.id
join anime on anime.id_genero = genero.id

