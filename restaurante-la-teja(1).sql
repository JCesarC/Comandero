-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2021 a las 17:34:49
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante-la-teja`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `productos_id` varchar(255) NOT NULL,
  `cantidad_productos` varchar(255) NOT NULL,
  `creadedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updateAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `subtotal` varchar(255) NOT NULL,
  `productos` varchar(255) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `clienteId`, `nombre_cliente`, `productos_id`, `cantidad_productos`, `creadedAt`, `updateAt`, `subtotal`, `productos`, `total`) VALUES
(32, 44, 'Saul Gonzalez', '', '', '2021-07-06 10:09:30.182420', '2021-07-06 10:21:17.000000', '', '', 0),
(37, 51, 'Juan Manuel Gonzlez', '', '', '2021-07-07 09:56:16.383422', '2021-07-07 09:56:50.000000', '', '', 0),
(38, 53, 'Roberto Mendez', '', '', '2021-07-07 09:58:08.887317', '2021-07-07 09:58:34.000000', '', '', 0),
(39, 54, 'Lupita Montes Aguirre', '', '', '2021-07-07 09:59:12.668993', '2021-07-07 09:59:36.000000', '', '', 0),
(40, 55, 'Andres Perez', '', '', '2021-07-07 10:00:04.096044', '2021-07-07 10:00:41.000000', '', '', 0),
(41, 56, 'Jose Manuel Velazquez', '', '', '2021-07-07 10:01:21.418394', '2021-07-07 10:01:47.000000', '', '', 0),
(42, 57, 'Eduardo Gonzalez', '', '', '2021-07-07 10:46:45.929231', '2021-07-07 10:48:01.000000', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_usuarios`
--

CREATE TABLE `carrito_usuarios` (
  `id_session` varchar(500) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(1, 'Antojitos'),
(5, 'Aves'),
(4, 'Carnes'),
(11, 'Cocteles y licuados'),
(8, 'Comida preparada'),
(7, 'Hamburguesas'),
(3, 'Huevos'),
(10, 'Jarra de agua'),
(6, 'Mariscos'),
(13, 'PAQUETE_1'),
(14, 'PAQUETE_2'),
(15, 'PAQUETE_3'),
(12, 'Postres'),
(2, 'Sandwichs y tortas'),
(9, 'Sopas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `mesa` varchar(255) NOT NULL,
  `fecha_registro` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updateAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `username`, `mesa`, `fecha_registro`, `updateAt`) VALUES
(1, 'Julio Cesar', 'Julio', 'MESA-6', '2021-06-24 10:36:04.422107', '2021-07-03 11:08:28.000000'),
(3, 'Juan Gonzalez Gonzalez', 'Juan', 'MESA 5', '2021-06-25 12:18:06.178064', '2021-06-25 12:18:06.178064'),
(4, 'Julio Cantun', '', 'MESA 2', '2021-06-25 13:17:30.496204', '2021-06-25 13:17:30.496204'),
(5, 'Carlos Rodiguez Valencia', 'Carlos', 'MESA 6', '2021-06-25 13:28:39.437949', '2021-06-25 13:29:41.000000'),
(6, 'Acs Denis', 'Acs', 'MESA-5', '2021-06-27 09:24:08.390986', '2021-06-27 09:24:08.390986'),
(7, 'Andres Monte', 'Andres', 'MESA-5', '2021-06-27 09:24:52.050179', '2021-06-27 09:24:52.050179'),
(8, 'Juan Carlos Rize', 'Juan', 'MESA-5', '2021-06-27 11:08:31.470532', '2021-06-27 11:08:31.470532'),
(9, 'Carlos Arturo Gomez', 'Carlos', 'MESA-5', '2021-06-27 13:03:20.741566', '2021-06-27 13:03:20.741566'),
(10, 'Jose Luis Gomez', 'Jose', 'MESA-10', '2021-06-27 13:07:00.092442', '2021-06-27 13:07:00.092442'),
(11, 'Cesar Alexis', 'Cesar', 'MESA-6', '2021-06-27 13:08:44.687313', '2021-06-27 13:08:44.687313'),
(12, 'Carl Fernandez', 'Carl', 'MESA-6', '2021-06-27 13:11:51.213279', '2021-06-27 13:11:51.213279'),
(13, 'Andres Navarrro', 'Andres', 'MESA-7', '2021-06-27 17:31:03.850094', '2021-06-27 17:31:03.850094'),
(14, '', '', '', '2021-06-27 22:21:09.464351', '2021-06-27 22:21:09.464351'),
(15, 'Carlos Vazquez', 'Carlos', 'MESA-5', '2021-06-27 22:58:04.022784', '2021-06-27 22:58:04.022784'),
(16, 'Adrian Ramirez', 'Adrian', 'MESA-10', '2021-06-27 23:00:38.970214', '2021-06-27 23:00:38.970214'),
(17, 'Juan Manrque', 'Juan', 'MESA-11', '2021-06-27 23:01:39.519153', '2021-06-27 23:01:39.519153'),
(18, 'Juan Perez', 'Juan', 'MESA-4', '2021-06-28 07:30:27.677677', '2021-06-28 07:30:27.677677'),
(19, 'Ander Gonzales', 'Ander', 'MESA-8', '2021-06-28 07:42:41.306714', '2021-06-28 07:42:41.306714'),
(20, 'Robert Mandr', 'Robert', 'MESA-2', '2021-06-28 07:48:19.818099', '2021-06-28 07:48:19.818099'),
(21, 'Mendez Lopez', 'Mendez', 'MESA-5', '2021-06-28 08:59:11.736238', '2021-06-28 08:59:11.736238'),
(22, 'Juanito Perez', 'Juanito', 'MESA-4', '2021-06-28 10:08:50.686810', '2021-06-28 10:08:50.686810'),
(23, 'Cesar Martinez', 'Cesar', 'MESA-11', '2021-06-29 23:03:32.794373', '2021-06-29 23:03:32.794373'),
(24, 'Eduardo Gomez Vazquez', 'Eduardo', 'MESA-10', '2021-06-30 03:03:05.388624', '2021-06-30 03:03:05.388624'),
(25, 'Eduardo Martinez', 'Eduardo', 'MESA-5', '2021-06-30 03:05:02.830693', '2021-06-30 03:05:02.830693'),
(26, 'Cesar Gomez', 'Cesar', 'MESA-5', '2021-06-30 04:56:44.521508', '2021-06-30 04:56:44.521508'),
(27, 'Gustavo Angel Frio', 'Gustavo', 'MESA-10', '2021-06-30 09:32:58.938859', '2021-06-30 09:34:17.000000'),
(28, 'Alfredo Molina', 'Alfredo', 'MESA-10', '2021-06-30 14:53:47.049634', '2021-06-30 14:53:47.049634'),
(29, 'Eduardo Ramirez', 'Eduardo', 'MESA-11', '2021-06-30 18:23:20.818771', '2021-06-30 18:23:20.818771'),
(30, 'Mauro Perez', 'Mauro', 'MESA-2', '2021-06-30 18:34:46.007114', '2021-06-30 18:34:46.007114'),
(31, 'Juan Perez Perez', 'Juan', 'MESA-10', '2021-06-30 20:17:48.414067', '2021-06-30 20:17:48.414067'),
(32, 'Andres Robtertson', 'Andres', 'MESA-10', '2021-06-30 20:35:31.027128', '2021-06-30 20:35:31.027128'),
(33, 'Miguel Angel Rodri', 'Miguel', 'MESA-10', '2021-06-30 20:40:57.693816', '2021-06-30 20:40:57.693816'),
(34, 'Cesar Brein Tech', 'Cesar', 'MESA-11', '2021-06-30 22:02:19.501417', '2021-06-30 22:02:19.501417'),
(35, 'Leonel Hernandez', 'Leonel', 'MESA-9', '2021-07-01 15:07:23.868406', '2021-07-01 17:13:12.000000'),
(36, 'Manuel Perez Perez', 'Manuel', 'MESA-5', '2021-07-01 19:37:48.637678', '2021-07-01 19:37:48.637678'),
(37, 'Manuel Rodigruez', 'Manuel', 'MESA-6', '2021-07-01 20:41:35.662257', '2021-07-01 20:41:35.662257'),
(38, 'Armando Rodrigue', 'Armando', 'MESA-6', '2021-07-01 20:53:18.964666', '2021-07-01 20:53:18.964666'),
(39, 'Cliente Nuevo', 'Cliente', 'MESA-9', '2021-07-02 08:10:31.472846', '2021-07-05 13:18:43.000000'),
(40, 'Jose Carlos Fuentes', 'Jose', 'MESA-11', '2021-07-04 11:38:57.615644', '2021-07-04 11:38:57.615644'),
(41, 'Cliente Nuevo', 'Cliente', '', '2021-07-04 22:32:00.552241', '2021-07-04 22:32:00.552241'),
(42, '', '', '', '2021-07-04 23:32:14.299814', '2021-07-04 23:32:14.299814'),
(43, 'Eduardo Coronado', 'Eduardo', 'MESA-10', '2021-07-05 14:06:44.098631', '2021-07-07 09:41:15.000000'),
(44, 'Saul Gonzalez', 'Saul', 'MESA-10', '2021-07-06 10:09:29.979914', '2021-07-06 10:09:29.979914'),
(45, 'Julio Cesar Cantun', 'Julio', 'MESA-7', '2021-07-06 11:21:57.423716', '2021-07-06 11:21:57.423716'),
(46, 'CesarCesar', 'CesarCesar', 'MESA-9', '2021-07-06 12:03:15.223377', '2021-07-06 12:03:15.223377'),
(47, '', '', '', '2021-07-06 20:27:30.057685', '2021-07-06 20:27:30.057685'),
(48, 'Gustavo ', 'Gustavo', '', '2021-07-06 20:27:58.327949', '2021-07-06 20:27:58.327949'),
(49, 'Gustavo Sagrero', 'Gustavo', 'MESA-10', '2021-07-06 20:28:19.265672', '2021-07-06 20:28:19.265672'),
(50, 'Carlos Gonzalez', 'Carlos', 'MESA-10', '2021-07-07 07:33:16.628028', '2021-07-07 07:33:16.628028'),
(51, 'Juan Manuel Gonzlez', 'Juan', 'MESA-4', '2021-07-07 09:56:16.191780', '2021-07-07 09:56:16.191780'),
(52, 'Roberto ', 'Roberto', '', '2021-07-07 09:57:55.882870', '2021-07-07 09:57:55.882870'),
(53, 'Roberto Mendez', 'Roberto', 'MESA-11', '2021-07-07 09:58:08.713633', '2021-07-07 09:58:08.713633'),
(54, 'Lupita Montes Aguirre', 'Lupita', 'MESA-5', '2021-07-07 09:59:12.531683', '2021-07-07 09:59:12.531683'),
(55, 'Andres Perez', 'Andres', 'MESA-8', '2021-07-07 10:00:03.922487', '2021-07-07 10:00:03.922487'),
(56, 'Jose Manuel Velazquez', 'Jose', 'MESA-8', '2021-07-07 10:01:21.252871', '2021-07-07 10:01:21.252871'),
(57, 'Eduardo Gonzalez', 'Eduardo', 'MESA-9', '2021-07-07 10:46:45.634114', '2021-07-07 10:46:45.634114');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientess`
--

CREATE TABLE `clientess` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `user` varchar(12) NOT NULL,
  `mesa` varchar(15) NOT NULL,
  `fecha-registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientess`
--

INSERT INTO `clientess` (`id`, `nombre`, `user`, `mesa`, `fecha-registro`) VALUES
(1, 'Julio Cesar', 'Julio', 'mesa2', '2021-06-07 15:12:00'),
(2, 'Juan Manuel ', 'Juan', 'mesa1', '2021-06-07 15:17:48'),
(3, 'Juan Carlos', 'Juan', 'mesa2', '2021-06-07 15:50:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `mesa` varchar(255) NOT NULL,
  `productos` varchar(255) NOT NULL,
  `cantidad_productos` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updateAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `subtotal_productos` varchar(255) NOT NULL,
  `clienteId` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `nombre_cliente`, `mesa`, `productos`, `cantidad_productos`, `estado`, `createdAt`, `updateAt`, `subtotal_productos`, `clienteId`, `total`, `fecha`, `hora`) VALUES
(47, 'Saul Gonzalez', 'MESA-8', 'Enfrijoladas (Queso o Pollo),Tostadas de pollo(3),Hamburguesa Mixta c/papas,Cecina sencilla', '1,1,1,1,', 'PENDIENTE', '2021-07-06 10:15:09.351517', '2021-07-07 09:52:24.301378', '65,65,80,110', 44, 320, '6-7-2021', '10:15:9'),
(48, 'Saul Gonzalez', 'MESA-10', 'Bistec a la Mexicana,Pollo frito con papas,Pechuga a la plancha,Hamburguesa Doble c/papas', '1,1,1,1,', 'CONFIRMADA', '2021-07-06 10:21:16.975912', '2021-07-06 12:55:42.000000', '80,90,100,90', 44, 360, '6-7-2021', '10:21:16'),
(50, 'Juan Manuel Gonzlez', 'MESA-4', 'Chilaquiles Verdes o Rojos,Jugo de Naranja,Pechuga a la plancha,Hamburguesa sencilla con papas', '1,1,1,1,', 'CONFIRMADA', '2021-07-07 09:56:49.811436', '2021-07-07 10:02:41.000000', '70,30,100,60', 51, 260, '7-7-2021', '9:56:49'),
(51, 'Roberto Mendez', 'MESA-11', 'Tacos dorados de pollo,Machaca con huevo,Bistec a la Mexicana', '1,1,1,', 'PENDIENTE', '2021-07-07 09:58:34.140604', '2021-07-07 09:58:34.140604', '65,80,80', 53, 225, '7-7-2021', '9:58:34'),
(52, 'Lupita Montes Aguirre', 'MESA-5', 'Enfrijoladas (Queso o Pollo),Coctel de frutas,Naranja 2L', '1,1,1,', 'PENDIENTE', '2021-07-07 09:59:36.575939', '2021-07-07 09:59:36.575939', '65,50,60', 54, 175, '7-7-2021', '9:59:36'),
(53, 'Andres Perez', 'MESA-8', 'Enchiladas de mole (Queso o Pollo),Puerco Adobado,Chile Relleno de QUeso,Omelet', '1,1,1,1,', 'PENDIENTE', '2021-07-07 10:00:41.657585', '2021-07-07 10:00:41.657585', '65,65,65,80', 55, 275, '7-7-2021', '10:0:41'),
(55, 'Eduardo Gonzalez', 'MESA-9', 'Burritas o Quesadillas,Pollo frito con papas', '1,1,', 'CONFIRMADA', '2021-07-07 10:48:01.573017', '2021-07-07 10:49:46.000000', '70,90', 57, 160, '7-7-2021', '10:48:1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordeness`
--

CREATE TABLE `ordeness` (
  `id` int(11) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `mesa` varchar(30) NOT NULL,
  `orden-folio` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `fecha-creacion` date NOT NULL DEFAULT current_timestamp(),
  `producto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordeness`
--

INSERT INTO `ordeness` (`id`, `cliente`, `mesa`, `orden-folio`, `subtotal`, `estado`, `fecha-creacion`, `producto`) VALUES
(1, 'Juan Gonzalez', 'Mesa 2', 1, 225, 'Confirmada', '0000-00-00', 'LISTADO PRODUCTOS'),
(2, 'Jose Carlos', 'Mesa 4', 2, 355, 'Confirmada', '0000-00-00', 'LISTADO PRODUCTOS'),
(3, 'Arturo Vazquez', 'Mesa 1', 3, 525, 'PENDIENTE', '0000-00-00', 'Listado productos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `categoriaDescripcion` varchar(255) NOT NULL,
  `categoriaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `descripcion`, `precio`, `cantidad`, `categoriaDescripcion`, `categoriaId`) VALUES
(4, 'Milanesa con papas', '100.00', 1, 'Carnes', 4),
(7, 'Pan de cazón', '150.00', 1, 'Mariscos', 6),
(8, 'Enfrijoladas (Queso o Pollo)', '65.00', 1, 'Antojitos', 1),
(9, 'Entomatadas(Queso o Pollo)', '65.00', 1, 'Antojitos', 1),
(10, 'Enchiladas de mole (Queso o Pollo)', '65.00', 1, 'Antojitos', 1),
(11, 'Burritas o Quesadillas', '70.00', 1, 'Antojitos', 1),
(12, 'Chilaquiles Verdes o Rojos', '70.00', 1, 'Antojitos', 1),
(13, 'Tacos dorados de pollo', '65.00', 1, 'Antojitos', 1),
(14, 'Tostadas de pollo(3)', '65.00', 1, 'Antojitos', 1),
(16, 'Sándwich de pollo', '35.00', 1, 'Sandwichs y tortas', 2),
(17, 'Sándwich de Jamón y Queso', '30.00', 1, 'Sandwichs y tortas', 2),
(18, 'Sándwich Mixto', '40.00', 1, 'Sandwichs y tortas', 2),
(19, 'Sándiwch Club Especial', '80.00', 1, 'Sandwichs y tortas', 2),
(20, 'Torta de Milanesa', '40.00', 1, 'Sandwichs y tortas', 2),
(21, 'Huevos Motuleños', '80.00', 1, 'Huevos', 3),
(22, 'Huevos al gusto (Jamón, Mexicana, salchicha, Tocino)', '60.00', 1, 'Huevos', 3),
(23, 'Omelet', '80.00', 1, 'Huevos', 3),
(24, 'Machaca con huevo', '80.00', 1, 'Huevos', 3),
(26, 'Filete al albañil', '80.00', 1, 'Carnes', 4),
(27, 'Bistec a la Mexicana', '80.00', 1, 'Carnes', 4),
(28, 'Bistec frito con papas', '100.00', 1, 'Carnes', 4),
(29, 'Bistec a la tampiqueña', '100.00', 1, 'Carnes', 4),
(30, 'Bistec Ranchero', '100.00', 1, 'Carnes', 4),
(31, 'Cecina con enchiladas', '140.00', 1, 'Carnes', 4),
(32, 'Cecina sencilla', '110.00', 1, 'Carnes', 4),
(33, 'Arrachera Marinada', '120.00', 1, 'Carnes', 4),
(34, 'Pollo frito con papas', '90.00', 1, 'Aves', 5),
(35, 'Pechuga rellena de jamón y queso', '130.00', 1, 'Aves', 5),
(36, 'Pechuga empanizada', '100.00', 1, 'Aves', 5),
(37, 'Pechuga a la plancha', '100.00', 1, 'Aves', 5),
(38, 'Pescado Frito, al mojo de ajo, etc.', '110.00', 1, 'Mariscos', 6),
(39, 'Empanizado', '110.00', 1, 'Mariscos', 6),
(40, 'A la veracruzana', '130.00', 1, 'Mariscos', 6),
(42, 'Hamburguesa sencilla con papas', '60.00', 1, 'Hamburguesas', 7),
(43, 'Hamburguesa Hawaiana con papas', '70.00', 1, 'Hamburguesas', 7),
(44, 'Hamburguesa c/tocino c/papas', '70.00', 1, 'Hamburguesas', 7),
(45, 'Hamburguesa Mixta c/papas', '80.00', 1, 'Hamburguesas', 7),
(46, 'Hamburguesa Doble c/papas', '90.00', 1, 'Hamburguesas', 7),
(47, 'Chile Relleno de QUeso', '65.00', 1, 'Comida preparada', 8),
(48, 'Albóndigas en chipotle', '65.00', 1, 'Comida preparada', 8),
(49, 'Albóndigas con Fideos', '65.00', 1, 'Comida preparada', 8),
(50, 'Puerco Adobado', '65.00', 1, 'Comida preparada', 8),
(51, 'Puerco en chipotle', '65.00', 1, 'Comida preparada', 8),
(52, 'Pollo en salsa verde', '65.00', 1, 'Comida preparada', 8),
(53, 'Pollo adobado', '65.00', 1, 'Comida preparada', 8),
(54, 'Caldo de Res con Verduras', '70.00', 1, 'Comida preparada', 8),
(55, 'Carne de res adobada', '70.00', 1, 'Comida preparada', 8),
(56, 'Mondongo', '70.00', 1, 'Comida preparada', 8),
(57, 'Barbacoa de Res', '70.00', 1, 'Comida preparada', 8),
(58, 'Sopa aguada', '35.00', 1, 'Sopas', 9),
(59, 'Sopa de verduras', '35.00', 1, 'Sopas', 9),
(60, 'Consomé de pollo', '35.00', 1, 'Sopas', 9),
(61, 'Espagueti', '45.00', 1, 'Sopas', 9),
(62, 'Arroz', '35.00', 1, 'Sopas', 9),
(63, 'Coctel de frutas', '50.00', 1, 'Cocteles y licuados', 11),
(64, 'Leche fría o caliente', '30.00', 1, 'Cocteles y licuados', 11),
(65, 'Licuado de Melón', '35.00', 1, 'Cocteles y licuados', 11),
(66, 'Licuado de Papaya', '35.00', 1, 'Cocteles y licuados', 11),
(67, 'Licuado de Plátano', '35.00', 1, 'Cocteles y licuados', 11),
(68, 'Licuado de Choco Milk', '35.00', 1, 'Cocteles y licuados', 11),
(69, 'Licuado de fresas', '35.00', 1, 'Cocteles y licuados', 11),
(70, 'Licuado de Avena', '35.00', 1, 'Cocteles y licuados', 11),
(71, 'Jugo de Naranja', '30.00', 1, 'Cocteles y licuados', 11),
(72, 'Jugo de naranja con piña o papaya', '30.00', 1, 'Cocteles y licuados', 11),
(73, 'Licuado mixto', '40.00', 1, 'Cocteles y licuados', 11),
(74, 'Naranja 2L', '60.00', 1, 'Jarra de agua', 10),
(75, 'Sandia', '60.00', 1, 'Jarra de agua', 10),
(76, 'Papaya', '60.00', 1, 'Jarra de agua', 10),
(77, 'Piña', '60.00', 1, 'Jarra de agua', 10),
(78, 'Melón', '60.00', 1, 'Jarra de agua', 10),
(79, 'Limón', '60.00', 1, 'Jarra de agua', 10),
(80, 'Horchata de arroz', '60.00', 1, 'Jarra de agua', 10),
(81, 'Jamaica', '60.00', 1, 'Jarra de agua', 10),
(82, 'Té', '60.00', 1, 'Jarra de agua', 10),
(83, 'Medias jarras 1L', '40.00', 1, 'Jarra de agua', 10),
(84, 'Vasos de aguas de frutas', '25.00', 1, 'Jarra de agua', 10),
(85, 'Jara 2L Agua mineralizada', '90.00', 1, 'Jarra de agua', 10),
(86, 'Media jarra 1L con Agua Mineralizada', '60.00', 1, 'Jarra de agua', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID` int(160) NOT NULL,
  `Descripcion` varchar(60) NOT NULL,
  `Categoria` varchar(30) NOT NULL,
  `Precio` int(10) NOT NULL,
  `Cantidad` int(10) NOT NULL,
  `Mas_Vendido` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID`, `Descripcion`, `Categoria`, `Precio`, `Cantidad`, `Mas_Vendido`) VALUES
(1, 'Enfrijoladas (Queso)', 'Antojitos', 65, 1, 0),
(2, 'Enfrijoladas (Pollo)', 'Antojitos', 65, 1, 0),
(3, 'Entomatadas (Queso)', 'Antojitos', 65, 1, 0),
(4, 'Entomatadas (Pollo)', 'Antojitos', 65, 1, 0),
(5, 'Quesadillas (Burritas)', 'Antojitos', 70, 4, 0),
(6, 'Chilaquiles Verdes', 'Antojitos', 70, 1, 0),
(7, 'Chilaquiles Rojos', 'Antojitos', 70, 1, 1),
(8, 'Tacos dorados de pollo', 'Antojitos', 65, 4, 0),
(9, 'Tostadas de pollo ', 'Antojitos', 65, 3, 0),
(10, 'Sándwich de pollo', 'Sandwich Y Tortas', 35, 1, 0),
(11, 'Sándwich de Jamón y Queso', 'Sándwich Y Tortas', 30, 1, 0),
(12, 'Sándwich Mixto', 'Sándwich Y Tortas', 40, 1, 0),
(13, 'Sándwich Club Especial', 'Sándwich Y Tortas', 80, 1, 1),
(14, 'Torta de Milanesa', 'Sándwich Y Tortas', 40, 1, 0),
(15, 'Huevos Motuleños ', 'Huevos', 80, 1, 1),
(16, 'Huevos con jamón ', 'Huevos', 60, 1, 0),
(17, 'Huevos a la mexicana ', 'Huevos', 60, 1, 0),
(18, 'Huevos con salchicha', 'Huevos', 60, 1, 0),
(19, 'Huevos con tocino', 'Huevos', 60, 1, 0),
(20, 'Homelet', 'Huevos', 80, 1, 0),
(21, 'Machaca con huevo', 'Huevos', 80, 1, 0),
(22, 'Milanesa con papas', 'Carnes ', 100, 1, 0),
(23, 'Filete de albañil ', 'Carnes', 80, 1, 0),
(24, 'Bistec a la Mexicana ', 'Carnes ', 80, 1, 1),
(25, 'Bistec frito con papas  ', 'Carnes', 100, 1, 0),
(26, 'Bistec a la tampiqueña', 'Carnes ', 140, 1, 0),
(27, 'Cecina sencilla', 'Carnes ', 110, 1, 0),
(28, 'Bistec Ranchero', 'Carnes', 100, 1, 0),
(29, 'Cecina con enchiladas ', 'Carnes', 140, 1, 0),
(30, 'Arrachera Marinada', 'Carnes', 120, 1, 0),
(31, 'Chuletas de cerdo asadas', 'Carnes ', 100, 1, 0),
(32, 'Parrillada (2 personas en adel', 'Carnes', 150, 1, 0),
(33, 'Pollo frito con papas ', 'Aves', 90, 1, 0),
(34, 'Pechuga rellena de jamón y que', 'Aves', 130, 1, 0),
(35, 'Pechuga empanizada ', 'Aves', 100, 1, 0),
(36, 'Pechuga a la plancha', 'Aves', 100, 1, 0),
(37, 'Filete de pescado a Ia plancha', 'Mariscos', 110, 1, 0),
(38, 'Filete de pescado al mojo de ajo', 'Mariscos', 110, 1, 0),
(39, 'Filete de pescado empanizado', 'Mariscos', 110, 1, 0),
(40, 'Filete de pescado a la Veracruzana', 'Mariscos', 130, 1, 0),
(41, 'Pan de cazón', 'Mariscos', 150, 1, 0),
(42, 'Sopa de mariscos ', 'Mariscos', 120, 1, 1),
(43, ' Copa Grande (Camarón)', 'Mariscos', 110, 1, 0),
(44, 'Copa chica (Camarón)', 'Mariscos', 80, 1, 0),
(45, 'Camarón Chico : (Al mojo de Ajo)', 'Mariscos', 130, 0, 0),
(46, 'Camarón Chico : (A Ia diabla)', 'Mariscos', 130, 0, 0),
(47, 'Camarón Chico : (Ensalada)', 'Mariscos', 130, 1, 0),
(48, 'Camarón Chico : (A Ia Mexicana)', 'Mariscos', 130, 1, 0),
(49, 'Camarón Chico : (En Caldo)', 'Mariscos', 130, 1, 0),
(50, 'Camarón Grande : (Al mojo de ajo)', 'Mariscos', 150, 1, 0),
(51, 'Camarón Grande : (A la diabla)', 'Mariscos', 150, 1, 0),
(52, 'Camarón Grande : (Empanizado)', 'Mariscos', 150, 1, 0),
(53, 'Camarón Grande : (Al coco)', 'Mariscos', 150, 1, 0),
(54, 'Hamburguesas sencilla con papas', 'Hamburguesas', 60, 1, 0),
(55, 'Hamburguesas Hawaiana con papas', 'Hamburguesas', 70, 1, 0),
(56, 'Hamburguesa con tocino y papas ', 'Hamburguesas', 70, 1, 0),
(57, 'Hamburguesa mixta con papas', 'Hamburguesas', 80, 1, 0),
(58, 'Hamburguesa doble con papas', 'Hamburguesas', 90, 1, 1),
(59, 'Chile relleno de queso ', 'Comida preparada ', 65, 1, 1),
(60, 'Albóndiga en chipotle', 'Comida preparada ', 65, 1, 0),
(61, 'Albóndigas con fideos ', 'Comida preparada ', 65, 1, 0),
(62, 'Puerco Adobado', 'Comida preparada ', 65, 1, 0),
(63, 'Puerco en Chipotle', 'Comida preparada ', 65, 1, 0),
(64, 'Pozole', 'Comida preparada ', 65, 1, 0),
(65, 'Pollo en salsa en verde ', 'Comida preparada ', 65, 1, 0),
(66, 'Pollo adobado ', 'Comida preparada ', 65, 1, 0),
(67, 'Caldo de res con verdura ', 'Comida preparada ', 70, 1, 0),
(68, 'Carne de res adobada', 'Comida preparada ', 70, 1, 0),
(69, 'Mondongo ', 'Comida preparada ', 70, 1, 0),
(70, 'Barbacoa de res ', 'Comida preparada ', 70, 1, 0),
(71, 'Sopa aguada', 'Sopas', 35, 1, 0),
(72, 'Sopa de verduras', 'Sopas', 35, 1, 0),
(73, 'Consomé de pollo ', 'Sopas', 35, 1, 1),
(74, 'Espagueti', 'Sopas', 45, 1, 0),
(75, 'Arroz ', 'Sopas', 35, 1, 0),
(76, 'Naranja (2L)', 'Jarra de agua', 60, 1, 1),
(77, 'Sandia', 'Jarra de agua', 60, 1, 0),
(78, 'Papaya', 'Jarra de agua', 60, 1, 0),
(79, 'Piña', 'Jarra de agua', 60, 1, 0),
(80, 'Melón', 'Jarra de agua', 60, 1, 0),
(81, 'Limón', 'Jarra de agua', 60, 1, 0),
(82, 'Horchata de arroz', 'Jarra de agua', 60, 1, 0),
(83, 'Jamaica', 'Jarra de agua', 60, 1, 0),
(84, 'Té', 'Jarra de agua', 60, 1, 0),
(85, 'Media Jarras (1L)', 'Jarra de agua', 40, 1, 0),
(86, 'Vaso de aguas de frutas', 'Jarra de agua', 25, 1, 0),
(87, 'Jarra (2L) Agua Mineralizada', 'Jarra de agua', 90, 1, 0),
(88, 'Medias Jarras (1L) Agua mineralizada', 'Jarra de agua', 60, 1, 0),
(89, 'Coctel de frutas', 'Cocteles y licuados ', 50, 1, 0),
(90, 'Leche fría o caliente ', 'Cocteles y licuados ', 30, 1, 0),
(91, 'Licuado de melón', 'Cocteles y licuados ', 35, 1, 0),
(92, 'Licuado de papaya', 'Cocteles y licuados ', 35, 1, 0),
(93, 'Licuado de plátano ', 'Cocteles y licuados ', 35, 1, 1),
(94, 'Licuado de Choco Milk', 'Cocteles y licuados ', 35, 1, 0),
(95, 'Licuado de fresas', 'Cocteles y licuados ', 35, 1, 0),
(96, 'Licuado de avena', 'Cocteles y licuados ', 35, 1, 0),
(97, 'Jugo de naranja con piña', 'Cocteles y licuados ', 30, 1, 0),
(98, 'Jugo de naranja con papaya ', 'Cocteles y licuados ', 30, 1, 0),
(99, 'Licuado mixto', 'Cocteles y licuados ', 40, 1, 0),
(100, 'Hot Cakes ', 'Postres', 55, 1, 0),
(101, 'Wafles', 'Postres', 55, 1, 0),
(102, 'Corn Flakes con platano ', 'Postres', 55, 1, 0),
(103, 'Pan tostado con mermelada ', 'Postres', 30, 1, 0),
(104, 'Gelatina y flanes', 'Postres', 15, 1, 1),
(105, 'Platanos fritos', 'Postres', 40, 1, 0),
(106, 'Queso napolitano ', 'Postres', 30, 1, 0),
(107, '1 jugo 1 coctel de frutas 1 orden de huevos con tocino', 'PAQUETE#1', 80, 1, 0),
(108, '1 jugo 1 coctel de frutas 1 orden de huevos con jamón', 'PAQUETE #1', 80, 1, 0),
(109, '1 jugo 1 coctel de frutas 1 orden de huevos con mexicana', 'PAQUETE #1', 80, 1, 0),
(110, '1 jugo 1 coctel de frutas 1 orden de huevos con salchicha', 'PAQUETE #1', 80, 1, 0),
(111, '1 jugo 1 coctel de frutas 1 orden de huevos rancheros', 'PAQUETE #1', 80, 1, 0),
(112, '1 Jugo 1 Coctel de frutas 1 orden de bistec al albañil ', 'PAQUETE#2', 100, 1, 0),
(113, '1 Café 1 Coctel de frutas 1 orden de bistec al albañil ', 'PAQUETE #2', 100, 1, 0),
(114, '1 Jugo 1 Coctel de frutas 1 orden de bistec a la mexicana', 'PAQUETE #2', 100, 1, 0),
(115, '1 Café 1 Coctel de frutas 1 orden de bistec a la mexicana ', 'PAQUETE #2', 100, 1, 0),
(116, '1 Jugo 1 Coctel de frutas 1 orden de pan tostado', 'PAQUETE#3', 60, 1, 0),
(117, '1 Café 1 Coctel de frutas 1 orden de pan tostado ', 'PAQUETE #3', 60, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updateAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`, `createdAt`, `updateAt`) VALUES
(1, 'JCEEES', '12345678', 'admin', '2021-06-15 07:56:03.294585', '2021-06-15 08:00:42.000000'),
(6, 'jcesar3', '12345678', 'cliente', '2021-06-15 07:59:14.712574', '2021-06-15 17:08:07.429344'),
(7, 'CesarCesar', '$2a$10$ANRR5rDMmNG0fULATVaYyuIwvlzs0AVOM1uUs7utP7OESO4MKlFwe', 'admin', '2021-06-15 08:15:02.352174', '2021-06-15 08:15:02.352174'),
(8, 'Cesar2', '$2a$10$NzIRF.O43DLRf2Meehty7eBqGgC8GOJcIxFZZDqBPl6WE/NueVKWK', 'cliente', '2021-06-15 16:44:35.683972', '2021-06-15 17:10:02.519482'),
(9, 'Cesar Admin', '$2a$10$90jRhnl732vsXEF9puf.TeMG49e79Wy2r2q7RDM2OObl3XIC2C24S', 'cliente', '2021-06-15 17:11:35.486668', '2021-06-15 17:29:34.000000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REL_22bb2eb32ee7fe44e1be66d66f` (`clienteId`);

--
-- Indices de la tabla `carrito_usuarios`
--
ALTER TABLE `carrito_usuarios`
  ADD KEY `e` (`id_producto`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_de7bbfecf49fe5fc3a6134525b` (`descripcion`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientess`
--
ALTER TABLE `clientess`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordeness`
--
ALTER TABLE `ordeness`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_3642f9f12d640fc00ad690f77c` (`descripcion`),
  ADD KEY `FK_6465b0476dcfd393c4808d53b95` (`categoriaId`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_78a916df40e02a9deb1c4b75ed` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `clientess`
--
ALTER TABLE `clientess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `ordeness`
--
ALTER TABLE `ordeness`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID` int(160) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `FK_22bb2eb32ee7fe44e1be66d66fa` FOREIGN KEY (`clienteId`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carrito_usuarios`
--
ALTER TABLE `carrito_usuarios`
  ADD CONSTRAINT `e` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`ID`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_6465b0476dcfd393c4808d53b95` FOREIGN KEY (`categoriaId`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
