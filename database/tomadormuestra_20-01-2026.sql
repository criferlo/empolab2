-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-01-2016 a las 01:49:49
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `laboratorio_aguas2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tomadormuestra`
--

CREATE TABLE IF NOT EXISTS `tomadormuestra` (
`id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  `empresatomadormuestra_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tomadormuestra`
--

INSERT INTO `tomadormuestra` (`id`, `nombre`, `activo`, `empresatomadormuestra_id`) VALUES
(1, 'MARIBEL MARTINEZ', 1, 1),
(2, 'VIVIAN ARTURO CANAL', 1, 1),
(3, 'CHRISTIAN DARIO LUNA SANTANDER', 1, 1),
(4, 'SOFIA GUZMAN', 1, 1),
(12, 'hola soy german', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tomadormuestra`
--
ALTER TABLE `tomadormuestra`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_tomadormuestra_empresatomadormuestra1_idx` (`empresatomadormuestra_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tomadormuestra`
--
ALTER TABLE `tomadormuestra`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tomadormuestra`
--
ALTER TABLE `tomadormuestra`
ADD CONSTRAINT `fk_tomadormuestra_empresatomadormuestra1` FOREIGN KEY (`empresatomadormuestra_id`) REFERENCES `empresatomadormuestra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
