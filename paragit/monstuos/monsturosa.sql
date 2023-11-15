drop database if  exists monster;
create database if not exists monster;
use monster;

create table especie(
id int unsigned primary key auto_increment,
comportaiento varchar(20),
tamano_minimo tinyint,
tamano_maximo tinyint,
nombre varchar(20),
debilidad varchar(20)
);
create table mapa(
id int unsigned primary key auto_increment,
nombre varchar (20),
lvl_dificultad tinyint
);

create table monstruo(
id int unsigned primary key auto_increment,
id_mapa int unsigned,
id_especie int unsigned,
 tamaño int unsigned,
 color varchar(20),
 coordenada_x int unsigned,
  coordenada_y int unsigned,
   coordenada_z int unsigned);
   create table mision(
   id int unsigned primary key auto_increment,
   nombre varchar(20),
   moneda tinyint);
   create table material(
   id int unsigned primary key auto_increment,
   nombre varchar(20),
   tipo varchar(20),
   precio tinyint,
   rareza varchar(20));
   create table objeto(
   id int unsigned primary key auto_increment,
     nombre varchar(20),
       descripcion varchar(80),
       suma_ingresos_totales float);
create table arma(
 id int unsigned primary key auto_increment,
id_objeto int unsigned,
valor_ataque int unsigned,
elemento varchar(20),
alcanece int );
create table armadura(
 id int unsigned primary key auto_increment,
id_objeto int unsigned,
valor_defensa int unsigned,
parte_del_cuerpo varchar(20) );
create table consumible(
 id int unsigned primary key auto_increment,
id_objeto int unsigned,
duracion int unsigned );

 create table efecto (
 id int unsigned primary key auto_increment,
 id_consumible int unsigned, 
 efecto varchar(20)
 );
create table clima(
id int unsigned primary key auto_increment, 
id_mapa int unsigned,
clima varchar(20)
);
create table monstruo_mision(
id_monstruo int unsigned,
id_mision int unsigned,
foreign key(id_monstruo) references monstruo(id),
foreign key(id_mision) references mision(id),
primary key(id_monstruo,id_mision));

create table especie_depreda_especie(
id_especie_devorada int unsigned,
id_especie_devora int unsigned,
foreign key (id_especie_devorada) references especie(id),
foreign key (id_especie_devora) references especie(id),
primary key(id_especie_devorada,id_especie_devora));

create table misiones_objeto(
id_mision int unsigned,
id_objeto int unsigned,
foreign key (id_mision) references mision(id),
foreign key (id_objeto) references objeto(id),
primary key(id_mision,id_objeto));
create table material_objeto(
id_material int unsigned,
id_objeto int unsigned,
cantidad int unsigned,
foreign key (id_material) references material(id),
foreign key (id_objeto) references objeto(id),
primary key(id_material,id_objeto));






 


       
   
   
   
   
   
 




