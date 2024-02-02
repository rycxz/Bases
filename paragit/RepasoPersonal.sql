
create database stellar;
use stellar;

select *
from especie
where tipo_alimentacion = 'vampirismo';

select nombre , radio
from cuerpo_celeste
where radio <200000;

select nombre, tipo_alimentacion
from especie
where reino = 'Bacteria' and tipo_alimentacion = 'carnívoro';

select * 
from especie
where reino = 'Bacteria' and tipo_alimentacion = 'carnívoro'or  reino = 'conceptia' and tipo_alimentacion = 'omnívoro';

select *
from cuerpo_celeste
where tipo <> 'Planeta';

select *
from  cuerpo_celeste
where nombre like '______' or nombre like 'a%a';

select * 
from persona 
group by id_cuerpo_celeste;

select tipo,count(*)
from cuerpo_celeste
where radio< 170000
group by tipo;

select * , max(densidad)
from cuerpo_celeste;

select nombre ,count(*)
from especie
group by tipo_alimentacion
having count(*)>100;

select persona.nombre , cuerpo_celeste.nombre
from persona
join cuerpo_celeste on persona.id_cuerpo_celeste= cuerpo_celeste.id;









