-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-06-2024 a las 14:06:04
-- Versión del servidor: 10.6.12-MariaDB
-- Versión de PHP: 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `polideportivo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `idActividad` int(11) PRIMARY KEY AUTO_INCREMENT,
  `actividad` varchar(50) NOT NULL,
  `limite` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`idActividad`, `actividad`, `limite`) VALUES
(1, 'Padel', NULL),
(2, 'Crossfit', 30),
(3, 'Spinning', 20),
(4, 'Body Pump', 20),
(5, 'Boxeo', 10),
(6, 'Yoga', 20),
(7, 'Zumba', 15),
(8, 'TRX', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) PRIMARY KEY AUTO_INCREMENT,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`dni`, `nombre`, `apellidos`) VALUES
('12345678A', 'Sergio', 'Galera Sancho'),
('12345678B', 'Marcos', 'Martinez Hernandez'),
('12345678C', 'Alexander', 'Beroshvili'),
('12345678D', 'Map', 'Mora'),
('12345678E', 'Jose Manuel', 'Navarro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructoresAct`
--

CREATE TABLE `instructoresAct` (
  `idEmpleado` int(9) NOT NULL,
  `idActividad` int(11) NOT NULL,
  FOREIGN KEY (idActividad) REFERENCES actividades(idActividad),
  FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instructoresAct`
--

INSERT INTO `instructoresAct` (`idEmpleado`, `idActividad`) VALUES
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) PRIMARY KEY AUTO_INCREMENT,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50),
  `mail` varchar(50) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `contrasenya` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellidos`,`mail`,`nombreUsuario`,`contrasenya`) VALUES
('73668414N', 'Joel', 'Alacreu Caparrós','jalacreu@improlog.com','JAlacreu','BBBbbb'),
('73668413B', 'Sergi', 'Alacreu Caparrós','sergialacreu@gmail.com','Sergi Alacreu','1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablonActividades`
--

CREATE TABLE `tablonActividades` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `idActividad` int(11) NOT NULL,
  `completa` bit NOT NULL,
  `fecha` DATETIME NOT NULL,
  `inscripciones` int(11) NOT NULL,
  `idInstructor` int(11) NOT NULL,
  FOREIGN KEY (idActividad) REFERENCES actividades(idActividad),
  FOREIGN KEY (idInstructor) REFERENCES empleados(idEmpleado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Volcado de datos para la tabla `tablonActividades`
--

INSERT INTO `tablonActividades` (`idActividad`, `completa`, `fecha`,`inscripciones`,`idInstructor`) VALUES
(2, 0, '2025-01-03 17:30:00','4',1),
(8, 0, '2025-01-03 17:45:00','15',2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(11) PRIMARY KEY AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idActividadTablon` int(11) NOT NULL,
  FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
  FOREIGN KEY (idActividadTablon) REFERENCES tablonActividades(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`idCliente`, `idActividadTablon`) VALUES
(2, 1),
(1, 2);

-- --------------------------------------------------------


--
-- Estructura de tabla para la tabla `avisos`
--

CREATE TABLE `avisos` (
  `idAviso` int(11) PRIMARY KEY AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `mensaje` varchar(500) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `xfec` DATETIME NOT NULL,
  FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
