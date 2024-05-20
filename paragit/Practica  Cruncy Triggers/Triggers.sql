/* 
 2 INSERT 2
 2 UPDATE 2
 2 DELETE 2
 */
use crunchy;
/*triger que al añadir un plan mensual le pone 'fecha_inicio' la de hoy */
delimiter $$
create 
	trigger actualizarMetodoPago
    before  insert
    on plan_mensual for each row
    begin
        set  new.fecha_inicio=  curdate();
    end;
    $$
delimiter ;

drop trigger actualizarMetodoPago;

/*comprobacion*/ 
insert into plan_mensual(anuncios,descargas,fecha_final,fecha_inicio,precios,acceso_anticipado,descuento_en_tienda,preview)  values ("1","Tokyo_Ghoul Darling_in_the_Franxx Ghost_in_the_Shell",null,"2024-09-04","6.99","0","6","1");
select * from plan_mensual where id = last_insert_id();

/*en primer momento cuando se añade un manga, este  va a tener una traduccion que habra que añadirla con subitutlos , tendria de idioma el ingles y el español*/
delimiter $$
create 
	trigger traduccionesManga
    before  insert
    on mangas for each row
    begin
	
	
    insert into idiomas(id_mangas,idioma) values (last_insert_id(),'español, ingles');
    insert into traducion (id_mangas,subtitulos) values (last_insert_id(),1);
    insert into traduccion_manga(id_manga,id_traduccion) values (last_insert_id(),last_insert_id());
    end;
    $$
delimiter ;

drop trigger traduccionesManga;

/*comprobacion*/ 
insert into mangas (id_genero,emision,nombre,mangaka,paginas,fecha_creacion) values   (24,1,"manga2 inventado","matrix",50,curdate());
select * from mangas where id = last_insert_id();
select * from traducion where id = last_insert_id();
select * from traduccion_manga;
/*triger que cuadno el usuario cambia su domicilio se cambie en la tabla  compañia_de_envio*/
delimiter $$
create 
	trigger cambiarDomicilio
    before update
    on usuario for each row
    begin
		update compañia_de_envio
        set destino = (new.direccion)
        where id = (select compañia_de_envio.id
        from compañia_de_envio 
        join producto on producto.id_compañia_de_envio = compañia_de_envio.id
        where producto.id_usuario = new.id 
        )
        ;
   
    end;
    $$
delimiter ;        
drop trigger cambiarDomicilio;
 
/*comprobacion*/ 
select direccion from usuario where id = 23; 
update usuario
set direccion = 'casa de las casetas 23'
where usuario.id = 23;

select destino ,compañia_de_envio.id from compañia_de_envio
	join producto on producto.id_compañia_de_envio = compañia_de_envio.id
    join usuario on usuario.id = producto.id_usuario
    where usuario.id = 23;

/*cuando se actualiza el producto habría que cambiarle el precio a tres unidad más  cara (+3)*/

delimiter $$
create 
	trigger cambioPrecio
    before update
    on producto for each row
    begin
    set new.precio = new.precio+3;

    end;
    $$
delimiter ;

drop trigger cambioPrecio;

/*comprobacion*/ 
select precio from producto where id = 12; 

update producto
set precio = 4
where producto.id = 12;

select precio from producto where id = 12; 

/*cuando se elimine una lista se cambie también la tabla lista_anime para llevar la cuenta */
delimiter $$
create 
	trigger eliminarListas
    after delete
    on lista for each row
    begin
			DELETE  from lista_anime 
				WHERE id_lista =  old.id;
    end;
    $$
delimiter ;

drop trigger eliminarListas;

/*comprobacion*/ 
select * from lista where id = 98;
select * from lista_anime where id_lista = 98;

DELETE  from lista 
				WHERE id =  98;
/*al eliminar un producto se quite de compañia_de_envio*/
delimiter $$
create 
	trigger elminarProducto
    after delete
    on producto for each row
    begin
	update 	compañia_de_envio
	set tiempo_estimado_de_entrega = 0
    where id = (select id_compañia_de_envio from producto where id = old.id);
	end;
    $$
delimiter ;

drop trigger elminarProducto;

/*comprobacion*/ 
select * from producto where id = 8;
select tiempo_estimado_de_entrega from compañia_de_envio where id = (select id_compañia_de_envio from producto where id = 8);
	DELETE  from producto
				WHERE id =  8;
