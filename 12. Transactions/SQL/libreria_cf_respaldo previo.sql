-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 30-03-2023 a las 14:12:01
-- Versión del servidor: 10.5.18-MariaDB-0+deb11u1
-- Versión de PHP: 8.1.17

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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `libros_azar` ()   BEGIN
		SET @iteracion = 0;

		WHILE @iteracion < 5 DO

			SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;

			SET @iteracion = @iteracion +1;


		END WHILE;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `libros_azar_repeat` ()   BEGIN
		SET @iteracion = 0;

		REPEAT

			SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;

			SET @iteracion = @iteracion +1;

			UNTIL @iteracion >= 5

		END REPEAT;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prestamo` (`usuario_id` INT, `libro_id` INT, OUT `cantidad` INT)   BEGIN

			SET cantidad = (SELECT stock FROM libros WHERE libros.libro_id = libro_id);

			IF cantidad > 0 THEN 

				INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro_id, usuario_id);
				UPDATE libros SET stock = stock -1 WHERE libros.libro_id = libro_id;

				SET cantidad = cantidad -1;

			ELSE
				SELECT "No es posible realizar el prestamo" AS mensaje_error;
 			
 			END IF;

		END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_lector` (`usuario_id` INT)   BEGIN 
			SET @cantidad = (SELECT COUNT(*) FROM libros_usuarios 
								WHERE libros_usuarios.usuario_id = usuario_id);

		
		CASE 
			WHEN @cantidad > 20 THEN
				SELECT "Fantastico" AS mensaje;
			WHEN @cantidad  > 10 AND @cantidad < 20 THEN
				SELECT "Aficionado" AS mensaje;
			WHEN @cantidad > 5 AND @cantidad < 10 THEN
				SELECT "Promedio" AS mensaje;
			ELSE
				SELECT "Nuevo" AS mensaje;
		END CASE;

		END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
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
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`autor_id`, `nombre`, `appaterno`, `apmaterno`, `seudonimo`, `genero`, `fecha_nacimiento`, `pais_origen`, `fecha_creacion`) VALUES
(1, 'Test primer_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'Primero', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(2, 'Test segundo_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'Segundo', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(3, 'Test tercero_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'Tercero', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42'),
(4, 'Test cuarto_nombre', 'Test_autor_appaterno', 'autor_apmaterno', 'Cuarto', 'M', '2018-01-03', 'México', '2022-12-06 18:05:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
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
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`libro_id`, `autor_id`, `titulo`, `descripcion`, `paginas`, `fecha_publicacion`, `fecha_creacion`, `ventas`, `stock`) VALUES
(1, 1, 'Carrie', NULL, NULL, '1974-01-01', '2023-02-17 09:37:52', 0, 10),
(2, 1, 'El misterio de Salmes Lot', NULL, NULL, '1975-01-01', '2023-02-17 09:37:52', 0, 9),
(3, 1, 'El resplandor', NULL, NULL, '1977-01-01', '2023-02-17 09:37:52', 0, 10),
(4, 2, 'Harry Potter y la Piedra Filosofal', NULL, NULL, '1997-06-30', '2023-02-17 09:37:52', 0, 10),
(5, 2, 'Harry Potter y la Cámara Secreta', NULL, NULL, '1998-07-02', '2023-02-17 09:37:52', 0, 4),
(6, 2, 'Harry Potter y el prisionero de Azkaban', NULL, NULL, '1999-07-08', '2023-02-17 09:37:52', 0, 9),
(7, 2, 'Harry Potter y el cáliz de fuego', NULL, NULL, '2000-03-20', '2023-02-17 09:37:52', 0, 10),
(8, 2, 'Harry Potter y la Orden del Fénix', NULL, NULL, '2003-06-21', '2023-02-17 09:37:52', 0, 10),
(9, 2, 'Harry Potter y el Misterio del Príncipe', NULL, NULL, '2005-06-16', '2023-02-17 09:37:52', 0, 10),
(10, 2, 'Harry Potter y las Reliquias de la Muerte', NULL, NULL, '2007-07-21', '2023-02-17 09:37:52', 0, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_usuarios`
--

CREATE TABLE `libros_usuarios` (
  `libro_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros_usuarios`
--

INSERT INTO `libros_usuarios` (`libro_id`, `usuario_id`, `fecha_creacion`) VALUES
(1, 1, '2023-03-21 11:49:24'),
(2, 1, '2023-03-21 11:49:24'),
(3, 1, '2023-03-21 11:49:24'),
(1, 1, '2023-03-22 12:09:26'),
(2, 1, '2023-03-22 12:09:26'),
(3, 1, '2023-03-22 12:09:26'),
(4, 4, '2023-03-22 12:09:26'),
(5, 3, '2023-03-22 12:09:26'),
(5, 4, '2023-03-22 12:09:26'),
(1, 5, '2023-03-22 12:09:26'),
(3, 5, '2023-03-22 12:09:26'),
(2, 6, '2023-03-22 12:09:26'),
(5, 6, '2023-03-22 12:09:26'),
(10, 3, '2023-03-27 12:54:29'),
(10, 3, '2023-03-27 16:39:05'),
(5, 3, '2023-03-27 16:42:56'),
(10, 4, '2023-03-27 17:05:33'),
(6, 4, '2023-03-27 17:06:40'),
(2, 1, '2023-03-27 17:08:29'),
(5, 1, '2023-03-28 13:31:57'),
(5, 1, '2023-03-28 13:32:24'),
(5, 1, '2023-03-28 13:32:29'),
(5, 1, '2023-03-28 13:32:34'),
(5, 1, '2023-03-28 13:32:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha_creación` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `apellidos`, `username`, `email`, `fecha_creación`) VALUES
(1, 'Ozkar', 'Kozlov', 'kozlov', 'klzlov@email.com', '2023-03-15 16:36:28'),
(2, 'klvst3r', 'io', 'klvst3r', 'klvst3r@email.com', '2023-03-15 16:36:28'),
(3, 'Daenerys ', 'Targaryen', 'daenerys', 'daeny@email.com', '2023-03-22 12:04:31'),
(4, 'Ned', 'Stark', 'ned', 'ned@email.com', '2023-03-22 12:04:31'),
(5, 'Margaery', 'Tyrell', 'margaery', 'margaery@email.com', '2023-03-22 12:05:46'),
(6, 'Tyrion', 'Lannister', 'tyrion', 'tyrion@email.com', '2023-03-22 12:05:46');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
