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

    CREATE TABLE Cuadrilla_Int
    (
      id_cuadrilla_int INTEGER AUTO_INCREMENT NOT NULL,
      nombre VARCHAR(40) NOT NULL,
      actividad VARCHAR(50) NOT NULL,
      CONSTRAINT pky_cuadrilla_int PRIMARY KEY (id_cuadrilla_int)
    );

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

    CREATE TABLE Solado
    (
        id_solado INTEGER AUTO_INCREMENT NOT NULL,
        metros_cuadrados SMALLINT NOT NULL,
        metros_cubicos_hormigon TINYINT NOT NULL,
        tipo_baldosa VARCHAR(40) NOT NULL,
        CONSTRAINT pky_solado PRIMARY KEY (id_solado),
        CONSTRAINT dom_metros_cuadrados CHECK (metros_cuadrados >=0 and metros_cuadrados <=5100),
        CONSTRAINT dom_metros_cubicos CHECK (metros_cubicos_hormigon >= 0)
    );

    CREATE TABLE Cerramiento
    (
        id_cerramiento INTEGER AUTO_INCREMENT NOT NULL,
        cubierta ENUM('cristal', 'uralita', 'policarbonato') NOT NULL,
        calidad_empleada ENUM('aluminio', 'hierro') NOT NULL,
        CONSTRAINT pky_cerramiento PRIMARY KEY (id_cerramiento)
    );
 
     CREATE TABLE Buhardilla
     (
        id_buhardilla INTEGER AUTO_INCREMENT NOT NULL,
        tipo_escalera ENUM('recta', '1/4 de giro', 'paso japones','caracol','escamoteables') NOT NULL,
        numero_ventanas TINYINT NOT NULL,
        CONSTRAINT pky_buhardilla PRIMARY KEY (id_buhardilla),
        CONSTRAINT dom_num_ventanas CHECK (numero_ventanas >=0)
     ); 

     CREATE TABLE Material
     (
         id_material INTEGER AUTO_INCREMENT NOT NULL,
         nombre VARCHAR(40) NOT NULL,
         descripcion TEXT ,
         precio_unitario DECIMAL(9,2),
         cantidad TINYINT NOT NULL,
         CONSTRAINT pky_material PRIMARY KEY (id_material),
         CONSTRAINT dom_precio_unitario CHECK (precio_unitario >= 0),
         CONSTRAINT dom_cantidad CHECK (cantidad >= 0)
     );

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
         CONSTRAINT pky_albanil PRIMARY KEY (id_albanil),
         CONSTRAINT fky_cuadrilla_int_albanil FOREIGN KEY (cuadrilla_int) REFERENCES Cuadrilla_Int (id_cuadrilla_int) ON DELETE CASCADE ON UPDATE CASCADE,
         CONSTRAINT dom_salario_albanil CHECK (salario >= 980657 AND salario <= 2000000)
     ); 

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

     CREATE TABLE Cuadrilla_Int_Reforma
     (
       id_cuadrilla_int_reforma INTEGER AUTO_INCREMENT NOT NULL,
       cuadrilla_int INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       nom_comp_poliza VARCHAR(40) NOT NULL,
       cobertura VARCHAR(20) NOT NULL,
       fec_inicio DATE NOT NULL,
       fec_fin DATE NOT NULL,
       CONSTRAINT pky_cuadrilla_int_reforma PRIMARY KEY (id_cuadrilla_int_reforma),
       CONSTRAINT fky_cuadrilla_int_reforma FOREIGN KEY (cuadrilla_int) REFERENCES Cuadrilla_int(id_cuadrilla_int) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_cuadrilla_int FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT dom_fec_fin_int CHECK (fec_fin>fec_inicio)
     );

     CREATE TABLE Cuadrilla_Ext_Reforma
     (
       id_cuadrilla_ext_reforma INTEGER AUTO_INCREMENT NOT NULL,
       cuadrilla_ext INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       nom_comp_poliza VARCHAR(40) NOT NULL,
       cobertura VARCHAR(20) NOT NULL,
       fec_inicio DATE NOT NULL,
       fec_fin DATE NOT NULL,
       CONSTRAINT pky_cuadrilla_ext_reforma PRIMARY KEY (id_cuadrilla_ext_reforma),
       CONSTRAINT fky_cuadrilla_ext_reforma FOREIGN KEY (Cuadrilla_ext) REFERENCES Cuadrilla_Ext(id_cuadrilla_ext) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_cuadrilla_ext FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT dom_fec_fin_ext CHECK (fec_fin>fec_inicio)
     );

     CREATE TABLE Material_Buhardilla
     (
       id_material_buhardilla INTEGER AUTO_INCREMENT NOT NULL,
       material INTEGER NOT NULL,
       buhardilla INTEGER NOT NULL,
       CONSTRAINT pky_id_material_buhardilla PRIMARY KEY (id_material_buhardilla),
       CONSTRAINT fky_material_buhardilla FOREIGN KEY (material) REFERENCES Material(id_material) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_buhardilla_material FOREIGN KEY (buhardilla) REFERENCES Buhardilla(id_buhardilla) ON DELETE CASCADE ON UPDATE CASCADE 
     ); 
     
    CREATE TABLE Material_Solado
     (
        id_material_solado INTEGER AUTO_INCREMENT NOT NULL,
        material INTEGER NOT NULL,
        solado INTEGER NOT NULL,
        CONSTRAINT pky_material_solado PRIMARY KEY (id_material_solado),
        CONSTRAINT fky_material_solado FOREIGN KEY (material) REFERENCES Material(id_material) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fky_solado_material FOREIGN KEY (solado) REFERENCES Solado(id_solado) ON DELETE CASCADE ON UPDATE CASCADE
     );

     CREATE TABLE Material_Cerramiento
     (
       id_material_cerramiento INTEGER AUTO_INCREMENT NOT NULL,
       material INTEGER NOT NULL,
       cerramiento INTEGER NOT NULL,
       CONSTRAINT pky_material_cerramiento PRIMARY KEY (id_material_cerramiento),
       CONSTRAINT fky_material_cerramiento FOREIGN KEY (material) REFERENCES Material(id_material)ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_cerramiento_material FOREIGN KEY (cerramiento) REFERENCES Cerramiento(id_cerramiento)ON DELETE CASCADE ON UPDATE CASCADE
     );

     CREATE TABLE Material_Reforma
     (
       id_material_reforma INTEGER AUTO_INCREMENT NOT NULL,
       material INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       CONSTRAINT pky_material_reforma PRIMARY KEY (id_material_reforma),
       CONSTRAINT fky_material_reforma FOREIGN KEY (material) REFERENCES Material(id_material) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_material FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE
     );
    
     CREATE TABLE Solado_Reforma
     (
       id_solado_reforma INTEGER AUTO_INCREMENT NOT NULL,
       solado INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       CONSTRAINT pky_solado_reforma PRIMARY KEY (id_solado_reforma),
       CONSTRAINT fky_solado_reforma FOREIGN KEY (solado) REFERENCES Solado(id_solado)ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_solado FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE
     );
     
     CREATE TABLE Cerramiento_Reforma 
     (
       id_cerramiento_reforma INTEGER AUTO_INCREMENT NOT NULL,
       cerramiento INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       CONSTRAINT pky_cerramiento_reforma PRIMARY KEY(id_cerramiento_reforma),
       CONSTRAINT fky_cerramiento_reforma FOREIGN KEY(cerramiento) REFERENCES Cerramiento(id_cerramiento) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_cerramiento FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE
     );

     CREATE TABLE Buhardilla_Reforma
     (
       id_buhardilla_reforma INTEGER AUTO_INCREMENT NOT NULL,
       buhardilla INTEGER NOT NULL,
       reforma INTEGER NOT NULL,
       CONSTRAINT pky_buhardilla_reforma PRIMARY KEY (id_buhardilla_reforma),
       CONSTRAINT fky_buhardilla_reforma FOREIGN KEY (buhardilla) REFERENCES Buhardilla(id_buhardilla) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT fky_reforma_buhardilla FOREIGN KEY (reforma) REFERENCES Lugar_Reforma(id_reforma) ON DELETE CASCADE ON UPDATE CASCADE
     );

     CREATE TABLE Tel_Cliente
     (
       id_tel_cliente INTEGER AUTO_INCREMENT NOT NULL,
       cliente INTEGER NOT NULL,
       telefono VARCHAR(10) NOT NULL,
       CONSTRAINT pky_tel_cliente PRIMARY KEY (id_tel_cliente),
       CONSTRAINT fky_cliente_tel FOREIGN KEY (cliente) REFERENCES Cliente(id_cliente)  ON DELETE CASCADE ON UPDATE CASCADE
     );

     CREATE TABLE Tel_Albanil
     (
       id_tel_albanil INTEGER AUTO_INCREMENT NOT NULL,
       albanil INTEGER NOT NULL,
       telefono VARCHAR(10) NOT NULL,
       CONSTRAINT pky_tel_albanil PRIMARY KEY (id_tel_albanil),
       CONSTRAINT fky_albanil_tel FOREIGN KEY (albanil) REFERENCES Albanil(id_albanil) ON DELETE CASCADE ON UPDATE CASCADE
     );

     
     CREATE TABLE Tel_Cuadrilla_Ext
     (
       id_tel_cuadrila_ext INTEGER AUTO_INCREMENT NOT NULL,
       cuadrilla_ext INTEGER NOT NULL,
       telefono VARCHAR(10) NOT NULL,
       CONSTRAINT pky_tel_cuadrilla_Ext PRIMARY KEY (id_tel_cuadrila_ext),
       CONSTRAINT fky_cuadrilla_ext_tel FOREIGN KEY (cuadrilla_ext) REFERENCES Cuadrilla_Ext(id_cuadrilla_ext) ON DELETE CASCADE ON UPDATE CASCADE
     );