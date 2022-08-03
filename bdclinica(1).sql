-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-03-2022 a las 02:53:37
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdclinica`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPdet_disp` (IN `cod_doctor` CHAR(5), IN `Cod_Disponibilidad` CHAR(5))  BEGIN
DECLARE CUENTA INT;
DECLARE CODE CHAR(5);
SELECT IFNULL(RIGHT(MAX(Cod_Detalle),3),0)+1 INTO CUENTA FROM detalle_disponibilidad;
SET CODE=CONCAT("DT",LPAD(CUENTA,3,"0"));
INSERT INTO detalle_disponibilidad
VALUES(CODE,cod_doctor,Cod_Disponibilidad);
SELECT CODE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPdisp` (`estado` CHAR(1), `fecha_inicio` DATETIME, `fecha_fin` DATETIME, `turno` VARCHAR(6))  BEGIN
DECLARE CUENTA INT;
DECLARE CODE CHAR(5);
SELECT IFNULL(RIGHT(MAX(Cod_Disponibilidad),3),0)+1 INTO CUENTA FROM disponibilidad;
SET CODE=CONCAT("DP",LPAD(CUENTA,3,"0"));
INSERT INTO disponibilidad 
VALUES(CODE,estado,fecha_inicio,fecha_fin,turno);
SELECT CODE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADI_ADMINISTRADOR` (IN `Nombre` VARCHAR(30), IN `Apellido` VARCHAR(30), IN `Telefono` CHAR(9), IN `Dni` CHAR(8), IN `Correo` VARCHAR(30), IN `Contrasena` VARCHAR(30))  BEGIN
DECLARE CUENTA INT;
DECLARE CODE CHAR(5);
SELECT IFNULL(RIGHT(MAX(Cod_Administrador),4),0)+1 INTO CUENTA FROM administrador;
SET CODE=CONCAT("A",LPAD(CUENTA,4,"0"));
INSERT INTO administrador VALUES(CODE,Nombre,Apellido,Telefono,Dni,Correo,Contrasena);
SELECT CODE; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADI_CITA` (IN `Cod_P` CHAR(5), IN `Fecha_I` DATETIME, IN `Fecha_f` DATETIME, IN `Cod_D` CHAR(5), IN `Tipo` CHAR(7), IN `Total` DOUBLE, IN `CodDetalle` CHAR(5))  BEGIN
DECLARE CUENTA INT;
DECLARE CODE CHAR(5);
SELECT IFNULL(RIGHT(MAX(Cod_Cita),4),0)+1 INTO CUENTA FROM cita;
SET CODE=CONCAT("C",LPAD(CUENTA,4,"0"));
INSERT INTO cita VALUES(CODE,Cod_P,Fecha_I,Fecha_f,Cod_D,Tipo,Total,CodDetalle);
SELECT CODE; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADI_DOCTOR` (IN `Nombre` VARCHAR(30), IN `Fecha_Ingreso` DATE, IN `Apellido` VARCHAR(30), IN `Sexo` VARCHAR(10), IN `Cod_Especialidad` VARCHAR(5))  BEGIN
DECLARE CUENTADOCTOR INT;
DECLARE CUENTACONSULTORIO INT;
DECLARE CODDOC CHAR(5);
DECLARE CODCS CHAR(5);
SELECT IFNULL(RIGHT(MAX(Cod_Doctor),4),0)+1 INTO CUENTADOCTOR FROM doctor;
SELECT IFNULL(RIGHT(MAX(Cod_Consultorio),3),0)+1 INTO CUENTACONSULTORIO FROM doctor;
SET CODDOC=CONCAT("D",LPAD(CUENTADOCTOR,4,"0"));
SET CODCS=CONCAT("CS",LPAD(CUENTACONSULTORIO,3,"0"));
INSERT INTO doctor VALUES(CODDOC,Nombre,Fecha_Ingreso,Apellido,Sexo,Cod_Especialidad, CODCS);
SELECT CODDOC, CODCS; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADI_ENCUESTA` (IN `fecha` DATETIME, IN `nivel_sastifacion` VARCHAR(16), IN `valor` CHAR(2), IN `comentario` VARCHAR(255))  BEGIN
DECLARE CUENTA INT;
DECLARE CODE CHAR(5);
SELECT IFNULL(RIGHT(MAX(Cod_Encuesta),3),0)+1 INTO CUENTA FROM encuesta;
SET CODE=CONCAT("EC",LPAD(CUENTA,3,"0"));
INSERT INTO encuesta 
VALUES(CODE,fecha,nivel_sastifacion,valor,comentario);
SELECT CODE; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADI_HISTORIAL` (IN `Cod_Pac` CHAR(5), IN `Cod_Doc` CHAR(5), IN `fe` DATETIME, IN `Cod_Ci` CHAR(5), IN `Motv` VARCHAR(255), IN `Est` VARCHAR(9), IN `Dig` VARCHAR(255), IN `Rect` VARCHAR(255), IN `Trat` VARCHAR(255))  BEGIN
DECLARE CUENTA INT;
DECLARE CODE CHAR(5);
SELECT IFNULL(RIGHT(MAX(Cod_Historial),4),0)+1 INTO CUENTA FROM historial;
SET CODE=CONCAT("H",LPAD(CUENTA,4,"0"));
INSERT INTO historial
VALUES(CODE,Cod_Pac,Cod_Doc,fe,Cod_Ci,Motv,Est,Dig,Rect,Trat);
SELECT CODE; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADI_PACIENTE` (IN `Nombre` VARCHAR(30), IN `Apellido` VARCHAR(30), IN `Telefono` CHAR(9), IN `Dni` CHAR(8), IN `Correo` VARCHAR(30), IN `Contrasena` VARCHAR(30))  BEGIN
DECLARE CUENTA INT;
DECLARE CODE CHAR(5);
SELECT IFNULL(RIGHT(MAX(Cod_Paciente),4),0)+1 INTO CUENTA FROM paciente;
SET CODE=CONCAT("P",LPAD(CUENTA,4,"0"));
INSERT INTO paciente 
VALUES(CODE,Nombre,Apellido,Telefono,Dni,Correo,Contrasena);
SELECT CODE; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ADI_USUARIO` (IN `Dni` CHAR(8), IN `Nombre` VARCHAR(30), IN `Apellido` VARCHAR(30), IN `Telefono` CHAR(9), IN `Correo` VARCHAR(30), IN `Cargo` VARCHAR(13), IN `Contrasena` VARCHAR(30))  BEGIN
DECLARE CUENTA INT;
DECLARE CODE CHAR(5);
SELECT IFNULL(RIGHT(MAX(Cod_Usuario),4),0)+1 INTO CUENTA FROM usuario;
SET CODE=CONCAT("U",LPAD(CUENTA,4,"0"));
INSERT INTO usuario VALUES(Dni,CODE,Nombre,Apellido,Telefono,Correo,Cargo,Contrasena);
SELECT CODE; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CAMBIA_DISPANULAR` (IN `codD` CHAR(5), IN `Fi` DATETIME, IN `Ff` DATETIME, IN `Tur` VARCHAR(6))  UPDATE bdclinica.disponibilidad SET Cod_Disponibilidad=codD,Estado="0", Fecha_Inicio=Fi, Fecha_Fin=Ff,Turno=Tur WHERE Cod_Disponibilidad=codD$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CAMBIA_DISPONIBILIDAD` (IN `codD` CHAR(5), IN `Fi` DATETIME, IN `Ff` DATETIME, IN `Tur` VARCHAR(6))  UPDATE bdclinica.disponibilidad SET Cod_Disponibilidad=codD,Estado="1", Fecha_Inicio=Fi, Fecha_Fin=Ff,Turno=Tur WHERE Cod_Disponibilidad=codD$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CAMBIA_DOCTOR` (IN `codD` CHAR(5), IN `Nom` VARCHAR(30), IN `FechaIng` DATE, IN `Ape` VARCHAR(30), IN `Sex` CHAR(1), IN `CodEsp` CHAR(5), IN `CodCon` CHAR(5))  UPDATE bdclinica.doctor SET Cod_Doctor=codD, Nombre=Nom, Fecha_Ingreso=FechaIng, Apellido=Ape, Sexo=Sex, Cod_Especialidad=CodEsp, Cod_Consultorio=CodCon WHERE Cod_Doctor=codD$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CAMBIA_HISTORIAL` (IN `codH` CHAR(5), IN `codP` CHAR(5), IN `codD` CHAR(5), IN `fe` DATETIME, IN `codC` CHAR(5), IN `mot` VARCHAR(255), IN `est` VARCHAR(9), IN `diag` VARCHAR(255), IN `rect` VARCHAR(255), IN `trata` VARCHAR(255))  UPDATE bdclinica.historial SET Cod_Historial=codH,Cod_Paciente=codP, Cod_Doctor=codD, fecha=fe,Cod_Cita=codC, Motivo=mot, Estado=est, Diagnostico=diag, Receta=rect, Tratamiento=trata WHERE Cod_Historial=codH$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CAMBIA_PACIENTE` (IN `codP` CHAR(5), IN `Nom` VARCHAR(30), IN `Ape` VARCHAR(30), IN `telf` CHAR(9), IN `d` CHAR(8), IN `Co` VARCHAR(30), IN `Contra` VARCHAR(30))  UPDATE bdclinica.paciente SET Cod_Paciente=codP,Nombre=Nom, Apellido=Ape, Telefono=telf,Dni=d, Correo=Co, Contrasena=Contra WHERE Cod_Paciente=codP$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CAMBIA_USUARIO` (IN `d` CHAR(8), IN `CodU` CHAR(5), IN `Nom` VARCHAR(30), IN `Ape` VARCHAR(30), IN `telf` CHAR(9), IN `Co` VARCHAR(30), IN `car` VARCHAR(13), IN `Contra` VARCHAR(30))  UPDATE clinicaprueba.usuario SET Dni=d,Cod_Usuario=CodU,Nombre=Nom, Apellido=Ape, Telefono=telf, Correo=Co, Cargo=car,Contrasena=Contra WHERE Dni=d$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GRAFICO1` (IN `an` INT)  SELECT e.nivel_sastifacion,COUNT(e.nivel_sastifacion) FROM encuesta e WHERE YEAR(e.Fecha)=an 
GROUP BY e.nivel_sastifacion$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `Cod_Administrador` char(5) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellidos` varchar(30) DEFAULT NULL,
  `Telefono` char(9) DEFAULT NULL,
  `Dni` char(8) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `contraseña` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`Cod_Administrador`, `Nombre`, `Apellidos`, `Telefono`, `Dni`, `Correo`, `contraseña`) VALUES
('A0001', 'Marta', 'Flores', '966654321', '70612299', 'marta@gmail.com', '123'),
('A0002', 'Marcus', 'Romero Espinoza', '989785351', '70675615', 'marcus@gmail.com', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `Cod_Cita` char(5) NOT NULL,
  `Cod_Paciente` char(5) DEFAULT NULL,
  `Fecha_Atencion` datetime DEFAULT NULL,
  `Fecha_Salida` datetime DEFAULT NULL,
  `Cod_Doctor` char(5) DEFAULT NULL,
  `Tipo` char(7) DEFAULT NULL,
  `Total_Pagar` double NOT NULL,
  `Cod_Detalle` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`Cod_Cita`, `Cod_Paciente`, `Fecha_Atencion`, `Fecha_Salida`, `Cod_Doctor`, `Tipo`, `Total_Pagar`, `Cod_Detalle`) VALUES
('C0001', 'P0001', '2022-03-06 15:00:00', '2022-03-06 16:00:00', 'D0007', 'Boleta', 95, 'DT012'),
('C0002', 'P0009', '2022-04-12 19:00:00', '2022-04-12 20:00:00', 'D0008', 'Boleta', 84, 'DT027'),
('C0003', 'P0009', '2022-04-23 20:00:00', '2022-04-23 21:00:00', 'D0015', 'Boleta', 95, 'DT026'),
('C0004', 'P0009', '2022-04-23 20:00:00', '2022-04-23 21:00:00', 'D0015', 'Factura', 95, 'DT021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

CREATE TABLE `consultorio` (
  `Cod_Consultorio` char(5) NOT NULL,
  `Cod_Doctor` char(5) DEFAULT NULL,
  `Nro_Habitacion` int(11) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `consultorio`
--

INSERT INTO `consultorio` (`Cod_Consultorio`, `Cod_Doctor`, `Nro_Habitacion`, `Estado`) VALUES
('CS001', 'D0001', 1, '1'),
('CS002', 'D0002', 2, '1'),
('CS003', 'D0003', 3, '1'),
('CS004', 'D0004', 4, '1'),
('CS005', 'D0005', 5, '1'),
('CS006', 'D0006', 6, '1'),
('CS007', 'D0007', 7, '1'),
('CS008', 'D0008', 8, '1'),
('CS009', 'D0009', 9, '1'),
('CS010', 'D0010', 10, '1'),
('CS011', 'D0011', 11, '1'),
('CS012', 'D0012', 12, '1'),
('CS013', 'D0013', 13, '1'),
('CS014', 'D0014', 14, '1'),
('CS015', 'D0015', 15, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_disponibilidad`
--

CREATE TABLE `detalle_disponibilidad` (
  `Cod_Detalle` char(5) NOT NULL DEFAULT '',
  `Cod_Doctor` char(5) DEFAULT NULL,
  `Cod_Disponibilidad` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_disponibilidad`
--

INSERT INTO `detalle_disponibilidad` (`Cod_Detalle`, `Cod_Doctor`, `Cod_Disponibilidad`) VALUES
('DT001', 'D0001', 'DP001'),
('DT002', 'D0001', 'DP002'),
('DT003', 'D0002', 'DP003'),
('DT004', 'D0002', 'DP004'),
('DT005', 'D0003', 'DP005'),
('DT006', 'D0003', 'DP006'),
('DT007', 'D0004', 'DP007'),
('DT008', 'D0004', 'DP008'),
('DT009', 'D0005', 'DP009'),
('DT010', 'D0005', 'DP010'),
('DT011', 'D0006', 'DP011'),
('DT012', 'D0007', 'DP012'),
('DT013', 'D0007', 'DP013'),
('DT014', 'D0007', 'DP014'),
('DT015', 'D0008', 'DP015'),
('DT016', 'D0008', 'DP016'),
('DT021', 'D0015', 'DP021'),
('DT022', 'D0015', 'DP022'),
('DT023', 'D0010', 'DP023'),
('DT024', 'D0008', 'DP024'),
('DT026', 'D0015', 'DP026'),
('DT027', 'D0008', 'DP027'),
('DT028', 'D0008', 'DP028');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibilidad`
--

CREATE TABLE `disponibilidad` (
  `Cod_Disponibilidad` char(5) NOT NULL DEFAULT '',
  `Estado` char(1) DEFAULT NULL,
  `Fecha_Inicio` datetime DEFAULT NULL,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Turno` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `disponibilidad`
--

INSERT INTO `disponibilidad` (`Cod_Disponibilidad`, `Estado`, `Fecha_Inicio`, `Fecha_Fin`, `Turno`) VALUES
('DP001', '0', '2022-04-02 13:00:00', '2022-04-02 14:00:00', 'tarde'),
('DP002', '0', '2022-04-02 15:30:00', '2022-04-02 16:30:00', 'tarde'),
('DP003', '0', '2022-04-02 13:00:00', '2022-04-02 14:00:00', 'tarde'),
('DP004', '0', '2022-04-02 19:30:00', '2022-04-02 20:30:00', 'noche'),
('DP005', '0', '2022-02-05 10:00:00', '2022-02-05 11:00:00', 'mañana'),
('DP006', '0', '2022-02-05 15:30:00', '2022-02-05 16:30:00', 'tarde'),
('DP007', '0', '2022-02-04 10:30:00', '2022-02-04 11:30:00', 'mañana'),
('DP008', '0', '2022-02-04 14:30:00', '2022-02-04 15:30:00', 'tarde'),
('DP009', '0', '2022-02-07 10:00:00', '2022-02-07 11:00:00', 'mañana'),
('DP010', '0', '2022-02-07 20:30:00', '2022-02-07 21:30:00', 'noche'),
('DP011', '0', '2022-02-08 15:00:00', '2022-02-08 16:00:00', 'tarde'),
('DP012', '1', '2022-03-06 15:00:00', '2022-03-06 16:00:00', 'tarde'),
('DP013', '0', '2022-02-07 17:30:00', '2022-02-07 18:30:00', 'tarde'),
('DP014', '0', '2022-02-08 15:00:00', '2022-02-08 16:00:00', 'tarde'),
('DP015', '0', '2022-02-08 15:00:00', '2022-02-08 16:00:00', 'tarde'),
('DP016', '0', '2022-02-10 15:00:00', '2022-02-10 16:00:00', 'tarde'),
('DP021', '1', '2022-04-23 20:00:00', '2022-04-23 21:00:00', 'noche'),
('DP022', '0', '2022-04-12 15:00:00', '2022-04-12 16:00:00', 'tarde'),
('DP023', '0', '2022-04-12 15:00:00', '2022-04-12 16:00:00', 'tarde'),
('DP024', '0', '2022-04-20 15:00:00', '2022-04-20 16:00:00', 'tarde'),
('DP026', '1', '2022-04-23 20:00:00', '2022-04-23 21:00:00', 'noche'),
('DP027', '1', '2022-04-12 19:00:00', '2022-04-12 20:00:00', 'noche'),
('DP028', '0', '2022-04-12 19:00:00', '2022-04-12 20:00:00', 'noche');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `Cod_Doctor` char(5) NOT NULL DEFAULT '',
  `Nombre` varchar(30) DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Sexo` char(1) NOT NULL,
  `Cod_Especialidad` char(5) DEFAULT NULL,
  `Cod_Consultorio` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`Cod_Doctor`, `Nombre`, `Fecha_Ingreso`, `Apellido`, `Sexo`, `Cod_Especialidad`, `Cod_Consultorio`) VALUES
('D0002', 'Carlos Arturo', '2018-07-02', 'Romero', 'M', 'E0005', 'CS002'),
('D0003', 'Jessica Yamileth', '2018-08-15', 'Peña', 'F', 'E0003', 'CS003'),
('D0004', 'Roberto', '2018-10-17', 'Cordova', 'M', 'E0003', 'CS004'),
('D0006', 'Rafael Antonio', '2019-06-02', 'Orellana', 'M', 'E0005', 'CS006'),
('D0007', 'Emilia Cristina', '2019-07-13', 'Garcia', 'F', 'E0001', 'CS007'),
('D0008', 'William Mauricio', '2019-10-02', 'Linares', 'M', 'E0004', 'CS008'),
('D0009', 'Carolina', '2019-10-13', 'Vasques', 'F', 'E0005', 'CS009'),
('D0010', 'José Alberto', '2019-10-17', 'Rodríguez', 'M', 'E0004', 'CS010'),
('D0011', 'Wendy Maritza Elena', '2020-02-13', 'Villanueva', 'F', 'E0005', 'CS011'),
('D0015', 'Melani', '2020-08-15', 'Casandra', 'F', 'E0001', 'CS015'),
('D0016', 'Juan', '2018-07-02', 'Paredes', 'M', 'E0002', 'CS016'),
('D0017', 'Jenny', '2018-07-02', 'Gonzalez', 'F', 'E0002', 'CS017'),
('D0018', 'Mateo', '2018-07-02', 'Pans', 'M', 'E0006', 'CS018');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `Cod_Encuesta` char(5) NOT NULL DEFAULT '',
  `Fecha` datetime DEFAULT NULL,
  `nivel_sastifacion` varchar(16) DEFAULT NULL,
  `valor` char(2) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`Cod_Encuesta`, `Fecha`, `nivel_sastifacion`, `valor`, `comentario`) VALUES
('EC001', '2018-06-12 00:00:00', 'Regular', '5', 'Mejorar el diseño de la página'),
('EC002', '2018-06-12 00:00:00', 'Satisfecho', '6', ''),
('EC003', '2018-08-15 00:00:00', 'Satisfecho', '6', ''),
('EC004', '2018-10-17 00:00:00', 'Satisfecho', '6', ''),
('EC005', '2019-05-05 00:00:00', 'Insatisfecho', '4', ''),
('EC006', '2019-05-05 00:00:00', 'Insatisfecho', '4', ''),
('EC007', '2019-05-06 00:00:00', 'Regular', '5', ''),
('EC008', '2019-05-07 00:00:00', 'Regular', '5', ''),
('EC009', '2019-05-08 00:00:00', 'Satisfecho', '6', ''),
('EC010', '2019-05-09 00:00:00', 'Insatisfecho', '4', ''),
('EC011', '2019-05-10 00:00:00', 'Insatisfecho', '4', ''),
('EC012', '2020-02-14 00:00:00', 'Muy satisfecho', '9', ''),
('EC013', '2020-02-15 00:00:00', 'Regular', '5', ''),
('EC014', '2020-02-16 00:00:00', 'Muy satisfecho', '8', ''),
('EC015', '2020-02-17 00:00:00', 'Satisfecho', '6', ''),
('EC016', '2022-04-02 13:00:00', 'Regular', '5', ''),
('EC017', '2022-04-02 13:00:00', 'Regular', '5', ''),
('EC018', '2022-04-02 13:00:00', 'Sastifecho', '7', ''),
('EC019', '2022-04-02 15:30:00', 'Sastifecho', '5', ''),
('EC020', '2022-03-06 15:00:00', 'Regular', '5', ''),
('EC021', '2022-04-02 15:30:00', 'Regular', '6', 'Ninguno'),
('EC022', '2022-04-02 13:00:00', 'Regular', '6', ''),
('EC023', '2022-04-02 15:30:00', 'Muy sastifecho', '10', 'Muy bueno'),
('EC024', '2022-04-02 13:00:00', 'Sastifecho', '8', 'Muy bueno'),
('EC025', '2022-04-02 13:00:00', 'Regular', '5', ''),
('EC026', '2022-04-02 13:00:00', 'Sastifecho', '8', ''),
('EC027', '2022-04-02 13:00:00', 'Sastifecho', '8', ''),
('EC028', '2022-04-02 15:30:00', 'Sastifecho', '8', ''),
('EC029', '2022-04-02 13:00:00', 'Sastifecho', '6', ''),
('EC030', '2022-04-02 13:00:00', 'Sastifecho', '8', ''),
('EC031', '2022-04-02 13:00:00', 'Regular', '5', ''),
('EC032', '2022-04-02 13:00:00', 'Insastifecho', '4', ''),
('EC033', '2022-04-02 15:30:00', 'Sastifecho', '8', ''),
('EC034', '2022-04-02 13:00:00', 'Sastifecho', '9', ''),
('EC035', '2022-04-02 13:00:00', 'Regular', '5', ''),
('EC036', '2022-04-02 13:00:00', 'Regular', '8', ''),
('EC037', '2022-04-02 13:00:00', 'Regular', '5', ''),
('EC038', '2022-04-02 13:00:00', 'Sastifecho', '8', ''),
('EC039', '2022-04-02 19:30:00', 'Regular', '5', ''),
('EC040', '2022-03-06 15:00:00', 'Sastifecho', '8', ''),
('EC041', '2022-03-06 15:00:00', 'Sastifecho', '8', ''),
('EC042', '2022-03-06 15:00:00', 'Sastifecho', '8', ''),
('EC043', '2022-04-02 13:00:00', 'Sastifecho', '8', ''),
('EC044', '2022-03-06 15:00:00', 'Sastifecho', '8', ''),
('EC045', '2022-03-06 15:00:00', 'Sastifecho', '8', ''),
('EC046', '2022-03-06 15:00:00', 'Sastifecho', '4', 'No me deja ver mi historial clÃ­nico'),
('EC047', '2022-03-06 15:00:00', 'Insastifecho', '4', 'Se demora al enviar'),
('EC048', '2022-03-06 15:00:00', 'Sastifecho', '5', ''),
('EC049', '2022-03-06 15:00:00', 'Regular', '5', ''),
('EC050', '2022-04-02 13:00:00', 'Insastifecho', '4', 'No hay muchos horarios disponibles para hacer la cita de manera online esta mejor hacerlo de manera presencial.'),
('EC051', '2022-03-06 15:00:00', 'Regular', '5', ''),
('EC052', '2022-03-06 15:00:00', 'Insastifecho', '3', ''),
('EC053', '2022-04-23 20:00:00', 'Regular', '5', 'normal'),
('EC054', '2022-04-12 19:00:00', 'Regular', '5', 'normal'),
('EC055', '2022-04-23 20:00:00', 'Regular', '5', 'normal'),
('EC056', '2022-04-23 20:00:00', 'Regular', '5', 'normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `Cod_Especialidad` char(5) NOT NULL DEFAULT '',
  `Nombre` varchar(30) DEFAULT NULL,
  `Precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`Cod_Especialidad`, `Nombre`, `Precio`) VALUES
('E0001', 'Ginecología', 95),
('E0002', 'Medicina General', 80),
('E0003', 'Pediatría', 85),
('E0004', 'Cardiología', 84),
('E0005', 'Neumología', 80),
('E0006', 'Cirugía General', 84);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `Cod_Historial` char(5) NOT NULL,
  `Cod_Paciente` char(5) NOT NULL,
  `Cod_Doctor` char(5) NOT NULL,
  `fecha` datetime NOT NULL,
  `Cod_Cita` char(5) NOT NULL,
  `Motivo` varchar(255) NOT NULL,
  `Estado` varchar(9) DEFAULT NULL,
  `Diagnostico` varchar(255) DEFAULT NULL,
  `Receta` varchar(255) DEFAULT NULL,
  `Tratamiento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`Cod_Historial`, `Cod_Paciente`, `Cod_Doctor`, `fecha`, `Cod_Cita`, `Motivo`, `Estado`, `Diagnostico`, `Receta`, `Tratamiento`) VALUES
('H0001', 'P0001', 'D0007', '2022-03-06 15:00:00', 'C0001', 'Primer chequeo medico para mi esposa.', 'Culminado', 'No hay ningun problema en el embarazo....', '', 'reposo'),
('H0002', 'P0009', 'D0008', '2022-04-12 19:00:00', 'C0002', 'personal', 'Pendiente', NULL, NULL, NULL),
('H0003', 'P0009', 'D0015', '2022-04-23 20:00:00', 'C0003', 'personal', 'Pendiente', NULL, NULL, NULL),
('H0004', 'P0009', 'D0015', '2022-04-23 20:00:00', 'C0004', 'personal', 'Pendiente', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `Cod_Paciente` char(5) NOT NULL DEFAULT '',
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Telefono` char(9) DEFAULT NULL,
  `Dni` char(8) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Contrasena` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`Cod_Paciente`, `Nombre`, `Apellido`, `Telefono`, `Dni`, `Correo`, `Contrasena`) VALUES
('P0001', 'Pedro', 'Sando', '966654321', '70612215', 'pedro@gmail.com', '12345'),
('P0002', 'Angel', 'Cordovas', '944741067', '70616655', 'angel@gmail.com', '70616655'),
('P0003', 'Rafael', 'Cardozo', '965256213', '70554412', 'rafael@gmail.com', '70554412'),
('P0004', 'Miguel', 'Mallqui', '988456789', '70662277', 'mg@gmail.com', '70662277'),
('P0005', 'Mikas', 'Mallqui', '988765432', '13342343', 'mikas@gmail.com', '13342343'),
('P0006', 'Maikol', 'Malasquez', '967564365', '70707016', 'maikol@gmail.com', '70707016'),
('P0007', 'Alfredo', 'Diaz', '956756456', '70626714', 'alfre@gmail.com', '12345'),
('P0008', 'Flor', 'Sandoval', '967567456', '70613325', 'flor@gmail.com', '12345'),
('P0009', 'Elisa', 'Perez', '986567455', '71723388', 'pelisa@yahoo.com', '1234'),
('P0010', 'miguel', 'sanchez', '12345678', '70612290', 'msan@gmail.com', '123'),
('P0011', 'Juan', 'ruin', '123345678', '71723380', 'a@gmail.com', '71723380');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Dni` char(8) NOT NULL,
  `Cod_Usuario` char(5) DEFAULT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Telefono` char(9) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Cargo` varchar(13) DEFAULT NULL,
  `Contrasena` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Dni`, `Cod_Usuario`, `Nombre`, `Apellido`, `Telefono`, `Correo`, `Cargo`, `Contrasena`) VALUES
('13342343', 'U0006', 'Mikas', 'Mallqui', '988765432', 'mikas@gmail.com', 'Paciente', '13342343'),
('70554412', 'U0004', 'Rafael', 'Cardozo', '965256213', 'rafael@gmail.com', 'Paciente', '70554412'),
('70612215', 'U0001', 'Pedro', 'Sandoval', '966654321', 'pedro@gmail.com', 'Paciente', '12345'),
('70612290', 'U0012', 'miguel', 'sanchez', '12345678', 'msan@gmail.com', 'Paciente', '123'),
('70612299', 'U0002', 'Marta', 'Flores', '966654321', 'marta@gmail.com', 'Administrador', '123'),
('70613325', 'U0009', 'Flor', 'Sandoval', '967567456', 'flor@gmail.com', 'Paciente', '12345'),
('70616655', 'U0003', 'Angel', 'Cordova', '944741067', 'angel@gmail.com', 'Paciente', '70616655'),
('70626714', 'U0008', 'Alfredo', 'Diaz', '956756456', 'alfre@gmail.com', 'Paciente', '12345'),
('70662277', 'U0005', 'Miguel', 'Mallqui', '988456789', 'mg@gmail.com', 'Paciente', '70662277'),
('70675615', 'U0010', 'Marcus', 'Romero Espinoza', '989785351', 'marcus@gmail.com', 'Administrador', '123'),
('70707016', 'U0007', 'Maikol', 'Malasquez', '967564365', 'maikol@gmail.com', 'Paciente', '70707016'),
('71723380', 'U0013', 'Juan', 'ruin', '123345678', 'a@gmail.com', 'Paciente', '71723380'),
('71723388', 'U0011', 'Elisa', 'Perez', '986567455', 'pelisa@yahoo.com', 'Paciente', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Cod_Administrador`),
  ADD KEY `Dni` (`Dni`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`Cod_Cita`),
  ADD KEY `Cod_Paciente` (`Cod_Paciente`);

--
-- Indices de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`Cod_Consultorio`);

--
-- Indices de la tabla `detalle_disponibilidad`
--
ALTER TABLE `detalle_disponibilidad`
  ADD PRIMARY KEY (`Cod_Detalle`);

--
-- Indices de la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD PRIMARY KEY (`Cod_Disponibilidad`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Cod_Doctor`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`Cod_Encuesta`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`Cod_Especialidad`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`Cod_Historial`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`Cod_Paciente`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Dni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
