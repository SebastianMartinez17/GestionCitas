-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2020 a las 04:56:52
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citasproyecto20`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `CitNumero` int(11) NOT NULL,
  `CitFecha` date DEFAULT NULL,
  `CitHora` time DEFAULT NULL,
  `CitObservación` varchar(45) DEFAULT NULL,
  `CitEstado` varchar(45) DEFAULT NULL,
  `Consultorios_ConNumero` int(11) NOT NULL,
  `Medicos_MedIdentificación` int(11) NOT NULL,
  `PACIENTE_PacIdentificación` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `ConNumero` int(11) NOT NULL,
  `ConNombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `MedIdentificación` int(11) NOT NULL,
  `MedNombre` varchar(45) DEFAULT NULL,
  `MedApellido` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`MedIdentificación`, `MedNombre`, `MedApellido`) VALUES
(1, 'MedN', 'Mellido'),
(15, 'MedN', 'Mellido'),
(152, 'jun', 'kafr'),
(698, 'Juan', 'Mario'),
(1415, 'j', 'm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `PacIdentificación` int(11) NOT NULL,
  `PacNombre` varchar(45) DEFAULT NULL,
  `PacApellidos` varchar(45) DEFAULT NULL,
  `PacNacimineto` text DEFAULT NULL,
  `PacSexo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`PacIdentificación`, `PacNombre`, `PacApellidos`, `PacNacimineto`, `PacSexo`) VALUES
(45, 'ku', 'ku', '04/19/2020', 'M'),
(789, 'Juan', 'Perez', '22/35/2017', 'M'),
(1213, 'Seb', 'Mar', '01/14/2019', 'M'),
(2021, 'Jose', 'Ortiz', '19/45/2015', 'M'),
(455850214, 'ku', 'ku', '04/19/2020', 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `TraNumero` int(11) NOT NULL,
  `TraFechaAsignada` date DEFAULT NULL,
  `TraDescripción` varchar(45) DEFAULT NULL,
  `TraFechaInicial` date DEFAULT NULL,
  `TraFechaFinal` date DEFAULT NULL,
  `TraObservaciones` varchar(45) DEFAULT NULL,
  `PACIENTE_PacIdentificación` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`CitNumero`,`Consultorios_ConNumero`,`Medicos_MedIdentificación`,`PACIENTE_PacIdentificación`),
  ADD KEY `fk_Citas_Consultorios_idx` (`Consultorios_ConNumero`),
  ADD KEY `fk_Citas_Medicos1_idx` (`Medicos_MedIdentificación`),
  ADD KEY `fk_Citas_PACIENTE1_idx` (`PACIENTE_PacIdentificación`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`ConNumero`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`MedIdentificación`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`PacIdentificación`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`TraNumero`,`PACIENTE_PacIdentificación`),
  ADD KEY `fk_Tratamiento_PACIENTES1_idx` (`PACIENTE_PacIdentificación`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_Citas_Consultorios` FOREIGN KEY (`Consultorios_ConNumero`) REFERENCES `consultorios` (`ConNumero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Citas_Medicos1` FOREIGN KEY (`Medicos_MedIdentificación`) REFERENCES `medicos` (`MedIdentificación`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Citas_PACIENTE1` FOREIGN KEY (`PACIENTE_PacIdentificación`) REFERENCES `paciente` (`PacIdentificación`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `fk_Tratamiento_PACIENTES1` FOREIGN KEY (`PACIENTE_PacIdentificación`) REFERENCES `paciente` (`PacIdentificación`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
