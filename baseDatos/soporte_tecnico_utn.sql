-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2023 a las 22:43:46
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
-- Base de datos: `soporte_tecnico_utn`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `cuit` varchar(255) DEFAULT NULL,
  `razonSocial` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `cuit`, `razonSocial`) VALUES
(2, '277675432345', 'Jose Perez'),
(52, '243754532561', 'Dario Gomez'),
(102, '243234556640', 'Marina Lopez'),
(152, '20568987456', 'Daniel Gerez'),
(202, '20201452568', 'Leandro Cabral'),
(252, '24365254125', 'Fabian Lino'),
(302, '27227323634', 'Miguel Soto'),
(352, '20457523650', 'Laura Jaime');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_seq`
--

CREATE TABLE `cliente_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Volcado de datos para la tabla `cliente_seq`
--

INSERT INTO `cliente_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(551, 1, 9223372036854775806, 1, 50, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_servicio`
--

CREATE TABLE `cliente_servicio` (
  `cliente_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente_servicio`
--

INSERT INTO `cliente_servicio` (`cliente_id`, `servicio_id`) VALUES
(302, 1),
(302, 2),
(302, 3),
(302, 4),
(302, 5),
(302, 6),
(302, 7),
(302, 8),
(302, 9),
(302, 10),
(302, 11),
(302, 12),
(302, 13),
(302, 14),
(302, 15),
(302, 16),
(302, 17),
(302, 18),
(302, 19),
(302, 20),
(302, 21),
(302, 22),
(302, 23),
(302, 24),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(52, 10),
(52, 11),
(52, 12),
(52, 13),
(52, 14),
(252, 11),
(252, 12),
(252, 13),
(252, 14),
(252, 15),
(252, 16),
(252, 17),
(102, 1),
(102, 2),
(102, 3),
(102, 4),
(102, 5),
(102, 6),
(102, 7),
(352, 6),
(352, 7),
(352, 8),
(352, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `especialidad` enum('INSTALACION_Y_CONFIGURACION','ACTUALIZACIONES_Y_PARCHES','SOPORTE_TECNICO_REMOTO','MANTENIMIENTO_PREVENTIVO','RESOLUCION_DE_PROBLEMAS','BACKUP_Y_RECUPERACION_DE_DATOS','CAPACITACION_USUARIOS','SEGURIDAD_INFORMATICA','MONITOREO_CONTINUO','INTEGRACION_DE_SISTEMAS','CONSULTORIA_TECNICA','GESTION_DE_LICENCIAS') DEFAULT NULL,
  `problemas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id`, `especialidad`, `problemas`) VALUES
(52, 'INSTALACION_Y_CONFIGURACION', NULL),
(53, 'ACTUALIZACIONES_Y_PARCHES', NULL),
(54, 'SOPORTE_TECNICO_REMOTO', NULL),
(55, 'MANTENIMIENTO_PREVENTIVO', NULL),
(56, 'RESOLUCION_DE_PROBLEMAS', NULL),
(57, 'BACKUP_Y_RECUPERACION_DE_DATOS', NULL),
(58, 'CAPACITACION_USUARIOS', NULL),
(59, 'SEGURIDAD_INFORMATICA', NULL),
(60, 'MONITOREO_CONTINUO', NULL),
(61, 'INTEGRACION_DE_SISTEMAS', NULL),
(62, 'CONSULTORIA_TECNICA', NULL),
(63, 'GESTION_DE_LICENCIAS', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_habilidades`
--

CREATE TABLE `especialidad_habilidades` (
  `Especialidad_id` int(11) NOT NULL,
  `habilidades` enum('ERRORES_DURANTE_LA_INSTALACION','CONFIGURACION_INCORRECTA','CONFLICTOS_DE_SOFTWARE','PROBLEMAS_DE_COMPATIBILIDAD','FALLO_EN_LA_APLICACION_DE_PARCHES','ERRORES_POST_ACTUALIZACION','ERRORES_DE_SOFTWARE_REMOTOS','PROBLEMAS_DE_CONECTIVIDAD','ASISTENCIA_EN_LA_RESOLUCION_DE_PROBLEMAS','RENDIMIENTO_LENTO','ERRORES_FRECUENTES','OPTIMIZACION_DEL_SISTEMA','ERRORES_DE_APLICACION','PROBLEMAS_DE_HARDWARE','PROBLEMAS_DE_RED','PERDIDA_DE_DATOS','PROBLEMAS_DE_RESPALDO','RECUPERACION_DE_DATOS_DESPUES_DE_FALLAS','PROBLEMAS_DE_USO_DEL_SOFTWARE','DIFICULTADES_EN_LA_ADOPCION_DE_NUEVAS_TECNOLOGIAS','ERRORES_FRECUENTES_DE_LOS_USUARIOS','VIRUS_Y_MALWARE','VIOLACIONES_DE_SEGURIDAD','CONFIGURACION_DE_CORTAFUEGOS_Y_ANTIVIRUS','PROBLEMAS_DE_RENDIMIENTO_NO_DETECTADOS','SUPERVISION_DE_RECURSOS_DEL_SISTEMA','ALERTAS_DE_RENDIMIENTO','PROBLEMAS_DE_INTEROPERABILIDAD','ERRORES_EN_LA_INTEGRACION','PROBLEMAS_DE_TRANSFERENCIA_DE_DATOS','NECESIDAD_DE_ASESORAMIENTO_TECNICO','OPTIMIZACION_DE_PROCESOS','EVALUACION_DE_TECNOLOGIAS_EMERGENTES','PROBLEMAS_DE_CUMPLIMIENTO_LEGAL','GESTION_DE_LICENCIAS_VENCIDAS','AUDITORIA_DE_SOFTWARE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad_habilidades`
--

INSERT INTO `especialidad_habilidades` (`Especialidad_id`, `habilidades`) VALUES
(52, 'ERRORES_DURANTE_LA_INSTALACION'),
(52, 'CONFIGURACION_INCORRECTA'),
(52, 'CONFLICTOS_DE_SOFTWARE'),
(53, 'PROBLEMAS_DE_COMPATIBILIDAD'),
(53, 'FALLO_EN_LA_APLICACION_DE_PARCHES'),
(53, 'ERRORES_POST_ACTUALIZACION'),
(54, 'ERRORES_DE_SOFTWARE_REMOTOS'),
(54, 'PROBLEMAS_DE_CONECTIVIDAD'),
(54, 'ASISTENCIA_EN_LA_RESOLUCION_DE_PROBLEMAS'),
(55, 'RENDIMIENTO_LENTO'),
(55, 'ERRORES_FRECUENTES'),
(55, 'OPTIMIZACION_DEL_SISTEMA'),
(56, 'ERRORES_DE_APLICACION'),
(56, 'PROBLEMAS_DE_HARDWARE'),
(56, 'PROBLEMAS_DE_RED'),
(57, 'PERDIDA_DE_DATOS'),
(57, 'PROBLEMAS_DE_RESPALDO'),
(57, 'RECUPERACION_DE_DATOS_DESPUES_DE_FALLAS'),
(58, 'PROBLEMAS_DE_USO_DEL_SOFTWARE'),
(58, 'DIFICULTADES_EN_LA_ADOPCION_DE_NUEVAS_TECNOLOGIAS'),
(58, 'ERRORES_FRECUENTES_DE_LOS_USUARIOS'),
(59, 'VIRUS_Y_MALWARE'),
(59, 'VIOLACIONES_DE_SEGURIDAD'),
(59, 'CONFIGURACION_DE_CORTAFUEGOS_Y_ANTIVIRUS'),
(60, 'PROBLEMAS_DE_RENDIMIENTO_NO_DETECTADOS'),
(60, 'SUPERVISION_DE_RECURSOS_DEL_SISTEMA'),
(60, 'ALERTAS_DE_RENDIMIENTO'),
(61, 'PROBLEMAS_DE_INTEROPERABILIDAD'),
(61, 'ERRORES_EN_LA_INTEGRACION'),
(61, 'PROBLEMAS_DE_TRANSFERENCIA_DE_DATOS'),
(62, 'NECESIDAD_DE_ASESORAMIENTO_TECNICO'),
(62, 'OPTIMIZACION_DE_PROCESOS'),
(62, 'EVALUACION_DE_TECNOLOGIAS_EMERGENTES'),
(63, 'PROBLEMAS_DE_CUMPLIMIENTO_LEGAL'),
(63, 'GESTION_DE_LICENCIAS_VENCIDAS'),
(63, 'AUDITORIA_DE_SOFTWARE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_problemas`
--

CREATE TABLE `especialidad_problemas` (
  `Especialidad_id` int(11) NOT NULL,
  `problemas` enum('ERRORES_DURANTE_LA_INSTALACION','CONFIGURACION_INCORRECTA','CONFLICTOS_DE_SOFTWARE','PROBLEMAS_DE_COMPATIBILIDAD','FALLO_EN_LA_APLICACION_DE_PARCHES','ERRORES_POST_ACTUALIZACION','ERRORES_DE_SOFTWARE_REMOTOS','PROBLEMAS_DE_CONECTIVIDAD','ASISTENCIA_EN_LA_RESOLUCION_DE_PROBLEMAS','RENDIMIENTO_LENTO','ERRORES_FRECUENTES','OPTIMIZACION_DEL_SISTEMA','ERRORES_DE_APLICACION','PROBLEMAS_DE_HARDWARE','PROBLEMAS_DE_RED','PERDIDA_DE_DATOS','PROBLEMAS_DE_RESPALDO','RECUPERACION_DE_DATOS_DESPUES_DE_FALLAS','PROBLEMAS_DE_USO_DEL_SOFTWARE','DIFICULTADES_EN_LA_ADOPCION_DE_NUEVAS_TECNOLOGIAS','ERRORES_FRECUENTES_DE_LOS_USUARIOS','VIRUS_Y_MALWARE','VIOLACIONES_DE_SEGURIDAD','CONFIGURACION_DE_CORTAFUEGOS_Y_ANTIVIRUS','PROBLEMAS_DE_RENDIMIENTO_NO_DETECTADOS','SUPERVISION_DE_RECURSOS_DEL_SISTEMA','ALERTAS_DE_RENDIMIENTO','PROBLEMAS_DE_INTEROPERABILIDAD','ERRORES_EN_LA_INTEGRACION','PROBLEMAS_DE_TRANSFERENCIA_DE_DATOS','NECESIDAD_DE_ASESORAMIENTO_TECNICO','OPTIMIZACION_DE_PROCESOS','EVALUACION_DE_TECNOLOGIAS_EMERGENTES','PROBLEMAS_DE_CUMPLIMIENTO_LEGAL','GESTION_DE_LICENCIAS_VENCIDAS','AUDITORIA_DE_SOFTWARE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_seq`
--

CREATE TABLE `especialidad_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Volcado de datos para la tabla `especialidad_seq`
--

INSERT INTO `especialidad_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(151, 1, 9223372036854775806, 1, 50, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidente`
--

CREATE TABLE `incidente` (
  `id` int(11) NOT NULL,
  `consideraciones` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaReporte` date DEFAULT NULL,
  `fechaResolucion` date DEFAULT NULL,
  `problemas` varbinary(255) DEFAULT NULL,
  `resuelto` bit(1) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `tecnico_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incidente`
--

INSERT INTO `incidente` (`id`, `consideraciones`, `descripcion`, `fechaReporte`, `fechaResolucion`, `problemas`, `resuelto`, `cliente_id`, `tecnico_id`) VALUES
(1, 'Se realizó la correcta instalación', 'El sistema no permite la instalación del programa', '2023-11-26', '2023-11-30', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001e4552524f5245535f445552414e54455f4c415f494e5354414c4143494f4e78, b'1', 202, 302),
(3, 'Se realizó la correcta actualizacion', 'El sistema no permite la actualización del programa', '2023-11-19', '2023-11-22', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001a4552524f5245535f504f53545f41435455414c495a4143494f4e78, b'1', 352, 302),
(4, 'Se resolvió el conflicto de software', 'El sistema presenta conflictos de software', '2023-11-23', '2023-11-28', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d00000000000000001200007870740016434f4e464c4943544f535f44455f534f46545741524578, b'1', 102, 252),
(5, 'Se brindo ayuda legal', 'Conflictos de licencia de software', '2023-11-23', '2023-11-30', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001f50524f424c454d41535f44455f43554d504c494d49454e544f5f4c4547414c78, b'1', 2, 202),
(6, 'Se capacitó al personal', 'El personal necesita capacitación para el nuevo programa', '2023-11-27', '2023-12-01', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400314449464943554c54414445535f454e5f4c415f41444f5043494f4e5f44455f4e55455641535f5445434e4f4c4f4749415378, b'1', 102, 202),
(7, 'Se solucionó el conflicto de red', 'El sistema no se conecta a la red', '2023-11-27', '2023-12-02', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001950524f424c454d41535f44455f434f4e45435449564944414478, b'1', 52, 302),
(8, 'Se solucionó el error', 'Hay un error de configuracion del sistema', '2023-11-29', '2023-12-06', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001b50524f424c454d41535f44455f434f4d5041544942494c4944414478, b'0', 52, 302),
(9, 'Se modificó la configuración', 'La configuracion de red es incorrecta', '2023-11-28', '2223-12-02', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001950524f424c454d41535f44455f434f4e45435449564944414478, b'1', 152, 102),
(10, 'El sistema ya no presenta fallas', 'El sistema presenta fallas en la ejecución', '2023-11-24', '2223-11-29', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400284153495354454e4349415f454e5f4c415f5245534f4c5543494f4e5f44455f50524f424c454d415378, b'1', 202, 202),
(11, 'Se cambió la clave del producto', 'Venció la clave del producto', '2023-11-17', '2223-11-21', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d00000000000000001200007870740016434f4e464c4943544f535f44455f534f46545741524578, b'1', 2, 52),
(12, 'Se actualizó la versión', 'La versión del software no es compatible con el hardware', '2023-11-26', '2223-12-04', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400194552524f5245535f454e5f4c415f494e544547524143494f4e78, b'0', 52, 152),
(13, 'Se formateó el sistema', 'El sistema no responde', '2023-11-29', '2232-12-03', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400284153495354454e4349415f454e5f4c415f5245534f4c5543494f4e5f44455f50524f424c454d415378, b'0', 352, 302),
(14, 'Se realizó la correcta instalación', 'El sistema no permite la instalación del programa', '2023-11-20', '2023-11-29', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074001e4552524f5245535f445552414e54455f4c415f494e5354414c4143494f4e78, b'1', 252, 302),
(702, 'Se limpió la pc', ' Aparecen Ventanas emergentes', '2023-11-28', '2023-12-04', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074000f56495255535f595f4d414c5741524578, b'1', 2, 252),
(752, 'Se configuró correctamente el sistema', 'No permite instalar software por problemas de configuración', '2023-11-28', '2023-12-02', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d00000000000000001200007870740018434f4e46494755524143494f4e5f494e434f52524543544178, b'1', 102, 202),
(802, NULL, NULL, '2023-11-28', NULL, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, b'0', 152, NULL),
(852, NULL, NULL, '2023-11-28', NULL, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, b'0', 152, NULL),
(902, NULL, NULL, '2023-11-28', NULL, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, b'0', 202, NULL),
(952, 'Se actualizó el antivirus', 'La compu tiene virus', '2023-11-28', '2023-12-06', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d0000000000000000120000787074000f56495255535f595f4d414c5741524578, b'1', 2, 252),
(1002, 'Se cambiará a la aplicacion TANGO Gestion', 'Migrar a otra aplicacion mas productiva', '2023-11-28', '2023-11-30', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d000000000000000012000078707400184f5054494d495a4143494f4e5f44455f50524f4345534f5378, b'1', 2, 252),
(1052, NULL, NULL, '2023-11-28', NULL, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, b'0', 202, NULL),
(1102, NULL, NULL, '2023-11-28', NULL, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, b'0', 202, NULL),
(1152, NULL, 'Se perdieron datos importantes por un reinicio inesperado', '2023-11-28', '2023-11-29', 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000017704000000017e720017656e756d657261646f732e5469706f50726f626c656d6100000000000000001200007872000e6a6176612e6c616e672e456e756d00000000000000001200007870740027524543555045524143494f4e5f44455f4441544f535f444553505545535f44455f46414c4c415378, b'0', 352, 302);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidente_seq`
--

CREATE TABLE `incidente_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Volcado de datos para la tabla `incidente_seq`
--

INSERT INTO `incidente_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(1251, 1, 9223372036854775806, 1, 50, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problema_seq`
--

CREATE TABLE `problema_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Volcado de datos para la tabla `problema_seq`
--

INSERT INTO `problema_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(1, 1, 9223372036854775806, 1, 50, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(11) NOT NULL,
  `servicioContratado` enum('INSTALACION_Y_CONFIGURACION','ACTUALIZACIONES_Y_PARCHES','SOPORTE_TECNICO_REMOTO','MANTENIMIENTO_PREVENTIVO','RESOLUCION_DE_PROBLEMAS','BACKUP_Y_RECUPERACION_DE_DATOS','CAPACITACION_USUARIOS','SEGURIDAD_INFORMATICA','MONITOREO_CONTINUO','INTEGRACION_DE_SISTEMAS','CONSULTORIA_TECNICA','GESTION_DE_LICENCIAS') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `servicioContratado`) VALUES
(1, 'INSTALACION_Y_CONFIGURACION'),
(2, 'ACTUALIZACIONES_Y_PARCHES'),
(3, 'SOPORTE_TECNICO_REMOTO'),
(4, 'MANTENIMIENTO_PREVENTIVO'),
(5, 'RESOLUCION_DE_PROBLEMAS'),
(6, 'BACKUP_Y_RECUPERACION_DE_DATOS'),
(7, 'CAPACITACION_USUARIOS'),
(8, 'SEGURIDAD_INFORMATICA'),
(9, 'MONITOREO_CONTINUO'),
(10, 'INTEGRACION_DE_SISTEMAS'),
(11, 'CONSULTORIA_TECNICA'),
(12, 'GESTION_DE_LICENCIAS'),
(13, 'INSTALACION_Y_CONFIGURACION'),
(14, 'ACTUALIZACIONES_Y_PARCHES'),
(15, 'SOPORTE_TECNICO_REMOTO'),
(16, 'MANTENIMIENTO_PREVENTIVO'),
(17, 'RESOLUCION_DE_PROBLEMAS'),
(18, 'BACKUP_Y_RECUPERACION_DE_DATOS'),
(19, 'CAPACITACION_USUARIOS'),
(20, 'SEGURIDAD_INFORMATICA'),
(21, 'MONITOREO_CONTINUO'),
(22, 'INTEGRACION_DE_SISTEMAS'),
(23, 'CONSULTORIA_TECNICA'),
(24, 'GESTION_DE_LICENCIAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_seq`
--

CREATE TABLE `servicio_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Volcado de datos para la tabla `servicio_seq`
--

INSERT INTO `servicio_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(151, 1, 9223372036854775806, 1, 50, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(11) NOT NULL,
  `disponible` bit(1) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `cuil` varchar(255) DEFAULT NULL,
  `especialidades` varbinary(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id`, `disponible`, `nombre`, `cuil`, `especialidades`) VALUES
(52, b'1', 'Fernando Clemente', '24306249001', 0x494e5354414c4143494f4e5f595f434f4e46494755524143494f4e),
(102, b'1', 'santiago Suarez', '20325649011', NULL),
(152, b'1', 'Carolina Rios', '27335633310', 0x41435455414c495a4143494f4e45535f595f50415243484553),
(202, b'1', 'Mario Robledo', '24204526316', NULL),
(252, b'1', 'Sebastian Core', '20354633104', NULL),
(302, b'1', 'Catalina Flores', '20404351044', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico_especialidad`
--

CREATE TABLE `tecnico_especialidad` (
  `Tecnico_id` int(11) NOT NULL,
  `especialidades_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico_especialidad`
--

INSERT INTO `tecnico_especialidad` (`Tecnico_id`, `especialidades_id`) VALUES
(202, 52),
(202, 53),
(202, 54),
(152, 62),
(152, 63),
(152, 61),
(302, 62),
(302, 63),
(302, 56),
(302, 57),
(302, 58),
(302, 61),
(302, 52),
(252, 62),
(252, 53),
(252, 56),
(252, 59),
(252, 60),
(252, 61),
(252, 52),
(102, 53),
(102, 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico_incidente`
--

CREATE TABLE `tecnico_incidente` (
  `Tecnico_id` int(11) NOT NULL,
  `incidentesAsignados_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico_incidente`
--

INSERT INTO `tecnico_incidente` (`Tecnico_id`, `incidentesAsignados_id`) VALUES
(202, 752),
(252, 952),
(252, 1002);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico_seq`
--

CREATE TABLE `tecnico_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB;

--
-- Volcado de datos para la tabla `tecnico_seq`
--

INSERT INTO `tecnico_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(401, 1, 9223372036854775806, 1, 50, 0, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente_servicio`
--
ALTER TABLE `cliente_servicio`
  ADD KEY `FK7mmgbo4b6xcwlqvud6qkrowk5` (`servicio_id`),
  ADD KEY `FKp9jw4orosomwj8bdhn019lcsn` (`cliente_id`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidad_habilidades`
--
ALTER TABLE `especialidad_habilidades`
  ADD KEY `FKim071qx5j1wil2dl2qgb1wmkw` (`Especialidad_id`);

--
-- Indices de la tabla `especialidad_problemas`
--
ALTER TABLE `especialidad_problemas`
  ADD KEY `FKq3qawlc00mcukc7bladi214m0` (`Especialidad_id`);

--
-- Indices de la tabla `incidente`
--
ALTER TABLE `incidente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKct96qe9lpl47lhgg4jcuq4q98` (`cliente_id`),
  ADD KEY `FK1r57ggp7n8udv8sr9v7qmmafq` (`tecnico_id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tecnico_especialidad`
--
ALTER TABLE `tecnico_especialidad`
  ADD KEY `FKrpr62cqw1t7y8ssetjmcriysb` (`especialidades_id`),
  ADD KEY `FKow1nkdmfblg30yyqcixiycjgq` (`Tecnico_id`);

--
-- Indices de la tabla `tecnico_incidente`
--
ALTER TABLE `tecnico_incidente`
  ADD UNIQUE KEY `UK_afucrnkfogaqs59pe0qmr049s` (`incidentesAsignados_id`),
  ADD KEY `FKibr0kqysf7v1ll6xln5yt9rg5` (`Tecnico_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente_servicio`
--
ALTER TABLE `cliente_servicio`
  ADD CONSTRAINT `FK7mmgbo4b6xcwlqvud6qkrowk5` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`),
  ADD CONSTRAINT `FKp9jw4orosomwj8bdhn019lcsn` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `especialidad_habilidades`
--
ALTER TABLE `especialidad_habilidades`
  ADD CONSTRAINT `FKim071qx5j1wil2dl2qgb1wmkw` FOREIGN KEY (`Especialidad_id`) REFERENCES `especialidad` (`id`);

--
-- Filtros para la tabla `especialidad_problemas`
--
ALTER TABLE `especialidad_problemas`
  ADD CONSTRAINT `FKq3qawlc00mcukc7bladi214m0` FOREIGN KEY (`Especialidad_id`) REFERENCES `especialidad` (`id`);

--
-- Filtros para la tabla `incidente`
--
ALTER TABLE `incidente`
  ADD CONSTRAINT `FK1r57ggp7n8udv8sr9v7qmmafq` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id`),
  ADD CONSTRAINT `FKct96qe9lpl47lhgg4jcuq4q98` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `tecnico_especialidad`
--
ALTER TABLE `tecnico_especialidad`
  ADD CONSTRAINT `FKow1nkdmfblg30yyqcixiycjgq` FOREIGN KEY (`Tecnico_id`) REFERENCES `tecnico` (`id`),
  ADD CONSTRAINT `FKrpr62cqw1t7y8ssetjmcriysb` FOREIGN KEY (`especialidades_id`) REFERENCES `especialidad` (`id`);

--
-- Filtros para la tabla `tecnico_incidente`
--
ALTER TABLE `tecnico_incidente`
  ADD CONSTRAINT `FK8r2dhdgymkm631auii0qy10hn` FOREIGN KEY (`incidentesAsignados_id`) REFERENCES `incidente` (`id`),
  ADD CONSTRAINT `FKibr0kqysf7v1ll6xln5yt9rg5` FOREIGN KEY (`Tecnico_id`) REFERENCES `tecnico` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
