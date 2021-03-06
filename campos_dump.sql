-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2014 a las 06:43:26
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `campos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquilercancha`
--

CREATE TABLE IF NOT EXISTS `alquilercancha` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  PRIMARY KEY (`idHorario`,`idUsuario`),
  KEY `fk_HorarioCancha_has_Usuario_Usuario1` (`idUsuario`),
  KEY `fk_HorarioCancha_has_Usuario_HorarioCancha1` (`idHorario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquilercanchapromocion`
--

CREATE TABLE IF NOT EXISTS `alquilercanchapromocion` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idPromocion` int(11) NOT NULL,
  `precio` double DEFAULT NULL,
  `precioPromocion` double DEFAULT NULL,
  `precioTotal` double DEFAULT NULL,
  PRIMARY KEY (`idHorario`,`idUsuario`,`idPromocion`),
  KEY `fk_HorarioCancha_has_Usuario_has_Promocion_Promocion1` (`idPromocion`),
  KEY `fk_HorarioCancha_has_Usuario_has_Promocion_HorarioCancha_has_1` (`idHorario`,`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancha`
--

CREATE TABLE IF NOT EXISTS `cancha` (
  `idCancha` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `tarifaD` double DEFAULT NULL,
  `tarifaN` double DEFAULT NULL,
  `idLocal` int(11) NOT NULL,
  PRIMARY KEY (`idCancha`),
  KEY `fk_Cancha_Local1` (`idLocal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariocancha`
--

CREATE TABLE IF NOT EXISTS `horariocancha` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `dia` int(11) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `idCancha` int(11) NOT NULL,
  PRIMARY KEY (`idHorario`),
  KEY `fk_HorarioCancha_Cancha1` (`idCancha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local`
--

CREATE TABLE IF NOT EXISTS `local` (
  `idLocal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `distrito` int(11) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idLocal`),
  KEY `fk_Local_Usuario1` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE IF NOT EXISTS `promocion` (
  `idPromocion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion` text,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`idPromocion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(100) NOT NULL,
  `apellidoMaterno` varchar(100) NOT NULL,
  `sexo` char(1) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `distrito` int(11) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `clave` varchar(20) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquilercancha`
--
ALTER TABLE `alquilercancha`
  ADD CONSTRAINT `fk_HorarioCancha1` FOREIGN KEY (`idHorario`) REFERENCES `horariocancha` (`idHorario`),
  ADD CONSTRAINT `fk_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `alquilercanchapromocion`
--
ALTER TABLE `alquilercanchapromocion`
  ADD CONSTRAINT `fk_HorarioCancha_has_Usuario_has_Promocion_HorarioCancha_has_1` FOREIGN KEY (`idHorario`, `idUsuario`) REFERENCES `alquilercancha` (`idHorario`, `idUsuario`),
  ADD CONSTRAINT `fk_HorarioCancha_has_Usuario_has_Promocion_Promocion1` FOREIGN KEY (`idPromocion`) REFERENCES `promocion` (`idPromocion`);

--
-- Filtros para la tabla `cancha`
--
ALTER TABLE `cancha`
  ADD CONSTRAINT `fk_Cancha_Local1` FOREIGN KEY (`idLocal`) REFERENCES `local` (`idLocal`);

--
-- Filtros para la tabla `horariocancha`
--
ALTER TABLE `horariocancha`
  ADD CONSTRAINT `fk_HorarioCancha_Cancha1` FOREIGN KEY (`idCancha`) REFERENCES `cancha` (`idCancha`);

--
-- Filtros para la tabla `local`
--
ALTER TABLE `local`
  ADD CONSTRAINT `fk_Local_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
