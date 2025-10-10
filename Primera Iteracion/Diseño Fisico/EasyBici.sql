-- Tabla Modelo
CREATE TABLE Modelo (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) UNIQUE NOT NULL,
    año VARCHAR(100),
    id_marca INT NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES Marca(id)
);

-- Tabla Bicicleta
CREATE TABLE Bicicleta (
    id INT PRIMARY KEY IDENTITY(1,1),
    estado VARCHAR(100),
    tamaño_marco VARCHAR(100),
    id_modelo INT NOT NULL,
    id_punto_alquiler INT NOT NULL,
    id_tipo_bicicleta INT NOT NULL,
    id_asistencia INT NOT NULL,
    FOREIGN KEY (id_modelo) REFERENCES Modelo(id),
    FOREIGN KEY (id_punto_alquiler) REFERENCES Punto_De_Alquiler(id),
    FOREIGN KEY (id_tipo_bicicleta) REFERENCES Tipo_De_Bicicleta(id_tipo_bicicleta),
    FOREIGN KEY (id_asistencia) REFERENCES Asistencia(id)
);

-- Tabla Tipo De Bicicleta
    CREATE TABLE Tipo_De_Bicicleta (
    id_tipo_bicicleta INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla Asistencia
  CREATE TABLE Asistencia (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- Tabla Marca
  CREATE TABLE Marca (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) UNIQUE NOT NULL,
    pais_origen VARCHAR(100),
    sitio_web VARCHAR(100) UNIQUE
);

-- Tabla Bicicletas Facturadas
CREATE TABLE Bicicletas_Facturadas (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_bicicleta INT NOT NULL,
    id_factura INT NOT NULL,
    FOREIGN KEY (id_bicicleta) REFERENCES Bicicleta(id),
    FOREIGN KEY (id_factura) REFERENCES Factura(id)
);

-- Tabla Factura 
   CREATE TABLE Factura (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha_alquiler DATETIME,
    fecha_entrega DATETIME,
    id_metodo_pago INT NOT NULL,
    FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_Pago(id)
);

-- Tabla Metodo De Pago
 CREATE TABLE Metodo_Pago (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion VARCHAR(100) NULL
);

-- Tabla Plan Alquiler
CREATE TABLE Plan_Alquiler (
    id INT PRIMARY KEY IDENTITY(1,1),
    condiciones_especiales VARCHAR(100),
    estado VARCHAR(100),
    nombre VARCHAR(100) UNIQUE NOT NULL,
    fecha_inicio_vigencia DATETIME,
    fecha_fin_vigencia DATETIME,
    duracion VARCHAR(100),
    decripcion VARCHAR(100) NULL
);


-- Tabla Tarifa 
CREATE TABLE Tarifa (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_tipo_bicicleta INT NOT NULL,
    id_plan INT NOT NULL,
    valor FLOAT,
    FOREIGN KEY (id_tipo_bicicleta) REFERENCES Tipo_De_Bicicleta(id_tipo_bicicleta),
    FOREIGN KEY (id_plan) REFERENCES Plan_Alquiler(id)
);

-- Tabla Punto De Alquiler
CREATE TABLE Punto_De_Alquiler (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) UNIQUE NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    capacidad INT,
    direccion VARCHAR(100) UNIQUE,
    horario VARCHAR(100),
    id_ciudad INT NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id)
);

