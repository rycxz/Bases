use crunchy;
 
 /*los nombres de  listas creadas los usuarios con su nombre y su fecha de creaciion y los animes que conienen */
 
select lista.nombre as 'nombre de la lista' ,usuario.nickname as 'nickname del usuario',lista.fecha_de_creacion as 'fecha de creacion de la lista',anime.nombre as 'nombre del anime' 
from lista
join usuario on usuario.id=lista.id_usuario
join lista_anime on lista_anime.id_lista = lista.id
join anime on anime.id = lista_anime.id_anime;

/*plan mesnual de cada usuario  que paga con tarejta*/
select usuario.nickname as 'usuario que paga' 
from usuario
join plan_menusal_usuario on plan_menusal_usuario.id_usuario = usuario.id
join plan_mensual on plan_mensual.id = plan_menusal_usuario.id_plan_mensual
join  metodo_de_pago on metodo_de_pago.id_plan_mensual = plan_mensual.id
join tarjeta on tarjeta.id_metodo_de_pago= metodo_de_pago.id;


/*sacamos los usuarios que compareten su plan mensual con otros usuarios

select usuarioAmigo.id_usuario_agregado , usuarioAmigo2.id_usuario_agrega
from usuario
join usuario_usuario usuarioAmigo on usuarioAmigo.id_usuario_agregado=usuario.id
join usuario_usuario usuarioAmigo2 on usuarioAmigo2.id_usuario_agrega=usuario.id
*/

/*usuarios que pagan un plan menusal y con quien lo coparten*/
select usuario.nickname as 'usuario que paga' ,nombreRata.nickname as 'usuario que ratea'
from usuario
join plan_menusal_usuario on plan_menusal_usuario.id_usuario = usuario.id
join plan_mensual on plan_mensual.id = plan_menusal_usuario.id_plan_mensual
join  metodo_de_pago on metodo_de_pago.id_plan_mensual = plan_mensual.id
join usuario_comparte_plan_mensual on usuario_comparte_plan_mensual.id_plan_mensual = plan_mensual.id
join usuario nombreRata on  nombreRata.id = usuario_comparte_plan_mensual.id_usuario_ratea;