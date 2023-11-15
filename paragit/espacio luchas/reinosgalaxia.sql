drop database if exists gusano;
create database gusano;
use gusano;

create table cuerpo_espacial(
id int unsigned primary key auto_increment,
nombre varchar(50),
densidad tinyint unsigned,
radio tinyint unsigned,
masa tinyint unsigned,
coordenada_X tinyint unsigned,
coordenada_Y tinyint unsigned,
coordenada_Z tinyint unsigned
);
create table galaxia(
id int unsigned primary key auto_increment,
id_cuerpo_espacial int unsigned,
n_estrellas varchar(50),
foreign key (id_cuerpo_espacial) references cuerpo_espacial(id)
);
create table estrella(
id int unsigned primary key auto_increment,
id_cuerpo_espacial int unsigned,
id_galaxia int unsigned,
tipo varchar(50),
luminosidad int unsigned,
temperatura int,
foreign key (id_cuerpo_espacial) references cuerpo_espacial(id),
foreign key (id_galaxia) references galaxia(id)
);
create table especie(
id int unsigned primary key auto_increment,
nombre  varchar(50) not null,
reino varchar(50),
familia varchar(50),
clase varchar(50),
tipo_alimentacion varchar(50),
n_ejemplares int unsigned
);
create table persona(
id int unsigned primary key auto_increment,
id_especie int unsigned,
id_cuerpo_espacial int unsigned,
nombre varchar(20),
edad tinyint,
foreign key (id_especie) references especie(id),
foreign key (id_cuerpo_espacial) references cuerpo_espacial(id)
);
create table persona_dr_red(
id int unsigned primary key auto_increment,
id_persona int unsigned,
dreccion varchar(20),
foreign key (id_persona) references persona(id)
);
create table coalicion(
id int unsigned primary key auto_increment,
nombre varchar(20),
valores varchar(20)
);
create table nave(
id int unsigned primary key auto_increment,
id_cuerpo_espacial int unsigned,
id_coalicion int unsigned,
nombre varchar(20),
n_tripulantes tinyint unsigned,
capacidad tinyint unsigned,
tipo varchar(20),
foreign key (id_cuerpo_espacial) references cuerpo_espacial(id),
foreign key (id_coalicion) references coalicion(id)
);
create table tripulante(
id int unsigned primary key auto_increment,
id_nave int unsigned,
id_persona int unsigned,
cargo varchar(20),
fecha_entrada date,
fecha_fin date,
foreign key (id_nave) references nave(id),
foreign key (id_persona) references persona(id)
);
create table cuerpo_espacial_especie(
id int unsigned primary key auto_increment,
id_cuerpo_espacial int unsigned,
id_especie int unsigned,
foreign key (id_cuerpo_espacial) references cuerpo_espacial(id),
foreign key (id_especie) references especie(id)
);
create table cuerpo_espaciaL_orbita(
id_cuerpo_espacial_orbitador int unsigned,
id_cuerpo_espacial_orbitado int unsigned,
foreign key (id_cuerpo_espacial_orbitador) references cuerpo_espacial(id),
foreign key (id_cuerpo_espacial_orbitado) references cuerpo_espacial(id),
primary key(id_cuerpo_espacial_orbitador,id_cuerpo_espacial_orbitado)
);
create table cuerpo_espacial_coalicion(
id_cuerpo_espacial int unsigned,
id_coalicion int unsigned,
foreign key (id_cuerpo_espacial) references cuerpo_espacial(id),
foreign key (id_coalicion) references coalicion(id),
primary key(id_cuerpo_espacial,id_coalicion)
);



