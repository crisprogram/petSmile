-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2022 a las 22:42:48
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tiendavirtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
(1, 'Accesorios', 'Diviertete con el integrante más peludo del hogar', 'img_1a8cac96c30e6dff1aa727435ad01847.jpg', '2021-08-20 03:04:04', 'snacks', 1),
(2, 'Gromming y belleza', 'Quiere a tu mascota', 'img_6717d9655ac6468ea46642062ab9166f.jpg', '2021-08-21 00:47:10', 'comida-seca', 1),
(3, 'Comida Humeda', 'Regalele un buen alimento humedo para ofrecerle mas proteinas', 'img_4b79e6fd4ccb029cd9d981b585d27316.jpg', '2022-06-04 14:41:28', 'comida-humeda', 1),
(4, 'Comida Seca', 'Alimento seco para tu mascota', 'img_119bcb4ceaae6eb68ac175b7d4086f12.jpg', '2022-06-04 14:47:41', 'accesorios', 1),
(5, 'Medicamentos', 'Cuida a tu mascota', 'img_5b713381476066a792c278ea9cc2ff31.jpg', '2022-06-04 14:54:43', 'medicamentos', 1),
(6, 'Servicios', 'Quiere a tu mascota', 'img_3edb207e5bafa3ed0453ee534dd4cbd6.jpg', '2022-06-04 15:00:39', 'gromming-y-belleza', 1),
(7, 'Snacks', 'Alimenta de manera divertida a tu mascota snacks', 'img_289e0aef59e0b2a938c589d0952925dd.jpg', '2022-08-20 23:12:26', 'snacks', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `mensaje` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_swedish_ci NOT NULL,
  `dispositivo` varchar(25) COLLATE utf8mb4_swedish_ci NOT NULL,
  `useragent` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`, `ip`, `dispositivo`, `useragent`, `datecreated`) VALUES
(1, 'Fernando Herrera', 'toolsfordeveloper@gmail.com', 'Mensaje del primer suscriptor!', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', '2021-08-20 04:06:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` bigint(20) NOT NULL,
  `personaid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `transaccionid` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `idmascota` bigint(20) NOT NULL,
  `idpersona` bigint(20) NOT NULL,
  `nombremascota` varchar(50) NOT NULL,
  `edadmascota` varchar(50) NOT NULL,
  `colormascota` varchar(50) NOT NULL,
  `tamañomascota` varchar(50) NOT NULL,
  `razamascota` varchar(50) NOT NULL,
  `tipomascota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `idmodulo` bigint(20) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes de tienda', 1),
(4, 'Productos', 'Todos los productos', 1),
(5, 'Pedidos', 'Pedidos', 1),
(6, 'Caterogías', 'Caterogías Productos', 1),
(7, 'Suscriptores', 'Suscriptores del sitio web', 1),
(8, 'Contactos', 'Mensajes del formulario contacto', 1),
(9, 'Páginas', 'Páginas del sitio web', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` bigint(20) NOT NULL,
  `referenciacobro` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datospaypal` text COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `costo_envio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL,
  `direccion_envio` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` bigint(20) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(3, 1, 1, 1, 1, 1, 1),
(4, 1, 2, 1, 1, 1, 1),
(5, 1, 3, 1, 1, 1, 1),
(6, 1, 4, 1, 1, 1, 1),
(7, 1, 5, 1, 1, 1, 1),
(8, 1, 6, 1, 1, 1, 1),
(9, 1, 7, 1, 1, 1, 1),
(10, 1, 8, 1, 1, 1, 1),
(11, 1, 9, 1, 1, 1, 1),
(12, 2, 1, 1, 1, 1, 1),
(13, 2, 2, 0, 0, 0, 0),
(14, 2, 3, 1, 1, 1, 0),
(15, 2, 4, 1, 1, 1, 0),
(16, 2, 5, 1, 1, 1, 0),
(17, 2, 6, 1, 1, 1, 0),
(18, 2, 7, 1, 0, 0, 0),
(19, 2, 8, 1, 0, 0, 0),
(20, 2, 9, 1, 1, 1, 1),
(21, 3, 1, 0, 0, 0, 0),
(22, 3, 2, 0, 0, 0, 0),
(23, 3, 3, 0, 0, 0, 0),
(24, 3, 4, 0, 0, 0, 0),
(25, 3, 5, 1, 0, 0, 0),
(26, 3, 6, 0, 0, 0, 0),
(27, 3, 7, 0, 0, 0, 0),
(28, 3, 8, 0, 0, 0, 0),
(29, 3, 9, 0, 0, 0, 0),
(30, 4, 1, 1, 0, 0, 0),
(31, 4, 2, 0, 0, 0, 0),
(32, 4, 3, 1, 1, 1, 0),
(33, 4, 4, 1, 0, 0, 0),
(34, 4, 5, 1, 0, 1, 0),
(35, 4, 6, 0, 0, 0, 0),
(36, 4, 7, 1, 0, 0, 0),
(37, 4, 8, 1, 0, 0, 0),
(38, 4, 9, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` bigint(20) NOT NULL,
  `identificacion` varchar(30) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombres` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombrefiscal` varchar(80) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `direccionfiscal` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `token` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1,
  `idmascota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`, `idmascota`) VALUES
(1, '1019111896', 'Admi', 'Admin', 3108801523, 'admin@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'CF', 'Abel OSH', 'Ciudad', '', 1, '2021-08-20 01:34:15', 1, 0),
(2, '1019111896', 'Carlos Eduardo', 'Muñoz Niño', 3108801523, 'caed025@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, NULL, NULL, 1, '2021-08-20 02:58:47', 1, 0),
(3, '84654864', 'Alejandro', 'Ayala', 4687987, 'ayala@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '468798', 'Ricardo HP', 'Ciudad de Guatemala', NULL, 1, '2021-08-20 03:41:28', 1, 0),
(4, '1000383819', 'Cristian', 'Mendez', 6900900, 'c.david.m2001@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, NULL, '', 1, '2021-08-21 18:07:00', 1, 0),
(6, '1005825283', 'Ingri', 'Tique Ñustes', 3014155161, 'ingridnustes22@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, NULL, NULL, 1, '2022-06-24 09:18:39', 1, 0),
(7, '1000180841', 'Inge', 'Gonzito', 3138190927, 'rozo.juan010703@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', NULL, NULL, NULL, NULL, 1, '2022-06-24 14:38:41', 1, 0),
(8, '1', 'Camilo', 'Moya', 3214411705, 'notiene@gmail.com', 'd19e9b2ec7200928cbc659646a0aa1251d293687b04b8606cc9c8344ca5025e2', '3214411705', 'Perro', 'Max performance raza grandes y medianas', NULL, 3, '2022-08-21 13:22:11', 1, 0),
(9, NULL, 'Luz Eugenia', 'Palacios', 3026144283, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 13:45:17', 1, 0),
(10, NULL, 'Maicol', 'Rodriguez', 3005995133, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 13:46:22', 1, 0),
(11, NULL, 'Alberto', '', 3164947209, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:06:44', 1, 0),
(12, NULL, 'Mariana', '', 3123005946, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:11:33', 1, 0),
(13, NULL, 'Xochilt', '', 312449766, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:24:40', 1, 0),
(14, NULL, 'Noemi', '', 3057240207, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:25:19', 1, 0),
(15, NULL, 'Gina', '', 3118105710, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:25:58', 1, 0),
(16, NULL, 'Lupita', '', 3134099781, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:26:45', 1, 0),
(17, NULL, 'Mariana', 'Bermudez', 3185570409, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:27:20', 1, 0),
(18, NULL, 'Dolly', '', 3195865313, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:30:31', 1, 0),
(19, NULL, 'Blanca', '', 3125090097, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:30:31', 1, 0),
(20, NULL, 'Sandra', 'Beltran', 3112843462, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:30:31', 1, 0),
(21, NULL, 'Natalia', '', 3208923845, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:31:55', 1, 0),
(22, NULL, 'Andrea', '', 3123928799, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 14:32:51', 1, 0),
(23, NULL, 'Isabella', '', 3152140153, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(24, NULL, 'Clemencia', '', 3142498199, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(25, NULL, 'Maria', '', 3203193770, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(26, NULL, 'Johana', '', 3118488385, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(27, NULL, 'Jorge', '', 3025827198, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(28, NULL, 'Tatiana', '', 3102755349, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(29, NULL, 'Maria', '', 3194323330, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(30, NULL, 'Maria Fernanda', '', 3023657443, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(31, NULL, 'Marta', '', 3158381944, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(32, NULL, 'Carmen', '', 3204811934, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:06', 1, 0),
(33, NULL, 'Isabella', '', 3152140153, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0),
(34, NULL, 'Clemencia', '', 3142498199, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0),
(35, NULL, 'Maria', '', 3203193770, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0),
(36, NULL, 'Johana', '', 3118488385, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0),
(37, NULL, 'Jorge', '', 3025827198, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0),
(38, NULL, 'Tatiana', '', 3102755349, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0),
(39, NULL, 'Maria', '', 3194323330, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0),
(40, NULL, 'Maria Fernanda', '', 3023657443, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0),
(41, NULL, 'Marta', '', 3158381944, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0),
(42, NULL, 'Carmen', '', 3204811934, '', '', NULL, NULL, NULL, NULL, 3, '2022-08-21 15:25:57', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `idpost` bigint(20) NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `contenido` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreate` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
(1, 'Inicio', '<div class=\"p-t-80\"> <h3 class=\"ltext-103 cl5\">Nuestras marcas</h3> </div> <div> <p>Trabajamos con las mejores marcas del mundo ...</p> </div> <div class=\"row\"> <div class=\"col-md-3\"><img src=\"Assets/images/m1.png\" alt=\"Marca 1\" width=\"110\" height=\"110\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m2.png\" alt=\"Marca 2\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m3.png\" alt=\"Marca 3\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m4.png\" alt=\"Marca 4\" /></div> </div>', '', '2021-07-20 02:40:15', 'inicio', 1),
(2, 'Tienda', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:27', 'tienda', 1),
(3, 'Carrito', '<p>Contenido p&aacute;gina!</p>', '', '2021-08-06 01:21:52', 'carrito', 1),
(4, 'Nosotros', '<section class=\"bg0 p-t-75 p-b-120\"> <div class=\"container\"> <div class=\"row p-b-148\"> <div class=\"col-md-7 col-lg-8\"> <div class=\"p-t-7 p-r-85 p-r-15-lg p-r-0-md\"> <h3 class=\"mtext-111 cl2 p-b-16\">Historia</h3> <p class=\"stext-113 cl6 p-b-26\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris consequat consequat enim, non auctor massa ultrices non. Morbi sed odio massa. Quisque at vehicula tellus, sed tincidunt augue. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas varius egestas diam, eu sodales metus scelerisque congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas gravida justo eu arcu egestas convallis. Nullam eu erat bibendum, tempus ipsum eget, dictum enim. Donec non neque ut enim dapibus tincidunt vitae nec augue. Suspendisse potenti. Proin ut est diam. Donec condimentum euismod tortor, eget facilisis diam faucibus et. Morbi a tempor elit.</p> <p class=\"stext-113 cl6 p-b-26\">Donec gravida lorem elit, quis condimentum ex semper sit amet. Fusce eget ligula magna. Aliquam aliquam imperdiet sodales. Ut fringilla turpis in vehicula vehicula. Pellentesque congue ac orci ut gravida. Aliquam erat volutpat. Donec iaculis lectus a arcu facilisis, eu sodales lectus sagittis. Etiam pellentesque, magna vel dictum rutrum, neque justo eleifend elit, vel tincidunt erat arcu ut sem. Sed rutrum, turpis ut commodo efficitur, quam velit convallis ipsum, et maximus enim ligula ac ligula.</p> <p class=\"stext-113 cl6 p-b-26\">Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on (+1) 96 716 6879</p> </div> </div> <div class=\"col-11 col-md-5 col-lg-4 m-lr-auto\"> <div class=\"how-bor1 \"> <div class=\"hov-img0\"><img src=\"https://cdn.pixabay.com/photo/2015/07/17/22/43/student-849825_1280.jpg\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> <div class=\"row\"> <div class=\"order-md-2 col-md-7 col-lg-8 p-b-30\"> <div class=\"p-t-7 p-l-85 p-l-15-lg p-l-0-md\"> <h2 class=\"mtext-111 cl2 p-b-16\"><span style=\"color: #236fa1;\">Nuestra Misi&oacute;n</span></h2> <p class=\"stext-113 cl6 p-b-26\">Mauris non lacinia magna. Sed nec lobortis dolor. Vestibulum rhoncus dignissim risus, sed consectetur erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam maximus mauris sit amet odio convallis, in pharetra magna gravida. Praesent sed nunc fermentum mi molestie tempor. Morbi vitae viverra odio. Pellentesque ac velit egestas, luctus arcu non, laoreet mauris. Sed in ipsum tempor, consequat odio in, porttitor ante. Ut mauris ligula, volutpat in sodales in, porta non odio. Pellentesque tempor urna vitae mi vestibulum, nec venenatis nulla lobortis. Proin at gravida ante. Mauris auctor purus at lacus maximus euismod. Pellentesque vulputate massa ut nisl hendrerit, eget elementum libero iaculis.</p> <div class=\"bor16 p-l-29 p-b-9 m-t-22\"> <p class=\"stext-114 cl6 p-r-40 p-b-11\">Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn\'t really do it, they just saw something. It seemed obvious to them after a while.</p> <span class=\"stext-111 cl8\"> - Steve Job&rsquo;s </span></div> </div> </div> <div class=\"order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30\"> <div class=\"how-bor2\"> <div class=\"hov-img0\"><img src=\"https://cdn.pixabay.com/photo/2015/07/17/22/43/student-849822_1280.jpg\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> </div> </section>', 'img_2f644b056a9fd3624c7595d24b1d9273.jpg', '2021-08-09 03:09:44', 'nosotros', 1),
(5, 'Contacto', '<div class=\"map\"><iframe style=\"border: 0;\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3861.685802352331!2d-90.73646108521129!3d14.559951589828378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85890e74b3771e19%3A0x68ec9eeea79fd9a7!2sEl%20Arco%20de%20Santa%20Catalina!5e0!3m2!1ses!2sgt!4v1624005005655!5m2!1ses!2sgt\" width=\"100%\" height=\"600\" allowfullscreen=\"allowfullscreen\" loading=\"lazy\"></iframe></div>', 'img_3024f13dc010ffab8c22da05ac6a32b9.jpg', '2021-08-09 03:11:08', 'contacto', 1),
(6, 'Preguntas frecuentes', '<ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega de los producto? </strong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt!</li> </ol> <p>&nbsp;</p> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago aceptan? </strong><span style=\"color: #666666; font-family: Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</span></li> </ul>', '', '2021-08-11 01:24:19', 'preguntas-frecuentes', 1),
(7, 'Términos y Condiciones', '<p>A continuaci&oacute;n se describen los t&eacute;rmino y condiciones de la Tienda Virtual!</p> <ol> <li>Pol&iacute;tica uno</li> <li>Termino dos</li> <li>Condici&oacute;n tres</li> </ol> <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis sunt, corrupti hic aspernatur cumque alias, ipsam omnis iure ipsum, nostrum labore obcaecati natus repellendus consequatur est nemo sapiente dolorem dicta. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Commodi, voluptas, consectetur iusto delectus quaerat ullam nesciunt! Quae doloribus deserunt qui fugit illo nobis ipsum, accusamus eius perferendis beatae culpa molestias!</p>', '', '2021-08-11 01:51:06', 'terminos-y-condiciones', 1),
(8, 'Sucursales', '<section class=\"py-5 text-center\"> <div class=\"container\"> <p>Visitanos y obten los mejores precios del mercado, cualquier art&iacute;culo que necestas para vivir mejor</p> <a class=\"btn btn-info\" href=\"../../tienda_virtual/tienda\">VER PRODUCTOS</a></div> </section> <div class=\"py-5 bg-light\"> <div class=\"container\"> <div class=\"row\"> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s1.jpg\" alt=\"Tienda Uno\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s2.jpg\" alt=\"Sucural dos\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> <div class=\"col-md-4\"> <div class=\"card mb-4 box-shadow hov-img0\"><img src=\"https://abelosh.com/tienda_virtual/Assets/images/s3.jpg\" alt=\"Sucural tres\" width=\"100%\" height=\"100%\" /> <div class=\"card-body\"> <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: Antigua Gautemala <br />Tel&eacute;fono: 4654645 <br />Correo: info@abelosh.com</p> </div> </div> </div> </div> </div> </div>', 'img_d72cb5712933863e051dc9c7fac5e253.jpg', '2021-08-11 02:26:45', 'sucursales', 1),
(9, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2021-08-12 02:30:49', 'not-found', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `categoriaid` bigint(20) NOT NULL,
  `codigo` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL DEFAULT 'Agregar Texto',
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL DEFAULT 'SubirImagen',
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(1, 1, '02969520874', 'PetMate_CucharaMedidora', 'Agregar Texto', '13600.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(2, 1, '031', 'CollarGatoCulebra', 'Agregar Texto', '6500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(3, 1, '034264445611', 'CalabazaPets_CamaColgante', 'Agregar Texto', '31000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(4, 1, '035585223162', 'Kong_Juguete Gato', 'Agregar Texto', '19500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(5, 2, '044600304380', 'FreshStep_Arena20lbs', 'Agregar Texto', '70500.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(6, 4, '052742001197', 'HillsPerro_CuidadoRiñon1.5kg', 'Agregar Texto', '72500.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(7, 3, '052742462806', 'HillsGato_CuidadoDigestivo156g', 'Agregar Texto', '13500.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(8, 4, '052742462905', 'HillsGato_I/DCuidadosDigestivos4lbs', 'Agregar Texto', '90500.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(9, 3, '052742567006', 'HillsPerro/Gato_CuidadoUrgente156g', 'Agregar Texto', '19000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(10, 3, '052742623801', 'HillsGato_C/DCuidadoUrinario156g', 'Agregar Texto', '11900.00', 3, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(11, 3, '052742660004', 'HillsGatito_HigadoPollo156g', 'Agregar Texto', '9950.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(12, 3, '052742661308', 'HillsGato_Pavo156g', 'Agregar Texto', '12800.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(13, 3, '052742700809', 'HillsPerro_CuidadoDigestivo370g', 'Agregar Texto', '17800.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(14, 3, '052742703602', 'HillsCachorro_PolloCebada370g', 'Agregar Texto', '15800.00', 3, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(15, 3, '052742740102', 'HillsGato_AdultoMayorPavo156g', 'Agregar Texto', '12000.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(16, 4, '052742818306', 'HillsPerro_PequeñosBocados5lb', 'Agregar Texto', '66500.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(17, 4, '052742909608', 'HillsPerro_SmallPaws4.5lbs', 'Agregar Texto', '76200.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(18, 4, '052742939100', 'HillsGatito_Pollo7lbs', 'Agregar Texto', '129500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(19, 4, '073657008569', 'EvolveCachorro_Pollo1.7kg', 'Agregar Texto', '52000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(20, 7, '073657009108', 'EvolvePerro_SnackPeanutButter340g', 'Agregar Texto', '24500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(21, 4, '073657390299', 'EvolvePerro_Salmon1.58kg', 'Agregar Texto', '63000.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(22, 7, '073657390367', 'EvolvePerro_SnackChickenCranberry340g', 'Agregar Texto', '23000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(23, 4, '074198121151', 'NutraNuggetsPerro_Mantenimiento15kg', 'Agregar Texto', '165000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(24, 4, '074198165155', 'NutraNuggetsPerro_LiteSenior15kg', 'Agregar Texto', '209000.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(25, 4, '074198179077', 'NutraNuggetsGato_Mantenimiento7.5kg', 'Agregar Texto', '108900.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(26, 4, '074198609666', 'TasteOftheWildGato_RockyMountain5lbs', 'Agregar Texto', '85000.00', 4, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(27, 4, '074198610679', 'DiamondNaturalsPerro_LiteLambRice30lbs', 'Agregar Texto', '228000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(28, 4, '074198611027', 'TasteOftheWild_GatoCanyonRiver5lbs', 'Agregar Texto', '81500.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(29, 4, '074198613502', 'DiamondCareGato_WeightManagement3kg', 'Agregar Texto', '93500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(30, 4, '074198613700', 'TasteOftheWildGato_Turkey15lbs', 'Agregar Texto', '200000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(31, 4, '074198613991', 'TasteOfTheWildCachorro_HighPrairie28lb', 'Agregar Texto', '301900.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(32, 4, '074198614004', 'TasteOfTheWildCachorro_PacificStream14lbs', 'Agregar Texto', '170000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(33, 4, '074198614028', 'TasteOftheWildGato_RockyMountain15lbs', 'Agregar Texto', '196500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(34, 1, '076484077524', 'Collar_Safety_Estrelleas', 'Agregar Texto', '19500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(35, 1, '07702460014', 'EspuarteMix_ChalecoTermicoTallaL', 'Agregar Texto', '28900.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(36, 1, '07702460015', 'EspuarteMix_ChalecoTermicoTallaXL', 'Agregar Texto', '29900.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(37, 1, '07703065', 'EspuarteMix_CollarAhogoGruesa', 'Agregar Texto', '15500.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(38, 5, '087219115138', 'Revolution_Cachorro0.25ml', 'Agregar Texto', '27500.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(39, 1, '10000', 'CollarLucamawalu_GatoDelgado', 'Agregar Texto', '9000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(40, 1, '10009', 'PetSmile_CollarGatoCorbatín', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(41, 1, '10013', 'PetSmile_PañoletaTallaS/M', 'Agregar Texto', '7000.00', 4, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(42, 1, '10014', 'PetSmile_PañoletaTallaL', 'Agregar Texto', '10000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(43, 1, '10015', 'CamaCubierta_Piraña', 'Agregar Texto', '55000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(44, 1, '10017', 'PetSmile_PlacaVariada', 'Agregar Texto', '12100.00', 12, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(45, 1, '10019', 'Chaleco_ImpermeableTallaL', 'Agregar Texto', '35500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(46, 1, '10020', 'Chaleco_ImpermeableTallaXS', 'Agregar Texto', '25500.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(47, 1, '10021', 'Wiwer_CollarPequeñoAncho', 'Agregar Texto', '9500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(48, 1, '10022', 'Chaleco_ImpermeableCapotaTallaM', 'Agregar Texto', '32000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(49, 1, '10023', 'Chaleco_ImpermeableCapotaTallaS', 'Agregar Texto', '27900.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(50, 1, '10025', 'Capa_ReflectivaCapotaTallaS', 'Agregar Texto', '20000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(51, 1, '10026', 'Carpa_ArcansaTallaL', 'Agregar Texto', '25000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(52, 1, '10027', 'Capa_ReflectivaTallaS', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(53, 1, '10028', 'Chaleco_OberolTallaS', 'Agregar Texto', '10000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(54, 1, '10029', 'Chaleco_ImpermeableTalla4XL', 'Agregar Texto', '66000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(55, 1, '10030', 'CamisetasVariadas', 'Agregar Texto', '12000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(56, 1, '10031', 'SacoNavideño_TallaS/M', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(57, 1, '10032', 'SacoNavideño_Talla L', 'Agregar Texto', '25000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(58, 1, '10033', 'Jugatos_JugueteCabuya', 'Agregar Texto', '2500.00', 9, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(59, 1, '10034', 'Jugatos_Varita', 'Agregar Texto', '4500.00', 8, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(60, 1, '10035', 'PetSmile_PlantaGato', 'Agregar Texto', '6000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(61, 1, '1008', 'CupCoffee', 'Agregar Texto', '8000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(62, 1, '1012', 'VaraPlumas_Gatos', 'Agregar Texto', '9000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(63, 1, '1048', 'BotasdeGomaImpermeable_TallaS', 'Agregar Texto', '28600.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(64, 1, '1052', 'PecheraGato_TallaM', 'Agregar Texto', '33000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(65, 1, '1053', 'PetSmile_CollarSurtidoGato', 'Agregar Texto', '7500.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(66, 1, '1072', 'KindomPet_AguaDog', 'Agregar Texto', '11000.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(67, 2, '20000', 'ArenaLibra', 'Agregar Texto', '2200.00', 14, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(68, 2, '20001', 'QueenCat_ArenaCaféLavanda25kg', 'Agregar Texto', '97000.00', 6, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(69, 2, '20002', 'FofiCat_ArenaSurtida5kg', 'Agregar Texto', '23000.00', 10, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(70, 2, '20003', 'TapeteAbsorbente*Unidad', 'Agregar Texto', '3200.00', 10, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(71, 1, '201102441016', 'JaraPets_ComedorSencilloAntideslizante', 'Agregar Texto', '19500.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(72, 1, '2019041101193', 'Cencosud_PañoletaConCorrea', 'Agregar Texto', '12000.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(73, 1, '2590', 'CollarEscarcha_VerdeAzul', 'Agregar Texto', '6000.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(74, 3, '30000', 'Whiskas_Pouch85g', 'Agregar Texto', '2600.00', 9, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(75, 3, '30001', 'Pedigree_Pouch100g', 'Agregar Texto', '2800.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(76, 3, '30002', 'Felix_Pouch85g', 'Agregar Texto', '3300.00', 29, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(77, 3, '30003', 'Felix_LataSurtida156g', 'Agregar Texto', '5500.00', 9, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(78, 3, '30004', 'DogChow_Pouch100g', 'Agregar Texto', '3200.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(79, 3, '30005', 'Chunky_PerroPouch100g', 'Agregar Texto', '2900.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(80, 3, '30006', 'AgilityGoldPerro_Pouch100g', 'Agregar Texto', '4000.00', 3, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(81, 3, '30007', 'EvolveGato_LataChikenSeaTurkey156g', 'Agregar Texto', '6400.00', 29, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(82, 3, '30008', 'EvolveGato_BandejaChickenSalmonSea3.5oz', 'Agregar Texto', '6200.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(83, 3, '30009', 'Dogchow_LataSurtida368g', 'Agregar Texto', '8200.00', 6, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(84, 3, '30010', 'ChunkyGato_MenuNatural200g', 'Agregar Texto', '6400.00', 11, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(85, 3, '30011', 'ChunkyGato_Pouch80g', 'Agregar Texto', '2800.00', 20, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(86, 3, '30012', 'ChunkyPerro_MenuNatural300g', 'Agregar Texto', '10900.00', 8, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(87, 3, '30013', 'SaborVidaPerro_Pouch85g', 'Agregar Texto', '3000.00', 6, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(88, 3, '30014', 'SaborVidaGato_Pouch85g', 'Agregar Texto', '3000.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(89, 3, '30015', 'HealthyLoveGato_Pouch220g', 'Agregar Texto', '6600.00', 0, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(90, 3, '30016', 'OptimumGato_Pouch85g', 'Agregar Texto', '3600.00', 4, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(91, 3, '30017', 'OptimumPerro_Pouch85g', 'Agregar Texto', '3600.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(92, 1, '3007', 'AmMascotas_ComederoXLPesado', 'Agregar Texto', '25700.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(93, 1, '3015', 'Pet4Cause_CollarSportTallaM', 'Agregar Texto', '28000.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(94, 1, '3016', 'Pet4Cause_CollarSport L', 'Agregar Texto', '29200.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(95, 1, '3017', 'Pet4Cause_CorreaSportTallaS', 'Agregar Texto', '28000.00', 2, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(96, 1, '3030', 'Pet4Cause_CorbatinTallaS,M,L', 'Agregar Texto', '11200.00', 6, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(97, 1, '3036', 'Pet4Cause_CollarTrenzadoTallaM', 'Agregar Texto', '38200.00', 1, NULL, '2022-08-20 23:38:48', 'SubirImagen', 1),
(98, 1, '3509', 'CollarMetalico_ItalianoMediano', 'Agregar Texto', '12800.00', 2, NULL, '2022-08-20 23:41:46', 'SubirImagen', 1),
(99, 1, '3581', 'PlacaCaradePerro', 'Agregar Texto', '18000.00', 1, NULL, '2022-08-20 23:41:46', 'SubirImagen', 1),
(100, 1, '38', 'Espuarte_ColchonetaGrande', 'Agregar Texto', '42000.00', 2, NULL, '2022-08-20 23:41:46', 'SubirImagen', 1),
(101, 1, '39112392', 'PetsFun_PoleraMarineraTallaS', 'Agregar Texto', '27500.00', 1, NULL, '2022-08-20 23:42:14', 'SubirImagen', 1),
(102, 1, '39194114', 'PetsFun_CapaLedActiveTallaS', 'Agregar Texto', '35000.00', 1, NULL, '2022-08-20 23:42:14', 'SubirImagen', 1),
(103, 1, '39197856', 'PetsFun_CollarGato', 'Agregar Texto', '7500.00', 0, NULL, '2022-08-20 23:42:14', 'SubirImagen', 1),
(104, 1, '39289049', 'PetsFun_PoleraMascotaDiseños', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-20 23:42:35', 'SubirImagen', 1),
(105, 4, '40000', 'RingoCachorroCroquetaLibra', 'Agregar Texto', '2500.00', 87, NULL, '2022-08-20 23:43:20', 'SubirImagen', 1),
(106, 4, '40001', 'RingoAdultoCroquetaLibra ', 'Agregar Texto', '2100.00', 117, NULL, '2022-08-21 00:00:03', 'SubirImagen', 1),
(107, 4, '40002', 'PedigreeAdultoRPLibra', 'Agregar Texto', '5600.00', 41, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(108, 4, '40003', 'PedigreeAdultoRazaM/GLibra', 'Agregar Texto', '5300.00', 54, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(109, 4, '40004', 'OhMaiGat_SedentariosTerritorialesLibra', 'Agregar Texto', '5800.00', 6, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(110, 4, '40005', 'OhMaiGat_CaserosDelicadosLibra', 'Agregar Texto', '5800.00', 22, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(111, 4, '40006', 'CatChow_AdultoCarneLibra', 'Agregar Texto', '6000.00', 25, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(112, 4, '40007', 'NutreCanAdultoRazaM/GLibra', 'Agregar Texto', '4000.00', 15, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(113, 4, '40008', 'NutreCanAdultoCroquetaLibra', 'Agregar Texto', '2800.00', 35, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(114, 4, '40009', 'NutraNuggetsPerro_MantenimientoLibra', 'Agregar Texto', '6000.00', 91, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(115, 4, '40010', 'MonelloGato_SalmónAtúnPolloLibra ', 'Agregar Texto', '7300.00', 67, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(116, 4, '40011', 'MonelloGato_CastradosLibra', 'Agregar Texto', '8300.00', 27, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(117, 4, '40012', 'MonelloGatitoLibra', 'Agregar Texto', '7500.00', 15, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(118, 4, '40013', 'MonelloCachorroLibra', 'Agregar Texto', '5600.00', 77, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(119, 4, '40014', 'MonelloPerro_TradicionalLibra', 'Agregar Texto', '4700.00', 87, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(120, 4, '40015', 'MonelloPerro_RPLibra', 'Agregar Texto', '5600.00', 41, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(121, 4, '40016', 'Mirringo_AdultoLibra', 'Agregar Texto', '4200.00', 119, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(122, 4, '40017', 'MaxCat_AdultoPolloArrozLibra', 'Agregar Texto', '7000.00', 82, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(123, 4, '40018', 'Guauamor_AdultoRazaM/GLibra', 'Agregar Texto', '3100.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(124, 4, '40019', 'Gatsy_PescadoArrozEspinacaLibra', 'Agregar Texto', '3600.00', 22, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(125, 4, '40020', 'FilpoAdultoLibra', 'Agregar Texto', '2000.00', 63, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(126, 4, '40021', 'DonKatAdultoLibra', 'Agregar Texto', '4400.00', 24, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(127, 4, '40022', 'DonKanCachorroLibra', 'Agregar Texto', '2400.00', 33, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(128, 4, '40023', 'DonKanAdultoLibra', 'Agregar Texto', '2900.00', 155, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(129, 4, '40024', 'DogourmetAdultoParrilladaLibra', 'Agregar Texto', '3500.00', 24, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(130, 4, '40025', 'DogChow_AdultoSinColoranteLibra', 'Agregar Texto', '4200.00', 48, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(131, 4, '40026', 'DogChow_AdultoRPLibra ', 'Agregar Texto', '4900.00', 25, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(132, 4, '40027', 'DogChow_AdultoRazaM/GLibra', 'Agregar Texto', '4900.00', 20, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(133, 4, '40028', 'ChunkyGato_PolloLibra', 'Agregar Texto', '4100.00', 48, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(134, 4, '40029', 'ChunkyCachorro_PolloLibra', 'Agregar Texto', '4100.00', 34, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(135, 4, '40030', 'ChunkyPerroRP_PolloLibra', 'Agregar Texto', '3800.00', 27, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(136, 4, '40031', 'ChunkyPerro_PolloLibra', 'Agregar Texto', '3300.00', 73, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(137, 4, '40032', 'ChunkyPerro_CorderoLibra', 'Agregar Texto', '5700.00', 49, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(138, 4, '40033', 'CatChow_GatitoLibra', 'Agregar Texto', '6700.00', 54, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(139, 4, '40034', 'CatChow_AdultoHogareñoLibra', 'Agregar Texto', '6750.00', 33, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(140, 4, '40035', 'CatChow_AdultoDelimixLibra', 'Agregar Texto', '6500.00', 97, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(141, 4, '40036', 'BirboPerroRP_CarneCerealesLibra', 'Agregar Texto', '4200.00', 55, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(142, 4, '40037', 'Gatsy_CarneLibra', 'Agregar Texto', '3600.00', 30, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(143, 4, '40038', 'BirboGato_CarneLibra', 'Agregar Texto', '6500.00', 95, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(144, 4, '40039', 'OhMaiGat_GatitoJuguetonesExploradoresLibra', 'Agregar Texto', '6500.00', 61, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(145, 4, '40040', 'ChunkyGato_SalmonCorderoLibra', 'Agregar Texto', '5900.00', 16, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(146, 4, '40041', 'MonelloCachorro15kg', 'Agregar Texto', '170000.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(147, 1, '401', 'EspuarteMix_DisfrasVarios', 'Agregar Texto', '46500.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(148, 5, '50000', 'BerbeelHomaccord_MedicamentoHomeopatico*Unidad', 'Agregar Texto', '13000.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(149, 5, '50001', 'ColirioZoo_AntibioticoOjosOidos10ml', 'Agregar Texto', '11200.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(150, 5, '5414736039299', 'Revolution_Gato0.75ml', 'Agregar Texto', '34400.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(151, 5, '5420036916390', 'Comfortis_Perro2.34.5kg/Gato1.92.7kg', 'Agregar Texto', '19500.00', 0, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(152, 5, '5420036917076', 'Comfortis_Perro/18.127.2kg', 'Agregar Texto', '29200.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(153, 1, '549LR01', 'EspuarteMix_LazoResorte', 'Agregar Texto', '18500.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(154, 6, '60000', 'Domicilio', 'Agregar Texto', '5000.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(155, 1, '601', 'Mershop_SeñalMediana', 'Agregar Texto', '8500.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(156, 1, '6818021100227', 'PetCareCup_Bebedero Portatil', 'Agregar Texto', '35000.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(157, 1, '6917692000222', 'KmtStyle_Comedero21x6cm', 'Agregar Texto', '10000.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(158, 1, '6921300002898', 'Mershop_Corbata', 'Agregar Texto', '7000.00', 6, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(159, 1, '6921300002928', 'Mershop_CollarPañoletaPequeño', 'Agregar Texto', '6500.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(160, 1, '6921300002935', 'Mershop_CollarPañoletaMediano', 'Agregar Texto', '7500.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(161, 1, '6921300005677', 'Mershop_PijamaRayas', 'Agregar Texto', '11000.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(162, 1, '6921300005875', 'Mershop_SacoHuesos', 'Agregar Texto', '12600.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(163, 1, '6921300006001', 'Mershop_SeñalPequeña', 'Agregar Texto', '6500.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(164, 1, '6921300006032', 'Mershop_SeñalGrande', 'Agregar Texto', '10500.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(165, 1, '6921300006186', 'Mershop_Juguetepalo', 'Agregar Texto', '5300.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(166, 1, '6921300006278', 'Mershop_ComidaParaGato', 'Agregar Texto', '6200.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(167, 1, '6921300007077', 'Mershop_CorreaAhogo', 'Agregar Texto', '13500.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(168, 1, '6921300007145', 'Mershop_ComederoMetalicoMediano', 'Agregar Texto', '11700.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(169, 1, '6921300007152', 'Mershop_ComederoMetalicoMediano', 'Agregar Texto', '13000.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(170, 1, '6921300009101', 'Mershop_CollarGrande', 'Agregar Texto', '12000.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(171, 1, '6921300009934', 'Mershop_ArnésDiseños', 'Agregar Texto', '21000.00', 5, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(172, 1, '6921300010565', 'Mershop_CollarPequeñoColores', 'Agregar Texto', '6500.00', 7, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(173, 1, '6921300010572', 'Mershop_CollarMedianoColores', 'Agregar Texto', '7500.00', 5, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(174, 1, '6921300010794', 'Mershop_PelotaColores', 'Agregar Texto', '7200.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(175, 1, '6921300011470', 'Mershop_CollarTaches', 'Agregar Texto', '15000.00', 6, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(176, 1, '6921300011500', 'Mershop_ArnésOso', 'Agregar Texto', '14500.00', 0, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(177, 1, '6921300011975', 'Mershop_JugueteFelpa', 'Agregar Texto', '10700.00', 0, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(178, 1, '6921300013276', 'Mershop_HuesoLuces', 'Agregar Texto', '9000.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(179, 1, '6921300013979', 'Mershop_CollarAntipulgas', 'Agregar Texto', '7500.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(180, 2, '6926182932752', 'JaraPets_BolsasBiodegradable', 'Agregar Texto', '2600.00', 22, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(181, 1, '6931220604287', 'PetComb_Cepillo', 'Agregar Texto', '12500.00', 0, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(182, 1, '6931220612954', 'Teilor_ComederoHuella', 'Agregar Texto', '7500.00', 0, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(183, 1, '6932284300269', 'CalabazaPets_AreneraDiamanteSencilla', 'Agregar Texto', '35900.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(184, 1, '6938440101862', 'KindomPet_CepilloMaderaRedondoPequeño', 'Agregar Texto', '6200.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(185, 1, '6970420734363', 'PetFeeder_ComederoDispensador', 'Agregar Texto', '26000.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(186, 1, '6972228790114', 'CalabazaPets_CargadorPlegableCaraGatos', 'Agregar Texto', '71000.00', 0, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(187, 1, '6972228790343', 'CalabazaPets_BolsoPlegablePequeño', 'Agregar Texto', '67000.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(188, 1, '6972228790374', 'CalabazaPets_TraillaArnésParacaidasTallaS', 'Agregar Texto', '13600.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(189, 1, '6972228790381', 'CalabazaPets_TraillaArnésParacaidasTallaM', 'Agregar Texto', '16800.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(190, 1, '6972228790398', 'CalabazaPets_TraillaArnesParacaidasL', 'Agregar Texto', '20700.00', 8, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(191, 1, '6972228791067', 'CalabazaPets_ComederoCeramicaGato', 'Agregar Texto', '25000.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(192, 1, '6972228791272', 'CalabazaPets_PescadoPequeño', 'Agregar Texto', '9000.00', 5, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(193, 1, '6972228791289', 'CalabazaPets_PescadoGrande', 'Agregar Texto', '15000.00', 5, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(194, 1, '6972228794761', 'CalabazaPets_PlacaHuesoPlateado', 'Agregar Texto', '18000.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(195, 1, '6972228794778', 'CalabazaPets_PlacaHuesoDorado', 'Agregar Texto', '19000.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(196, 1, '6972228794785', 'CalabazaPets_PlacaCorazónPlateado', 'Agregar Texto', '18000.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(197, 1, '6972228794792', 'CalabazaPets_PlacaCorazónDoradoNegro', 'Agregar Texto', '19000.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(198, 1, '6972228794808', 'CalabazaPets_PlacaPescadoPlateada', 'Agregar Texto', '18000.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(199, 2, '6972228795621', 'CalabazaPets_BolsaBiodegradable', 'Agregar Texto', '2000.00', 35, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(200, 2, '6972228797533', 'CalabazaPets_ArenaVainillaLavanda25kg', 'Agregar Texto', '95000.00', 52, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(201, 2, '6972228798356', 'CalabazaPets_ArenaCarbónActivado4.5kg', 'Agregar Texto', '20200.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(202, 2, '6972228798370', 'CalabazaPets_ArenaVainillaLavandaCafé4.5kg', 'Agregar Texto', '17900.00', 5, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(203, 1, '6972228798769', 'CalabazaPets_PescadoEléctrico', 'Agregar Texto', '29000.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(204, 1, '6972228798806', 'ClalabazaPets_PlacaHuellaDorada', 'Agregar Texto', '19000.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(205, 1, '6972228798813', 'CalabazaPets_PlacaPescadoAzul', 'Agregar Texto', '19000.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(206, 1, '6972228798820', 'CalabazaPets_PlacaCaraGatoPlateada', 'Agregar Texto', '18000.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(207, 1, '6972228798837', 'CalabazaPets_PlacaCaraGatoDorada', 'Agregar Texto', '19000.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(208, 1, '6972228798844', 'CalabazaPets_PlacaHuellaPlateada', 'Agregar Texto', '18000.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(209, 1, '6972228798899', 'CalabazaPets_RemovedordePelosDiseños', 'Agregar Texto', '18500.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(210, 1, '6972228798912', 'CalabazaPets_CápsulaMorralPaisaje', 'Agregar Texto', '85000.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(211, 1, '6972228799629', 'CalabazaPets_PelotaMacizaGomaB', 'Agregar Texto', '12500.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(212, 1, '6972228799810', 'CalabazaPets_RascadorBanana', 'Agregar Texto', '26900.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(213, 1, '6972393181182', 'KmtStyle_GuanteGoma', 'Agregar Texto', '15000.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(214, 1, '6972393181601', 'KmtStyle_Frisbee', 'Agregar Texto', '15500.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(215, 1, '6972393181618', 'KmtStyle_FrisbeeTextura', 'Agregar Texto', '13000.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(216, 1, '6972393184336', 'KmtStyle_CollarNylon', 'Agregar Texto', '6500.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(217, 1, '6972393184497', 'KmtStyle_CollarNylonPerro', 'Agregar Texto', '6000.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(218, 1, '6972393184527', 'KmtStyle_CollarNylonPerroGrande', 'Agregar Texto', '9000.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(219, 1, '6972393184848', 'KmtStyle_ArnésNylonPerro4445CM', 'Agregar Texto', '28500.00', 2, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(220, 1, '6972393184855', 'KmtStyle_ArnésNylonPerro6575CM', 'Agregar Texto', '31500.00', 4, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(221, 1, '6972393184862', 'KmtStyle_ArnésNylonPerro7082CM', 'Agregar Texto', '34500.00', 3, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(222, 1, '6972393185609', 'Collar_HuellaTejidoPeque', 'Agregar Texto', '6500.00', 1, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(223, 1, '6972393185623', 'Collar_Huesotejido', 'Agregar Texto', '9500.00', 0, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(224, 1, '6972393185630', 'Collar_CueroSinteticoHuellas', 'Agregar Texto', '5500.00', 0, NULL, '2022-08-21 00:03:28', 'SubirImagen', 1),
(225, 1, '6972393185654', 'Collar_HuellitasMediano', 'Agregar Texto', '9000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(226, 1, '6972393185661', 'Collar_AdornosPequeño', 'Agregar Texto', '6500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(227, 1, '6972393185678', 'KmtStyle_CollarPerroConFiguras', 'Agregar Texto', '8500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(228, 1, '6972393185685', 'KmtStyle_CollarAdornos2.5x56Cm', 'Agregar Texto', '10000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(229, 1, '6972393185692', 'Collar_Cuerosinteticopequeño', 'Agregar Texto', '6500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(230, 1, '6972393185708', 'KmtStyle_CollarPerro2.4x42Cm', 'Agregar Texto', '7000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(231, 1, '6972393185715', 'Collar_CueroSintetitco', 'Agregar Texto', '9200.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(232, 2, '6974370010201', 'QueenCat_ArenaCafeManzana4kg', 'Agregar Texto', '20000.00', 8, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(233, 1, '6987553121281', 'Comedero_CaragatoPequeño', 'Agregar Texto', '6500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(234, 1, '6987553121298', 'Comedero_CaragatoGrande', 'Agregar Texto', '7500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(235, 1, '6987553121366', 'ComederoGato_Doble', 'Agregar Texto', '15900.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(236, 1, '6987553122226', 'Deckosas_Comedor', 'Agregar Texto', '14000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(237, 1, '6987553122301', 'Comedero_ColoresMediano', 'Agregar Texto', '8900.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(238, 1, '6987553122318', 'Comedero_ColoresGrande', 'Agregar Texto', '9900.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(239, 1, '6987553122370', 'Deckosas_comedorFormaGarra', 'Agregar Texto', '15000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(240, 1, '6987553122448', 'DeckoSas_CollarConCorrea', 'Agregar Texto', '10200.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(241, 1, '6987553122455', 'DeckoSas_CollarConCorreaFlores', 'Agregar Texto', '15000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(242, 1, '6987553122523', 'DeckoSas_TraillaArnesParacaidasXS', 'Agregar Texto', '10500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(243, 1, '6987553122721', 'DeckoSas_Arnes', 'Agregar Texto', '10900.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(244, 1, '6987553122745', 'DeckoSas_TraillaArnesParacaidasL', 'Agregar Texto', '20500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(245, 1, '6987553122844', 'DeckoSas_TraillaArnesParacaidasXXL', 'Agregar Texto', '21500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(246, 1, '6987553123049', 'Deckosas_VaritaPlumaCascabel', 'Agregar Texto', '6500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(247, 1, '6987553123100', 'DeckoSas_CañaGatoColores', 'Agregar Texto', '15000.00', 3, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(248, 1, '6987553123193', 'Pelotas_Gato', 'Agregar Texto', '6000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(249, 1, '6987553123216', 'DeckoSas_CuatroPelotas', 'Agregar Texto', '8500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(250, 1, '6987553123223', 'Pelotas y Ratones', 'Agregar Texto', '7000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(251, 1, '6987553123261', 'Ratones y pelotas', 'Agregar Texto', '7000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(252, 1, '6987553990276', 'Plato_MetalicoPequeñoHuellas', 'Agregar Texto', '7000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(253, 1, '6987553990283', 'Plato Metalico NANASTORE', 'Agregar Texto', '8000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(254, 1, '6987553992126', 'CepilloMano', 'Agregar Texto', '9000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(255, 1, '6987553992355', 'PeineAntipulgas', 'Agregar Texto', '6500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(256, 1, '6987553993055', 'Corre Mediana Perro NANASTORE', 'Agregar Texto', '7000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(257, 1, '6987553993154', 'CollarCauchoSintetico', 'Agregar Texto', '8000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(258, 1, '6988888031672', 'Varita con Ratón', 'Agregar Texto', '7000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(259, 1, '6988888066933', 'Cortauñas_Tijera Grande con lima', 'Agregar Texto', '12000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(260, 1, '6988888096602', 'Pechera_Talla S y L', 'Agregar Texto', '16000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(261, 1, '6988888097036', 'W_JugueteRatoncitoParaGatos', 'Agregar Texto', '12000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(262, 1, '6988888113118', 'SacoRombos_TallasVariadas', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(263, 1, '6988888194261', 'JG_CollarManchasAzulBlanco', 'Agregar Texto', '13000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(264, 1, '6988888200283', 'PetSocialist_RatónLoco', 'Agregar Texto', '9000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(265, 1, '6988888200504', 'GoldenPanda_Bozal Malla S, M, L y XL', 'Agregar Texto', '15200.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(266, 7, '70000', 'NT_CabanoDeshidratado*Unidad', 'Agregar Texto', '300.00', 104, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(267, 7, '70001', 'NT_RecabanoAhumado*Unidad', 'Agregar Texto', '200.00', 302, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(268, 7, '70002', 'NT_Chorizo*Unidad', 'Agregar Texto', '500.00', 22, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(269, 7, '70003', 'NT_CoquitoFibra*Unidad', 'Agregar Texto', '200.00', 87, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(270, 7, '70004', 'NT_PataGallina*Unidad', 'Agregar Texto', '800.00', 149, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(271, 7, '70005', 'NT_BocaditoDeCarne*Unidad', 'Agregar Texto', '1000.00', 20, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(272, 7, '70006', 'NT_Traquea*Unidad', 'Agregar Texto', '1300.00', 65, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(273, 7, '70007', 'DogChow_AbrazzosIntegral*Unidad', 'Agregar Texto', '800.00', 20, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(274, 7, '70008', 'Chunky_DeliDogMix*Unidad', 'Agregar Texto', '100.00', 1182, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(275, 7, '70009', 'Chunky_DeliDogDent*Unidad', 'Agregar Texto', '700.00', 146, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(276, 7, '70010', 'Hueso_HorneadoPequeño*Unidad', 'Agregar Texto', '400.00', 96, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(277, 7, '70011', 'BrCat_SnackBolsitaBolaDePelo', 'Agregar Texto', '1000.00', 124, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(278, 7, '70012', 'Inaba_Churu*Unidad', 'Agregar Texto', '3000.00', 111, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(279, 7, '70013', 'Carnaza_Cabanos*Unidad', 'Agregar Texto', '100.00', 1120, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(280, 7, '70014', 'Carnaza_Oblea*Unidad', 'Agregar Texto', '100.00', 842, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(281, 7, '70015', 'Inaba_ChuruPopsTuna*Unidad', 'Agregar Texto', '3000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(282, 7, '70016', 'BarquillosCarnaza*Unidad', 'Agregar Texto', '400.00', 88, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(283, 7, '70017', 'PatasCarnaza*Unidad', 'Agregar Texto', '600.00', 37, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(284, 7, '70018', 'PernilCarnaza*Unidad', 'Agregar Texto', '2500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(285, 7, '70019', 'NT_HuesitoFibra*Unidad', 'Agregar Texto', '300.00', 73, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(286, 7, '70020', 'NT_GomilletasPollo', 'Agregar Texto', '200.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(287, 1, '7012341231084', 'KindomPet_VaraGatoFique', 'Agregar Texto', '6300.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(288, 4, '706460023879', 'PedigreeAdultoRazaM/G25kg', 'Agregar Texto', '260000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(289, 1, '714218', 'ComederoPortatil', 'Agregar Texto', '10000.00', 6, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(290, 1, '736990000064', 'XtremeCatnip_HierbaGatuna1oz', 'Agregar Texto', '14400.00', 6, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(291, 5, '736990000538', 'FooeyUltraBitter_Spray118ml', 'Agregar Texto', '23200.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(292, 1, '737257833128', 'WhiskerCity_CatToy', 'Agregar Texto', '8000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(293, 1, '737257921672', 'WhiskerCity_CatToy', 'Agregar Texto', '10200.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(294, 4, '7501072204479', 'ProPlanPerro_ExigentRazaPequeña3kg', 'Agregar Texto', '103000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(295, 5, '75020051101003', 'Asuntol_Jabon', 'Agregar Texto', '11500.00', 5, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(296, 5, '7502010428094', 'RondelAdulto10ml', 'Agregar Texto', '12500.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(297, 5, '7502010428292', 'RondelPuppy5ml', 'Agregar Texto', '8400.00', 10, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(298, 5, '7502010429190', 'Milpro_Gato40mg*Unidad', 'Agregar Texto', '13500.00', 4, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(299, 5, '7502010429206', 'Milpro_Gatito10mg*Unidad', 'Agregar Texto', '10000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(300, 5, '7503019612927', 'Simparica_Ectoparasiticida80mg*Unidad', 'Agregar Texto', '36900.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(301, 5, '7503019612934', 'Simparica_Ectoparasiticida40mg*Unidad', 'Agregar Texto', '29200.00', 4, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(302, 5, '7503019612941', 'Simparica_Ectoparasiticida20mg*Unidad', 'Agregar Texto', '28000.00', 3, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(303, 5, '7503019612958', 'Simparica_Ectoparasiticida10mg*Unidad', 'Agregar Texto', '25900.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(304, 5, '7503026470091', 'RevolutionPlus_Gato2.55kg*Unidad', 'Agregar Texto', '45000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(305, 4, '7506174513139', 'PedigreeAdultoRazaPequeña20kg ', 'Agregar Texto', '219000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(306, 1, '7581001', 'PinoCat_3.7kg', 'Agregar Texto', '24000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(307, 2, '7701020304088', 'MaxiCat_Arena5kg', 'Agregar Texto', '23500.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(308, 4, '7701893563056', 'NutrissAdultoCarneVegetales500g', 'Agregar Texto', '3000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(309, 2, '7702026145064', 'Petys_TapetesAbsorbentes*12', 'Agregar Texto', '28900.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(310, 2, '7702026183141', 'Petys_PañosHumedos*10', 'Agregar Texto', '3300.00', 5, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(311, 2, '7702026183868', 'Petys_PañosHumedos*50', 'Agregar Texto', '10000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(312, 2, '7702026184490', 'Petys_ShampooPerroGato235ml', 'Agregar Texto', '19100.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(313, 2, '7702026188849', 'Petys_PañosHumedos*100', 'Agregar Texto', '18000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(314, 2, '7702026190484', 'Petys_PañosHumedosLavanda*50', 'Agregar Texto', '12000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(315, 4, '7702084000039', 'DonKanAdulto22kg', 'Agregar Texto', '127000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(316, 4, '7702084000107', 'DonKanCachorro22kg', 'Agregar Texto', '104000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(317, 4, '7702084050874', 'DogourmetAdultoParrillada25kg', 'Agregar Texto', '170000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(318, 4, '7702084057057', 'OhMaiGat_SedentariosTerritoriales8kg', 'Agregar Texto', '92000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(319, 4, '7702084057118', 'OhMaiGat_CaserosDelicados8kg', 'Agregar Texto', '91000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(320, 4, '7702084057170', 'DonKatAdulto7kg', 'Agregar Texto', '60500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(321, 4, '7702084057279', 'OhMaiGat_GatitoJuguetonesExploradores8kg', 'Agregar Texto', '99200.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(322, 4, '7702084057347', 'DonKatAdulto16kg', 'Agregar Texto', '132000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(323, 5, '7702123003366', 'Advocate_Perro2.5ml', 'Agregar Texto', '36400.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(324, 5, '7702123003373', 'Advocate_Perro0.4ml', 'Agregar Texto', '28600.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(325, 5, '7702123003380', 'Advocate_Perro1.0ml', 'Agregar Texto', '34000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(326, 5, '7702123003397', 'Advocate_Perro4.0ml', 'Agregar Texto', '41200.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(327, 5, '7702123006848', 'Advocate_Gato0.4ml', 'Agregar Texto', '39000.00', 3, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(328, 5, '7702123006855', 'Advocate_Gato0.8ml', 'Agregar Texto', '46000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(329, 1, '7702123010722', 'Profender_Gatos 5 a 8 kg', 'Agregar Texto', '33900.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(330, 1, '7702207717479', 'Clordent Sol. Spray 120 ml', 'Agregar Texto', '25000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(331, 2, '7702207718049', 'Virbac_JabonClorhexin', 'Agregar Texto', '19500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(332, 5, '7702207729755', 'Virbac_ClorhexinSpray120ml', 'Agregar Texto', '20000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(333, 5, '7702207735435', 'Oftalmosyn_Gotas10ml', 'Agregar Texto', '22000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(334, 2, '7702487000612', 'CanAmor_ShampooAntibacterial230ml', 'Agregar Texto', '22500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(335, 2, '7702487000629', 'CanAmor_ShampoInsecticida230ml', 'Agregar Texto', '17500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(336, 2, '7702487000667', 'CanAmor_JabonInsecticida90g', 'Agregar Texto', '10000.00', 3, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(337, 2, '7702487004801', 'CanAmor_PerfumeGato150ml', 'Agregar Texto', '19800.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(338, 2, '7702487033016', 'CanAmor_TalcoDesodorantePerro100g', 'Agregar Texto', '19200.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(339, 2, '7702487033061', 'CanAmor_TalcoDesodoranteGato100g', 'Agregar Texto', '19200.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(340, 1, '7702487033290', 'CanAmor_ShampooRinseGato 230ml', 'Agregar Texto', '22000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(341, 2, '7702487034013', 'CanAmor_JabónDesodorante90g', 'Agregar Texto', '11000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(342, 2, '7702487034020', 'CanAmor_ShampooRinse30ml', 'Agregar Texto', '4600.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(343, 2, '7702487034037', 'CanAmor_ShampoInsecticida30ml', 'Agregar Texto', '4200.00', 9, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(344, 2, '7702487036024', 'CanAmor_ShampooArboldeTé30ml', 'Agregar Texto', '4500.00', 4, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(345, 2, '7702487037021', 'CanAmor_JabónÁrboldeTé90g', 'Agregar Texto', '11600.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(346, 2, '7702487124080', 'CanAmor_ShampooPielSensible30ml', 'Agregar Texto', '4900.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(347, 2, '7702487474536', 'CanAmor_BañoEspumoso', 'Agregar Texto', '19500.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(348, 2, '7702487586994', 'CanAmor_ShampooPeloOscuro230 ml', 'Agregar Texto', '21500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(349, 1, '7702487719682', 'CanAmor_ShampooPielSensible 230ml', 'Agregar Texto', '21500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(350, 2, '7702487748217', 'CanAmor_ShampooArboldeTé230ml', 'Agregar Texto', '26000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(351, 2, '7702487798366', 'CanAmor_ShampooPeloClaro230ml', 'Agregar Texto', '21500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(352, 1, '7702521026004', 'Purina_TidyCatsArena_4kg', 'Agregar Texto', '22000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(353, 4, '7702521069087', 'DogChow_AdultoRP22.7kg', 'Agregar Texto', '196000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(354, 4, '7702521102067', 'Gatsy_PescadoArrozEspinaca17kg', 'Agregar Texto', '113500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(355, 4, '7702521102524', 'DogChow_CachorroRazaM/G2kg', 'Agregar Texto', '21700.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(356, 4, '7702521102739', 'Gatsy_Carne17Kg', 'Agregar Texto', '120000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(357, 4, '7702521104115', 'DogChow_AdultoRazaM/G2kg', 'Agregar Texto', '23500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(358, 4, '7702521104191', 'DogChow_AdultoRazaM/G8kg', 'Agregar Texto', '74400.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(359, 4, '7702521104641', 'CatChow_Gatito8kg', 'Agregar Texto', '105600.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(360, 4, '7702521104702', 'CatChow_AdultoDelimix10kg', 'Agregar Texto', '128000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(361, 4, '7702521104887', 'CatChow_AdultoHogareño8kg', 'Agregar Texto', '108000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(362, 4, '7702521104993', 'DogChow_SeniorLongevidad2kg', 'Agregar Texto', '27500.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(363, 4, '7702521749422', 'CatChow_AdultoCarne15Kg', 'Agregar Texto', '172500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(364, 5, '7702578327246', 'MirrapelAdvance_ControlCaidaPelo300g', 'Agregar Texto', '27500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(365, 5, '7702578830012', 'MirrapelGato_ControlCaidaPelo120ml', 'Agregar Texto', '24800.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(366, 4, '7702712002466', 'NutreCan_Senior8kg', 'Agregar Texto', '82500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(367, 4, '7702712003487', 'NutreCanAdultoCroqueta25kg', 'Agregar Texto', '134000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(368, 1, '7702712003517', 'NutreCat_Liberty 1.5kg', 'Agregar Texto', '16600.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(369, 4, '7702712003722', 'NutreCanAdultoLight2kg', 'Agregar Texto', '24000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(370, 4, '7702712004873', 'NutreCanAdultoRazaM/G25kg', 'Agregar Texto', '195000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(371, 4, '7703090552024', 'MirringoGatito1kg', 'Agregar Texto', '8900.00', 60, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(372, 4, '7703090914068', 'FilpoAdulto30kg', 'Agregar Texto', '108900.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(373, 4, '7703090932062', 'RingoCachorro30kg', 'Agregar Texto', '140500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(374, 4, '7703090954064', 'RingoAdultoCroquetas30kg', 'Agregar Texto', '115000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(375, 2, '7703090961024', 'Mirringo_Arena5kg', 'Agregar Texto', '26500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(376, 4, '7703090961079', 'MirringoAdulto8kg', 'Agregar Texto', '69000.00', 7, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(377, 4, '7703095933231', 'Guauamor_AdultoRazaM/G25kg', 'Agregar Texto', '150200.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(378, 5, '7703381240029', 'NexGard_Perro 10.125kg', 'Agregar Texto', '48500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(379, 5, '7703381240050', 'NexGard_Perro 25.1Kg50Kg', 'Agregar Texto', '56200.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(380, 5, '7703381243518', 'NexGardSpectra_Perro 25.150kg', 'Agregar Texto', '64000.00', 4, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(381, 5, '7703381244546', 'NexGard_Perro 4.110Kg', 'Agregar Texto', '41200.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(382, 5, '7703889073129', 'Cutamycon_Crema35g', 'Agregar Texto', '18000.00', 3, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(383, 5, '7703889125705', 'Cutamycon_Locion50ml', 'Agregar Texto', '20500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1);
INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(384, 5, '7704614050026', 'ZooDermin_Crema30g', 'Agregar Texto', '15800.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(385, 1, '7706192801267', 'JaraPets_Tradilla1.5cmx122cm', 'Agregar Texto', '15600.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(386, 1, '7706192801274', 'JaraPets_Tradilla2cmx122cm', 'Agregar Texto', '18550.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(387, 4, '7707001120043', 'NutrionPerro_Adulto30kg', 'Agregar Texto', '118700.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(388, 4, '7707090001063', 'Incros_VitalPeces30gr', 'Agregar Texto', '5900.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(389, 4, '7707090001087', 'Incros_Peces1kg', 'Agregar Texto', '113000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(390, 5, '7707175801892', 'Meloxicam_10ml', 'Agregar Texto', '9600.00', 3, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(391, 1, '7707196563601', 'FreeMiau_Citrico 4kg', 'Agregar Texto', '21500.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(392, 2, '7707196563618', 'FreeMiau_Lavanda4.5kg', 'Agregar Texto', '24000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(393, 2, '7707196565322', 'FreeMiau_SinOlor4.5kg', 'Agregar Texto', '23000.00', 3, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(394, 4, '7707203440178', 'ElGalpon_Conejina1kg', 'Agregar Texto', '3500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(395, 4, '7707203440383', 'SelectCatsAdulto500g', 'Agregar Texto', '3900.00', 8, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(396, 4, '7707203440475', 'SelectCatsGatito500g', 'Agregar Texto', '4400.00', 10, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(397, 4, '7707205150266', 'AgilityGold_PequeñosCachorros1.5kg', 'Agregar Texto', '29500.00', 5, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(398, 4, '7707205151065', 'AgillityGold_AdultoObeso1.5kg', 'Agregar Texto', '30000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(399, 4, '7707205151225', 'AgilityGold_GrandesAdultos3kg', 'Agregar Texto', '46900.00', 3, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(400, 4, '7707205151232', 'AgilityGold_GrandesCachorros3kg', 'Agregar Texto', '54000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(401, 4, '7707205151249', 'AgilityGold_PequeñosCachorros3kg', 'Agregar Texto', '58000.00', 0, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(402, 4, '7707205151508', 'ChunkyPerro_Cordero12kg', 'Agregar Texto', '134000.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(403, 4, '7707205151515', 'ChunkyGato_Pollo20kg', 'Agregar Texto', '143000.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(404, 7, '7707205153144', 'Chunky_PerroDeliCaprichos160g', 'Agregar Texto', '5400.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(405, 7, '7707205153502', 'Chunky_DeliDogDent150g', 'Agregar Texto', '6500.00', 2, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(406, 7, '7707205153519', 'Chunky_DeliDogMix280g', 'Agregar Texto', '14500.00', 1, NULL, '2022-08-21 00:06:04', 'SubirImagen', 1),
(407, 7, '7707205153939', 'Chunky_GatoDeliCaprichos75g', 'Agregar Texto', '3800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(408, 4, '7707205154110', 'ChunkyPerroRP_Pollo8kg', 'Agregar Texto', '55000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(409, 4, '7707205154455', 'AgilityGold_PequeñosAdultos1.5kg', 'Agregar Texto', '29800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(410, 4, '7707205154462', 'AgilityGold_PequeñosAdultos3kg', 'Agregar Texto', '54000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(411, 4, '7707205154486', 'AgilityGold_Gato500g', 'Agregar Texto', '11500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(412, 4, '7707205154493', 'ChunkyPerro_Pollo25kg', 'Agregar Texto', '158900.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(413, 4, '7707205154516', 'AgilityGold_Gato7kg', 'Agregar Texto', '136000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(414, 4, '7707205154851', 'AgilityGold_Gato1.5kg', 'Agregar Texto', '31500.00', 5, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(415, 4, '7707205154998', 'ChunkyGato_SalmonCordero8kg', 'Agregar Texto', '92500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(416, 4, '7707205157258', 'AgilityGold_AdultoObeso7kg', 'Agregar Texto', '112000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(417, 4, '7707205157760', 'AgilityGold_AdultoPiel8kg', 'Agregar Texto', '134000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(418, 4, '7707205157937', 'ChunkyCachorro_Pollo18kg', 'Agregar Texto', '143000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(419, 1, '7707214570239', 'Bismo-Pet_120 ml', 'Agregar Texto', '20400.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(420, 5, '7707232090863', 'MieltertosGripa_180ml', 'Agregar Texto', '25000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(421, 5, '7707232094946', 'Esbelt_PerfumeHembras240ml', 'Agregar Texto', '25800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(422, 5, '7707232095738', 'Esbelt_PerfumeMachos240ml', 'Agregar Texto', '25800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(423, 1, '7707241461418', 'PalaArena_CaraDeGato', 'Agregar Texto', '5000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(424, 1, '7707241461517', 'ComederoGato', 'Agregar Texto', '6500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(425, 1, '7707287638010', 'EF_AnsiedadGotas 30ml', 'Agregar Texto', '17800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(426, 5, '7707287638041', 'Esencias_ArmonizarGotas30ml', 'Agregar Texto', '17800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(427, 1, '7707287638058', 'EF_MiedoGotas 30ml', 'Agregar Texto', '17200.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(428, 1, '7707287638089', 'EF_Rescate Gotas 30ml', 'Agregar Texto', '17800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(429, 1, '7707287638102', 'EF_AgresividadGotas 30ml', 'Agregar Texto', '15600.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(430, 5, '7707287638140', 'Esencias_ArmonizarSpray250ml', 'Agregar Texto', '23000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(431, 1, '7707287638157', 'EF_MiedoSpray 250ml', 'Agregar Texto', '20300.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(432, 1, '7707287638188', 'EF_Rescate Spray 250ml', 'Agregar Texto', '20300.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(433, 5, '7707287638201', 'Esencias_Agresividad250ml', 'Agregar Texto', '23000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(434, 5, '7707287638218', 'Esencias_AnsiedadSpray250ml', 'Agregar Texto', '23000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(435, 1, '7707287638461', 'EF_EstresGotas 30ml', 'Agregar Texto', '17800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(436, 1, '7707287638478', 'EF_EstresSpray 250ml', 'Agregar Texto', '20300.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(437, 4, '7707326970408', 'Concentrado_Hamster', 'Agregar Texto', '3500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(438, 5, '7707336721922', 'BerbeelHomaccord_MedicamentoHomeopaticoCaja', 'Agregar Texto', '66200.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(439, 5, '7707336722134', 'Engystol_Gotas30ml', 'Agregar Texto', '68000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(440, 1, '7707363800676', 'PulfenNDos_GatoPerro 3.2ml', 'Agregar Texto', '17800.00', 4, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(441, 1, '7708037647559', 'Corta Uñas JaraPetsGrum', 'Agregar Texto', '12500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(442, 5, '7708304363083', 'Dentyfarm80g', 'Agregar Texto', '24300.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(443, 5, '7708304364400', 'Baxidin_60ml', 'Agregar Texto', '13000.00', 4, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(444, 4, '7708726641080', 'NutraNuggetsGato_Mantenimiento1kg', 'Agregar Texto', '19500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(445, 5, '7708786723030', 'EF_KITTENGOTAS30ML', 'Agregar Texto', '17800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(446, 5, '7708786723269', 'EF_SENIORGATOGOTAS30ML', 'Agregar Texto', '17800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(447, 5, '7708786723658', 'EF_SENIORGOTAS30ML', 'Agregar Texto', '17800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(448, 5, '7708786723917', 'EF_PUPPYGOTAS30ML', 'Agregar Texto', '17800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(449, 1, '7708863840049', 'LetsPlay_Muslo', 'Agregar Texto', '12500.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(450, 1, '7708911921102', 'Let sPlay_PelotaEco', 'Agregar Texto', '9500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(451, 1, '7708911921119', 'LetsPlay Pelota Pequeña', 'Agregar Texto', '14800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(452, 1, '7708911921126', 'LetsPlay_HuesoWOW', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(453, 1, '7708911921164', 'LetsPlay_PelotaGato', 'Agregar Texto', '8200.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(454, 1, '7708911921171', 'Let sPlay_Caña De Pescar', 'Agregar Texto', '14200.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(455, 1, '7708911921195', 'Let sPlay_HuesoPequeño', 'Agregar Texto', '12800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(456, 1, '7709009844303', 'LetsPlay_BastonPequeño', 'Agregar Texto', '14200.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(457, 1, '7709009844310', 'LetsPlay_PelotaLisaGrande', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(458, 1, '7709009844327', 'Let sPlay_Kong', 'Agregar Texto', '12300.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(459, 1, '7709009844334', 'LetsPlay_MiniPelota', 'Agregar Texto', '8000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(460, 1, '7709009844341', 'LetsPlay_MiniHueso', 'Agregar Texto', '9000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(461, 1, '7709009844365', 'Let sPlay_LlantaGrande', 'Agregar Texto', '28500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(462, 1, '7709009844372', 'LetsPlay_LlantaLazo', 'Agregar Texto', '16800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(463, 1, '7709009844389', 'Let sPlay_PelotaBoom', 'Agregar Texto', '15500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(464, 1, '7709009844396', 'LetsPlay_MordedorEco', 'Agregar Texto', '8000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(465, 4, '7709034382702', 'BrCatAdultoSalmon1kg', 'Agregar Texto', '25500.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(466, 4, '7709049265786', 'BrCat_7PlayCatnip', 'Agregar Texto', '6000.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(467, 1, '7709114593837', 'Vetisure 1000 ml ', 'Agregar Texto', '112500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(468, 1, '7709114593851', 'Vetisure 120 ml', 'Agregar Texto', '28500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(469, 7, '7709118794148', 'BrDog_SnackTocino200g', 'Agregar Texto', '10000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(470, 7, '7709118794155', 'BrDog_SnackPolloCordero200g', 'Agregar Texto', '10000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(471, 7, '7709118794193', 'BrDog_SnackPolloCorderoSalmon200g', 'Agregar Texto', '10000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(472, 1, '7709144686905', 'LetsPlay_3D Gatos', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(473, 1, '7709144686912', 'LetPlay_HuesoEco', 'Agregar Texto', '9000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(474, 1, '7709144686929', 'Let sPlay_HuesoGrandeLazo', 'Agregar Texto', '26200.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(475, 1, '7709144686936', 'LetsPlay_PelotaLisaMediana', 'Agregar Texto', '17800.00', 5, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(476, 1, '7709144686950', 'Let sPlay_Boomerang', 'Agregar Texto', '12300.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(477, 1, '7709144686967', 'Let sPlay_HuesoGrande', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(478, 1, '7709144686981', 'LetsPlay_ArosdeColores', 'Agregar Texto', '14000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(479, 4, '7709349495944', 'BrDogAdultoRP10kg', 'Agregar Texto', '173900.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(480, 4, '7709349495968', 'BrDogAdultoRazaM/G10kg', 'Agregar Texto', '183000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(481, 1, '7709369592692', 'Mershop_ComederoDoble', 'Agregar Texto', '10500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(482, 1, '7709372205824', 'Royalcanin_Persia3Latas', 'Agregar Texto', '25000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(483, 1, '7709379242105', 'Let sPlay_Twister', 'Agregar Texto', '10000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(484, 1, '7709379242112', 'LetsPlay_MiniBastonFelpa', 'Agregar Texto', '14000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(485, 1, '7709379242129', 'LetsPlay_Pesa', 'Agregar Texto', '28500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(486, 1, '7709379242136', 'LetsPlay_Jumper', 'Agregar Texto', '15900.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(487, 1, '7709379242174', 'Letsplay_TwinPequeña', 'Agregar Texto', '23000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(488, 4, '7709399777458', 'BrCat_AdultoCastrado1kg', 'Agregar Texto', '23000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(489, 7, '7709399777472', 'BrCat_SnackBolaDePelos60g', 'Agregar Texto', '6000.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(490, 4, '7709399777489', 'BrCat_AdultoCastrado3kg', 'Agregar Texto', '68500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(491, 7, '7709399777496', 'BrCat_7Equilibrio 60g', 'Agregar Texto', '6200.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(492, 2, '7709447496720', 'GatissimoArena25kg', 'Agregar Texto', '96000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(493, 1, '7709507242311', 'Let sPlay_Pato', 'Agregar Texto', '17500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(494, 1, '7709507242328', 'LetsPlay_Elefante', 'Agregar Texto', '15500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(495, 1, '7709507242335', 'Let sPlay_Pelotalazo', 'Agregar Texto', '18000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(496, 1, '7709507242342', 'LetsPlay_HappyMediana', 'Agregar Texto', '17000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(497, 1, '7709507242359', 'Let sPlay_LlantaPequeña', 'Agregar Texto', '11000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(498, 1, '7709507242366', 'LetsPlay_BocattoMediana', 'Agregar Texto', '14000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(499, 1, '7709507242373', 'LetsPlay_HappyPequeña', 'Agregar Texto', '14000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(500, 1, '7709507242380', 'LetsPlay_Salchichas', 'Agregar Texto', '17500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(501, 1, '7709507242397', 'LetsPlay_KongFelpa', 'Agregar Texto', '18000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(502, 1, '7709523925526', 'Dinky_BañoSecoCachorroGato', 'Agregar Texto', '22700.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(503, 1, '7709523925564', 'Dinky_BañoSecoCachorroPerro', 'Agregar Texto', '22700.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(504, 1, '7709567855407', 'LetsPlay_ElefanteFlecos', 'Agregar Texto', '12000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(505, 1, '7709567855414', 'LetsPlay_PelotaMediana', 'Agregar Texto', '13900.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(506, 1, '7709567855438', 'LetsPlay_PelotaGrande', 'Agregar Texto', '27000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(507, 1, '7709567855445', 'Let sPlay_BastonGrande', 'Agregar Texto', '21000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(508, 1, '7709567855452', 'Letsplay_Perro', 'Agregar Texto', '17500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(509, 1, '7709567855476', 'Let sPlay_Crazy', 'Agregar Texto', '19000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(510, 1, '7709567855490', 'LetsPlay_Frisbee', 'Agregar Texto', '18400.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(511, 2, '7709587235203', 'FofiCat_Eco2.27kg', 'Agregar Texto', '26500.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(512, 1, '7709666658350', 'RoyalCanin_AdultInstinctive3Latas', 'Agregar Texto', '17900.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(513, 4, '7709727443901', 'BrCat_AdultoPollo1kg', 'Agregar Texto', '23000.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(514, 4, '7709727443918', 'BrCat_AdultoPollo3kg', 'Agregar Texto', '56000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(515, 4, '7709727443925', 'BrCat_Gatito3kg', 'Agregar Texto', '68500.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(516, 4, '7709727443994', 'BrCat_Gatito1kg', 'Agregar Texto', '23500.00', 5, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(517, 7, '7709871629145', 'BrCat_SnackControlPeso100g', 'Agregar Texto', '7500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(518, 7, '7709871629183', 'BrCat_SnackCuidadoRenal100g', 'Agregar Texto', '7500.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(519, 1, '7709902044930', 'LetsPlay_PlatoMedioU', 'Agregar Texto', '12500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(520, 1, '7709902044947', 'LetsPlay_PesaMediana', 'Agregar Texto', '20200.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(521, 1, '7709902044961', 'LetsPlay_Star', 'Agregar Texto', '26900.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(522, 1, '7709902044985', 'LetsPlay_Serpiente', 'Agregar Texto', '19800.00', 71, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(523, 1, '7709902044992', 'LetsPlay_DuoMini3D', 'Agregar Texto', '13000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(524, 4, '7709914970623', 'BrCat_AdultoCastrado10kg', 'Agregar Texto', '213000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(525, 7, '7709951435574', 'NT_HuesoMiniFemurCerdo', 'Agregar Texto', '4200.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(526, 1, '7709990088465', 'NaturalToys_OrejaRes', 'Agregar Texto', '8500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(527, 1, '7709990088502', 'NaturalToys_OrejaCerdo', 'Agregar Texto', '7500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(528, 7, '7709990088625', 'NT_HuesoHumeroRes', 'Agregar Texto', '16600.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(529, 2, '7709990116212', 'Dinky_ShampooPerroPeloOscuro250ml', 'Agregar Texto', '22000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(530, 2, '7709990116250', 'Dinky_ShampooGato250ml', 'Agregar Texto', '22000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(531, 7, '7709990277937', 'NT_HuesoFemurCerdo', 'Agregar Texto', '7500.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(532, 2, '7709990398205', 'Dinky_ShampooPerroPeloClaro250ml', 'Agregar Texto', '22000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(533, 1, '7709990412420', 'Inmunoforz Felino 60Tab', 'Agregar Texto', '35700.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(534, 1, '7709990412505', 'Renalforz_60 tabletas', 'Agregar Texto', '32000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(535, 4, '7709990449549', 'Aves_AvenaPepa500g', 'Agregar Texto', '3500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(536, 4, '7709990449570', 'Aves_SemillaGirasol200g', 'Agregar Texto', '2800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(537, 4, '7709990794977', 'Aves_Mixtura500g', 'Agregar Texto', '3000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(538, 7, '7797453971799', 'PedigreeDentastix_RP', 'Agregar Texto', '4100.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(539, 7, '7797453971829', 'PedigreeDentastix_RMG', 'Agregar Texto', '4400.00', 9, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(540, 1, '7797600002048', 'MSPGATOS_2kga4kg', 'Agregar Texto', '26000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(541, 1, '7797600002055', 'MSPGATOS_4kga8kg', 'Agregar Texto', '31200.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(542, 5, '7798042360215', 'TotalFLC_PerroAntiparasitario10kg', 'Agregar Texto', '17200.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(543, 5, '7798042360246', 'TotalFLC_PerroAntiparasitario60kg', 'Agregar Texto', '29600.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(544, 5, '7798042361083', 'TotalFLC_PerroAntiparasitario20kg', 'Agregar Texto', '20000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(545, 5, '7798042365104', 'TotalFLC_GatoAntiparasitario', 'Agregar Texto', '18000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(546, 5, '7798042366682', 'AttackGMP_Gato0.75ml', 'Agregar Texto', '28500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(547, 5, '7798042366699', 'AttackGMP_Gato0.5ml', 'Agregar Texto', '25500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(548, 1, '7798176421288', 'Ocubiotic Colirio Antibiotico_5ml', 'Agregar Texto', '2700.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(549, 5, '7798176423039', 'Trihepat_Jarabe100', 'Agregar Texto', '51000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(550, 5, '7891106003667', 'Drontal_Gatos4kg', 'Agregar Texto', '24500.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(551, 5, '7891106003698', 'Drontal_Perros10kg', 'Agregar Texto', '26500.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(552, 4, '7896588939121', 'EquilibrioGato_Hairball7.5kg', 'Agregar Texto', '193500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(553, 4, '7896588944521', 'EquilibrioGatito_Indoor1.5kg', 'Agregar Texto', '52000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(554, 4, '7896588944545', 'EquilibrioGato_Salmon1.5kg', 'Agregar Texto', '52500.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(555, 4, '7896588944552', 'EquilibrioGato_Light1.5kg', 'Agregar Texto', '46000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(556, 4, '7896588944569', 'EquilibrioGato_PelosLongos1.5kg', 'Agregar Texto', '51800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(557, 4, '7896588944576', 'EquilibrioGato_Castrado1.5kg', 'Agregar Texto', '57800.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(558, 1, '7896588944712', 'Naturalis_Filhote 1kg', 'Agregar Texto', '21500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(559, 1, '7896588944774', 'Naturalis_AdultoPolloVegetales 1kg', 'Agregar Texto', '18500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(560, 1, '7896588944781', 'NaturalisCat_PolloVegetalesAdulto 3Kg', 'Agregar Texto', '62800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(561, 1, '7896588944828', 'NaturalisCat_CastradosAdulto 3Kg', 'Agregar Texto', '60100.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(562, 1, '7896588949007', 'DogLicious_DentalFresh 65g', 'Agregar Texto', '7000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(563, 7, '7896588949076', 'Catlicious_Hairball40g', 'Agregar Texto', '5900.00', 7, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(564, 7, '7896588949083', 'Catlicious_Indoor40g', 'Agregar Texto', '5900.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(565, 1, '7896588949090', 'Catlicious_DentalFresh 40g', 'Agregar Texto', '6200.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(566, 1, '7896588949106', 'Catlicious_TunaFish 40g', 'Agregar Texto', '6200.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(567, 1, '7896588949786', 'Catlicious_FiestaDeliciousMix 40g', 'Agregar Texto', '6350.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(568, 4, '7896588950058', 'MaxPerro_Mature2kg', 'Agregar Texto', '30000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(569, 4, '7896588950072', 'MaxPerro_LightPollo2kg', 'Agregar Texto', '27700.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(570, 4, '7896588950256', 'MaxPerro_RPCarneCerealesVegetales2kg', 'Agregar Texto', '26400.00', 4, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(571, 4, '7896588951963', 'MaxCat_GaticoPollo1kg', 'Agregar Texto', '21800.00', 11, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(572, 4, '7896588951987', 'MaxCat_Castrado1kg', 'Agregar Texto', '24000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(573, 4, '7896588951994', 'MaxCat_Castrado3kg', 'Agregar Texto', '60200.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(574, 4, '7896588952069', 'MaxCat_AdultoPolloArroz1kg', 'Agregar Texto', '20500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(575, 4, '7896588952076', 'MaxCat_AdultoPolloArroz3kg', 'Agregar Texto', '56800.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(576, 4, '7896588952083', 'MaxCat_AdultoPolloArroz10.1kg', 'Agregar Texto', '140000.00', 22, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(577, 4, '7896588952113', 'Equilibrio_Gatito8.25kg', 'Agregar Texto', '204200.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(578, 4, '7896588952632', 'MaxCat_AdultoSaboresDeMar1kg', 'Agregar Texto', '23500.00', 4, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(579, 1, '7898053580234', 'Hemolitan_30ML', 'Agregar Texto', '30000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(580, 1, '7898053580340', 'Glicopan 30ML', 'Agregar Texto', '30000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(581, 5, '7898053580371', 'VetnilEnterex_AdsorventeToxico8g', 'Agregar Texto', '9000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(582, 1, '7898053581767', 'Organew_100gr', 'Agregar Texto', '18400.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(583, 4, '7898349700018', 'MonelloPerro_Tradicional25kg', 'Agregar Texto', '225000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(584, 4, '7898349700810', 'MonelloPerro_RazaPequeña25kg', 'Agregar Texto', '271200.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(585, 4, '7898349700896', 'MonelloCachorro25kg', 'Agregar Texto', '275000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(586, 4, '7898349701329', 'MonelloGatito1kg', 'Agregar Texto', '21500.00', 7, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(587, 4, '7898349701350', 'MonelloGato_Castrado1kg', 'Agregar Texto', '23000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(588, 4, '7898349701497', 'MonelloGato_Castrado10kg', 'Agregar Texto', '165500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(589, 1, '7898349701732', 'Monello_GatoSalmonAtunPollo 7kg', 'Agregar Texto', '115800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(590, 4, '7898349701794', 'MonelloSelectPerro_RazaPequeña2kg', 'Agregar Texto', '33000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(591, 4, '7898349702456', 'BirboGato_Carne7kg', 'Agregar Texto', '88300.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(592, 4, '7898349702722', 'BirboCachorro_Carne1kg', 'Agregar Texto', '11500.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(593, 4, '7898349702753', 'BirboPerro_RPCarneCereales15kg', 'Agregar Texto', '121000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(594, 4, '7898349702777', 'BirboPerro_RPCarneCereales7kg', 'Agregar Texto', '64000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(595, 4, '7898349703569', 'MonelloGato_Salmón 1Kg', 'Agregar Texto', '19600.00', 3, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(596, 4, '7898349703651', 'MonelloGato_BolasdePelos 1Kg', 'Agregar Texto', '23000.00', 4, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(597, 2, '7898905706034', 'Gatissimo_arena4.5Kg', 'Agregar Texto', '20000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(598, 1, '792196500340', 'FatCat_Crackler', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(599, 1, '792196600446', 'FatCat_ToyRings', 'Agregar Texto', '27000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(600, 1, '792196601641', 'FatCat_FloppabilityDog_Pato', 'Agregar Texto', '48000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(601, 1, '8012320201885', 'KindomPet_CepilloMadraGrandeRedondo', 'Agregar Texto', '8200.00', 5, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(602, 1, '8056046285514', 'Plato Metalico Grande ', 'Agregar Texto', '14000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(603, 1, '8056046285521', 'Comedero_Metalico30cm', 'Agregar Texto', '19000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(604, 1, '8058093270819', 'CalabazaPets_AreneraArielBox', 'Agregar Texto', '80000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(605, 1, '809663717894', 'Spectrun_ComederoCeramicaGatoCaritas', 'Agregar Texto', '25000.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(606, 1, '811794929152', 'FurminatorPerroPequeñoPeloCorto', 'Agregar Texto', '82000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(607, 1, '842982077508', 'BellaBowls_Azul', 'Agregar Texto', '19500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(608, 1, '842982077515', 'BellaBowls_Morado', 'Agregar Texto', '19500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(609, 1, '842982077522', 'BellaBowls_RosaPez', 'Agregar Texto', '19500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(610, 1, '842982077614', 'BellaBowls_RojoCorazon', 'Agregar Texto', '19500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(611, 1, '8435632032044', 'KmtStyle_TazonMascota30cm', 'Agregar Texto', '23000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(612, 1, '853258004012', 'Emeraldpet_SnaksGatoPollo', 'Agregar Texto', '14500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(613, 1, '853258004029', 'Emeraldpet_SnaksGatoSalmon', 'Agregar Texto', '14500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(614, 1, '853258004043', 'Emeraldpet_SnaksGatoPescadoOceanico', 'Agregar Texto', '14500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(615, 1, '853258004081', 'Emeraldpet_SnaksGatoPato', 'Agregar Texto', '14500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(616, 1, '853258004098', 'Emeraldpet_SnaksGatoCatnip', 'Agregar Texto', '14500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(617, 1, '855958006648', 'INABA_TunaFilletGrilled', 'Agregar Texto', '7500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(618, 4, '857848093417', 'MaxCachorro_CrecimientoSaludable2kg', 'Agregar Texto', '28500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(619, 4, '857848093462', 'MaxPerro_RPPolloVegetales2kg', 'Agregar Texto', '28000.00', 5, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(620, 4, '8578480934621', 'MaxPerro_PolloArroz2kg', 'Agregar Texto', '27500.00', 5, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(621, 4, '857848093530', 'MaxCachorro_Performance2kg', 'Agregar Texto', '32500.00', 2, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(622, 4, '857848093578', 'MaxPerro_PerformanceRPPollo2kg', 'Agregar Texto', '30900.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(623, 4, '857848093585', 'MaxPerro_PerformanceRPPolloArroz8kg', 'Agregar Texto', '96850.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(624, 4, '857848093608', 'MaxPerro_PerformancePollo2kg', 'Agregar Texto', '32000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(625, 1, '858', 'Petsmile_Tradilla PerroNaylon Delgada', 'Agregar Texto', '19500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(626, 1, '8672190426599', 'CollarTaches_Perro', 'Agregar Texto', '7500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(627, 1, '8699245856118', 'VanCat_Bebe 5Kg', 'Agregar Texto', '22800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(628, 1, '8699245856194', 'VanCat_Lavanda 5Kg', 'Agregar Texto', '22800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(629, 1, '86992458562', 'VanCat_Primavera 5Kg', 'Agregar Texto', '21500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(630, 1, '8699245856255', 'VanCat_Primavera10kg', 'Agregar Texto', '42700.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(631, 1, '8699245856286', 'VanCat_Pino 5Kg', 'Agregar Texto', '22800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(632, 1, '8699245856330', 'VanCat_AloeVera 5Kg', 'Agregar Texto', '22800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(633, 1, '8699245856439', 'VanCat_Clinic 6L', 'Agregar Texto', '37000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(634, 1, '87', 'PetSmile_BolsitaSemillas', 'Agregar Texto', '2000.00', 8, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(635, 1, '877869001116', 'Popnbites_Oceanfish 56.7g', 'Agregar Texto', '5800.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(636, 1, '877869001123', 'Popnbites_Salmon 56.7g', 'Agregar Texto', '5800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(637, 1, '9012320200443', 'KindomPet_CepilloMaderaCaraDoble', 'Agregar Texto', '7600.00', 4, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(638, 1, '93658', 'PlatoPequeñoMetalico', 'Agregar Texto', '8000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(639, 1, '93659', 'PlatoMedianoMetalico', 'Agregar Texto', '11000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(640, 1, '99294', 'NanaStore_CorreaMascota ', 'Agregar Texto', '18000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(641, 1, 'A00030', 'Baño Iglu ', 'Agregar Texto', '75000.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(642, 1, 'AA10299', 'DoboPet_JugueteRatónColores', 'Agregar Texto', '6500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(643, 1, 'AA10305', 'FarmaPet_JugueteRatónX2Peludos', 'Agregar Texto', '8500.00', 0, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(644, 1, '3', 'Disponible', '<p>Agregar Texto</p>', '700.00', 106, NULL, '2022-08-21 00:08:33', 'disponible', 1),
(645, 1, 'B5', 'Bozal_Plastico No. 5', 'Agregar Texto', '17800.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(646, 1, 'be3', 'Beisbolera3XL', 'Agregar Texto', '40200.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(647, 1, 'bel', 'Beisbolera Talla L', 'Agregar Texto', '36000.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(648, 1, 'belxl', 'Beisbolera Talla XL', 'Agregar Texto', '38500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(649, 1, 'bem', 'Beisbolera Talla M', 'Agregar Texto', '33500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(650, 1, 'bes', 'Beisbolera Talla s', 'Agregar Texto', '30500.00', 1, NULL, '2022-08-21 00:08:33', 'SubirImagen', 1),
(651, 1, 'besiboleram', 'MatiBautique_BeisboleraM', 'Agregar Texto', '60000.00', 1, NULL, '2022-08-21 00:10:02', 'SubirImagen', 1),
(652, 1, 'besiboleraxl', 'MatiBautique_BeisboleraXL', 'Agregar Texto', '65000.00', 1, NULL, '2022-08-21 00:10:02', 'SubirImagen', 1),
(653, 1, 'bexxl', 'Beisbolera Talla XXL', 'Agregar Texto', '39000.00', 1, NULL, '2022-08-21 00:09:41', 'SubirImagen', 1),
(654, 4, '40043', 'BirboPerro_RazaM/GCarneLibra', 'Agregar Texto', '3400.00', 65, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(655, 4, '40042', 'BirboPerro_RazaM/GCarne25kg', 'Agregar Texto', '163500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(656, 1, 'BOLSERO', 'BolseroMisOrejitas', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(657, 1, 'BPC', 'BozalPitbullCuero', 'Agregar Texto', '42000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(658, 4, '40044', 'BrDog_AdultoRazaMedianaLibra', 'Agregar Texto', '9150.00', 20, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(659, 3, '30018', 'BrCatWild_LataSalmonCarne85g', 'Agregar Texto', '5700.00', 5, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(660, 4, '40045', 'BrDog_RazaPequeñaLibra', 'Agregar Texto', '7500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(661, 1, 'BT', 'Bozal sencillo varias tallas', 'Agregar Texto', '9000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(662, 1, 'camisapolol', 'MatiBautique_CamisaPoloL', 'Agregar Texto', '55000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(663, 1, 'camisapolom', 'MatiBautique_CamisaPoloM', 'Agregar Texto', '50000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(664, 2, 'carbonactivado', 'CalabazaPets_ArenaCarbónActivado25KG', 'Agregar Texto', '98800.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(665, 1, 'Cargador1', 'EspuarteMix_Cargador1', 'Agregar Texto', '15000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(666, 1, 'Cargador2', 'EspuarteMix_Cargador2', 'Agregar Texto', '30000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(667, 1, 'Cargador3', 'EspuarteMix_Cargador3', 'Agregar Texto', '45000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(668, 1, 'CB1112M', 'JaraPets_TraillaDelgadaPerro', 'Agregar Texto', '10000.00', 4, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(669, 1, 'CB1122L', 'JaraPets_CollarPerroRosaAzul', 'Agregar Texto', '15000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(670, 1, 'CD3', 'TraillayArnesGatoGrande', 'Agregar Texto', '22000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(671, 1, 'CD4', 'TraillayArnesGatoPequeño', 'Agregar Texto', '19000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(672, 1, 'cg', 'Lucamawala_CollarGrande', 'Agregar Texto', '20000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(673, 1, 'CGC', 'CollarCircular_Gato', 'Agregar Texto', '12000.00', 4, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(674, 1, 'cgp', 'CollarSiliconado_Pequeño', 'Agregar Texto', '5000.00', 10, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(675, 1, 'chim', 'ChalecoImpermeable Talla M', 'Agregar Texto', '30500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(676, 1, 'cm', 'Lucamawala_CollarMedianoPerro', 'Agregar Texto', '19000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(677, 1, 'cmg', 'Lucamawala_CollarMedianoGatoPlaca', 'Agregar Texto', '22000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(678, 1, 'cmp', 'ComedorPerroMoño', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(679, 1, 'corbanav', 'CorbatínNavideño_ RojoyVerde', 'Agregar Texto', '7000.00', 3, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(680, 1, 'cortag', 'CortaUñasGuillotina ', 'Agregar Texto', '11000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(681, 1, 'cual', 'CortauñasAlicatelima_Pequeño', 'Agregar Texto', '10000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(682, 1, 'D0617', 'PlacaCaraPitbullPastorSchnauzer', 'Agregar Texto', '18500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(683, 4, '7702521617554', 'DogChow_AdultoSinColorantes22.7kg', 'Agregar Texto', '180000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(684, 1, 'EAM0003', 'EspuarteMix_Cama3', 'Agregar Texto', '32500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(685, 1, 'EAM0004', 'EspuarteMix_Cama4', 'Agregar Texto', '37500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(686, 1, 'EAM0120', 'EspuarteMix_CollarIsabelino#5', 'Agregar Texto', '11500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(687, 1, 'EAM0192', 'EspuarteMix_ChalecoReflectivoS', 'Agregar Texto', '33300.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(688, 1, 'EAM0193', 'EspuarteMix_ChalecoReflectivoM', 'Agregar Texto', '34600.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(689, 1, 'EAM0195', 'EspuarteMix_ChalecoReflectivoXL', 'Agregar Texto', '38000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(690, 1, 'EAM0196', 'EspuarteMix_ChalecoReflectivoXXL', 'Agregar Texto', '43000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(691, 1, 'EAM0197', 'EspuarteMix_ChalecoReflectivo3XL', 'Agregar Texto', '44000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(692, 1, 'EAM0236', 'EspuarteMix_CollarMoñoGrande', 'Agregar Texto', '21000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(693, 1, 'EAM0256', 'EspuarteMix_CollarMedianoSencillo', 'Agregar Texto', '6800.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(694, 1, 'EAM0260', 'EspuarteMix_CollarIsabelino#1', 'Agregar Texto', '7500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(695, 1, 'EAM0263', 'EspuarteMix_CollarIsabelino#4', 'Agregar Texto', '10500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(696, 1, 'EAM0264', 'EspuarteMix_PecheraCueroTaches', 'Agregar Texto', '65000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(697, 1, 'EAM0292', 'EspuarteMix_LazoCorto', 'Agregar Texto', '12400.00', 3, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(698, 1, 'EAM0296', 'EspuarteMix_LazoGrueso', 'Agregar Texto', '15200.00', 7, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(699, 1, 'EAM0310', 'EspuarteMix_BozalCopa', 'Agregar Texto', '7800.00', 4, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(700, 1, 'EAM0365', 'EspuarteMix_Colchon#2Basico', 'Agregar Texto', '46500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(701, 1, 'EAM0387', 'EspuarteMix_CollarReataDobleArgollaG', 'Agregar Texto', '20500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(702, 1, 'EAM0566', 'EspuarteMix_Colchon#3Basico', 'Agregar Texto', '57000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(703, 1, 'EAM1019', 'EspuarteMix_CollarPerroGrandeNBB', 'Agregar Texto', '13500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(704, 3, '30019', 'FancyFeast_LataSurtida85gr', 'Agregar Texto', '5700.00', 9, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(705, 2, '20004', 'FreeMiau_SinOlor25kg', 'Agregar Texto', '115000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(706, 1, 'ggv', 'GuacalGatoGrisVerde', 'Agregar Texto', '70000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(707, 4, '40046', 'GuauamorPerro_RazaM/GLibra', 'Agregar Texto', '3200.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(708, 1, 'hl', 'JuguetePerroHuesoLuz', 'Agregar Texto', '9000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(709, 1, 'I2019', 'Inventario Inicial 19', 'Agregar Texto', '0.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(710, 1, 'Iglu1', 'EspuarteMix_Iglú1', 'Agregar Texto', '20000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(711, 1, 'iglú2', 'EspuarteMix_Iglú2', 'Agregar Texto', '35000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(712, 1, 'Iglú3', 'EspuarteMix_Iglú3', 'Agregar Texto', '45000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(713, 1, 'iglú4', 'EspuaerteMix_Iglú4', 'Agregar Texto', '65000.00', 3, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(714, 1, 'impermeable2xl', 'MatiBautique_Impermeable2XL', 'Agregar Texto', '50000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(715, 1, 'impermeable3xl', 'MatiBautique_Impermeable3XL', 'Agregar Texto', '50000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(716, 1, 'impermeablel', 'MatiBautique_ImpermeableL', 'Agregar Texto', '50000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(717, 1, 'impermeablem', 'MatiBautique_ImpermeableM', 'Agregar Texto', '50000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(718, 1, 'impermeablerefl', 'MatiBautique_ImpermeableReflectivoL', 'Agregar Texto', '60000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(719, 1, 'impermeables', 'MatiBautique_ImpermeableS', 'Agregar Texto', '50000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(720, 1, 'impermeablexl', 'MatiBautique_ImpermeableXL', 'Agregar Texto', '50000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(721, 4, '40047', 'Incros_VitalPecesBolsa30g', 'Agregar Texto', '4000.00', 4, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(722, 1, 'isa2', 'EspuarteMix_Collarisabelino#2', 'Agregar Texto', '8500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(723, 1, 'isa3', 'EspuarteMix_Collarisabelino#3', 'Agregar Texto', '9500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(724, 1, 'isa6', 'EspuarteMix_Collarisabelino#6', 'Agregar Texto', '12500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(725, 1, 'isa7', 'EspuarteMix_Collarisabelino7', 'Agregar Texto', '13500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(726, 1, 'isa8', 'EspuarteMix_Collarisabelino#8', 'Agregar Texto', '14500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(727, 1, 'isa9', 'EspuarteMix_Collarisabelino#9', 'Agregar Texto', '15500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(728, 1, 'JPG156', 'PELOTASGATOCASCABEL', 'Agregar Texto', '5000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(729, 1, 'JPG340', 'VARA RATON', 'Agregar Texto', '6000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(730, 1, 'mediasl', 'MediasPerroGato_Talla L', 'Agregar Texto', '12000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(731, 1, 'mediass', 'MediasPerroGato_Talla S', 'Agregar Texto', '9500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(732, 1, 'miau', 'GanchosMiau', 'Agregar Texto', '14900.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(733, 3, '30020', 'Moustache_PateConejoPez100g', 'Agregar Texto', '3700.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(734, 7, 'NTTORNILLO', 'NT_Tornillocerdo', 'Agregar Texto', '900.00', 8, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(735, 4, '40048', 'OhMaiGat_InquietosAventurerosLibra', 'Agregar Texto', '5900.00', 16, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(736, 1, 'p01', 'PelotaPequeña', 'Agregar Texto', '7000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(737, 1, 'P4CCLXS', 'Pet4Cause_CollarLuxe xs', 'Agregar Texto', '48000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(738, 1, 'P4CCSL', 'Pet4Cause_CollarSasha L', 'Agregar Texto', '38000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(739, 1, 'P4CCSM', 'Pet4Cause_CollarSasha M', 'Agregar Texto', '46000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(740, 1, 'P4CCSXS', 'Pet4Cause_CollarSasha XS', 'Agregar Texto', '38000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(741, 1, 'P4CPL', 'Pet4cause_PecheraTallaL', 'Agregar Texto', '42500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(742, 1, 'P4CPXS', 'Pet4Cause_PecheraTallaXs', 'Agregar Texto', '38000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(743, 1, 'PA01L', 'CalabazaPets_TraillaConArnesEstiloParacaídasLL', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(744, 1, 'PA01M', 'Correa con Arnés M', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(745, 1, 'PA01XL', 'CalabazaPets_TaillaConArnesEstiloParacaídasXL', 'Agregar Texto', '23000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(746, 1, 'PA03M', 'CalabazaPets_CollaryCorreaM', 'Agregar Texto', '42000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(747, 1, 'PA06L', 'CalabazaPets_TraillaConArnesJeanL', 'Agregar Texto', '18500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(748, 1, 'PA06M', 'CalabazaPets_TraillaConArnesJeanM', 'Agregar Texto', '17000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(749, 1, 'PA06S', 'ClabazaPets_TraillaConArnezJeanS', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(750, 1, 'PA09', 'CalabazaPets_TraillayArnésImitaciónCueroL', 'Agregar Texto', '35800.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(751, 1, 'PA12M', 'Correa Acero Inoxidable', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(752, 1, 'PA19L', 'Trailla y Arnés con Diseños L', 'Agregar Texto', '12900.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(753, 1, 'PA19M', 'Trailla y Arnés con Diseños M', 'Agregar Texto', '10900.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(754, 1, 'PA19S', 'Trailla y Arnés con Diseños S', 'Agregar Texto', '8900.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(755, 1, 'PA2601', 'CalabazaPets_BozalCanastillaPlasticoTS', 'Agregar Texto', '19800.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(756, 1, 'PA2603', 'CalabazaPets_BozalCanastillaPlasticoTM', 'Agregar Texto', '21800.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(757, 1, 'PA2605', 'CalabazaPets_BozalCanastillaPlasticoTL', 'Agregar Texto', '23800.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(758, 1, 'PA2623CM', 'Calabazapets_BozalCanasta23cm ', 'Agregar Texto', '16900.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(759, 1, 'PA2626CM', 'Calabazapets_Bozal26CM', 'Agregar Texto', '17900.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(760, 1, 'PA2633CM', 'Calabazapets_Bozal33CM', 'Agregar Texto', '19900.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(761, 1, 'PA27S', 'CalabazaPets_CollarEstiloKimono', 'Agregar Texto', '12900.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(762, 1, 'PA34XS', 'CalabazaPets_ArnésChalecoGatoXS', 'Agregar Texto', '32500.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(763, 1, 'PA39/3m', 'CalabazaPets_TraillaRetráctil3m', 'Agregar Texto', '23900.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(764, 1, 'PA39/5m', 'CalabazaPets_TraillaRetráctil5m', 'Agregar Texto', '26900.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(765, 1, 'PA52', 'CalabazaPets_CollarconplacaMulticolor', 'Agregar Texto', '12000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(766, 1, 'PA52XS', 'Collarconplaca_XS', 'Agregar Texto', '7000.00', 3, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(767, 1, 'PA53M', 'CalazabaPets_CollarImitaciónDiamanteM', 'Agregar Texto', '15000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(768, 1, 'PA53S', 'CalabazaPets_CollarImitaciónDiamantesS', 'Agregar Texto', '13000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1);
INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(769, 1, 'PA53XS', 'CalabazaPets_CollarImitaciónDiamantesXS', 'Agregar Texto', '11000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(770, 1, 'PA54BXL', 'CalabazaPets_CollarConLuzLEDXL', 'Agregar Texto', '21500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(771, 1, 'PA64', 'CalabazaPets_CollarDonaXS', 'Agregar Texto', '18200.00', 49, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(772, 1, 'PA64L', 'CalabazaPets_CollarDonaTL', 'Agregar Texto', '21500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(773, 1, 'PA64S', 'CalabazaPets_CollarDonaTS', 'Agregar Texto', '19200.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(774, 1, 'PA66M', 'CalabazaPets_CollarEstiloCorbatínM', 'Agregar Texto', '27500.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(775, 1, 'PA66S', 'CalabazaPets_CollarEstiloCorbatínS', 'Agregar Texto', '25000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(776, 1, 'PA70L', 'CalabazaPets_ArnésAntitironesTallaL', 'Agregar Texto', '27000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(777, 1, 'PA70M', 'CalabazaPets_ArnésAntitironesTallaM', 'Agregar Texto', '26000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(778, 1, 'PA70S', 'CalabazaPets_ArnésAntitironesTallaS', 'Agregar Texto', '23000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(779, 1, 'PA70XL', 'CalabazaPets_ArnésAntitironesTallaXL', 'Agregar Texto', '28000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(780, 1, 'PA70XS', 'CalabazaPets_ArnésAntitironesTallaXS', 'Agregar Texto', '22000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(781, 1, 'PA70XXL', 'CalabazaPets_ArnésAntitironesTallaXXL', 'Agregar Texto', '30000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(782, 1, 'PA72', 'CalabazaPets_Trailla Reflectiva Multicolor', 'Agregar Texto', '15500.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(783, 1, 'PA73L', 'Trailla en Lona con Líneas L', 'Agregar Texto', '21000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(784, 1, 'PA73S', 'Trailla en Lona con Líneas S', 'Agregar Texto', '19900.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(785, 1, 'PA81', 'CalabazaPets_TraillaMangoGoma', 'Agregar Texto', '25500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(786, 1, 'PA87A', 'CalabazaPets_CollarArcoiris', 'Agregar Texto', '5000.00', 12, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(787, 1, 'PA91', 'CalabazaPets_CollarDiseñoPez', 'Agregar Texto', '11000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(788, 1, 'PATU', 'PatuDogs Tallaxxs', 'Agregar Texto', '27000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(789, 1, 'patul', 'PatuDogs_TallaL', 'Agregar Texto', '32900.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(790, 1, 'patum', 'PatuDogs TallaM', 'Agregar Texto', '32900.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(791, 1, 'PATUS', 'PatuDogs TallaS', 'Agregar Texto', '28000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(792, 1, 'PATUXS', 'PatuDogs TallaXS', 'Agregar Texto', '28000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(793, 1, 'PB103', 'CalabazaPets_GuacalHuellitasPequeño', 'Agregar Texto', '62000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(794, 1, 'PB16NO1', 'Guacal Sencillo Con Tornillos S', 'Agregar Texto', '79000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(795, 1, 'PB19', 'CalabazaPets_GuacalDobleSeguro', 'Agregar Texto', '120000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(796, 1, 'PB26', 'Cama Colgante Gato', 'Agregar Texto', '25500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(797, 1, 'PB31XL', 'CalabazaPets_CamaRedondadiseñosXL', 'Agregar Texto', '37900.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(798, 1, 'PB59L', 'CalabazaPets_CamadiseñoBuhosL', 'Agregar Texto', '50000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(799, 1, 'PB59M', 'CalabazaPets_CamadiseñoBuhosM', 'Agregar Texto', '40000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(800, 1, 'PB85', 'CalabazaPets_CápsulaMorralCabina', 'Agregar Texto', '110000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(801, 1, 'PC1115CM', 'ComederoAcero15cm', 'Agregar Texto', '10000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(802, 1, 'PC1118CM', 'ComederoAcero18cm', 'Agregar Texto', '12000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(803, 1, 'PC13B', 'CalabazaPets_ComederoCaradeGatoB', 'Agregar Texto', '25000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(804, 1, 'PC19FILTRO', 'Filtro_FuenteCuadrada', 'Agregar Texto', '10000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(805, 1, 'PC24', 'PetBottles_Biberon', 'Agregar Texto', '8900.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(806, 1, 'PC88', 'Calabazapets_ComederoAntireflujoGato', 'Agregar Texto', '12000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(807, 1, 'PC96', 'CalabazaPets_ComederoAntireflujo', 'Agregar Texto', '15000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(808, 1, 'peg*3', 'Pegatinas*3', 'Agregar Texto', '7500.00', 4, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(809, 1, 'PEGA', 'Pegatinas', 'Agregar Texto', '2500.00', 39, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(810, 1, 'PERCHERO', 'Petchero Línea Woof', 'Agregar Texto', '24900.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(811, 1, 'pet2', 'BaritaPetSmilePlumas_Gato', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(812, 1, 'petpaño', 'PetSmile_Pañoleta BorlasTalla S/M', 'Agregar Texto', '8500.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(813, 1, 'pgato', 'PesaParaGatoConRaton', 'Agregar Texto', '6500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(814, 1, 'phuesogrande', 'PlacaHuesoGrande', 'Agregar Texto', '17000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(815, 1, 'PJ0212U', 'CalabazaPets_JuguetedeAlgodonVarios', 'Agregar Texto', '6700.00', 6, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(816, 1, 'PJ06', 'Hueso con luz', 'Agregar Texto', '7000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(817, 1, 'PJ07', 'Pelota luz Balón y Chuzos', 'Agregar Texto', '8000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(818, 1, 'PJ09B', 'Calabazapets_FrisbeePequeño', 'Agregar Texto', '3500.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(819, 1, 'PJ10', 'CalabazaPets_PisosGiratorios', 'Agregar Texto', '21900.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(820, 1, 'PJ12B', 'CalabazaPets_AveSonido', 'Agregar Texto', '11200.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(821, 1, 'pj13', 'JuegodeRatones ', 'Agregar Texto', '4500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(822, 1, 'PJ15', 'Vara de Alambre con Plumas', 'Agregar Texto', '7500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(823, 1, 'PJ18A6CM', 'Pelota cascabel peque', 'Agregar Texto', '6000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(824, 1, 'PJ18A8CM', 'Pelota Cascabel M', 'Agregar Texto', '7500.00', 5, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(825, 1, 'PJ29', 'CalabazaPets_VaraNaturaEnMadera', 'Agregar Texto', '8000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(826, 1, 'PJ30', 'Pelota Metálica con Ratón', 'Agregar Texto', '5000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(827, 1, 'PJ31TMITAD', 'Rascador Triangulo Mitad', 'Agregar Texto', '23000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(828, 1, 'PJ3204', 'CalabazaPets_GymGato', 'Agregar Texto', '150000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(829, 1, 'PJ3226A', 'CalabazaPets_GimnasioFlores', 'Agregar Texto', '185000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(830, 1, 'PJ3227', 'ClabazaPets_GimnasioPequeñoCircular', 'Agregar Texto', '65500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(831, 1, 'PJ340', 'Pescados Catnip L', 'Agregar Texto', '15500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(832, 1, 'PJ39', 'VaraPlumasPequeña', 'Agregar Texto', '8000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(833, 1, 'PJ48', 'JugueteFelpaComida', 'Agregar Texto', '6000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(834, 1, 'PJ53', 'Combo 3 Pelotas', 'Agregar Texto', '13500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(835, 1, 'PJ98', 'CalabazaPets_RoundiBall', 'Agregar Texto', '35500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(836, 1, 'plp', 'PelotaLocaPerro', 'Agregar Texto', '11000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(837, 1, 'pops', 'Misorejitas_Popsocketsleev-e', 'Agregar Texto', '17900.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(838, 1, 'PP04', 'CalabazaPets_GuantesGoma', 'Agregar Texto', '8500.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(839, 1, 'PP07L', 'LimpiaPatas_Talla L', 'Agregar Texto', '26500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(840, 1, 'PP10L', 'CalabazaPets_KitCepilloPeineL', 'Agregar Texto', '9200.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(841, 1, 'PP10S', 'CalabazaPets_KitCepilloPeineS', 'Agregar Texto', '8200.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(842, 1, 'PP13', 'CalabazaPets_RasquetaGrande', 'Agregar Texto', '25000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(843, 1, 'PP26L', 'CortaUñas_AlicateGrandeConLima', 'Agregar Texto', '15000.00', 3, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(844, 1, 'PP30A', 'CortauñasTijera_Pequeño', 'Agregar Texto', '5000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(845, 1, 'PP3110219', 'PragaPet_BolaGatoPluma', 'Agregar Texto', '6000.00', 3, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(846, 1, 'pp3110238', 'PragaPet_CollarCueroSintentico#2H', 'Agregar Texto', '16000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(847, 1, 'PP3110323', 'EspuarteMix_BolaBoxeadoraRaton', 'Agregar Texto', '7500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(848, 1, 'PP49', 'CortaUñas_ConCubierta', 'Agregar Texto', '22600.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(849, 1, 'PPO7M', 'LimpiaPatas_Talla M', 'Agregar Texto', '22500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(850, 1, 'PR02', 'CalabazaPets_AreneraAbatibleConPala', 'Agregar Texto', '87500.00', 3, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(851, 2, 'PR05*', 'CalabazaPets_AreneraCerrada', 'Agregar Texto', '110000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(852, 1, 'PR06', 'CalabazaPets_AreneraSencillaConPala', 'Agregar Texto', '26900.00', 3, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(853, 1, 'PR10', 'PalaGato', 'Agregar Texto', '5000.00', 6, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(854, 1, 'PR12', 'CalabazaPets_Dispensador', 'Agregar Texto', '7000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(855, 1, 'PR30A', 'Tapete Huella', 'Agregar Texto', '10000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(856, 1, 'PR32L', 'CalabazaPets_TapeteCapaDobleTL', 'Agregar Texto', '38500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(857, 1, 'PR32M', 'CalabazaPets_TapeteCapaDobleTM', 'Agregar Texto', '30900.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(858, 1, 'PR34', 'CalabazaPets_DispensadorBolsasPoo', 'Agregar Texto', '9900.00', 24, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(859, 2, 'PR49', 'CalabazaPets_AreneraHuevo', 'Agregar Texto', '25000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(860, 1, 'PR60', 'CalabazaPets_AreneraGrandeSemicerradaAlta', 'Agregar Texto', '39900.00', 4, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(861, 1, 'PR62', 'CalabazaPets_AreneraSemicerradaGenie', 'Agregar Texto', '42900.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(862, 1, 'PS', 'Popsocketvariados', 'Agregar Texto', '20000.00', 2, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(863, 1, 'PTXL', 'Pechera reflectiva Talla XL', 'Agregar Texto', '75200.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(864, 1, 'RegistroManual', 'Disponible', 'Agregar Texto', '0.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(865, 1, 'rpetsmile', 'PetSmile_RascadorSencillo', 'Agregar Texto', '75000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(866, 1, 'rv', 'Ratón_Vaiven', 'Agregar Texto', '7000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(867, 1, 'SACO1', 'Sacodelana_JirafaTallaS', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(868, 1, 'sacoazulyrosa', 'SacoAzulyRosa_S M', 'Agregar Texto', '20000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(869, 1, 'sacoblanco', 'SacoBlanco_Talla S M ', 'Agregar Texto', '20000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(870, 1, 'sacobxs', 'SacoBlanco_Talla XS', 'Agregar Texto', '15000.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(871, 1, 'saconavxs', 'SacoNavideño_Talla XS', 'Agregar Texto', '15000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(872, 4, '40049', 'Supercan_Adulto30kg', 'Agregar Texto', '115000.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(873, 1, 'Soporte', 'SoporteWoofMiau', 'Agregar Texto', '23900.00', 3, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(874, 4, '40050', 'SuperCan_AdultoLibra ', 'Agregar Texto', '2100.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(875, 1, 'VCA027', 'JaraPets_CollarGatoDiamantes', 'Agregar Texto', '7500.00', 1, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1),
(876, 1, 'X001X5GCM7', 'CalabazaPets_RascadorEsquineroGato', 'Agregar Texto', '10500.00', 0, NULL, '2022-08-21 00:11:44', 'SubirImagen', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolso`
--

CREATE TABLE `reembolso` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `idtransaccion` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datosreembolso` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(150) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `nombrerol` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema', 1),
(2, 'Supervisor', 'Supervisor de tiendas', 1),
(3, 'Cliente', 'Clientes en general', 1),
(4, 'Vendedor', 'Operador de tienda', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripciones`
--

CREATE TABLE `suscripciones` (
  `idsuscripcion` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `suscripciones`
--

INSERT INTO `suscripciones` (`idsuscripcion`, `nombre`, `email`, `datecreated`) VALUES
(1, 'Roberto', 'toolsfordeveloper@gmail.com', '2021-08-20 04:05:10'),
(2, 'Juan David', 'rozo.juan0107@gmail.com', '2022-06-24 14:36:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `idtipopago` bigint(20) NOT NULL,
  `tipopago` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
(1, 'PayPal', 1),
(2, 'Efectivo', 1),
(3, 'Tarjeta', 1),
(4, 'Cheque', 1),
(5, 'Despósito Bancario', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`),
  ADD KEY `personaid` (`personaid`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`idmascota`),
  ADD KEY `idpersona` (`idpersona`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `personaid` (`personaid`),
  ADD KEY `tipopagoid` (`tipopagoid`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `rolid` (`rolid`),
  ADD KEY `moduloid` (`moduloid`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `rolid` (`rolid`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idpost`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaid` (`categoriaid`);

--
-- Indices de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  ADD PRIMARY KEY (`idsuscripcion`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`idtipopago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `idmascota` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `idpost` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=877;

--
-- AUTO_INCREMENT de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  MODIFY `idsuscripcion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `idtipopago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`tipopagoid`) REFERENCES `tipopago` (`idtipopago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD CONSTRAINT `reembolso_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
