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


create table metodo_de_pago(
id int unsigned primary key auto_increment,
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
             indicaciones_del_usuario varchar(80),
         metodo varchar(20),
         codigo_del_paquete int unsigned,
         estado_del_trafico enum('libre', 'concurrido','atasco'),
         tiempo_estimado_de_entrega varchar(20),
		destino varchar(20),
         nombre varchar(20),
         nombre_del_repartidor varchar(20)
         );
         
         create table producto(
         id int unsigned primary key auto_increment,
         id_tienda int unsigned,
         id_compañia_de_envio int unsigned,
         id_personaje int unsigned,
         nombre varchar(20),
		nº_de_factura int unsigned not null,
		categoria varchar(30),
		precio double unsigned,
         tamanio float unsigned,
         peso float unsigned
         );
         
         create table color(
          id int unsigned primary key auto_increment,
          id_producto int unsigned,
          color varchar(20)
          );
         
         
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
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (1,"OYCFQFG533HSKD","DO85807506745150221564351468"),
  (2,"MWMVUYF876JSKS","AD8753677061711512343984"),
  (3,"ISVJNPK956RVTT","AZ71612052555625687467612740"),
  (4,"NXLGGRT198RNDB","TR636913923848741371162171"),
  (5,"UAMPJJU125PYBP","AE336269274871644163685"),
  (6,"LOKDHDN675DTAQ","CR7022253154762275036"),
  (7,"GNZDGEI685QLEM","FO2834715685642214"),
  (8,"BUTRXTW367USQG","SM7183223225956935777607761"),
  (9,"JHOBTYV025ELJH","SE0544084861331791586787"),
  (10,"BYSYHKB856QDGP","IL722522887925688551263");
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (11,"OWPJBSH523PFBE","GE08558952957675912796"),
  (12,"TMNDKYX773NXCY","AZ58134616737538276671435224"),
  (13,"FTIBMDY418LBSS","NO0487384116234"),
  (14,"HSDRFQQ433UKIJ","AL71421445573567647865741402"),
  (15,"JLXGEDI876NVLM","NL20UUEE1102438418"),
  (16,"HIDVGER722MVEY","CR7378888046204087372"),
  (17,"VZPRZWT518GJMX","LB92453881760733912586322351"),
  (18,"RNBREEV764RLQC","LU417972674193495433"),
  (19,"LDQAHXS417DLVX","LT091360827544254428"),
  (20,"RFJYGUB859PLFF","GL2509706828657617");
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (21,"VOQTWPV300YZCN","FO9660311728673993"),
  (22,"PUPQACM197EKVO","SK5774686663242816515832"),
  (23,"BALVBKQ757TGXE","FI8847598079099615"),
  (24,"IWBMCZT054HWRW","RS04515688938682168158"),
  (25,"TFCJSIJ924IMNQ","IL914841334635266642328"),
  (26,"OJQFQRE308YVRF","SI87117335409734162"),
  (27,"QLGCVPL560TVYK","RS16950831538028127564"),
  (28,"WDGPCNJ882YYCP","SM7314367318866147746734721"),
  (29,"TZUXGJY667BWDO","FO1836398153005120"),
  (30,"YBKIWKF844GJSJ","DO35560728198148239844310146");
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (31,"MOUCNWW505NJFN","HR3338435333226240672"),
  (32,"SHMPDZL277MTIK","LU421022284578135255"),
  (33,"NLCEEEO514KWKU","CZ1568688265170766522142"),
  (34,"OTYXQHF766KNDC","HU96804857142378267808645925"),
  (35,"VFHUCSX146CORV","MC9247584782199682157550284"),
  (36,"WFLUEOJ671WRIL","LB63279585488314651858705733"),
  (37,"DYCUTKT036NOUD","NL42ZZIJ3351725770"),
  (38,"GBYEQOC546XJBV","SM6687654811603714120281823"),
  (39,"WIOQBRF644CNSW","MK50421433821134124"),
  (40,"IFISSTZ597KYDV","PK5115631470613747125254");
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (41,"VDKNURI378JYYT","GT92763711751154336312522182"),
  (42,"FJUKBUB276FEBW","HR8267169841777992629"),
  (43,"RYSKRXX163KGTE","BH83215282680055452426"),
  (44,"CRVVKLA686XYUO","GI66JTBC458711786464452"),
  (45,"XLLEPGU326RDGE","CH4802711382416183685"),
  (46,"KBVNBKU154YHJM","IS857567790959807278262072"),
  (47,"NLGWQMC316BCVP","GT13892755777546824281234181"),
  (48,"YHNAUES648EAZV","MR8167767136685836699325205"),
  (49,"YNTWWHL677MZIH","BH26110532825486427558"),
  (50,"TPHHYQN535MBFC","LB97378512799785729857413423");
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (51,"QENQGHG718HIPJ","ME92334242237257509374"),
  (52,"YTSFYSF156ODPL","NO7423478167671"),
  (53,"MTFCGDJ870ZRSW","HU59731117913943731371786410"),
  (54,"EENQVES835RONQ","VG7163165584410461263638"),
  (55,"EMWAVZM316VZGV","IL354172619434363665055"),
  (56,"UEUXSVF707RFCA","CR2915609874742787540"),
  (57,"KXDUGDK327SRDF","BH02772262246795817639"),
  (58,"YFTTSRX806HFEJ","GT60782869963660222711475593"),
  (59,"RGHYHZK557AHJC","AD1656125664882290556175"),
  (60,"VJDZROF368XQGB","RO75LMKR1405516218732007");
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (61,"HJGILAU138ZFWF","LT264112138386821856"),
  (62,"EOOJVTT915PGCX","IE82BLUI65751756778947"),
  (63,"EZKYNTX386RREI","SK7310455651578396581427"),
  (64,"NARRKMK387TYJD","LV43CMAK4763045577285"),
  (65,"SYFWYIH272QNRH","GE21627225740530173146"),
  (66,"NWBRHUP092ANBM","ME73050817699857768261"),
  (67,"UIIISNN541UKKQ","SK8667149293324202983183"),
  (68,"TLFZRBF480HJTV","TN3171693332698586145466"),
  (69,"LGGJSQT540QTCU","LT043065276884146327"),
  (70,"HKMJECQ438HIVM","AL50238471789163711861511122");
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (71,"TOIKSIL642PYNN","AL84548392214372583432710892"),
  (72,"DTVEVYQ348IIEV","MU2875314912395548635940688383"),
  (73,"NHKSHLN867IIEL","SE6862313882158457466443"),
  (74,"WCWQCKZ178UFIJ","RS06242156811346136007"),
  (75,"PXZSOJM371OKST","IT021NHCDI55124235639639274"),
  (76,"WLSHEUB575JTLN","LV09CWPX5358476902807"),
  (77,"GJUJHHS125SHSF","LI6188092856284275522"),
  (78,"QOFOPDR282YNBF","PS357298617659447385226622173"),
  (79,"UACLWST566RWAR","AE327079250331573832774"),
  (80,"KPTDRLR833YFAM","LV16DONR8969836382266");
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (81,"SNOPQCG747MRLF","AZ16142285120663267767952673"),
  (82,"GFXMBLT698CBPE","BH75309145100527943674"),
  (83,"CLDLUDO428QFVI","FO3537267247684613"),
  (84,"GLRZEWK314HQXP","AZ55808943927269481127136875"),
  (85,"LOXQVRW195WOQE","BE72368927462267"),
  (86,"RVQPTSB613TOAS","BE92484266385018"),
  (87,"DSXMVNU816SEJS","BH86181313019453381824"),
  (88,"NLHLMYK888PHZW","GI81OTYM874914217587713"),
  (89,"SAKOTKT435ACOL","SA6988783137191295287545"),
  (90,"PLWNRIQ214MVEG","PK7144761335007172154686");
INSERT INTO `metodo_de_pago` (`id`,`factura`,`numero_de_cuenta_bancaria`)
VALUES
  (91,"ZRHUYGX016INOG","SK6029578457736823437448"),
  (92,"XDCILFO533YMNU","GT68921627997848720467497627"),
  (93,"SBPOPCP107JHDT","ES0324404418336391274427"),
  (94,"ULIHLRT308XFTS","MC6852484038485277177183886"),
  (95,"KJWCSGX668QMHX","AT287786718693451552"),
  (96,"KFXHSAG243HRID","IT135FTMAI90255456221238033"),
  (97,"QJECOXX463GHHR","GE03510787387578266586"),
  (98,"KYDQQWJ754FLYW","DK4824960346228557"),
  (99,"BIOCMVM161FXPS","TN6137593792266145763655"),
  (100,"ZPDQLEL990IFAD","MU6836778630670045587237504638");
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
  (1,1,"36340713457","2024-12-25"),
  (2,2,"21276580681","2022-06-12"),
  (3,3,"12467482366","2018-11-21"),
  (4,4,"11356734789","2024-04-25"),
  (5,5,"08912249025","2018-07-11"),
  (6,6,"45927446071","2023-03-17"),
  (7,7,"53821031695","2023-09-14"),
  (8,8,"54773131280","2019-10-14"),
  (9,9,"36001203628","2023-07-10"),
  (10,10,"89282513945","2024-12-14");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (11,11,"48233319697","2018-09-07"),
  (12,12,"15971461044","2024-09-30"),
  (13,13,"81851379861","2022-10-14"),
  (14,14,"88922539546","2019-02-28"),
  (15,15,"12115148854","2023-12-09"),
  (16,16,"23774299422","2022-09-21"),
  (17,17,"68766191159","2018-11-03"),
  (18,18,"33349222267","2022-05-27"),
  (19,19,"98773370184","2021-01-14"),
  (20,20,"86445531686","2018-10-12");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (21,21,"26024554758","2022-04-06"),
  (22,22,"36872653912","2020-09-01"),
  (23,23,"30452951442","2019-10-02"),
  (24,24,"40555669253","2024-08-23"),
  (25,25,"43376483886","2023-04-07"),
  (26,26,"03167946819","2019-06-25"),
  (27,27,"23538583175","2020-12-28"),
  (28,28,"51643802733","2019-10-10"),
  (29,29,"86633326514","2024-09-18"),
  (30,30,"81313546274","2022-03-18");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (31,31,"07315703152","2022-02-21"),
  (32,32,"07436886044","2024-10-24"),
  (33,33,"71763553465","2023-08-05"),
  (34,34,"58897490525","2023-05-15"),
  (35,35,"71488382886","2023-03-11"),
  (36,36,"53425242455","2019-09-11"),
  (37,37,"29502534854","2018-07-18"),
  (38,38,"71870106673","2024-06-29"),
  (39,39,"73133248054","2021-02-19"),
  (40,40,"81761757380","2020-12-19");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (41,41,"20555643213","2021-01-26"),
  (42,42,"55409787554","2021-03-08"),
  (43,43,"86615722251","2025-01-01"),
  (44,44,"58568547768","2023-08-20"),
  (45,45,"39412233913","2021-09-27"),
  (46,46,"14643913646","2021-10-27"),
  (47,47,"47502877376","2021-04-09"),
  (48,48,"53310781187","2025-01-10"),
  (49,49,"23277845721","2019-06-12"),
  (50,50,"46845513314","2021-06-12");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (51,51,"48036237182","2018-01-25"),
  (52,52,"83346485774","2022-10-10"),
  (53,53,"56743854341","2022-01-15"),
  (54,54,"32510459361","2019-02-16"),
  (55,55,"53725863747","2019-01-03"),
  (56,56,"33672043045","2022-03-03"),
  (57,57,"93132983902","2023-12-20"),
  (58,58,"52845494035","2020-04-06"),
  (59,59,"69264012328","2022-11-06"),
  (60,60,"77764402464","2018-06-17");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (61,61,"21763218816","2023-08-12"),
  (62,62,"86065313251","2019-06-23"),
  (63,63,"49835816232","2024-06-03"),
  (64,64,"31838264241","2020-03-22"),
  (65,65,"25766325739","2020-08-18"),
  (66,66,"33405181641","2021-05-26"),
  (67,67,"47240245765","2022-02-12"),
  (68,68,"35162148766","2022-08-20"),
  (69,69,"81154318364","2020-12-28"),
  (70,70,"45652423653","2022-10-27");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (71,71,"75907674982","2020-01-10"),
  (72,72,"24970484464","2019-05-15"),
  (73,73,"76408938478","2019-03-19"),
  (74,74,"57756862505","2021-05-30"),
  (75,75,"28112386813","2024-08-31"),
  (76,76,"45644941795","2024-05-26"),
  (77,77,"37596147810","2020-10-14"),
  (78,78,"67231222522","2024-06-16"),
  (79,79,"02442285058","2025-01-01"),
  (80,80,"56284616148","2023-04-15");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (81,81,"55281176244","2018-12-08"),
  (82,82,"75422221776","2022-01-30"),
  (83,83,"59611565471","2022-06-29"),
  (84,84,"55616386228","2020-01-04"),
  (85,85,"04432297477","2022-08-07"),
  (86,86,"42523815376","2023-08-14"),
  (87,87,"78244368454","2022-09-26"),
  (88,88,"56829314187","2022-12-11"),
  (89,89,"51403016574","2020-09-01"),
  (90,90,"32387317183","2023-01-18");
INSERT INTO `tarjeta` (`id`,`id_metodo_de_pago`,`numero_asociado`,`fecha_de_expiracion`)
VALUES
  (91,91,"83618974452","2021-05-29"),
  (92,92,"97784157687","2019-10-20"),
  (93,93,"37108123515","2024-11-19"),
  (94,94,"66977163855","2023-01-15"),
  (95,95,"91745615713","2024-08-21"),
  (96,96,"11736470936","2021-04-24"),
  (97,97,"57689615737","2019-07-17"),
  (98,98,"96822781064","2021-02-13"),
  (99,99,"43169484365","2021-04-21"),
  (100,100,"42783298326","2019-05-17");
INSERT INTO `transferencia` (`id`,`id_metodo_de_pago`,`tiempo_que_tarda`)
VALUES
  (1,1,6),
  (2,2,5),
  (3,3,4),
  (4,4,5),
  (5,5,1),
  (6,6,3),
  (7,7,4),
  (8,8,7),
  (9,9,2),
  (10,10,4);
INSERT INTO `transferencia` (`id`,`id_metodo_de_pago`,`tiempo_que_tarda`)
VALUES
  (11,11,3),
  (12,12,3),
  (13,13,1),
  (14,14,4),
  (15,15,0),
  (16,16,2),
  (17,17,5),
  (18,18,6),
  (19,19,6),
  (20,20,1);
INSERT INTO `transferencia` (`id`,`id_metodo_de_pago`,`tiempo_que_tarda`)
VALUES
  (21,21,7),
  (22,22,7),
  (23,23,6),
  (24,24,6),
  (25,25,1),
  (26,26,4),
  (27,27,1),
  (28,28,6),
  (29,29,5),
  (30,30,1);
INSERT INTO `transferencia` (`id`,`id_metodo_de_pago`,`tiempo_que_tarda`)
VALUES
  (31,31,3),
  (32,32,5),
  (33,33,6),
  (34,34,7),
  (35,35,4),
  (36,36,5),
  (37,37,1),
  (38,38,5),
  (39,39,7),
  (40,40,4);
INSERT INTO `transferencia` (`id`,`id_metodo_de_pago`,`tiempo_que_tarda`)
VALUES
  (41,41,1),
  (42,42,2),
  (43,43,6),
  (44,44,6),
  (45,45,1),
  (46,46,3),
  (47,47,6),
  (48,48,3),
  (49,49,4),
  (50,50,3);
INSERT INTO `bizum` (`id`,`id_metodo_de_pago`,`numero_de_telefono`)
VALUES
  (1,1,"844647732"),
  (2,2,"919855194"),
  (3,3,"426758813"),
  (4,4,"331607688"),
  (5,5,"716834174"),
  (6,6,"702769126"),
  (7,7,"662051670"),
  (8,8,"762034496"),
  (9,9,"721044273"),
  (10,10,"648016318");
INSERT INTO `bizum` (`id`,`id_metodo_de_pago`,`numero_de_telefono`)
VALUES
  (11,11,"163038687"),
  (12,12,"833882561"),
  (13,13,"588206705"),
  (14,14,"681355473"),
  (15,15,"087996333"),
  (16,16,"524788498"),
  (17,17,"447791125"),
  (18,18,"163257681"),
  (19,19,"453297858"),
  (20,20,"216365371");
INSERT INTO `bizum` (`id`,`id_metodo_de_pago`,`numero_de_telefono`)
VALUES
  (21,21,"823126684"),
  (22,22,"268135636"),
  (23,23,"225710138"),
  (24,24,"275989445"),
  (25,25,"537273157"),
  (26,26,"179749554"),
  (27,27,"117156467"),
  (28,28,"411766806"),
  (29,29,"782377651"),
  (30,30,"428081646");
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
  (106,107,"2017-02-10 07:24:33","Hentai"),
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
