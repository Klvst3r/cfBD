-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 14, 2023 at 04:12 PM
-- Server version: 10.5.18-MariaDB-0+deb11u1
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `autor_id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `appaterno` varchar(25) NOT NULL,
  `apmaterno` varchar(25) NOT NULL,
  `seudonimo` varchar(50) DEFAULT NULL,
  `genero` enum('M','F') DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `pais_origen` varchar(40) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `autores`
--

INSERT INTO `autores` (`autor_id`, `nombre`, `appaterno`, `apmaterno`, `seudonimo`, `genero`, `fecha_nacimiento`, `pais_origen`, `fecha_creacion`) VALUES
(1, 'Test primer_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'Primero', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(2, 'Test segundo_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'Segundo', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(3, 'Test tercero_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'Tercero', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(4, 'Test cuarto_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'Cuarto', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `libros`
--

CREATE TABLE `libros` (
  `libro_id` int(10) UNSIGNED NOT NULL,
  `autor_id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `paginas` int(10) UNSIGNED DEFAULT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `ventas` int(10) UNSIGNED NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `libros`
--

INSERT INTO `libros` (`libro_id`, `autor_id`, `titulo`, `descripcion`, `paginas`, `fecha_publicacion`, `fecha_creacion`, `ventas`, `stock`) VALUES
(1, 1, 'Carrie', NULL, NULL, '1974-01-01', '2023-02-17 09:37:52', 0, 10),
(2, 1, 'El misterio de Salmes Lot', NULL, NULL, '1975-01-01', '2023-02-17 09:37:52', 0, 10),
(3, 1, 'El resplandor', NULL, NULL, '1977-01-01', '2023-02-17 09:37:52', 0, 10),
(4, 2, 'Harry Potter y la Piedra Filosofal', NULL, NULL, '1997-06-30', '2023-02-17 09:37:52', 0, 10),
(5, 2, 'Harry Potter y la Cámara Secreta', NULL, NULL, '1998-07-02', '2023-02-17 09:37:52', 0, 10),
(6, 2, 'Harry Potter y el prisionero de Azkaban', NULL, NULL, '1999-07-08', '2023-02-17 09:37:52', 0, 10),
(7, 2, 'Harry Potter y el cáliz de fuego', NULL, NULL, '2000-03-20', '2023-02-17 09:37:52', 0, 10),
(8, 2, 'Harry Potter y la Orden del Fénix', NULL, NULL, '2003-06-21', '2023-02-17 09:37:52', 0, 10),
(9, 2, 'Harry Potter y el Misterio del Príncipe', NULL, NULL, '2005-06-16', '2023-02-17 09:37:52', 0, 10),
(10, 2, 'Harry Potter y las Reliquias de la Muerte', NULL, NULL, '2007-07-21', '2023-02-17 09:37:52', 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuarios_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha_creación` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`autor_id`),
  ADD UNIQUE KEY `seudonimo` (`seudonimo`);

--
-- Indexes for table `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`libro_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuarios_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autores`
--
ALTER TABLE `autores`
  MODIFY `autor_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `libros`
--
ALTER TABLE `libros`
  MODIFY `libro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuarios_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`autor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
