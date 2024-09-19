-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2024 a las 21:46:51
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
-- Base de datos: `syscoco`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CP_ACTUALIZAR_ROL` (IN `p_id` INT, IN `p_nombre` VARCHAR(100))   BEGIN
UPDATE rol
SET NOMBRE=p_nombre
WHERE ID_ROL=p_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CP_CONSULTAR_ROL` (IN `p_id` INT)   BEGIN 
SELECT
	ID_ROL AS ID,
	NOMBRE AS ROL,
	ESTADO
FROM rol
WHERE p_id=ID_ROL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CP_INSERTAR_ROL` (IN `p_id` INT, IN `p_nombre` VARCHAR(100), IN `p_estado` TINYINT)   BEGIN
insert INTO rol(ID_ROL,NOMBRE,ESTADO) VALUES (p_id,p_nombre,p_estado);
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `ID_ACTIVIDAD` int(11) NOT NULL,
  `CREADOR` int(11) DEFAULT NULL,
  `FK_CURSO` int(11) DEFAULT NULL,
  `ASUNTO` varchar(150) NOT NULL,
  `CONTENIDO` text DEFAULT NULL,
  `FECHA_CREACION` datetime NOT NULL,
  `FECHA_ENVIO` datetime DEFAULT NULL,
  `ARCHIVO_ADJUNTO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`ID_ACTIVIDAD`, `CREADOR`, `FK_CURSO`, `ASUNTO`, `CONTENIDO`, `FECHA_CREACION`, `FECHA_ENVIO`, `ARCHIVO_ADJUNTO`) VALUES
(1, 1, 1, 'Tarea de Matemáticas', 'Completar los ejercicios del capítulo 5 y enviar antes del viernes.', '2024-09-16 00:24:40', NULL, 'tarea_matematicas.pdf'),
(2, 2, 2, 'Lectura de Historia', 'Leer el capítulo 3 del libro de historia y preparar un resumen.', '2024-09-16 00:24:40', NULL, 'lectura_historia.pdf'),
(3, 3, 3, 'Experimento de Biología', 'Realizar el experimento sobre fotosíntesis y entregar el informe.', '2024-09-16 00:24:40', NULL, 'experimento_biologia.pdf'),
(4, 4, 4, 'Ensayo de Literatura', 'Escribir un ensayo sobre el tema de la novela estudiada en clase.', '2024-09-16 00:24:40', NULL, 'ensayo_literatura.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `ID_ASISTENCIA` int(11) NOT NULL,
  `FK_CURSO` int(11) DEFAULT NULL,
  `FK_USUARIO` int(11) DEFAULT NULL,
  `FECHA_ASISTENCIA` date NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`ID_ASISTENCIA`, `FK_CURSO`, `FK_USUARIO`, `FECHA_ASISTENCIA`, `ESTADO`) VALUES
(1, 1, 3, '2024-09-10', 0),
(2, 2, 4, '2024-09-10', 0),
(3, 3, 1, '2024-09-11', 0),
(4, 4, 2, '2024-09-11', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buzon`
--

CREATE TABLE `buzon` (
  `ID_BUZON` int(11) NOT NULL,
  `NOMBRE_BUZON` varchar(100) NOT NULL,
  `FK_USUARIO` int(11) DEFAULT NULL,
  `FK_MENSAJE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `buzon`
--

INSERT INTO `buzon` (`ID_BUZON`, `NOMBRE_BUZON`, `FK_USUARIO`, `FK_MENSAJE`) VALUES
(1, 'Bandeja de Entrada', 1, 1),
(2, 'Mensajes Enviados', 2, 2),
(3, 'Archivos Importantes', 3, 3),
(4, 'Bandeja de Spam', 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunicado`
--

CREATE TABLE `comunicado` (
  `ID_COMUNICADO` int(11) NOT NULL,
  `REMITENTE` int(11) DEFAULT NULL,
  `DESTINATARIO` int(11) DEFAULT NULL,
  `ASUNTO` varchar(150) NOT NULL,
  `CONTENIDO` text DEFAULT NULL,
  `FECHA_CREACION` datetime NOT NULL,
  `FECHA_ENVIO` datetime DEFAULT NULL,
  `ARCHIVO_ADJUNTO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunicado`
--

INSERT INTO `comunicado` (`ID_COMUNICADO`, `REMITENTE`, `DESTINATARIO`, `ASUNTO`, `CONTENIDO`, `FECHA_CREACION`, `FECHA_ENVIO`, `ARCHIVO_ADJUNTO`) VALUES
(1, 1, 2, 'Actualización del Proyecto', 'Hola Ana, te informo sobre la actualización del proyecto X. Por favor revisa el archivo adjunto.', '2024-09-16 00:32:09', NULL, 'actualizacion_proyecto.pdf'),
(2, 2, 3, 'Reunión de Equipo', 'Luis, necesitamos coordinar una reunión de equipo para esta semana. Por favor confirma tu disponibilidad.', '2024-09-16 00:32:09', NULL, 'agenda_reunion.pdf'),
(3, 3, 4, 'Nuevo Procedimiento', 'Sofía, te envío el nuevo procedimiento para la revisión de documentos. Revisa el archivo adjunto.', '2024-09-16 00:32:09', NULL, 'procedimiento_nuevo.pdf'),
(4, 4, 1, 'Informe Semanal', 'Juan, aquí está el informe semanal sobre el desempeño del curso. Por favor, revisa el archivo adjunto.', '2024-09-16 00:32:09', NULL, 'informe_semanal.pdf');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_asistencia_curso`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `consulta_asistencia_curso` (
`fecha_asistencia` date
,`id_curso` int(11)
,`nombres` varchar(100)
,`apellidos` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_buzon_usuario_contenido`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `consulta_buzon_usuario_contenido` (
`ID_BUZON` int(11)
,`NOMBRE_BUZON` varchar(100)
,`NOMBRES` varchar(100)
,`APELLIDOS` varchar(100)
,`CONTENIDO` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `consulta_curso_usuario_materia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `consulta_curso_usuario_materia` (
`curso` int(11)
,`NOMBRES` varchar(100)
,`APELLIDOS` varchar(100)
,`Materia` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `ID_CURSO` int(11) NOT NULL,
  `FK_MATERIA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`ID_CURSO`, `FK_MATERIA`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `ID_ENCUESTA` int(11) NOT NULL,
  `TITULO` varchar(255) NOT NULL,
  `TIPO_PREGUNTA` varchar(100) NOT NULL,
  `PREGUNTA` text NOT NULL,
  `RESPUESTA` text NOT NULL,
  `FK_USUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`ID_ENCUESTA`, `TITULO`, `TIPO_PREGUNTA`, `PREGUNTA`, `RESPUESTA`, `FK_USUARIO`) VALUES
(1, 'Satisfacción del Curso', 'Sí/No', '¿Estás satisfecho con el curso?', 'Sí', 1),
(2, 'Preferencias de Estudio', 'Seleccion Multiple', '¿Qué métodos de estudio prefieres?', 'Lectura, Videos', 2),
(3, 'Comentarios sobre el Profesor', 'Texto', 'Escribe tus comentarios sobre el profesor.', 'Excelente comunicación y claridad en las clases.', 3),
(4, 'Opinión sobre la Plataforma', 'Texto', '¿Qué opinas sobre la nueva plataforma educativa?', 'Es muy intuitiva y fácil de usar.', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `ID_MATERIA` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` text DEFAULT NULL,
  `FK_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`ID_MATERIA`, `NOMBRE`, `DESCRIPCION`, `FK_Usuario`) VALUES
(1, 'Matemáticas', 'Materia básica de matemáticas para el primer año.', 1),
(2, 'Historia', 'Estudio de eventos históricos y sus impactos.', 2),
(3, 'Biología', 'Materia sobre la vida y los organismos vivos.', 3),
(4, 'Literatura', 'Análisis de obras literarias y técnicas de escritura.', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `ID_MENSAJE` int(11) NOT NULL,
  `REMITENTE` int(11) DEFAULT NULL,
  `DESTINATARIO` int(11) DEFAULT NULL,
  `ASUNTO` varchar(150) NOT NULL,
  `CONTENIDO` text DEFAULT NULL,
  `FECHA_CREACION` datetime NOT NULL,
  `FECHA_ENVIO` datetime DEFAULT NULL,
  `ARCHIVO_ADJUNTO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`ID_MENSAJE`, `REMITENTE`, `DESTINATARIO`, `ASUNTO`, `CONTENIDO`, `FECHA_CREACION`, `FECHA_ENVIO`, `ARCHIVO_ADJUNTO`) VALUES
(1, 1, 2, 'Reunión de Proyecto', 'Hola Ana, necesitamos coordinar una reunión para discutir el proyecto.', '2024-09-16 00:19:24', NULL, 'agenda.pdf'),
(2, 2, 3, 'Tarea Pendiente', 'Luis, te recuerdo que la tarea de biología debe ser entregada antes del viernes.', '2024-09-16 00:19:24', '2024-09-16 00:19:24', NULL),
(3, 3, 4, 'Consulta sobre el Curso', 'Sofía, tengo dudas sobre el contenido del curso de literatura.', '2024-09-16 00:19:24', NULL, NULL),
(4, 4, 1, 'Solicitud de Información', 'Juan, ¿puedes enviar el archivo del informe de matemáticas?', '2024-09-16 00:19:24', '2024-09-16 00:19:24', 'informe_matematicas.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `ID_PERMISO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `FK_Rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`ID_PERMISO`, `NOMBRE`, `FK_Rol`) VALUES
(1, 'Acceso completo', 1),
(2, 'Gestionar usuarios', 2),
(3, 'Ver contenido', 3),
(4, 'Acceso limitado', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `ID_PRIVILEGIO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `FK_PERMISOS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`ID_PRIVILEGIO`, `NOMBRE`, `FK_PERMISOS`) VALUES
(5, 'Crear usuarios', 1),
(6, 'Eliminar usuarios', 1),
(7, 'Modificar contenido', 2),
(8, 'Ver informes', 3),
(9, 'Leer mensajes', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_ROL` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_ROL`, `NOMBRE`, `ESTADO`) VALUES
(1, 'Institución', 1),
(2, 'Moderador', 1),
(3, 'Estudiante', 1),
(4, 'Acudiente', 1),
(5, 'ORIENTADORA', 1),
(6, 'Director', 1);

--
-- Disparadores `rol`
--
DELIMITER $$
CREATE TRIGGER `trigger_DML_ROL_DELETE` AFTER DELETE ON `rol` FOR EACH ROW BEGIN
    insert into rol_historial_fecha(concepto, fecha) values ('ELIMINADO ',CURRENT_DATE());
    SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Se insertó el registro de la tabla rol exitosamente';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_DML_ROL_actualizar` AFTER UPDATE ON `rol` FOR EACH ROW BEGIN
    insert into rol_historial_fecha(concepto, fecha) values ('Actualizado',CURRENT_DATE());
    SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Se insertó el registro de la tabla rol exitosamente';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_DML_ROL_insertar` AFTER INSERT ON `rol` FOR EACH ROW BEGIN
    insert into rol_historial_fecha(concepto, fecha) values ('Insertado',CURRENT_DATE());
    SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Se insertó el registro de la tabla rol exitosamente';
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_historial_fecha`
--

CREATE TABLE `rol_historial_fecha` (
  `CONCEPTO` varchar(30) NOT NULL,
  `FECHA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_historial_fecha`
--

INSERT INTO `rol_historial_fecha` (`CONCEPTO`, `FECHA`) VALUES
('Insertado', '2024-09-17'),
('Actualizado', '2024-09-17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOMBRES` varchar(100) NOT NULL,
  `APELLIDOS` varchar(100) NOT NULL,
  `TIPO_DOCUMENTO` varchar(20) NOT NULL,
  `NUMERO_DOCUMENTO` varchar(20) NOT NULL,
  `CONTRASEÑA` varchar(255) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `NUMERO_TELEFONO` varchar(11) DEFAULT NULL,
  `CORREO` varchar(100) NOT NULL,
  `FK_Rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `NOMBRES`, `APELLIDOS`, `TIPO_DOCUMENTO`, `NUMERO_DOCUMENTO`, `CONTRASEÑA`, `FECHA_NACIMIENTO`, `NUMERO_TELEFONO`, `CORREO`, `FK_Rol`) VALUES
(1, 'Juan Pablo', 'García López', 'DNI', '12345678A', 'contraseña123', '1990-05-15', '555-1234', 'juan.pablo@example.com', 1),
(2, 'Ana', 'Martínez Gómez', 'DNI', '23456789B', 'contraseña456', '1985-11-23', '555-5678', 'ana.martinez@example.com', 2),
(3, 'Luis Fernando', 'Castro Rodríguez', 'DNI', '34567890C', 'contraseña789', '2000-01-30', '555-8765', 'luis.castro@example.com', 3),
(4, 'Laura Fernanda', 'Pérez Morales', 'DNI', '45678901D', 'contraseña012', '1995-07-20', '555-4321', 'laura.perez@example.com', 4),
(5, 'Carlos Alberto', 'Martínez Reyes', 'DNI', '56789012E', 'contraseña345', '2001-03-12', '555-6789', 'carlos.martinez@example.com', 3),
(6, 'Marta Isabel', 'Gómez Córdoba', 'DNI', '67890123F', 'contraseña678', '1998-06-25', '555-2345', 'marta.gomez@example.com', 3),
(7, 'David', 'Ramírez Castillo', 'DNI', '78901234G', 'contraseña901', '2002-09-17', '555-3456', 'david.ramirez@example.com', 3),
(8, 'Sofía Alejandra', 'Cruz Pérez', 'DNI', '89012345H', 'contraseña234', '1999-12-08', '555-4567', 'sofia.cruz@example.com', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votacion`
--

CREATE TABLE `votacion` (
  `ID_VOTACION` int(11) NOT NULL,
  `FK_PRIVILEGIO` int(11) NOT NULL,
  `FK_USUARIO` int(11) NOT NULL,
  `FK_ENCUESTA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votacion`
--

INSERT INTO `votacion` (`ID_VOTACION`, `FK_PRIVILEGIO`, `FK_USUARIO`, `FK_ENCUESTA`) VALUES
(17, 8, 1, 1),
(18, 9, 2, 2),
(19, 8, 3, 3),
(20, 9, 4, 4);

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_asistencia_curso`
--
DROP TABLE IF EXISTS `consulta_asistencia_curso`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_asistencia_curso`  AS SELECT `a`.`FECHA_ASISTENCIA` AS `fecha_asistencia`, `b`.`ID_CURSO` AS `id_curso`, `c`.`NOMBRES` AS `nombres`, `c`.`APELLIDOS` AS `apellidos` FROM ((`asistencia` `a` join `curso` `b` on(`a`.`FK_CURSO` = `b`.`ID_CURSO`)) join `usuario` `c` on(`a`.`FK_USUARIO` = `c`.`ID_USUARIO`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_buzon_usuario_contenido`
--
DROP TABLE IF EXISTS `consulta_buzon_usuario_contenido`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_buzon_usuario_contenido`  AS SELECT `a`.`ID_BUZON` AS `ID_BUZON`, `a`.`NOMBRE_BUZON` AS `NOMBRE_BUZON`, `b`.`NOMBRES` AS `NOMBRES`, `b`.`APELLIDOS` AS `APELLIDOS`, `c`.`CONTENIDO` AS `CONTENIDO` FROM ((`buzon` `a` join `usuario` `b` on(`a`.`FK_USUARIO` = `b`.`ID_USUARIO`)) join `mensaje` `c` on(`a`.`FK_MENSAJE` = `c`.`ID_MENSAJE`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `consulta_curso_usuario_materia`
--
DROP TABLE IF EXISTS `consulta_curso_usuario_materia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `consulta_curso_usuario_materia`  AS SELECT `a`.`ID_CURSO` AS `curso`, `b`.`NOMBRES` AS `NOMBRES`, `b`.`APELLIDOS` AS `APELLIDOS`, `c`.`NOMBRE` AS `Materia` FROM ((`materia` `c` join `usuario` `b` on(`c`.`FK_Usuario` = `b`.`ID_USUARIO`)) join `curso` `a` on(`a`.`FK_MATERIA` = `c`.`ID_MATERIA`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`ID_ACTIVIDAD`),
  ADD KEY `CREADOR` (`CREADOR`),
  ADD KEY `FK_CURSO` (`FK_CURSO`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`ID_ASISTENCIA`),
  ADD KEY `FK_CURSO` (`FK_CURSO`),
  ADD KEY `FK_USUARIO` (`FK_USUARIO`);

--
-- Indices de la tabla `buzon`
--
ALTER TABLE `buzon`
  ADD PRIMARY KEY (`ID_BUZON`),
  ADD KEY `FK_USUARIO` (`FK_USUARIO`),
  ADD KEY `FK_MENSAJE` (`FK_MENSAJE`);

--
-- Indices de la tabla `comunicado`
--
ALTER TABLE `comunicado`
  ADD PRIMARY KEY (`ID_COMUNICADO`),
  ADD KEY `REMITENTE` (`REMITENTE`),
  ADD KEY `DESTINATARIO` (`DESTINATARIO`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`ID_CURSO`),
  ADD KEY `FK_MATERIA` (`FK_MATERIA`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`ID_ENCUESTA`),
  ADD KEY `FK_USUARIO` (`FK_USUARIO`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`ID_MATERIA`),
  ADD KEY `FK_Usuario` (`FK_Usuario`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`ID_MENSAJE`),
  ADD KEY `REMITENTE` (`REMITENTE`),
  ADD KEY `DESTINATARIO` (`DESTINATARIO`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`ID_PERMISO`),
  ADD KEY `FK_Rol` (`FK_Rol`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`ID_PRIVILEGIO`),
  ADD KEY `FK_PERMISOS` (`FK_PERMISOS`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD UNIQUE KEY `NUMERO_DOCUMENTO` (`NUMERO_DOCUMENTO`),
  ADD UNIQUE KEY `CORREO` (`CORREO`),
  ADD KEY `FK_Rol` (`FK_Rol`);

--
-- Indices de la tabla `votacion`
--
ALTER TABLE `votacion`
  ADD PRIMARY KEY (`ID_VOTACION`),
  ADD KEY `FK_PRIVILEGIO` (`FK_PRIVILEGIO`),
  ADD KEY `FK_USUARIO` (`FK_USUARIO`),
  ADD KEY `FK_ENCUESTA` (`FK_ENCUESTA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `ID_ACTIVIDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `ID_ASISTENCIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `buzon`
--
ALTER TABLE `buzon`
  MODIFY `ID_BUZON` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comunicado`
--
ALTER TABLE `comunicado`
  MODIFY `ID_COMUNICADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `ID_CURSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `ID_ENCUESTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `ID_MATERIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `ID_MENSAJE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `ID_PERMISO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `ID_PRIVILEGIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_ROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `votacion`
--
ALTER TABLE `votacion`
  MODIFY `ID_VOTACION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `actividad_ibfk_1` FOREIGN KEY (`CREADOR`) REFERENCES `usuario` (`ID_USUARIO`),
  ADD CONSTRAINT `actividad_ibfk_2` FOREIGN KEY (`FK_CURSO`) REFERENCES `curso` (`ID_CURSO`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`FK_CURSO`) REFERENCES `curso` (`ID_CURSO`),
  ADD CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`FK_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `buzon`
--
ALTER TABLE `buzon`
  ADD CONSTRAINT `buzon_ibfk_1` FOREIGN KEY (`FK_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  ADD CONSTRAINT `buzon_ibfk_2` FOREIGN KEY (`FK_MENSAJE`) REFERENCES `mensaje` (`ID_MENSAJE`);

--
-- Filtros para la tabla `comunicado`
--
ALTER TABLE `comunicado`
  ADD CONSTRAINT `comunicado_ibfk_1` FOREIGN KEY (`REMITENTE`) REFERENCES `usuario` (`ID_USUARIO`),
  ADD CONSTRAINT `comunicado_ibfk_2` FOREIGN KEY (`DESTINATARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`FK_MATERIA`) REFERENCES `materia` (`ID_MATERIA`);

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `encuesta_ibfk_1` FOREIGN KEY (`FK_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`FK_Usuario`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`REMITENTE`) REFERENCES `usuario` (`ID_USUARIO`),
  ADD CONSTRAINT `mensaje_ibfk_2` FOREIGN KEY (`DESTINATARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`FK_Rol`) REFERENCES `rol` (`ID_ROL`);

--
-- Filtros para la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD CONSTRAINT `privilegios_ibfk_1` FOREIGN KEY (`FK_PERMISOS`) REFERENCES `permisos` (`ID_PERMISO`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`FK_Rol`) REFERENCES `rol` (`ID_ROL`);

--
-- Filtros para la tabla `votacion`
--
ALTER TABLE `votacion`
  ADD CONSTRAINT `votacion_ibfk_1` FOREIGN KEY (`FK_PRIVILEGIO`) REFERENCES `privilegios` (`ID_PRIVILEGIO`),
  ADD CONSTRAINT `votacion_ibfk_2` FOREIGN KEY (`FK_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  ADD CONSTRAINT `votacion_ibfk_3` FOREIGN KEY (`FK_ENCUESTA`) REFERENCES `encuesta` (`ID_ENCUESTA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
