-- Tabla Modelo

CREATE TABLE Modelos (
    id_modelo INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    año VARCHAR(100) NOT NULL,
    id_marca INT NOT NULL,

    -- validaciones
    CONSTRAINT PK_Modelos PRIMARY KEY (id_modelo),
    CONSTRAINT UQ_Modelos_Nombres UNIQUE (nombre),
    CONSTRAINT FK_Modelos_Marcas FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca)
);


-- Tabla Bicicleta
  CREATE TABLE Bicicletas (
    id_bicicleta INT IDENTITY(1,1),
    tamaño_marco VARCHAR(100) NOT NULL,
    color VARCHAR(100) NOT NULL,
    id_estado INT NOT NULL,
    id_modelo INT NOT NULL,
    id_punto_alquiler INT NOT NULL,
    id_tipo_bicicleta INT NOT NULL,
    id_asistencia INT NOT NULL,

    -- Validaciones
    CONSTRAINT PK_Bicicletas PRIMARY KEY (id_bicicleta),
    CONSTRAINT FK_Bicicletas_Modelos FOREIGN KEY (id_modelo) REFERENCES Modelos(id_modelo),
    CONSTRAINT FK_Bicicletas_Puntos_Alquiler FOREIGN KEY (id_punto_alquiler) REFERENCES Puntos_De_Alquiler(id_punto_alquiler),
    CONSTRAINT FK_Bicicletas_Tipos_Bicicletas FOREIGN KEY (id_tipo_bicicleta) REFERENCES Tipos_De_Bicicletas(id_tipo_bicicleta),
    CONSTRAINT FK_Bicicletas_Asistencias FOREIGN KEY (id_asistencia) REFERENCES Asistencias(id_asistencia),
    CONSTRAINT FK_Bicicletas_Estados FOREIGN KEY (id_estado) REFERENCES Estados(id_estado)
);


-- Tabla Tipo De Bicicleta
    CREATE TABLE Tipos_De_Bicicletas (
    id_tipo_bicicleta INT IDENTITY(1,1),
    nombre VARCHAR(100)  NOT NULL,

    --Validaciones
    CONSTRAINT PK_Tipos_Bicicletas PRIMARY KEY (id_tipo_bicicleta),
    CONSTRAINT UQ_Tipos_Bicicletas_Nombre UNIQUE (nombre)

);

-- Tabla Asistencia
  CREATE TABLE Asistencias (
    id_asistencia INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,

    --Validaciones
    CONSTRAINT PK_Asistencias PRIMARY KEY (id_asistencia),
    CONSTRAINT UQ_Asistencias_Nombre UNIQUE (nombre)

);

-- Tabla Marca
    CREATE TABLE Marcas (
    id_marca INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    sitio_web VARCHAR(100) NOT NULL

    --Validaciones
    CONSTRAINT PK_Marcas PRIMARY KEY (id_marca),
    CONSTRAINT UQ_Marcas_Nombre UNIQUE (nombre),
    CONSTRAINT UQ_Marcas_Sitio_Web UNIQUE (sitio_web)
);
-- Tabla Metodo De Pago
 CREATE TABLE Metodos_Pago (
    id_metodo_pago INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NULL,

    --Validaciones 
    CONSTRAINT PK_Metodos_Pago PRIMARY KEY (id_metodo_pago),
    CONSTRAINT UQ_Metodos_Pago_Nombre UNIQUE (nombre)
);
-- Tabla Factura 
   CREATE TABLE Facturas (
    id_factura INT IDENTITY(1,1),
    fecha_alquiler DATETIME NOT NULL,
    fecha_entrega DATETIME NOT NULL,
    id_metodo_pago INT NOT NULL,

    --Validaciones
    CONSTRAINT PK_Facturas PRIMARY KEY (id_factura),
    CONSTRAINT FK_Facturas_Metodos_Pago FOREIGN KEY (id_metodo_pago) REFERENCES Metodos_Pago(id_metodo_pago)
);
-- Tabla Bicicletas Facturadas
CREATE TABLE Bicicletas_Facturadas (
    id_bicicleta_facturada INT IDENTITY(1,1),
    id_bicicleta INT NOT NULL,
    id_factura INT NOT NULL,

    --Validaciones 
    CONSTRAINT PK_Bicicletas_Facturadas PRIMARY KEY (id_bicicleta_facturada),
    CONSTRAINT FK_Bicicletas_Facturadas_Bicicletas FOREIGN KEY (id_bicicleta) REFERENCES Bicicletas(id_bicicleta),
    CONSTRAINT FK_Bicicletas_Facturadas_Facturas FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura)
);

-- Tabla Plan Alquiler
CREATE TABLE Planes_Alquiler (
    id_plan_alquiler INT IDENTITY(1,1),
    condiciones_especiales VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio_vigencia DATETIME NOT NULL,
    fecha_fin_vigencia DATETIME NOT NULL,
    duracion VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NULL,

    -- Validaciones 
    CONSTRAINT PK_Planes_Alquiler PRIMARY KEY (id_plan_alquiler),
    CONSTRAINT UQ_Planes_Alquiler UNIQUE (nombre)
);


-- Tabla Tarifa 
CREATE TABLE Tarifas (
    id_tarifa INT IDENTITY(1,1),
    id_tipo_bicicleta INT NOT NULL,
    tarifa_plan INT NOT NULL,
    valor FLOAT NOT NULL,

    -- Validaciones
    CONSTRAINT PK_Tarifas PRIMARY KEY (id_tarifa),
    CONSTRAINT FK_Tarifas_Tipos_Bicicletas FOREIGN KEY (id_tipo_bicicleta) REFERENCES Tipos_De_Bicicletas(id_tipo_bicicleta),
    CONSTRAINT FK_Tarifas_Planes_Alquiler FOREIGN KEY (tarifa_plan) REFERENCES Planes_Alquiler(id_plan_alquiler)
);


-- Tabla Departamento
CREATE TABLE Departamentos (
    id_departamento INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,

    --Validaciones
    CONSTRAINT PK_Departamentos PRIMARY KEY (id_departamento),
    CONSTRAINT UQ_Departamentos_Nombre UNIQUE (nombre)
);

-- Tabla Cuidad
CREATE TABLE Ciudades (
    id_ciudad INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    latitud VARCHAR(100),
    longitud VARCHAR(100),
    id_departamento INT NOT NULL,

    -- Validaciones
    CONSTRAINT PK_Ciudades PRIMARY KEY (id_ciudad),
    CONSTRAINT UQ_Ciudades_Nombre UNIQUE (nombre),
    CONSTRAINT FK_Ciudades_Departamentos FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);


-- Tabla Punto De Alquiler
CREATE TABLE Puntos_De_Alquiler (
    id_punto_alquiler INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    id_horario INT NOT NULL,
    id_ciudad INT NOT NULL,

    -- Validaciones
    CONSTRAINT PK_Puntos_Alquiler PRIMARY KEY (id_punto_alquiler),
    CONSTRAINT UQ_Puntos_Alquiler_nombre UNIQUE (nombre),
    CONSTRAINT UQ_Puntos_Alquiler_direccion UNIQUE (direccion),
    CONSTRAINT FK_Puntos_Alquiler_Ciudades FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad),
    CONSTRAINT FK_Puntos_Alquiler_Horarios FOREIGN KEY (id_horario) REFERENCES Horarios_Punto_Alquiler(id_horario)
);

-- Tabla Estados
CREATE TABLE Estados (
    id_estado INT IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(250) NULL
);

-- Tabla Horarios_Punto_Alquiler

CREATE TABLE Horarios_Punto_Alquiler (
    id_horario INT IDENTITY(1,1),
    dia_de_semana NVARCHAR(20) NOT NULL,
    hora_inicio DATETIME NOT NULL,
    hora_fin DATETIME NOT NULL
);

-- Tabla Tipos_Documentos_De_Identificacion
CREATE TABLE Tipos_Documentos_De_Identificacion (
    id_tipo_documento INT IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(100) NULL
);


-- Tabla Personas
CREATE TABLE Personas (
    id_persona INT IDENTITY(1,1),
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_de_nacimiento DATETIME NOT NULL,
    nit VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    id_tipo_documento INT NOT NULL,
    id_ciudad_nacimiento INT NOT NULL
);

-- Tabla Cargos
CREATE TABLE Cargos (
    id_cargo INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(250) NULL
);


-- Tabla Trabajadores
CREATE TABLE Trabajadores (
    id_trabajador INT IDENTITY(1,1),
    id_cargo INT NOT NULL,
    id_persona INT NOT NULL
);


-- Tabla Horarios_Empleado

CREATE TABLE Horarios_Empleados (
    id_horario_empleado INT IDENTITY(1,1),
    id_trabajador INT NOT NULL,
    hora_inicio DATETIME NOT NULL,
    dia_semana VARCHAR(10) NOT NULL,
    hora_fin DATETIME NOT NULL
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1),
    id_persona INT NOT NULL,
    id_metodo_de_pago_preferido INT NULL
);

