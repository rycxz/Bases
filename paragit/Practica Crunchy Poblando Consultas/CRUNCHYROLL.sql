drop database if exists crunchy;
create database if not exists crunchy;
use crunchy;

CREATE USER IF NOT EXISTS  'administrador'@'localhost' IDENTIFIED BY 'administrador';
GRANT ALL PRIVILEGES ON crunchy.* TO 'administrador'@'localhost' WITH GRANT OPTION;


create table plan_mensual(
id int unsigned primary key auto_increment,
anuncios tinyint(1),
descargas varchar(999),
fecha_final date,
fecha_inicio date,
precios tinyint unsigned,
acceso_anticipado tinyint (1) unsigned,
descuento_en_tienda tinyint,
preview tinyint (1) unsigned
); 

CREATE TABLE fan (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_plan_mensual INT UNSIGNED,
    episodios_diarios TINYINT
);




create table mega_fan(
id int unsigned primary key auto_increment,
id_plan_mensual int unsigned,
avatar varchar(20) 
);

create table super_fan(
id int unsigned primary key auto_increment,
id_plan_mensual int unsigned,
/*le agregamos que  pueda ver en mas plataformas y que tenga acceso a la platofrma de juegos */
dispositivos_simultaneos tinyint unsigned,
games tinyint (1) unsigned
);



create table usuario(
id int unsigned primary key auto_increment,
id_plan_mensual int unsigned,
nickname varchar(20),
correo varchar (50),
episodios_vistos int unsigned,
contraseña varchar(20),
estado_animo enum ('feliz', 'triste', 'enfadado','aburrido'),
numero_de_cuenta_bancaria varchar(50) not null,
tiempo_de_uso int unsigned,
direccion varchar (50)
);

create table plan_menusal_usuario(
id_plan_mensual  int unsigned,
id_usuario  int unsigned,
foreign key ( id_plan_mensual) references plan_mensual(id),
foreign key ( id_usuario) references usuario(id),
primary key(id_plan_mensual, id_usuario)
);
create table usuario_comparte_plan_mensual(
id_plan_mensual  int unsigned,
id_usuario_paga  int unsigned,
id_usuario_ratea  int unsigned,
foreign key ( id_plan_mensual) references plan_mensual(id),
foreign key ( id_usuario_paga) references usuario(id),
foreign key ( id_usuario_ratea) references usuario(id),
primary key(id_plan_mensual, id_usuario_paga,id_usuario_ratea)
);


create table metodo_de_pago(
id int unsigned primary key auto_increment,
id_plan_mensual int unsigned,
factura varchar(30),
numero_de_cuenta_bancaria varchar(30)
);

create table banco(
id int unsigned primary key auto_increment,
id_metodo_de_pago int unsigned,
banco varchar(50)
);

create table tarjeta(
id int unsigned primary key auto_increment,
id_metodo_de_pago int unsigned,
numero_asociado varchar(50),
fecha_de_expiracion date
);

create table transferencia(
id int unsigned primary key auto_increment,
id_metodo_de_pago int unsigned,
tiempo_que_tarda int unsigned
);

create table bizum(
id int unsigned primary key auto_increment,
id_metodo_de_pago int unsigned,
numero_de_telefono int unsigned
);

 create table usuario_usuario(
 id_usuario_agregado int unsigned,
  id_usuario_agrega int unsigned,
  apodo varchar(30),
  foreign key(id_usuario_agregado) references usuario(id),
  foreign key(id_usuario_agrega) references usuario(id),
  primary key(id_usuario_agregado,id_usuario_agrega)
  );
  
  create table imagen_de_perfil(
  id int unsigned primary key auto_increment,
  id_usuario int unsigned,
  imagen_de_perfil varchar(50)
  );
  
  create table lista(
    id int unsigned primary key auto_increment,
    id_usuario int unsigned,
    fecha_de_creacion datetime,
    nombre varchar(40)
    );
    
create table genero(
	id int unsigned primary key auto_increment,
	id_usuario int unsigned,
	animes_mangas_vistos varchar(200),
	mas_vistos varchar(200),
	breve_descripcion varchar(200),
	mas_gustados varchar(200)
	);
    
    create table anime (
     id int unsigned primary key auto_increment,
     id_genero int unsigned,
     compañia_animadora varchar(40),
     mas_gustados varchar(90),
     mas_vistos varchar(90),
     nombre varchar(40)
     );
     
     create table lista_anime(
       id int unsigned primary key auto_increment,
       id_lista int unsigned,
       id_anime int unsigned
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
         nombre varchar(50),
         mangaka varchar(50),
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
         id_mangas int unsigned,
         subtitulos tinyint(1) unsigned
         );
         
         create table idiomas(
         id int unsigned primary key auto_increment,
		 id_mangas int unsigned,
         idioma varchar(50)
         );
         
         create table traduccion_manga(
         id_manga int unsigned,
         id_traduccion int unsigned
         );
         
         create table personaje(
         id int unsigned primary key auto_increment,
         id_manga int unsigned,
         nombre varchar(40) unique,
         numero_de_seguidores int unsigned,
         estatura float unsigned,
         sexo varchar(10)
         );
         
         create table compañia_de_envio(
         id int unsigned primary key auto_increment,
         codigo_rastreo varchar(50),
		 indicaciones_del_usuario varchar(80),
         metodo varchar(80),
         codigo_del_paquete varchar(50),
         estado_del_trafico enum('libre', 'concurrido','atasco'),
         tiempo_estimado_de_entrega/*en dias*/int unsigned,
		destino varchar(70),
         nombre varchar(70),
         nombre_del_repartidor varchar(70)
         );
         
         create table producto(
         id int unsigned primary key auto_increment,
         id_compañia_de_envio int unsigned,
         id_personaje int unsigned ,
         id_usuario int unsigned,
		nº_de_factura varchar(60) not null,
		categoria varchar(30),
		precio int unsigned,
         tamaño varchar(20),
         peso int unsigned
         );
         
         create table color(
          id int unsigned primary key auto_increment,
          id_producto int unsigned,
          color varchar(20)
          );
          create table usuario_personaje(
id_usuario int references usuario,
id_personaje int references personaje,
primary key(id_usuario,id_personaje));

         
         
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (0,"0","AstralExplorer98","quantummind@email.com",77,"RPP97VX","aburrido","IE56UXUO69013763138156",419,"P.O. Box 317, 4439 Fermentum St."),
  (150,"0","QuantumQuasar","celestialcomet@email.com",280,"NWH46GF","triste","AL16484523221884179672219074",920,"Ap #909-641 Ut, Rd."),
  (2,"0","ZenithHarmony55","lunarlionheart@email.com",934,"SUI50UN","enfadado","GE05553117715583351624",629,"Ap #595-5066 Erat Street"),
  (3,"2","QuantumQuintessence","thunderthunder@email.com",708,"QUM53UX","triste","BG33XCPP20100522731151",680,"352-6626 Eu St."),
  (4,"1","StardustNomad","shadowseeker@email.com",482,"CEW50JM","triste","VG8539744635006385229522",413,"Ap #123-3107 Lacinia Rd."),
  (5,"2","QuantumQuasar","celestialcipher@email.com",917,"PHG02KH","enfadado","IT025YZJTI75658972020445247",384,"Ap #109-5171 Lobortis, Av."),
  (6,"1","NebulaSeeker99","frostyfable@email.com",874,"MRV33BE","feliz","SM8219385697185704337562934",861,"1597 Ridiculus Road"),
  (7,"0","EmberSpectacle","frostyflannel@email.com",34,"BJD99SB","triste","MD2957249566952613376160",843,"532-2843 Vivamus Street"),
  (8,"2","LunarLore","frostyfable@email.com",571,"ROR12MW","aburrido","VG9579827812001702668759",334,"598-9393 Ipsum Av."),
  (9,"2","StarlightStrider","nebulanebula@email.com",6,"PFJ16WT","feliz","CZ6587566333622305760929",727,"Ap #166-2729 Vitae Ave");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (10,"2","BlazeBuccaneer","stellarscribe@email.com",154,"OCC45WX","enfadado","IE97BVYC83478863449767",248,"P.O. Box 291, 4738 Neque St."),
  (11,"0","ZenithHarmony","emberenchant@email.com",202,"AYW16EK","aburrido","FR9822448665844325454237985",427,"680-6356 Vivamus St."),
  (12,"2","WhisperingWander","quantumexplorer@email.com",779,"DGN17SM","aburrido","SE9857880281549384434340",304,"Ap #497-1719 Ipsum Rd."),
  (13,"2","ThunderThief","thunderstorm@email.com",548,"EMB33AR","enfadado","AD7123398666556468624862",368,"356-5112 Vitae, Rd."),
  (14,"2","SerenityWhisper5","nebulanebula@email.com",888,"TTC66CZ","triste","LB09912236347762767417408719",366,"Ap #753-5761 Tincidunt, Avenue"),
  (15,"2","ZenFusion","thunderthunder@email.com",193,"KFO73NT","enfadado","PS136968131235518554229782275",791,"8922 Egestas. Rd."),
  (16,"0","WhisperingWander","nebulanebula@email.com",375,"QMO41CX","feliz","EE987354823730433341",573,"703-4096 Orci Av."),
  (17,"0","ShadowSeeker","thunderstorm@email.com",226,"FXD96RD","triste","HU20858867917907625375018467",76,"P.O. Box 750, 8482 Id Av."),
  (18,"0","EchoEnigma","quantumscholar@email.com",489,"WME10AP","feliz","MK21478661528512195",944,"2752 Rutrum Road"),
  (19,"2","ThunderTempest","thunderthunder@email.com",308,"MHU26KJ","enfadado","MK70944278435293153",193,"200-462 Lectus Ave");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (20,"2","WhisperingWhiz","stellarsculptor@email.com",870,"ICI06XR","triste","HU62212287661146656716466051",524,"Ap #967-4507 Semper Avenue"),
  (21,"2","CelestialCorsair","lunartraveler@email.com",363,"QST53EP","aburrido","TN6038678544269748548972",522,"Ap #824-9851 Scelerisque Road"),
  (22,"2","ShadowWalker","emberenigma@email.com",730,"CBN96AB","enfadado","PL44887097570720162764147266",136,"656-9873 Bibendum. Road"),
  (23,"1","InfernoRogue","whisperingwind@email.com",293,"KXM87AN","feliz","AZ86424816435520019744263143",692,"950-8090 Proin Road"),
  (24,"2","NebulaNest","lunartraveler@email.com",404,"BVB48FJ","aburrido","TN0858727457494116292258",91,"997-6656 Elit Rd."),
  (25,"1","FrostyFeline","celestialcomet@email.com",842,"VLQ27HZ","enfadado","MK62923184452954356",809,"3787 Congue, Avenue"),
  (26,"2","CrimsonCipher27","thunderstorm@email.com",737,"WXX68BR","triste","HU48384120246473032564452897",172,"P.O. Box 851, 7158 Rutrum St."),
  (27,"1","FrostyFlannel","nebularhythm@email.com",126,"XVK86TI","feliz","DE58362424453758220253",328,"Ap #344-9682 Sapien Av."),
  (28,"0","AstralExplorer98","frostyfable@email.com",23,"FBM04RZ","enfadado","RS72262621118844471925",679,"495-2161 Duis Street"),
  (29,"2","CelestialCipher","shadowseeker@email.com",177,"GXP26OX","feliz","ES0863365847869313217113",439,"Ap #661-521 Diam St.");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (30,"0","LunarLionheart","nebulanebula@email.com",935,"KTG12SB","feliz","SI32530545481160957",65,"Ap #143-1658 Eget Rd."),
  (31,"1","SapphireScribe47","quantummind@email.com",528,"OUQ42JS","feliz","GE21883644332567778617",45,"980-1603 Feugiat Ave"),
  (32,"0","QuantumQuasar","stellarscribe@email.com",232,"LEM71GJ","triste","IS512544301389111414176888",494,"3185 Nullam Street"),
  (33,"2","InfernoRogue","quantummind@email.com",403,"UMM82BK","enfadado","RO68XKDT9664805750046145",73,"1538 Mi Rd."),
  (34,"2","EchoEngineer","thunderthunder@email.com",808,"FDX91UE","triste","CH4576380528219842461",820,"Ap #888-8897 Quam. Rd."),
  (35,"2","LunaLuminary30","thunderthunder@email.com",942,"GUP68ZD","aburrido","DO05235347324713568155669511",957,"Ap #773-3290 Donec Rd."),
  (36,"2","ThunderTempest26","nebulanebula@email.com",316,"MWL24OP","feliz","SI29152337355621841",106,"158-2534 Ac Avenue"),
  (37,"0","WhisperingWhiz","celestialvoyager@email.com",646,"VLT85TW","aburrido","AL31037457127612333508282151",424,"Ap #666-7520 Cursus Rd."),
  (38,"2","BlazeBuccaneer","celestialcipher@email.com",983,"BMW11GI","enfadado","GB13YYRP54564368283460",376,"8789 Tempor Rd."),
  (39,"0","FrostyFusion","celestialcomet@email.com",309,"GBY28TG","aburrido","HR5677889868836761494",661,"Ap #765-7811 Venenatis Street");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (40,"1","LunarLuminary","nebulanebula@email.com",522,"OMK06ZK","triste","PL41272632726227521352388663",611,"Ap #188-3640 Non, Av."),
  (41,"2","EternalFlame88","nebularaider@email.com",97,"QYD83IV","triste","LV11ELAY5731169780209",294,"9307 Id Road"),
  (42,"2","FrostyFugitive","phantomflame@email.com",448,"PTN42EN","feliz","FO0323520667645674",757,"Ap #162-5309 Mi Road"),
  (43,"2","CelestialCatalyst","shadowstealth@email.com",50,"BXC25DR","aburrido","FR3575986454109692757266209",837,"Ap #409-4129 Dis Street"),
  (44,"0","MysticMarauder","phantomflame@email.com",537,"RPW48GM","feliz","IL756463721206552376332",387,"Ap #364-3001 Commodo St."),
  (45,"0","ThunderTempest","emberenchant@email.com",15,"FWM18GJ","aburrido","DO61205516428430742652231616",680,"P.O. Box 651, 8517 Malesuada Rd."),
  (46,"1","NovaNavigator","starlightshifter@email.com",38,"LTR08TX","feliz","RO69ZSRL8382265687598772",783,"Ap #846-8193 Sed, St."),
  (47,"1","NebulaNinja","mysticmarauder@email.com",581,"BBO42NU","feliz","DE52563866158643872621",344,"476-4745 Turpis St."),
  (48,"0","StarlightSlinger","quantumquasar@email.com",585,"KWT00EU","aburrido","MD7582858244104384492556",694,"Ap #703-4720 Quis Ave"),
  (49,"0","EmberEmber","quantummind@email.com",242,"LHA80VO","enfadado","AD8026155542733758682331",834,"350-5519 Ipsum Street");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (50,"1","BlazeMaverick","shadowseeker@email.com",554,"FYT61IH","triste","BH73136689331212463614",318,"Ap #537-8807 Non, Avenue"),
  (51,"2","ThunderTorrent38","mysticmentor@email.com",974,"IVG00MA","enfadado","BG25LSML53812341882155",783,"529-8407 Dolor. Av."),
  (52,"2","EchoEnigma","nebulanebula@email.com",433,"WPZ58PF","triste","ES8651417694561486892920",410,"P.O. Box 618, 8174 Diam. St."),
  (53,"0","PhoenixRising","stellarscribe@email.com",494,"TQH17EV","feliz","PK5106082364272085844158",295,"4445 Placerat St."),
  (54,"2","EmberSpectacle","stellarscribe@email.com",570,"XBQ10QH","feliz","DE18124212119284757645",596,"450-6647 Risus Avenue"),
  (55,"1","ThunderStriker61","echonavigator@email.com",61,"NNU25ZD","triste","LV41GJIK1582216777544",384,"360-6748 Enim. Road"),
  (56,"1","BlazeMaverick","thunderthunder@email.com",292,"SIR43NH","aburrido","AE533204428268016625888",425,"639-5312 Ullamcorper Road"),
  (57,"2","NebulaNinja","quantummind@email.com",713,"HXC79XY","triste","GR8667824458884785205535134",614,"Ap #754-1009 Magna. St."),
  (58,"2","EchoEnvoy","quantumspectre@email.com",23,"YXY83MN","triste","SK9711154286382236735526",778,"Ap #616-8364 Libero Rd."),
  (59,"1","NebulaNectar","celestialcomet@email.com",559,"UDF13UB","aburrido","HR4164674423719725816",563,"Ap #125-7929 Aliquam Street");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (60,"0","QuantumQuest","thunderthunder@email.com",369,"VTB77ZP","aburrido","GI43IMJA816860914478364",851,"5859 Consequat Street"),
  (61,"2","WhisperingWhiz","shadowshaper@email.com",986,"JVG90BR","feliz","SA6250542446243340978664",638,"P.O. Box 894, 7664 Suscipit, Ave"),
  (62,"1","NebulaNomad52","frostyfable@email.com",12,"TIV34KJ","triste","MC1423551538484584267056495",564,"176-884 Ipsum Av."),
  (63,"1","FrostyFerret","shadowseeker@email.com",315,"DVI97CG","feliz","SE5095459545124788738123",559,"Ap #969-3834 Sed Ave"),
  (64,"2","QuantumQuasar","celestialcomet@email.com",909,"CXN55TP","enfadado","BE92685654685771",403,"8425 Nulla. Av."),
  (65,"2","QuantumQuest","shadowseeker@email.com",942,"FXV82FF","aburrido","CY26568638984875158291587186",142,"7846 Ridiculus St."),
  (66,"1","StarlightStrider","stellarscribe@email.com",89,"NFO28XX","aburrido","DK6936449759365722",278,"Ap #532-1508 Magnis St."),
  (67,"0","EchoExplorer","mysticdreamer@email.com",766,"RFZ66VM","feliz","LU944517579485577312",868,"6181 Ac Ave"),
  (68,"2","ShadowWalker","thunderthunder@email.com",476,"IPY24OW","triste","SM7541402992571641362878517",922,"Ap #215-5835 Ac Ave"),
  (69,"0","PhoenixRising","thunderstorm@email.com",289,"OPA76UY","feliz","SK7914533137953976354747",351,"6697 Consectetuer, Road");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (70,"1","QuantumQuasar","celestialvoyager@email.com",907,"TEN47EC","feliz","TN3113414143935857478328",225,"Ap #428-6951 Suspendisse Ave"),
  (71,"2","StarlightStrider","celestialcomet@email.com",285,"VKE32DY","enfadado","CH7423247785750854671",788,"608-4738 A, Avenue"),
  (72,"0","FrostyFable","celestialvoyager@email.com",130,"LPG84UB","aburrido","VG0455445832615503716773",903,"Ap #677-6122 Sed Avenue"),
  (73,"1","NebulaNomad","stellarscribe@email.com",694,"LNP14IY","enfadado","IE94JPUB99604877875290",309,"578 Ligula. Rd."),
  (74,"2","CelestialComet","thunderthief@email.com",777,"BXO62QB","feliz","MU1162748730618152815456396443",453,"P.O. Box 680, 3691 Purus. Road"),
  (75,"2","StardustNomad66","lunarlionheart@email.com",742,"AEH41RN","feliz","LU112611715641398423",292,"272-3969 Nunc Road"),
  (76,"1","FrostyFable","quantummind@email.com",217,"HRP54CK","triste","MT68PFOC16866674358031163300420",492,"323-1327 Convallis Rd."),
  (77,"2","AstralExplorer","celestialcomet@email.com",500,"QXY61IB","aburrido","HR4428211836886487153",114,"8995 Nec Av."),
  (78,"0","LunarLionheart80","quantummind@email.com",965,"LOP90TK","triste","AD2296263212805557638123",961,"Ap #470-3753 Enim, Ave"),
  (79,"1","StardustNomad66","emberenchant@email.com",843,"BEA67UJ","triste","PS172817349938675316627182262",302,"Ap #837-534 Dolor Street");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (80,"1","EmberSorcerer","emberambassador@email.com",468,"YQQ52NS","enfadado","SK5445129429633373882147",781,"P.O. Box 369, 296 Ac Street"),
  (81,"2","CelestialVoyage","nebulanebula@email.com",172,"EWW25BH","enfadado","FR2009175182820210392598127",646,"Ap #475-9963 Nonummy Avenue"),
  (82,"2","FrostyFlannel7","quantummind@email.com",927,"NJN62LJ","enfadado","AD2361747052721337717037",226,"1911 Nunc Ave"),
  (83,"2","SapphireScribe47","blazingcoder@email.com",999,"EBQ43LY","aburrido","GR0411023527768196518783232",494,"Ap #518-3463 Sit Av."),
  (84,"2","SolarSorcerer","nebulanebula@email.com",342,"TJU61PE","triste","RO81ISZL4203233300083884",274,"9336 Fusce Rd."),
  (85,"2","SolarSpectre","nebulanebula@email.com",134,"TKG62HD","feliz","CH9248653768621722717",945,"Ap #973-4859 Risus Rd."),
  (86,"1","StarSeeker","nebulanebula@email.com",364,"GKI28TZ","enfadado","MC8634346861803292997768943",119,"1981 Donec Road"),
  (87,"2","StarSeeker","stellarseeker@email.com",975,"GIL26IG","feliz","HR3072483476540165644",719,"258-9307 Lorem Street"),
  (88,"2","StarlightSeeker","lunarlionheart@email.com",70,"BEZ71GX","triste","MK15021916425662445",50,"999-2288 Interdum Rd."),
  (89,"2","ThunderStriker61","frostyflannel@email.com",163,"JFW30YY","triste","GR6026323645644463074072187",35,"877-4677 Turpis St.");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (90,"0","CelestialChalice","blazebravo@email.com",937,"WOZ56ZV","aburrido","RO96BDXW5272198415736824",833,"P.O. Box 765, 7474 Non Avenue"),
  (91,"2","CelestialCrafter","thunderstorm@email.com",485,"LTM28BB","aburrido","MC9343571524616265168383705",621,"Ap #517-471 Feugiat Rd."),
  (92,"1","CelestialComet","thunderstruck@email.com",993,"NRJ03UZ","feliz","BH88665138570873756851",871,"549-7390 Aliquam Rd."),
  (93,"2","ThunderTempest","lunarlionheart@email.com",354,"QJO26HL","feliz","BA411574179057415324",833,"954-101 In Street"),
  (94,"0","SapphireScribe","whisperingwind@email.com",514,"XUS16HL","enfadado","SI50711804325184528",875,"642-7001 Eget Avenue"),
  (95,"2","SapphireScribe","stellarscribe@email.com",974,"HLT07YC","feliz","ME43575958716285767348",312,"573-8137 Feugiat Av."),
  (96,"1","PhoenixRising","emberenchant@email.com",819,"YPP76YH","triste","SE0821823045875449514216",775,"649-8971 Tincidunt, Rd."),
  (97,"1","CelestialChampion","thunderthunder@email.com",420,"HSR72PC","feliz","GL3613124386439845",218,"291-6739 Nec, Ave"),
  (98,"2","WhisperingWhiz11","echovoyager@email.com",420,"XUL64YB","triste","ME85594872239715154718",1,"P.O. Box 726, 7455 Odio Avenue"),
  (99,"2","ThunderTwister","quantummind@email.com",411,"YSY77TS","enfadado","SI85354350143245378",287,"210-7793 Arcu Avenue");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (100,"2","QuantumPetal","thunderstorm@email.com",49,"XHM68FW","aburrido","TN5551855453297325948488",640,"Ap #370-1829 Vestibulum Street"),
  (101,"2","LunarLionheart80","enchantedmind@email.com",545,"JMP53GA","feliz","FI5116246783154543",496,"Ap #202-2938 Phasellus Rd."),
  (102,"1","SerenityWhisper5","celestialcomet@email.com",793,"JIG53UK","enfadado","KZ583716945663785922",224,"343-886 Cursus Road"),
  (103,"0","PhoenixRising","stellarscribe@email.com",266,"CLF58AS","enfadado","AD4292148721313613258155",526,"P.O. Box 341, 7650 Turpis Av."),
  (104,"1","SerenityWhisper","celestialcomet@email.com",29,"DTC54GQ","triste","RO07ODPZ3233862686888575",281,"7729 Pede Av."),
  (105,"2","ThunderThief","thunderthunder@email.com",806,"GHN43VC","aburrido","LI2786185753133694701",53,"Ap #734-2409 Egestas Street"),
  (106,"0","EmberEnchant72","frostyfable@email.com",289,"SLW65MP","triste","KW5561880678991193190482697415",194,"992-8404 Neque. Rd."),
  (107,"0","FrostyFeline","lunarlionheart@email.com",186,"RRF47TJ","aburrido","CZ3118744540336881332117",527,"726-1401 Eu, Ave"),
  (108,"0","QuantumQuill48","echovoyager@email.com",14,"FTG26ES","triste","SK1389039641439479242258",35,"P.O. Box 442, 6764 Arcu. Ave"),
  (109,"0","QuantumQuasar","stellarscribe@email.com",288,"NBO26II","enfadado","PK3063847312655572181231",807,"Ap #947-2522 Pharetra. Av.");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (110,"1","EmberSpectacle","blazebravo@email.com",495,"ZCU15CH","enfadado","CR9412129332665469784",911,"P.O. Box 482, 179 Quisque St."),
  (111,"1","NovaNomad","celestialcomet@email.com",880,"CXU26UJ","triste","NO7111201744517",525,"Ap #354-4146 Aliquet, Ave"),
  (112,"1","MysticMonolith","celestialcomet@email.com",474,"WQH76VX","aburrido","DK0245733426012927",706,"Ap #953-6071 Vulputate, Ave"),
  (113,"2","NebulaNectar51","shadowseeker@email.com",183,"RHI57JO","aburrido","GT30733381965728122834337263",983,"Ap #195-7652 Erat Road"),
  (114,"0","QuantumQuasar19","celestialcipher@email.com",229,"MUL18BO","triste","LU132368674948310619",45,"Ap #397-2938 Lobortis St."),
  (115,"2","NebulaNest","shadowseeker@email.com",918,"WQV06OP","triste","MR2367209468187545347960497",545,"154-6986 Massa. Rd."),
  (116,"0","FrostyFlannel7","quantummind@email.com",716,"GOK58PF","feliz","IL304306744148323793552",86,"Ap #916-6703 Morbi Av."),
  (117,"2","NovaNavigator","frostyfable@email.com",972,"NQD61XV","enfadado","TR571856862260743329344475",339,"697-3810 Pharetra Avenue"),
  (118,"0","FrostyPhantom","nebulanebula@email.com",64,"KGV14AY","aburrido","SM3712221761916868241382829",310,"P.O. Box 897, 6443 Pede Rd."),
  (119,"0","NovaNomad","quantummind@email.com",904,"AAH41IW","aburrido","GI06HXNY736101832355161",339,"564 Sed Rd.");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (120,"0","ThunderTempest","frostyfable@email.com",238,"JNZ65PF","enfadado","MU6284479935256784655059287475",715,"Ap #546-9112 Massa Street"),
  (121,"0","StardustNomad","thunderstorm@email.com",35,"PTL88FY","triste","SK1274434543227323629865",532,"Ap #956-1114 Semper Ave"),
  (122,"1","MysticVigilante","solarspark@email.com",448,"NXK50SH","feliz","PS562068187647286517970135391",236,"Ap #346-7604 Quis Av."),
  (123,"0","StardustNomad","quantumexplorer@email.com",985,"OQS37OK","triste","PK3354246335363659754772",976,"960-3681 Metus. St."),
  (124,"1","MysticMingle22","quantumquasar@email.com",347,"VRX16PG","triste","CR4490669630733869168",644,"Ap #743-5925 Et Avenue"),
  (125,"0","BlazeBuccaneer","nebulanebula@email.com",669,"NKQ27ES","enfadado","MC5073165831762521792643822",115,"879-220 Elit Street"),
  (126,"2","LunarLore","stellarscribe@email.com",739,"BBO47BD","feliz","GR8262969831157950168305777",479,"954-827 Iaculis, Avenue"),
  (127,"0","EternalFlame","mysticmarauder@email.com",807,"NPI12HB","enfadado","MK49173784971653485",526,"Ap #670-5987 Ligula Av."),
  (128,"1","SolarSorcerer","thunderthunder@email.com",590,"JHY10PG","feliz","LU526974136407538249",228,"Ap #325-4434 Sociis Road"),
  (129,"2","WhisperingWander8","stellarscribe@email.com",902,"IDD60DY","feliz","FR3861737363426561071442356",451,"P.O. Box 262, 8470 Adipiscing Street");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (130,"0","NebulaNomad","emberenchant@email.com",708,"EZW39JF","enfadado","AL44915308551194315888568492",445,"408-3067 Egestas. Avenue"),
  (131,"0","ThunderTwister","emberenchant@email.com",990,"IKF60YD","triste","AT622274890178992423",598,"8923 Sed Road"),
  (132,"0","ThunderStriker","stellarscribe@email.com",860,"EVQ17PQ","enfadado","GB20BQLB73213736624283",799,"316-4349 Pede. St."),
  (133,"1","FrostyFlannel","thunderthunder@email.com",550,"FRT45GA","triste","VG8921742681474994864526",485,"Ap #680-3017 In Ave"),
  (134,"1","FrostyFencer","shadowseeker@email.com",831,"IXP43QZ","feliz","RS51844736432511564778",386,"Ap #469-5252 Lacus. St."),
  (135,"0","QuantumPetal","thunderthunder@email.com",798,"YYN75EH","aburrido","PK9872751885266155434471",393,"381-5133 Et Road"),
  (136,"1","CelestialCitadel","celestialcomet@email.com",125,"JNH12YP","aburrido","DO91359885475786215415409735",571,"5944 Risus Street"),
  (137,"2","LunarLullaby83","shadowseeker@email.com",667,"CMH38LX","feliz","MD7452927867905918445915",228,"Ap #877-7982 Tellus Street"),
  (138,"0","LunarLabyrinth","enchantedmind@email.com",261,"OIQ90MY","triste","BA727942724181975618",362,"688-7126 Mauris Rd."),
  (139,"2","SolarScribe","quantummind@email.com",824,"NAV03MQ","triste","SA6613717876871155666784",18,"998-2028 Duis St.");
INSERT INTO `usuario` (`id`,`id_plan_mensual`,`nickname`,`correo`,`episodios_vistos`,`contraseña`,`estado_animo`,`numero_de_cuenta_bancaria`,`tiempo_de_uso`,`direccion`)
VALUES
  (140,"0","ThunderTempest","thunderthunder@email.com",978,"DCH82AA","triste","AL14143313519036518515703888",930,"P.O. Box 710, 9146 Nisi Av."),
  (141,"2","LunarLantern","shadowseeker@email.com",742,"ODP42BY","triste","PL54595812452974784644493734",519,"696-4133 Duis Road"),
  (142,"2","MysticVigilante","nebularaider@email.com",106,"RKH65DD","feliz","PL16185685056336573562386016",576,"7613 Proin St."),
  (143,"1","CelestialChampion40","emberenchant@email.com",637,"IAW68NL","enfadado","NL38NKTI6341331676",940,"P.O. Box 499, 7205 Purus, St."),
  (144,"2","NebulaNomad","lunarlionheart@email.com",393,"VBG78YM","feliz","BE68337144849254",206,"Ap #899-8033 Quis Av."),
  (145,"2","QuantumRealm42","quantumspectre@email.com",157,"RIV87QD","aburrido","MR8136988169951842739360112",969,"983-4453 Justo St."),
  (146,"1","FrostyFerret","frostyphoenix@email.com",643,"HLT17NL","enfadado","GT40188572851858822385873376",805,"Ap #104-6252 Justo. Street"),
  (147,"2","EmberSorcerer13","frostyartist@email.com",391,"KPR25OO","aburrido","MT97NCSF25291152113181466882042",534,"699 Dolor Rd."),
  (148,"1","AstralExplorer","nebulanebula@email.com",440,"FMQ41FE","triste","TR043482823130837437515586",596,"Ap #265-6558 Aliquam St."),
  (149,"2","FrostyFugitive","emberengine@email.com",559,"GRX81RB","aburrido","RO42CKBX7127518114348870",39,"Ap #978-8573 Dolor Avenue");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (0,"0","Serial_Experiments_Lain Ranma_½ Parasyte:_The_Maxim Violet_Evergarden Food_Wars! Your_Lie_in_April","2013-05-20","2024-02-28","12.99","1","10","1"),
  (150,"1","KonoSuba:_God's_Blessing_on_This_Wonderful_World! Outlaw_Star Space_Dandy JoJo's_Bizarre_Adventure Erased Toradora!","2023-04-07","2021-02-20","12.99","0","6","0"),
  (2,"0","Hellsing Claymore Great_Teacher_Onizuka Mobile_Suit_Gundam Steins;Gate Akame_ga_Kill Noragami KonoSuba:_God's_Blessing_on_This_Wonderful_World! Outlaw_Star Space_Dandy","2014-10-25","2020-10-28","12.99","0","6","0"),
  (3,"0","Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable Erased:Re: Log_Horizon:_Entaku_Houkai Toradora!_Christmas_Club Serial_Experiments_Lain:_Layer_05:_Distortion Ranma_½:_The_Movie_2:_Nihao,_My_Concubine","2017-06-20","2018-08-17","0.00","0","6","0"),
  (4,"1","Space_Dandy:_The_Search_for_a_Neutral_Planet JoJo's_Bizarre_Adventure:_Golden_Wind Erased:_The_Town_Where_Only_I_Am_Missing Log_Horizon:_Destruction_of_the_Round_Table Toradora!_SOS! Serial_Experiments_Lain:_Layer_03:_Psyche Ranma_½:_Big_Trouble_in_Nekonron,_China Parasyte:The_Maxim-_Sensui_Special Violet_Evergarden:_Eternity_and_the_Auto_Memory_Doll","2022-07-12","2014-06-08","12.99","0","4","0"),
  (5,"0","Neon_Genesis_Evangelion:Death&_Rebirth Fullmetal_Alchemist:_Premium_Collection Code_Geass:_Lelouch_of_the_Rebellion_R2 Fairy_Tail:_Dragon_Cry Hunter_x_Hunter:_Phantom_Rouge","2023-05-29","2017-11-07","12.99","1","4","0"),
  (6,"1","Paranoia_Agent Hellsing Claymore Great_Teacher_Onizuka Mobile_Suit_Gundam Steins;Gate Akame_ga_Kill Noragami KonoSuba:_God's_Blessing_on_This_Wonderful_World!","2021-12-09","2011-02-05","0.00","1","10","1"),
  (7,"0","Inuyasha Your_Lie_in_April No_Game_No_Life Neon_Genesis_Evangelion Fullmetal_Alchemist:_Brotherhood Code_Geass:_Lelouch_of_the_Rebellion Fairy_Tail","2012-07-27","2022-11-13","0.00","1","10","1"),
  (8,"0","Food_Wars! Inuyasha Your_Lie_in_April No_Game_No_Life Neon_Genesis_Evangelion Fullmetal_Alchemist:_Brotherhood Code_Geass:_Lelouch_of_the_Rebellion Fairy_Tail","2021-10-22","2024-10-14","0.00","1","6","0"),
  (9,"0","Outlaw_Star:_Remastered Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable Erased:Re: Log_Horizon:_Entaku_Houkai Toradora!_Christmas_Club Serial_Experiments_Lain:_Layer_05:_Distortion Ranma_½:_The_Movie_2:_Nihao,_My_Concubine Parasyte:The_Maxim-_Kiseijuu:_Sei_no_Kakuritsu","2014-07-07","2019-02-01","12.99","0","4","0");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (10,"1","JoJo's_Bizarre_Adventure Erased Log_Horizon","2018-03-25","2014-11-11","12.99","1","4","0"),
  (11,"0","Toradora!_SOS! Serial_Experiments_Lain:_Layer_03:_Psyche Ranma_½:_Big_Trouble_in_Nekonron,_China Parasyte:The_Maxim-_Sensui_Special Violet_Evergarden:_Eternity_and_the_Auto_Memory_Doll Food_Wars!_The_Third_Plate","2022-05-28","2012-04-26","0.00","0","6","0"),
  (12,"1","Tokyo_Ghoul Darling_in_the_Franxx Ghost_in_the_Shell","2022-08-12","2024-09-04","6.99","0","6","1"),
  (13,"1","Neon_Genesis_Evangelion:_The_Beginning","2021-05-11","2024-06-22","6.99","1","4","0"),
  (14,"0","Outlaw_Star Space_Dandy","2024-02-03","2020-02-15","12.99","0","10","1"),
  (15,"1","Dragon_Ball_Z One_Piece Death_Note Fullmetal_Alchemist Attack_on_Titan Neon_Genesis_Evangelion","2013-12-13","2020-02-25","12.99","1","10","0"),
  (16,"0","Fairy_Tail:_Dragon_Cry Hunter_x_Hunter:_Phantom_Rouge My_Hero_Academia:_Heroes_Rising Death_Note:Relight_1-_Visions_of_a_God Dragon_Ball_Z:_Battle_of_Gods One_Piece:_Stampede Cowboy_Bebop:_The_Movie Blue_Exorcist:_The_Movie Noragami:_Noragami_Aragoto_OVA","2011-11-29","2023-03-05","6.99","1","6","0"),
  (17,"1","Naruto Bleach Fairy_Tail:_Final_Series","2018-09-06","2014-04-26","0.00","0","4","0"),
  (18,"0","Fairy_Tail:_Final_Series Psycho-Pass_2 Tokyo_Ghoul:re Neon_Genesis_Evangelion:_The_End_of_Evangelion Code_Geass:_Akito_the_Exiled My_Hero_Academia:_Two_Heroes Dragon_Ball_Super Naruto_the_Movie:_Ninja_Clash_in_the_Land_of_Snow Fullmetal_Alchemist:_The_Sacred_Star_of_Milos","2022-01-04","2019-02-25","0.00","1","4","1"),
  (19,"0","No_Game_No_Life Neon_Genesis_Evangelion Fullmetal_Alchemist:_Brotherhood Code_Geass:_Lelouch_of_the_Rebellion Fairy_Tail Hunter_x_Hunter My_Hero_Academia","2020-02-15","2012-09-20","0.00","0","6","1");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (20,"0","One_Punch_Man Tokyo_Ghoul","2013-06-02","2016-05-18","12.99","0","6","1"),
  (21,"1","Erased Log_Horizon","2011-05-07","2013-10-04","0.00","0","6","1"),
  (22,"1","Steins;Gate Sword_Art_Online Black_Clover Haikyuu!! One_Piece Cowboy_Bebop Blue_Exorcist","2021-04-24","2011-02-15","6.99","0","10","1"),
  (23,"1","Noragami KonoSuba:_God's_Blessing_on_This_Wonderful_World! Outlaw_Star Space_Dandy JoJo's_Bizarre_Adventure Erased Toradora! Log_Horizon Serial_Experiments_Lain","2021-05-30","2013-07-28","12.99","1","10","0"),
  (24,"1","One_Piece Cowboy_Bebop Blue_Exorcist","2011-09-19","2013-03-06","0.00","0","6","1"),
  (25,"0","Demon_Slayer Psycho-Pass Assassination_Classroom Neon_Genesis_Evangelion Hellsing","2017-05-19","2018-08-10","0.00","0","6","1"),
  (26,"1","Demon_Slayer Black_Clover","2011-04-05","2024-01-23","6.99","0","4","1"),
  (27,"0","Toradora!_SOS! Serial_Experiments_Lain:_Layer_03:_Psyche Ranma_½:_Big_Trouble_in_Nekonron,_China Parasyte:The_Maxim-_Sensui_Special Violet_Evergarden:_Eternity_and_the_Auto_Memory_Doll Food_Wars!_The_Third_Plate Your_Lie_in_April:_From_Me_to_You No_Game_No_Life:_Zero","2013-10-10","2023-09-15","12.99","1","4","0"),
  (28,"0","Code_Geass:_Lelouch_of_the_Rebellion_R2 Fairy_Tail:_Dragon_Cry Hunter_x_Hunter:_Phantom_Rouge My_Hero_Academia:_Heroes_Rising Death_Note:Relight_1-_Visions_of_a_God Dragon_Ball_Z:_Battle_of_Gods One_Piece:_Stampede Cowboy_Bebop:_The_Movie Blue_Exorcist:_The_Movie","2020-06-22","2023-08-20","12.99","1","4","1"),
  (29,"0","Dragon_Ball_Z One_Punch_Man Tokyo_Ghoul Attack_on_Titan Darling_in_the_Franxx","2015-04-20","2017-03-31","12.99","0","6","1");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (30,"0","Ranma_½ Parasyte:_The_Maxim Violet_Evergarden Food_Wars! Your_Lie_in_April No_Game_No_Life","2020-10-31","2013-03-19","6.99","1","6","1"),
  (31,"1","Haikyuu!! Parasyte:_The_Maxim Violet_Evergarden Food_Wars! Inuyasha Your_Lie_in_April No_Game_No_Life Neon_Genesis_Evangelion Fullmetal_Alchemist:_Brotherhood","2018-06-29","2018-04-29","6.99","1","4","0"),
  (32,"0","Sword_Art_Online Black_Clover Haikyuu!! One_Piece Cowboy_Bebop Blue_Exorcist Noragami","2018-06-18","2020-01-18","6.99","1","6","1"),
  (33,"0","Hellsing","2020-07-01","2023-06-14","0.00","0","4","1"),
  (34,"0","Tokyo_Ghoul Attack_on_Titan Darling_in_the_Franxx Steins;Gate","2019-02-04","2024-12-17","12.99","1","4","1"),
  (35,"1","Erased Toradora! Log_Horizon Serial_Experiments_Lain Ranma_½","2014-04-28","2017-06-26","6.99","0","10","1"),
  (36,"1","Paranoia_Agent Hellsing Claymore Great_Teacher_Onizuka Mobile_Suit_Gundam Steins;Gate Akame_ga_Kill","2016-02-21","2019-11-10","6.99","1","4","1"),
  (37,"0","Neon_Genesis_Evangelion:_The_Beginning Hellsing_Ultimate KonoSuba:_God's_Blessing_on_This_Wonderful_World!_OVA","2017-02-12","2011-11-27","12.99","1","10","0"),
  (38,"1","Ranma_½ Parasyte:_The_Maxim Violet_Evergarden Food_Wars! Your_Lie_in_April No_Game_No_Life Dragon_Ball Naruto Bleach","2021-09-20","2022-07-29","0.00","1","6","0"),
  (39,"0","Cowboy_Bebop:_The_Movie Blue_Exorcist:_The_Movie Noragami:_Noragami_Aragoto_OVA Psycho-Pass:_Sinners_of_the_System Assassination_Classroom:_365_Days Neon_Genesis_Evangelion:_The_Beginning Hellsing_Ultimate KonoSuba:_God's_Blessing_on_This_Wonderful_World!_OVA Outlaw_Star:_Remastered","2023-01-28","2014-03-07","0.00","1","6","0");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (40,"0","My_Hero_Academia Soul_Eater Blue_Exorcist One_Punch_Man Tokyo_Ghoul Darling_in_the_Franxx Ghost_in_the_Shell","2018-09-03","2020-08-03","6.99","1","10","0"),
  (41,"0","Ghost_in_the_Shell Trigun Assassination_Classroom Psycho-Pass Yu_Yu_Hakusho Paranoia_Agent Hellsing","2013-01-19","2011-10-14","12.99","1","6","1"),
  (42,"0","Demon_Slayer Black_Clover","2023-01-21","2021-09-17","12.99","1","4","1"),
  (43,"0","Fairy_Tail Sword_Art_Online Demon_Slayer Black_Clover Hunter_x_Hunter","2014-09-09","2019-12-18","0.00","0","6","1"),
  (44,"1","Trigun Assassination_Classroom","2021-11-27","2012-10-30","6.99","0","10","1"),
  (45,"1","Hunter_x_Hunter My_Hero_Academia Soul_Eater Blue_Exorcist One_Punch_Man Tokyo_Ghoul Darling_in_the_Franxx Ghost_in_the_Shell Trigun","2016-06-18","2016-01-13","0.00","1","4","1"),
  (46,"1","JoJo's_Bizarre_Adventure Erased Log_Horizon Toradora!","2017-04-05","2020-11-26","12.99","1","6","1"),
  (47,"0","Psycho-Pass:_Sinners_of_the_System Assassination_Classroom:_365_Days Neon_Genesis_Evangelion:_The_Beginning Hellsing_Ultimate","2013-05-02","2021-03-30","12.99","1","10","0"),
  (48,"0","Paranoia_Agent Hellsing Claymore Great_Teacher_Onizuka Mobile_Suit_Gundam Steins;Gate Akame_ga_Kill Noragami KonoSuba:_God's_Blessing_on_This_Wonderful_World! Outlaw_Star","2020-05-27","2021-12-17","12.99","0","4","1"),
  (49,"1","Code_Geass:_Lelouch_of_the_Rebellion Fairy_Tail Hunter_x_Hunter My_Hero_Academia Death_Note Dragon_Ball_Z One_Punch_Man Tokyo_Ghoul","2022-05-13","2014-11-08","12.99","0","4","1");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (50,"1","Noragami Demon_Slayer Psycho-Pass","2023-05-09","2022-02-15","12.99","0","10","0"),
  (51,"1","Hellsing_Ultimate KonoSuba:_God's_Blessing_on_This_Wonderful_World!_OVA Outlaw_Star:_Remastered Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable Erased:Re: Log_Horizon:_Entaku_Houkai Toradora!_Christmas_Club Serial_Experiments_Lain:_Layer_05:_Distortion","2022-08-29","2012-11-24","12.99","1","10","1"),
  (52,"1","Neon_Genesis_Evangelion Fullmetal_Alchemist:_Brotherhood","2021-02-10","2022-06-26","12.99","1","4","1"),
  (53,"1","One_Piece Death_Note Fullmetal_Alchemist Attack_on_Titan Neon_Genesis_Evangelion Code_Geass Cowboy_Bebop Fairy_Tail Sword_Art_Online Demon_Slayer","2019-04-01","2023-04-25","12.99","0","4","1"),
  (54,"0","KonoSuba:_God's_Blessing_on_This_Wonderful_World!_OVA Outlaw_Star:_Remastered Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable Erased:Re: Log_Horizon:_Entaku_Houkai Toradora!_Christmas_Club Serial_Experiments_Lain:_Layer_05:_Distortion","2019-07-17","2015-04-30","12.99","1","10","0"),
  (55,"1","Outlaw_Star:_Twenty-Three_Hot_Springs Space_Dandy:_The_Search_for_a_Neutral_Planet JoJo's_Bizarre_Adventure:_Golden_Wind Erased:_The_Town_Where_Only_I_Am_Missing","2017-04-01","2022-04-16","6.99","0","10","0"),
  (56,"0","Your_Lie_in_April No_Game_No_Life Dragon_Ball Naruto","2012-10-07","2024-10-02","0.00","0","4","1"),
  (57,"1","Sword_Art_Online:_Ordinal_Scale Black_Clover:_Quartet_Knights Hunter_x_Hunter:_The_Last_Mission Steins;Gate_0","2018-03-01","2020-01-02","0.00","1","6","1"),
  (58,"0","Steins;Gate Akame_ga_Kill Noragami KonoSuba:_God's_Blessing_on_This_Wonderful_World! Outlaw_Star","2018-12-08","2020-02-13","12.99","1","4","0"),
  (59,"0","Ghost_in_the_Shell","2019-05-29","2024-02-06","6.99","0","6","0");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (60,"0","Violet_Evergarden Food_Wars! Inuyasha Your_Lie_in_April No_Game_No_Life Neon_Genesis_Evangelion Fullmetal_Alchemist:_Brotherhood","2017-03-23","2016-01-28","6.99","0","4","1"),
  (61,"0","Serial_Experiments_Lain Ranma_½ Haikyuu!! Parasyte:_The_Maxim Violet_Evergarden Food_Wars! Inuyasha Your_Lie_in_April No_Game_No_Life Neon_Genesis_Evangelion","2014-01-22","2014-04-04","0.00","1","6","0"),
  (62,"1","Dragon_Ball_Z One_Piece Death_Note Fullmetal_Alchemist","2024-03-05","2015-08-12","0.00","1","4","1"),
  (63,"1","Akame_ga_Kill Noragami KonoSuba:_God's_Blessing_on_This_Wonderful_World! Outlaw_Star Space_Dandy JoJo's_Bizarre_Adventure Erased Toradora! Log_Horizon","2014-09-25","2024-03-25","0.00","0","10","1"),
  (64,"0","Hellsing_Ultimate KonoSuba:_God's_Blessing_on_This_Wonderful_World!_OVA Outlaw_Star:_Remastered Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable Erased:Re: Log_Horizon:_Entaku_Houkai","2023-10-08","2014-03-11","12.99","1","10","1"),
  (65,"0","Ranma_½ Haikyuu!! Parasyte:_The_Maxim Violet_Evergarden Food_Wars! Inuyasha Your_Lie_in_April","2021-09-11","2017-03-31","12.99","0","4","1"),
  (66,"0","Fullmetal_Alchemist:_The_Sacred_Star_of_Milos Attack_on_Titan:_No_Regrets","2015-07-27","2022-09-05","0.00","0","4","1"),
  (67,"0","Attack_on_Titan Darling_in_the_Franxx Steins;Gate Sword_Art_Online Black_Clover Haikyuu!! One_Piece Cowboy_Bebop Blue_Exorcist","2024-01-22","2017-10-08","0.00","0","4","1"),
  (68,"0","Mobile_Suit_Gundam Steins;Gate Akame_ga_Kill Noragami KonoSuba:_God's_Blessing_on_This_Wonderful_World! Outlaw_Star Space_Dandy JoJo's_Bizarre_Adventure Erased","2017-04-10","2020-12-16","6.99","1","4","0"),
  (69,"1","Space_Dandy:_The_Search_for_a_Neutral_Planet","2017-12-22","2018-12-11","12.99","1","6","0");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (70,"1","No_Game_No_Life","2025-01-10","2015-11-15","12.99","0","10","1"),
  (71,"0","Psycho-Pass:_Sinners_of_the_System Assassination_Classroom:_365_Days Neon_Genesis_Evangelion:_The_Beginning Hellsing_Ultimate KonoSuba:_God's_Blessing_on_This_Wonderful_World!_OVA Outlaw_Star:_Remastered Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable","2018-05-25","2023-06-08","12.99","1","10","0"),
  (72,"1","Black_Clover Hunter_x_Hunter My_Hero_Academia Soul_Eater Blue_Exorcist","2018-08-30","2013-06-06","6.99","0","4","0"),
  (73,"0","Noragami KonoSuba:_God's_Blessing_on_This_Wonderful_World!","2015-12-14","2015-03-15","12.99","1","4","1"),
  (74,"1","Food_Wars! Inuyasha Your_Lie_in_April No_Game_No_Life","2022-02-20","2016-10-31","12.99","1","10","1"),
  (75,"1","Cowboy_Bebop:_The_Movie Blue_Exorcist:_The_Movie Noragami:_Noragami_Aragoto_OVA Psycho-Pass:_Sinners_of_the_System","2015-07-01","2019-06-03","0.00","1","4","0"),
  (76,"0","Haikyuu!!","2021-07-24","2023-11-18","6.99","1","10","0"),
  (77,"0","Outlaw_Star:_Remastered Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable Erased:Re: Log_Horizon:_Entaku_Houkai Toradora!_Christmas_Club","2013-02-18","2015-06-29","0.00","0","4","0"),
  (78,"1","Tokyo_Ghoul:re Neon_Genesis_Evangelion:_The_End_of_Evangelion Code_Geass:_Akito_the_Exiled My_Hero_Academia:_Two_Heroes Dragon_Ball_Super","2020-09-07","2018-07-11","6.99","0","6","1"),
  (79,"1","Fairy_Tail Sword_Art_Online Demon_Slayer Black_Clover Hunter_x_Hunter My_Hero_Academia","2021-06-17","2023-07-31","0.00","1","10","0");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (80,"0","Psycho-Pass Yu_Yu_Hakusho Paranoia_Agent Hellsing Claymore","2019-06-18","2016-05-26","12.99","0","4","1"),
  (81,"1","Attack_on_Titan:_No_Regrets Sword_Art_Online:_Ordinal_Scale Black_Clover:_Quartet_Knights Hunter_x_Hunter:_The_Last_Mission Steins;Gate_0 Akame_ga_Kill! Noragami_Aragoto KonoSuba:_God's_Blessing_on_This_Wonderful_World!_Movie:_Legend_of_Crimson Outlaw_Star:_Twenty-Three_Hot_Springs","2018-01-27","2019-01-23","0.00","0","10","0"),
  (82,"0","Outlaw_Star Space_Dandy JoJo's_Bizarre_Adventure Erased Toradora!","2012-09-25","2015-01-14","12.99","1","10","0"),
  (83,"1","Neon_Genesis_Evangelion:Death&_Rebirth Fullmetal_Alchemist:_Premium_Collection Code_Geass:_Lelouch_of_the_Rebellion_R2 Fairy_Tail:_Dragon_Cry Hunter_x_Hunter:_Phantom_Rouge My_Hero_Academia:_Heroes_Rising Death_Note:Relight_1-_Visions_of_a_God","2018-11-28","2020-10-08","12.99","1","10","0"),
  (84,"0","Fairy_Tail Hunter_x_Hunter My_Hero_Academia Death_Note Dragon_Ball_Z One_Punch_Man Tokyo_Ghoul","2019-06-16","2022-05-05","6.99","0","4","1"),
  (85,"1","Code_Geass:_Lelouch_of_the_Rebellion_R2 Fairy_Tail:_Dragon_Cry Hunter_x_Hunter:_Phantom_Rouge My_Hero_Academia:_Heroes_Rising Death_Note:Relight_1-_Visions_of_a_God Dragon_Ball_Z:_Battle_of_Gods One_Piece:_Stampede","2013-06-30","2011-11-10","12.99","0","10","1"),
  (86,"0","Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable Erased:Re: Log_Horizon:_Entaku_Houkai Toradora!_Christmas_Club","2022-10-17","2019-10-25","12.99","1","6","1"),
  (87,"0","Sword_Art_Online Black_Clover Haikyuu!! One_Piece Cowboy_Bebop Blue_Exorcist Noragami Demon_Slayer Psycho-Pass","2019-06-05","2021-09-23","6.99","0","4","1"),
  (88,"1","Erased Log_Horizon Toradora! Serial_Experiments_Lain Ranma_½ Parasyte:_The_Maxim Violet_Evergarden Food_Wars!","2017-11-07","2019-03-12","6.99","0","6","1"),
  (89,"1","Psycho-Pass:_Sinners_of_the_System Assassination_Classroom:_365_Days","2018-08-26","2012-02-24","12.99","1","6","1");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (90,"1","Neon_Genesis_Evangelion Code_Geass Cowboy_Bebop Fairy_Tail Sword_Art_Online Demon_Slayer Black_Clover Hunter_x_Hunter My_Hero_Academia Soul_Eater","2011-05-17","2016-07-15","0.00","0","10","0"),
  (91,"1","Assassination_Classroom Neon_Genesis_Evangelion Hellsing KonoSuba:_God's_Blessing_on_This_Wonderful_World!","2022-10-13","2020-10-31","0.00","0","10","1"),
  (92,"0","Hunter_x_Hunter:_The_Last_Mission Steins;Gate_0 Akame_ga_Kill! Noragami_Aragoto","2022-06-06","2017-08-26","6.99","0","4","0"),
  (93,"0","Neon_Genesis_Evangelion:_The_End_of_Evangelion Code_Geass:_Akito_the_Exiled My_Hero_Academia:_Two_Heroes Dragon_Ball_Super Naruto_the_Movie:_Ninja_Clash_in_the_Land_of_Snow Fullmetal_Alchemist:_The_Sacred_Star_of_Milos Attack_on_Titan:_No_Regrets Sword_Art_Online:_Ordinal_Scale Black_Clover:_Quartet_Knights","2019-08-20","2018-06-21","6.99","1","6","0"),
  (94,"0","My_Hero_Academia:_Heroes_Rising Death_Note:Relight_1-_Visions_of_a_God Dragon_Ball_Z:_Battle_of_Gods One_Piece:_Stampede Cowboy_Bebop:_The_Movie Blue_Exorcist:_The_Movie Noragami:_Noragami_Aragoto_OVA Psycho-Pass:_Sinners_of_the_System Assassination_Classroom:_365_Days Neon_Genesis_Evangelion:_The_Beginning","2016-08-26","2023-07-27","12.99","0","6","0"),
  (95,"1","One_Piece:_Stampede Cowboy_Bebop:_The_Movie Blue_Exorcist:_The_Movie","2013-11-01","2013-04-23","12.99","0","10","1"),
  (96,"1","Food_Wars!_The_Third_Plate Your_Lie_in_April:_From_Me_to_You No_Game_No_Life:_Zero Neon_Genesis_Evangelion:Death&_Rebirth Fullmetal_Alchemist:_Premium_Collection Code_Geass:_Lelouch_of_the_Rebellion_R2 Fairy_Tail:_Dragon_Cry Hunter_x_Hunter:_Phantom_Rouge","2014-07-15","2021-01-09","0.00","0","10","1"),
  (97,"0","Blue_Exorcist Noragami Demon_Slayer Psycho-Pass Assassination_Classroom Neon_Genesis_Evangelion Hellsing KonoSuba:_God's_Blessing_on_This_Wonderful_World!","2016-09-26","2022-06-10","6.99","1","6","0"),
  (98,"0","Neon_Genesis_Evangelion","2014-03-25","2017-01-17","0.00","1","6","0"),
  (99,"0","Erased Toradora! Log_Horizon Serial_Experiments_Lain Ranma_½","2013-12-30","2020-12-20","0.00","0","6","1");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (100,"1","Neon_Genesis_Evangelion:_The_End_of_Evangelion","2011-04-30","2021-01-22","0.00","1","4","1"),
  (101,"1","Death_Note:Relight_1-_Visions_of_a_God Dragon_Ball_Z:_Battle_of_Gods","2014-11-12","2013-06-03","0.00","0","4","1"),
  (102,"1","JoJo's_Bizarre_Adventure Erased Log_Horizon Toradora! Serial_Experiments_Lain","2019-12-02","2013-05-08","12.99","0","4","1"),
  (103,"0","Dragon_Ball_Z One_Punch_Man Tokyo_Ghoul Attack_on_Titan Darling_in_the_Franxx Steins;Gate Sword_Art_Online Black_Clover Haikyuu!!","2024-03-05","2012-08-15","6.99","0","10","0"),
  (104,"1","Naruto Bleach Fairy_Tail:_Final_Series Psycho-Pass_2 Tokyo_Ghoul:re Neon_Genesis_Evangelion:_The_End_of_Evangelion","2018-07-21","2022-11-22","12.99","0","4","0"),
  (105,"1","Death_Note Dragon_Ball_Z One_Punch_Man","2020-07-18","2014-11-19","12.99","0","6","1"),
  (106,"0","Violet_Evergarden Food_Wars! Inuyasha Your_Lie_in_April No_Game_No_Life Neon_Genesis_Evangelion","2024-06-06","2016-01-09","6.99","1","6","1"),
  (107,"1","Outlaw_Star Space_Dandy JoJo's_Bizarre_Adventure Erased Log_Horizon Toradora!","2012-09-04","2015-08-18","0.00","0","10","0"),
  (108,"1","Log_Horizon","2020-07-21","2013-10-30","12.99","0","10","0"),
  (109,"1","Naruto Bleach Fairy_Tail:_Final_Series Psycho-Pass_2 Tokyo_Ghoul:re","2012-08-23","2014-01-26","6.99","1","10","1");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (110,"0","Darling_in_the_Franxx Steins;Gate","2023-11-10","2012-01-14","0.00","1","10","1"),
  (111,"1","Toradora!_Christmas_Club Serial_Experiments_Lain:_Layer_05:_Distortion","2013-01-23","2017-01-14","6.99","0","6","0"),
  (112,"1","Parasyte:The_Maxim-_Kiseijuu:_Sei_no_Kakuritsu","2019-12-23","2017-06-24","12.99","0","4","0"),
  (113,"1","KonoSuba:_God's_Blessing_on_This_Wonderful_World!_OVA Outlaw_Star:_Remastered Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable","2019-03-21","2011-08-15","12.99","1","6","1"),
  (114,"0","KonoSuba:_God's_Blessing_on_This_Wonderful_World! Outlaw_Star Space_Dandy JoJo's_Bizarre_Adventure Erased Toradora! Log_Horizon Serial_Experiments_Lain Ranma_½","2021-01-19","2023-08-11","12.99","1","10","1"),
  (115,"1","Toradora! Log_Horizon Serial_Experiments_Lain Ranma_½ Haikyuu!!","2021-08-03","2024-09-30","0.00","1","10","0"),
  (116,"0","Log_Horizon:_Entaku_Houkai Toradora!_Christmas_Club Serial_Experiments_Lain:_Layer_05:_Distortion Ranma_½:_The_Movie_2:_Nihao,_My_Concubine Parasyte:The_Maxim-_Kiseijuu:_Sei_no_Kakuritsu Violet_Evergarden:_Special Food_Wars!_Shokugeki_no_Soma:_Fourth_Plate","2012-04-16","2021-04-10","0.00","1","6","1"),
  (117,"0","Dragon_Ball_Super Naruto_the_Movie:_Ninja_Clash_in_the_Land_of_Snow Fullmetal_Alchemist:_The_Sacred_Star_of_Milos Attack_on_Titan:_No_Regrets Sword_Art_Online:_Ordinal_Scale Black_Clover:_Quartet_Knights","2018-08-22","2013-03-03","0.00","0","6","1"),
  (118,"0","Space_Dandy","2013-06-01","2020-01-31","0.00","1","6","0"),
  (119,"1","Demon_Slayer Psycho-Pass Assassination_Classroom Neon_Genesis_Evangelion","2024-09-11","2024-03-05","0.00","1","6","0");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (120,"1","Log_Horizon Toradora! Serial_Experiments_Lain","2024-04-16","2014-03-26","12.99","1","10","0"),
  (121,"1","Hunter_x_Hunter My_Hero_Academia Soul_Eater Blue_Exorcist One_Punch_Man Tokyo_Ghoul","2012-02-12","2021-07-01","6.99","1","6","1"),
  (122,"1","Naruto_the_Movie:_Ninja_Clash_in_the_Land_of_Snow Fullmetal_Alchemist:_The_Sacred_Star_of_Milos Attack_on_Titan:_No_Regrets Sword_Art_Online:_Ordinal_Scale Black_Clover:_Quartet_Knights Hunter_x_Hunter:_The_Last_Mission","2011-11-27","2016-06-06","0.00","1","10","0"),
  (123,"1","Neon_Genesis_Evangelion Hellsing KonoSuba:_God's_Blessing_on_This_Wonderful_World! Outlaw_Star Space_Dandy JoJo's_Bizarre_Adventure Erased Log_Horizon Toradora!","2024-11-03","2024-10-17","12.99","0","10","0"),
  (124,"1","KonoSuba:_God's_Blessing_on_This_Wonderful_World!_Movie:_Legend_of_Crimson Outlaw_Star:_Twenty-Three_Hot_Springs Space_Dandy:_The_Search_for_a_Neutral_Planet","2018-08-17","2016-09-25","12.99","1","6","0"),
  (125,"1","Neon_Genesis_Evangelion:_The_Beginning Hellsing_Ultimate KonoSuba:_God's_Blessing_on_This_Wonderful_World!_OVA Outlaw_Star:_Remastered Space_Dandy:_Season_2","2017-12-12","2023-04-01","0.00","0","10","0"),
  (126,"0","JoJo's_Bizarre_Adventure","2017-04-29","2019-07-20","12.99","1","10","1"),
  (127,"1","Blue_Exorcist Noragami Demon_Slayer Psycho-Pass","2018-10-06","2017-09-13","12.99","0","6","0"),
  (128,"0","Neon_Genesis_Evangelion Fullmetal_Alchemist:_Brotherhood Code_Geass:_Lelouch_of_the_Rebellion Fairy_Tail Hunter_x_Hunter","2018-05-01","2024-04-15","12.99","1","4","1"),
  (129,"1","Fairy_Tail:_Final_Series Psycho-Pass_2 Tokyo_Ghoul:re Neon_Genesis_Evangelion:_The_End_of_Evangelion Code_Geass:_Akito_the_Exiled My_Hero_Academia:_Two_Heroes","2019-04-01","2018-06-03","0.00","0","10","0");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (130,"1","Assassination_Classroom Psycho-Pass Yu_Yu_Hakusho Paranoia_Agent Hellsing Claymore Great_Teacher_Onizuka","2013-02-07","2013-06-01","12.99","0","4","0"),
  (131,"1","Parasyte:_The_Maxim Violet_Evergarden Food_Wars! Your_Lie_in_April No_Game_No_Life Dragon_Ball Naruto Bleach Fairy_Tail:_Final_Series","2024-02-26","2019-09-02","12.99","0","10","0"),
  (132,"1","No_Game_No_Life:_Zero Neon_Genesis_Evangelion:Death&_Rebirth Fullmetal_Alchemist:_Premium_Collection Code_Geass:_Lelouch_of_the_Rebellion_R2 Fairy_Tail:_Dragon_Cry Hunter_x_Hunter:_Phantom_Rouge My_Hero_Academia:_Heroes_Rising","2016-04-17","2018-12-26","0.00","0","4","1"),
  (133,"0","Tokyo_Ghoul Darling_in_the_Franxx Ghost_in_the_Shell Trigun Assassination_Classroom Psycho-Pass Yu_Yu_Hakusho Paranoia_Agent","2016-02-25","2021-01-17","0.00","0","10","1"),
  (134,"0","Erased Log_Horizon Toradora! Serial_Experiments_Lain Ranma_½ Parasyte:_The_Maxim Violet_Evergarden","2018-01-24","2014-05-24","0.00","1","10","0"),
  (135,"1","Erased:Re: Log_Horizon:_Entaku_Houkai Toradora!_Christmas_Club Serial_Experiments_Lain:_Layer_05:_Distortion Ranma_½:_The_Movie_2:_Nihao,_My_Concubine Parasyte:The_Maxim-_Kiseijuu:_Sei_no_Kakuritsu","2018-10-21","2017-05-30","12.99","1","10","0"),
  (136,"1","Soul_Eater Blue_Exorcist One_Punch_Man Tokyo_Ghoul Darling_in_the_Franxx Ghost_in_the_Shell Trigun Assassination_Classroom","2024-09-15","2016-07-11","12.99","0","6","1"),
  (137,"1","One_Punch_Man","2015-05-12","2022-03-01","6.99","1","4","1"),
  (138,"1","Attack_on_Titan:_No_Regrets Sword_Art_Online:_Ordinal_Scale","2023-12-15","2018-07-02","0.00","0","10","1"),
  (139,"0","Erased:_The_Town_Where_Only_I_Am_Missing Log_Horizon:_Destruction_of_the_Round_Table Toradora!_SOS! Serial_Experiments_Lain:_Layer_03:_Psyche","2011-11-25","2023-04-12","0.00","0","4","0");
INSERT INTO `plan_mensual` (`id`,`anuncios`,`descargas`,`fecha_final`,`fecha_inicio`,`precios`,`acceso_anticipado`,`descuento_en_tienda`,`preview`)
VALUES
  (140,"0","Fullmetal_Alchemist:_The_Sacred_Star_of_Milos Attack_on_Titan:_No_Regrets","2016-05-15","2013-04-20","6.99","1","6","1"),
  (141,"0","Assassination_Classroom Neon_Genesis_Evangelion Hellsing KonoSuba:_God's_Blessing_on_This_Wonderful_World!","2012-01-24","2015-03-15","12.99","0","6","0"),
  (142,"1","Dragon_Ball_Z:_Battle_of_Gods One_Piece:_Stampede Cowboy_Bebop:_The_Movie Blue_Exorcist:_The_Movie","2021-10-03","2017-08-10","12.99","1","6","0"),
  (143,"1","Assassination_Classroom:_365_Days Neon_Genesis_Evangelion:_The_Beginning Hellsing_Ultimate KonoSuba:_God's_Blessing_on_This_Wonderful_World!_OVA Outlaw_Star:_Remastered Space_Dandy:_Season_2","2011-08-23","2022-09-05","6.99","0","10","1"),
  (144,"1","Code_Geass:_Akito_the_Exiled My_Hero_Academia:_Two_Heroes Dragon_Ball_Super Naruto_the_Movie:_Ninja_Clash_in_the_Land_of_Snow Fullmetal_Alchemist:_The_Sacred_Star_of_Milos Attack_on_Titan:_No_Regrets Sword_Art_Online:_Ordinal_Scale","2016-12-06","2018-01-17","0.00","0","10","0"),
  (145,"0","Violet_Evergarden Food_Wars!","2011-04-10","2012-07-14","12.99","0","6","1"),
  (146,"0","Neon_Genesis_Evangelion:Death&_Rebirth Fullmetal_Alchemist:_Premium_Collection Code_Geass:_Lelouch_of_the_Rebellion_R2 Fairy_Tail:_Dragon_Cry Hunter_x_Hunter:_Phantom_Rouge My_Hero_Academia:_Heroes_Rising Death_Note:Relight_1-_Visions_of_a_God Dragon_Ball_Z:_Battle_of_Gods One_Piece:_Stampede","2019-07-03","2012-05-05","0.00","0","10","0"),
  (147,"0","Space_Dandy:_Season_2 JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable Erased:Re:","2015-02-21","2019-09-09","0.00","1","4","1"),
  (148,"1","Steins;Gate Sword_Art_Online","2013-06-18","2022-11-20","0.00","0","10","1"),
  (149,"1","Food_Wars!_The_Third_Plate Your_Lie_in_April:_From_Me_to_You No_Game_No_Life:_Zero Neon_Genesis_Evangelion:Death&_Rebirth Fullmetal_Alchemist:_Premium_Collection","2016-06-23","2016-01-10","12.99","1","4","0");



INSERT INTO `fan` (`id`,`id_plan_mensual`,`episodios_diarios`)
VALUES
  (101,"0",6),
  (102,"0",19),
  (103,"0",3),
  (104,"0",7),
  (105,"0",15),
  (106,"0",2),
  (107,"0",16),
  (108,"0",2),
  (109,"0",16),
  (110,"0",11);
INSERT INTO `fan` (`id`,`id_plan_mensual`,`episodios_diarios`)
VALUES
  (111,"0",19),
  (112,"0",20),
  (113,"0",9),
  (114,"0",16),
  (115,"0",18),
  (116,"0",6),
  (117,"0",1),
  (118,"0",11),
  (119,"0",18),
  (120,"0",10);
INSERT INTO `fan` (`id`,`id_plan_mensual`,`episodios_diarios`)
VALUES
  (121,"0",15),
  (122,"0",6),
  (123,"0",19),
  (124,"0",3),
  (125,"0",2),
  (126,"0",12),
  (127,"0",4),
  (128,"0",8),
  (129,"0",15),
  (130,"0",1);
INSERT INTO `fan` (`id`,`id_plan_mensual`,`episodios_diarios`)
VALUES
  (131,"0",10),
  (132,"0",2),
  (133,"0",20),
  (134,"0",1),
  (135,"0",8),
  (136,"0",10),
  (137,"0",17),
  (138,"0",18),
  (139,"0",5),
  (140,"0",12);
INSERT INTO `fan` (`id`,`id_plan_mensual`,`episodios_diarios`)
VALUES
  (141,"0",12),
  (142,"0",6),
  (143,"0",7),
  (144,"0",15),
  (145,"0",7),
  (146,"0",18),
  (147,"0",6),
  (148,"0",17),
  (149,"0",2),
  (150,"0",3);


INSERT INTO `mega_fan` (`id`,`id_plan_mensual`,`avatar`)
VALUES
  (50,"1","Celestial_Corsair"),
  (51,"1","Frosty_Fusion"),
  (52,"1","Killua_Zoldyck"),
  (53,"1","Frosty_Fusion"),
  (54,"1","Thunder_Tracer"),
  (55,"1","Echo_Emissary"),
  (56,"1","Ember_Emissary"),
  (57,"1","Tanjiro_Kamado"),
  (58,"1","Frosty_Fusion"),
  (59,"1","Holo");
INSERT INTO `mega_fan` (`id`,`id_plan_mensual`,`avatar`)
VALUES
  (60,"1","Kagome_Higurashi"),
  (61,"1","Echo_Emissary"),
  (62,"1","Guts"),
  (63,"1","Lunar_Luna"),
  (64,"1","Thunder_Tracer"),
  (65,"1","Echo_Emissary"),
  (66,"1","Thunder_Tracer"),
  (67,"1","Echo_Emissary"),
  (68,"1","Sailor_Moon"),
  (69,"1","Taiga_Aisaka");
INSERT INTO `mega_fan` (`id`,`id_plan_mensual`,`avatar`)
VALUES
  (70,"1","Lelouch_Lamperouge"),
  (71,"1","Roy_Mustang"),
  (72,"1","Nova_Navigator"),
  (73,"1","Kaneki_Ken"),
  (74,"1","Levi_Ackerman"),
  (75,"1","Ember_Emissary"),
  (76,"1","Vegeta"),
  (77,"1","Natsu_Dragneel"),
  (78,"1","Ember_Emissary"),
  (79,"1","Alphonse_Elric");
INSERT INTO `mega_fan` (`id`,`id_plan_mensual`,`avatar`)
VALUES
  (80,"1","Rias_Gremory"),
  (81,"1","Revy"),
  (82,"1","Inuyasha"),
  (83,"1","Celestial_Corsair"),
  (84,"1","Celestial_Corsair"),
  (85,"1","Nova_Navigator"),
  (86,"1","Frosty_Fusion"),
  (87,"1","Spike_Spiegel"),
  (88,"1","Ichigo_Kurosaki"),
  (89,"1","Jotaro_Kujo");
INSERT INTO `mega_fan` (`id`,`id_plan_mensual`,`avatar`)
VALUES
  (90,"1","Shinji_Ikari"),
  (91,"1","Saitama"),
  (92,"1","Lelouch_Lamperouge"),
  (93,"1","Vegeta"),
  (94,"1","Shadow_Shifter"),
  (95,"1","Nova_Navigator"),
  (96,"1","Thunder_Tracer"),
  (97,"1","Eren_Yeager"),
  (98,"1","Frosty_Fusion"),
  (99,"1","Eren_Yeager");

   INSERT INTO `super_fan` (`id`,`id_plan_mensual`,`dispositivos_simultaneos`,`games`)
VALUES
  (50,"2","1","1"),
  (0,"2","1","1"),
  (2,"2","1","1"),
  (3,"2","1","1"),
  (4,"2","1","1"),
  (5,"2","1","1"),
  (6,"2","1","1"),
  (7,"2","1","1"),
  (8,"2","1","1"),
  (9,"2","1","1");
INSERT INTO `super_fan` (`id`,`id_plan_mensual`,`dispositivos_simultaneos`,`games`)
VALUES
  (10,"2","1","1"),
  (11,"2","1","1"),
  (12,"2","1","1"),
  (13,"2","1","1"),
  (14,"2","1","1"),
  (15,"2","1","1"),
  (16,"2","1","1"),
  (17,"2","1","1"),
  (18,"2","1","1"),
  (19,"2","1","1");
INSERT INTO `super_fan` (`id`,`id_plan_mensual`,`dispositivos_simultaneos`,`games`)
VALUES
  (20,"2","1","1"),
  (21,"2","1","1"),
  (22,"2","1","1"),
  (23,"2","1","1"),
  (24,"2","1","1"),
  (25,"2","1","1"),
  (26,"2","1","1"),
  (27,"2","1","1"),
  (28,"2","1","1"),
  (29,"2","1","1");
INSERT INTO `super_fan` (`id`,`id_plan_mensual`,`dispositivos_simultaneos`,`games`)
VALUES
  (30,"2","1","1"),
  (31,"2","1","1"),
  (32,"2","1","1"),
  (33,"2","1","1"),
  (34,"2","1","1"),
  (35,"2","1","1"),
  (36,"2","1","1"),
  (37,"2","1","1"),
  (38,"2","1","1"),
  (39,"2","1","1");
INSERT INTO `super_fan` (`id`,`id_plan_mensual`,`dispositivos_simultaneos`,`games`)
VALUES
  (40,"2","1","1"),
  (41,"2","1","1"),
  (42,"2","1","1"),
  (43,"2","1","1"),
  (44,"2","1","1"),
  (45,"2","1","1"),
  (46,"2","1","1"),
  (47,"2","1","1"),
  (48,"2","1","1"),
  (49,"2","1","1");
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (8,8),
  (9,9);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (10,10),
  (11,11),
  (12,12),
  (13,13),
  (14,14),
  (15,15),
  (16,16),
  (17,17),
  (18,18),
  (19,19);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (20,20),
  (21,21),
  (22,22),
  (23,23),
  (24,24),
  (25,25),
  (26,26),
  (27,27),
  (28,28),
  (29,29);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (30,30),
  (31,31),
  (32,32),
  (33,33),
  (34,34),
  (35,35),
  (36,36),
  (37,37),
  (38,38),
  (39,39);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (40,40),
  (41,41),
  (42,42),
  (43,43),
  (44,44),
  (45,45),
  (46,46),
  (47,47),
  (48,48),
  (49,49);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (50,50),
  (51,51),
  (52,52),
  (53,53),
  (54,54),
  (55,55),
  (56,56),
  (57,57),
  (58,58),
  (59,59);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (60,60),
  (61,61),
  (62,62),
  (63,63),
  (64,64),
  (65,65),
  (66,66),
  (67,67),
  (68,68),
  (69,69);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (70,70),
  (71,71),
  (72,72),
  (73,73),
  (74,74),
  (75,75),
  (76,76),
  (77,77),
  (78,78),
  (79,79);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (80,80),
  (81,81),
  (82,82),
  (83,83),
  (84,84),
  (85,85),
  (86,86),
  (87,87),
  (88,88),
  (89,89);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (90,90),
  (91,91),
  (92,92),
  (93,93),
  (94,94),
  (95,95),
  (96,96),
  (97,97),
  (98,98),
  (99,99);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (100,100),
  (101,101),
  (102,102),
  (103,103),
  (104,104),
  (105,105),
  (106,106),
  (107,107),
  (108,108),
  (109,109);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (110,110),
  (111,111),
  (112,112),
  (113,113),
  (114,114),
  (115,115),
  (116,116),
  (117,117),
  (118,118),
  (119,119);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (120,120),
  (121,121),
  (122,122),
  (123,123),
  (124,124),
  (125,125),
  (126,126),
  (127,127),
  (128,128),
  (129,129);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (130,130),
  (131,131),
  (132,132),
  (133,133),
  (134,134),
  (135,135),
  (136,136),
  (137,137),
  (138,138),
  (139,139);
INSERT INTO `plan_menusal_usuario` (`id_plan_mensual`,`id_usuario`)
VALUES
  (140,140),
  (141,141),
  (142,142),
  (143,143),
  (144,144),
  (145,145),
  (146,146),
  (147,147),
  (148,148),
  (150,150);


INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (1,1,"Banco_Ficohsa"),
  (2,2,"Banco_Scotiabank"),
  (3,3,"Banco_Provincia"),
  (4,4,"Banco_Atlántida"),
  (5,5,"Banco_de_Sabadell"),
  (6,6,"Banco_Popular_Dominicano"),
  (7,7,"Banco_Bilbao_Vizcaya_Argentaria"),
  (8,8,"Caja_Rural_de_Navarra"),
  (9,9,"(ahora_parte_de_CaixaBank)"),
  (10,10,"Banco_Provincia");
INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (11,11,"Banco_de_Crédito_del_Perú"),
  (12,12,"Banco_Agrícola_Comercial"),
  (13,13,"Banco_de_Crédito_Social_Cooperativo"),
  (14,14,"Bankinter"),
  (15,15,"Banco_Panameño_de_la_Vivienda"),
  (16,16,"Banco_de_Chile"),
  (17,17,"Banco_Azul"),
  (18,18,"Banco_Pacifico"),
  (19,19,"Banco_Cooperativo_Español"),
  (20,20,"Banco_Safra");
INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (21,21,"Banco_Panameño_de_la_Vivienda"),
  (22,22,"Banco_Caja_de_Ahorros"),
  (23,23,"Banco_do_Brasil"),
  (24,24,"Banco_Popular_Español"),
  (25,25,"(BIF)"),
  (26,26,"Banco_Pichincha"),
  (27,27,"Banco_Estado"),
  (28,28,"Banco_de_la_República_Dominicana"),
  (29,29,"Banco_Avanzia"),
  (30,30,"Banco_Agrícola_Comercial");
INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (31,31,"Banco_G_and_T_Continental"),
  (32,32,"Banco_Davivienda"),
  (33,33,"Banco_Nacional_Uruguay"),
  (34,34,"Unicaja_Banco"),
  (35,35,"Banco_Azul"),
  (36,36,"(BIF)"),
  (37,37,"(Banamex)"),
  (38,38,"Banco_Salvadoreño"),
  (39,39,"Banco_Guayaquil"),
  (40,40,"Banco_de_Crédito_del_Perú");
INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (41,41,"Banco_Mare_Nostrum"),
  (42,42,"(BIF)"),
  (43,43,"CaixaBank"),
  (44,44,"Banco_Salvadoreño"),
  (45,45,"Bankinter"),
  (46,46,"Banco_Pacifico"),
  (47,47,"Banco_Avanzia"),
  (48,48,"Banco_Popular_Español"),
  (49,49,"Abanca"),
  (50,50,"Banco_de_la_República_Dominicana");
INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (51,51,"Banco_Salvadoreño"),
  (52,52,"Bankia"),
  (53,53,"Banco_Scotiabank"),
  (54,54,"Banco_Patagonia"),
  (55,55,"(Banvivienda)"),
  (56,56,"Banco_Atlántico"),
  (57,57,"(Banamex)"),
  (58,58,"Banco_Caja_de_Ahorros"),
  (59,59,"Liberbank"),
  (60,60,"Banco_de_la_República_Dominicana");
INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (61,61,"(BMN)"),
  (62,62,"Banco_de_Guayaquil"),
  (63,63,"Banca_March"),
  (64,64,"Banco_Pacifico"),
  (65,65,"Banco_Davivienda"),
  (66,66,"Banco_Mediolanum"),
  (67,67,"Liberbank"),
  (68,68,"Banco_de_Guayaquil"),
  (69,69,"CaixaBank"),
  (70,70,"Banco_General");
INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (71,71,"Banco_Atlántico"),
  (72,72,"Banco_Cooperativo_Español"),
  (73,73,"Banco_Pacifico"),
  (74,74,"Banco_Pichincha"),
  (75,75,"Banco_de_Crédito_Social_Cooperativo"),
  (76,76,"CaixaBank"),
  (77,77,"(BNU)"),
  (78,78,"Caja_Rural"),
  (79,79,"Banco_Ciudad"),
  (80,80,"Banco_Salvadoreño");
INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (81,81,"Banco_de_la_República_Dominicana"),
  (82,82,"Kutxabank"),
  (83,83,"Banco_Atlántico"),
  (84,84,"Banco_Popular_Español"),
  (85,85,"Caja_Rural_de_Navarra"),
  (86,86,"Banco_Pacifico"),
  (87,87,"Banco_Security"),
  (88,88,"Banco_Ficohsa"),
  (89,89,"Banco_Panameño_de_la_Vivienda"),
  (90,90,"Banco_Agrícola");
INSERT INTO `banco` (`id`,`id_metodo_de_pago`,`banco`)
VALUES
  (91,91,"Kutxabank"),
  (92,92,"(Banreservas)"),
  (93,93,"(BBVA)"),
  (94,94,"Banco_Ciudad"),
  (95,95,"Banco_Caja_de_Ahorros"),
  (96,96,"Banco_Atlántico"),
  (97,97,"(BCP)"),
  (98,98,"Banco_Davivienda"),
  (99,99,"Banco_de_Chile"),
  (100,100,"Caja_Rural_del_Sur");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (1,94,"8619273763938362702336","2016-07-29 08"),
  (21,90,"1937293085398246983780","2010-01-25 09"),
  (41,47,"9338385773731894244465","2015-01-03 12"),
  (61,80,"4335132884658651618614","2011-10-15 23"),
  (81,71,"8152772681871618247313","2020-07-30 17"),
  (101,54,"9643879351951935538608","2017-09-02 07"),
  (121,64,"4428181781466945278215","2010-03-10 02"),
  (141,84,"2618582967406325211682","2019-04-04 16"),
  (161,11,"2341612169207245162042","2009-12-16 14"),
  (181,2,"3164495041128427815365","2015-06-11 18");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (201,89,"3216543010973880436847","2020-05-13 02"),
  (221,83,"0664224338071834887677","2014-12-22 18"),
  (241,24,"1617733297741355912279","2016-08-05 05"),
  (261,70,"5277243896186629238211","2018-03-20 05"),
  (281,59,"0326861759682940912352","2017-06-17 11"),
  (301,92,"4744733315888421677676","2018-02-19 05"),
  (321,41,"8164142168824862893545","2013-01-17 16"),
  (341,88,"9768420139893571434395","2013-02-26 00"),
  (361,46,"9644688987857610728588","2010-08-25 16"),
  (381,48,"2518928140894458857719","2015-03-04 19");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (401,62,"3883779111536712262616","2015-07-19 09"),
  (421,33,"7267617554187507405384","2016-10-11 02"),
  (441,6,"7894367417773398375658","2012-09-16 07"),
  (461,66,"8135901618585573468730","2011-09-13 09"),
  (481,95,"6513684733034624815814","2015-09-18 21"),
  (501,63,"9578313857818678352212","2014-10-16 07"),
  (521,55,"5774325677511086246214","2018-09-01 18"),
  (541,83,"6786960593937824577843","2012-01-19 14"),
  (561,62,"5471324469611654373521","2016-12-12 13"),
  (581,76,"9206293489013668354948","2012-02-29 20");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (601,58,"8223274477654966844688","2010-11-28 11"),
  (621,72,"2687131194888541727962","2009-09-21 04"),
  (641,80,"6718728038466622536039","2012-02-04 16"),
  (661,29,"1506539648768353337864","2024-04-29 15"),
  (681,21,"3949815254824823408138","2015-06-28 16"),
  (701,14,"0168641673370625167762","2013-03-30 11"),
  (721,22,"9739650081684573189487","2019-12-30 10"),
  (741,93,"7739832618554252375822","2022-08-27 14"),
  (761,70,"8575237345833234831823","2013-07-17 21"),
  (781,74,"1874375872756768459465","2011-05-30 21");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (801,45,"7517284232484625567017","2024-12-18 20"),
  (821,35,"5752224492886324696142","2012-04-02 09"),
  (841,45,"4814156674153217634177","2013-06-21 17"),
  (861,59,"5162277931312118535514","2015-08-21 00"),
  (881,84,"5584163144573085326531","2022-08-01 09"),
  (901,39,"2568941288554851572784","2021-10-06 23"),
  (921,33,"4053815517578488735276","2019-03-21 23"),
  (941,26,"5161144142671775948253","2009-08-03 04"),
  (961,68,"4770767124713897622815","2019-02-05 13"),
  (981,31,"2486591145025493985594","2018-11-25 05");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (1001,34,"7033476716729303634226","2017-11-02 19"),
  (1021,2,"1487544837514731562347","2019-10-05 19"),
  (1041,89,"1935521447533377867239","2023-05-29 12"),
  (1061,55,"5333323384834651227444","2014-04-02 05"),
  (1081,21,"5844319821669305237732","2022-01-22 12"),
  (1101,88,"3112457532944366944226","2025-01-20 17"),
  (1121,10,"5686193301960722966411","2024-05-05 13"),
  (1141,27,"6548791677353848911864","2015-12-12 20"),
  (1161,43,"1175382456775831181701","2011-11-15 13"),
  (1181,59,"2430767159169135221493","2011-06-25 20");
INSERT INTO `transferencia` (`id`,`id_metodo_de_pago`,`tiempo_que_tarda`)
VALUES
  (1,79,1),
  (21,18,7),
  (41,41,5),
  (61,51,0),
  (81,50,0),
  (101,63,7),
  (121,32,3),
  (141,14,6),
  (161,19,7),
  (181,93,5);
INSERT INTO `transferencia` (`id`,`id_metodo_de_pago`,`tiempo_que_tarda`)
VALUES
  (201,41,2),
  (221,70,1),
  (241,1,3),
  (261,11,3),
  (281,50,1),
  (301,43,4),
  (321,64,4),
  (341,57,1),
  (361,17,1),
  (381,43,5);

INSERT INTO `usuario_usuario` (`id_usuario_agregado`,`id_usuario_agrega`,`apodo`)
VALUES
  (17,14,"Celestial_Champion"),
  (37,4,"Lunar_Lionheart"),
  (133,103,"Ember_Enigma"),
  (17,8,"Thunder_Storm"),
  (1,15,"Cosmic_Sorcerer"),
  (37,144,"Nova_Nomad"),
  (96,137,"Mystic_Marauder"),
  (37,23,"Cosmic_Sorcerer"),
  (142,69,"Celestial_Spectre"),
  (8,7,"Nova_Nomad");
INSERT INTO `usuario_usuario` (`id_usuario_agregado`,`id_usuario_agrega`,`apodo`)
VALUES
  (94,143,"Celestial_Champion"),
  (76,59,"Quantum_Quasar"),
  (113,97,"Nova_Nomad"),
  (77,39,"Ember_Enigma"),
  (65,79,"Frosty_Fable"),
  (35,69,"Phantom_Prowler"),
  (126,70,"Mystic_Mingle"),
  (125,47,"Nova_Nomad"),
  (87,72,"Mystic_Mingle"),
  (77,62,"Cosmic_Sorcerer");
INSERT INTO `usuario_usuario` (`id_usuario_agregado`,`id_usuario_agrega`,`apodo`)
VALUES
  (129,90,"Nebula_Stalker"),
  (5,132,"Thunder_Tempest"),
  (130,124,"Frosty_Fable"),
  (138,42,"Thunder_Storm"),
  (94,84,"Nova_Navigator"),
  (77,44,"Cosmic_Sorcerer"),
  (40,13,"Nebula_Seeker"),
  (68,69,"Frosty_Fable"),
  (12,22,"Frosty_Fable"),
  (58,97,"Thunder_Tempest");
INSERT INTO `usuario_usuario` (`id_usuario_agregado`,`id_usuario_agrega`,`apodo`)
VALUES
  (78,130,"Cosmic_Sorcerer"),
  (70,6,"Lunar_Lionheart"),
  (62,64,"Thunder_Tempest"),
  (98,110,"Blaze_Maverick"),
  (126,45,"Thunder_Tempest"),
  (76,33,"Celestial_Scribe"),
  (128,45,"Shadow_Shifter"),
  (127,43,"Shadow_Shifter"),
  (125,148,"Celestial_Spectre"),
  (69,104,"Thunder_Strike");
INSERT INTO `usuario_usuario` (`id_usuario_agregado`,`id_usuario_agrega`,`apodo`)
VALUES
  (142,104,"Blaze_Blaze"),
  (112,131,"Blaze_Blaze"),
  (125,67,"Solar_Stride"),
  (104,18,"Nova_Nomad"),
  (126,14,"Thunder_Tempest"),
  (148,47,"Frosty_Enigma"),
  (85,87,"Quantum_Quill"),
  (46,59,"Nebula_Navigator"),
  (72,138,"Ember_Emissary"),
  (5,109,"Mystic_Mingle");
INSERT INTO `usuario_usuario` (`id_usuario_agregado`,`id_usuario_agrega`,`apodo`)
VALUES
  (94,69,"Blaze_Voyage"),
  (68,25,"Quantum_Quasar"),
  (87,148,"Nova_Navigator"),
  (70,84,"Nova_Nomad"),
  (82,39,"Lunar_Lionheart"),
  (86,29,"Shadow_Shifter"),
  (46,126,"Mystic_Mingle"),
  (105,113,"Cosmic_Sorcerer"),
  (12,13,"Thunder_Tempest"),
  (69,137,"Lunar_Lionheart");
INSERT INTO `usuario_usuario` (`id_usuario_agregado`,`id_usuario_agrega`,`apodo`)
VALUES
  (40,135,"Nova_Nomad"),
  (95,133,"Frosty_Fable"),
  (50,79,"Cosmic_Sorcerer"),
  (129,62,"Ethereal_Harmony"),
  (46,65,"Thunder_Strike"),
  (91,92,"Ethereal_Harmony"),
  (108,43,"Phantom_Prowler"),
  (47,101,"Blaze_Blaze"),
  (82,78,"Phantom_Prowler"),
  (60,105,"Blaze_Blaze");
INSERT INTO `usuario_usuario` (`id_usuario_agregado`,`id_usuario_agrega`,`apodo`)
VALUES
  (135,149,"Cosmic_Sorcerer"),
  (109,118,"Phantom_Prowler"),
  (7,21,"Nebula_Stalker"),
  (92,119,"Mystic_Marauder"),
  (140,35,"Blaze_Blaze"),
  (31,35,"Celestial_Champion"),
  (141,65,"Mystic_Mingle"),
  (148,46,"Frost_Fox"),
  (90,60,"Phantom_Prowler"),
  (119,131,"Nova_Nomad");
INSERT INTO `usuario_usuario` (`id_usuario_agregado`,`id_usuario_agrega`,`apodo`)
VALUES
  (80,121,"Nebula_Navigator"),
  (50,134,"Zen_Fusion"),
  (124,17,"Frosty_Fable"),
  (61,21,"Frosty_Fable"),
  (118,54,"Frosty_Fable"),
  (45,133,"Thunder_Strike"),
  (37,87,"Nova_Nomad"),
  (95,136,"Blaze_Wanderer"),
  (77,43,"Nova_Nomad"),
  (59,15,"Frosty_Fable");
INSERT INTO `imagen_de_perfil` (`id`,`id_usuario`,`imagen_de_perfil`)
VALUES
  (36,27,"Toradora!_SOS!"),
  (80,13,"Haikyuu!!"),
  (140,23,"Death_Note"),
  (29,137,"Steins;Gate"),
  (8,12,"Parasyte:_The_Maxim"),
  (12,108,"Assassination_Classroom"),
  (131,97,"Attack_on_Titan"),
  (138,81,"Neon_Genesis_Evangelion:_The_End_of_Evangelion"),
  (31,70,"Naruto"),
  (99,19,"Serial_Experiments_Lain");
INSERT INTO `imagen_de_perfil` (`id`,`id_usuario`,`imagen_de_perfil`)
VALUES
  (56,17,"Fullmetal_Alchemist:_Premium_Collection"),
  (127,66,"Space_Dandy:_Season_2"),
  (44,127,"One_Piece:_Stampede"),
  (112,145,"Code_Geass:_Lelouch_of_the_Rebellion_R2"),
  (135,39,"Serial_Experiments_Lain"),
  (13,120,"Code_Geass:_Lelouch_of_the_Rebellion_R2"),
  (18,92,"Neon_Genesis_Evangelion"),
  (132,79,"Blue_Exorcist"),
  (103,66,"Naruto_the_Movie:_Ninja_Clash_in_the_Land_of_Snow"),
  (142,83,"Hunter_x_Hunter");
INSERT INTO `imagen_de_perfil` (`id`,`id_usuario`,`imagen_de_perfil`)
VALUES
  (74,96,"Neon_Genesis_Evangelion"),
  (39,117,"Fullmetal_Alchemist:_Premium_Collection"),
  (83,77,"Ranma_½:_Big_Trouble_in_Nekonron,_China"),
  (134,74,"JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable"),
  (45,75,"Hunter_x_Hunter:_Phantom_Rouge"),
  (25,41,"One_Piece:_Stampede"),
  (21,98,"Black_Clover:_Quartet_Knights"),
  (19,74,"Erased"),
  (30,76,"Your_Lie_in_April:_From_Me_to_You"),
  (109,76,"Naruto");
INSERT INTO `imagen_de_perfil` (`id`,`id_usuario`,`imagen_de_perfil`)
VALUES
  (139,145,"Noragami"),
  (133,96,"Space_Dandy:_Season_2"),
  (123,98,"Parasyte:The_Maxim-_Sensui_Special"),
  (42,65,"Cowboy_Bebop:_The_Movie"),
  (59,68,"Noragami_Aragoto"),
  (40,29,"Naruto_the_Movie:_Ninja_Clash_in_the_Land_of_Snow"),
  (46,1,"Serial_Experiments_Lain:_Layer_05:_Distortion"),
  (11,105,"Parasyte:The_Maxim-_Kiseijuu:_Sei_no_Kakuritsu"),
  (106,63,"Log_Horizon:_Destruction_of_the_Round_Table"),
  (85,80,"JoJo's_Bizarre_Adventure:_Diamond_Is_Unbreakable");
INSERT INTO `imagen_de_perfil` (`id`,`id_usuario`,`imagen_de_perfil`)
VALUES
  (4,147,"No_Game_No_Life"),
  (121,112,"Cowboy_Bebop:_The_Movie"),
  (90,0,"Erased"),
  (37,92,"Sword_Art_Online:_Ordinal_Scale"),
  (52,43,"Fairy_Tail:_Dragon_Cry"),
  (1,111,"Toradora!_Christmas_Club"),
  (27,38,"Attack_on_Titan"),
  (144,45,"Parasyte:The_Maxim-_Kiseijuu:_Sei_no_Kakuritsu"),
  (110,103,"Hunter_x_Hunter:_Phantom_Rouge"),
  (22,22,"KonoSuba:_God's_Blessing_on_This_Wonderful_World!");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (1,103,"2024-03-10 02:36:12","Squash"),
  (2,15,"2017-03-24 07:36:39","Paracaidismo"),
  (3,99,"2019-05-27 07:57:00","Sumo"),
  (4,7,"2022-11-16 19:34:44","Mahou_Shoujo"),
  (5,32,"2013-04-21 13:49:53","Kaiju"),
  (6,42,"2025-01-12 09:22:48","BMX"),
  (7,13,"2012-10-20 19:12:22","Patinaje_Artístico"),
  (8,20,"2016-09-19 11:16:29","Escalada"),
  (9,31,"2015-09-09 20:01:17","Josei"),
  (10,96,"2013-11-22 10:09:30","Militar");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (11,41,"2021-08-26 00:39:31","Drama"),
  (12,134,"2017-11-10 03:55:11","Boxeo"),
  (13,120,"2013-04-08 06:41:48","Motociclismo"),
  (14,19,"2014-10-28 02:41:20","Harem"),
  (15,7,"2013-06-29 21:11:06","Cyberpunk"),
  (16,11,"2022-01-22 00:26:54","Reverse_Harem"),
  (17,138,"2020-10-18 16:18:10","Voleyball"),
  (18,68,"2021-04-04 00:35:35","Deporte"),
  (19,60,"2024-10-17 16:02:29","Windsurf"),
  (20,58,"2013-08-28 06:30:27","Softbol");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (21,128,"2015-08-20 17:03:47","Shoujo"),
  (22,55,"2022-02-19 15:21:30","Polo"),
  (23,60,"2014-01-19 19:35:43","Judu"),
  (24,6,"2018-11-19 10:23:32","Recuentos_de_la_vida"),
  (25,103,"2021-12-20 16:54:56","Windsurf"),
  (26,121,"2017-06-14 00:06:58","Motociclismo"),
  (27,73,"2014-06-01 12:10:04","Karuta"),
  (28,22,"2015-11-05 06:34:44","Arquería"),
  (29,120,"2015-08-07 08:41:32","Superpoderes"),
  (30,19,"2018-09-22 03:05:34","Gore");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (31,29,"2021-09-14 04:21:02","Kodomo"),
  (32,139,"2015-09-23 19:43:14","Samurai"),
  (33,124,"2020-08-16 23:39:02","Samurai"),
  (34,122,"2023-09-22 07:31:42","Golf"),
  (35,60,"2020-10-23 19:37:29","Demencia"),
  (36,22,"2021-02-02 01:58:29","Steampunk"),
  (37,42,"2019-01-13 19:36:04","BMX"),
  (38,108,"2012-10-27 08:08:41","Kemono"),
  (39,50,"2014-04-20 02:45:11","Vampiros"),
  (40,59,"2018-08-22 06:20:29","Jidaigeki");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (41,117,"2021-10-08 02:01:59","Motociclismo"),
  (42,34,"2013-09-06 23:14:48","Voleyball"),
  (43,18,"2022-06-26 04:30:57","Sumo"),
  (44,140,"2022-10-03 01:45:56","Kodomo"),
  (45,41,"2018-12-29 15:09:03","Rugby"),
  (46,134,"2014-08-16 05:15:42","Rally"),
  (47,116,"2015-02-06 14:44:42","Gore"),
  (48,23,"2012-11-11 14:52:27","Drama"),
  (49,41,"2018-06-22 03:09:07","Accion"),
  (50,38,"2015-02-09 09:15:49","Canotaje");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (51,82,"2022-08-06 08:26:48","Pesca"),
  (52,85,"2015-01-17 04:35:10","Motociclismo"),
  (53,107,"2015-06-12 22:44:50","Ciclismo"),
  (54,77,"2022-02-16 07:16:06","Paracaidismo"),
  (55,109,"2017-07-07 22:23:20","Escolar"),
  (56,29,"2013-01-13 10:42:23","Space_Western"),
  (57,20,"2013-04-26 08:53:33","Seinen"),
  (58,30,"2023-09-16 20:07:19","Artes_Marciales"),
  (59,30,"2017-07-18 12:29:14","Steampunk"),
  (60,27,"2012-09-14 03:51:48","Historias_de_Vida");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (61,41,"2024-04-01 21:39:23","Automovilismo"),
  (62,120,"2012-10-18 08:26:57","Danza"),
  (63,109,"2013-04-20 02:10:49","Boxeo"),
  (64,18,"2022-09-13 14:27:12","Kemono"),
  (65,85,"2012-10-22 14:55:48","Kodomo"),
  (66,98,"2020-06-20 15:33:27","Boxeo"),
  (67,72,"2024-10-30 10:23:26","Squash"),
  (68,21,"2012-01-18 21:00:25","Cricket"),
  (69,45,"2024-06-07 13:24:12","Rally"),
  (70,8,"2019-12-08 03:16:56","Superpoderes");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (71,119,"2012-01-10 05:16:20","Rally"),
  (72,133,"2024-05-02 12:50:37","Alpinismo"),
  (73,36,"2015-04-22 16:49:35","Pesca"),
  (74,119,"2024-06-01 00:51:05","Cyberpunk"),
  (75,50,"2012-02-25 07:41:41","Militar"),
  (76,133,"2013-02-25 05:23:06","Parodia"),
  (77,128,"2017-04-26 05:00:02","Militar"),
  (78,24,"2024-11-10 16:26:44","Misterio"),
  (79,70,"2020-01-13 17:59:28","Kaiju"),
  (80,70,"2017-04-28 13:21:31","Danza");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (81,146,"2017-01-02 13:15:01","Sumo"),
  (82,121,"2019-07-06 05:10:40","Shoujo"),
  (83,135,"2018-10-08 18:53:29","Paracaidismo"),
  (84,10,"2019-04-18 14:19:44","Slice_of_Life"),
  (85,35,"2017-02-21 14:58:16","Post-apocalíptico"),
  (86,45,"2024-09-03 04:55:30","Militar"),
  (87,9,"2022-11-28 14:47:01","Yaoi"),
  (88,144,"2023-11-13 11:01:08","Sobrenatural"),
  (89,56,"2015-04-21 11:31:55","Cricket"),
  (90,62,"2016-02-03 00:07:28","Mahou_Shoujo");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (91,71,"2011-11-26 04:36:14","Gore"),
  (92,2,"2012-12-23 09:39:44","Demencia"),
  (93,44,"2011-03-29 13:04:01","Isekai"),
  (94,102,"2015-09-08 17:48:23","Judu"),
  (95,25,"2016-08-02 04:13:28","Escolar"),
  (96,16,"2016-11-04 00:38:50","Biatlón"),
  (97,8,"2013-04-08 13:26:06","Futbol"),
  (98,50,"2023-12-20 00:07:57","Fantasia"),
  (99,37,"2024-06-17 17:24:38","Deporte"),
  (100,65,"2024-04-11 05:13:38","Sumo");
INSERT INTO `lista` (`id`,`id_usuario`,`fecha_de_creacion`,`nombre`)
VALUES
  (101,2,"2020-01-17 02:40:29","Horror"),
  (102,66,"2024-01-05 20:57:58","Judo"),
  (103,39,"2020-02-25 13:46:34","Voleyball"),
  (104,86,"2023-03-27 07:24:48","Tenis"),
  (105,128,"2020-01-13 18:19:24","Militar"),
  (106,107,"2017-02-10 07:24:33","Hentaib"),
  (107,54,"2019-03-27 03:09:34","Comedia"),
  (108,150,"2015-02-28 23:02:27","Militar"),
  (109,60,"2013-01-06 13:41:09","Cyberpunk"),
  (110,122,"2011-01-31 00:40:40","Policía");

INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (1,143,"Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online My_Hero_Academia","Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","contra gigantes devoradores de humanos, Eren_Yeager y sus amigos se","Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate"),
  (2,86,"Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","convertirse en el Hokage y enfrenta amenazas más oscuras. One_Piece:","Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom"),
  (3,80,"Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim Violet_Evergarden Erased","Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","Naruto_Uzumaki mientras busca convertirse en el Hokage y enfrenta amenazas","Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion"),
  (4,99,"Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul Cowboy_Bebop","Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April","superpoderes, Izuku_Midoriya busca convertirse en un héroe profesional y enfrenta","Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul"),
  (5,27,"Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul","a sus enemigos de un solo golpe, busca emoción en","Noragami Parasyte_The_Maxim Violet_Evergarden"),
  (6,60,"Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man","sido convertida en uno. One_Punch_Man: Saitama, un héroe tan poderoso","Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion"),
  (7,18,"Parasyte_The_Maxim Violet_Evergarden Erased Mob_Psycho_100","Dragon_Ball_Z Black_Clover Haikyuu JoJos_Bizarre_Adventure","recuperar sus cuerpos después de un fallido intento de resucitar","Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter"),
  (8,127,"Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom","su tripulación buscan el tesoro definitivo, el One_Piece, en esta","Dragon_Ball_Z Black_Clover Haikyuu"),
  (9,22,"One_Piece Death_Note Attack_on_Titan Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia","Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April","Edward_Elric y Alphonse_Elric buscan la Piedra Filosofal para recuperar sus","Erased Mob_Psycho_100 Naruto_Shippuden"),
  (10,139,"One_Piece Death_Note Attack_on_Titan","Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April","y enfrenta desafíos para alcanzar su sueño. Demon_Slayer_Kimetsu_no_Yaiba: Tanjiro_Kamado se","Death_Note Attack_on_Titan Fullmetal_Alchemist");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (11,39,"Violet_Evergarden Erased Mob_Psycho_100","Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","el Hokage y enfrenta amenazas más oscuras. One_Piece: Monkey_D_Luffy y","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop"),
  (12,81,"Assassination_Classroom Noragami","Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z","mundo donde la humanidad lucha contra gigantes devoradores de humanos,","One_Piece Death_Note Attack_on_Titan"),
  (13,37,"Bleach Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","Dragon_Ball_Z Black_Clover Haikyuu JoJos_Bizarre_Adventure","la Piedra Filosofal para recuperar sus cuerpos después de un","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop"),
  (14,94,"Haikyuu","Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online","una misión para vengar a su familia asesinada por demonios","Noragami Parasyte_The_Maxim Violet_Evergarden"),
  (15,136,"Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z","Death_Note Attack_on_Titan Fullmetal_Alchemist Sword_Art_Online","de piratas repleta de acción, humor y amistad. Death_Note: Cuando","Steins_Gate Dragon_Ball_Z Black_Clover"),
  (16,105,"Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail","para alcanzar su sueño. Demon_Slayer_Kimetsu_no_Yaiba: Tanjiro_Kamado se embarca en una","JoJos_Bizarre_Adventure Bleach Your_Lie_in_April"),
  (17,149,"Assassination_Classroom Noragami Parasyte_The_Maxim Violet_Evergarden Erased","Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","vengar a su familia asesinada por demonios y salvar a","Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia"),
  (18,131,"Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super","Black_Clover Haikyuu JoJos_Bizarre_Adventure Bleach","público. Tokyo_Ghoul: Ken_Kaneki, tras ser transformado en ghoul contra su","My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man"),
  (19,102,"Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","a quienquiera que tenga su nombre escrito, comienza una intensa","Cowboy_Bebop Hunter_x_Hunter Fairy_Tail"),
  (20,19,"Noragami Parasyte_The_Maxim Violet_Evergarden Erased","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man","a su familia asesinada por demonios y salvar a su","Death_Note Attack_on_Titan Fullmetal_Alchemist");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (21,43,"Violet_Evergarden Erased","Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online","buscan la Piedra Filosofal para recuperar sus cuerpos después de","Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood"),
  (22,53,"Noragami","Parasyte_The_Maxim Violet_Evergarden Erased Mob_Psycho_100","a quienquiera que tenga su nombre escrito, comienza una intensa","Dragon_Ball_Z Black_Clover Haikyuu"),
  (23,111,"Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom Noragami","Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z","sus enemigos de un solo golpe, busca emoción en su","Steins_Gate Dragon_Ball_Z Black_Clover"),
  (24,23,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop","Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba","sus amigos se unen al ejército para descubrir los secretos","Cowboy_Bebop Hunter_x_Hunter Fairy_Tail"),
  (25,35,"Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","JoJos_Bizarre_Adventure Bleach Your_Lie_in_April Fullmetal_Alchemist","recuperar sus cuerpos después de un fallido intento de resucitar","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop"),
  (26,21,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop","One_Piece Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood","emoción en su vida mientras enfrenta la indiferencia del público.","My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man"),
  (27,112,"Naruto_Shippuden One_Piece Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online My_Hero_Academia","Bleach Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super","donde la mayoría de las personas tienen superpoderes, Izuku_Midoriya busca","Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion"),
  (28,56,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter","Dragon_Ball_Z Black_Clover Haikyuu JoJos_Bizarre_Adventure","usando la alquimia. Sword_Art_Online: En un juego de realidad virtual,","Violet_Evergarden Erased Mob_Psycho_100"),
  (29,97,"Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April Fullmetal_Alchemist","Parasyte_The_Maxim Violet_Evergarden Erased Mob_Psycho_100","después de un fallido intento de resucitar a su madre","Violet_Evergarden Erased Mob_Psycho_100"),
  (30,93,"Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online My_Hero_Academia","Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul Cowboy_Bebop","Hokage y enfrenta amenazas más oscuras. One_Piece: Monkey_D_Luffy y su","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (31,94,"Fullmetal_Alchemist_Brotherhood Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul","Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail","enfrenta la indiferencia del público. Tokyo_Ghoul: Ken_Kaneki, tras ser transformado","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba"),
  (32,46,"Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu JoJos_Bizarre_Adventure","Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","las aventuras de Naruto_Uzumaki mientras busca convertirse en el Hokage","Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online"),
  (33,129,"Dragon_Ball_Z Black_Clover Haikyuu JoJos_Bizarre_Adventure Bleach","Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul Cowboy_Bebop","y salvar a su hermana, que ha sido convertida en","Bleach Your_Lie_in_April Fullmetal_Alchemist"),
  (34,128,"Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion","Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z","su familia asesinada por demonios y salvar a su hermana,","Violet_Evergarden Erased Mob_Psycho_100"),
  (35,109,"Violet_Evergarden Erased Mob_Psycho_100 Naruto_Shippuden One_Piece Death_Note Attack_on_Titan","Parasyte_The_Maxim Violet_Evergarden Erased Mob_Psycho_100","el estudiante prodigio Light_Yagami encuentra un cuaderno que mata a","Noragami Parasyte_The_Maxim Violet_Evergarden"),
  (36,76,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop","Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul Cowboy_Bebop","ghoul contra su voluntad, lucha por sobrevivir en un mundo","Violet_Evergarden Erased Mob_Psycho_100"),
  (37,120,"Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim Violet_Evergarden Erased","Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April","Attack_on_Titan: En un mundo donde la humanidad lucha contra gigantes","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop"),
  (38,133,"JoJos_Bizarre_Adventure Bleach Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super","Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion","sus amigos se unen al ejército para descubrir los secretos","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba"),
  (39,141,"Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom","para recuperar sus cuerpos después de un fallido intento de","Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion"),
  (40,45,"Fairy_Tail Neon_Genesis_Evangelion","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","después de un fallido intento de resucitar a su madre","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (41,13,"Steins_Gate Dragon_Ball_Z","Parasyte_The_Maxim Violet_Evergarden Erased Mob_Psycho_100","acción, humor y amistad. Death_Note: Cuando el estudiante prodigio Light_Yagami","Parasyte_The_Maxim Violet_Evergarden Erased"),
  (42,6,"Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim Violet_Evergarden","Noragami Parasyte_The_Maxim Violet_Evergarden Erased","que ha sido convertida en uno. One_Punch_Man: Saitama, un héroe","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z"),
  (43,20,"Haikyuu JoJos_Bizarre_Adventure Bleach","Mob_Psycho_100 Naruto_Shippuden One_Piece Death_Note","One_Punch_Man: Saitama, un héroe tan poderoso que derrota a sus","Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom"),
  (44,98,"Demon_Slayer_Kimetsu_no_Yaiba","Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","el estudiante prodigio Light_Yagami encuentra un cuaderno que mata a","Haikyuu JoJos_Bizarre_Adventure Bleach"),
  (45,47,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter","personas tienen superpoderes, Izuku_Midoriya busca convertirse en un héroe profesional","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop"),
  (46,9,"Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia","Parasyte_The_Maxim Violet_Evergarden Erased Mob_Psycho_100","salida. My_Hero_Academia: En un mundo donde la mayoría de las","Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion"),
  (47,86,"Erased Mob_Psycho_100","Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul Cowboy_Bebop","del público. Tokyo_Ghoul: Ken_Kaneki, tras ser transformado en ghoul contra","Haikyuu JoJos_Bizarre_Adventure Bleach"),
  (48,129,"Assassination_Classroom","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","su vida mientras enfrenta la indiferencia del público. Tokyo_Ghoul: Ken_Kaneki,","Black_Clover Haikyuu JoJos_Bizarre_Adventure"),
  (49,97,"Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","intelectual con un detective. Attack_on_Titan: En un mundo donde la","Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online"),
  (50,28,"Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul","Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online My_Hero_Academia","contra su voluntad, lucha por sobrevivir en un mundo donde","Noragami Parasyte_The_Maxim Violet_Evergarden");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (51,47,"Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April Fullmetal_Alchemist","Noragami Parasyte_The_Maxim Violet_Evergarden Erased","detective. Attack_on_Titan: En un mundo donde la humanidad lucha contra","Naruto One_Piece Death_Note"),
  (52,96,"Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","tras ser transformado en ghoul contra su voluntad, lucha por","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba"),
  (53,94,"Violet_Evergarden","Fullmetal_Alchemist_Brotherhood Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba","My_Hero_Academia: En un mundo donde la mayoría de las personas","Black_Clover Haikyuu JoJos_Bizarre_Adventure"),
  (54,139,"Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom","escrito, comienza una intensa batalla intelectual con un detective. Attack_on_Titan:","Dragon_Ball_Super Assassination_Classroom Noragami"),
  (55,71,"Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul Cowboy_Bebop","Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","En un mundo donde la mayoría de las personas tienen","Steins_Gate Dragon_Ball_Z Black_Clover"),
  (56,86,"Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul","Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","en un héroe profesional y enfrenta desafíos para alcanzar su","My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man"),
  (57,83,"Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online My_Hero_Academia","Dragon_Ball_Z Black_Clover Haikyuu JoJos_Bizarre_Adventure","su tripulación buscan el tesoro definitivo, el One_Piece, en esta","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super"),
  (58,93,"Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul","My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul","enemigos de un solo golpe, busca emoción en su vida","Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion"),
  (59,108,"Noragami Parasyte_The_Maxim","Black_Clover Haikyuu JoJos_Bizarre_Adventure Bleach","y enfrenta desafíos para alcanzar su sueño. Demon_Slayer_Kimetsu_no_Yaiba: Tanjiro_Kamado se","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z"),
  (60,5,"Bleach Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom","Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom Noragami","se unen al ejército para descubrir los secretos detrás de","Noragami Parasyte_The_Maxim Violet_Evergarden");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (61,106,"Parasyte_The_Maxim Violet_Evergarden Erased Mob_Psycho_100 Naruto_Shippuden One_Piece","Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z","un héroe profesional y enfrenta desafíos para alcanzar su sueño.","Dragon_Ball_Super Assassination_Classroom Noragami"),
  (62,119,"Dragon_Ball_Z Black_Clover Haikyuu","Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom Noragami","se unen al ejército para descubrir los secretos detrás de","Attack_on_Titan Fullmetal_Alchemist Sword_Art_Online"),
  (63,32,"Death_Note Attack_on_Titan Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","una misión para vengar a su familia asesinada por demonios","Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion"),
  (64,128,"Mob_Psycho_100 Naruto_Shippuden One_Piece","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man","Naruto_Uzumaki mientras busca convertirse en el Hokage y enfrenta amenazas","Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion"),
  (65,149,"Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","Mob_Psycho_100 Naruto_Shippuden One_Piece Death_Note","convertirse en el Hokage y enfrenta amenazas más oscuras. One_Piece:","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop"),
  (66,39,"Assassination_Classroom Noragami Parasyte_The_Maxim Violet_Evergarden Erased","Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","su voluntad, lucha por sobrevivir en un mundo donde los","Dragon_Ball_Super Assassination_Classroom Noragami"),
  (67,114,"Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter","estos monstruos. Fullmetal_Alchemist_Brotherhood: Los hermanos Edward_Elric y Alphonse_Elric buscan la","Violet_Evergarden Erased Mob_Psycho_100"),
  (68,47,"Steins_Gate Dragon_Ball_Z Black_Clover","Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April","nombre escrito, comienza una intensa batalla intelectual con un detective.","Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter"),
  (69,61,"Fullmetal_Alchemist Dragon_Ball_Super","Black_Clover Haikyuu JoJos_Bizarre_Adventure Bleach","sigue las aventuras de Naruto_Uzumaki mientras busca convertirse en el","Mob_Psycho_100 Naruto_Shippuden One_Piece"),
  (70,111,"Bleach Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom","One_Piece Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood","encuentra atrapado junto con otros jugadores, enfrentando desafíos mortales mientras","Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (71,119,"Dragon_Ball_Z Black_Clover","Black_Clover Haikyuu JoJos_Bizarre_Adventure Bleach","superpoderes, Izuku_Midoriya busca convertirse en un héroe profesional y enfrenta","Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion"),
  (72,79,"Cowboy_Bebop Hunter_x_Hunter Fairy_Tail","Parasyte_The_Maxim Violet_Evergarden Erased Mob_Psycho_100","cuaderno que mata a quienquiera que tenga su nombre escrito,","JoJos_Bizarre_Adventure Bleach Your_Lie_in_April"),
  (73,12,"Erased Mob_Psycho_100 Naruto_Shippuden","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter","se unen al ejército para descubrir los secretos detrás de","Steins_Gate Dragon_Ball_Z Black_Clover"),
  (74,74,"Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom","voluntad, lucha por sobrevivir en un mundo donde los humanos","Steins_Gate Dragon_Ball_Z Black_Clover"),
  (75,78,"Dragon_Ball_Super","Attack_on_Titan Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia","profesional y enfrenta desafíos para alcanzar su sueño. Demon_Slayer_Kimetsu_no_Yaiba: Tanjiro_Kamado","Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom"),
  (76,119,"Assassination_Classroom Noragami Parasyte_The_Maxim Violet_Evergarden","Black_Clover Haikyuu JoJos_Bizarre_Adventure Bleach","Tokyo_Ghoul: Ken_Kaneki, tras ser transformado en ghoul contra su voluntad,","Bleach Your_Lie_in_April Fullmetal_Alchemist"),
  (77,79,"Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April","En un juego de realidad virtual, Kirito se encuentra atrapado","Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter"),
  (78,88,"Tokyo_Ghoul Cowboy_Bebop","Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion","comienza una intensa batalla intelectual con un detective. Attack_on_Titan: En","Bleach Your_Lie_in_April Fullmetal_Alchemist"),
  (79,28,"Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom","que mata a quienquiera que tenga su nombre escrito, comienza","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba"),
  (80,18,"JoJos_Bizarre_Adventure Bleach Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super","Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","voluntad, lucha por sobrevivir en un mundo donde los humanos","Assassination_Classroom Noragami Parasyte_The_Maxim");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (81,145,"Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","Naruto_Shippuden One_Piece Death_Note Attack_on_Titan","Demon_Slayer_Kimetsu_no_Yaiba: Tanjiro_Kamado se embarca en una misión para vengar a","Noragami Parasyte_The_Maxim Violet_Evergarden"),
  (82,20,"Naruto_Shippuden One_Piece Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online My_Hero_Academia","Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April","contra su voluntad, lucha por sobrevivir en un mundo donde","Dragon_Ball_Z Black_Clover Haikyuu"),
  (83,6,"Sword_Art_Online","Black_Clover Haikyuu JoJos_Bizarre_Adventure Bleach","de los eventos de Naruto, esta serie sigue las aventuras","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z"),
  (84,61,"Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba","Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z","unen al ejército para descubrir los secretos detrás de estos","Bleach Your_Lie_in_April Fullmetal_Alchemist"),
  (85,61,"JoJos_Bizarre_Adventure Bleach Your_Lie_in_April Fullmetal_Alchemist","Attack_on_Titan Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia","ghoul contra su voluntad, lucha por sobrevivir en un mundo","Haikyuu JoJos_Bizarre_Adventure Bleach"),
  (86,146,"My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter","un héroe tan poderoso que derrota a sus enemigos de","JoJos_Bizarre_Adventure Bleach Your_Lie_in_April"),
  (87,116,"Bleach Your_Lie_in_April Fullmetal_Alchemist","Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","voluntad, lucha por sobrevivir en un mundo donde los humanos","Steins_Gate Dragon_Ball_Z Black_Clover"),
  (88,76,"Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","cuaderno que mata a quienquiera que tenga su nombre escrito,","Dragon_Ball_Super Assassination_Classroom Noragami"),
  (89,28,"Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba","Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail","de resucitar a su madre usando la alquimia. Sword_Art_Online: En","Steins_Gate Dragon_Ball_Z Black_Clover"),
  (90,146,"Steins_Gate","Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","a sus enemigos de un solo golpe, busca emoción en","Black_Clover Haikyuu JoJos_Bizarre_Adventure");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (91,119,"Parasyte_The_Maxim","One_Piece Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood","devoradores de humanos, Eren_Yeager y sus amigos se unen al","Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia"),
  (92,116,"Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super Assassination_Classroom Noragami","Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion","escrito, comienza una intensa batalla intelectual con un detective. Attack_on_Titan:","Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate"),
  (93,7,"Attack_on_Titan Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba","Dragon_Ball_Super Assassination_Classroom Noragami Parasyte_The_Maxim","jugadores, enfrentando desafíos mortales mientras intentan encontrar la salida. My_Hero_Academia:","Noragami Parasyte_The_Maxim Violet_Evergarden"),
  (94,98,"Dragon_Ball_Z Black_Clover","Mob_Psycho_100 Naruto_Shippuden One_Piece Death_Note","Tanjiro_Kamado se embarca en una misión para vengar a su","Black_Clover Haikyuu JoJos_Bizarre_Adventure"),
  (95,45,"Black_Clover Haikyuu JoJos_Bizarre_Adventure Bleach","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","de Naruto, esta serie sigue las aventuras de Naruto_Uzumaki mientras","Dragon_Ball_Z Black_Clover Haikyuu"),
  (96,32,"Assassination_Classroom Noragami","Dragon_Ball_Z Black_Clover Haikyuu JoJos_Bizarre_Adventure","sus amigos se unen al ejército para descubrir los secretos","Violet_Evergarden Erased Mob_Psycho_100"),
  (97,58,"One_Piece Death_Note Attack_on_Titan Fullmetal_Alchemist Sword_Art_Online","Erased Mob_Psycho_100 Naruto_Shippuden One_Piece","encuentra un cuaderno que mata a quienquiera que tenga su","Cowboy_Bebop Hunter_x_Hunter Fairy_Tail"),
  (98,26,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion","Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion","tan poderoso que derrota a sus enemigos de un solo","Parasyte_The_Maxim Violet_Evergarden Erased"),
  (99,124,"Assassination_Classroom Noragami Parasyte_The_Maxim","Noragami Parasyte_The_Maxim Violet_Evergarden Erased","en el Hokage y enfrenta amenazas más oscuras. One_Piece: Monkey_D_Luffy","Noragami Parasyte_The_Maxim Violet_Evergarden"),
  (100,97,"Erased Mob_Psycho_100","Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail","de resucitar a su madre usando la alquimia. Sword_Art_Online: En","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super");
INSERT INTO `genero` (`id`,`id_usuario`,`animes_mangas_vistos`,`mas_vistos`,`breve_descripcion`,`mas_gustados`)
VALUES
  (101,81,"Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super","Haikyuu JoJos_Bizarre_Adventure Bleach Your_Lie_in_April","ghoul contra su voluntad, lucha por sobrevivir en un mundo","One_Punch_Man Tokyo_Ghoul Cowboy_Bebop"),
  (102,63,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba One_Punch_Man","Naruto_Shippuden: Después de los eventos de Naruto, esta serie sigue","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super"),
  (103,38,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion","Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","se embarca en una misión para vengar a su familia","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z"),
  (104,22,"One_Piece Death_Note","Code_Geass_Lelouch_of_the_Rebellion Steins_Gate Dragon_Ball_Z Black_Clover","mayoría de las personas tienen superpoderes, Izuku_Midoriya busca convertirse en","Attack_on_Titan Fullmetal_Alchemist Sword_Art_Online"),
  (105,73,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion","Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","Ken_Kaneki, tras ser transformado en ghoul contra su voluntad, lucha","Assassination_Classroom Noragami Parasyte_The_Maxim"),
  (106,4,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter","Death_Note Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online","Naruto, esta serie sigue las aventuras de Naruto_Uzumaki mientras busca","Bleach Your_Lie_in_April Fullmetal_Alchemist"),
  (107,67,"Attack_on_Titan Fullmetal_Alchemist_Brotherhood Sword_Art_Online My_Hero_Academia","Bleach Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super","los eventos de Naruto, esta serie sigue las aventuras de","Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba"),
  (108,33,"Neon_Genesis_Evangelion Code_Geass_Lelouch_of_the_Rebellion Steins_Gate","Steins_Gate Dragon_Ball_Z Black_Clover Haikyuu","que tenga su nombre escrito, comienza una intensa batalla intelectual","Your_Lie_in_April Fullmetal_Alchemist Dragon_Ball_Super"),
  (109,146,"One_Punch_Man Tokyo_Ghoul Cowboy_Bebop Hunter_x_Hunter Fairy_Tail","Violet_Evergarden Erased Mob_Psycho_100 Naruto_Shippuden","secretos detrás de estos monstruos. Fullmetal_Alchemist_Brotherhood: Los hermanos Edward_Elric y","Violet_Evergarden Erased Mob_Psycho_100"),
  (110,16,"Fullmetal_Alchemist Sword_Art_Online My_Hero_Academia Demon_Slayer_Kimetsu_no_Yaiba","Violet_Evergarden Erased Mob_Psycho_100 Naruto_Shippuden","convertirse en el Hokage y enfrenta amenazas más oscuras. One_Piece:","Erased Mob_Psycho_100 Naruto_Shippuden");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (1,110,"Tatsunoko_Production","Clannad K-On! Anohana","Black_Clover Haikyuu Violet_Evergarden","Violet_Evergarden"),
  (2,109,"P.A_Works","Fairy_Tail Hunter_x_Hunter Black_Clover","Sword_Art_Online One_Piece One_Punch_Man","Clannad"),
  (3,108,"Sunrise","JoJos_Bizarre_Adventure Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba","Violet_Evergarden Erased Mob_Psycho_100","Noragami"),
  (4,107,"GoHands","Attack_on_Titan Death_Note Sword_Art_Online","K-On! Anohana Dragon_Ball_Z","Noragami"),
  (5,106,"","Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba Cowboy_Bebop","One_Piece One_Punch_Man Naruto","One_Piece"),
  (6,105,"White_Fox","Naruto Fairy_Tail Hunter_x_Hunter","Tokyo_Ghoul My_Hero_Academia Attack_on_Titan","Tokyo_Ghoul"),
  (7,104,"White_Fox","K-On! Anohana Dragon_Ball_Z","Parasyte_The_Maxim Violet_Evergarden Erased","Tokyo_Ghoul"),
  (8,103,"A-1_Pictures","Naruto Fairy_Tail Hunter_x_Hunter","Black_Clover Haikyuu Violet_Evergarden","Haikyuu"),
  (9,102,"P.A_Works","Death_Note Sword_Art_Online One_Piece","Noragami Parasyte_The_Maxim Violet_Evergarden","Anohana"),
  (10,101,"Hal_Film_Maker","Erased Mob_Psycho_100 Clannad","Fullmetal_Alchemist_Brotherhood Assassination_Classroom Black_Clover","Erased");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (11,100,"Ufotable","Steins_Gate Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul","Erased Mob_Psycho_100 Clannad","Fullmetal_Alchemist_Brotherhood"),
  (12,99,"Production_I.G","Hunter_x_Hunter Black_Clover JoJos_Bizarre_Adventure","One_Punch_Man Naruto Fairy_Tail","Code_Geass_Lelouch_of_the_Rebellion"),
  (13,98,"TMS_Entertainment","Demon_Slayer_Kimetsu_no_Yaiba Cowboy_Bebop Noragami","Parasyte_The_Maxim Violet_Evergarden Erased","Fairy_Tail"),
  (14,97,"Silver_Link","Clannad K-On! Anohana","Neon_Genesis_Evangelion Steins_Gate Code_Geass_Lelouch_of_the_Rebellion","Parasyte_The_Maxim"),
  (15,96,"Satelight","Hunter_x_Hunter Black_Clover JoJos_Bizarre_Adventure","Black_Clover Haikyuu Violet_Evergarden","Fairy_Tail"),
  (16,95,"Satelight","Violet_Evergarden Erased Mob_Psycho_100","Cowboy_Bebop Noragami Parasyte_The_Maxim","Black_Clover"),
  (17,94,"P.A_Works","Attack_on_Titan Death_Note Sword_Art_Online","Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul My_Hero_Academia","Your_Lie_in_April"),
  (18,93,"Encourage_Films","One_Punch_Man Naruto Fairy_Tail","Neon_Genesis_Evangelion Steins_Gate Code_Geass_Lelouch_of_the_Rebellion","JoJos_Bizarre_Adventure"),
  (19,92,"A-1_Pictures","Dragon_Ball_Z Haikyuu Fullmetal_Alchemist_Brotherhood","Mob_Psycho_100 Clannad K-On!","One_Punch_Man"),
  (20,91,"8bit","Mob_Psycho_100 Clannad K-On!","K-On! Anohana Dragon_Ball_Z","Mob_Psycho_100");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (21,90,"Lerche","One_Piece One_Punch_Man Naruto","Fullmetal_Alchemist Neon_Genesis_Evangelion Steins_Gate","Hunter_x_Hunter"),
  (22,89,"Encourage_Films","Haikyuu Fullmetal_Alchemist_Brotherhood Assassination_Classroom","Neon_Genesis_Evangelion Steins_Gate Code_Geass_Lelouch_of_the_Rebellion","Sword_Art_Online"),
  (23,88,"TMS_Entertainment","Haikyuu Violet_Evergarden Erased","Naruto Fairy_Tail Hunter_x_Hunter","Hunter_x_Hunter"),
  (24,87,"Diomedea","Hunter_x_Hunter Black_Clover JoJos_Bizarre_Adventure","Death_Note Sword_Art_Online One_Piece","Mob_Psycho_100"),
  (25,86,"Diomedea","K-On! Anohana Dragon_Ball_Z","Fullmetal_Alchemist_Brotherhood Assassination_Classroom Black_Clover","One_Piece"),
  (26,85,"Artland","Noragami Parasyte_The_Maxim Violet_Evergarden","Dragon_Ball_Z Haikyuu Fullmetal_Alchemist_Brotherhood","Black_Clover"),
  (27,84,"Tatsunoko_Production","Neon_Genesis_Evangelion Steins_Gate Code_Geass_Lelouch_of_the_Rebellion","Death_Note Sword_Art_Online One_Piece","Mob_Psycho_100"),
  (28,83,"Tatsunoko_Production","Haikyuu Violet_Evergarden Erased","Black_Clover JoJos_Bizarre_Adventure Your_Lie_in_April","Demon_Slayer_Kimetsu_no_Yaiba"),
  (29,82,"Toei_Animation","One_Piece One_Punch_Man Naruto","Haikyuu Violet_Evergarden Erased","Haikyuu"),
  (30,81,"P.A_Works","Dragon_Ball_Z Haikyuu Fullmetal_Alchemist_Brotherhood","Clannad K-On! Anohana","Hunter_x_Hunter");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (31,80,"Ufotable","Demon_Slayer_Kimetsu_no_Yaiba Cowboy_Bebop Noragami","One_Punch_Man Naruto Fairy_Tail","Your_Lie_in_April"),
  (32,79,"OLM","Parasyte_The_Maxim Violet_Evergarden Erased","Erased Mob_Psycho_100 Clannad","Attack_on_Titan"),
  (33,78,"Madhouse","Sword_Art_Online One_Piece One_Punch_Man","Tokyo_Ghoul My_Hero_Academia Attack_on_Titan","Black_Clover"),
  (34,77,"Silver_Link","Fullmetal_Alchemist Neon_Genesis_Evangelion Steins_Gate","Naruto Fairy_Tail Hunter_x_Hunter","Erased"),
  (35,76,"Artland","Haikyuu Fullmetal_Alchemist_Brotherhood Assassination_Classroom","Violet_Evergarden Erased Mob_Psycho_100","Mob_Psycho_100"),
  (36,75,"Xebec","Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul My_Hero_Academia","Mob_Psycho_100 Clannad K-On!","Steins_Gate"),
  (37,74,"Encourage_Films","My_Hero_Academia Attack_on_Titan Death_Note","My_Hero_Academia Attack_on_Titan Death_Note","Erased"),
  (38,73,"Ufotable","Erased Mob_Psycho_100 Clannad","Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba Cowboy_Bebop","Dragon_Ball_Z"),
  (39,72,"Bee_Train","Haikyuu Fullmetal_Alchemist_Brotherhood Assassination_Classroom","Sword_Art_Online One_Piece One_Punch_Man","Violet_Evergarden"),
  (40,71,"Madhouse","K-On! Anohana Dragon_Ball_Z","Sword_Art_Online One_Piece One_Punch_Man","Hunter_x_Hunter");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (41,70,"","Neon_Genesis_Evangelion Steins_Gate Code_Geass_Lelouch_of_the_Rebellion","Haikyuu Violet_Evergarden Erased","Fairy_Tail"),
  (42,69,"Feel","Attack_on_Titan Death_Note Sword_Art_Online","K-On! Anohana Dragon_Ball_Z","Haikyuu"),
  (43,68,"Kyoto_Animation","K-On! Anohana Dragon_Ball_Z","Hunter_x_Hunter Black_Clover JoJos_Bizarre_Adventure","Dragon_Ball_Z"),
  (44,67,"Lerche","Sword_Art_Online One_Piece One_Punch_Man","Violet_Evergarden Erased Mob_Psycho_100","Mob_Psycho_100"),
  (45,66,"Studio_Ghibli","Neon_Genesis_Evangelion Steins_Gate Code_Geass_Lelouch_of_the_Rebellion","Fullmetal_Alchemist Neon_Genesis_Evangelion Steins_Gate","Clannad"),
  (46,65,"Pierrot","Violet_Evergarden Erased Mob_Psycho_100","Neon_Genesis_Evangelion Steins_Gate Code_Geass_Lelouch_of_the_Rebellion","Demon_Slayer_Kimetsu_no_Yaiba"),
  (47,64,"Gainax","Noragami Parasyte_The_Maxim Violet_Evergarden","Dragon_Ball_Z Haikyuu Fullmetal_Alchemist_Brotherhood","Sword_Art_Online"),
  (48,63,"Sunrise","Black_Clover JoJos_Bizarre_Adventure Your_Lie_in_April","JoJos_Bizarre_Adventure Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba","My_Hero_Academia"),
  (49,62,"Tatsunoko_Production","Mob_Psycho_100 Clannad K-On!","K-On! Anohana Dragon_Ball_Z","Haikyuu"),
  (50,61,"Bee_Train","Assassination_Classroom Black_Clover Haikyuu","Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba Cowboy_Bebop","Violet_Evergarden");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (51,60,"Studio_Dei","Tokyo_Ghoul My_Hero_Academia Attack_on_Titan","Haikyuu Violet_Evergarden Erased","Haikyuu"),
  (52,59,"White_Fox","Black_Clover Haikyuu Violet_Evergarden","Clannad K-On! Anohana","Assassination_Classroom"),
  (53,58,"8bit","Anohana Dragon_Ball_Z Haikyuu","Parasyte_The_Maxim Violet_Evergarden Erased","Death_Note"),
  (54,57,"Asahi_Production","One_Piece One_Punch_Man Naruto","Demon_Slayer_Kimetsu_no_Yaiba Cowboy_Bebop Noragami","Violet_Evergarden"),
  (55,56,"J.C_Staff","Clannad K-On! Anohana","Black_Clover Haikyuu Violet_Evergarden","Noragami"),
  (56,55,"Asahi_Production","Noragami Parasyte_The_Maxim Violet_Evergarden","Mob_Psycho_100 Clannad K-On!","K-On!"),
  (57,54,"Satelight","K-On! Anohana Dragon_Ball_Z","Mob_Psycho_100 Clannad K-On!","Steins_Gate"),
  (58,53,"Madhouse","Violet_Evergarden Erased Mob_Psycho_100","Steins_Gate Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul","Noragami"),
  (59,52,"Pierrot","Naruto Fairy_Tail Hunter_x_Hunter","Clannad K-On! Anohana","Dragon_Ball_Z"),
  (60,51,"Toei_Animation","Dragon_Ball_Z Haikyuu Fullmetal_Alchemist_Brotherhood","Cowboy_Bebop Noragami Parasyte_The_Maxim","Erased");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (61,50,"Shaft","Parasyte_The_Maxim Violet_Evergarden Erased","Black_Clover JoJos_Bizarre_Adventure Your_Lie_in_April","My_Hero_Academia"),
  (62,49,"Mappa","One_Piece One_Punch_Man Naruto","Mob_Psycho_100 Clannad K-On!","Anohana"),
  (63,48,"White_Fox","Erased Mob_Psycho_100 Clannad","Haikyuu Fullmetal_Alchemist_Brotherhood Assassination_Classroom","Fullmetal_Alchemist_Brotherhood"),
  (64,47,"White_Fox","Erased Mob_Psycho_100 Clannad","Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul My_Hero_Academia","One_Piece"),
  (65,46,"Kyoto_Animation","Noragami Parasyte_The_Maxim Violet_Evergarden","Death_Note Sword_Art_Online One_Piece","Mob_Psycho_100"),
  (66,45,"A-1_Pictures","K-On! Anohana Dragon_Ball_Z","Fairy_Tail Hunter_x_Hunter Black_Clover","Hunter_x_Hunter"),
  (67,44,"Feel","Sword_Art_Online One_Piece One_Punch_Man","Black_Clover JoJos_Bizarre_Adventure Your_Lie_in_April","Assassination_Classroom"),
  (68,43,"Bones","Violet_Evergarden Erased Mob_Psycho_100","Erased Mob_Psycho_100 Clannad","Code_Geass_Lelouch_of_the_Rebellion"),
  (69,42,"Production_I.G","My_Hero_Academia Attack_on_Titan Death_Note","Sword_Art_Online One_Piece One_Punch_Man","K-On!"),
  (70,41,"Kyoto_Animation","One_Punch_Man Naruto Fairy_Tail","Black_Clover JoJos_Bizarre_Adventure Your_Lie_in_April","Parasyte_The_Maxim");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (71,40,"Gainax","My_Hero_Academia Attack_on_Titan Death_Note","Anohana Dragon_Ball_Z Haikyuu","Hunter_x_Hunter"),
  (72,39,"A-1_Pictures","Haikyuu Violet_Evergarden Erased","Haikyuu Violet_Evergarden Erased","One_Piece"),
  (73,38,"Studio_Ghibli","Haikyuu Violet_Evergarden Erased","Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba Cowboy_Bebop","Clannad"),
  (74,37,"8bit","Black_Clover Haikyuu Violet_Evergarden","My_Hero_Academia Attack_on_Titan Death_Note","Attack_on_Titan"),
  (75,36,"Kyoto_Animation","K-On! Anohana Dragon_Ball_Z","Assassination_Classroom Black_Clover Haikyuu","Black_Clover"),
  (76,35,"Trigger","JoJos_Bizarre_Adventure Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba","Fairy_Tail Hunter_x_Hunter Black_Clover","Fullmetal_Alchemist"),
  (77,34,"Xebec","Fullmetal_Alchemist_Brotherhood Assassination_Classroom Black_Clover","One_Piece One_Punch_Man Naruto","Dragon_Ball_Z"),
  (78,33,"Madhouse","Mob_Psycho_100 Clannad K-On!","Naruto Fairy_Tail Hunter_x_Hunter","Death_Note"),
  (79,32,"Hal_Film_Maker","Fairy_Tail Hunter_x_Hunter Black_Clover","Violet_Evergarden Erased Mob_Psycho_100","Erased"),
  (80,31,"Deen","Haikyuu Violet_Evergarden Erased","Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul My_Hero_Academia","Sword_Art_Online");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (81,30,"Dogakobo","Dragon_Ball_Z Haikyuu Fullmetal_Alchemist_Brotherhood","Naruto Fairy_Tail Hunter_x_Hunter","Sword_Art_Online"),
  (82,29,"Toei_Animation","Parasyte_The_Maxim Violet_Evergarden Erased","Mob_Psycho_100 Clannad K-On!","Black_Clover"),
  (83,28,"Silver_Link","Attack_on_Titan Death_Note Sword_Art_Online","My_Hero_Academia Attack_on_Titan Death_Note","JoJos_Bizarre_Adventure"),
  (84,27,"Toei_Animation","Parasyte_The_Maxim Violet_Evergarden Erased","Haikyuu Fullmetal_Alchemist_Brotherhood Assassination_Classroom","Tokyo_Ghoul"),
  (85,26,"Lerche","JoJos_Bizarre_Adventure Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba","Haikyuu Violet_Evergarden Erased","Parasyte_The_Maxim"),
  (86,25,"Zexcs","Erased Mob_Psycho_100 Clannad","Erased Mob_Psycho_100 Clannad","Assassination_Classroom"),
  (87,24,"Dogakobo","Death_Note Sword_Art_Online One_Piece","Tokyo_Ghoul My_Hero_Academia Attack_on_Titan","Steins_Gate"),
  (88,23,"A-1_Pictures","Fairy_Tail Hunter_x_Hunter Black_Clover","Haikyuu Violet_Evergarden Erased","Haikyuu"),
  (89,22,"Sunrise","One_Piece One_Punch_Man Naruto","Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba Cowboy_Bebop","Violet_Evergarden"),
  (90,21,"Lerche","Violet_Evergarden Erased Mob_Psycho_100","Steins_Gate Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul","One_Punch_Man");
INSERT INTO `anime` (`id`,`id_genero`,`compañia_animadora`,`mas_gustados`,`mas_vistos`,`nombre`)
VALUES
  (91,20,"Dogakobo","Mob_Psycho_100 Clannad K-On!","Clannad K-On! Anohana","Fullmetal_Alchemist"),
  (92,19,"Lerche","Anohana Dragon_Ball_Z Haikyuu","JoJos_Bizarre_Adventure Your_Lie_in_April Demon_Slayer_Kimetsu_no_Yaiba","K-On!"),
  (93,18,"Hal_Film_Maker","Attack_on_Titan Death_Note Sword_Art_Online","Violet_Evergarden Erased Mob_Psycho_100","Noragami"),
  (94,17,"Kyoto_Animation","Black_Clover JoJos_Bizarre_Adventure Your_Lie_in_April","One_Piece One_Punch_Man Naruto","Demon_Slayer_Kimetsu_no_Yaiba"),
  (95,16,"Kyoto_Animation","Steins_Gate Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul","Erased Mob_Psycho_100 Clannad","Hunter_x_Hunter"),
  (96,15,"Satelight","Assassination_Classroom Black_Clover Haikyuu","Fullmetal_Alchemist Neon_Genesis_Evangelion Steins_Gate","K-On!"),
  (97,14,"Diomedea","Tokyo_Ghoul My_Hero_Academia Attack_on_Titan","Attack_on_Titan Death_Note Sword_Art_Online","Sword_Art_Online"),
  (98,13,"Dogakobo","Steins_Gate Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul","Noragami Parasyte_The_Maxim Violet_Evergarden","Anohana"),
  (99,12,"Nippon_Animation","Fairy_Tail Hunter_x_Hunter Black_Clover","Steins_Gate Code_Geass_Lelouch_of_the_Rebellion Tokyo_Ghoul","Code_Geass_Lelouch_of_the_Rebellion"),
  (100,11,"OLM","Dragon_Ball_Z Haikyuu Fullmetal_Alchemist_Brotherhood","Black_Clover JoJos_Bizarre_Adventure Your_Lie_in_April","Neon_Genesis_Evangelion");
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (1,27,1),
  (2,29,2),
  (3,27,3),
  (4,44,4),
  (5,25,5),
  (6,85,6),
  (7,31,7),
  (8,48,8),
  (9,24,9),
  (10,44,10);
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (11,33,11),
  (12,1,12),
  (13,94,13),
  (14,75,14),
  (15,28,15),
  (16,98,16),
  (17,77,17),
  (18,38,18),
  (19,55,19),
  (20,93,20);
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (21,95,21),
  (22,60,22),
  (23,84,23),
  (24,43,24),
  (25,45,25),
  (26,34,26),
  (27,45,27),
  (28,73,28),
  (29,51,29),
  (30,1,30);
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (31,16,31),
  (32,99,32),
  (33,89,33),
  (34,96,34),
  (35,66,35),
  (36,43,36),
  (37,11,37),
  (38,90,38),
  (39,23,39),
  (40,55,40);
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (41,66,41),
  (42,31,42),
  (43,3,43),
  (44,2,44),
  (45,69,45),
  (46,47,46),
  (47,32,47),
  (48,79,48),
  (49,18,49),
  (50,81,50);
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (51,83,51),
  (52,26,52),
  (53,45,53),
  (54,18,54),
  (55,50,55),
  (56,88,56),
  (57,53,57),
  (58,4,58),
  (59,54,59),
  (60,70,60);
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (61,17,61),
  (62,81,62),
  (63,69,63),
  (64,82,64),
  (65,32,65),
  (66,98,66),
  (67,20,67),
  (68,76,68),
  (69,51,69),
  (70,48,70);
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (71,60,71),
  (72,8,72),
  (73,21,73),
  (74,41,74),
  (75,32,75),
  (76,79,76),
  (77,67,77),
  (78,21,78),
  (79,53,79),
  (80,32,80);
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (81,86,81),
  (82,58,82),
  (83,83,83),
  (84,64,84),
  (85,2,85),
  (86,9,86),
  (87,11,87),
  (88,69,88),
  (89,55,89),
  (90,85,90);
INSERT INTO `lista_anime` (`id`,`id_lista`,`id_anime`)
VALUES
  (91,39,91),
  (92,70,92),
  (93,7,93),
  (94,41,94),
  (95,91,95),
  (96,66,96),
  (97,3,97),
  (98,6,98),
  (99,42,99),
  (100,93,100);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (1,89),
  (2,95),
  (3,5),
  (4,1),
  (5,14),
  (6,13),
  (7,61),
  (8,51),
  (9,24),
  (10,88);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (11,39),
  (12,79),
  (13,29),
  (14,29),
  (15,5),
  (16,11),
  (17,4),
  (18,38),
  (19,33),
  (20,4);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (21,52),
  (22,47),
  (23,91),
  (24,75),
  (25,52),
  (26,40),
  (27,59),
  (28,22),
  (29,40),
  (30,41);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (31,16),
  (32,78),
  (33,60),
  (34,61),
  (35,2),
  (36,86),
  (37,20),
  (38,16),
  (39,66),
  (40,73);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (41,83),
  (42,93),
  (43,57),
  (44,41),
  (45,93),
  (46,69),
  (47,57),
  (48,67),
  (49,64),
  (50,12);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (51,50),
  (52,31),
  (53,40),
  (54,68),
  (55,43),
  (56,42),
  (57,4),
  (58,50),
  (59,53),
  (60,83);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (61,37),
  (62,93),
  (63,42),
  (64,51),
  (65,74),
  (66,34),
  (67,69),
  (68,2),
  (69,13),
  (70,48);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (71,98),
  (72,70),
  (73,40),
  (74,59),
  (75,58),
  (76,53),
  (77,84),
  (78,12),
  (79,43),
  (80,64);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (81,27),
  (82,50),
  (83,54),
  (84,84),
  (85,23),
  (86,75),
  (87,94),
  (88,20),
  (89,77),
  (90,24);
INSERT INTO `usuario_anime` (`id_usuario`,`id_anime`)
VALUES
  (91,20),
  (92,11),
  (93,17),
  (94,27),
  (95,87),
  (96,32),
  (97,12),
  (98,31),
  (99,1),
  (100,25);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (1,77,"0","Botchan_(Manga)","Boy's_Abyss",146),
  (2,94,"0","Haikyuu","Adolf_(Nueva_Edición)",28),
  (3,7,"0","Ana,_la_de_Avonlea","Children_of_the_Whales",127),
  (4,5,"1","Hunter_x_Hunter","de",250),
  (5,109,"1","Bota_Bota","Chitose_etc.",179),
  (6,68,"0","Agente_de_fútbol","¡¡Amasando!!_Ja-Pan",208),
  (7,56,"1","Chunyan,_La_Nueva_Leyenda","ChocoMimi",303),
  (8,55,"0","Mob_Psycho_100","BTOOOM!",102),
  (9,11,"1","Alabanza","Boku_wa_Mari_no_naka",245),
  (10,64,"1","K-On","Bota_Bota",274);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (11,73,"1","Candy_Candy_Corazón_(Comic-books_Color)","ACCA_13",89),
  (12,50,"1","Re_Zero","Abara_(Master_Edition)",61),
  (13,33,"0","Vinland_Saga","Akane_banashi",201),
  (14,35,"1","Chicas_de_Instituto","Buscadores_de_cadáveres",22),
  (15,51,"1","Alicia_en_el_País_de_las_Maravillas_(Jun_Abe)","Chaos_Game",0),
  (16,42,"1","All_colour_but_the_black","Afro_Samurai",129),
  (17,51,"0","Adabana","Akame_ga_Kill!_1,5_Historias_del_Night_Raid_y_epílogo",108),
  (18,71,"1","Fairy_Tail","Chaos_Game",74),
  (19,52,"1","Acabé_hecha_un_trapo_huyendo_de_la_realidad","Adolf_(Edición_Integral)_(2010)",25),
  (20,81,"1","Kaguya-sama_Love_is_War","Chainsaw_Man_(Castellano)",127);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (21,105,"1","Casas_con_historias._El_arte_de_Seiji_Yoshida","Boys_Run_the_Riot",128),
  (22,53,"0","A·I_Revolution","nombres",46),
  (23,72,"1","Brutal:_confesiones_de_un_detective_de_homicidios","ChatGPT",154),
  (24,69,"1","Chiikawa","Akumetsu",106),
  (25,76,"1","Carole_&_Tuesday","All_colour_but_the_black",271),
  (26,38,"0","CardCaptor_Sakura_(EDT/Glénat)","Cazadores_de_Magos_(3ª_Parte)",110),
  (27,52,"1","One_Punch_Man","de",265),
  (28,47,"0","Chico_Secreto,_Futuro_Efímero","CardCaptor_Sakura_-_Art_Book",74),
  (29,58,"1","Called_Game","Abara",115),
  (30,102,"1","Carole_&_Tuesday","Capitán_Harlock,El_Pirata_Espacial(EDT/Glénat)",315);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (31,63,"0","The_Promised_Neverland","de",49),
  (32,6,"1","Slam_Dunk","¡¡Amasando!!_Ja-Pan",22),
  (33,2,"1","Accel_World_(Manga)","Afro_Samurai_(Edición_Completa)",329),
  (34,20,"0","Chobits_(Edición_Integral)","tienes",235),
  (35,31,"0","Chiki_Chiki_Banana","Box._Hay_algo_dentro_de_la_caja",272),
  (36,70,"1","Change_Up!!","Amor,_devoraré_tu_corazón",190),
  (37,23,"1","Haikyuu","Chopperman",338),
  (38,13,"1","Golden_Kamuy","nombres",254),
  (39,53,"0","Buddy_Cat","Amar_y_ser_Amado,_Dejar_y_ser_Dejado",207),
  (40,65,"1","BREAK_THE_BORDER","Brain_Powered_(Biblioteca_Manga)",26);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (41,56,"0","A_Silent_Voice","Alita,Ángel_de_Combate(1ª_Parte)",90),
  (42,97,"1","That_Time_I_Got_Reincarnated_as_a_Slime","Aleluya_Demonio",77),
  (43,67,"0","Buda_(Nueva_Edición)","Alabaster_(Planeta)",154),
  (44,1,"1","Hunter_x_Hunter","mangas",111),
  (45,9,"1","Akira_-_Portfolio","y",25),
  (46,94,"0","Alice_12","Cappuccino",284),
  (47,69,"1","Carnaza_humana","Bride_Stories",203),
  (48,31,"1","Bloom_Into_You","ACCA_13",202),
  (49,11,"0","Boys_Run_the_Riot","espacio",95),
  (50,23,"0","Dr_Stone","An_otaku_called_God_(Euskera)",103);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (51,3,"0","Akame_ga_Kill!_Guía_Oficial","Bota_Bota",249),
  (52,25,"1","Ancient_Magus'_Bride","Chicas_de_Instituto",193),
  (53,57,"0","A·I_Revolution","150",207),
  (54,93,"1","Noragami","Capitán_Harlock,_Dimension_Voyage",145),
  (55,92,"0","A_5_minutos_andando_del_final","¡Ah,Mi_Diosa!(Tomos)",112),
  (56,39,"0","Akira_(Color)_(Ediciones_B)","Ana,_la_de_la_I",327),
  (57,95,"0","Akame_ga_Kill!","Bullet_the_Wizard",96),
  (58,103,"0","Chobits_(Edición_Integral)","Chopperman",228),
  (59,65,"1","Black_Clover","Candy_Candy_Corazón_(Album_Color)",331),
  (60,94,"1","Ah!Mi_Diosa(Comic-books_2ª_Parte)","Cat's_Eye_(Complete_Edition)",207);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (61,99,"0","Akane_banashi","User",183),
  (62,65,"0","The_Ancient_Magus'_Bride","Carole_&_Tuesday",333),
  (63,32,"0","Akira_Club","Capitán_Tsubasa_(Planeta)",107),
  (64,47,"0","Botchan_(Manga)","ponle",117),
  (65,62,"1","My_Hero_Academia","con",310),
  (66,77,"0","Kuroko_no_Basket","Caramelo,_canela_y_palomitas",140),
  (67,49,"1","Amor_a_Segunda_Vista","Catarsis",238),
  (68,47,"0","Along_with_The_Gods","Alita,Ángel_de_Combate(4ª_Parte)",207),
  (69,20,"1","Alicia_en_el_País_de_las_Maravillas_(Jun_Abe)","Catarsis",281),
  (70,90,"0","Chobits_(Edición_Integral)","Alabaster_(Astiberri)",337);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (71,34,"0","Buddy_Cat","tengan",170),
  (72,37,"1","Cells_at_Work!","A_5_minutos_andando_del_final",142),
  (73,16,"1","One_Piece","Carole_&_Tuesday",266),
  (74,61,"1","The_Rising_of_the_Shield_Hero","C",106),
  (75,10,"1","March_Comes_in_Like_a_Lion","Chiikawa",48),
  (76,35,"0","C","Akumetsu",243),
  (77,52,"1","Borregos_en_la_Red","Ah!Mi_Diosa(Comic-books_2ª_Parte)",308),
  (78,56,"0","Bloom_Into_You","Canal_W",258),
  (79,56,"1","Alas_de_guerra_sobre_el_Japón","Alien_9",193),
  (80,35,"1","Fire_Force","Cazadora_de_Espíritus",335);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (81,21,"1","Brutal:_confesiones_de_un_detective_de_homicidios","Agente_de_fútbol",271),
  (82,85,"1","Brutal:_confesiones_de_un_detective_de_homicidios","Canción_de_Navidad,_el_manga",220),
  (83,94,"0","Vagabond","con",212),
  (84,85,"1","Chitose_etc.","Ah!Mi_Diosa(Comic-books_2ª_Parte)",134),
  (85,100,"1","K-On","de",216),
  (86,54,"1","Alice_19th","Abrázame_con_toda_tu_Alma",24),
  (87,64,"0","Brave_10","Boys_Run_the_Riot",2),
  (88,93,"0","Alice_in_Borderland","Casualmente",194),
  (89,79,"1","Akame_ga_Kill!_1,5_Historias_del_Night_Raid_y_epílogo","Alita,Ángel_de_Combate(1ª_Parte)",302),
  (90,31,"1","Kaguya-sama_Love_is_War","bajas",291);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (91,51,"1","Buda_(Nueva_Edición)","Chica_Secreta",148),
  (92,39,"0","Casualmente","Cazadora_de_Espíritus",283),
  (93,41,"1","Aleluya_Demonio","Adolf_(Biblioteca_Tezuka)",112),
  (94,87,"1","Choujin_X","Along_with_The_Gods",61),
  (95,84,"1","Chihayafuru","con",336),
  (96,20,"1","Buenos_días,_bella_durmiente","¡¡Amasando!!_Ja-Pan",219),
  (97,30,"1","Cells_at_Work!","Ana,_la_de_Avonlea",115),
  (98,80,"0","Café_Diabólico,_Amor_Agridulce","Akuma_no_Riddle",17),
  (99,82,"0","Akane_banashi","Canción_de_Navidad,_el_manga",209),
  (100,30,"1","BREAK_THE_BORDER","Cazadores_de_Magos_(2ª_Parte)",317);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (101,9,"0","BTOOOM!","BTOOOM!",166),
  (102,27,"1","Bullet_the_Wizard","Cells_at_Work!",131),
  (103,78,"0","Hunter_x_Hunter","Ajin_(Semihumano)",92),
  (104,90,"0","Buda_(Nueva_Edición)","Amar_y_ser_Amado,_Dejar_y_ser_Dejado",349),
  (105,67,"0","Café_Diabólico,_Amor_Agridulce","Akira_(Color)_(Ediciones_B)",211),
  (106,2,"1","The_Promised_Neverland","Act-Age",90),
  (107,65,"1","Boku_to_majo_ni_tsuite_no_bibôroku_(Título_por_determinar)","Caramelo,_canela_y_palomitas",72),
  (108,91,"0","Air_Gear","ChatGPT",258),
  (109,99,"0","Bleach","Ana_de_las_Tejas_Verdes",222),
  (110,83,"0","Jormungand","Afro_Samurai",247);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (111,67,"1","Fullmetal_Alchemist","Bota_Bota",229),
  (112,41,"0","Brave_10","¡A_los_dieciséis!",192),
  (113,17,"0","¡A_los_dieciséis!","Akira_(Color)_(Comic-books)",163),
  (114,67,"0","Golden_Kamuy","Adam_y_Eve",93),
  (115,67,"0","Akira_(Color)_(Comic-books)","Buscadores_de_cadáveres",285),
  (116,14,"1","CardCaptor_Sakura_(Norma)","Akame_ga_Kill!",276),
  (117,25,"1","Great_Pretender","Bungou_Stray_Dogs",327),
  (118,73,"1","Death_Note","Called_Game",133),
  (119,11,"0","Mob_Psycho_100","Alabaster_(Planeta)",93),
  (120,96,"0","Change_Up!!","Adolf_(Biblioteca_Tezuka)",20);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (121,41,"1","Bokko","Cells_at_Work!_CODE_BLACK",205),
  (122,97,"0","Capitán_Harlock,_Dimension_Voyage","Chaos_Game",75),
  (123,60,"1","Akira_(Color)_(Comic-books)","Adolf_(Edición_Integral)_(2010)",237),
  (124,5,"1","Alice_in_Borderland","Air_Gear",286),
  (125,35,"0","CardCaptor_Sakura_(EDT/Glénat)","All_You_Need_Is_Kill_(Integral)",84),
  (126,85,"0","The_Promised_Neverland","Catarsis",86),
  (127,21,"0","Ancient_Magus'_Bride","Cat's_Eye_(Complete_Edition)",261),
  (128,97,"1","¡Ah,Mi_Diosa!(Tomos)","Chico_Secreto,_Futuro_Efímero",307),
  (129,100,"1","CardCaptor_Sakura_(EDT/Glénat)","Amor_Programable",339),
  (130,35,"0","Chunyan,_La_Nueva_Leyenda","Cherry",342);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (131,11,"1","Erased","Choujin_X",296),
  (132,30,"1","Adolf_(Biblioteca_Tezuka)","Chiikawa",231),
  (133,57,"0","Tower_of_God","Akira_(Color)_(Ediciones_B)",151),
  (134,15,"0","Delicious_in_Dungeon","Akame_ga_Kill!_Memorial_FanBook",184),
  (135,90,"1","Akira_(Color)_(Norma)","Buenos_días,_bella_durmiente",3),
  (136,57,"1","Promised_Neverland","de",255),
  (137,13,"1","Capitán_Tsubasa_(Planeta)","Adolf_(Trazado)",245),
  (138,18,"0","Seraph_of_the_End","Akame_ga_Kill!_Memorial_FanBook",95),
  (139,94,"1","CardCaptor_Sakura:_Clear_Card_Arc","¡Ah,Mi_Diosa!(Tomos)",85),
  (140,70,"1","Spy_x_Family","Carole_&_Tuesday",204);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (141,43,"0","Botchan_(Manga)","Akane_banashi",249),
  (142,101,"1","Alita,Ángel_de_Combate(5ª_Parte)","Amor_al_Desnudo",194),
  (143,63,"0","Breve_historia_del_Robo_Sapiens","en",12),
  (144,99,"0","Capitán_Tsubasa_(Planeta)","Alicia_en_el_País_de_las_Maravillas_(Jun_Abe)",225),
  (145,8,"1","Akame_ga_Kill!_Guía_Oficial","Cappuccino",26),
  (146,58,"0","Cadenas_de_Pasión","¡Ámame!_La_Princesa_del_Instituto_de_Chicos_y_el_Princes_del_Instituto_de_Chicas",283),
  (147,58,"1","Bolsa_de_Papel-kun_está_enamorado","Chiki_Chiki_Banana",209),
  (148,15,"1","Carole_&_Tuesday","Boy's_Abyss",334),
  (149,88,"0","Cat_Shit_One","ChocoMimi",17),
  (150,31,"1","Ai_Shite_Knight_(Título_por_determinar)","cuando",60);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (151,70,"1","Tokyo_Ghoul","Amor_Programable",285),
  (152,56,"1","Dorohedoro","Cherry",143),
  (153,100,"0","Accel_World_(Manga)","Buscando_al_Hombre_Ideal",147),
  (154,12,"0","Calling_You","Change_123",97),
  (155,81,"0","Carnaza_humana","Cat_Street_(Edición_Integral)",184),
  (156,43,"1","Boruto_-Naruto_Next_Generations-","Akira_(Color)_(Ediciones_B)",314),
  (157,19,"0","Grand_Blue","Chihayafuru",215),
  (158,14,"0","Caramelo,_canela_y_palomitas","Chaos_Game",94),
  (159,34,"0","Great_Pretender","Canal_W",253),
  (160,42,"1","Abrázame_con_toda_tu_Alma","Chicas_de_Instituto",348);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (161,42,"0","My_Hero_Academia","Caramelo,_canela_y_palomitas",238),
  (162,26,"1","Adabana","Ah!Mi_Diosa(Comic-books_1ª_Parte)",296),
  (163,80,"1","Haikyuu","Chainsaw_Man_(Castellano)",323),
  (164,70,"0","Ah!Mi_Diosa(Comic-books_2ª_Parte)","Café_Diabólico,_Amor_Agridulce",46),
  (165,7,"0","Capitán_Harlock_(Edición_Integral)_(Norma)","Alien_9",301),
  (166,37,"1","Cells_at_Work!_CODE_BLACK","Chopperman:_¡Adelante,_Sr._Chopper!",276),
  (167,16,"1","Ana,_la_de_la_I","Akira_(Color)_(Ediciones_B)",304),
  (168,99,"1","Chihayafuru","Caramelo,_canela_y_palomitas",3),
  (169,5,"0","Catarsis","ChocoMimi",184),
  (170,15,"1","Gurren_Lagann","Cat's_Eye_(Complete_Edition)",2);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (171,27,"0","Canal_W","Brutal:_confesiones_de_un_detective_de_homicidios",197),
  (172,25,"0","Akira_(Color)_(Comic-books)","Akira_(B/N)_(Ediciones_B)",32),
  (173,73,"0","Cibercafé_a_la_Deriva_(Drifting_Net_Cafe)","Cadenas_de_Pasión",38),
  (174,77,"0","To_Your_Eternity","ChatGPT",32),
  (175,30,"0","Fire_Force","Ana_de_las_Tejas_Verdes",326),
  (176,58,"0","CardCaptor_Sakura:_Clear_Card_Arc","Capitán_Harlock,El_Pirata_Espacial(EDT/Glénat)",169),
  (177,98,"0","¡Achís!_Historias_cortas_de_Naoki_Urasawa","Change_the_World_(Euskera)",23),
  (178,30,"1","Bungou_Stray_Dogs","Café_Diabólico,_Amor_Agridulce",111),
  (179,71,"0","Cat_Shit_One","Botchan_(Manga)",298),
  (180,59,"0","Aleluya_Demonio","Alice_19th",310);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (181,67,"0","Nanatsu_no_Taizai","Bullet_the_Wizard",179),
  (182,4,"1","Chitose_etc.","Buenos_días,_bella_durmiente",287),
  (183,100,"0","Boruto_-Naruto_Next_Generations-","Brain_Powerd_(Tomos)",193),
  (184,68,"1","Aleluya_Demonio","Ai_Shite_Knight_(Título_por_determinar)",305),
  (185,25,"1","Classroom_of_the_Elite","Ambassador_Magma",2),
  (186,7,"0","Akira_(B/N)_(Ediciones_B)","Chicas_de_Instituto",343),
  (187,67,"1","Alita,Ángel_de_Combate(1ª_Parte)","User",56),
  (188,13,"1","Jujutsu_Kaisen","nombres",184),
  (189,71,"0","Air_Gear","¡Achís!_Historias_cortas_de_Naoki_Urasawa",258),
  (190,58,"0","Akira_-_Portfolio","mangas",255);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (191,2,"0","Solo_Leveling","Amor_es_cuando_cesa_la_lluvia",129),
  (192,27,"0","Spy_x_Family","Children_of_the_Whales",286),
  (193,5,"1","Chiki_Chiki_Banana","Akuma_to_Love_Song",187),
  (194,96,"1","Alita,Ángel_de_Combate(4ª_Parte)","barrabaja",297),
  (195,108,"1","Ana,_la_de_la_I","Alabaster_(Planeta)",299),
  (196,51,"0","Bolsa_de_Papel-kun_está_enamorado","de",241),
  (197,52,"0","Alita,Ángel_de_Combate(5ª_Parte)","Cat's_Eye_(Complete_Edition)",230),
  (198,18,"1","Akuma_to_Love_Song","Cherry",137),
  (199,26,"0","¡¡Amasando!!_Ja-Pan","de",87),
  (200,39,"0","Bokko","Akuma_no_Riddle",35);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (201,30,"0","Candy_Candy_Corazón_(Comic-books_Color)","Cibercafé_a_la_Deriva_(Drifting_Net_Cafe)",225),
  (202,71,"0","Toradora","Alita,Ángel_de_Combate(4ª_Parte)",54),
  (203,2,"0","Afro_Samurai","Caramel_Diary",54),
  (204,65,"0","Cat_Street","C",169),
  (205,47,"1","Chainsaw_Man_(Castellano)","A·I_Revolution",320),
  (206,29,"0","All_You_Need_Is_Kill","Chopperman",82),
  (207,42,"0","BREAK_THE_BORDER","Chico_Secreto,_Futuro_Efímero",132),
  (208,42,"1","Adam_y_Eve","Accel_World_(Manga)",161),
  (209,38,"1","Abara","Akuma_to_Love_Song",316),
  (210,65,"0","Buddy_Cat","Adolescente_pero_no_inocente",65);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (211,29,"1","Toradora","barrabaja",170),
  (212,97,"0","Chico_Secreto,_Futuro_Efímero","Alita,Ángel_de_Combate(4ª_Parte)",214),
  (213,96,"0","The_Ancient_Magus'_Bride","All_colour_but_the_black",233),
  (214,19,"1","Land_of_the_Lustrous","Akame_ga_Kill!_Zero",135),
  (215,90,"1","Academia_Neogénesis_Evangelion:_Apocalipsis","Chopperman",178),
  (216,37,"1","Seraph_of_the_End","Brave_10",348),
  (217,64,"0","Breakdown","Chobits_(Edición_Integral)",95),
  (218,106,"1","Akira_(Color)_(Ediciones_B)","Chobits",90),
  (219,35,"1","Boku_to_majo_ni_tsuite_no_bibôroku_(Título_por_determinar)","Air_Gear",225),
  (220,56,"1","Anohana","Akebi’s_Sailor_Uniform",2);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (221,25,"1","ChocoMimi","Capitán_Tsubasa_(Planeta)",280),
  (222,99,"0","ACCA_13","Cadenas_de_Pasión",145),
  (223,26,"1","The_Promised_Neverland","Cat_Street_(Edición_Integral)",275),
  (224,48,"1","¡Achís!_Historias_cortas_de_Naoki_Urasawa","Alabaster_(Astiberri)",338),
  (225,61,"1","Abrázame_con_toda_tu_Alma","nombres",189),
  (226,76,"1","Carnaza_humana","ponle",14),
  (227,97,"1","CardCaptor_Sakura_(EDT/Glénat)","Cautivado_por_ti",20),
  (228,38,"1","Called_Game","Amar_y_ser_Amado,_Dejar_y_ser_Dejado",124),
  (229,87,"0","Bota_Bota","Alabaster_(Astiberri)",127),
  (230,52,"1","Ana,_la_de_Avonlea","Alabaster_(Planeta)",5);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (231,4,"0","Afro_Samurai_(Edición_Completa)","Buenas_Noches,_Punpun",148),
  (232,14,"0","Air_Gear","Abara",24),
  (233,53,"1","Grand_Blue","Alice_in_Borderland",222),
  (234,58,"1","Akame_ga_Kill!_Memorial_FanBook","Adolf_(Trazado)",49),
  (235,34,"1","Boys_Run_the_Riot","Burn_the_Witch",65),
  (236,80,"1","The_God_of_High_School","Amigos_y_Amantes",61),
  (237,21,"0","Breakdown","Agharta",137),
  (238,108,"0","Carole_&_Tuesday","Adolf_(Trazado)",321),
  (239,58,"1","Acabé_hecha_un_trapo_huyendo_de_la_realidad","Alice,_Escuela_de_Magia",222),
  (240,13,"1","Naruto","ponle",136);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (241,9,"0","Made_in_Abyss","Children_of_the_Whales",236),
  (242,53,"0","Candy_Candy_Corazón_(Comic-books_Color)","User",6),
  (243,9,"0","Buda_(Nueva_Edición)","Akame_ga_Kill!_Memorial_FanBook",158),
  (244,108,"0","Bleach","Cazadores_de_Magos_(2ª_Parte)",37),
  (245,69,"1","Cazadores_de_Magos_(2ª_Parte)","Chiikawa",165),
  (246,68,"1","Burn_the_Witch","Akame_ga_Kill!",270),
  (247,29,"1","Fairy_Tail","barras",184),
  (248,94,"1","Toradora","Adabana",29),
  (249,4,"1","Chainsaw_Man","Brutal:_confesiones_de_un_detective_de_homicidios",32),
  (250,106,"0","¡Ámame!_La_Princesa_del_Instituto_de_Chicos_y_el_Princes_del_Instituto_de_Chicas","Caramelo,_canela_y_palomitas",117);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (251,104,"1","Aleluya_Demonio","Carta_al_Futuro",79),
  (252,88,"1","Akane_banashi","Aleluya_Demonio",222),
  (253,83,"1","Chobits","Brutal:_confesiones_de_un_detective_de_homicidios",65),
  (254,95,"0","Chopperman:_¡Adelante,_Sr._Chopper!","ACCA_13",275),
  (255,79,"1","Jujutsu_Kaisen","Abara",191),
  (256,40,"0","All_You_Need_Is_Kill_(Integral)","Canal_W",316),
  (257,56,"0","Great_Pretender","Akuma_no_Riddle",291),
  (258,14,"0","Chicas_de_Instituto","lugar",210),
  (259,29,"1","Chico_Secreto,_Futuro_Efímero","¡A_los_dieciséis!",102),
  (260,71,"0","Blue_Period","Alice_19th",5);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (261,34,"0","Made_in_Abyss","Alma",176),
  (262,97,"1","Casualmente","Boruto_-Naruto_Next_Generations-",183),
  (263,64,"1","Akame_ga_Kill","Cazadores_de_Magos_(1ª_Parte)",106),
  (264,17,"0","Along_with_The_Gods","Carole_&_Tuesday",76),
  (265,36,"1","Acabé_hecha_un_trapo_huyendo_de_la_realidad","Cat's_Eye_(Complete_Edition)",99),
  (266,80,"1","C","Capitán_Harlock,El_Pirata_Espacial(EDT/Glénat)",89),
  (267,19,"1","Calm_Breaker:_¡Llega_el_Caos!","Alimañas",274),
  (268,53,"1","Haikyuu","Buenas_Noches,_Punpun",239),
  (269,77,"1","Alice_19th","Abara",26),
  (270,12,"1","Vinland_Saga","¡A_los_dieciséis!",271);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (271,76,"0","Cells_at_Work!_CODE_BLACK","ponle",31),
  (272,52,"0","Cazadores_de_Magos_(3ª_Parte)","User",47),
  (273,73,"0","The_Idolmaster_Cinderella_Girls","mangas",102),
  (274,79,"1","Delicious_in_Dungeon","Cherry",204),
  (275,95,"1","Solo_Leveling","Alice,_Escuela_de_Magia",12),
  (276,89,"0","Bride_Stories","Chunyan,_La_Nueva_Leyenda",217),
  (277,102,"1","A·I_Revolution","Ajin_(Semihumano)",289),
  (278,61,"1","Acabé_hecha_un_trapo_huyendo_de_la_realidad","con",111),
  (279,92,"0","Bloom_Into_You","Boku_wa_Mari_no_naka",300),
  (280,63,"0","Candy_Candy_Corazón_(Album_Color)_(Nueva_Edición)","Akira_(Color)_(Ediciones_B)",167);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (281,90,"1","Vinland_Saga","Adolf_(Edición_Integral)_(2010)",32),
  (282,31,"0","Children_of_the_Whales","Change_the_World_(Euskera)",3),
  (283,78,"1","A_Silent_Voice","Amor_al_Desnudo",161),
  (284,91,"1","Chiki_Chiki_Banana","Cells_at_Work!_CODE_BLACK",196),
  (285,54,"1","All_World","Adult_Time",123),
  (286,28,"0","Slam_Dunk","Cherry",323),
  (287,94,"1","The_God_of_High_School","Buenos_días,_bella_durmiente",49),
  (288,43,"1","Akuma_to_Love_Song","Amar_y_ser_Amado,_Dejar_y_ser_Dejado",153),
  (289,42,"1","Grand_Blue","Akira_(Color)_(Comic-books)",75),
  (290,77,"1","Buenas_Noches,_Punpun","Adolf_(Edición_Integral)_(2013)",282);
INSERT INTO `mangas` (`id`,`id_genero`,`emision`,`nombre`,`mangaka`,`paginas`)
VALUES
  (291,3,"1","Cazadores_de_Magos_(3ª_Parte)","Adam_y_Eve",163),
  (292,39,"1","Abara","Chiki_Chiki_Banana",237),
  (293,52,"1","Adam_y_Eve","Cherry",347),
  (294,21,"1","To_Your_Eternity","Cibercafé_a_la_Deriva_(Drifting_Net_Cafe)",302),
  (295,44,"1","Dorohedoro","Box._Hay_algo_dentro_de_la_caja",158),
  (296,67,"1","Akira_(B/N)_(Norma)","Breve_historia_del_Robo_Sapiens",121),
  (297,81,"0","Slam_Dunk","Chainsaw_Man_(Castellano)",93),
  (298,20,"0","CardCaptor_Sakura_-_Art_Book","All_colour_but_the_black",72),
  (299,101,"1","Delicious_in_Dungeon","Amar_y_ser_Amado,_Dejar_y_ser_Dejado",9),
  (300,88,"1","Café_Diabólico,_Amor_Agridulce","Buenos_días,_bella_durmiente",25);
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (1,10,"2019-08-13 ","2023-06-14 "),
  (2,275,"2016-10-05 ","2023-09-29 "),
  (3,3,"2021-12-11 ","2023-02-24 "),
  (4,8,"2015-10-02 ","2023-12-31 "),
  (5,122,"2016-03-25 ","2025-01-04 "),
  (6,82,"2017-10-24 ","2023-08-09 "),
  (7,115,"2023-12-24 ","2023-05-20 "),
  (8,153,"2021-06-06 ","2023-07-01 "),
  (9,239,"2022-04-11 ","2024-10-08 "),
  (10,64,"2016-06-01 ","2023-08-06 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (11,295,"2022-08-30 ","2024-08-02 "),
  (12,94,"2021-04-15 ","2023-04-26 "),
  (13,244,"2016-04-02 ","2024-08-19 "),
  (14,29,"2021-04-04 ","2023-09-12 "),
  (15,298,"2021-12-12 ","2023-06-30 "),
  (16,227,"2020-06-18 ","2023-12-05 "),
  (17,78,"2019-12-27 ","2023-06-30 "),
  (18,70,"2021-07-22 ","2023-06-13 "),
  (19,254,"2022-11-10 ","2024-04-11 "),
  (20,246,"2016-11-30 ","2023-11-26 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (21,25,"2016-01-25 ","2023-12-18 "),
  (22,235,"2020-02-14 ","2024-06-20 "),
  (23,150,"2018-07-16 ","2023-05-26 "),
  (24,219,"2016-06-18 ","2024-03-14 "),
  (25,6,"2018-06-17 ","2024-01-06 "),
  (26,203,"2017-06-01 ","2024-05-01 "),
  (27,84,"2019-07-30 ","2023-10-29 "),
  (28,175,"2017-11-20 ","2023-06-12 "),
  (29,98,"2019-07-13 ","2023-05-04 "),
  (30,283,"2016-11-25 ","2023-02-19 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (31,158,"2019-11-17 ","2024-06-22 "),
  (32,84,"2023-10-23 ","2023-05-30 "),
  (33,51,"2015-02-05 ","2023-08-19 "),
  (34,236,"2021-04-20 ","2024-07-04 "),
  (35,34,"2023-05-07 ","2024-06-16 "),
  (36,38,"2021-07-17 ","2024-12-08 "),
  (37,176,"2017-06-12 ","2024-04-05 "),
  (38,183,"2019-04-21 ","2024-07-22 "),
  (39,133,"2023-10-27 ","2024-11-06 "),
  (40,173,"2019-05-24 ","2024-06-07 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (41,71,"2021-10-10 ","2023-02-28 "),
  (42,96,"2017-07-23 ","2024-03-13 "),
  (43,132,"2015-05-31 ","2023-03-16 "),
  (44,51,"2024-05-21 ","2024-04-28 "),
  (45,8,"2024-12-21 ","2024-12-07 "),
  (46,163,"2015-07-18 ","2023-03-09 "),
  (47,32,"2021-12-10 ","2024-11-01 "),
  (48,158,"2018-03-06 ","2023-03-29 "),
  (49,97,"2017-03-13 ","2024-12-27 "),
  (50,288,"2016-07-25 ","2023-12-16 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (51,3,"2021-08-02 ","2023-09-26 "),
  (52,31,"2024-08-29 ","2024-07-18 "),
  (53,222,"2023-12-30 ","2023-11-21 "),
  (54,189,"2024-06-25 ","2023-04-18 "),
  (55,164,"2021-10-23 ","2024-06-10 "),
  (56,108,"2018-09-13 ","2024-07-21 "),
  (57,205,"2019-02-21 ","2023-03-09 "),
  (58,228,"2016-04-02 ","2023-06-28 "),
  (59,195,"2019-10-26 ","2024-12-28 "),
  (60,46,"2024-04-23 ","2024-12-11 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (61,22,"2020-12-15 ","2023-08-07 "),
  (62,37,"2016-03-13 ","2023-08-17 "),
  (63,158,"2016-08-04 ","2024-12-28 "),
  (64,266,"2021-09-06 ","2023-01-30 "),
  (65,146,"2024-01-02 ","2024-05-24 "),
  (66,142,"2022-07-07 ","2024-02-19 "),
  (67,95,"2016-06-12 ","2023-09-05 "),
  (68,183,"2015-05-12 ","2024-01-16 "),
  (69,106,"2018-10-15 ","2023-05-26 "),
  (70,286,"2020-10-04 ","2023-09-19 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (71,240,"2019-06-11 ","2024-12-30 "),
  (72,25,"2015-10-24 ","2024-02-08 "),
  (73,226,"2019-11-04 ","2024-10-02 "),
  (74,212,"2021-05-01 ","2024-10-02 "),
  (75,177,"2015-12-01 ","2023-05-05 "),
  (76,295,"2018-07-06 ","2023-04-27 "),
  (77,137,"2019-12-28 ","2024-08-13 "),
  (78,7,"2020-03-04 ","2024-03-30 "),
  (79,284,"2015-10-24 ","2023-07-13 "),
  (80,40,"2015-12-08 ","2023-04-14 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (81,259,"2019-01-02 ","2024-10-31 "),
  (82,103,"2022-05-31 ","2024-10-22 "),
  (83,234,"2017-05-25 ","2023-03-18 "),
  (84,179,"2022-06-12 ","2023-05-31 "),
  (85,205,"2017-10-28 ","2024-02-21 "),
  (86,231,"2022-01-09 ","2023-09-02 "),
  (87,36,"2016-06-27 ","2024-11-14 "),
  (88,260,"2020-09-07 ","2023-06-14 "),
  (89,15,"2021-03-15 ","2024-06-13 "),
  (90,57,"2019-02-21 ","2024-02-03 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (91,289,"2025-01-07 ","2024-08-12 "),
  (92,21,"2019-11-19 ","2025-01-19 "),
  (93,89,"2023-06-11 ","2023-11-29 "),
  (94,80,"2017-09-07 ","2024-12-31 "),
  (95,102,"2023-06-04 ","2024-04-05 "),
  (96,17,"2022-11-09 ","2023-05-12 "),
  (97,61,"2024-09-24 ","2024-03-30 "),
  (98,103,"2022-05-19 ","2024-01-02 "),
  (99,103,"2024-12-22 ","2024-05-05 "),
  (100,278,"2023-03-08 ","2023-06-10 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (101,220,"2018-01-04 ","2023-11-08 "),
  (102,38,"2022-04-03 ","2023-12-15 "),
  (103,33,"2020-09-07 ","2024-07-22 "),
  (104,246,"2019-03-05 ","2024-09-18 "),
  (105,189,"2016-01-10 ","2024-12-09 "),
  (106,221,"2015-03-28 ","2023-06-19 "),
  (107,263,"2016-07-27 ","2023-05-30 "),
  (108,133,"2024-12-31 ","2023-04-12 "),
  (109,160,"2020-12-02 ","2025-01-26 "),
  (110,173,"2019-12-02 ","2024-07-17 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (111,151,"2016-08-07 ","2024-03-19 "),
  (112,121,"2015-07-22 ","2023-03-20 "),
  (113,271,"2021-02-15 ","2024-03-06 "),
  (114,17,"2015-12-12 ","2023-12-20 "),
  (115,136,"2021-12-12 ","2023-03-19 "),
  (116,204,"2019-01-24 ","2023-12-26 "),
  (117,141,"2021-05-23 ","2023-12-19 "),
  (118,119,"2018-06-30 ","2023-05-25 "),
  (119,185,"2024-01-08 ","2024-06-11 "),
  (120,157,"2024-02-01 ","2024-04-24 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (121,18,"2018-05-16 ","2023-03-09 "),
  (122,107,"2019-09-26 ","2024-01-16 "),
  (123,237,"2019-09-19 ","2024-01-31 "),
  (124,237,"2016-09-14 ","2023-12-17 "),
  (125,167,"2015-09-01 ","2024-11-20 "),
  (126,232,"2021-11-19 ","2024-08-11 "),
  (127,81,"2019-04-23 ","2024-05-14 "),
  (128,23,"2017-12-18 ","2023-03-26 "),
  (129,97,"2018-04-24 ","2023-05-25 "),
  (130,63,"2018-12-26 ","2024-04-12 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (131,218,"2022-05-04 ","2024-01-17 "),
  (132,62,"2024-08-17 ","2023-08-16 "),
  (133,251,"2018-07-20 ","2023-04-09 "),
  (134,172,"2022-05-03 ","2023-10-07 "),
  (135,205,"2015-09-14 ","2024-10-23 "),
  (136,265,"2023-05-20 ","2023-12-18 "),
  (137,175,"2016-02-12 ","2024-04-03 "),
  (138,59,"2022-10-08 ","2024-11-26 "),
  (139,21,"2022-10-06 ","2023-02-26 "),
  (140,224,"2023-08-29 ","2024-02-03 ");
INSERT INTO `usuario_mangas` (`id_usuario`,`id_mangas`,`fecha_final_del_usuario`,`fecha_de_inicio`)
VALUES
  (141,135,"2022-07-20 ","2024-11-22 "),
  (142,248,"2023-05-31 ","2024-05-23 "),
  (143,207,"2023-08-20 ","2024-07-22 "),
  (144,34,"2021-11-15 ","2023-08-02 "),
  (145,255,"2016-04-07 ","2024-01-04 "),
  (146,133,"2020-06-26 ","2023-06-27 "),
  (147,263,"2015-12-22 ","2024-08-07 "),
  (148,66,"2020-11-24 ","2024-09-17 "),
  (149,22,"2020-05-28 ","2024-12-11 "),
  (150,183,"2015-11-16 ","2023-09-21 ");
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (1,"1",49),
  (2,"0",270),
  (3,"0",245),
  (4,"0",167),
  (5,"1",89),
  (6,"0",289),
  (7,"0",178),
  (8,"0",55),
  (9,"1",32),
  (10,"0",63);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (11,"0",82),
  (12,"1",100),
  (13,"0",200),
  (14,"1",88),
  (15,"0",162),
  (16,"1",40),
  (17,"1",6),
  (18,"0",64),
  (19,"1",68),
  (20,"0",63);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (21,"1",276),
  (22,"1",55),
  (23,"0",247),
  (24,"1",276),
  (25,"0",50),
  (26,"1",28),
  (27,"0",80),
  (28,"0",66),
  (29,"1",187),
  (30,"1",122);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (31,"0",247),
  (32,"1",76),
  (33,"0",272),
  (34,"1",72),
  (35,"1",105),
  (36,"1",202),
  (37,"1",190),
  (38,"1",91),
  (39,"1",269),
  (40,"0",244);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (41,"0",234),
  (42,"0",113),
  (43,"1",23),
  (44,"0",211),
  (45,"1",64),
  (46,"1",150),
  (47,"1",116),
  (48,"0",141),
  (49,"0",187),
  (50,"1",111);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (51,"0",291),
  (52,"0",218),
  (53,"1",33),
  (54,"1",238),
  (55,"0",109),
  (56,"0",296),
  (57,"0",86),
  (58,"0",179),
  (59,"0",140),
  (60,"1",220);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (61,"1",235),
  (62,"0",282),
  (63,"0",20),
  (64,"1",96),
  (65,"0",42),
  (66,"1",142),
  (67,"0",30),
  (68,"0",234),
  (69,"1",160),
  (70,"1",161);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (71,"0",98),
  (72,"1",57),
  (73,"1",288),
  (74,"0",205),
  (75,"1",81),
  (76,"1",127),
  (77,"1",74),
  (78,"0",49),
  (79,"0",211),
  (80,"0",6);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (81,"1",209),
  (82,"1",57),
  (83,"0",174),
  (84,"0",152),
  (85,"0",264),
  (86,"0",226),
  (87,"0",88),
  (88,"1",208),
  (89,"1",56),
  (90,"0",201);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (91,"0",68),
  (92,"1",179),
  (93,"0",129),
  (94,"0",21),
  (95,"1",64),
  (96,"0",81),
  (97,"1",155),
  (98,"0",200),
  (99,"1",174),
  (100,"0",293);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (101,"1",86),
  (102,"1",188),
  (103,"1",1),
  (104,"1",110),
  (105,"0",156),
  (106,"0",241),
  (107,"0",262),
  (108,"1",120),
  (109,"0",297),
  (110,"1",71);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (111,"0",121),
  (112,"1",163),
  (113,"0",284),
  (114,"1",270),
  (115,"0",178),
  (116,"0",261),
  (117,"0",60),
  (118,"0",214),
  (119,"0",90),
  (120,"1",162);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (121,"0",170),
  (122,"0",161),
  (123,"0",61),
  (124,"0",34),
  (125,"0",261),
  (126,"1",19),
  (127,"1",107),
  (128,"1",284),
  (129,"1",16),
  (130,"0",132);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (131,"0",154),
  (132,"1",97),
  (133,"1",258),
  (134,"1",239),
  (135,"0",102),
  (136,"0",211),
  (137,"0",75),
  (138,"0",150),
  (139,"0",215),
  (140,"0",183);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (141,"0",153),
  (142,"1",105),
  (143,"0",104),
  (144,"0",5),
  (145,"1",2),
  (146,"0",137),
  (147,"0",160),
  (148,"1",176),
  (149,"0",254),
  (150,"0",271);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (151,"1",101),
  (152,"0",222),
  (153,"0",168),
  (154,"1",145),
  (155,"1",38),
  (156,"0",155),
  (157,"1",249),
  (158,"0",185),
  (159,"0",272),
  (160,"1",236);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (161,"1",285),
  (162,"1",230),
  (163,"1",173),
  (164,"0",162),
  (165,"1",63),
  (166,"1",279),
  (167,"1",187),
  (168,"0",36),
  (169,"0",180),
  (170,"1",294);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (171,"0",30),
  (172,"1",127),
  (173,"0",59),
  (174,"0",288),
  (175,"1",117),
  (176,"0",225),
  (177,"1",297),
  (178,"0",217),
  (179,"1",171),
  (180,"0",78);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (181,"0",217),
  (182,"1",150),
  (183,"1",242),
  (184,"0",3),
  (185,"1",190),
  (186,"0",270),
  (187,"0",272),
  (188,"1",255),
  (189,"1",70),
  (190,"0",120);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (191,"1",154),
  (192,"0",191),
  (193,"0",166),
  (194,"1",86),
  (195,"1",25),
  (196,"0",162),
  (197,"1",143),
  (198,"1",121),
  (199,"0",231),
  (200,"0",234);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (201,"1",54),
  (202,"1",174),
  (203,"0",168),
  (204,"0",253),
  (205,"1",18),
  (206,"0",245),
  (207,"1",219),
  (208,"0",189),
  (209,"1",203),
  (210,"1",192);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (211,"0",277),
  (212,"0",282),
  (213,"1",216),
  (214,"0",172),
  (215,"1",134),
  (216,"1",241),
  (217,"0",62),
  (218,"1",178),
  (219,"1",287),
  (220,"1",172);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (221,"1",232),
  (222,"0",53),
  (223,"1",235),
  (224,"1",139),
  (225,"1",227),
  (226,"0",279),
  (227,"1",119),
  (228,"0",88),
  (229,"1",41),
  (230,"0",54);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (231,"0",82),
  (232,"1",223),
  (233,"1",270),
  (234,"0",242),
  (235,"0",23),
  (236,"0",184),
  (237,"0",182),
  (238,"0",87),
  (239,"1",83),
  (240,"0",210);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (241,"0",25),
  (242,"1",238),
  (243,"1",81),
  (244,"0",58),
  (245,"0",245),
  (246,"1",234),
  (247,"0",7),
  (248,"0",194),
  (249,"0",120),
  (250,"1",132);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (251,"1",47),
  (252,"0",115),
  (253,"1",298),
  (254,"1",15),
  (255,"1",189),
  (256,"0",50),
  (257,"0",122),
  (258,"0",276),
  (259,"1",144),
  (260,"0",244);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (261,"0",162),
  (262,"1",253),
  (263,"0",299),
  (264,"0",142),
  (265,"1",186),
  (266,"1",113),
  (267,"1",173),
  (268,"0",48),
  (269,"1",20),
  (270,"0",170);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (271,"1",286),
  (272,"0",274),
  (273,"1",80),
  (274,"0",108),
  (275,"1",118),
  (276,"1",168),
  (277,"0",7),
  (278,"0",13),
  (279,"1",17),
  (280,"1",4);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (281,"1",115),
  (282,"0",272),
  (283,"1",70),
  (284,"0",254),
  (285,"0",136),
  (286,"1",143),
  (287,"0",223),
  (288,"0",102),
  (289,"0",133),
  (290,"0",177);
INSERT INTO `traducion` (`id`,`subtitulos`,`id_mangas`)
VALUES
  (291,"0",101),
  (292,"1",116),
  (293,"1",56),
  (294,"0",282),
  (295,"1",154),
  (296,"1",78),
  (297,"0",11),
  (298,"0",192),
  (299,"0",29),
  (300,"1",111);
INSERT INTO `idiomas` (`id`,`id_mangas`,`idioma`)
VALUES
  (1,297,"Ucraniano Véneto"),
  (2,126,"Asamés Bavarian Bielorruso"),
  (3,270,"Malayo Persa"),
  (4,161,"Lituano Albanés Neerlandés"),
  (5,78,"Suiza Ladino"),
  (6,223,"de"),
  (7,29,"Papiamento Quechua"),
  (8,82,"Ewe Gallego"),
  (9,80,"Persa"),
  (10,245,"Bielorruso Checheno");
INSERT INTO `idiomas` (`id`,`id_mangas`,`idioma`)
VALUES
  (11,267,"Romansh Sardo Tongano"),
  (12,111,"Bielorruso"),
  (13,241,"Vietnamita Yídish"),
  (14,185,"Marwari Xiang Malabar"),
  (15,165,"Ladino"),
  (16,267,"Igbo Sami septentrional"),
  (17,242,"Sami"),
  (18,282,"mandarín Hindi Árabe"),
  (19,126,"Vietnamita Yídish"),
  (20,101,"Vietnamita");
INSERT INTO `idiomas` (`id`,`id_mangas`,`idioma`)
VALUES
  (21,4,"Alemán Japonés"),
  (22,72,"Ewe Gallego"),
  (23,252,"Portugués Bengalí Ruso"),
  (24,174,"(Oriya)"),
  (25,122,"Portugués"),
  (26,82,"(Oriya) Maithili"),
  (27,243,"Tamil Turco"),
  (28,136,"Igbo Fula"),
  (29,24,"Odia"),
  (30,216,"Tongano Ucraniano");
INSERT INTO `idiomas` (`id`,`id_mangas`,`idioma`)
VALUES
  (31,283,"Limburgués"),
  (32,32,"Pisin Igbo"),
  (33,249,"Amárico Bhojpuri Odia"),
  (34,294,"Gujarati"),
  (35,62,"Ucraniano Malayo"),
  (36,102,"Kazajo Malaiala Asamés"),
  (37,22,"Náhuatl Occitano Papiamento"),
  (38,181,"Bielorruso"),
  (39,282,"Coreano"),
  (40,245,"Malayo Persa");
INSERT INTO `idiomas` (`id`,`id_mangas`,`idioma`)
VALUES
  (41,275,"Javanés Tailandés"),
  (42,25,"Hindi Árabe Portugués"),
  (43,14,"Javanés Tailandés"),
  (44,74,"mandarín Hindi Árabe"),
  (45,19,"Vietnamita Yídish"),
  (46,30,"Ucraniano Véneto"),
  (47,138,"Malabar"),
  (48,266,"Tagalo Kurdo Serbio"),
  (49,261,"Hakka Inglés antiguo"),
  (50,150,"Indonesio Francés Alemán");
INSERT INTO `idiomas` (`id`,`id_mangas`,`idioma`)
VALUES
  (51,170,"Neerlandés Yavanés"),
  (52,126,"Alemán de"),
  (53,68,"Lituano"),
  (54,97,"Hindi Árabe"),
  (55,7,"antiguo"),
  (56,34,"Lituano"),
  (57,124,"Bielorruso Checheno Emilian-Romagnol"),
  (58,129,"Vietnamita Yídish"),
  (59,279,"Polaco Ucraniano Malayo"),
  (60,35,"Maithili Hausa Burmés");
INSERT INTO `idiomas` (`id`,`id_mangas`,`idioma`)
VALUES
  (61,152,"Marwari"),
  (62,150,"Urdu"),
  (63,52,"Azerbaiyano Igbo Fula"),
  (64,55,"Pisin Igbo"),
  (65,207,"Télugu Wu"),
  (66,229,"Ucraniano"),
  (67,223,"Yoruba Zapoteco Zulu"),
  (68,12,"(Shanghainés) Uigur"),
  (69,129,"Neerlandés Yavanés"),
  (70,42,"Vietnamita Coreano Javanés");
INSERT INTO `traduccion_manga` (`id_manga`,`id_traduccion`)
VALUES
  (245,1),
  (103,2),
  (234,3),
  (90,4),
  (207,5),
  (198,6),
  (250,7),
  (170,8),
  (74,9),
  (49,10);
INSERT INTO `traduccion_manga` (`id_manga`,`id_traduccion`)
VALUES
  (14,11),
  (217,12),
  (249,13),
  (120,14),
  (99,15),
  (23,16),
  (6,17),
  (39,18),
  (72,19),
  (115,20);
INSERT INTO `traduccion_manga` (`id_manga`,`id_traduccion`)
VALUES
  (186,21),
  (208,22),
  (59,23),
  (240,24),
  (158,25),
  (71,26),
  (231,27),
  (138,28),
  (232,29),
  (286,30);
INSERT INTO `traduccion_manga` (`id_manga`,`id_traduccion`)
VALUES
  (262,31),
  (79,32),
  (206,33),
  (289,34),
  (59,35),
  (224,36),
  (90,37),
  (35,38),
  (129,39),
  (7,40);
INSERT INTO `traduccion_manga` (`id_manga`,`id_traduccion`)
VALUES
  (15,41),
  (300,42),
  (165,43),
  (41,44),
  (205,45),
  (64,46),
  (219,47),
  (266,48),
  (119,49),
  (136,50);
INSERT INTO `traduccion_manga` (`id_manga`,`id_traduccion`)
VALUES
  (168,51),
  (22,52),
  (198,53),
  (48,54),
  (60,55),
  (158,56),
  (265,57),
  (99,58),
  (41,59),
  (219,60);
INSERT INTO `traduccion_manga` (`id_manga`,`id_traduccion`)
VALUES
  (274,61),
  (53,62),
  (1,63),
  (165,64),
  (64,65),
  (129,66),
  (117,67),
  (82,68),
  (259,69),
  (149,70);
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (1,"337770864","amet ornare lectus justo eu arcu. Morbi sit","Envío de Carga","UWE52XKH","concurrido",0,"Ap #738-6473 Diam Avenue","Nasim Rocha","Cameron Riggs"),
  (2,"174787942","lacus. Cras interdum. Nunc sollicitudin commodo","Envío de Carga","OOL50OGN","concurrido",0,"364-3051 Justo St.","Grace Weaver","Roth Pickett"),
  (3,"118161270","ridiculus mus. Donec dignissim","Servicios de Paquetería y Mensajería","RIC33JTS","atasco",13,"400-7488 Posuere Rd.","Harding Berg","Medge Farrell"),
  (4,"041827916","tincidunt, nunc ac","Envío de Carga","OHT36NPP","concurrido",11,"Ap #611-8621 Cursus Rd.","Molly Shepard","Shelly Chandler"),
  (5,"585085559","Donec egestas. Aliquam nec enim. Nunc ut erat.","Entrega por Aplicaciones o Plataformas Específicas","LFP31ZFQ","concurrido",19,"Ap #136-1527 Morbi Rd.","Hayes Grant","Lavinia Landry"),
  (6,"664721243","Cras vehicula aliquet libero. Integer in","Logística Reversa","AZW92GQO","atasco",7,"3605 Eget, Av.","Axel Ellis","Nadine Abbott"),
  (7,"764596185","massa. Integer vitae nibh. Donec est","Entrega por Aplicaciones o Plataformas Específicas","KIU14XKE","concurrido",10,"Ap #458-9049 Dolor Ave","Sandra Charles","Hadassah Middleton"),
  (8,"883656481","nec,","Correo Postal","KJZ67MTD","libre",6,"Ap #984-4258 Blandit. Street","Mikayla Dillard","Oliver Rosario"),
  (9,"361021731","id nunc interdum","Entrega Express","JDG40NAT","libre",4,"136-1131 Inceptos St.","Isabella Burnett","Travis Hickman"),
  (10,"813404273","ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu","Correo Postal","KMP81WRP","atasco",2,"Ap #202-4224 A Rd.","Lenore Richmond","Wesley Vaughn");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (11,"605365512","Maecenas mi felis, adipiscing fringilla, porttitor vulputate,","Entrega en Punto de Recogida","WSX64IKW","libre",9,"P.O. Box 787, 3228 Praesent St.","Griffin Pruitt","Tanner Patterson"),
  (12,"534236544","tempus non, lacinia at, iaculis quis, pede.","Envío de Carga","DCX70VJN","atasco",5,"660-3662 Nascetur Rd.","Reed Moreno","Cheyenne Decker"),
  (13,"148796586","sem ut cursus luctus, ipsum leo elementum sem,","Logística Reversa","HLR23MWF","libre",5,"4885 Faucibus. Road","Laura Haley","Kaye Albert"),
  (14,"513692722","aliquet diam.","Envío de Carga","LBN54DIA","libre",5,"Ap #625-3485 Cubilia St.","Leah Kline","Keiko Forbes"),
  (15,"655251735","Nulla facilisi. Sed neque. Sed eget lacus.","Envío de Carga","QHT75LAF","atasco",1,"P.O. Box 260, 3258 Dui. Avenue","Emerson Le","Karleigh Stephens"),
  (16,"901026035","et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus.","Logística Reversa","DYQ63MCT","concurrido",1,"966-8778 Tristique Av.","Sean Kent","Ross Alexander"),
  (17,"538507307","id ante dictum cursus. Nunc mauris elit,","Entrega en Punto de Recogida","HJD52USE","libre",1,"5067 Felis Rd.","Ezekiel Gross","Aimee Burns"),
  (18,"363873694","dictum. Proin eget odio. Aliquam vulputate ullamcorper","Logística Reversa","XPM13KCD","concurrido",3,"P.O. Box 436, 7951 Justo Street","Illana Howe","Vance Mcgowan"),
  (19,"241236584","rhoncus id, mollis nec, cursus a, enim.","Entrega en Punto de Recogida","FRX86DUF","libre",4,"Ap #846-7862 Sed Rd.","Conan Massey","Marshall Valentine"),
  (20,"183070744","ac nulla. In tincidunt","Correo Postal","NRP32ONX","atasco",20,"502-2014 Ut, St.","Herman Owen","Vaughan Macias");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (21,"446260520","felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem,","Correo Postal","XTM87WTW","libre",15,"P.O. Box 291, 2172 Vel St.","Amena York","Graiden Garza"),
  (22,"395543957","mauris elit, dictum eu, eleifend nec, malesuada ut, sem.","Entrega Express","WEV29CVG","libre",6,"303-9965 Id, Av.","Hayes Mendez","Hashim Anderson"),
  (23,"720693524","vel, convallis in, cursus","Logística Reversa","MWY81KBA","atasco",9,"431-8315 Egestas. St.","Francesca Baxter","April Zamora"),
  (24,"104615331","ultricies","Correo Postal","EKP86PFH","atasco",9,"Ap #942-7092 Libero. Rd.","Brennan Harvey","Kameko Greer"),
  (25,"388640581","In scelerisque scelerisque dui. Suspendisse","Entrega Express","ZWW12XHF","atasco",14,"225-5513 Tempus Avenue","Idona Simmons","Alexis Bates"),
  (26,"887297992","ligula. Aliquam erat volutpat.","Correo Postal","DBV68OFU","atasco",14,"2450 Eu, Rd.","Yen Higgins","Regina Fletcher"),
  (27,"555112221","in, cursus et, eros. Proin","Envío de Carga","ARP05QFU","concurrido",24,"P.O. Box 589, 2221 Porttitor Ave","Christen Mckenzie","Tallulah Noel"),
  (28,"223419131","at sem molestie sodales. Mauris blandit enim consequat","Logística Reversa","QNC06LRD","concurrido",4,"921-5338 Dui. Ave","Alfonso Hoffman","Stephen Wells"),
  (29,"893021686","et, commodo at, libero. Morbi accumsan","Correo Postal","SCJ72UME","libre",14,"343-2317 Mauris Street","Garth Nichols","Maggy Warner"),
  (30,"751032578","dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis","Servicios de Mensajería Local","BTX73KEQ","atasco",6,"Ap #279-6827 Nunc St.","Zelda Christian","Murphy Henderson");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (31,"667333718","vehicula aliquet libero.","Servicios de Mensajería Local","UFT20HTG","libre",8,"P.O. Box 580, 7576 Libero St.","Fay Sharpe","Candice Vazquez"),
  (32,"477148032","quis","Entrega Express","OPK86WFV","libre",9,"239-9143 Lorem Av.","Candace Calhoun","Cadman Schultz"),
  (33,"581535331","Suspendisse aliquet, sem ut cursus","Servicios de Mensajería Local","CCC71WGB","concurrido",15,"305-1012 Eget Rd.","Kyle Valenzuela","Imani Petersen"),
  (34,"428814866","vitae, aliquet nec,","Envío de Carga","ZTW34NVE","atasco",3,"P.O. Box 326, 4300 Proin Street","Lane Macdonald","Cheryl Perkins"),
  (35,"156341798","Phasellus libero mauris, aliquam eu, accumsan","Entrega por Aplicaciones o Plataformas Específicas","GWH67KEK","libre",9,"832-977 Quis Road","Dolan Slater","Ayanna Ratliff"),
  (36,"549172943","placerat, orci lacus vestibulum lorem, sit amet","Logística Reversa","HCG38TTL","concurrido",12,"Ap #218-4216 Augue St.","George Huff","Stephanie Valentine"),
  (37,"907515071","eget, venenatis a,","Entrega en Punto de Recogida","QJJ83SCU","atasco",8,"P.O. Box 469, 9747 Adipiscing St.","Hope Everett","Herrod Kirkland"),
  (38,"588235446","orci sem eget massa. Suspendisse eleifend.","Servicios de Mensajería Local","OFM27OFK","atasco",6,"P.O. Box 683, 5867 Mauris. Avenue","Karly Rojas","Miranda Houston"),
  (39,"374252677","erat. Vivamus nisi. Mauris nulla.","Servicios de Paquetería y Mensajería","ZBF22GVQ","concurrido",22,"495-9156 Scelerisque St.","Brett Hancock","Mara Chase"),
  (40,"455780122","quis turpis vitae purus","Servicios de Mensajería Local","UUI93CIX","libre",21,"Ap #929-3756 Lacus. Rd.","Tate Morin","Tobias Mercer");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (41,"139932721","fames ac turpis egestas.","Servicios de Paquetería y Mensajería","APK78MFZ","libre",16,"Ap #610-2135 Duis St.","Emerald Fuentes","Kimberley Thornton"),
  (42,"422376114","est mauris, rhoncus","Entrega por Aplicaciones o Plataformas Específicas","CEG52NWY","libre",23,"Ap #989-3066 Erat, Avenue","Wynter Jennings","Liberty Johnston"),
  (43,"788348213","amet, dapibus id, blandit","Servicios de Paquetería y Mensajería","MXY21FRT","concurrido",21,"Ap #354-2354 Pharetra St.","Ferris Alvarado","Wing Cross"),
  (44,"352376387","commodo at,","Entrega en Punto de Recogida","EWB03TSA","atasco",22,"P.O. Box 378, 928 Hymenaeos. Rd.","Ashely Rivera","Lillian Mccarthy"),
  (45,"556222467","Curabitur massa. Vestibulum accumsan neque et nunc.","Correo Postal","EKK48RNZ","concurrido",21,"7991 Tincidunt Rd.","Christen Avila","Baker Davenport"),
  (46,"752619260","Pellentesque habitant","Envío de Carga","WQI36WBT","atasco",1,"Ap #832-7276 Ornare. St.","Thaddeus Dennis","Althea Vega"),
  (47,"581120584","amet nulla. Donec non justo. Proin","Servicios de Mensajería Local","CNU65SSR","concurrido",1,"Ap #824-3541 Morbi Street","Ira Keller","Sandra Stanton"),
  (48,"154247321","sed turpis nec mauris blandit mattis.","Entrega por Aplicaciones o Plataformas Específicas","QNQ79HSD","atasco",19,"197-3465 Urna. Street","Vaughan Webb","Nadine Workman"),
  (49,"211582828","et tristique pellentesque,","Entrega Express","LTG29MWY","concurrido",20,"785-4951 Natoque St.","Keiko Christensen","Vincent Gill"),
  (50,"263346943","arcu et pede.","Servicios de Mensajería Local","ORT08KBR","concurrido",21,"Ap #820-5629 Magnis Avenue","Signe Heath","Ezekiel Owen");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (51,"635277132","fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit.","Correo Postal","REL11SOW","atasco",1,"P.O. Box 420, 1763 Bibendum Rd.","Reece Berger","Kadeem Powers"),
  (52,"641561676","mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis","Servicios de Mensajería Local","GYI68CAT","libre",10,"Ap #239-2574 Nisl Rd.","Cameran Sears","Jolene Hernandez"),
  (53,"133318712","vitae mauris sit amet","Servicios de Paquetería y Mensajería","IGU18IUI","concurrido",1,"Ap #969-5677 Aliquam Ave","Tatiana Casey","Moana Jenkins"),
  (54,"363028755","Aliquam nisl. Nulla eu neque pellentesque","Logística Reversa","WBB74HRY","atasco",10,"P.O. Box 589, 4028 Id, St.","Yoshio Parker","Kathleen Golden"),
  (55,"365582797","sem, vitae aliquam eros turpis","Logística Reversa","EGT59TWJ","libre",19,"Ap #423-4344 Tellus. Rd.","Nero Mcguire","Elaine Henderson"),
  (56,"738264630","dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque","Correo Postal","OLH94BZD","atasco",1,"4653 Tincidunt, Rd.","Jasper Oliver","Vivien Soto"),
  (57,"712304125","nec ante. Maecenas","Logística Reversa","MME38NML","concurrido",15,"1230 Vestibulum, St.","Ralph Randall","Amela Lloyd"),
  (58,"278737337","nisi a odio semper cursus. Integer","Correo Postal","LRF34SRB","libre",20,"5603 Iaculis Road","Macey Shaw","Venus Fischer"),
  (59,"565835743","est ac mattis semper, dui","Entrega en Punto de Recogida","YYO28OQZ","atasco",17,"857-3694 Rutrum, Rd.","Daniel Boyer","Avram Poole"),
  (60,"227692388","erat. Etiam vestibulum massa","Envío de Carga","SWH42WBY","concurrido",10,"619-815 Diam Rd.","Gay Hansen","Eagan Schroeder");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (61,"944673626","elementum, dui quis accumsan convallis, ante lectus","Servicios de Paquetería y Mensajería","HSV09APV","libre",15,"P.O. Box 648, 6454 In, St.","Marvin Collier","Victoria Shaffer"),
  (62,"546102424","Integer eu lacus. Quisque imperdiet, erat nonummy ultricies","Correo Postal","RPG16HSB","atasco",13,"Ap #942-9052 Lacinia. Ave","Hamilton Rowe","Prescott Ayers"),
  (63,"567591027","enim mi tempor lorem, eget mollis lectus pede","Servicios de Paquetería y Mensajería","KJP18BFD","libre",2,"596-343 Turpis. Street","Shelley Hess","Teagan Hopkins"),
  (64,"237938616","non ante bibendum ullamcorper. Duis cursus, diam at pretium","Entrega por Aplicaciones o Plataformas Específicas","EHH52YRP","atasco",12,"9243 Parturient Ave","Rylee Mccray","Stephen Mitchell"),
  (65,"867821644","sed consequat","Logística Reversa","VTE14FAO","libre",17,"685-8181 In St.","Callie Mathews","Ivy Mercado"),
  (66,"131178301","luctus sit amet, faucibus ut, nulla.","Entrega por Aplicaciones o Plataformas Específicas","YLX14OER","atasco",5,"653-5179 Sed Ave","Samson Mcguire","Ralph Baxter"),
  (67,"766579640","feugiat. Sed nec metus facilisis","Correo Postal","MZY52CKB","libre",21,"Ap #152-1989 Maecenas St.","Libby Booker","Wynne Cohen"),
  (68,"211494307","lorem ipsum sodales purus, in molestie","Servicios de Mensajería Local","CFY57OTL","atasco",6,"3087 Libero. Ave","Julian Valentine","Wallace Anthony"),
  (69,"819538833","erat volutpat. Nulla dignissim.","Envío de Carga","NOP33XMK","concurrido",4,"Ap #886-6796 Mollis. St.","Edan Hunt","Price Rivers"),
  (70,"157874465","sit","Servicios de Mensajería Local","BOH83FYP","libre",20,"P.O. Box 634, 7102 Lorem Avenue","Charles Cox","Quon Cline");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (71,"766792550","arcu. Morbi sit amet","Entrega por Aplicaciones o Plataformas Específicas","OSV47QIA","concurrido",13,"P.O. Box 556, 1124 Neque St.","Yuri Downs","Ivory Nicholson"),
  (72,"361215987","lorem lorem, luctus ut, pellentesque","Servicios de Paquetería y Mensajería","HRC13FOC","libre",3,"835-156 Iaculis Rd.","Kelly Love","Madeline Chaney"),
  (73,"072866675","pede. Cum sociis natoque penatibus et magnis dis parturient montes,","Logística Reversa","LUO93DMC","atasco",22,"783-2757 Velit. Rd.","Charles Oneil","Kay Golden"),
  (74,"137362934","elementum at, egestas a, scelerisque sed, sapien.","Entrega por Aplicaciones o Plataformas Específicas","RJB81DPU","libre",2,"3739 Sit Avenue","Karleigh Stark","Sonya Owens"),
  (75,"157761994","urna. Vivamus molestie dapibus","Entrega Express","QHH11CXE","atasco",22,"349-8952 Non Road","Hu Gonzales","Denise Lang"),
  (76,"471745251","urna, nec luctus","Envío de Carga","NMU11DND","libre",2,"8795 At, Road","Colorado Bernard","Velma Sellers"),
  (77,"642117128","arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.","Entrega Express","NJO56QUL","libre",22,"489-3979 Proin St.","Lucius Everett","Leroy Waller"),
  (78,"476429097","elit. Nulla facilisi. Sed","Entrega por Aplicaciones o Plataformas Específicas","XDG77OJY","libre",14,"Ap #315-8634 Morbi Av.","Dennis Sexton","Whilemina Cook"),
  (79,"735535315","ipsum. Suspendisse sagittis.","Logística Reversa","SMA32NTE","libre",22,"P.O. Box 696, 9480 Donec St.","Zeus Garrison","Myra Clark"),
  (80,"334454908","volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla.","Servicios de Paquetería y Mensajería","RTC42OQQ","libre",20,"2021 Nulla. Rd.","Hilel Horton","Samuel Jennings");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (81,"034998185","Donec fringilla. Donec feugiat metus sit amet","Correo Postal","CKB21AVK","atasco",14,"9703 At Rd.","Armando Bass","Callum Solis"),
  (82,"592451480","ac urna. Ut tincidunt vehicula","Entrega en Punto de Recogida","ITX38EEE","atasco",6,"1054 Id Ave","Brennan Patton","Ciaran Kaufman"),
  (83,"530974423","tellus. Suspendisse sed","Servicios de Paquetería y Mensajería","TII26QGH","libre",7,"Ap #703-7158 Nostra, St.","Bruno Rush","Hayes Weaver"),
  (84,"358645258","lorem ac risus.","Servicios de Paquetería y Mensajería","YKU91ZZE","libre",16,"248-7891 Rutrum, Road","Erich Green","Ferris Thomas"),
  (85,"301614431","egestas. Duis ac arcu. Nunc mauris. Morbi non sapien","Entrega Express","UPA86FVT","libre",5,"Ap #433-7279 Feugiat Avenue","Nicholas Maldonado","Adrian Wilson"),
  (86,"981388484","eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida","Entrega Express","EOU75AXT","atasco",0,"P.O. Box 319, 9502 Maecenas Av.","Nerea Morris","Mallory Rojas"),
  (87,"851567552","Donec est. Nunc ullamcorper, velit","Entrega en Punto de Recogida","JJB79WSW","atasco",20,"176-1862 Risus Ave","Kristen Barton","Kellie Buckner"),
  (88,"146618196","rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede","Entrega en Punto de Recogida","OTI64ECR","atasco",0,"Ap #888-814 Nostra, Rd.","Haviva Holder","Alden Fields"),
  (89,"708845631","pretium et, rutrum non, hendrerit id,","Envío de Carga","IRO75EWD","atasco",1,"Ap #268-9663 Lectus Road","Tarik Maynard","Cynthia Jefferson"),
  (90,"248328381","Mauris quis turpis vitae purus","Correo Postal","RYC34MWX","libre",18,"934-3350 Odio St.","Amery Parrish","Iona Downs");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (91,"755640805","scelerisque neque sed sem egestas","Logística Reversa","XSI02SWO","concurrido",22,"Ap #730-9733 Mauris Avenue","Kylynn Barnett","Allistair Farmer"),
  (92,"443923875","mus. Donec dignissim magna","Servicios de Mensajería Local","UXN45DLS","libre",1,"Ap #159-5759 Auctor, Street","Madonna Walker","Abdul Barry"),
  (93,"207217861","pede, malesuada vel, venenatis","Entrega en Punto de Recogida","NNH86UWS","atasco",3,"Ap #762-9678 Arcu. Av.","Liberty Bradford","Octavius Hines"),
  (94,"864832253","natoque penatibus et magnis","Logística Reversa","TQD16ROG","libre",14,"148-1699 Lorem, Rd.","Jarrod Battle","Frances Collins"),
  (95,"341688567","aliquet. Proin velit. Sed","Entrega Express","THR12RSK","atasco",20,"2834 Mauris Road","Yvette Bennett","Kathleen Goodman"),
  (96,"738848476","risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam","Envío de Carga","MTB27PTJ","libre",11,"3551 Penatibus St.","Sebastian Delacruz","Kelsie Tyson"),
  (97,"722035934","cursus luctus,","Entrega Express","BOK52BWX","atasco",1,"370-8527 Tempor Rd.","Sonya Foreman","Hunter Kaufman"),
  (98,"203141728","fermentum","Servicios de Paquetería y Mensajería","BDI77YKI","libre",20,"487 Class Ave","Jameson Herman","Fuller Heath"),
  (99,"317520561","vehicula aliquet libero. Integer","Correo Postal","YKJ51GNP","atasco",8,"901-4998 Donec Avenue","Summer Walton","Jessamine Mcconnell"),
  (100,"969437654","arcu. Morbi","Entrega en Punto de Recogida","GDL67PAO","concurrido",24,"Ap #637-5845 Libero Rd.","Branden Abbott","Zenia Cline");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (101,"152172444","vitae mauris sit amet","Logística Reversa","DII75ITU","concurrido",16,"398-3469 Natoque St.","Keelie Noble","Clementine Stanton"),
  (102,"714731664","Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus","Entrega por Aplicaciones o Plataformas Específicas","JHY25UBK","atasco",21,"2571 Velit. Rd.","Hiroko Cortez","Micah Pena"),
  (103,"611256322","accumsan neque et nunc. Quisque ornare","Servicios de Paquetería y Mensajería","YVS33EIP","concurrido",17,"Ap #167-2653 Adipiscing Ave","Hasad Hopper","Jin Mcintosh"),
  (104,"873304594","Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor,","Entrega por Aplicaciones o Plataformas Específicas","RJB87IIP","concurrido",1,"992-510 Aliquet. Avenue","Sade Goodwin","Ruth Fleming"),
  (105,"772214865","Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus","Logística Reversa","CFR60TSV","libre",7,"Ap #253-6711 Nullam Rd.","Mira Moreno","Martena Lowery"),
  (106,"676816035","aliquet","Logística Reversa","NVV72FBK","atasco",9,"6942 Id Ave","Maia Montgomery","Keefe Singleton"),
  (107,"494279431","fringilla mi lacinia mattis. Integer eu","Envío de Carga","DRO48TFZ","concurrido",16,"Ap #311-3004 Neque. St.","Aquila Yang","Jael Mcintyre"),
  (108,"537733834","lectus ante dictum mi, ac mattis velit justo nec ante.","Logística Reversa","LYI46XXL","atasco",0,"817-1449 Consectetuer Street","Brock Barnes","Jaquelyn Nguyen"),
  (109,"544383319","est ac","Entrega en Punto de Recogida","KNI93QPJ","libre",14,"168-1721 Auctor Av.","Richard Bridges","Vanna Pacheco"),
  (110,"009087351","tincidunt","Envío de Carga","NIQ18OUP","libre",18,"881-3154 Vivamus Av.","Jenna Webster","Jane Lawson");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (111,"994879933","nascetur ridiculus mus. Proin vel arcu eu odio","Servicios de Mensajería Local","DKQ46JFW","concurrido",7,"P.O. Box 621, 7452 Nonummy St.","Hammett Beard","Maxwell Flowers"),
  (112,"472878373","convallis dolor. Quisque tincidunt pede ac","Logística Reversa","USA79MDC","concurrido",18,"583-2175 Tempor Ave","Burton Goff","Forrest Hartman"),
  (113,"352425428","fringilla mi lacinia","Envío de Carga","UWU10YKJ","concurrido",7,"Ap #477-5527 Elementum, Rd.","Alma Dennis","Kylan Kerr"),
  (114,"157473894","odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.","Entrega en Punto de Recogida","XWG77DDO","concurrido",1,"P.O. Box 456, 3846 Vel Avenue","Molly Hahn","Desiree Riddle"),
  (115,"274422789","magna. Nam ligula elit, pretium et, rutrum non, hendrerit id,","Envío de Carga","UIL68PBB","atasco",19,"953-9772 Tincidunt St.","Grady Hendrix","Nero Franco"),
  (116,"273363540","ac turpis","Correo Postal","ECB36GSQ","libre",24,"P.O. Box 462, 8003 Neque Rd.","Daquan Pennington","Carlos Carr"),
  (117,"271745027","ipsum. Curabitur consequat, lectus sit","Correo Postal","HID76TOV","libre",5,"Ap #599-9381 Duis Rd.","Slade Sharp","Todd Parker"),
  (118,"443298895","Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus","Entrega en Punto de Recogida","XRO16MUO","concurrido",24,"9441 Libero Av.","Sade Marsh","Devin Holman"),
  (119,"837127884","id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor,","Entrega en Punto de Recogida","JSB02ITY","concurrido",16,"P.O. Box 307, 4520 Scelerisque, Av.","Keefe Wright","Quentin Bolton"),
  (120,"134831341","ultricies sem magna nec quam. Curabitur","Correo Postal","VUD53ECE","atasco",2,"Ap #250-2606 Consequat Ave","Bianca Rivera","Audra Bullock");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (121,"393321446","gravida. Praesent","Entrega por Aplicaciones o Plataformas Específicas","CEE54MGM","atasco",13,"8019 Fringilla Road","Imelda Potts","Eugenia Valdez"),
  (122,"861465153","urna. Ut tincidunt vehicula","Entrega en Punto de Recogida","LVB49RLY","libre",8,"3165 Nunc Rd.","Katelyn Stout","Kristen Summers"),
  (123,"952795533","posuere at, velit. Cras lorem","Servicios de Mensajería Local","WPH35RIS","atasco",14,"Ap #496-6402 Duis Road","Ifeoma Collier","Nathan Potter"),
  (124,"233120866","pellentesque,","Entrega en Punto de Recogida","BKH72LTF","concurrido",1,"794-3935 Vulputate St.","Tatiana Diaz","Robert Salazar"),
  (125,"564328067","nulla. In tincidunt","Envío de Carga","EWM11QQQ","atasco",17,"Ap #514-6103 Rhoncus St.","Trevor Langley","Lawrence Arnold"),
  (126,"519682613","auctor vitae, aliquet nec, imperdiet nec,","Entrega Express","KSQ82MXD","libre",5,"Ap #332-5471 Duis St.","Flynn Robinson","Martin Marshall"),
  (127,"382052038","mauris sit amet lorem semper auctor. Mauris vel turpis.","Envío de Carga","EWI36QDE","concurrido",2,"Ap #128-9643 Et, Rd.","Nichole Mcmahon","Mufutau Coffey"),
  (128,"034328454","sagittis placerat. Cras dictum ultricies ligula.","Envío de Carga","GQT63SND","concurrido",21,"Ap #223-6260 Vestibulum Av.","Honorato Williams","Troy Hart"),
  (129,"438814051","leo. Cras vehicula aliquet libero. Integer","Logística Reversa","EYM07NOL","atasco",1,"7068 Aliquam St.","Jocelyn Walton","Hall Kidd"),
  (130,"001633774","sem ut cursus luctus, ipsum leo elementum","Logística Reversa","CPL65LZP","libre",7,"P.O. Box 475, 8239 Gravida St.","Vladimir Fry","Ezekiel Kaufman");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (131,"199387881","Donec nibh. Quisque nonummy ipsum non","Entrega Express","ESB04KHA","concurrido",19,"Ap #865-7670 Scelerisque Avenue","Myra Cole","Jameson Carpenter"),
  (132,"654594792","Duis a","Entrega por Aplicaciones o Plataformas Específicas","GKE48WCC","concurrido",5,"583-5785 Mattis. St.","Mariam Dunlap","Baxter Mckee"),
  (133,"882879721","lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan","Entrega Express","MKM43BRJ","libre",9,"3568 Ut, St.","Carl Strong","Malachi Thomas"),
  (134,"321676212","Integer vitae nibh.","Entrega por Aplicaciones o Plataformas Específicas","XRM57IQF","libre",8,"666-708 Arcu. Av.","Ora Mercer","Neil Slater"),
  (135,"278026666","tortor, dictum eu, placerat eget, venenatis a,","Entrega en Punto de Recogida","QIN76YYS","atasco",4,"Ap #222-4087 Eu Avenue","Ian Petersen","Anika Burke"),
  (136,"235176348","pede. Nunc sed orci lobortis augue","Envío de Carga","VEZ10EMM","libre",5,"4420 Primis St.","Cameron Elliott","Levi Cotton"),
  (137,"455341528","dui lectus rutrum urna, nec luctus felis","Correo Postal","EEC72ZYX","libre",10,"Ap #170-4772 Faucibus Rd.","Jared Tyson","Palmer Cummings"),
  (138,"880661710","nec tempus mauris erat eget ipsum. Suspendisse sagittis.","Entrega por Aplicaciones o Plataformas Específicas","FPM24YMQ","atasco",9,"P.O. Box 408, 1989 Amet Av.","Denton Joyner","Xaviera Blackwell"),
  (139,"315860644","eget magna. Suspendisse","Servicios de Paquetería y Mensajería","SGB11IFD","concurrido",15,"168-9861 A, Av.","Caldwell Bullock","Ronan Hurst"),
  (140,"711343423","Morbi metus. Vivamus euismod urna. Nullam lobortis","Entrega en Punto de Recogida","YLF98YLB","concurrido",18,"997-5123 Duis Rd.","Brian Cote","Jason Kramer");
INSERT INTO `compañia_de_envio` (`id`,`codigo_rastreo`,`indicaciones_del_usuario`,`metodo`,`codigo_del_paquete`,`estado_del_trafico`,`tiempo_estimado_de_entrega`,`destino`,`nombre`,`nombre_del_repartidor`)
VALUES
  (141,"220514570","lorem ut aliquam iaculis, lacus pede","Entrega por Aplicaciones o Plataformas Específicas","YNG57XHJ","concurrido",12,"189-2362 Nunc Avenue","Kitra Valentine","Alisa White"),
  (142,"360632138","sed dictum eleifend, nunc risus varius","Envío de Carga","WNI08BAN","concurrido",12,"Ap #573-8003 Metus. St.","Amos Hurst","Samson Riggs"),
  (143,"127546423","blandit enim consequat purus.","Servicios de Mensajería Local","FDS55GEB","libre",10,"4673 Mi, Road","Pamela Nelson","Kiona Reid"),
  (144,"964584751","id, libero. Donec consectetuer","Logística Reversa","JFX16LLB","libre",19,"1732 Aliquet Avenue","Mason Oliver","TaShya Valencia"),
  (145,"742242746","non massa non ante bibendum ullamcorper. Duis cursus, diam at","Envío de Carga","JHH96EOC","libre",20,"Ap #757-6281 Conubia Av.","Blythe Pollard","Merritt Duran"),
  (146,"242559028","et, euismod et, commodo","Entrega Express","JUF24SBI","libre",22,"883-7827 Etiam Rd.","Portia Patel","Solomon Davenport"),
  (147,"671786239","sit amet diam","Entrega en Punto de Recogida","NTQ48CCY","atasco",15,"197-4110 Donec Street","Daniel Rush","Noelani Powers"),
  (148,"124585066","lectus","Envío de Carga","TXP05CII","libre",16,"715-7250 Molestie. St.","Gabriel Rivers","Gregory Jenkins"),
  (149,"232724881","mauris.","Entrega en Punto de Recogida","ICG08UKR","libre",19,"727-8353 Tempor Rd.","Aline Gay","Jacqueline Montgomery"),
  (150,"523813265","vulputate dui, nec tempus mauris erat eget ipsum.","Entrega por Aplicaciones o Plataformas Específicas","ELW77NLR","libre",12,"Ap #390-5268 Vitae, St.","Shellie Tyler","Joan May");
INSERT INTO `color` (`id`,`id_producto`,`color`)
VALUES
  (1,25,"Cian"),
  (2,56,"Púrpura"),
  (3,50,"Amarillo"),
  (4,47,"Magenta"),
  (5,47,"Ámbar"),
  (6,42,"Plata"),
  (7,25,"Cian"),
  (8,61,"Ámbar"),
  (9,57,"Marfil"),
  (10,31,"Lavanda");
INSERT INTO `color` (`id`,`id_producto`,`color`)
VALUES
  (11,20,"Cian"),
  (12,36,"Cian"),
  (13,2,"Caqui"),
  (14,63,"Melocotón"),
  (15,66,"Turquesa"),
  (16,42,"Negro"),
  (17,2,"Celeste"),
  (18,4,"Lavanda"),
  (19,33,"Azul_Marino"),
  (20,54,"Negro");
INSERT INTO `color` (`id`,`id_producto`,`color`)
VALUES
  (21,51,"Cereza"),
  (22,25,"Rosa_Fuerte"),
  (23,9,"Coral"),
  (24,16,"Beige"),
  (25,12,"Mauve"),
  (26,14,"Marfil"),
  (27,68,"Teal"),
  (28,48,"Lavanda"),
  (29,64,"Violeta"),
  (30,22,"Ámbar");
INSERT INTO `color` (`id`,`id_producto`,`color`)
VALUES
  (31,46,"Púrpura"),
  (32,0,"Índigo"),
  (33,58,"Magenta"),
  (34,13,"Verde_Esmeralda"),
  (35,36,"Violeta"),
  (36,67,"Marfil"),
  (37,64,"Coral"),
  (38,61,"Celeste"),
  (39,68,"Rosa"),
  (40,46,"Celeste");
INSERT INTO `color` (`id`,`id_producto`,`color`)
VALUES
  (41,65,"Marrón"),
  (42,1,"Naranja"),
  (43,41,"Blanco"),
  (44,9,"Marfil"),
  (45,58,"Coral"),
  (46,69,"Rojo"),
  (47,51,"Azul_Marino"),
  (48,39,"Borgoña"),
  (49,39,"Mostaza"),
  (50,29,"Verde_Esmeralda");
INSERT INTO `color` (`id`,`id_producto`,`color`)
VALUES
  (51,56,"Azul"),
  (52,26,"Rosa"),
  (53,38,"Azul_Cielo"),
  (54,30,"Beige"),
  (55,46,"Oro"),
  (56,43,"Naranja"),
  (57,25,"Carmesí"),
  (58,51,"Ciruela"),
  (59,64,"Mauve"),
  (60,4,"Negro");
INSERT INTO `color` (`id`,`id_producto`,`color`)
VALUES
  (61,63,"Gris_Oscuro"),
  (62,9,"Coral"),
  (63,2,"Amarillo"),
  (64,67,"Caqui"),
  (65,1,"Rosa"),
  (66,14,"Canela"),
  (67,40,"Verde_Oscuro"),
  (68,17,"Celeste"),
  (69,60,"Ámbar"),
  (70,68,"Oro");
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (1,141,33),
  (2,150,90),
  (3,55,1),
  (4,119,85),
  (5,64,47),
  (6,7,53),
  (7,53,55),
  (8,33,59),
  (9,20,148),
  (10,149,124);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (11,31,48),
  (12,68,149),
  (13,92,144),
  (14,114,101),
  (15,17,46),
  (16,134,35),
  (17,90,80),
  (18,72,4),
  (19,6,10),
  (20,114,39);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (21,28,82),
  (22,42,35),
  (23,87,67),
  (24,1,72),
  (25,62,71),
  (26,129,145),
  (27,21,127),
  (28,27,94),
  (29,120,140),
  (30,6,46);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (31,30,149),
  (32,70,31),
  (33,121,59),
  (34,148,59),
  (35,101,22),
  (36,123,35),
  (37,69,109),
  (38,60,15),
  (39,145,68),
  (40,138,35);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (41,2,38),
  (42,133,140),
  (43,73,104),
  (44,57,145),
  (45,102,34),
  (46,133,31),
  (47,68,22),
  (48,39,107),
  (49,55,126),
  (50,50,85);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (51,87,84),
  (52,76,140),
  (53,35,5),
  (54,12,141),
  (55,18,43),
  (56,79,127),
  (57,85,40),
  (58,130,18),
  (59,104,46),
  (60,147,98);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (61,137,15),
  (62,61,115),
  (63,21,1),
  (64,3,97),
  (65,26,127),
  (66,140,6),
  (67,33,67),
  (68,41,137),
  (69,72,127),
  (70,133,81);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (71,72,83),
  (72,102,103),
  (73,139,45),
  (74,5,13),
  (75,86,89),
  (76,120,121),
  (77,75,133),
  (78,110,146),
  (79,130,27),
  (80,104,72);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (81,71,113),
  (82,23,57),
  (83,72,77),
  (84,105,2),
  (85,124,83),
  (86,122,99),
  (87,27,37),
  (88,25,145),
  (89,148,100),
  (90,126,57);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (91,144,18),
  (92,126,25),
  (93,137,83),
  (94,47,51),
  (95,28,16),
  (96,15,51),
  (97,54,79),
  (98,40,146),
  (99,107,46),
  (100,41,71);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (101,60,54),
  (102,5,31),
  (103,8,51),
  (104,99,24),
  (105,121,39),
  (106,123,60),
  (107,73,19),
  (108,60,125),
  (109,87,94),
  (110,72,100);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (111,54,97),
  (112,70,97),
  (113,127,2),
  (114,128,80),
  (115,70,82),
  (116,102,91),
  (117,18,95),
  (118,135,88),
  (119,116,86),
  (120,128,80);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (121,81,33),
  (122,117,72),
  (123,59,118),
  (124,34,72),
  (125,60,36),
  (126,66,51),
  (127,145,109),
  (128,106,37),
  (129,46,63),
  (130,95,11);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (131,128,111),
  (132,88,22),
  (133,146,99),
  (134,37,106),
  (135,69,132),
  (136,66,54),
  (137,132,27),
  (138,15,76),
  (139,110,148),
  (140,137,84);
INSERT INTO `usuario_comparte_plan_mensual` (`id_plan_mensual`,`id_usuario_paga`,`id_usuario_ratea`)
VALUES
  (141,35,35),
  (142,23,97),
  (143,96,132),
  (144,58,85),
  (145,41,146),
  (146,15,2),
  (147,11,132),
  (148,108,136),
  (149,132,83),
  (150,66,110);
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (1,33,"IDC57CUP1PO","CZ4650644627302735872888"),
  (2,3,"TPT42TFV7IT","PT73113384825284424137652"),
  (3,42,"QHN81LHK8LQ","DE54651728182486780784"),
  (4,91,"YCU09OVL1JO","LI5123418451283730472"),
  (5,36,"GYK57VDF3TH","AL85392436680259346601168231"),
  (6,78,"CGS62HBN2YR","GI85EZBK219198233228284"),
  (7,50,"OOB75OGK3GF","AT285605925200155013"),
  (8,3,"XEA53JIU2UL","AD5557111781762456536667"),
  (9,62,"NMM94XDC4HJ","PK6924359522351927146159"),
  (10,47,"ICU04HLJ6QQ","CH6262511862165557841");
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (11,14,"LJD47FLM7NJ","MU8584241445677571725681916934"),
  (12,73,"AUQ08PQW2DX","GL4431551053536191"),
  (13,45,"AFT22SNS0NC","CZ0238287241625207118472"),
  (14,56,"XLW51MSI6GS","VG9379348671667538421164"),
  (15,4,"VLR18DCB1DV","MC3473453862889128848142627"),
  (16,71,"EGD71BOF6BN","EE792572464645385323"),
  (17,61,"PHY79CLZ2XE","AT182023028661950252"),
  (18,74,"MHC96DJS4ER","FO4735332155362537"),
  (19,45,"AAN73JVE9WE","GE26616877746182037817"),
  (20,99,"SMB79GUE3RN","MC6201319858786587038338192");
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (21,8,"MJD64CNX2QT","NL06INQP9628434357"),
  (22,6,"DXO98QQP3LL","AL98442867919136251548263332"),
  (23,29,"WWL14UMF7FP","MR3218293835130518464758644"),
  (24,76,"AIQ89XSW5FN","AZ02965149537954424027542379"),
  (25,25,"QUL65YPG3HH","AT265554757318376144"),
  (26,8,"HXU14TYG8DP","SM9011075224638830121116350"),
  (27,65,"XHU29IGH8RV","PL20197451562890611715047431"),
  (28,27,"NXI51XXS3YK","LI5835686066423507757"),
  (29,84,"UVX42LJV4UB","BE78782424182886"),
  (30,81,"EKW62ISD5LD","AD7889141111187340678156");
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (31,79,"PPO18ZNL3AD","TN5378184336259559566248"),
  (32,13,"IGN56YGR5SV","SK7672787747353137811706"),
  (33,73,"FHO32FMI0XV","AT444314965356530408"),
  (34,93,"RVE62VRM4HE","MC9793508470289321903963684"),
  (35,27,"ODX62FOM8CY","SK4476254446278838678123"),
  (36,9,"GIK08EDT5GO","TN9799088527145001925432"),
  (37,7,"BMQ49PMG3DF","TN6707532777070354113267"),
  (38,58,"YJK74TII3SR","DE07885234377837184501"),
  (39,37,"YTY81KSC7MI","TN7356868137812878076796"),
  (40,69,"LBP67KTL5JW","CZ1057469838004626564862");
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (41,98,"GXK11CEW8YF","CH7085700733637389571"),
  (42,54,"VXP03ABP7YH","HU14871411581943294863608826"),
  (43,39,"JAL10EYF1JL","PS952614297936804761672216784"),
  (44,30,"FKU23XXT0CB","VG4239292281341502342154"),
  (45,59,"OUW38SQX4OO","IS293292480181407967556184"),
  (46,31,"QLD71OQH3YJ","GT17408455889161173474726645"),
  (47,14,"SBI58JFZ8OY","CZ6247154871038647011757"),
  (48,38,"YVB94OKI8HF","PK2386128249742131331531"),
  (49,10,"DYL19RCY9XM","TN1231396058356295715353"),
  (50,24,"JCJ58FQX5KC","IE97HCFU61541945073859");
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (51,47,"WCL90UOT7KI","MT40FLKI64668188538832716781422"),
  (52,46,"QGQ18DDF1RJ","PT72238576178365141952773"),
  (53,93,"VOV72NDO3XO","LT026336027313413514"),
  (54,19,"BQH62MSQ0JG","MD2955634842521571851724"),
  (55,41,"VPB41OOS4PU","NO1753047338879"),
  (56,68,"IQY46BNJ1UT","MC8337355666252620812007079"),
  (57,82,"RDD33NBQ4CJ","LV53VALU3190378224742"),
  (58,64,"TFY26QHM5MC","GB11BFEF14659231398050"),
  (59,85,"VNO62ZUO5KB","PS578880838426310711592438643"),
  (60,38,"DEL36DSM5LB","LU888646154143013638");
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (61,52,"WHL91BCC2MO","GR8584650935114471432595118"),
  (62,70,"WCN62KKN6CX","FI0209148965155842"),
  (63,19,"VEI28SUT4WC","CZ9676376634161723568439"),
  (64,55,"GNB70HDE8SJ","AE981035348364818487783"),
  (65,34,"OYQ84WLK3EO","FI3584388808636360"),
  (66,80,"EYM51NOT2CW","BH62556012661004447647"),
  (67,45,"CQP55TNN4OH","GB73TIOY30743242224194"),
  (68,72,"CDQ18POU5UR","FO3818616746872018"),
  (69,28,"HAD35KJH2DO","LB32302496686533835053424642"),
  (70,1,"MYS58STY0SI","GT93116237224330634487331625");
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (71,21,"SFT17EMN3YK","TR767536859344406787863004"),
  (72,26,"HIY41CCM1LQ","KW8239653281544311537375119616"),
  (73,57,"URF04FXK3WQ","ES1646653288023952986063"),
  (74,60,"RWH34NDH1JL","DO11504361472663336591411169"),
  (75,34,"HDM61BKQ1YI","NL03BNWW1138761887"),
  (76,98,"NTU58SVS4PB","PS962518624818122312728606563"),
  (77,94,"HAE55XHU0BI","BE50086203726830"),
  (78,47,"XAV18PTK6MF","PK7812098581248566086562"),
  (79,4,"ZLW21YGW7OX","LT066377322224535685"),
  (80,63,"KZW00TKS4SS","DK6885127277719865");
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (81,18,"NDQ38MDA6CT","MC7970158173203154351227441"),
  (82,53,"OEH84PNN4HF","GE32768979739758373138"),
  (83,97,"KWE61UXD6FF","MD7106886837362658147538"),
  (84,30,"VCC10WJW3FL","MK66344259175746536"),
  (85,44,"OFM50QSY4PG","LU866456438109163518"),
  (86,58,"MXH93NRU1SS","SE5510159856352784872286"),
  (87,49,"OKK69CFI5OW","DK7575396223773758"),
  (88,68,"TUA34BOF6EY","CZ1944413956173202684676"),
  (89,45,"IGI51LYD5KI","GE96084377215840121287"),
  (90,54,"IVQ11LXW6TD","CH9226531444117178154");
INSERT INTO `metodo_de_pago` (`id`,`id_plan_mensual`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (91,47,"XDC75HOH5CI","GR4628519174135123645617795"),
  (92,67,"IFL30CNC2CE","MK48210363391884745"),
  (93,62,"TPE22JVO6SQ","SM8713879204912297464530269"),
  (94,7,"XMO87SAS1KI","SK7083674644333881947453"),
  (95,87,"XTR85QPC1PC","HU22433257260135526496228814"),
  (96,82,"KRI98TWL3VE","MD2884339835252367943497"),
  (97,80,"NEF72EHW9UH","SK1378175248486318666431"),
  (98,64,"LPB96RIW4WD","GL9824845612379142"),
  (99,24,"FPD63JCJ2QC","MD8232141113185511453270"),
  (100,58,"SHU92GUY6RC","BA395643652675754061");
  INSERT INTO `bizum` (`id`,`id_metodo_de_pago`,`numero_de_telefono`)
VALUES
  (1,37,"352010633"),
  (21,73,"421618336"),
  (41,56,"584299450"),
  (61,0,"238326487"),
  (81,81,"733708104"),
  (101,87,"543274132"),
  (121,53,"636365488"),
  (141,81,"943159568"),
  (161,93,"618730711"),
  (181,19,"548350858");
INSERT INTO `bizum` (`id`,`id_metodo_de_pago`,`numero_de_telefono`)
VALUES
  (201,17,"826939637"),
  (221,10,"868175867"),
  (241,49,"480629498"),
  (261,20,"535675697"),
  (281,43,"483176247"),
  (301,90,"845960110"),
  (321,85,"551377919"),
  (341,12,"866528487"),
  (361,26,"558578139"),
  (381,89,"640517273");


INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (1,30,"Naruto_Uzumaki",10,197,"M"),
  (2,236,"Lelouch_Lamperouge",619,108,"M"),
  (3,98,"Edward_Elric",479,58,"H"),
  (4,249,"Monkey_D_Luffy",903,85,"H"),
  (5,270,"Vegeta",991,197,"H"),
  (6,122,"Goku_Son",750,37,"M"),
  (7,87,"Levi_Ackerman",998,162,"H"),
  (8,66,"Ichigo_Kurosaki",471,25,"H"),
  (9,129,"Light_Yagami",715,175,"H"),
  (10,55,"Sasuke_Uchiha",370,117,"M");
INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (11,173,"Sukuna",452,180,"H"),
  (12,209,"Misa_Amane",789,165,"M"),
  (13,98,"Toji_Fusiguro",6291,150,"M"),
  (14,249,"Miroku",624,171,"M"),
  (15,270,"Makoto_Kino",875,162,"H"),
  (16,122,"Natsu_Dragneel",532,176,"M"),
  (17,87,"Emilia",907,185,"H"),
  (18,66,"Tanjiro_Kamado",674,160,"H"),
  (19,129,"Dio_Brando",318,160,"H"),
  (20,55,"Spike_Spiegel",847,184,"M");
INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (21,25,"Guts",521,178,"H"),
  (22,177,"Sailor_Moon",946,156,"M"),
  (23,118,"Kenshiro",673,175,"H"),
  (24,15,"Ryuko_Matoi",207,165,"M"),
  (25,58,"Hisoka_Morow",364,187,"H"),
  (26,137,"Akaza",782,160,"H"),
  (27,44,"Yuno_Gasai",489,162,"M"),
  (28,72,"Eren_Yeager",921,175,"H"),
  (29,199,"Nodoka_Saotome",583,165,"M"),
  (30,101,"Ryoga_Hibiki",396,178,"H");
INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (31,60,"Shoto_Todoroki",754,176,"H"),
  (32,134,"Tenya_Iida",829,175,"H"),
  (33,8,"Inosuke",502,167,"H"),
  (34,99,"Yusuke_Urameshi",649,183,"H"),
  (35,41,"Kurapika",715,168,"H"),
  (36,15,"Doraemon",405,170,"M"),
  (37,90,"Endeavor",876,190,"H"),
  (38,59,"Kagome_Higurashi",287,155,"M"),
  (39,4,"Makoto_Naegi",618,163,"H"),
  (40,78,"Gojo_Satoru",6421,179,"H");
INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (41,125,"Rem",526,154,"M"),
  (42,13,"Edward_Kenway",754,149,"H"),
  (43,166,"Naga_the_Serpent",893,183,"M"),
  (44,115,"Jotaro_Kujo",607,190,"H"),
  (45,91,"Nobara",408,182,"H"),
  (46,172,"Gon_Freecss",745,160,"H"),
  (47,3,"Holo_the_Wise_Wolf",512,170,"M"),
  (48,89,"All_Might",679,220,"H"),
  (49,152,"Tsukasa_Shishio",726,185,"H"),
  (50,56,"Gourry_Gabriev",901,183,"H");

INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (51,178,"Yemi",326,155,"M"),
  (52,127,"Alucard",578,190,"H"),
  (53,180,"Chi-Chi",709,160,"M"),
  (54,101,"Ryuck",847,179,"H"),
  (55,19,"L",439,179,"H"),
  (56,105,"Usagi_Tsukino",574,158,"M"),
  (57,13,"Pyro_Mantani",705,155,"H"),
  (58,136,"Killua_Zodric",903,175,"H"),
  (59,34,"DarkHollow",481,168,"H"),
  (60,10,"Satsuki_Kiryuin",698,170,"M");
  INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (61,125,"Rukori",610,175,"M"),
  (62,240,"Kurama",547,190,"H"),
  (63,105,"Nanami",780,165,"H"),
  (64,275,"Nami",936,170,"M"),
  (65,285,"Sanji",408,180,"H"),
  (66,135,"Gohan_Son",789,175,"M"),
  (67,95,"Mikasa_Ackerman",702,170,"H"),
  (68,80,"Narancia_Ghirga",525,165,"H"),
  (69,200,"Alphonse_Elric",645,160,"H"),
  (70,65,"Boruto_Uzumaki",821,175,"M");
  INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (71,190,"Hinata_Hyuga",927,160,"M"),
  (72,140,"Luffy_Monkey_D",689,178,"H"),
  (73,240,"Rin_Okumura",523,175,"H"),
  (74,195,"Key",750,182,"M"),
  (75,280,"Saitama",814,180,"H"),
  (76,155,"Yukino_Yukinoshita",601,163,"M"),
  (77,110,"Zoro_Roronoa",489,183,"H"),
  (78,85,"Kallen_Stadtfeld",732,168,"H"),
  (79,205,"Yami_Sukehiro",578,175,"H"),
  (80,70,"Genos",660,162,"M");
  INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (81,295,"Zero_Kiryu",870,160,"M"),
  (82,180,"Maka_Albarn",603,165,"H"),
  (83,130,"Lucy_Heartfilia",748,170,"M"),
  (84,185,"Kaname_Kuran",425,162,"H"),
  (85,220,"Kakashi_Hatake",921,183,"H"),
  (86,145,"Revy",504,175,"H"),
  (87,100,"Ram",673,160,"H"),
  (88,115,"Jiraiya",408,178,"H"),
  (89,210,"Edward_Wong_Hau_Pepelu_Tivrusky_IV",777,162,"H"),
  (90,75,"Gintoki_Sakata",605,177,"H");
INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (91,190,"Rias_Gremory",920,175,"M"),
  (92,230,"Griffith",512,183,"H"),
  (93,115,"Meliodas",701,165,"H"),
  (94,275,"Himura_Kenshin",689,175,"H"),
  (95,150,"Kyoko_Kirigiri",870,185,"H"),
  (96,285,"Shinobu_Kocho",621,168,"H"),
  (97,125,"Hiei",490,190,"H"),
  (98,160,"Sakura_Haruno",729,162,"H"),
  (99,205,"Kirei_Kotomine",888,180,"H"),
  (100,80,"Soul_Eater",602,175,"H");
INSERT INTO `personaje` (`id`,`id_manga`,`nombre`,`numero_de_seguidores`,`estatura`,`sexo`)
VALUES
  (101,260,"Yusuke_Yurameshi",489,175,"H"),
  (102,180,"Koyomi_Araragi",720,182,"H"),
  (103,215,"Lonor",605,175,"H"),
  (104,140,"Lina_Inverse",818,160,"M"),
  (105,295,"Nezuko_Kamado",693,153,"M"),
  (106,150,"Escanor",541,183,"H"),
  (107,100,"Elizabet",704,190,"M"),
  (108,220,"Rika_Amanai",627,162,"M"),
  (109,190,"Zoro",498,180,"H"),
  (110,105,"Zenitus",712,160,"M");

INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (1,115,90,7,"PSK39BAHMMGKNMOC","acsesorio","XS",25),
  (2,54,50,29,"WYI57HJBPXDJBLCY","cosplay","XXL",44),
  (3,117,68,147,"ILT51LGNTGWUNTWS","artefacto","XXL",2),
  (4,40,44,136,"KCM22ZZCNGEOHKXS","acsesorio","XL",14),
  (5,133,56,127,"CKN91FIJQQPTYSGG","pulsera","XS",49),
  (6,85,49,106,"GXO12IOKTIGDMVYY","artefacto","XXXL",41),
  (7,38,87,123,"GCX70IDWKNXNONKX","arma","XL",26),
  (8,135,11,68,"PES64LEVPDKBYOIU","cosplay","XS",43),
  (9,119,41,11,"UPS77OQKHQXJLTXW","cosplay","L",10),
  (10,58,95,24,"KUS86KCMBTNXMCYG","poster","XXL",30);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (11,38,73,19,"MWL34TXXQPZEJRXQ","artefacto","M",1),
  (12,101,82,50,"JND29OCHZCBPXJWG","arma","L",8),
  (13,149,77,114,"AFY02YHQLKUXGYLQ","figura","XXXL",5),
  (14,19,48,52,"PXO18RBDDTJJWBLW","figura","XL",29),
  (15,34,71,17,"XST32UGIYXQJACYL","arma","M",10),
  (16,10,17,99,"MZW22YPCZUQPHTQA","poster","XXXL",38),
  (17,15,34,73,"HRM65LNDJRTDGNWP","poster","S",0),
  (18,103,23,21,"YDR18YAPHLGNBPUP","artefacto","L",29),
  (19,66,51,149,"IPD30SRYUFGQDYLR","cosplay","L",30),
  (20,50,64,7,"PJP44UPIPORRIJVE","arma","XL",27);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (21,53,18,31,"VHH63YGXCYVTCBMI","poster","S",32),
  (22,10,12,29,"TJJ73OYTMQDDRZLV","pulsera","M",18),
  (23,13,61,7,"VRZ23WZYHHPLLBBZ","figura","S",25),
  (24,27,104,48,"RPC38GQGUWYOZVKG","acsesorio","M",43),
  (25,140,27,73,"WLR13LIMQPUMCLKA","figura","S",48),
  (26,20,42,7,"DMT53OLRTHKSACOW","figura","XXL",9),
  (27,97,88,141,"VVC71FBIGKTNSCLZ","cosplay","XL",36),
  (28,123,107,18,"NUX24FTGMHAGYTXJ","poster","S",15),
  (29,69,16,56,"KHX00LXZEOMVBIXE","pulsera","XXL",3),
  (30,102,12,116,"QPK81DHKFQJRHEOQ","pulsera","XXL",17);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (31,28,98,78,"HTT15PVLUVFCMSJB","figura","M",40),
  (32,59,52,120,"AEH54QWYUYNVROMA","poster","XXXL",48),
  (33,29,16,47,"UMO59OCFUDSSBMFA","pulsera","XXL",12),
  (34,59,94,136,"PND16NTRQDRTPQRX","cosplay","L",39),
  (35,58,6,12,"GRU42LJZZCHKJRCY","figura","XXXL",15),
  (36,145,90,140,"FTG45YNCRJCOXLWF","acsesorio","XL",37),
  (37,56,89,21,"XJL54RDAAJWNPTWD","artefacto","XXXL",36),
  (38,17,92,131,"DZN83WXXSBYEVDPX","figura","XXXL",12),
  (39,13,19,107,"UYE64PVRIVAZWRGJ","figura","XXL",10),
  (40,135,9,10,"UCO92PXMLVDCEKGP","artefacto","S",12);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (41,47,59,18,"STY54IIHWRIUJNWG","cosplay","L",35),
  (42,129,25,67,"HLP13APDIIFRJCDD","cosplay","M",16),
  (43,100,102,46,"CEQ59MOVZLBOXIEG","pulsera","XL",12),
  (44,31,93,90,"YRB10IHOEIRXFATE","figura","M",4),
  (45,44,51,134,"RIK28JSNQUFCHDXE","pulsera","XS",8),
  (46,109,58,116,"ITI71RUYFEGDNHVD","poster","XL",11),
  (47,74,84,41,"JOB31LOWJRHHWOCY","arma","S",19),
  (48,84,99,148,"DUC42RJUEHHIDPMH","arma","L",2),
  (49,27,69,77,"JLK44LJOARRCRNES","arma","XL",44),
  (50,20,19,129,"ZQG48MPJANLNPATI","cosplay","L",37);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (51,30,107,106,"REO37EKUZQYHEKKR","poster","XS",4),
  (52,59,60,106,"JGT22TSOEHBQIFPY","pulsera","XXXL",45),
  (53,45,88,105,"KAS52LPPRIUEEZAB","figura","L",13),
  (54,22,69,8,"ZBQ34QQRVNDWAKLX","figura","XXL",41),
  (55,74,67,13,"HJV95LGRBXAPFRDD","pulsera","S",15),
  (56,127,64,102,"LBI66SPVYWQSRECQ","cosplay","S",1),
  (57,138,36,28,"BAB95RJWRXWRSVOX","poster","XXL",10),
  (58,22,40,28,"CNH25CSNWTCXLJLE","cosplay","L",19),
  (59,143,44,115,"MNG40AMCVGMWUAIY","acsesorio","XXXL",35),
  (60,94,61,116,"CMX21SDEFWQESKOO","arma","M",26);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (61,3,71,10,"MLG26EVBBESOPEBC","figura","XXL",2),
  (62,97,71,9,"SKJ99CSFHRNSURJA","acsesorio","XXXL",8),
  (63,105,97,70,"LRR71SPJOOHZZKHT","artefacto","XXL",38),
  (64,114,84,140,"LUY74CMJBMUOEPMF","cosplay","S",6),
  (65,40,36,111,"VGY71KPUDSWJVSLP","acsesorio","XS",49),
  (66,91,35,23,"HPQ30OWLAEDRRPVX","poster","XXL",10),
  (67,144,76,102,"YLU11OWMGIVBEEUN","poster","S",36),
  (68,148,25,7,"GXR13UKNWDRHIKVQ","cosplay","L",33),
  (69,29,91,46,"HKH44MJEHTFPHSOQ","arma","S",34),
  (70,62,2,70,"PEO98VLJFDPQEUES","poster","XL",18);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (71,87,99,107,"KNS26YQMJXYBUSPK","figura","L",16),
  (72,47,10,33,"VOF53YEROYSZOCPB","acsesorio","L",49),
  (73,73,87,37,"PSG13YLKUSQQEWFR","pulsera","XXL",26),
  (74,147,84,105,"RFJ74FNEXXLOHLVZ","poster","S",48),
  (75,47,93,76,"HOB14VNHJDOEPACJ","figura","L",13),
  (76,45,28,60,"MHP60EYSIGVZXSEG","figura","S",15),
  (77,13,86,92,"FXR39GWGPYCIUHXD","figura","S",16),
  (78,19,43,21,"KDY24FGQIGXASWVM","pulsera","XXXL",29),
  (79,5,5,107,"OOC39LQYJHDXQRND","poster","XS",8),
  (80,137,58,75,"EBL33WNHBAOBMFRX","poster","XXXL",6);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (81,85,13,11,"RMD63XSMYZEHRSGG","pulsera","XL",35),
  (82,42,108,108,"QGM07LPOZJWVQNIQ","figura","XXXL",17),
  (83,32,2,26,"LQM04ALFYEOXESOC","cosplay","XXL",25),
  (84,89,26,132,"EPQ23OHONBCOIMCD","cosplay","XXXL",22),
  (85,19,28,9,"PFZ29EYJWXIOPGXC","cosplay","S",41),
  (86,31,36,79,"YEE77LUGGWZSPOKC","artefacto","M",34),
  (87,150,98,148,"YQT44NPSCEGPESQF","pulsera","M",42),
  (88,2,15,12,"SPI82WLRUYQHVOKM","artefacto","XXL",10),
  (89,44,98,1,"HXR21WGHUKRSGPPH","figura","XXL",25),
  (90,54,21,26,"IMJ55HNITKEQEKWR","artefacto","L",29);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (91,51,67,97,"JNI31WITMYZMNNLA","acsesorio","M",25),
  (92,47,91,93,"EFZ27EWWTNLTCVPA","figura","L",23),
  (93,55,88,147,"VAB72YIESIRFJYKE","pulsera","S",32),
  (94,83,19,93,"KEL58XQSORQFSUJQ","arma","S",3),
  (95,63,62,96,"LAI41ZWAFHESHNBY","cosplay","S",44),
  (96,16,27,147,"RJT37DKVLVWIEJWM","figura","S",3),
  (97,52,95,79,"RHD74ZNQITZBTYML","arma","M",42),
  (98,148,4,56,"XPW93EJDDSECTCFD","arma","M",41),
  (99,120,46,28,"LNY56PEWLSHQJDUA","pulsera","XXXL",20),
  (100,134,49,44,"PEW41RLKSFWTVNAK","acsesorio","XL",0);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (101,19,13,93,"NEV05SXEGOFOJRWK","poster","XXL",37),
  (102,58,11,95,"RMO08IJWWKKSGKPD","pulsera","XS",39),
  (103,39,40,132,"ITE71JNZZGBXYRZZ","figura","M",37),
  (104,139,30,55,"VRK63HJOOXGRSTUA","artefacto","S",12),
  (105,3,53,81,"OBJ47JVTPZHTUCEW","acsesorio","XXL",36),
  (106,125,105,121,"PCE72RBVXLRPNZGG","acsesorio","XXXL",6),
  (107,103,15,114,"PVR87DPJSCCOSPZI","acsesorio","XXXL",7),
  (108,123,69,110,"LPK13OPHSDREYBQH","poster","M",3),
  (109,121,35,106,"IUX42DYKRUTUPJLN","figura","L",19),
  (110,74,1,1,"RMO45PUWXPVHKIHV","pulsera","S",39);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (111,70,44,63,"ZTE47TSCWSDQGFGH","pulsera","XXL",26),
  (112,26,18,46,"FTY43TTJMMLRBBWK","poster","XXXL",7),
  (113,63,59,107,"DXN84HDFPJGLYOWI","acsesorio","XXL",16),
  (114,16,37,113,"ONY26DHHBWZRUIUB","pulsera","S",45),
  (115,117,102,79,"XOK76WFFJZXCIJOF","pulsera","XXL",43),
  (116,12,50,8,"YWX91YOCADHZBWPY","cosplay","L",24),
  (117,89,68,41,"UOV47BWEUHCRTDST","arma","S",33),
  (118,138,86,35,"URZ45LCQUGUMCFOQ","cosplay","XXXL",1),
  (119,143,22,24,"SRR85FRUCXQRGECH","pulsera","S",44),
  (120,145,24,57,"FGR07GVEFNKGNGUL","poster","XS",45);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (121,141,39,73,"FPF63YBVGVDHITJC","acsesorio","L",4),
  (122,123,84,33,"CSZ59LITOSCPTYCK","poster","L",35),
  (123,103,6,94,"HMW13JROCCEJBVRM","acsesorio","S",7),
  (124,88,83,93,"LWR72XBCCHHQQGBF","cosplay","XS",28),
  (125,74,21,74,"TUC37SVRNMXUUMGZ","pulsera","XL",35),
  (126,68,28,62,"ZRY58HDRUYFPAWXD","pulsera","XXL",14),
  (127,3,84,96,"XQY63LYHLIVGCCBA","artefacto","XS",19),
  (128,18,45,70,"ISW42LNJNCRFYHGH","artefacto","XXXL",17),
  (129,110,60,64,"MSJ47WCXOLDOPYKU","poster","S",22),
  (130,28,1,116,"KXF55MIXWZUEPBWU","cosplay","XL",18);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (131,43,77,128,"LLQ70DWIXMVBKMCT","poster","XXXL",9),
  (132,26,22,150,"ROI71BNFYVBAIUHR","cosplay","XL",10),
  (133,134,102,143,"UGI03BERBMZGJYKO","figura","M",31),
  (134,139,39,90,"JTH73PDLVMVNBXVJ","cosplay","M",47),
  (135,60,80,127,"KZP01TETRZDMCKUZ","figura","XL",26),
  (136,129,57,82,"PJI94IIHITQELOLP","cosplay","XL",31),
  (137,6,67,148,"PQS13XWGXJLRNXNP","artefacto","XL",44),
  (138,48,95,127,"TEQ40DNYSSQQGBEX","poster","XXL",39),
  (139,147,74,71,"AIV25WKKANKJEPLC","cosplay","M",8),
  (140,149,99,95,"UZJ66DAKSJEAQBVK","cosplay","S",46);
INSERT INTO `producto` (`id`,`id_compañia_de_envio`,`id_personaje`,`id_usuario`,`nº_de_factura`,`categoria`,`tamaño`,`peso`)
VALUES
  (141,149,76,142,"RFE68YNGKSQLHSMW","poster","S",3),
  (142,37,7,32,"QYA31IQPLIRERLHM","pulsera","M",41),
  (143,139,65,15,"VLC82AOSKBPJEUUE","cosplay","XXXL",8),
  (144,81,72,9,"HPP44PILRVFDYKKF","cosplay","M",2),
  (145,41,41,123,"WSE74FXMDLGPXWHM","arma","L",50),
  (146,16,36,146,"KLQ27SDEGMBHRTUP","artefacto","XXL",10),
  (147,52,99,0,"JWH77OCKVSACYCDN","cosplay","XL",34),
  (148,5,0,82,"XCF21FRVUWFKBCJJ","pulsera","XXXL",37),
  (149,109,89,135,"SFW20HBQLEGIVHJM","cosplay","S",24),
  (150,131,34,15,"OBJ95CFVKCMLZPJF","figura","XS",40);
INSERT INTO `usuario_personaje` (`id_usuario`,`id_personaje`)
VALUES
  (135,99),
  (21,25),
  (75,50),
  (51,109),
  (69,98),
  (108,23),
  (88,18),
  (125,5),
  (60,37),
  (83,3);
INSERT INTO `usuario_personaje` (`id_usuario`,`id_personaje`)
VALUES
  (65,15),
  (87,67),
  (132,50),
  (86,36),
  (69,36),
  (28,35),
  (98,24),
  (147,80),
  (28,51),
  (3,18);
INSERT INTO `usuario_personaje` (`id_usuario`,`id_personaje`)
VALUES
  (19,60),
  (97,53),
  (122,29),
  (113,94),
  (50,66),
  (141,28),
  (32,38),
  (32,39),
  (55,30),
  (118,33);
INSERT INTO `usuario_personaje` (`id_usuario`,`id_personaje`)
VALUES
  (118,52),
  (71,88),
  (13,76),
  (68,79),
  (13,22),
  (75,38),
  (109,39),
  (38,60),
  (129,17),
  (25,62);
INSERT INTO `usuario_personaje` (`id_usuario`,`id_personaje`)
VALUES
  (24,106),
  (74,15),
  (74,104),
  (21,54),
  (24,51),
  (69,95),
  (39,63),
  (25,12),
  (141,60),
  (41,79);
INSERT INTO `usuario_personaje` (`id_usuario`,`id_personaje`)
VALUES
  (79,61),
  (56,85),
  (56,9),
  (13,51),
  (61,17),
  (79,93),
  (139,3),
  (41,5),
  (78,98),
  (105,34);
INSERT INTO `usuario_personaje` (`id_usuario`,`id_personaje`)
VALUES
  (116,103),
  (24,48),
  (128,31),
  (23,53),
  (89,60),
  (118,100),
  (56,2),
  (85,96),
  (124,73),
  (59,55);

