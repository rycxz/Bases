drop database if exists Examen;
create database if not exists Examen;
use Examen;

create table clan(
id int unsigned primary key auto_increment,
nombre varchar(30) not null unique,
descripcion varchar(50)
);

create table vampiro(
id int unsigned primary key auto_increment,
id_clan int unsigned,
nombre varchar(30) not null,
edad tinyint unsigned,
generacion char(12),
telefono char(9)
);

create table mortal (
id int unsigned primary key auto_increment,
nombre varchar(30) not null,
edad tinyint unsigned,
grupo_sanguineo varchar(5),
aliado tinyint(1) unsigned,
altura float,
peso float
);

create table poder (
id int unsigned primary key auto_increment,
id_clan int unsigned,
nombre varchar(30) not null,
descripcion varchar(50)
);

create table territorio(
id int unsigned primary key auto_increment,
id_clan int unsigned,
nombre varchar(30) not null
);

create table vampiro_poder(
id_vampiro int unsigned,
id_poder int unsigned,
foreign key (id_vampiro) references vampiro(id),
foreign key (id_poder) references poder(id)
);

create table vampiro_convierte_vampiro(
id_vampiro_sire int unsigned,
id_vampiro_chiquillo int unsigned,
foreign key (id_vampiro_sire) references vampiro(id),
foreign key (id_vampiro_chiquillo) references vampiro(id),
primary key(id_vampiro_sire,id_vampiro_chiquillo)
);

create table clan_juzga_vampiro(
id_clan int unsigned,
id_vampiro int unsigned,
fecha date,
motivo enum('dejarse ver','matar a otro vampiro','matar a un mortal','amar a un mortal'),
foreign key (id_clan) references clan(id),
foreign key (id_vampiro) references vampiro(id),
primary key(id_clan,id_vampiro)
);

create table vampiro_mortal (
id_vampiro int unsigned,
id_mortal int unsigned,
foreign key (id_vampiro) references vampiro(id),
foreign key (id_mortal) references mortal(id),
primary key(id_mortal,id_vampiro)
);