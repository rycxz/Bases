/* 
 2 INSERT 2
 2 UPDATE 2
 2 DELETE 2
 */

/*triger que al añadir un método de pago le pone 'fecha_inicio' la de hoy */
delimiter $$
create 
	trigger nombre
    before  insert
    on tabla for each row
    begin
		
    end;
    $$
delimiter ;

drop trigger nombre;

/*comprobacion*/ 


/*en primer momento cuando se añade un manga, este no tiene traducción por lo que habrá que ponerle que no tiene traducción*/
delimiter $$
create 
	trigger nombre
    before  insert
    on tabla for each row
    begin
		
    end;
    $$
delimiter ;

drop trigger nombre;

/*comprobacion*/ 


/*triger que cuadno el usuario cambia su domicilio se cambie en la tabla  compañia_de_envio*/
delimiter $$
create 
	trigger nombre
    after update
    on tabla for each row
    begin
		
    end;
    $$
delimiter ;

drop trigger nombre;

/*comprobacion*/ 


/*cuando se actualiza el producto habría que cambiarle el precio a tres unidad más  cara (+3)*/

delimiter $$
create 
	trigger nombre
    after update
    on tabla for each row
    begin
		
    end;
    $$
delimiter ;

drop trigger nombre;

/*comprobacion*/ 


/*cuando se elimine una lista se cambie también la tabla lista_anime para llevar la cuenta */
delimiter $$
create 
	trigger nombre
    after delete
    on tabla for each row
    begin
		
    end;
    $$
delimiter ;

drop trigger nombre;

/*comprobacion*/ 

/*al eliminar un plan mensual eliminar también el usuario al que esta asignado*/
delimiter $$
create 
	trigger nombre
    after delete
    on tabla for each row
    begin
		
    end;
    $$
delimiter ;

drop trigger nombre;

/*comprobacion*/ 

