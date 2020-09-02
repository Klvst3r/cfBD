-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 02, 2020 at 06:44 AM
-- Server version: 8.0.17
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libreria_cf`
--

-- --------------------------------------------------------

--
-- Table structure for table `autores`
--

CREATE TABLE `autores` (
  `autor_id` int(11) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `appaterno` varchar(25) DEFAULT NULL,
  `apmaterno` varchar(25) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `pais_origen` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `autores`
--

INSERT INTO `autores` (`autor_id`, `nombre`, `appaterno`, `apmaterno`, `genero`, `fecha_nacimiento`, `pais_origen`) VALUES
(1, 'Test autor_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'M', '2018-01-03', 'México'),
(2, 'Segundo Autor', NULL, NULL, NULL, NULL, NULL),
(3, 'Test tercer_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'M', '2018-01-03', 'México'),
(4, 'Test cuarto_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'M', '2018-01-03', 'México'),
(5, 'Test quinto_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'M', '2018-01-03', 'México');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
