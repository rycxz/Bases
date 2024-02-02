use cute_village;
use Stellar;

SELECT id, nombre, identificador, tipo, capacidad_carga, n_tripulantes
FROM nave;

SELECT nombre, edad
FROM persona;

SELECT nombre,tipo_alimentacion
FROM especie;

SELECT *
from especie
 WHERE tipo_alimentacion = 'vampirismo';

 
 SELECT nombre,radio
FROM cuerpo_celeste
 WHERE  radio < 200000;

 SELECT nombre, tipo_alimentacion
FROM especie
 WHERE  tipo_alimentacion = 'carnívoro';
 
 
  SELECT *
FROM cuerpo_celeste
WHERE tipo <> 'planeta';

SELECT *

FROM persona
GROUP BY id_cuerpo_celeste
HAVING id_cuerpo_celeste ;
 
 SELECT tipo,
 count(*)
FROM cuerpo_celeste
GROUP BY tipo;

SELECT tipo,
 count(*)
FROM cuerpo_celeste
where radio<1700000
GROUP BY tipo;

select tipo, 
count(*), 
Max(densidad)
  from cuerpo_celeste
  group by tipo;
  
  
  select tipo_alimentacion, 
count(*)
  from especie
  group by tipo_alimentacion
  having count(*)>100;
  
  select * from cuerpo_celeste;
   select * from persona;
   
   select persona.nombre as 'Personas' , cuerpo_celeste.nombre as 'Cupero celesete' 
   from  cuerpo_celeste join persona on  cuerpo_celeste.id= persona.id_cuerpo_celeste ;
   
   
   select cuerpo_celeste.nombre as 'nombre',
   count(*)
   from  cuerpo_celeste join persona on  persona.id_cuerpo_celeste = cuerpo_celeste.id
   group by id_cuerpo_celeste;
   
   
   select persona.nombre as 'nombre persona',especie.nombre as 'especie'
   from especie join especie_persona on especie.id = especie_persona.id_especie
   join persona on persona.id =  especie_persona.id_persona;
   
   
   select cuerpo_celeste.nombre as 'Cupero celesete' , count(*)
   from persona join cuerpo_celeste on cuerpo_celeste.id = persona.id_cuerpo_celeste
   group by id_cuerpo_celeste
   having count(*)>5;
   
   select especie.nombre as 'nombre especie', tipo_alimentacion ,cuerpo_celeste.nombre as 'nombre cuerpo_celeste'
   from especie join especie_cuerpo_celeste on especie.id = especie_cuerpo_celeste.id_especie
   join cuerpo_celeste on cuerpo_celeste.id = especie_cuerpo_celeste.id_cuerpo_celeste;
   
   
   SELECT id_coalicion ,count(*) from nave group by id_coalicion;
    SELECT * from coalicion_cuerpo_celeste;
    SELECT * from coalicion;
        SELECT * from direcciones;
   
select coalicion.nombre 'Nombre de la coalicion',count(*) as 'Número de Naves'
from cuerpo_celeste
join coalicion_cuerpo_celeste on cuerpo_celeste.id=id_cuerpo_celeste
join coalicion on coalicion_cuerpo_celeste.id_coalicion=coalicion.id
join nave on cuerpo_celeste.id=nave.id_cuerpo_celeste
group by coalicion_cuerpo_celeste.id_coalicion;



select persona.nombre, direcciones.direccion
from persona
join direcciones on persona.id=direcciones.id_persona
join tripulante on persona.id=tripulante.id_persona
join nave_tripulante on tripulante.id=nave_tripulante.id_tripulante
join nave on nave_tripulante.id_nave=nave.id
where nave.nombre like 'USS Butterfly';

select count(*), estrella.id as 'cuerpo celeste'
from estrella join cuerpo_celeste on estrella.id_cuerpo_celeste =  cuerpo_celeste.id
join persona on cuerpo_celeste.id = persona.id_cuerpo_celeste
group by tipo;

select * from persona;
select * from persona;

select count(*), cuerpo_celeste.nombre as 'cuerpo celeste'
from estrella join cuerpo_celeste on estrella.id_cuerpo_celeste =  cuerpo_celeste.id
join persona on cuerpo_celeste.id = persona.id_cuerpo_celeste
group by persona.id_cuerpo_celeste;

select cuerpo_celeste.nombre as 'Estrella', count(*) as 'Nacidos'
from persona 
join cuerpo_celeste on persona.id_cuerpo_celeste = cuerpo_celeste.id
join estrella on estrella.id_cuerpo_celeste = cuerpo_celeste.id
group by persona.id_cuerpo_celeste;

select persona.nombre as 'nombre',  count(*), tripulante.id
from tripulante 
join persona on tripulante.id_persona = persona.id
group by persona.nombre;

select persona.nombre as 'nombre', count(*)
from tripulante 
join  persona on tripulante.id_persona = persona.id
group by id_persona;

select coalicion.nombre 'Nombre de la coalicion',count(*) as 'Número de Naves'
from cuerpo_celeste
join coalicion_cuerpo_celeste on cuerpo_celeste.id=id_cuerpo_celeste
join coalicion on coalicion_cuerpo_celeste.id_coalicion=coalicion.id
join nave on cuerpo_celeste.id=nave.id_cuerpo_celeste
group by coalicion_cuerpo_celeste.id_coalicion
having count(*)> 23;

select* 
from coalicion_cuerpo_celeste;
/* 
Preubas pero faltaba el renombrar las cosas


select coalicion.nombre,nave.id_coalicion,cuerpo_celeste.nombre
from nave
join cuerpo_celeste on nave.id_cuerpo_celeste = cuerpo_celeste.id
join coalicion_cuerpo_celeste on cuerpo_celeste.id = coalicion_cuerpo_celeste.id_cuerpo_celeste
join coalicion on coalicion_cuerpo_celeste.id_coalicion = coalicion.id;

select coalicion.nombre as 'Nombre de la coalicion',nave.id_coalicion, cuerpo_celeste.nombre
from nave
join coalicion coalicion_esta on nave.id_coalicion=nave.id
join cuerpo_celeste on nave.id_cuerpo_celeste=nave.id
join coalicion_cuerpo_celeste on coalicion_cuerpo_celeste.id_cuerpo_celeste=cuerpo_celeste.id
join coalicion coalicion_pertenece on coalicion_cuerpo_celeste.id_coalicion = coalicion.id
where nave.id_cuerpo_celeste <> coalicion_cuerpo_celeste.id_cuerpo_celeste; 

*/
 select nave.nombre,count(*) as 'numero de tripulantes'
from nave
join cuerpo_celeste on nave.id_cuerpo_celeste=cuerpo_celeste.id
join coalicion_cuerpo_celeste ccc on ccc.id_cuerpo_celeste=cuerpo_celeste.id
join coalicion coalicion_esta on coalicion_esta.id=ccc.id_coalicion
join coalicion coalicion_pertenece on nave.id_coalicion=coalicion_pertenece.id
join nave_tripulante on nave.id = nave_tripulante.id_nave
join tripulante on nave_tripulante.id_tripulante = tripulante.id
where coalicion_esta.id<>coalicion_pertenece.id
group by nave.id;


select persona.nombre as 'nombre de la persona' , especie.nombre as 'nombre de especie', cuerpo_celeste.nombre as 'nombre del cuerpo celeste'
from especie
join especie_persona on especie_persona.id_especie = especie.id
join persona on persona.id = especie_persona.id_persona
join cuerpo_celeste on cuerpo_celeste.id = persona.id_cuerpo_celeste;

select count(*) as 'tripulanetes' , especie.nombre
from tripulante
join persona on persona.id = tripulante.id_persona
join especie_persona on especie_persona.id_persona = persona.id
join especie on especie.id = especie_persona.id_especie
join nave_tripulante on nave_tripulante.id_tripulante= tripulante.id
join nave on nave.id = nave_tripulante.id_nave
group by nave.id;
/* no acabadoo
select count(*) as 'tripulanetes' , nave.nombre 
from tripulante
join persona on persona.id = tripulante.id_persona
join especie_persona on especie_persona.id_persona = persona.id
join especie on especie.id = especie_persona.id_especie
join nave_tripulante on nave_tripulante.id_tripulante= tripulante.id
join nave on nave.id = nave_tripulante.id_nave
group by nave.id;
*/



select especie.nombre , tipo_alimentacion as 'tipo de alimentacion'
from especie
where tipo_alimentacion <> 'herbívoro' and tipo_alimentacion <> 'geovoro';

select especie.nombre , tipo_alimentacion as 'tipo de alimentacion', count(*) as 'personas'
from especie
join especie_persona on especie_persona.id_especie = especie.id
join persona on  persona.id = especie_persona.id_persona
where tipo_alimentacion <> 'herbívoro' and tipo_alimentacion <> 'geovoro'
group by especie.nombre;

use stellar;
select especie.nombre, persona.nombre, tripulante.cargo
from tripulante 
join persona on persona.id = tripulante.id_persona
join especie_persona on especie_persona.id_persona = persona.id
join especie on especie.id = especie_persona.id_especie
where persona.nombre like 'Dr.%';

SELECT *
from especie;


select nave.nombre
from nave 
where id_cuerpo_celeste is null;

select sum(n_estimado) as 'Numero estimado'
from especie;



select persona.nombre 
from persona
join  cuerpo_celeste on cuerpo_celeste.id = persona.id_cuerpo_celeste
join estrella  on estrella.id_cuerpo_celeste = cuerpo_celeste.id
group by estrella.id_cuerpo_celeste;


select  id_habitacion,avg (id_objeto)
from  objeto
join habitacion_objeto on habitacion_objeto.id_objeto = objeto.id
join habitacion on habitacion.id = habitacion_objeto.id_habitacion
group by id_habitacion
having avg (id_objeto)>400  ;

use bibliotecastellar;

select socio.nombre as 'Nombre del Socio', libro.titulo as 'Título del libro'
from socio
join socio_libro on socio.id=socio_libro.id_socio
join libro on socio_libro.id_libro=libro.id
where year(socio_libro.fecha_prestamo) = year(date_sub(curdate(), interval 4 year));

/*libros hace 1510 dias*/
select titulo as  'Título del libro', fecha_prestamo 
from libro 
join socio_libro on libro.id=socio_libro.id_libro
where datediff(curdate(),fecha_prestamo)<=1510;

select socio.nombre , fecha_prestamo,fecha_devolucion
from libro 
join socio_libro on libro.id=socio_libro.id_libro
join socio on socio.id = socio_libro.id_socio
where datediff(fecha_prestamo,fecha_devolucion) > 365;


select *
from libro
join socio_libro on socio_libro.id_libro = libro.id;

select*
from libro;


select autor.nombre , fecha_prestamo
from autor
join autor_libro on autor_libro.id_autor = autor.id
join libro on libro.id = autor_libro.id_autor
join socio_libro on socio_libro.id_libro = libro.id 
where  socio_libro.fecha_prestamo > date_sub(curdate(),interval 51 month)
group by autor.id;

use pokimon;

select*
from pokimon;


select motivador.nombre,count(*)
from motivador
join pokimon on pokimon.id_motivador=motivador.id
group by pokimon.id_motivador
having count(*)<40;

select*from pokimon;

select motivador.nombre as 'nombre motivador', pokimon.nombre as 'nombre pokimon'
from motivador
join pokimon on pokimon.id_motivador=motivador.id;

select pokimon.nombre as 'nombre pokimon'
from pokimon
where nivel<10;

select * from ataque;

select especie.nombre
from ataque
join ataque_especie on ataque_especie.id_ataque=ataque.id
join especie on especie.id =ataque_especie.id_especie
where estado ='despistao'
group by ataque_especie.id_especie;

select pokimon.nombre , count(*)
from ataque_pokimon
join pokimon on pokimon.id =ataque_pokimon.id_pokimon
group by id_ataque;

select * from pokimon;
select motivador.nombre
from pokimon
join motivador on pokimon.id_motivador=motivador.id
join especie on pokimon.id_especie=especie.id
where especie.nombre="escuero";

use stellar;

select persona.nombre as 'nombre de la persona' , cuerpo_celeste.nombre as 'nombre del cuerpo celeste' , estrella.tipo as 'tipo de la estrella'
from persona 
join cuerpo_celeste on persona.id_cuerpo_celeste=cuerpo_celeste.id
join cuerpo_celeste_orbita_cuerpo_celeste on cuerpo_celeste.id=cuerpo_celeste_orbita_cuerpo_celeste.id_cuerpo_celeste_orbitador
join estrella on cuerpo_celeste_orbita_cuerpo_celeste.id_cuerpo_celeste_orbitado=estrella.id_cuerpo_celeste;

select especie.nombre
from especie
order by tipo_alimentacion asc;

select avg(edad) as'promedio de la edad'
from persona;

select max(id)
from persona;

select max(edad), especie.nombre
from especie_persona
join especie on especie.id=especie_persona.id_especie
join persona on persona.id = especie_persona.id_persona
group by especie.id;

select persona.nombre,cuerpo_celeste.nombre
from persona
join cuerpo_celeste on cuerpo_celeste.id = persona.id_cuerpo_celeste
where  persona.nombre like 'lord%' or persona.nombre like 'lady%'or persona.nombre like 'sir%';

use bibliotecastellar;

select nombre
from socio
where id=(select max(id)
from socio );

select nombre,edad
from socio 
where edad=(select min(edad)
from socio);

select * from socio;

use stellar;
/*version mia*/
select nombre 
from especie 
where n_estimado<(select avg(n_estimado)
from especie);

/*version albertiño*/
select cuerpo_celeste.nombre
from especie
join especie_cuerpo_celeste cce on cce.id_especie = especie.id
join cuerpo_celeste on cuerpo_celeste.id=cce.id_cuerpo_celeste
where n_estimado>(select avg(n_estimado)
from especie);
/* numero 50*/
select persona.nombre
from persona 
where persona.id not in  
 (select persona.id
from tripulante
join persona on tripulante.id_persona= persona.id);
 /*51*/
 /*
select especie.nombre , count(*)
from especie
join especie_persona esp on esp.id_especie = especie.id
join persona on persona.id =esp.id_persona
group by especie.id
having count(*)>();
*/
/*
select  especie.nombre
from (select count(*) as 'maximo',id_especie 
from especie_persona
join especie on especie.id = especie_persona.id_especie
join persona on persona.id = especie_persona.id_persona
group by especie.id )
as consulta
join especie on especie.id =consulta.id_especie;
*/
select especie.nombre, count(*) as 'numero' 
from especie_persona
join especie on especie.id = especie_persona.id_especie
join persona on persona.id = especie_persona.id_persona
group by especie.id
having numero like (select max(maximo)
from (select count(*) as 'maximo'
from especie_persona
join especie on especie.id = especie_persona.id_especie
join persona on persona.id = especie_persona.id_persona
group by especie.id )
as consulta);

/*
maximo de ejempolares de las especies
select max(maximo)
from (select count(*) as 'maximo'
from especie_persona
join especie on especie.id = especie_persona.id_especie
join persona on persona.id = especie_persona.id_persona
group by especie.id )
as consulta;

especies  y su nuemro de personas
select count(*) as 'maximo',especie.nombre 
from especie_persona
join especie on especie.id = especie_persona.id_especie
join persona on persona.id = especie_persona.id_persona
group by especie.id;
*/
use stellar;
/*52*/
/*
select persona.nombre
from (select persona.nombre as 'medicos',persona.id
from persona
join tripulante on tripulante.id_persona= persona.id
where tripulante.cargo like 'medico')
AS medicos
*/
/*medicos que son tripulantes*/
/*
join persona on persona.id = medicos.id
join tripulante on tripulante.id_persona= persona.id
where fecha_fin like (select max(fecha_fin)
from tripulante
where tripulante.cargo like 'medico' );
*/

select nombre
from tripulante
join persona on tripulante.id_persona = persona.id
where cargo like 'Médico' and fecha_fin=(select max(fecha_fin)
				from tripulante
				where cargo like 'Médico'); 
select persona.nombre
from tripulante
join persona on tripulante.id_persona=persona.id
where fecha_fin =(select max(fecha_fin)
from tripulante
where cargo like 'medico');
/*53*/
/*curpos celestes donde han nacido personas*/
/*
select cuerpo_celeste.nombre,count(*)
from cuerpo_celeste
join persona on persona.id_cuerpo_celeste =cuerpo_celeste.id
group by persona.id_cuerpo_celeste;

select  max(numero)
from (select cuerpo_celeste.nombre,count(*) as 'numero'
from cuerpo_celeste
join persona on persona.id_cuerpo_celeste =cuerpo_celeste.id
group by persona.id_cuerpo_celeste)
as consulta;


*/
select cuerpo_celeste.nombre,count(*) as 'personas'
from persona
join cuerpo_celeste on cuerpo_celeste.id = persona.id_cuerpo_celeste
group by persona.id_cuerpo_celeste
having personas = (select  max(numero)
from (select cuerpo_celeste.nombre,count(*) as 'numero'
from cuerpo_celeste
join persona on persona.id_cuerpo_celeste =cuerpo_celeste.id
group by persona.id_cuerpo_celeste) as consulta);


