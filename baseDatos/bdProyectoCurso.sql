CREATE DATABASE proyecto_curso;
use proyecto_curso;

    CREATE TABLE Cliente
    (
        id_cliente INTEGER AUTO_INCREMENT NOT NULL,
        doc_identidad VARCHAR(15) NOT NULL,
        nombres VARCHAR(40),
        apellidos VARCHAR(40) NOT NULL,
        correo VARCHAR(50),
        CONSTRAINT pky_cliente PRIMARY KEY (id_cliente)
    );

    INSERT INTO Cliente (doc_identidad, nombres, apellidos, correo) VALUES ('1004826', 'carlos', 'muñoz', ''),
    ('1084164', 'eduardo', 'zuñiga', ''),
    ('1176483', 'valentina', 'ceron', 'valentinaceronm@correo.com'),
    ('1049114', 'manuela', 'monje', ''),
    ('1176625', 'juliana', 'campo', ''),
    ('1009691', 'nathalia', 'echeverri', ''),
    ('1021987', 'margarita', 'torres', 'torresm@hotmail.com'),
    ('1160701', 'andrea', 'burbano', ''),
    ('1136445', 'camilo', 'lopez', 'camilo@correo.com'),
    ('1051585', 'isabella', 'martinez', ''),
    ('1021955', 'pedro', 'sanchez', ''),
    ('1001971', 'oscar', 'diaz', 'oscar@correo.com'),
    ('1168403', 'maria', 'ruiz', ''),
    ('1107639', 'camila', 'moreno', 'camila@correo.com'),
    ('1097773', 'fernanda', 'gomez', ''),
    ('1053898', 'victoria', 'bonilla', ''),
    ('1123913', 'lucas', 'fernandez', 'lucas@correo.com'),
    ('1086048', 'luz', 'carval', 'helenb@gmail.com'),
    ('1014901', 'macarena', 'guirrez', ''),
    ('1043621', 'sebastian', 'reyes', 'sebastian@correo.com'),
    ('1186554', 'juan', 'orozco', ''),
    ('1007557', 'pablo', 'zuluaga', 'pablo@correo.com'),
    ('1051829', 'marco', 'ramirez', ''),
    ('1026686', 'jaime', 'medina', 'jmedina@hotmail.es'),
    ('1073871', 'gloria', 'mosquera', '');

    CREATE TABLE Cuadrilla_Int
    (
      id_cuadrilla_int INTEGER AUTO_INCREMENT NOT NULL,
      nombre VARCHAR(40) NOT NULL,
      actividad VARCHAR(50) NOT NULL,
      CONSTRAINT pky_cuadrilla_int PRIMARY KEY (id_cuadrilla_int)
    );

    INSERT INTO Cuadrilla_Int(nombre, actividad)
    VALUES ('director1', 'maestro'),
    ('concretos1', 'concreto'),
    ('yeseros1', 'yeso'),
    ('ayudantes', 'peones'),
    ('electricista1', 'electricidad'),
    ('herrero1', 'herreria'),
    ('plomeros', 'plomeria'),
    ('pisos1', 'azulejero'),
    ('pintores1', 'pintura'),
    ('plomeria2', 'plomeria'),
    ('pisos3', 'azulejero'),
    ('pintores3', 'pintura'),
    ('carpinteros', 'carpinteria'),
    ('ayudantes2', 'peones'),
    ('electricista2', 'electricidad'),
    ('herrero2', 'herreria'),
    ('plomeros3', 'plomeria'),
    ('herrero3', 'herreria'),
    ('plomeros3', 'plomeria'),
    ('pisos4', 'azulejero'),
    ('pintores2', 'pintura'),
    ('yeseros2', 'yeso'),
    ('director2', 'maestro'),
    ('carpinteros2', 'carpinteria'),
    ('electricista3', 'electricidad');

    CREATE TABLE Cuadrilla_Ext
    (
      id_cuadrilla_ext INTEGER AUTO_INCREMENT NOT NULL,
      nombre  VARCHAR(40) NOT NULL,
      actividad VARCHAR(50) NOT NULL,
      numero_personas SMALLINT NOT NULL,
      correo VARCHAR(50),
      CONSTRAINT pky_cuadrilla_ext PRIMARY KEY (id_cuadrilla_ext),
      CONSTRAINT dom_num_personas CHECK( numero_personas > 0)
    );

     INSERT INTO Cuadrilla_Ext(nombre,actividad,numero_personas,correo) VALUES('maestros_ext1','maestro',191,'maestros@correo.com'),
     ('concretos_ext1','concreto',250,''),
     ('yeseros_ext1','yeso',232,'yeseros@correo.com'),
     ('peones_ext1','peones',93,''),
     ('electricistas_ext1','electricidad',135,''),
     ('herrerros_ext1','herria',200,''),
     ('plomeros_ext1','plomeria',135,'plomeros@correo.com'),
     ('pisos_ext1','azulejo',45,''),
     ('pintores_ext1','pintura',93,''),
     ('plomeros_ext2','plomeria',173,''),
     ('pisos_ext2','azulejos',81,'azulejos@correo.com'),
     ('pintores_ext2','pintura',85,''),
     ('carpinteros_ext1','carpinteria',255,''),
     ('ayudantes_ext1','peones',90,'peones@correo.com'),
     ('electricista_ext2','electricidad',122,''),
     ('herreros_ext2','herreria',74,'herreros@correo.com'),
     ('plomeros_ext3','plomeria',112,''),
     ('herreros_ext2','herreria',36,''),
     ('plomeros_ext4','plomeria',223,''),
     ('pisos_ext3','azulejos',194,''),
     ('pintores_ext3','pintura',91,'pintores@correo.com'),
     ('yeseros_ext2','yeso',181,''),
     ('maestros_ext2','maestro',85,''),
     ('carpinteros_ext2','carpinteria',202,'carpinteros@correo.com'),
     ('electricistas_ext3','electricidad',220,'');

    CREATE TABLE Solado
    (
        id_solado INTEGER AUTO_INCREMENT NOT NULL,
        metros_cuadrados SMALLINT NOT NULL,
        metros_cubicos_hormigon TINYINT UNSIGNED NOT NULL,
        tipo_baldosa VARCHAR(40) NOT NULL,
        CONSTRAINT pky_solado PRIMARY KEY (id_solado),
        CONSTRAINT dom_metros_cuadrados CHECK (metros_cuadrados >=0 and metros_cuadrados <=5100),
        CONSTRAINT dom_metros_cubicos CHECK (metros_cubicos_hormigon >= 0)
    );

    INSERT INTO Solado(metros_cuadrados, metros_cubicos_hormigon, tipo_baldosa)
    VALUES (3020, 151, 'barro cocido'),
    (988, 49, 'baldosin catalan'),
    (4641, 232, 'azulejo'),
    (4503, 225, 'gres rustico'),
    (4982, 249, 'gres esmaltado'),
    (1327, 66, 'gres porcelanato'),
    (4209, 210, 'azulejo'),
    (3481, 174, 'baldosin catalan'),
    (4494, 225, 'barro cocido'),
    (3926, 196, 'barro cocido'),
    (173, 9, 'azulejo'),
    (281, 14, 'gres esmeraldado'),
    (3091, 155, 'baldosin catalan'),
    (2913, 146, 'azulejo'),
    (2132, 107, 'gres esmeraldado'),
    (4984, 249, 'baldosin catalan'),
    (3745, 187, 'barro cocido'),
    (805, 40, 'gres esmeraldado'),
    (1166, 58, 'baldosin catalan'),
    (2687, 134, 'gres rustico'),
    (1004, 50, 'barro cocido'),
    (4247, 212, 'azulejo'),
    (1537, 77, 'gres esmeraldado'),
    (1543, 77, 'gres rustico'),
    (4647, 232, 'balbosin catalan');

    CREATE TABLE Cerramiento
    (
        id_cerramiento INTEGER AUTO_INCREMENT NOT NULL,
        cubierta ENUM('cristal', 'uralita', 'policarbonato') NOT NULL,
        calidad_empleada ENUM('aluminio', 'hierro') NOT NULL,
        CONSTRAINT pky_cerramiento PRIMARY KEY (id_cerramiento)
    );

    INSERT INTO Cerramiento(cubierta,calidad_empleada) VALUES ('cristal','aluminio'),
    ('uralita','hierro'),
    ('policarbonato','aluminio'),
    ('cristal','hierro'),
    ('uralita','hierro'),
    ('uralita','aluminio'),
    ('policarbonato','hierro'),
    ('cristal','aluminio'),
    ('uralita','hierro'),
    ('policarbonato','hierro'),
    ('cristal','hierro'),
    ('uralita','aluminio'),
    ('uralita','hierro'),
    ('policarbonato','hierro'),
    ('uralita','aluminio'),
    ('uralita','hierro'),
    ('policarbonato','aluminio'),
    ('cristal','hierro'),
    ('uralita','hierro'),
    ('policarbonato','aluminio'),
    ('cristal','hierro'),
    ('uralita','hierro'),
    ('policarbonato','aluminio'),
    ('cristal','hierro'),
    ('uralita','aluminio');
  
 
     CREATE TABLE Buhardilla
     (
        id_buhardilla INTEGER AUTO_INCREMENT NOT NULL,
        tipo_escalera ENUM('recta', '1/4 de giro', 'paso japones','caracol','escamoteables') NOT NULL,
        numero_ventanas TINYINT NOT NULL,
        CONSTRAINT pky_buhardilla PRIMARY KEY (id_buhardilla),
        CONSTRAINT dom_num_ventanas CHECK (numero_ventanas >=0)
     );

     INSERT INTO Buhardilla(tipo_escalera,numero_ventanas) VALUES ('recta',26),
     ('1/4 de giro',26),
     ('paso japones',18),
     ('caracol',8),
     ('escamoteables',3),
     ('recta',12),
     ('1/4 de giro',0),
     ('paso japones',30),
     ('caracol',14),
     ('escamoteables',7),
     ('1/4 de giro',3),
     ('paso japones',0),
     ('caracol',14),
     ('escamoteables',14),
     ('recta',19),
     ('1/4 de giro',24),
     ('recta',0),
     ('1/4 de giro',27),
     ('paso japones',18),
     ('caracol',3),
     ('escamoteables',6),
     ('1/4 de giro',4),
     ('paso japones',10),
     ('caracol',4),
     ('recta',0);

     CREATE TABLE Material
     (
         id_material INTEGER AUTO_INCREMENT NOT NULL,
         nombre VARCHAR(40) NOT NULL,
         descripcion TEXT ,
         precio_unitario DECIMAL(9,2),
         cantidad TINYINT UNSIGNED NOT NULL,
         CONSTRAINT pky_material PRIMARY KEY (id_material),
         CONSTRAINT dom_precio_unitario CHECK (precio_unitario >= 0),
         CONSTRAINT dom_cantidad CHECK (cantidad >= 0)
     );

     INSERT INTO Material (nombre, descripcion, precio_unitario, cantidad) VALUES ('ladrillo', '', 5400, 1),
     ('madera', '', 50000, 169),
     ('paneles', '', 100000, 51),
     ('ceramica', 'texturizada', 200000, 152),
     ('concreto', '', 300000, 39),
     ('piedra', 'natural', 150000, 139),
     ('vinil', 'decorativo', 300000, 22),
     ('aluminio', '', 80000, 18),
     ('hierro', '', 90000, 141),
     ('policarbonato', '', 126480, 151),
     ('uralita', '', 135546, 206),
     ('espejos', '', 150000, 248),
     ('accesorios', '', 130000, 114),
     ('tragaluz', '', 42000, 207),
     ('bombillos', '', 39000, 214),
     ('microcemento', '', 55000, 38),
     ('metal', '', 132000, 12),
     ('laminas metalicas', '', 123000, 86),
     ('cristal', '', 115000, 153),
     ('repisas', '', 34000, 231),
     ('techo de zinc', '', 168000, 194),
     ('bambu', '', 142000, 75),
     ('lamparas', '', 94000, 223),
     ('vidrio', '', 72850, 68),
     ('pintura', '', 48500, 158);

     CREATE TABLE Albanil
     (
         id_albanil INTEGER AUTO_INCREMENT NOT NULL,
         cuadrilla_int INTEGER NOT NULL,
         doc_identidad VARCHAR(15) NOT NULL,
         nombres VARCHAR(40) NOT NULL,
         apellidos VARCHAR(40) NOT NULL,
         fec_nacimiento DATE NOT NULL,
         lugar_nacimiento VARCHAR(40),
         salario DECIMAL(9,2) NOT NULL,
         categoria VARCHAR(40) NOT NULL,
		 fec_inicio_contrato DATE NOT NULL,
		 fec_fin_contrato DATE,
		 cesantias decimal(9,2),
		 int_cesantias decimal(9,2),
		 vacaciones decimal(9,2),
		 prima_servicios decimal(9,2)
         CONSTRAINT pky_albanil PRIMARY KEY (id_albanil),
         CONSTRAINT fky_cuadrilla_int_albanil FOREIGN KEY (cuadrilla_int) REFERENCES Cuadrilla_Int (id_cuadrilla_int) ON DELETE CASCADE ON UPDATE CASCADE,
         CONSTRAINT dom_salario_albanil CHECK (salario >= 980657 AND salario <= 2000000)
     );

     INSERT INTO Albanil(cuadrilla_int,doc_identidad,nombres,apellidos,fec_nacimiento,lugar_nacimiento,salario, categoria, fec_inicio_contrato, fec_fin_contrato) VALUES
      (23,'1310929','maria','perez','1984-09-27','popayan',1290202,'maestro', '1998-11-01', NULL),
      (2,'1254837','felipe','lopez','1980-05-26','putumayo',1971638,'concreto', '2000-02-15', NULL),
      (3,'1341914','andres','suarez','1983-10-19','arauca',1597505,'yeso', '1999-03-17', NULL),
      (14,'1355767','andrea','muñoz','1985-08-9','pitalito',1388257,'peones', '1998-05-02', NULL),
      (25,'1370395','carlos','gomez','1984-11-11','caracas',1338307,'electricidad', '2002-01-22', NULL),
      (18,'1354434','samnuel','vivas','1990-10-21','chia',1669134,'herreria', '2004-06-23', NULL),
      (10,'1268613','hilda','moreno','1985-05-18','piendamo',1144875,'plomeria', '2005-05-10', NULL),
      (8,'1201575','mayra','torres','1984-10-14','silvia',1267620,'azulejo', '2002-03-30', NULL),
      (12,'1336455','camila','sanchez','1980-09-9','casanare', 1015004, 'pintura', '2004-01-15', NULL),
      (19,'1257645','alejandra','reyes','1985-07-4','envigado', 1097974, 'plomeria', '2007-08-22', NULL),
      (20,'1204076','sandra','henrriquez','1987-05-16','la ceja', 1704189, 'azulejero', '2005-04-27', NULL),
      (9,'1231658','carolina','arbelaez','1988-07-22','jerico', 1312485, 'pintura', '2003-06-16', NULL),
      (13,'1214713','dolores','restrepo','1984-10-10','zipaquira', 1168210, 'carpinteria', '2006-07-07', NULL),
      (4,'1355155','eduardo','zuñiga','1982-11-19','rio negro', 1903568, 'peones', '2007-09-22', NULL),
      (5,'1279156','rodolfo','ante','1990-11-10','itagui', 1099479, 'electricidad', '2008-04-30', NULL),
      (18,'1335459','aurora','pardo','1985-05-26','paipa', 1263221, 'herreria', '2005-10-10', NULL),
      (17,'1331313','mateo','vazquez', '1984-11-12', 'sopo', 1288936, 'plomeria', '2006-12-15', NULL),
      (6,'1340692','ignacio','gil', '1982-12-10', 'suesca', 1756534, 'herreria', '2002-08-19', NULL),
      (17,'1256591','oscar','gomez', '1985-06-13', 'la calera', 1677889, 'plomeria', '2008-05-22', NULL),
      (20,'1260845','jaime','gallardo', '1985-01-31', 'bichara', 1436581, 'azulejero', '2007-11-02', NULL),
      (9,'1377232','pedro','melendez', '1991-06-07', 'san gil', 1373078, 'pintura', '2002-12-10', NULL),
      (3,'1376863','angel','martinez', '1984-12-29', 'san juan de giron', 1697148, 'yeso', '2003-08-14', NULL),
      (1,'1330236','rosa','marino', '1980-11-05', 'las gachas', 1870302, 'maestro', '2004-05-12', NULL),
      (24,'1287755','antonio','ceron', '1985-01-03', 'monteria', 1271087, 'carpinteria', '2007-02-20', NULL),
      (15, '1386135', 'tomas', 'monje', '1981-09-08', 'timbio', 1114419, 'electricidad', '2001-03-01', NULL);

     CREATE TABLE Lugar_Reforma
     ( 
       id_reforma INTEGER AUTO_INCREMENT NOT NULL,
       cliente INTEGER NOT NULL,
       cuidad VARCHAR(40) NOT NULL,
       direccion VARCHAR(50) NOT NULL,
       barrio VARCHAR (40),
       CONSTRAINT pky_reforma PRIMARY KEY (id_reforma),
       CONSTRAINT fky_cliente_reforma FOREIGN KEY (cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
     );
     
     INSERT INTO Lugar_Reforma(cliente,cuidad,direccion,barrio)
      VALUES(2,'popayan','Calle 8 # 5-43','calatraba'),
      (2,'Popayan','Calle 10 # 45-N18','Monte Mayor'),
      (17,'Popayan','Carrera 6D # 47-16','Alicante'),
      (15,'Bogota','Carrera 8 con 95 ','La cabrera '),
      (2,'Medellin','Calle 12 Sur ','Santa María de los Ángeles'),
      (4,'Bogota','Carrera 15 #95-34 ','Chico Norte '),
      (22,'Cartagena',' Avd. San Martin No. 7-159 ','Bocagrande'),
      (1,'Medellin','Calle 75 # 75-29 ','Robledo'),
      (1,'Medellin','Cra. 76 No. 35 - 20 ','Laureles'),
      (13,'Cartagena','Av. Pedregal 29-291','Getsemaní'),
      (4,'Bogota','Carrera 4 No. 72-22','Los rosales'),
      (18,'Medellin','Calle 12 sur Av el poblado',' Patio Bonito'),
      (21,'Medellin','Cra. 25a ##1a Sur 45 ','El Tesoro'),
      (25,'Medellin',' Calle 30A No. 77-60 ','Belén'),
      (3,' Bogota ','Carrera 18 Nº 84-61 ','Antiguo Country '),
      (6,'Bucaramanga','Calle 20 #31-79 ','San Alonso '),
      (7,'Cali','Cr 10oe # 1-150 ','San Antonio '),
      (18,' Medellin ','Calle 44 A No. 79-86 ','La América' ),
      (20,'Cali','Av. 3N 52 N -33 ','La Flora'),
      (3,'Medellin','Calle 49 # 33-23','Buenos Aires '),
      (9,'Bucaramanga','Cra. 29 No. 41 - 37 ','Sotomayor'),
      (24,'Medellin','Cr 49 50-41','Candelaria'),
      (19,'Cali','‎Calle 9 20 39 ','Santa Rita '),
      (23,'Medellin','Calle 87 # 52B - 46. 2','Aranjuez'),
      (9,'Bucaramanga','Calle 37 24-82','Antonia Santos');

     CREATE TABLE Cuadrilla_Int_Reforma
     (
       id_cuadrilla_int_reforma INTEGER AUTO_INCREMENT NOT NULL,
       cuadrilla_int INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       nom_comp_poliza VARCHAR(40) NOT NULL,
       cobertura VARCHAR(20) NOT NULL,
       fec_inicio DATE NOT NULL,
       fec_fin DATE,
       CONSTRAINT pky_cuadrilla_int_reforma PRIMARY KEY (id_cuadrilla_int_reforma),
       CONSTRAINT fky_cuadrilla_int_reforma FOREIGN KEY (cuadrilla_int) REFERENCES Cuadrilla_int(id_cuadrilla_int) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_cuadrilla_int FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT dom_fec_fin_int CHECK (fec_fin>fec_inicio)
     );

     INSERT INTO Cuadrilla_Int_Reforma (cuadrilla_int, reforma, nom_comp_poliza, cobertura, fec_inicio, fec_fin) VALUES (22, 5, 'Seguros Mapre', 'todo riesgo', '2015-08-21', '2019-03-16'),
     (1, 5, 'grupo sancor', 'todo riesgo', '2020-04-11',NULL),
     (9, 5, 'sura', 'todo riesgo', '2014-12-14', '2018-10-04'),
     (14, 5, 'sura', 'todo riesgo', '2014-09-26', '2018-12-18'),
     (5, 5, 'seguros bolivar', 'todo riesgo', '2015-02-22', '2018-10-8'),
     (23, 3, 'fasecolda', 'todo riesgo', '2015-09-20', '2018-06-03'),
     (2, 3, 'seguros equidad', 'todo riesgo', '2019-12-26', NULL),
     (16, 3, 'Allianz', 'todo riesgo', '2015-07-01', '2018-05-31'),
     (21, 8, 'Allianz', 'todo riesgo', '2015-02-12', '2018-09-26'),
     (1, 8, 'seguros mapfre', 'todo riesgo', '2015-07-18', '2018-07-29'),
     (4, 8, 'liberty', 'todo riesgo', '2015-02-26', '2018-06-11'),
     (7, 8, 'sura', 'todo riesgo', '2015-02-19', '2018-05-14'),
     (24, 20, 'grupo sancor', 'todo riesgo', '2019-10-21', NULL),
     (8, 20, 'berkely international', 'todo riesgo', '2015-04-24', '2019-04-17'),
     (25, 13, 'liberty', 'todo riesgo', '2015-08-12', '2018-12-17'),
     (19, 13, 'seguros mapfre', 'todo riesgo', '2015-06-22', '2018-06-04'),
     (20, 7, 'chubb', 'todo riesgo', '2015-05-17', '2019-02-17'),
     (4, 7, 'seguros bolivar', 'todo riesgo', '2014-11-15', '2019-01-14'),
     (2, 17, 'fase colda', 'todo riesgo', '2015-04-04', '2018-05-17'),
     (17, 17, 'seguros equidad', 'todo riesgo', '2018-01-19', NULL),
     (14, 17, 'seguro mapfre', 'todo riesgo', '2015-09-19', '2018-11-23'),
     (11, 12, 'sura', 'todo riesgo', '2015-08-20', '2018-07-11'),
     (10, 12, 'grupo sancor', 'todo riesgo', '2014-11-20', '2018-06-28'),
     (23, 12, 'sura', 'todo riesgo', '2015-02-04', '2019-02-12'),
     (20, 5, 'liberty', 'todo riesgo', '2015-06-16', '2018-12-31');

     CREATE TABLE Cuadrilla_Ext_Reforma
     (
       id_cuadrilla_ext_reforma INTEGER AUTO_INCREMENT NOT NULL,
       cuadrilla_ext INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       nom_comp_poliza VARCHAR(40) NOT NULL,
       cobertura VARCHAR(20) NOT NULL,
       fec_inicio DATE NOT NULL,
       fec_fin DATE,
       CONSTRAINT pky_cuadrilla_ext_reforma PRIMARY KEY (id_cuadrilla_ext_reforma),
       CONSTRAINT fky_cuadrilla_ext_reforma FOREIGN KEY (cuadrilla_ext) REFERENCES Cuadrilla_Ext(id_cuadrilla_ext) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_cuadrilla_ext FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT dom_fec_fin_ext CHECK (fec_fin>fec_inicio)
     );

     INSERT INTO Cuadrilla_Ext_Reforma(cuadrilla_ext,reforma,nom_comp_poliza,cobertura,fec_inicio,fec_fin) VALUES (1,5,'seguros mapfre','todo riesgo','2015-08-21','2019-03-16'),
     (5,5,'chubb', 'todo riesgo','2020-04-11',NULL),
     (7,5,'seguros bolivar','todo riesgo','2014-12-14', '2018-10-04'),
     (8,5,'fasecolda','todo riesgo','2015-06-16','2018-12-31'),
     (13,5,'chubb','todo riesgo','2014-09-26','2018-12-18'),
     (3,5,'seguros bolivar','todo riesgo','2015-02-22','2018-10-8'),
     (9,3,'fasecolda','todo riesgo','2015-09-20','2018-06-03'),
     (11,3,'seguros equidad','todo riesgo','2014-12-26',NULL),
     (13,3,'allianz','todo riesgo','2015-07-01','2018-05-31'),
     (1,8,'berkely internacional','todo riesgo','2015-02-12','2018-09-26'),
     (17,8,'grupo sancor','todo riesgo','2015-07-18','2018-07-29'),
     (22,8,'sura','todo riesgo','2015-02-26','2018-06-11'),
     (18,8,'liberty','todo riesgo','2015-02-19','2018-05-14'),
     (4,20,'chubb','todo riesgo','2014-10-21','2018-10-17'),
     (11,20,'seguros bolivar','todo riesgo','2019-04-24',NULL),
     (13,13,'fasecolda','todo riesgo','2015-08-12','2018-12-17'),
     (21,13,'seguros equidad','todo riesgo','2015-06-20','2018-06-04'),
     (25,7,'alianz','todo riesgo','2015-05-17','2019-02-17'),
     (24,7,'berkely internacional','todo riesgo','2014-11-15','2019-01-14'),
     (1,17,'seguros mapfre','todo riesgo','2015-04-04','2018-05-17'),
     (4,17,'liberty','todo riesgo','2015-01-19','2019-04-09'),
     (19,17,'sura','todo riesgo','2015-09-19','2018-11-23'),
     (18,12,'seguros bolivar','todo riesgo','2015-08-20','2018-07-11'),
     (23,12,'fasecolda','todo riesgo','2014-11-20','2018-06-28'),
     (10,12,'seguros bolivar','todo riesgo','2015-02-04', NULL);

     CREATE TABLE Material_Buhardilla
     (
       id_material_buhardilla INTEGER AUTO_INCREMENT NOT NULL,
       material INTEGER NOT NULL,
       buhardilla INTEGER NOT NULL,
       CONSTRAINT pky_id_material_buhardilla PRIMARY KEY (id_material_buhardilla),
       CONSTRAINT fky_material_buhardilla FOREIGN KEY (material) REFERENCES Material(id_material) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_buhardilla_material FOREIGN KEY (buhardilla) REFERENCES Buhardilla(id_buhardilla) ON DELETE CASCADE ON UPDATE CASCADE 
     );

     INSERT INTO Material_Buhardilla (material, buhardilla) VALUES (17, 9),
     (1, 9),
     (24, 9),
     (4, 9),
     (2, 1),
     (17, 1),
     (24, 1),
     (25, 1),
     (22, 21),
     (17, 21),
     (24, 21),
     (6, 12),
     (1, 7),
     (16, 7),
     (17, 7),
     (24, 7),
     (2, 25),
     (20, 25),
     (13, 25),
     (6, 14),
     (25, 14),
     (17, 14),
     (24, 14),
     (13, 14),
     (2, 17);
     
    CREATE TABLE Material_Solado
     (
        id_material_solado INTEGER AUTO_INCREMENT NOT NULL,
        material INTEGER NOT NULL,
        solado INTEGER NOT NULL,
        CONSTRAINT pky_material_solado PRIMARY KEY (id_material_solado),
        CONSTRAINT fky_material_solado FOREIGN KEY (material) REFERENCES Material(id_material) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fky_solado_material FOREIGN KEY (solado) REFERENCES Solado(id_solado) ON DELETE CASCADE ON UPDATE CASCADE
     );

     INSERT INTO Material_Solado (material, solado) VALUES (16, 1),
     (4, 1),
     (16, 8),
     (4, 8),
     (13, 8),
     (4, 20),
     (16, 20),
     (3, 20),
     (23, 20),
     (24, 20),
     (2, 20),
     (21, 15),
     (16, 15),
     (15, 15),
     (4, 15),
     (23, 22),
     (22, 22),
     (16, 22),
     (7, 22),
     (4, 22),
     (4, 7),
     (13, 7),
     (16, 7),
     (2, 11),
     (4, 11);

     CREATE TABLE Material_Cerramiento
     (
       id_material_cerramiento INTEGER AUTO_INCREMENT NOT NULL,
       material INTEGER NOT NULL,
       cerramiento INTEGER NOT NULL,
       CONSTRAINT pky_material_cerramiento PRIMARY KEY (id_material_cerramiento),
       CONSTRAINT fky_material_cerramiento FOREIGN KEY (material) REFERENCES Material(id_material)ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_cerramiento_material FOREIGN KEY (cerramiento) REFERENCES Cerramiento(id_cerramiento)ON DELETE CASCADE ON UPDATE CASCADE
     );

     INSERT INTO Material_Cerramiento (material, cerramiento) VALUES (11, 22),
     (9, 22),
     (19, 18),
     (9, 18),
     (24, 18),
     (25, 18),
     (10, 10),
     (9, 10),
     (15, 10),
     (13, 10),
     (9, 5),
     (11, 5),
     (20, 5),
     (9, 4),
     (19, 4),
     (22, 4),
     (19, 4),
     (8, 1),
     (2, 1),
     (10, 7),
     (9, 7),
     (14, 7),
     (10, 20),
     (8, 20),
     (15, 20);

     CREATE TABLE Material_Reforma
     (
       id_material_reforma INTEGER AUTO_INCREMENT NOT NULL,
       material INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       CONSTRAINT pky_material_reforma PRIMARY KEY (id_material_reforma),
       CONSTRAINT fky_material_reforma FOREIGN KEY (material) REFERENCES Material(id_material) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_material FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE
     );
     
     INSERT INTO Material_Reforma (material, reforma) VALUES (19, 5),
     (8, 5),
     (16, 5),
     (10, 3),
     (9, 3),
     (4, 3),
     (16, 3),
     (16, 8),
     (4, 8),
     (11, 8),
     (9, 8),
     (2, 8),
     (17, 8),
     (24, 8),
     (6, 20),
     (11, 13),
     (9, 13),
     (4, 7),
     (16, 7),
     (5, 7),
     (4, 17),
     (16, 17),
     (10, 17),
     (9, 17),
     (22, 17),
     (17, 17),
     (4, 12),
     (16, 12),
     (11, 12),
     (9, 12),
     (19, 12),
     (2, 12),
     (7, 12),
     (24, 12);
    
     CREATE TABLE Solado_Reforma
     (
       id_solado_reforma INTEGER AUTO_INCREMENT NOT NULL,
       solado INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       CONSTRAINT pky_solado_reforma PRIMARY KEY (id_solado_reforma),
       CONSTRAINT fky_solado_reforma FOREIGN KEY (solado) REFERENCES Solado(id_solado)ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_solado FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE
     );

     INSERT INTO Solado_Reforma (solado, reforma) VALUES (11, 3),
     (15, 8),
     (17, 8),
     (3, 7),
     (10, 17),
     (12, 17),
     (3, 12),
     (17, 12),
     (9, 12);
     
     CREATE TABLE Cerramiento_Reforma 
     (
       id_cerramiento_reforma INTEGER AUTO_INCREMENT NOT NULL,
       cerramiento INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       CONSTRAINT pky_cerramiento_reforma PRIMARY KEY(id_cerramiento_reforma),
       CONSTRAINT fky_cerramiento_reforma FOREIGN KEY(cerramiento) REFERENCES Cerramiento(id_cerramiento) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_cerramiento FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE
     );
     
     INSERT INTO Cerramiento_Reforma (cerramiento, reforma) VALUES (10, 3),
     (10, 3),
     (8, 5),
     (13, 8),
     (22, 13),
     (2, 13),
     (10, 17),
     (7, 17),
     (5, 12),
     (9, 12),
     (4, 12);

     CREATE TABLE Buhardilla_Reforma
     (
       id_buhardilla_reforma INTEGER AUTO_INCREMENT NOT NULL,
       buhardilla INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       CONSTRAINT pky_buhardilla_reforma PRIMARY KEY (id_buhardilla_reforma),
       CONSTRAINT fky_buhardilla_reforma FOREIGN KEY (buhardilla) REFERENCES Buhardilla(id_buhardilla) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_buhardilla FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE
     );
     
     INSERT INTO Buhardilla_Reforma (buhardilla, reforma) VALUES (2, 8),
     (12, 20),
     (4, 20),
     (25, 7),
     (1, 7),
     (4, 17),
     (15, 12),
     (25, 12),
     (17, 12);

     CREATE TABLE Tel_Cliente
     (
       id_tel_cliente INTEGER AUTO_INCREMENT NOT NULL,
       cliente INTEGER NOT NULL,
       telefono VARCHAR(10) NOT NULL,
       CONSTRAINT pky_tel_cliente PRIMARY KEY (id_tel_cliente),
       CONSTRAINT fky_cliente_tel FOREIGN KEY (cliente) REFERENCES Cliente(id_cliente)  ON DELETE CASCADE ON UPDATE CASCADE
     );
     INSERT INTO Tel_cliente(cliente,telefono) VALUES(1,3108206421),
     (1,8367362),
     (3,8367362),
     (4,300576543),
     (4,8348275),
     (6,301653257),
     (7,8367291),
     (8,3127603246),
     (9,8247645),
     (9,3210297263),
     (11,318652076),
     (11,8348245),
     (11,318652076),
     (14,8201200),
     (14,3001829384),
     (2,8347162),
     (17,310928374),
     (17,8376453),
     (19,3187263894),
     (2,8367684),
     (21,3108273648),
     (22,8367928),
     (23,330928263),
     (24,3109279384),
     (25,8367283);
     
     CREATE TABLE Tel_Albanil
     (
       id_tel_albanil INTEGER AUTO_INCREMENT NOT NULL,
       albanil INTEGER NOT NULL,
       telefono VARCHAR(10) NOT NULL,
       CONSTRAINT pky_tel_albanil PRIMARY KEY (id_tel_albanil),
       CONSTRAINT fky_albanil_tel FOREIGN KEY (albanil) REFERENCES Albanil(id_albanil) ON DELETE CASCADE ON UPDATE CASCADE
     );
     
     INSERT INTO Tel_Albanil(albanil, telefono) VALUES (1, 3215217415),
     (1, 3105297536),
     (3, 3149573651),
     (4, 3184756532),
     (5, 3118526541),
     (5, 3147538565),
     (3, 3159856474),
     (8, 3109526836),
     (9, 3228426852),
     (4, 3198547485),
     (11, 3174596585),
     (12, 3112589654),
     (13, 2174865201),
     (14, 3178965345),
     (15, 3165465285),
     (16, 3135689475),
     (11, 3205874596),
     (14, 3186874625),
     (19, 8359541),
     (16, 8364785),
     (5, 8254785),
     (9, 8325895),
     (12, 8201485),
     (24, 8234582),
     (25, 8247456);
     
     CREATE TABLE Tel_Cuadrilla_Ext
     (
       id_tel_cuadrila_ext INTEGER AUTO_INCREMENT NOT NULL,
       cuadrilla_ext INTEGER NOT NULL,
       telefono VARCHAR(10) NOT NULL,
       CONSTRAINT pky_tel_cuadrilla_Ext PRIMARY KEY (id_tel_cuadrila_ext),
       CONSTRAINT fky_cuadrilla_ext_tel FOREIGN KEY (cuadrilla_ext) REFERENCES Cuadrilla_Ext(id_cuadrilla_ext) ON DELETE CASCADE ON UPDATE CASCADE
     );

     INSERT INTO Tel_Cuadrilla_Ext(Cuadrilla_Ext,telefono) VALUES(1,8352415),
     (2,3157486525 ),
     (3,3114121525),
     (22,3185826985),
     (2,3144458526),
     (6,3174589632),
     (10,8354785),
     (8,8365485),
     (9,6548595),
     (10,5475232 ),
     (11,8359585),
     (15,8201252),
     (13,3158564785),
     (14,3168547458),
     (15,3168563514),
     (17,8354185),
     (17,8256552 ),
     (18,3164589652),
     (19,3115556544),
     (20,3200052850),
     (22,8367203),
     (22,3001827304),
     (23,3182736305),
     (24,3002938374),
     (25,8367263);