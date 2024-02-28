use crunchy;
 
 /*los nombres de  listas creadas los usuarios con su nombre y su fecha de creaciion y los animes que conienen y  las listas creadas apartir de 2019*/
 
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

/*usuarios que pagan un plan menusal y con quien lo coparten*/
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


/*persones que no tengan adaptacion animada*/

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
/*la lista que hace mas tiempo se ha creado , el genero al que pertenece su manga  y el usuario que la creo*/

/*requisitos:

*/
/*los usuarios que que llevn almenos 1 año de antiguedad su genero mas gustado*/

/*requisitos:

*/

/*la compañia de envio que mas preductos ha ENVIADO y el usuario al que ha ido ese producto y de que anim pertenecia */
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


/*requisitos:

*/
