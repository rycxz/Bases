use cute_examen;
/*1 Nombre y color de pelo de todos los avatares con expresión 'pensativo' (0.5ptos)*/
select avatar.nombre, avatar.color as 'color_pelo'
from avatar
where expresion_facial = 'pensativo';

/*2 Nombre de los avatares que viven en 'El pequeño Jolgorio’ */
select avatar.nombre 
from avatar
join avatar_casa on avatar_casa.id_avatar = avatar.id
join casa on casa.id = avatar_casa.id_casa
where casa.nombre = 'El pequeño Jolgorio';

/*3 Nombre de las prendas de la marca Gloom Butterfly */
select ropa.nombre, ropa.descripcion
from ropa
where  descripcion like '%Gloom Butterfly';

/*4 ¿Cuántos avatares entraron a vivir a una casa en cada mes durante 2022? */
select count(*),(select month(fecha_entrada)
from avatar_casa
group by month(fecha_entrada))
from avatar
join avatar_casa on avatar_casa.id_avatar = avatar.id
join casa on casa.id = avatar_casa.id_casa
where avatar_casa.fecha_entrada > date_sub(curdate(),interval 2 year)
group by casa.id;

select month(fecha_entrada)as 'mes de entrada', count(casa.id) as 'personajes que han entrado'
from avatar_casa
join casa on avatar_casa.id_casa = casa.id
join avatar on avatar.id = avatar_casa.id_avatar
where avatar_casa.fecha_entrada > date_sub(curdate(),interval 2 year)
group by month(fecha_entrada) ;

/*5 Nombre de los avatares con más de 4 herramientas */

select avatar.nombre , count(objeto.id) as 'numero_herramientas'
from avatar
join avatar_objeto on avatar_objeto.id_avatar = avatar.id
join objeto on objeto.id = avatar_objeto.id_objeto
where objeto.tipo = 'herramienta'
group by avatar.id
having numero_herramientas>4;

/*6 ¿Quiénes se casaron durante los últimos 40 meses? */
select avatar.nombre as 'nombre avatar casado ', avatar_recibe.nombre as 'nombre avatar se casa'

from (select id_avatar_ejerce,id_avatar_recibe,avatar_relacion_avatar.tipo as 'tipo_relacion'
from avatar_relacion_avatar
where fecha> date_sub(curdate(),interval 40 month)) as parejas_40meses
join avatar on avatar.id = parejas_40meses.id_avatar_ejerce
join avatar  avatar_recibe on avatar_recibe.id = parejas_40meses.id_avatar_recibe
where parejas_40meses.tipo_relacion = 'matrimonio'
group by avatar.id;


/*7 ¿Cuántos objetos posee cada avatar? Ten en cuenta que el Sr. Rococi tiene 0 objetos */
select avatar.nombre, count(avatar_objeto.id_avatar) as 'numero_objetos'
from objeto 
join avatar_objeto on avatar_objeto.id_objeto = objeto.id
right join avatar  on avatar.id = avatar_objeto.id_avatar
group by avatar.id;

/*8 Nombre de los avatares que no tienen ningún mueble */
/*los avatares que si tienen muebles*/
select avatar.id
from avatar
join avatar_objeto on avatar_objeto.id_avatar = avatar.id
join objeto on objeto.id = avatar_objeto.id_objeto
where objeto.tipo = 'mueble'
group by avatar.id ;

select avatar.nombre
from avatar
where avatar.id not in (select avatar.id
from avatar
join avatar_objeto on avatar_objeto.id_avatar = avatar.id
join objeto on objeto.id = avatar_objeto.id_objeto
where objeto.tipo = 'mueble'
group by avatar.id);

/*9 Nombre del avatar o avatares con más objetos */

/*saco el numero maxmio de objetos */
select max(numero_objetos)
from( select count(*) as 'numero_objetos'
from avatar
join avatar_objeto on avatar_objeto.id_avatar = avatar.id
join objeto on objeto.id = avatar_objeto.id_objeto
group by  avatar_objeto.id_avatar) as numero_objetos_max;

select count(*) , avatar.nombre
from avatar
join avatar_objeto on avatar_objeto.id_avatar = avatar.id
join objeto on objeto.id = avatar_objeto.id_objeto
group by  avatar.id
having count(*) = (select max(numero_objetos)
from( select count(*) as 'numero_objetos'
from avatar
join avatar_objeto on avatar_objeto.id_avatar = avatar.id
join objeto on objeto.id = avatar_objeto.id_objeto
group by  avatar.id) as numero_objetos_max);


/*10 Media de objetos por casa*/
select avg(contador) as 'media de objetos por casa ' ,casa.nombre
from(
select count(*)  as 'contador', casa.id as 'id_casa'
from casa
join habitacion on habitacion.id_casa = casa.id 
join habitacion_objeto on habitacion_objeto.id_habitacion = habitacion.id
join objeto on objeto.id = habitacion_objeto.id_objeto  
group by id_habitacion) as objetos_casa
join casa on casa.id =objetos_casa.id_casa 
group by casa.id;

/*11 Casa o casas en las que viven los avatares con más objetos*/

/*avatar con mas objetos*/
select casa.nombre
from(
select count(*) , avatar.id
from avatar
join avatar_objeto on avatar_objeto.id_avatar = avatar.id
join objeto on objeto.id = avatar_objeto.id_objeto
group by  avatar.id
having count(*) = (select max(numero_objetos)
from( select count(*) as 'numero_objetos'
from avatar
join avatar_objeto on avatar_objeto.id_avatar = avatar.id
join objeto on objeto.id = avatar_objeto.id_objeto
group by  avatar.id) as numero_objetos_max)) as avatar_mas_objetos


join avatar_casa on avatar_casa.id_avatar = avatar_mas_objetos.id
join casa  on casa.id = avatar_casa.id_casa;

/*12 Media de edad de los avatares por casa, suponiendo que
el campo id_superior contiene la edad*/

select	avg(edad), casa.nombre
from (select avatar.id_superior as 'edad' , avatar.id as 'id_avatar'
from avatar
join avatar_casa on avatar_casa.id_avatar = avatar.id
join casa  on casa.id = avatar_casa.id_casa ) as edades
join avatar_casa on avatar_casa.id_avatar = edades.id_avatar
join casa on casa.id = avatar_casa.id_casa
group by casa.id;




