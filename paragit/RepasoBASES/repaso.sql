use stellar;
/*Nombre de especie, alimentación y cuerpo espacial que habita cada especie*/

select especie.nombre as 'nombre', especie.tipo_alimentacion as 'lo que come' ,  cuerpo_celeste.nombre as 'nombre cuerpo_celeste'
from especie
join especie_cuerpo_celeste on especie_cuerpo_celeste.id_especie = especie.id
join cuerpo_celeste on cuerpo_celeste.id = especie_cuerpo_celeste.id_cuerpo_celeste;

/*
SELECT especie.nombre AS 'Especie', especie.tipo_alimentacion AS 'Alimentacion', cuerpo_celeste.nombre AS 'Cuerpo celeste'
FROM especie_cuerpo_celeste
JOIN especie ON especie_cuerpo_celeste.id_especie=especie.id
JOIN cuerpo_celeste ON especie_cuerpo_celeste.id_cuerpo_celeste=cuerpo_celeste.id;
*/

/*Nombre de especie y media de edad de las personas que pertenecen a esa especie*/

select  especie.nombre as 'nombre' , avg(persona.edad) as 'media de edad'
from especie 
join especie_persona on especie_persona.id_especie = especie.id
join persona on persona.id = especie_persona.id_persona
group by especie.id;

/*
select especie.nombre as 'Nombre', avg(persona.edad) as 'edad media' 
from especie_persona
join persona on especie_persona.id_persona=persona.id
join especie on especie_persona.id_especie=especie.id
group by especie.id;

*/

/*Nombre de especie y media de edad de las personas que pertenecen a esa especie, solo si la media de edad es superior a 200 años*/

select  especie.nombre as 'nombre' , avg(persona.edad) as 'media de edad'
from especie 
join especie_persona on especie_persona.id_especie = especie.id
join persona on persona.id = especie_persona.id_persona
group by especie.id
having avg(persona.edad)>200;

/*
select especie.nombre as 'Especie', avg(edad) as 'Edad Media' 
from especie_persona
join especie on especie_persona.id_especie=especie.id
join persona on especie_persona.id_persona=persona.id
group by id_especie
having avg(edad)>200;
*/

/*Número de naves estacionadas en territorio de cada coalición */

select count(*) as 'numero de naves' ,  coalicion.nombre as 'nombre territorio'
from coalicion_cuerpo_celeste
join coalicion on coalicion_cuerpo_celeste.id_coalicion = coalicion.id
join cuerpo_celeste on cuerpo_celeste.id = coalicion_cuerpo_celeste.id_cuerpo_celeste
join nave on nave.id_coalicion = coalicion.id
group by coalicion_cuerpo_celeste.id_coalicion;
/*hay que tener cuidad con la union*/

select count(*) as 'numero de naves' ,  coalicion.nombre as 'nombre territorio'
from cuerpo_celeste 
join coalicion_cuerpo_celeste on coalicion_cuerpo_celeste.id_cuerpo_celeste = cuerpo_celeste.id
join coalicion on coalicion.id = coalicion_cuerpo_celeste.id_coalicion
join nave on nave.id_coalicion = cuerpo_celeste.id
group by coalicion_cuerpo_celeste.id_coalicion;
/*
select coalicion.nombre 'Nombre de la coalicion',count(*) as 'Número de Naves'
from cuerpo_celeste
join coalicion_cuerpo_celeste on cuerpo_celeste.id=id_cuerpo_celeste
join coalicion on coalicion_cuerpo_celeste.id_coalicion=coalicion.id
join nave on cuerpo_celeste.id=nave.id_cuerpo_celeste
group by coalicion_cuerpo_celeste.id_coalicion;
*/

/*Número de personas nacidas en cada estrella*/

/*Nombre y número de veces que cada persona ha formado parte de una tripulación*/ 

/*Coalicones con más de 23 naves estacionadas en ellas(en su territorio)*/

/*Naves de una coalición que están aparcadas en el territorio de otra coalición*/

/*Calcula el número de tripulantes para las naves de la consulta anterior (sin usar el campo n_tripulantes)*/

/*Para cada persona, especie a la que pertenece y cuerpo celeste de nacimiento*/

/* ¿Cuántos tripulantes de cada especie tripulan naves?*/

/*¿Cuántos tripulantes de cada especie tripulan cada nave?*/

/*Nombre y tipo de las naves que están en vuelo*/

/*Número estimado de especímenes vivos del universo*/

/*Nombre de las personas originarias de cuerpos espaciales que orbitan estrellas*/

/*Nombre y cuerpo celeste de nacimiento de los nobles*/

/*Edad máxima de las personas de cada especie*/

/*Cuerpos celestes habitados por especies con más sujetos vivos que la media de sujetos vivos de todas las especies*/

/*Especie con más personas*/

/*Todos los cuerpos (nombre) celestes e información de las especies (nombre, reino) carnívoras que viven en ellos*/

/*Todos los cuerpos (nombre) celestes e información de las especies (nombre, reino, alimentación) que viven en ellos*/

/*fechas*/

/*Libros prestados en los últimos 780+365*2 días*/

/*Socios que hayan tardado más de un año en devolver un préstamo*/

/*Autores de los libros prestados desde hace 27+12+12 meses*/



 