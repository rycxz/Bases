use experimento;

/*1 capibaras hembra que pesen más de 42kg (0,5pts)*/
select capibara.nombre 
from capibara
where sexo = "m" and peso>42;

/*2 id, temperatura del agua, código de piscina y fecha de cada baño*/
select id,t_agua as 'temperatura_agua', codigo_piscina,fecha 
from bano;

/*3 ¿Cuántos baños ha preparado cada becario?*/
select count(bano.id_becario) as 'numero de baños preparados' , becario.id
from bano
right join  becario  on bano.id_becario= becario.id
group by becario.id; 

/*4 ¿Cuál es la edad media de los capibaras por sexo?*/
select avg(edad) as 'edad_hombres' ,(select avg(edad) as 'edad_mujeres ' 
from capibara
where sexo= "m"
)as edad_mujeres
from capibara
where sexo= "h";

/*5 Los capibaras que se bañaron hace 10 días se han puesto enfermos.Necesitamos saber el proveedor del lote de cítricos que se utilizó y su número de teléfono*/
select  proveedor.nombre , proveedor.telefono
from proveedor
join lote on lote.id_proveedor = proveedor.id
join bano on bano.id_lote = lote.id
join bano_capibara on bano_capibara.id_bano = bano.id
join capibara on capibara.id =bano_capibara.id_capibara
where bano.fecha >date_sub(curdate(), interval 375 day)
group by proveedor.id;

/*repasadr depues*/


/*6 ¿Cuántos baños se dio cada capibara el año pasado?*/
select capibara.nombre ,count(*)
from capibara
 join bano_capibara on bano_capibara.id_capibara = capibara.id
 join bano on bano.id = bano_capibara.id_bano
where year (bano.fecha) like year ( date_sub(curdate(), interval 2 year))
group by bano_capibara.id_capibara;

/*7 Nombre de todos los doctores y cuántos informes rellenaron sobre baños en los dos últimos meses*/

select cientifiko.nombre ,count(*) as 'numero de informes'
from cientifiko
join doctor on doctor.id_cientifiko = cientifiko.id
join informe on informe.id_doctor = doctor.id
join bano on bano.id = informe.id_bano
where  bano.fecha >date_sub(curdate(), interval 435 day)
group by doctor.id;


/*8 Nombre del capibara o capibaras más viejos y número de baños en los que han participado*/
select capibara.nombre ,count(*)
from capibara
left join bano_capibara on bano_capibara.id_capibara = capibara.id
left join  bano on  bano.id = bano_capibara.id_bano
where capibara.edad  =( select max(edad) from capibara )
group by bano_capibara.id_capibara;




/*10 capibaras que no se han bañado con mandarinas*/

select capibara.nombre
from  capibara 
join bano_capibara on bano_capibara.id_capibara = capibara.id
join bano on bano.id= bano_capibara.id_bano
join lote on lote.id = bano.id_lote
join lote_citrico on lote_citrico.id_lote = lote.id
join citrico on citrico.id = lote_citrico.id_citrico
where capibara.id <> (

select capibara.id
from  capibara 
join bano_capibara on bano_capibara.id_capibara = capibara.id
join bano on bano.id= bano_capibara.id_bano
join lote on lote.id = bano.id_lote
join lote_citrico on lote_citrico.id_lote = lote.id
join citrico on citrico.id = lote_citrico.id_citrico
where citrico.nombre = "mandarina"
group by capibara.id)
group by capibara.id;




/*11 ¿cuántas piezas de cada cítrico nos ha traído cada proveedor?*/
select citrico.nombre , count(lote.id_proveedor) as 'piezas',proveedor.nombre as 'proveedor_nombre'
from citrico
join lote_citrico on lote_citrico.id_citrico = citrico.id 
join lote on lote.id = lote_citrico.id_lote
right join proveedor on proveedor.id = lote.id_proveedor
group by proveedor.id;


/*12 ¿cuál es el mayor proveedor de limones?*/

select count(*),proveedor.nombre
from citrico
join lote_citrico on lote_citrico.id_citrico = citrico.id 
join lote on lote.id = lote_citrico.id_lote
join proveedor on proveedor.id = lote.id_proveedor
group by proveedor.id
having count(*) = (select max(cnt)
from(
select count(*) as 'cnt',proveedor.nombre
from citrico
join lote_citrico on lote_citrico.id_citrico = citrico.id 
join lote on lote.id = lote_citrico.id_lote
join proveedor on proveedor.id = lote.id_proveedor
where citrico.nombre = "limón"
group by proveedor.id)
as subC);

/*sacamos */
select max(cnt)
from(
select count(*) as 'cnt',proveedor.nombre
from citrico
join lote_citrico on lote_citrico.id_citrico = citrico.id 
join lote on lote.id = lote_citrico.id_lote
join proveedor on proveedor.id = lote.id_proveedor
where citrico.nombre = "limón"
group by proveedor.id)
as subC;

/*13 Según los informes presentados por los doctores, ¿cuál es la distribución óptima de temperaturas y cítricos para producir la felicidad máxima de los capibaras?*/