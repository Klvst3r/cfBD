-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2022 a las 01:06:23
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
  `autor_id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `appaterno` varchar(25) NOT NULL,
  `apmaterno` varchar(25) NOT NULL,
  `seudonimo` varchar(50) UNIQUE,
  `genero` ENUM('M', 'F'),
  `fecha_nacimiento` date NOT NULL,
  `pais_origen` varchar(40) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`autor_id`, `nombre`, `appaterno`, `apmaterno`, `seudonimo`, `genero`, `fecha_nacimiento`, `pais_origen`, `fecha_creacion`) VALUES
(1, 'Test autor_nombre', 'Test_autor_appaterno', 'autor_apmaterno', '', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(2, 'Segundo Autor', '', '', '', '', '0000-00-00', '', '2022-12-06 18:05:42'),
(3, 'Test tercer_nombre', 'Test_autor_appaterno', 'autor_apmaterno', '', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(4, 'Test cuarto_nombre', 'Test_autor_appaterno', 'autor_apmaterno', '', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(5, 'Test quinto_nombre', 'Test_autor_appaterno', 'autor_apmaterno', '', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(0, '', '', '', '', '', '0000-00-00', '', '2022-12-06 18:05:42'),
(0, '', '', '', '', '', '0000-00-00', '', '2022-12-06 18:05:42'),
(0, '', '', '', '', '', '0000-00-00', '', '2022-12-06 18:05:42');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
