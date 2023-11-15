drop database if exists estudio_bara;
create database if not exists estudio_bara;
use estudio_bara;

create table becarios(
id int unsigned primary key auto_increment,
nombre varchar(20),
apellido varchar(20),
especialidad varchar(20),
direccion_de_correo varchar(20),
tiempo_de_beca_restante time
);
create table baño(
id int unsigned primary key auto_increment,
codigo_picina tinyint not null,
temperatura_del_agua tinyint,
temperatura_ambiente tinyint,
fecha date,
salinidad tinyint
);
create table baño_becarios(
id_becarios int unsigned,
id_baño int unsigned,
foreign key (id_becarios)references becario(id),
foreign key (id_baño) references baño(id),
primary key(id_becarios,id_baño)
);
create table doctores(
id int unsigned primary key auto_increment,
titulos_de_los_articulos varchar(50),
años_de_experiencia tinyint
);
create table informes(
id int unsigned primary key auto_increment,
conclusiones varchar(100),
nivel_de_felicidad tinyint not null,
observaciones_relevantes varchar(30),
id_baños int unsigned,
id_doctores int unsigned,
foreign key(id_baños) references baños(id),
foreign key ( id_doctores) references doctores(id)
);
create table capibaras(
id int unsigned primary key auto_increment,
sexo varchar(20),
edad tinyint unsigned,
nombre varchar(20),
peso tinyint unsigned
);
create table capibaras_baño(
id_baño int unsigned,
id_capibaras int unsigned,
foreign key(id_baño) references baño(id),
foreign key (id_capibaras) references capibaras(id),
primary key (id_baño,id_capibaras)
);
create table capibaras_capibaras(
id_capibaras_desendiente int unsigned,
id_capibaras_asendiente int unsigned,
foreign key(id_capibaras_desendiente) references capibaras(id),
foreign key (id_capibaras_asendiente) references capibaras(id),
primary key(id_capibaras,id_capibaras)
);
create table lote_de_frutas(
id int unsigned primary key auto_increment,
peso_total int unsigned
);
create table citricos(
id int unsigned primary key auto_increment,
tipo varchar(29),
cantidad tinyint unsigned,
nombre varchar(20),
color varchar(20),
peso_unidad float unsigned
);
create table citricos_lote_de_frutas(
id_citricos int unsigned,
id_lote_de_frutas int unsigned,
foreign key(id_citricos) references citricos(id),
foreign key (id_lote_de_frutas) references lote_de_frutas(id),
primary key(id_citricos,id_lote_de_frutas)
);
create table proveedores(
id int unsigned primary key auto_increment,
nombre varchar(20),
telefono varchar(20),
calle varchar(20),
numero tinyint unsigned,
codigo_postal int unsigned
);
create table proveedores_lote_de_frutas(
id_proveedores int unsigned,
lote_de_frutas int unsigned,
foreign key(id_proveedores) references proveedores(id),
foreign key (id_lote_de_frutas) references lote_de_frutas(id),
primary key(id_proveedores,id_lote_de_frutas)
);






