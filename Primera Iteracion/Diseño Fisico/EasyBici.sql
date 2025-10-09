-- Tabla Modelo
CREATE TABLE Modelo (
    id_modelo INT PRIMARY KEY,
    nombre VARCHAR(100),
    año VARCHAR(4),
    id_Marca INT
);

-- Tabla Bicicleta
CREATE TABLE Bicicleta (
    id INT PRIMARY KEY,
    estado VARCHAR(20),
    tamaño_Marco VARCHAR(20),
    id_Asistencia INT,
    id_Tipo_Bicicleta INT,
    id_Punto_Alquiler INT,
    id_modelo INT,

);

-- Tabla Tipo De Bicicleta
 CREATE TABLE Tipo_De_Bicicleta(
    Id_Tipo_Bicicleta INT PRIMARY KEY,
    Nombre VARCHAR (100),
    );

-- Tabla Asistencia
  CREATE TABLE Asistencia(
  Id_Asistencia INT PRIMARY KEY,
  Nombre VARCHAR (100),
  );

-- Tabla Marca
  CREATE TABLE Marca(
  Id_Marca INT PRIMARY KEY, 
  Nombre VARCHAR (100),
  Pais_Origen VARCHAR(100),
  Sitio_web VARCHAR (100),
  );


-- Bicicletas Facturadas
  CREATE TABLE Bicicletas_Facturadas (
  Id Int,
  Id_Bicicleta Int,
  Id_Factura int, 
  );

-- Factura 
   CREATE TABLE Factura(
   Id_Factura INT PRIMARY KEY,
   Fecha_Alquiler DATETIME,
   Fecha_Entrega DATETIME,
   Id_Metodo_Pago Int,
   );
-- Metodo De Pago
   Id_Metodo_Pago INT PRIMARY KEY,
   Nombre VARCHAR,
   Descripcion VARCHAR,
   );



