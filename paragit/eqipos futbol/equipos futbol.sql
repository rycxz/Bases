drop database if exists campeonato;
create database campeonato;
use campeonato;


create table equipo (
id int unsigned primary key auto_increment,
patrocinador varchar (100), 
color_camiseta varchar (15),
nombre varchar (25),
categoria varchar (30),
color_segunda_camiseta varchar (15)
);
create table partido (
id int unsigned primary key auto_increment,
goles int unsigned ,
incidencia varchar (100),
arbitro varchar (25),
campo varchar (25)
);
create table jugador (
id int unsigned primary key auto_increment,
id_equipo int unsigned,

nombre varchar (25),
apellidos varchar (25),
edad int unsigned,
direccion varchar (30),
telefono varchar(9),
foreign key (id_equipo) references equipo(id)
);
create table equipo_partido (
id_equipo int unsigned,
id_partido int unsigned,
goles int unsigned,
foreign key (id_equipo) references equipo(id),
foreign key (id_partido) references partido(id),
primary key (id_equipo, id_partido)

);




