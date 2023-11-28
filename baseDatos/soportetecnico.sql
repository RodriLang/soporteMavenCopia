-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2023 a las 03:34:05
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `soportetecnico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `razonSocial` varchar(50) NOT NULL,
  `cuit` varchar(11) NOT NULL,
  `idServicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idProblemas_Especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_tecnico`
--

CREATE TABLE `especialidad_tecnico` (
  `id` int(11) NOT NULL,
  `idTecnico` int(11) NOT NULL,
  `idEspecialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidente`
--

CREATE TABLE `incidente` (
  `id` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idTecnico` int(11) NOT NULL,
  `fechaReporte` date NOT NULL,
  `fechaResolucion` date NOT NULL,
  `resuelto` tinyint(1) NOT NULL,
  `idProblemas_Incidente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problema`
--

CREATE TABLE `problema` (
  `idProblema` int(11) NOT NULL,
  `idProblema_Especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problema_especialidad`
--

CREATE TABLE `problema_especialidad` (
  `id` int(11) NOT NULL,
  `idProblema` int(11) NOT NULL,
  `idEspecialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problema_incidente`
--

CREATE TABLE `problema_incidente` (
  `id` int(11) NOT NULL,
  `idProblema` int(11) NOT NULL,
  `idIncidente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problema_servicio`
--

CREATE TABLE `problema_servicio` (
  `id` int(11) NOT NULL,
  `idProblema` int(11) NOT NULL,
  `idServicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `idProblema_Servicio` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idEspecialidad_tecnico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idServicio` (`idServicio`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidad_tecnico`
--
ALTER TABLE `especialidad_tecnico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEspecialidad` (`idEspecialidad`),
  ADD KEY `idTecnico` (`idTecnico`);

--
-- Indices de la tabla `incidente`
--
ALTER TABLE `incidente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idProblemas_Incidente` (`idProblemas_Incidente`),
  ADD KEY `idTecnico` (`idTecnico`);

--
-- Indices de la tabla `problema`
--
ALTER TABLE `problema`
  ADD PRIMARY KEY (`idProblema`),
  ADD KEY `idProblema_Especialidad` (`idProblema_Especialidad`);

--
-- Indices de la tabla `problema_especialidad`
--
ALTER TABLE `problema_especialidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEspecialidad` (`idEspecialidad`),
  ADD KEY `idProblema` (`idProblema`);

--
-- Indices de la tabla `problema_incidente`
--
ALTER TABLE `problema_incidente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idIncidente` (`idIncidente`),
  ADD KEY `idProblema` (`idProblema`);

--
-- Indices de la tabla `problema_servicio`
--
ALTER TABLE `problema_servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProblema` (`idProblema`),
  ADD KEY `idServicio` (`idServicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idProblema_Servicio` (`idProblema_Servicio`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEspecialidad_tecnico` (`idEspecialidad_tecnico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidad_tecnico`
--
ALTER TABLE `especialidad_tecnico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidente`
--
ALTER TABLE `incidente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `problema`
--
ALTER TABLE `problema`
  MODIFY `idProblema` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `problema_especialidad`
--
ALTER TABLE `problema_especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `problema_incidente`
--
ALTER TABLE `problema_incidente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `problema_servicio`
--
ALTER TABLE `problema_servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`id`);

--
-- Filtros para la tabla `especialidad_tecnico`
--
ALTER TABLE `especialidad_tecnico`
  ADD CONSTRAINT `especialidad_tecnico_ibfk_1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`id`),
  ADD CONSTRAINT `especialidad_tecnico_ibfk_2` FOREIGN KEY (`idTecnico`) REFERENCES `tecnico` (`id`);

--
-- Filtros para la tabla `incidente`
--
ALTER TABLE `incidente`
  ADD CONSTRAINT `incidente_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `incidente_ibfk_2` FOREIGN KEY (`idProblemas_Incidente`) REFERENCES `problema_incidente` (`id`),
  ADD CONSTRAINT `incidente_ibfk_3` FOREIGN KEY (`idTecnico`) REFERENCES `tecnico` (`id`);

--
-- Filtros para la tabla `problema`
--
ALTER TABLE `problema`
  ADD CONSTRAINT `problema_ibfk_1` FOREIGN KEY (`idProblema_Especialidad`) REFERENCES `problema_especialidad` (`id`);

--
-- Filtros para la tabla `problema_especialidad`
--
ALTER TABLE `problema_especialidad`
  ADD CONSTRAINT `problema_especialidad_ibfk_1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`id`),
  ADD CONSTRAINT `problema_especialidad_ibfk_2` FOREIGN KEY (`idProblema`) REFERENCES `problema` (`idProblema`);

--
-- Filtros para la tabla `problema_incidente`
--
ALTER TABLE `problema_incidente`
  ADD CONSTRAINT `problema_incidente_ibfk_1` FOREIGN KEY (`idIncidente`) REFERENCES `incidente` (`id`),
  ADD CONSTRAINT `problema_incidente_ibfk_2` FOREIGN KEY (`idProblema`) REFERENCES `problema` (`idProblema`);

--
-- Filtros para la tabla `problema_servicio`
--
ALTER TABLE `problema_servicio`
  ADD CONSTRAINT `problema_servicio_ibfk_1` FOREIGN KEY (`idProblema`) REFERENCES `problema` (`idProblema`),
  ADD CONSTRAINT `problema_servicio_ibfk_2` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`id`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `servicio_ibfk_2` FOREIGN KEY (`idProblema_Servicio`) REFERENCES `problema_servicio` (`id`);

--
-- Filtros para la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `tecnico_ibfk_1` FOREIGN KEY (`idEspecialidad_tecnico`) REFERENCES `especialidad_tecnico` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
