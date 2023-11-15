drop database if exists gremios;
create database if not exists gremios;
use gremios;


create table calle (
id int unsigned primary key auto_increment,
nombre varchar(20) not null,
tipo_nombre varchar(20)
);
create table barrio (
id int unsigned primary key auto_increment,
nombre varchar(20) not null,
postal varchar(20) not null
);
create table edificio(
id int unsigned primary key auto_increment,
incendios_sobrevividos int unsigned
);
create table gremio(
id int unsigned primary key auto_increment,
id_edificio int unsigned,
nombre varchar(20) not null,
numero_integrantes int unsigned,
foreign key (id_edificio) references edificio(id)
);

create table ciudadano(
id int unsigned primary key auto_increment,
id_edificio int unsigned,
id_gremio int unsigned,
puerta varchar(20),
numero_planta int unsigned,
nombre varchar(20) not null,
edad int unsigned,
estatura int unsigned,
foreign key (id_edificio) references edificio(id),
foreign key (id_gremio) references gremio(id)
);
create table if not exists edificio(
id int unsigned primary key auto_increment,
incendios_sobrevividos int unsigned
);
create table if not exists gremio(
id int unsigned primary key auto_increment,
id_edificio int unsigned,
nombre varchar(20) not null,
numero_integrantes int unsigned,
foreign key (id_edificio) references edificio(id)
);
create table calle_gremio(
id_calle int unsigned,
id_gremio int unsigned,
foreign key (id_calle) references calle(id),
foreign key (id_gremio) references gremio(id)
);
create table barrio_calle(
id_barrio int unsigned,
id_calle int unsigned,
foreign key (id_barrio) references barrio(id),
foreign key (id_calle) references calle(id)
);
create table calle_edificio(
id_calle int unsigned,
id_edificio int unsigned,
foreign key (id_calle) references calle(id),
foreign key (id_edificio) references edificio(id),
portal int unsigned
);
create table ciudadano_ciudadano(
id_ciudadano_contrata int unsigned,
id_ciudadano_contratado int unsigned,
foreign key (id_ciudadano_contrata) references ciudadano(id),
foreign key (id_ciudadano_contratado) references ciudadano(id),
cometido varchar(25),
factura int unsigned,
primary key(id_ciudadano_contrata, id_ciudadano_contratado)
);

create table monumento(
id int unsigned primary key auto_increment,
id_edificio int unsigned,
decroracion int unsigned,
nombre varchar(20),
fecha date,
foreign key (id_edificio) references edificio(id)
);
create table publico(
id int unsigned primary key auto_increment,
id_edificio int unsigned,
nombre varchar(20),
foreign key (id_edificio) references edificio(id)
);
create table servicio(
id int unsigned primary key auto_increment,
id_publico int unsigned,
servicio varchar(50),
foreign key (id_publico) references publico(id)
);










