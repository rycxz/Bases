drop database if exists crunchy;
create database if not exists crunchy;
use crunchy;

create table plan_mensual(
id int unsigned primary key auto_increment,
anuncion tinyint(1),
descargas varchar(999),
fecha_final time,
final_inicio time,
precios tinyint unsigned,
descuento_en_tienda tinyint
);

create table fan(
id int unsigned primary key auto_increment,
id_plan_mensual int unsigned,
episodios_diarios tinyint
);

create table mega_fan(
id int unsigned primary key auto_increment,
id_plan_mensual int unsigned,
acceso_anticipado tinyint (1) unsigned
);

create table super_fan(
id int unsigned primary key auto_increment,
id_plan_mensual int unsigned,
acceso_anticipado tinyint (1) unsigned,
preview tinyint (1) unsigned
);

create table usuario(
id int unsigned primary key auto_increment,
id_plan_mensual int unsigned,
nickname varchar(20),
correo varchar (20),
contraseña varchar(20),
estado_animo enum ('feliz', 'triste', 'enfadado','aburrido'),
numero_de_cuenta_bancaria int unsigned,
imagen_de_perfil varchar (30),
tiempo_de_uso int unsigned,
banner varchar (30),
direccion varchar (30)
);

create table plan_menusal_usuario(
id_plan_mensual  int unsigned,
id_usuario  int unsigned,
foreign key ( id_plan_mensual) references plan_mensual(id),
foreign key ( id_usuario) references usuario(id),
primary key(id_plan_mensual, id_usuario)
);

create table metodo_de_pago(
id int unsigned primary key auto_increment,
factura varchar(30),
numero_de_cuenta_bancaria int unsigned
);

create table banco(
id int unsigned primary key auto_increment,
id_metodo_de_pago int unsigned,
banco varchar(20)
);

create table tarjeta(
id int unsigned primary key auto_increment,
id_metodo_de_pago int unsigned,
numero_asociado int unsigned,
fecha_de_expiracion time
);

create table transferencia(
id int unsigned primary key auto_increment,
id_metodo_de_pago int unsigned,
tiempo_que_tarda varchar(20)
);

create table bizum(
id int unsigned primary key auto_increment,
id_metodo_de_pago int unsigned,
numero_de_telefono int unsigned
);

 create table usuario_usuario(
 id_usuario_agregado int unsigned,
  id_usuario_agrega int unsigned,
  foreign key(id_usuario_agregado) references usuario(id),
  foreign key(id_usuario_agrega) references usuario(id),
  primary key(id_usuario_agregado,id_usuario_agrega)
  );
  
  create table imagen_de_perfil(
  id int unsigned primary key auto_increment,
  id_usuario int unsigned,
  imagen_de_perfil varchar(20)
  );
  
  create table lista(
    id int unsigned primary key auto_increment,
    id_usuario int unsigned,
    fecha_de_creacion time,
    nombre varchar(20)
    );
    
create table genero(
	id int unsigned primary key auto_increment,
	id_usuario int unsigned,
	animes_mangas_vistos int unsigned,
	mas_vistos varchar(40),
	breve_descripcion varchar(50),
	mas_gustados varchar(40)
	);
    
    create table anime (
     id int unsigned primary key auto_increment,
     id_genero int unsigned,
     compañia_animadora varchar(40),
     episodios_vistos varchar(40),
     mas_gustados varchar(40),
     mas_vistos varchar(40),
     nombre varchar(20)
     );
     
     create table lista_anime(
       id int unsigned primary key auto_increment,
       id_lista int unsigned,
       id_anime int unsigned
       );
       
	create table tienda(
    id int unsigned primary key auto_increment,
    id_usuario int unsigned,
    direccion_de_correo varchar(30),
    nº_de_factura int unsigned,
    categoria varchar(30),
    precio int unsigned,
    indicaciones_del_usuario varchar(80)
    );
    
    create table animes_tienda(
    id_anime int unsigned,
    id_tienda int unsigned,
    foreign key (id_anime) references anime(id),
	foreign key (id_tienda) references tienda(id),
    primary key(id_anime,id_tienda)
    );
    
    create table usuario_anime(
    id_usuario int unsigned,
    id_anime int unsigned,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_anime) references anime(id),
     primary key(id_usuario,id_anime)
     );
     
     create table mangas (
         id int unsigned primary key auto_increment,
         id_genero int unsigned,
         emision tinyint(1) unsigned,
         nombre varchar(20),
         mangaka varchar(20),
         paginas int unsigned
         );
         
         create table usuario_mangas(
         id_usuario int unsigned,
         id_mangas int unsigned,
         fecha_final_del_usuario date,
         fecha_de_inicio date
         );
         
         create table traducion(
         id int unsigned primary key auto_increment,
         subtitulos tinyint(1) unsigned
         );
         
         create table 	idiomas(
         id int unsigned primary key auto_increment,
         idioma varchar(20)
         );
         
         create table traduccion_manga(
         id_manga int unsigned,
         id_traduccion int unsigned
         );
         
         create table personaje(
         id int unsigned primary key auto_increment,
         id_manga int unsigned,
         nombre varchar(20),
         numero_de_seguidores int unsigned,
         estatura float unsigned,
         sexo varchar(10)
         );
         
         create table compañia_de_envio(
         id int unsigned primary key auto_increment,
         rastreo int unsigned,
         metodo varchar(20),
         codigo_del_paquete int unsigned,
         estado_del_trafico enum('libre', 'concurrido','atasco'),
         tiempo_estimado_de_entrega varchar(20),
         nombre varchar(20),
         nombre_del_repartidor varchar(20)
         );
         
         create table producto(
         id int unsigned primary key auto_increment,
         id_tienda int unsigned,
         id_compañia_de_envio int unsigned,
         id_personaje int unsigned,
         nombre varchar(20),
         tamaño float unsigned,
         destino varchar(20),
         peso float unsigned
         );
         
         create table color(
          id int unsigned primary key auto_increment,
          id_producto int unsigned,
          color varchar(20)
          );
         
         
         
         
         
         
     
    
    
    
    
    
       
     
     
    
  
  
  
  
  
 




