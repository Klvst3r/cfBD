-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2022 a las 00:51:21
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria_cf`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `autor_id` int(11) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `appaterno` varchar(25) DEFAULT NULL,
  `apmaterno` varchar(25) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `pais_origen` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`autor_id`, `nombre`, `appaterno`, `apmaterno`, `genero`, `fecha_nacimiento`, `pais_origen`) VALUES
(1, 'Test autor_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'M', '2018-01-03', 'México'),
(2, 'Segundo Autor', NULL, NULL, NULL, NULL, NULL),
(3, 'Test tercer_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'M', '2018-01-03', 'México'),
(4, 'Test cuarto_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'M', '2018-01-03', 'México'),
(5, 'Test quinto_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'M', '2018-01-03', 'México'),
(NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL),
(0, NULL, NULL, NULL, NULL, NULL, NULL),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
