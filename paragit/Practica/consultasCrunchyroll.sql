use crunchy;
 
 /*1-los nombres de  listas creadas los usuarios con su nombre y su fecha de creaciion y los animes que conienen y  las listas creadas apartir de 2019*/
 
select lista.nombre as 'nombre de la lista' ,usuario.nickname as 'nickname del usuario',lista.fecha_de_creacion as 'fecha de creacion de la lista',anime.nombre as 'nombre del anime' 
from lista
join usuario on usuario.id=lista.id_usuario
join lista_anime on lista_anime.id_lista = lista.id
join anime on anime.id = lista_anime.id_anime
where lista.fecha_de_creacion > date_sub(curdate(),interval 4 year);
/*requisitos:
Al menos 5 consultas deberan trabajar  ́ sobre 3 tablas 1/5
Al menos 5 consultas utilizaran ́ funciones de fecha no repetidas 1/5
*/

/*2-usuarios que pagan un plan menusal y con quien lo coparten*/
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


/*3-personaje que no tengan adaptacion animada*/

/*
select personaje.id
from personaje
join mangas on mangas.id = personaje.id_manga
join genero on genero.id = mangas.id_genero
join anime on anime.id_genero = genero.id;
los que si teiene anime
*/
select personaje.id
from personaje
where personaje.id <> (select personaje.id
from personaje
join mangas on mangas.id = personaje.id_manga
join genero on genero.id = mangas.id_genero
join anime on anime.id_genero = genero.id);

/*requisitos:
Al menos 5 consultas deberan trabajar  ́ sobre 3 tablas 2/5
Al menos 2 consultas contendran ́ subconsultas 1/2
*/
/*4-la lista que hace mas tiempo se ha creado , el usuario que la creo , el pan de ese usuario y factura*/
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
Al menos 4 consultas utilizaran ́ GROUP BY / HAVING 1/4
*/
/*5- Compañias de envio las cuales esten un un atasco el poducto que es y al usuario que va destinado*/
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

/*la compañia de envio que mas preductos ha ENVIADO y el usuario al que ha ido ese producto y de que anim pertenecia */
/*requisitos:

*/
/*usuarios que no tenga un plan menusal de pago y cuantols episodios diaros mtienen disonbiles*/

/*requisitos:

*/

/*requisitos:

*/

/*requisitos:

*/


/*requisitos:

*/

/*requisitos:

*/

/*requisitos:

*/


/*requisitos:

*/


/*requisitos:

*/


/*requisitos:

*/


/*requisitos:

*/


/*requisitos:

*/


/*requisitos:

*/


/*requisitos:

*/
