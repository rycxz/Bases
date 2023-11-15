drop database if exists cute;
create database if not exists cute;
use cute;

create table prenda(
id int unsigned primary key auto_increment,
nombre varchar(20) not null,
descripcion varchar(50)
);
create table superior(
id int unsigned primary key auto_increment,
tipo varchar(20),
id_prenda int unsigned,
foreign key (id_prenda) references prenda(id)
);
create table inferior(
id int unsigned primary key auto_increment,
color varchar(20),
id_prenda int unsigned,
foreign key (id_prenda) references prenda(id)
);
create table calzado(
id int unsigned primary key auto_increment,
color varchar(20),
terreno varchar(20),
id_prenda int unsigned,
foreign key (id_prenda) references prenda(id)
);
create table sombrero(
id int unsigned primary key auto_increment,
id_prenda int unsigned,
foreign key (id_prenda) references prenda(id)
);
create table peinado(
id int unsigned primary key auto_increment,
modelo varchar(20)
);
create table casa(
id int unsigned primary key auto_increment,
nº_habitantes tinyint,
nombre varchar(20)
);
create table avatar(
id int unsigned primary key auto_increment,
expresion varchar(20),
color varchar(20),
id_peinado int unsigned,
id_superior int unsigned,
id_inferior int unsigned,
id_calzado int unsigned,
id_sombrero int unsigned,
id_casa int unsigned,
foreign key (id_peinado) references peinado(id),
foreign key (id_superior) references superior(id),
foreign key (id_inferior) references inferior(id),
foreign key (id_calzado) references calzado(id),
foreign key (id_sombrero) references sombrero(id),
foreign key (id_casa) references casa(id)
);
create table objeto(
id int unsigned primary key auto_increment,
descripcion varchar(60),
nombre varchar(20),
tipo varchar(20),
tamaño varchar(20)
);
create table habitacion(
id int unsigned primary key auto_increment,
id_casa int unsigned,
tipo varchar(20),
foreign key (id_casa) references casa(id)
);
create table avatar_objeto(
id int unsigned primary key auto_increment,
id_avatar int unsigned,
id_casa int unsigned,
tipo varchar(20),
foreign key (id_avatar) references avatar(id),
foreign key (id_casa) references casa(id)
);
create table habitacion_objeto(
id int unsigned primary key auto_increment,
id_habitacion int unsigned,
id_objeto int unsigned,
orientacion varchar(20),
fila varchar(20),
columna varchar(20),
foreign key (id_habitacion) references habitacion(id),
foreign key (id_objeto) references objeto(id)
);
create table avatar_avatar(
id int unsigned primary key auto_increment,
id_avatar_adoptado int unsigned,
id_avatar_adopta int unsigned,
foreign key (id_avatar_adoptado) references avatar(id),
foreign key (id_avatar_adopta) references avatar(id)
);
create table avatar_avatar_casa(
id int unsigned primary key auto_increment,
id_avatar_casa int unsigned,
id_avatar_casado int unsigned,
foreign key (id_avatar_casa) references avatar(id),
foreign key (id_avatar_casado) references avatar(id)

);




