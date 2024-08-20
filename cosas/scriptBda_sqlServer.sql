-- Verificar si la base de datos existe y crearla si no existe
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'RoncaFit')
BEGIN
    DROP DATABASE RoncaFit;
	
END
GO

CREATE DATABASE RoncaFit
USE RoncaFit

-- Seleccionar la base de datos

GO

-- Estructura de tabla para la tabla `actividades`
CREATE TABLE actividades (
  idActividad INT PRIMARY KEY IDENTITY(1,1),
  actividad NVARCHAR(50) NOT NULL,
  limite INT DEFAULT NULL
);

-- Volcado de datos para la tabla `actividades`
INSERT INTO actividades (actividad, limite) VALUES
('Padel', NULL),
('Crossfit', 30),
('Spinning', 20),
('Body Pump', 20),
('Boxeo', 10),
('Yoga', 20),
('Zumba', 15),
('TRX', 20);

-- Estructura de tabla para la tabla `empleados`
CREATE TABLE empleados (
  idEmpleado INT PRIMARY KEY IDENTITY(1,1),
  dni NVARCHAR(9) NOT NULL,
  nombre NVARCHAR(50) NOT NULL,
  apellidos NVARCHAR(50)
);

-- Volcado de datos para la tabla `empleados`
INSERT INTO empleados (dni, nombre, apellidos) VALUES
('12345678A', 'Sergio', 'Galera Sancho'),
('12345678B', 'Marcos', 'Martinez Hernandez'),
('12345678C', 'Alexander', 'Beroshvili'),
('12345678D', 'Map', 'Mora'),
('12345678E', 'Jose Manuel', 'Navarro');

-- Estructura de tabla para la tabla `instructoresAct`
CREATE TABLE instructoresAct (
  idEmpleado INT NOT NULL,
  idActividad INT NOT NULL,
  FOREIGN KEY (idActividad) REFERENCES actividades(idActividad),
  FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado)
);

-- Volcado de datos para la tabla `instructoresAct`
INSERT INTO instructoresAct (idEmpleado, idActividad) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(2, 3),
(2, 8),
(3, 5),
(4, 3),
(4, 6),
(4, 7),
(4, 3),
(5, 1),
(5, 4);

-- Estructura de tabla para la tabla `clientes`
CREATE TABLE clientes (
  idCliente INT PRIMARY KEY IDENTITY(1,1),
  dni NVARCHAR(9) NOT NULL,
  nombre NVARCHAR(50) NOT NULL,
  apellidos NVARCHAR(50),
  mail NVARCHAR(50) NOT NULL,
  nombreUsuario NVARCHAR(50) NOT NULL,
  contrasenya NVARCHAR(50) NOT NULL
);

-- Volcado de datos para la tabla `clientes`
INSERT INTO clientes (dni, nombre, apellidos, mail, nombreUsuario, contrasenya) VALUES
('73668414N', 'Joel', 'Alacreu Caparrós', 'jalacreu@improlog.com', 'JAlacreu', 'BBBbbb'),
('73668413B', 'Sergi', 'Alacreu Caparrós', 'sergialacreu@gmail.com', 'Sergi Alacreu', '1234');

-- Estructura de tabla para la tabla `tablonActividades`
CREATE TABLE tablonActividades (
  id INT PRIMARY KEY IDENTITY(1,1),
  idActividad INT NOT NULL,
  completa BIT NOT NULL,
  fecha DATETIME NOT NULL,
  inscripciones INT NOT NULL,
  idInstructor INT NOT NULL,
  FOREIGN KEY (idActividad) REFERENCES actividades(idActividad),
  FOREIGN KEY (idInstructor) REFERENCES empleados(idEmpleado)
);

-- Volcado de datos para la tabla `tablonActividades`
INSERT INTO tablonActividades (idActividad, completa, fecha, inscripciones, idInstructor) VALUES
(2, 0, '2025-01-03 17:30:00', 4, 1),
(8, 0, '2025-01-03 17:45:00', 15, 2);

-- Estructura de tabla para la tabla `reservas`
CREATE TABLE reservas (
  idReserva INT PRIMARY KEY IDENTITY(1,1),
  idCliente INT NOT NULL,
  idActividadTablon INT NOT NULL,
  FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
  FOREIGN KEY (idActividadTablon) REFERENCES tablonActividades(id)
);

-- Volcado de datos para la tabla `reservas`
INSERT INTO reservas (idCliente, idActividadTablon) VALUES
(2, 1),
(1, 2);

-- Estructura de tabla para la tabla `avisos`
CREATE TABLE avisos (
  idAviso INT PRIMARY KEY IDENTITY(1,1),
  titulo NVARCHAR(100) NOT NULL,
  mensaje NVARCHAR(500) NOT NULL,
  idEmpleado INT NOT NULL,
  xfec DATETIME NOT NULL,
  FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado)
);

