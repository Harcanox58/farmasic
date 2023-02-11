-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2022 a las 19:40:12
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dev_farmasic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_accounts`
--

CREATE TABLE `fs_accounts` (
  `id_account` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `op_type` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_archived` varchar(255) DEFAULT NULL,
  `inserted_at` datetime DEFAULT NULL,
  `id_inserted_by` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `id_update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_accounts`
--

INSERT INTO `fs_accounts` (`id_account`, `name`, `op_type`, `code`, `is_archived`, `inserted_at`, `id_inserted_by`, `update_at`, `id_update_by`) VALUES
(1, 'BANCOS', NULL, '1010501', NULL, '2022-07-18 03:23:08', -1, '2022-07-18 03:23:16', -1),
(2, 'FONDOS DE TRANSITO', NULL, '10105', NULL, NULL, NULL, NULL, NULL),
(3, 'REGULACION DE TERRENOS', '', '3021001', NULL, NULL, NULL, NULL, NULL),
(4, 'OTRAS ENTIDADES FINANCIERAS', NULL, '8010502', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_active_compounds`
--

CREATE TABLE `fs_active_compounds` (
  `id_active_compound` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `is_sicotropico` varchar(255) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_active_compounds`
--

INSERT INTO `fs_active_compounds` (`id_active_compound`, `name`, `is_sicotropico`, `op_status`) VALUES
(1, 'Test', '0', 'A'),
(2, 'TEST 2', '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_audit_trails`
--

CREATE TABLE `fs_audit_trails` (
  `id_audit_trail` int(255) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `action_type` varchar(16) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `recordid` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_audit_trails`
--

INSERT INTO `fs_audit_trails` (`id_audit_trail`, `id_user`, `date`, `action_type`, `description`, `table_name`, `recordid`) VALUES
(1, 1, '2022-07-23 04:01:26', 'create', 'Creó un nuevo asiento', NULL, NULL),
(2, 1, '2022-07-23 04:03:16', 'create', 'Creó un nuevo asiento', 'accounting_vouchers', 1),
(3, 1, '2022-07-23 04:03:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 100),
(4, 1, '2022-07-23 04:04:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 100),
(5, 1, '2022-07-23 04:05:01', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(6, 1, '2022-07-23 04:06:30', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(7, 1, '2022-07-23 04:13:32', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(8, 1, '2022-07-23 04:14:47', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(9, 1, '2022-07-23 04:15:23', 'CREATE', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(10, 1, '2022-07-23 04:15:46', 'CREATE', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(11, 1, '2022-07-23 04:16:32', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(12, 1, '2022-07-23 04:17:55', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(13, 1, '2022-07-23 04:19:23', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(14, 1, '2022-07-23 04:37:23', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', NULL),
(15, 1, '2022-07-23 04:37:52', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', NULL),
(16, 1, '2022-07-23 04:39:03', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 1),
(17, 1, '2022-07-23 04:44:19', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 2),
(18, 1, '2022-07-23 04:45:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(19, 1, '2022-07-23 04:47:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(20, 1, '2022-07-23 04:47:43', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(21, 1, '2022-07-23 04:47:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(22, 1, '2022-07-23 04:48:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(23, 1, '2022-07-23 04:48:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(24, 1, '2022-07-23 04:49:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(25, 1, '2022-07-23 04:49:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(26, 1, '2022-07-23 04:53:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(27, 1, '2022-07-23 04:54:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(28, 1, '2022-07-23 04:55:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(29, 1, '2022-07-23 04:56:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(30, 1, '2022-07-23 05:01:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(31, 1, '2022-07-23 05:01:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(32, 1, '2022-07-23 05:02:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(33, 1, '2022-07-23 05:03:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(34, 1, '2022-07-23 05:04:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(35, 1, '2022-07-23 05:04:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(36, 1, '2022-07-23 05:05:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(37, 1, '2022-07-23 05:06:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(38, 1, '2022-07-23 05:06:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(39, 1, '2022-07-23 05:07:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(40, 1, '2022-07-23 05:09:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(41, 1, '2022-07-23 05:10:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(42, 1, '2022-07-23 05:10:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(43, 1, '2022-07-23 05:10:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(44, 1, '2022-07-23 05:11:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(45, 1, '2022-07-23 05:11:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(46, 1, '2022-07-23 05:12:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(47, 1, '2022-07-23 05:13:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(48, 1, '2022-07-23 05:14:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(49, 1, '2022-07-23 05:14:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(50, 1, '2022-07-23 05:16:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(51, 1, '2022-07-23 05:16:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(52, 1, '2022-07-23 05:16:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(53, 1, '2022-07-23 05:19:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(54, 1, '2022-07-23 05:19:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(55, 1, '2022-07-23 05:19:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(56, 1, '2022-07-23 05:21:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(57, 1, '2022-07-23 05:23:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(58, 1, '2022-07-23 05:23:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(59, 1, '2022-07-23 05:24:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(60, 1, '2022-07-23 05:26:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(61, 1, '2022-07-23 05:42:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(62, 1, '2022-07-23 05:46:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(63, 1, '2022-07-23 06:32:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(64, 1, '2022-07-23 06:48:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(65, 1, '2022-07-23 06:48:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(66, 1, '2022-07-23 06:49:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(67, 1, '2022-07-23 06:49:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(68, 1, '2022-07-23 06:49:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(69, 1, '2022-07-23 06:50:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(70, 1, '2022-07-23 06:50:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(71, 1, '2022-07-23 06:50:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(72, 1, '2022-07-23 06:52:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(73, 1, '2022-07-23 06:53:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(74, 1, '2022-07-23 06:53:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(75, 1, '2022-07-23 06:55:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(76, 1, '2022-07-23 06:56:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(77, 1, '2022-07-23 06:56:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(78, 1, '2022-07-23 06:57:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(79, 1, '2022-07-23 06:57:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(80, 1, '2022-07-23 06:59:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(81, 1, '2022-07-23 06:59:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(82, 1, '2022-07-23 07:01:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(83, 1, '2022-07-23 07:02:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(84, 1, '2022-07-23 07:02:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(85, 1, '2022-07-23 07:05:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(86, 1, '2022-07-23 07:05:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(87, 1, '2022-07-23 07:06:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(88, 1, '2022-07-23 07:06:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(89, 1, '2022-07-23 07:08:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(90, 1, '2022-07-23 07:08:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(91, 1, '2022-07-23 07:08:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(92, 1, '2022-07-23 07:09:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(93, 1, '2022-07-23 07:09:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(94, 1, '2022-07-23 07:10:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(95, 1, '2022-07-23 07:10:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(96, 1, '2022-07-23 07:13:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(97, 1, '2022-07-23 07:13:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(98, 1, '2022-07-23 07:14:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(99, 1, '2022-07-23 07:14:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(100, 1, '2022-07-23 07:14:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(101, 1, '2022-07-23 07:14:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(102, 1, '2022-07-23 07:15:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(103, 1, '2022-07-23 07:15:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(104, 1, '2022-07-23 07:16:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(105, 1, '2022-07-23 07:17:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(106, 1, '2022-07-23 07:17:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(107, 1, '2022-07-23 07:17:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(108, 1, '2022-07-23 07:18:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(109, 1, '2022-07-23 07:18:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(110, 1, '2022-07-23 07:19:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(111, 1, '2022-07-23 07:19:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(112, 1, '2022-07-23 07:19:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(113, 1, '2022-07-23 07:20:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(114, 1, '2022-07-23 07:20:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(115, 1, '2022-07-23 07:21:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(116, 1, '2022-07-23 07:21:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(117, 1, '2022-07-23 07:23:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(118, 1, '2022-07-23 07:23:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(119, 1, '2022-07-23 07:25:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(120, 1, '2022-07-23 07:25:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(121, 1, '2022-07-23 07:25:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(122, 1, '2022-07-23 07:26:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(123, 1, '2022-07-23 07:26:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(124, 1, '2022-07-23 07:26:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(125, 1, '2022-07-23 07:27:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(126, 1, '2022-07-23 07:29:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(127, 1, '2022-07-23 07:29:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(128, 1, '2022-07-23 07:30:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(129, 1, '2022-07-23 07:40:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(130, 1, '2022-07-23 07:41:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(131, 1, '2022-07-23 07:41:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(132, 1, '2022-07-23 07:43:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(133, 1, '2022-07-23 07:43:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(134, 1, '2022-07-23 07:43:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(135, 1, '2022-07-23 07:44:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(136, 1, '2022-07-23 07:45:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(137, 1, '2022-07-23 07:49:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(138, 1, '2022-07-23 07:49:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(139, 1, '2022-07-23 07:50:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(140, 1, '2022-07-23 07:50:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(141, 1, '2022-07-23 07:50:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(142, 1, '2022-07-23 07:51:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(143, 1, '2022-07-23 07:51:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(144, 1, '2022-07-23 07:51:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(145, 1, '2022-07-23 07:51:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(146, 1, '2022-07-23 07:52:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(147, 1, '2022-07-23 07:52:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(148, 1, '2022-07-23 07:52:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(149, 1, '2022-07-23 07:52:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(150, 1, '2022-07-23 07:53:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(151, 1, '2022-07-23 07:53:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(152, 1, '2022-07-23 07:57:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(153, 1, '2022-07-23 07:57:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(154, 1, '2022-07-23 07:58:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(155, 1, '2022-07-23 07:58:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(156, 1, '2022-07-23 07:58:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(157, 1, '2022-07-23 07:58:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(158, 1, '2022-07-23 07:59:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(159, 1, '2022-07-23 07:59:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(160, 1, '2022-07-23 08:01:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(161, 1, '2022-07-23 08:01:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(162, 1, '2022-07-23 08:03:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(163, 1, '2022-07-23 08:03:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(164, 1, '2022-07-23 08:03:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(165, 1, '2022-07-23 08:03:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(166, 1, '2022-07-23 08:04:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(167, 1, '2022-07-23 08:04:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(168, 1, '2022-07-23 08:07:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(169, 1, '2022-07-23 08:09:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(170, 1, '2022-07-23 08:11:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(171, 1, '2022-07-23 08:11:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(172, 1, '2022-07-23 08:12:43', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(173, 1, '2022-07-23 08:12:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(174, 1, '2022-07-23 08:13:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(175, 1, '2022-07-23 08:13:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(176, 1, '2022-07-23 08:14:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(177, 1, '2022-07-23 08:14:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(178, 1, '2022-07-23 08:16:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(179, 1, '2022-07-23 08:16:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(180, 1, '2022-07-23 08:16:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(181, 1, '2022-07-23 08:16:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(182, 1, '2022-07-23 08:21:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(183, 1, '2022-07-23 08:21:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(184, 1, '2022-07-23 08:22:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(185, 1, '2022-07-23 08:22:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(186, 1, '2022-07-23 08:23:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(187, 1, '2022-07-23 08:23:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(188, 1, '2022-07-23 08:23:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(189, 1, '2022-07-23 08:23:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(190, 1, '2022-07-23 08:24:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(191, 1, '2022-07-23 08:24:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(192, 1, '2022-07-23 08:25:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(193, 1, '2022-07-23 08:25:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(194, 1, '2022-07-23 08:26:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(195, 1, '2022-07-23 08:26:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(196, 1, '2022-07-23 08:27:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(197, 1, '2022-07-23 08:27:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(198, 1, '2022-07-23 08:27:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(199, 1, '2022-07-23 08:27:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(200, 1, '2022-07-23 08:28:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(201, 1, '2022-07-23 08:28:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(202, 1, '2022-07-23 08:28:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(203, 1, '2022-07-23 08:28:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(204, 1, '2022-07-23 08:34:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(205, 1, '2022-07-23 08:34:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(206, 1, '2022-07-23 08:35:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(207, 1, '2022-07-23 08:35:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(208, 1, '2022-07-23 08:36:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(209, 1, '2022-07-23 08:36:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(210, 1, '2022-07-23 08:37:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(211, 1, '2022-07-23 08:37:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(212, 1, '2022-07-23 08:37:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(213, 1, '2022-07-23 08:37:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(214, 1, '2022-07-23 08:38:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(215, 1, '2022-07-23 08:38:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(216, 1, '2022-07-23 08:38:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(217, 1, '2022-07-23 08:39:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(218, 1, '2022-07-23 08:39:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(219, 1, '2022-07-23 08:39:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(220, 1, '2022-07-23 08:39:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(221, 1, '2022-07-23 08:41:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(222, 1, '2022-07-23 08:42:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(223, 1, '2022-07-23 08:42:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(224, 1, '2022-07-23 08:43:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(225, 1, '2022-07-23 08:44:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(226, 1, '2022-07-23 08:45:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(227, 1, '2022-07-23 08:45:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(228, 1, '2022-07-23 08:45:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(229, 1, '2022-07-23 08:47:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(230, 1, '2022-07-23 08:47:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(231, 1, '2022-07-23 08:48:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(232, 1, '2022-07-23 08:48:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(233, 1, '2022-07-23 08:48:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(234, 1, '2022-07-23 08:48:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(235, 1, '2022-07-23 08:49:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(236, 1, '2022-07-23 08:49:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(237, 1, '2022-07-23 08:50:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(238, 1, '2022-07-23 08:50:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(239, 1, '2022-07-23 08:50:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(240, 1, '2022-07-23 08:50:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(241, 1, '2022-07-23 08:51:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(242, 1, '2022-07-23 08:51:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(243, 1, '2022-07-23 08:51:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(244, 1, '2022-07-23 08:51:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(245, 1, '2022-07-23 08:51:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(246, 1, '2022-07-23 08:53:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(247, 1, '2022-07-23 08:53:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(248, 1, '2022-07-23 08:53:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(249, 1, '2022-07-23 08:53:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(250, 1, '2022-07-23 08:54:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(251, 1, '2022-07-23 08:54:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(252, 1, '2022-07-23 08:54:43', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(253, 1, '2022-07-23 08:54:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(254, 1, '2022-07-23 08:55:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(255, 1, '2022-07-23 08:55:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(256, 1, '2022-07-23 08:55:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(257, 1, '2022-07-23 08:55:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(258, 1, '2022-07-23 08:56:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(259, 1, '2022-07-23 08:56:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(260, 1, '2022-07-23 08:56:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(261, 1, '2022-07-23 08:56:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(262, 1, '2022-07-23 08:58:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(263, 1, '2022-07-23 08:58:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(264, 1, '2022-07-23 08:58:43', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(265, 1, '2022-07-23 08:58:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(266, 1, '2022-07-23 08:58:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(267, 1, '2022-07-23 08:58:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(268, 1, '2022-07-23 08:59:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(269, 1, '2022-07-23 08:59:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(270, 1, '2022-07-23 08:59:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(271, 1, '2022-07-23 09:01:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(272, 1, '2022-07-23 09:01:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(273, 1, '2022-07-23 09:01:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(274, 1, '2022-07-23 09:01:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(275, 1, '2022-07-23 09:01:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(276, 1, '2022-07-23 09:03:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(277, 1, '2022-07-23 09:03:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(278, 1, '2022-07-23 09:04:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(279, 1, '2022-07-23 09:04:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(280, 1, '2022-07-23 09:05:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(281, 1, '2022-07-23 09:05:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(282, 1, '2022-07-23 09:05:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(283, 1, '2022-07-23 09:05:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(284, 1, '2022-07-23 09:06:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(285, 1, '2022-07-23 09:06:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(286, 1, '2022-07-23 09:06:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(287, 1, '2022-07-23 09:06:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(288, 1, '2022-07-23 09:06:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(289, 1, '2022-07-23 09:06:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(290, 1, '2022-07-23 09:08:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(291, 1, '2022-07-23 09:09:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(292, 1, '2022-07-23 09:09:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(293, 1, '2022-07-23 09:09:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(294, 1, '2022-07-23 09:09:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(295, 1, '2022-07-23 09:14:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(296, 1, '2022-07-23 09:14:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(297, 1, '2022-07-23 09:14:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(298, 1, '2022-07-23 09:14:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(299, 1, '2022-07-23 09:47:32', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 3),
(300, 1, '2022-07-23 09:47:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(301, 1, '2022-07-23 09:47:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(302, 1, '2022-07-23 09:47:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(303, 1, '2022-07-23 09:47:45', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 4),
(304, 1, '2022-07-23 09:47:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(305, 1, '2022-07-23 09:47:50', 'create', 'Creó un nuevo asiento', 'fs_accounting_vouchers', 5),
(306, 1, '2022-07-23 09:47:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 5),
(307, 1, '2022-07-23 09:48:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(308, 1, '2022-07-23 09:48:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(309, 1, '2022-07-28 01:23:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(310, 1, '2022-07-28 01:23:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(311, 1, '2022-07-28 01:29:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(312, 1, '2022-07-28 01:29:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(313, 1, '2022-07-28 01:29:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(314, 1, '2022-07-28 01:29:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(315, 1, '2022-07-28 01:29:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(316, 1, '2022-07-28 01:30:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(317, 1, '2022-07-28 01:30:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(318, 1, '2022-07-28 01:30:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(319, 1, '2022-07-28 01:30:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(320, 1, '2022-07-28 01:30:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(321, 1, '2022-07-28 01:30:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(322, 1, '2022-07-28 01:30:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(323, 1, '2022-07-28 01:30:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(324, 1, '2022-07-28 01:32:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(325, 1, '2022-07-28 01:32:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(326, 1, '2022-07-28 01:32:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(327, 1, '2022-07-28 01:34:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(328, 1, '2022-07-28 01:34:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(329, 1, '2022-07-28 01:35:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(330, 1, '2022-07-28 01:35:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(331, 1, '2022-07-28 01:35:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(332, 1, '2022-07-28 01:35:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(333, 1, '2022-07-28 01:36:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(334, 1, '2022-07-28 01:36:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(335, 1, '2022-07-28 01:37:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(336, 1, '2022-07-28 01:37:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(337, 1, '2022-07-28 01:37:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(338, 1, '2022-07-28 01:37:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(339, 1, '2022-07-28 01:38:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(340, 1, '2022-07-28 01:39:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(341, 1, '2022-07-28 01:40:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(342, 1, '2022-07-28 01:40:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(343, 1, '2022-07-28 01:40:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(344, 1, '2022-07-28 01:40:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(345, 1, '2022-07-28 01:40:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(346, 1, '2022-07-28 01:40:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(347, 1, '2022-07-28 01:44:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(348, 1, '2022-07-28 01:44:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(349, 1, '2022-07-28 01:51:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(350, 1, '2022-07-28 01:51:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(351, 1, '2022-07-28 01:51:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(352, 1, '2022-07-28 01:51:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(353, 1, '2022-07-28 01:52:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(354, 1, '2022-07-28 01:52:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(355, 1, '2022-07-28 01:53:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(356, 1, '2022-07-28 01:53:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(357, 1, '2022-07-28 01:54:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(358, 1, '2022-07-28 01:54:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(359, 1, '2022-07-28 01:54:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(360, 1, '2022-07-28 01:54:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(361, 1, '2022-07-28 01:54:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(362, 1, '2022-07-28 01:54:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(363, 1, '2022-07-28 01:55:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(364, 1, '2022-07-28 01:55:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(365, 1, '2022-07-28 01:56:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(366, 1, '2022-07-28 01:56:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(367, 1, '2022-07-28 01:56:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(368, 1, '2022-07-28 01:56:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(369, 1, '2022-07-28 01:56:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(370, 1, '2022-07-28 01:56:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(371, 1, '2022-07-28 01:56:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(372, 1, '2022-07-28 01:56:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(373, 1, '2022-07-28 02:13:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(374, 1, '2022-07-28 02:13:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(375, 1, '2022-07-28 02:15:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(376, 1, '2022-07-28 02:15:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(377, 1, '2022-07-28 02:17:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(378, 1, '2022-07-28 02:17:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(379, 1, '2022-07-28 02:18:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(380, 1, '2022-07-28 02:18:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(381, 1, '2022-07-28 02:18:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(382, 1, '2022-07-28 02:18:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(383, 1, '2022-07-28 02:18:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(384, 1, '2022-07-28 02:18:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(385, 1, '2022-07-28 02:19:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(386, 1, '2022-07-28 02:19:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(387, 1, '2022-07-28 02:20:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(388, 1, '2022-07-28 02:21:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(389, 1, '2022-07-28 02:21:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(390, 1, '2022-07-28 02:21:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(391, 1, '2022-07-28 02:21:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(392, 1, '2022-07-28 02:21:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(393, 1, '2022-07-28 02:21:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(394, 1, '2022-07-28 02:21:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(395, 1, '2022-07-28 02:21:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(396, 1, '2022-07-28 02:21:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(397, 1, '2022-07-28 02:21:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(398, 1, '2022-07-28 02:22:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(399, 1, '2022-07-28 02:22:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(400, 1, '2022-07-28 02:22:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(401, 1, '2022-07-28 02:23:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(402, 1, '2022-07-28 02:23:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(403, 1, '2022-07-28 02:23:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(404, 1, '2022-07-28 02:23:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(405, 1, '2022-07-28 02:24:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(406, 1, '2022-07-28 02:24:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(407, 1, '2022-07-28 02:24:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(408, 1, '2022-07-28 02:24:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(409, 1, '2022-07-28 02:25:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(410, 1, '2022-07-28 02:25:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(411, 1, '2022-07-28 02:25:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(412, 1, '2022-07-28 02:25:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(413, 1, '2022-07-28 02:25:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(414, 1, '2022-07-28 02:25:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(415, 1, '2022-07-28 02:25:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(416, 1, '2022-07-28 02:25:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(417, 1, '2022-07-28 02:25:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(418, 1, '2022-07-28 02:25:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(419, 1, '2022-07-28 02:25:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(420, 1, '2022-07-28 02:25:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(421, 1, '2022-07-28 02:27:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(422, 1, '2022-07-28 02:27:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(423, 1, '2022-07-28 02:27:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(424, 1, '2022-07-28 02:27:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(425, 1, '2022-07-28 02:28:43', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(426, 1, '2022-07-28 02:28:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(427, 1, '2022-07-28 02:28:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(428, 1, '2022-07-28 02:28:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(429, 1, '2022-07-28 02:30:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(430, 1, '2022-07-28 02:30:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(431, 1, '2022-07-28 02:30:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(432, 1, '2022-07-28 02:30:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(433, 1, '2022-07-28 02:31:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(434, 1, '2022-07-28 02:31:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(435, 1, '2022-07-28 02:31:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(436, 1, '2022-07-28 02:31:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(437, 1, '2022-07-28 02:32:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(438, 1, '2022-07-28 02:32:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(439, 1, '2022-07-28 02:32:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(440, 1, '2022-07-28 02:32:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(441, 1, '2022-07-28 02:33:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(442, 1, '2022-07-28 02:33:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(443, 1, '2022-07-28 02:33:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(444, 1, '2022-07-28 02:34:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(445, 1, '2022-07-28 02:35:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(446, 1, '2022-07-28 02:35:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(447, 1, '2022-07-28 02:35:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(448, 1, '2022-07-28 02:35:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(449, 1, '2022-07-28 02:35:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(450, 1, '2022-07-28 02:35:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(451, 1, '2022-07-28 02:35:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(452, 1, '2022-07-28 02:35:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(453, 1, '2022-07-28 02:35:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(454, 1, '2022-07-28 02:35:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(455, 1, '2022-07-28 02:37:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(456, 1, '2022-07-28 02:37:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(457, 1, '2022-07-28 02:37:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(458, 1, '2022-07-28 02:37:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(459, 1, '2022-07-28 02:37:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(460, 1, '2022-07-28 02:37:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(461, 1, '2022-07-28 02:38:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(462, 1, '2022-07-28 02:38:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(463, 1, '2022-07-28 02:38:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(464, 1, '2022-07-28 02:38:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(465, 1, '2022-07-28 02:38:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(466, 1, '2022-07-28 02:38:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(467, 1, '2022-07-28 02:38:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(468, 1, '2022-07-28 02:38:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(469, 1, '2022-07-28 02:38:43', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(470, 1, '2022-07-28 02:38:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(471, 1, '2022-07-28 02:42:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(472, 1, '2022-07-28 02:42:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(473, 1, '2022-07-28 02:42:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(474, 1, '2022-07-28 02:42:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(475, 1, '2022-07-28 02:42:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(476, 1, '2022-07-28 02:42:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(477, 1, '2022-07-28 02:43:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(478, 1, '2022-07-28 02:43:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(479, 1, '2022-07-28 02:44:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(480, 1, '2022-07-28 02:44:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(481, 1, '2022-07-28 02:45:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(482, 1, '2022-07-28 02:45:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(483, 1, '2022-07-28 02:45:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(484, 1, '2022-07-28 02:45:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(485, 1, '2022-07-28 02:45:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(486, 1, '2022-07-28 02:45:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(487, 1, '2022-07-28 02:45:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(488, 1, '2022-07-28 02:45:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(489, 1, '2022-07-28 02:45:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(490, 1, '2022-07-28 02:45:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(491, 1, '2022-07-28 02:46:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(492, 1, '2022-07-28 02:46:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(493, 1, '2022-07-28 02:46:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(494, 1, '2022-07-28 02:46:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(495, 1, '2022-07-28 02:46:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(496, 1, '2022-07-28 02:46:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(497, 1, '2022-07-28 02:57:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(498, 1, '2022-07-28 02:57:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(499, 1, '2022-07-28 02:58:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(500, 1, '2022-07-28 02:58:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(501, 1, '2022-07-28 03:00:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(502, 1, '2022-07-28 03:00:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(503, 1, '2022-07-28 03:01:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(504, 1, '2022-07-28 03:01:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(505, 1, '2022-07-28 03:02:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(506, 1, '2022-07-28 03:02:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(507, 1, '2022-07-28 03:03:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(508, 1, '2022-07-28 03:03:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(509, 1, '2022-07-28 03:03:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(510, 1, '2022-07-28 03:03:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(511, 1, '2022-07-28 03:04:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(512, 1, '2022-07-28 03:04:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(513, 1, '2022-07-28 03:21:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(514, 1, '2022-07-28 03:21:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(515, 1, '2022-07-28 03:23:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(516, 1, '2022-07-28 03:23:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(517, 1, '2022-07-28 03:25:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(518, 1, '2022-07-28 03:25:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(519, 1, '2022-07-28 03:27:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(520, 1, '2022-07-28 03:28:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(521, 1, '2022-07-28 03:30:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(522, 1, '2022-07-28 03:30:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(523, 1, '2022-07-28 03:30:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(524, 1, '2022-07-28 03:30:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(525, 1, '2022-07-28 03:30:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(526, 1, '2022-07-28 03:30:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(527, 1, '2022-07-28 03:32:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(528, 1, '2022-07-28 03:32:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(529, 1, '2022-07-28 03:33:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(530, 1, '2022-07-28 03:33:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(531, 1, '2022-07-28 03:35:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(532, 1, '2022-07-28 03:35:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(533, 1, '2022-07-28 03:35:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(534, 1, '2022-07-28 03:35:43', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(535, 1, '2022-07-28 03:35:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(536, 1, '2022-07-28 03:36:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(537, 1, '2022-07-28 03:48:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(538, 1, '2022-07-28 03:48:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(539, 1, '2022-07-28 03:49:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(540, 1, '2022-07-28 03:49:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(541, 1, '2022-07-28 03:49:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(542, 1, '2022-07-28 03:49:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(543, 1, '2022-07-28 03:54:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(544, 1, '2022-07-28 03:54:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(545, 1, '2022-07-28 03:55:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(546, 1, '2022-07-28 03:55:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(547, 1, '2022-07-28 03:55:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(548, 1, '2022-07-28 03:55:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(549, 1, '2022-07-28 03:56:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(550, 1, '2022-07-28 03:56:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(551, 1, '2022-07-28 03:57:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(552, 1, '2022-07-28 03:57:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(553, 1, '2022-07-28 03:58:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(554, 1, '2022-07-28 03:58:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3);
INSERT INTO `fs_audit_trails` (`id_audit_trail`, `id_user`, `date`, `action_type`, `description`, `table_name`, `recordid`) VALUES
(555, 1, '2022-07-28 03:59:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(556, 1, '2022-07-28 03:59:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(557, 1, '2022-07-28 03:59:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(558, 1, '2022-07-28 03:59:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(559, 1, '2022-07-28 04:00:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(560, 1, '2022-07-28 04:00:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(561, 1, '2022-07-28 04:00:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(562, 1, '2022-07-28 04:00:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(563, 1, '2022-07-28 04:01:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(564, 1, '2022-07-28 04:01:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(565, 1, '2022-07-28 04:01:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(566, 1, '2022-07-28 04:01:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(567, 1, '2022-07-28 04:01:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(568, 1, '2022-07-28 04:01:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(569, 1, '2022-07-28 04:01:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(570, 1, '2022-07-28 04:01:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(571, 1, '2022-07-28 04:05:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(572, 1, '2022-07-28 04:05:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(573, 1, '2022-07-28 04:05:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(574, 1, '2022-07-28 04:05:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(575, 1, '2022-07-28 04:05:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(576, 1, '2022-07-28 04:05:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(577, 1, '2022-07-28 04:06:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(578, 1, '2022-07-28 04:06:43', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(579, 1, '2022-07-28 04:10:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(580, 1, '2022-07-28 04:10:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(581, 1, '2022-07-28 04:10:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(582, 1, '2022-07-28 04:10:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(583, 1, '2022-07-28 04:11:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(584, 1, '2022-07-28 04:11:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(585, 1, '2022-07-28 04:13:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(586, 1, '2022-07-28 04:13:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(587, 1, '2022-07-28 04:14:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(588, 1, '2022-07-28 04:14:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(589, 1, '2022-07-28 04:15:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(590, 1, '2022-07-28 04:15:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(591, 1, '2022-07-28 04:17:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(592, 1, '2022-07-28 04:17:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(593, 1, '2022-07-28 04:17:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(594, 1, '2022-07-28 04:17:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(595, 1, '2022-07-28 04:17:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(596, 1, '2022-07-28 04:18:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(597, 1, '2022-07-28 04:19:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(598, 1, '2022-07-28 04:19:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(599, 1, '2022-07-28 04:19:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(600, 1, '2022-07-28 04:19:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(601, 1, '2022-07-28 04:20:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(602, 1, '2022-07-28 04:20:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(603, 1, '2022-07-28 04:20:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(604, 1, '2022-07-28 04:21:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(605, 1, '2022-07-28 04:21:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(606, 1, '2022-07-28 04:21:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(607, 1, '2022-07-28 04:22:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(608, 1, '2022-07-28 04:22:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(609, 1, '2022-07-28 04:23:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(610, 1, '2022-07-28 04:23:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(611, 1, '2022-07-28 04:24:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(612, 1, '2022-07-28 04:24:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(613, 1, '2022-07-28 04:24:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(614, 1, '2022-07-28 04:24:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(615, 1, '2022-07-28 04:24:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(616, 1, '2022-07-28 04:24:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(617, 1, '2022-07-28 04:25:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(618, 1, '2022-07-28 04:25:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(619, 1, '2022-07-28 04:26:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(620, 1, '2022-07-28 04:26:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(621, 1, '2022-07-28 04:29:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(622, 1, '2022-07-28 04:29:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(623, 1, '2022-07-28 04:29:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(624, 1, '2022-07-28 04:29:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(625, 1, '2022-07-28 04:34:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(626, 1, '2022-07-28 04:34:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(627, 1, '2022-07-28 04:34:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(628, 1, '2022-07-28 04:35:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(629, 1, '2022-07-28 04:35:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(630, 1, '2022-07-28 04:35:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(631, 1, '2022-07-28 04:36:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(632, 1, '2022-07-28 04:36:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(633, 1, '2022-07-28 04:36:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(634, 1, '2022-07-28 04:37:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(635, 1, '2022-07-28 04:37:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(636, 1, '2022-07-28 04:37:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(637, 1, '2022-07-28 04:38:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(638, 1, '2022-07-28 04:38:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(639, 1, '2022-07-28 04:40:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(640, 1, '2022-07-28 04:40:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(641, 1, '2022-07-28 04:40:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(642, 1, '2022-07-28 04:40:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(643, 1, '2022-07-28 04:40:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(644, 1, '2022-07-28 04:40:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(645, 1, '2022-07-28 04:41:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(646, 1, '2022-07-28 04:41:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(647, 1, '2022-07-28 04:46:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(648, 1, '2022-07-28 04:46:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(649, 1, '2022-07-28 04:49:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(650, 1, '2022-07-28 04:49:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(651, 1, '2022-07-28 04:49:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(652, 1, '2022-07-28 04:50:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(653, 1, '2022-07-28 04:50:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(654, 1, '2022-07-28 04:50:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(655, 1, '2022-07-28 04:51:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(656, 1, '2022-07-28 04:51:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(657, 1, '2022-07-28 04:52:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(658, 1, '2022-07-28 04:52:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(659, 1, '2022-07-28 04:52:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(660, 1, '2022-07-28 04:53:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(661, 1, '2022-07-28 04:53:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(662, 1, '2022-07-28 04:53:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(663, 1, '2022-07-28 04:53:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(664, 1, '2022-07-28 04:53:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(665, 1, '2022-07-28 04:53:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(666, 1, '2022-07-28 04:53:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(667, 1, '2022-07-28 04:55:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(668, 1, '2022-07-28 04:55:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(669, 1, '2022-07-28 04:56:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(670, 1, '2022-07-28 04:57:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(671, 1, '2022-07-28 04:58:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(672, 1, '2022-07-28 04:58:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(673, 1, '2022-07-28 04:58:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(674, 1, '2022-07-28 04:59:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(675, 1, '2022-07-28 04:59:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(676, 1, '2022-07-28 04:59:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(677, 1, '2022-07-28 04:59:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(678, 1, '2022-07-28 04:59:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(679, 1, '2022-07-28 04:59:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(680, 1, '2022-07-28 04:59:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(681, 1, '2022-07-28 04:59:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(682, 1, '2022-07-28 04:59:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(683, 1, '2022-07-28 05:00:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(684, 1, '2022-07-28 05:00:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(685, 1, '2022-07-28 05:00:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(686, 1, '2022-07-28 05:00:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(687, 1, '2022-07-28 05:00:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(688, 1, '2022-07-28 05:01:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(689, 1, '2022-07-28 05:01:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(690, 1, '2022-07-28 05:01:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(691, 1, '2022-07-28 05:02:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(692, 1, '2022-07-28 05:02:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(693, 1, '2022-07-28 05:02:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(694, 1, '2022-07-28 05:02:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(695, 1, '2022-07-28 05:02:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(696, 1, '2022-07-28 05:02:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(697, 1, '2022-07-28 05:02:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(698, 1, '2022-07-28 05:02:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(699, 1, '2022-07-28 05:02:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(700, 1, '2022-07-28 05:02:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(701, 1, '2022-07-28 05:04:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(702, 1, '2022-07-28 05:04:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(703, 1, '2022-07-28 05:04:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(704, 1, '2022-07-28 05:04:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(705, 1, '2022-07-28 05:05:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(706, 1, '2022-07-28 05:05:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(707, 1, '2022-07-28 05:06:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(708, 1, '2022-07-28 05:06:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(709, 1, '2022-07-28 05:06:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(710, 1, '2022-07-28 05:06:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(711, 1, '2022-07-28 05:07:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(712, 1, '2022-07-28 05:07:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(713, 1, '2022-07-28 05:08:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(714, 1, '2022-07-28 05:08:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(715, 1, '2022-07-28 05:09:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(716, 1, '2022-07-28 05:09:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(717, 1, '2022-07-28 05:14:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(718, 1, '2022-07-28 05:14:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(719, 1, '2022-07-28 05:15:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(720, 1, '2022-07-28 05:15:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(721, 1, '2022-07-28 05:15:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(722, 1, '2022-07-28 05:16:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(723, 1, '2022-07-28 05:16:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(724, 1, '2022-07-28 05:16:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(725, 1, '2022-07-28 05:16:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(726, 1, '2022-07-28 05:16:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(727, 1, '2022-07-28 05:17:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(728, 1, '2022-07-28 05:17:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(729, 1, '2022-07-28 05:17:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(730, 1, '2022-07-28 05:18:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(731, 1, '2022-07-28 05:18:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(732, 1, '2022-07-28 05:18:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(733, 1, '2022-07-28 05:20:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(734, 1, '2022-07-28 05:20:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(735, 1, '2022-07-28 05:20:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(736, 1, '2022-07-28 05:21:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(737, 1, '2022-07-28 05:33:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(738, 1, '2022-07-28 05:33:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(739, 1, '2022-07-28 05:33:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(740, 1, '2022-07-28 05:36:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(741, 1, '2022-07-28 05:36:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(742, 1, '2022-07-28 05:37:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(743, 1, '2022-07-28 05:37:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(744, 1, '2022-07-28 05:37:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(745, 1, '2022-07-28 05:37:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(746, 1, '2022-07-28 05:38:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(747, 1, '2022-07-28 05:38:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(748, 1, '2022-07-28 05:39:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(749, 1, '2022-07-28 05:39:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(750, 1, '2022-07-28 05:39:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(751, 1, '2022-07-28 05:39:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(752, 1, '2022-07-28 05:40:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(753, 1, '2022-07-28 05:40:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(754, 1, '2022-07-28 05:40:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(755, 1, '2022-07-28 05:40:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(756, 1, '2022-07-28 05:41:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(757, 1, '2022-07-28 05:41:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(758, 1, '2022-07-28 05:41:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(759, 1, '2022-07-28 05:41:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(760, 1, '2022-07-28 05:41:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(761, 1, '2022-07-28 05:42:07', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(762, 1, '2022-07-28 05:42:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(763, 1, '2022-07-28 05:42:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(764, 1, '2022-07-28 05:42:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(765, 1, '2022-07-28 05:43:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(766, 1, '2022-07-28 05:43:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(767, 1, '2022-07-28 05:43:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(768, 1, '2022-07-28 05:43:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(769, 1, '2022-07-28 05:44:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(770, 1, '2022-07-28 05:44:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(771, 1, '2022-07-28 05:44:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(772, 1, '2022-07-28 05:44:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(773, 1, '2022-07-28 05:45:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(774, 1, '2022-07-28 05:45:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(775, 1, '2022-07-28 05:45:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(776, 1, '2022-07-28 05:48:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(777, 1, '2022-07-28 05:48:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(778, 1, '2022-07-28 05:48:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(779, 1, '2022-07-28 05:48:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(780, 1, '2022-07-28 05:48:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(781, 1, '2022-07-28 05:49:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(782, 1, '2022-07-28 05:49:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(783, 1, '2022-07-28 05:49:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(784, 1, '2022-07-28 05:49:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(785, 1, '2022-07-28 05:49:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(786, 1, '2022-07-28 05:49:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(787, 1, '2022-07-28 05:49:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(788, 1, '2022-07-28 05:49:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(789, 1, '2022-07-28 05:49:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(790, 1, '2022-07-28 05:49:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(791, 1, '2022-07-28 05:50:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(792, 1, '2022-07-28 05:52:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(793, 1, '2022-07-28 05:52:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(794, 1, '2022-07-28 05:55:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(795, 1, '2022-07-28 05:56:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(796, 1, '2022-07-28 05:56:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(797, 1, '2022-07-28 05:57:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(798, 1, '2022-07-28 05:57:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(799, 1, '2022-07-28 05:57:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(800, 1, '2022-07-28 05:57:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(801, 1, '2022-07-28 05:57:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(802, 1, '2022-07-28 05:57:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(803, 1, '2022-07-28 06:00:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(804, 1, '2022-07-28 06:00:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(805, 1, '2022-07-28 06:00:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(806, 1, '2022-07-28 06:00:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(807, 1, '2022-07-28 06:01:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(808, 1, '2022-07-28 06:01:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(809, 1, '2022-07-28 06:02:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(810, 1, '2022-07-28 06:02:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(811, 1, '2022-07-28 06:02:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(812, 1, '2022-07-28 06:03:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(813, 1, '2022-07-28 06:03:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(814, 1, '2022-07-28 06:03:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(815, 1, '2022-07-28 06:04:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(816, 1, '2022-07-28 06:04:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(817, 1, '2022-07-28 06:05:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(818, 1, '2022-07-28 06:07:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(819, 1, '2022-07-28 06:07:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(820, 1, '2022-07-28 06:07:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(821, 1, '2022-07-28 06:07:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(822, 1, '2022-07-28 06:08:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(823, 1, '2022-07-28 06:08:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(824, 1, '2022-07-28 06:08:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(825, 1, '2022-07-28 06:08:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 3),
(826, 1, '2022-07-28 06:08:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(827, 1, '2022-07-28 06:08:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(828, 1, '2022-07-28 06:09:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(829, 1, '2022-07-28 06:09:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(830, 1, '2022-07-28 06:09:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(831, 1, '2022-07-28 06:10:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(832, 1, '2022-07-28 06:10:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(833, 1, '2022-07-28 06:10:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(834, 1, '2022-07-28 06:10:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(835, 1, '2022-07-28 06:10:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(836, 1, '2022-07-28 06:11:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(837, 1, '2022-07-28 06:11:16', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(838, 1, '2022-07-28 06:11:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(839, 1, '2022-07-28 06:30:22', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(840, 1, '2022-07-28 06:30:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(841, 1, '2022-07-28 06:30:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(842, 1, '2022-07-28 06:30:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(843, 1, '2022-07-28 06:31:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(844, 1, '2022-07-28 06:31:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(845, 1, '2022-07-28 06:31:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(846, 1, '2022-07-28 06:31:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(847, 1, '2022-07-28 06:32:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(848, 1, '2022-07-28 06:32:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(849, 1, '2022-07-28 06:32:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(850, 1, '2022-07-28 06:32:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(851, 1, '2022-07-28 06:33:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(852, 1, '2022-07-28 06:33:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(853, 1, '2022-07-28 06:34:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(854, NULL, '2022-07-29 01:11:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(855, NULL, '2022-07-29 01:11:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(856, NULL, '2022-07-29 02:55:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(857, NULL, '2022-07-29 02:55:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(858, 1, '2022-08-02 03:01:18', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(859, 1, '2022-08-02 03:01:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(860, 1, '2022-08-02 03:02:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(861, 1, '2022-08-02 03:02:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(862, 1, '2022-08-02 03:02:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(863, 1, '2022-08-02 03:02:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(864, 1, '2022-08-02 03:02:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 1),
(865, NULL, '2022-08-03 01:07:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(866, NULL, '2022-08-03 01:07:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(867, NULL, '2022-08-03 01:11:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(868, NULL, '2022-08-03 01:11:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(869, NULL, '2022-08-03 01:20:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(870, NULL, '2022-08-03 01:21:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(871, NULL, '2022-08-03 01:22:35', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(872, NULL, '2022-08-03 01:22:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(873, NULL, '2022-08-03 01:22:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(874, NULL, '2022-08-03 01:22:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(875, NULL, '2022-08-03 01:22:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(876, NULL, '2022-08-03 01:22:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(877, NULL, '2022-08-03 01:23:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(878, NULL, '2022-08-03 01:24:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(879, NULL, '2022-08-03 01:25:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(880, NULL, '2022-08-03 01:25:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(881, NULL, '2022-08-03 01:26:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(882, NULL, '2022-08-03 01:26:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(883, NULL, '2022-08-03 01:27:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(884, NULL, '2022-08-03 01:27:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(885, NULL, '2022-08-03 01:28:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(886, NULL, '2022-08-03 01:28:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(887, NULL, '2022-08-03 01:28:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(888, NULL, '2022-08-03 01:28:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(889, NULL, '2022-08-03 01:29:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(890, NULL, '2022-08-03 01:29:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(891, NULL, '2022-08-03 01:29:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(892, NULL, '2022-08-03 01:29:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(893, NULL, '2022-08-03 01:29:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(894, NULL, '2022-08-03 01:29:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(895, NULL, '2022-08-03 01:30:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(896, NULL, '2022-08-03 01:30:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(897, NULL, '2022-08-03 01:30:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(898, NULL, '2022-08-03 01:30:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(899, NULL, '2022-08-03 01:30:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(900, NULL, '2022-08-03 01:30:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(901, NULL, '2022-08-03 01:31:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(902, NULL, '2022-08-03 01:31:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(903, NULL, '2022-08-03 01:32:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(904, NULL, '2022-08-03 01:32:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(905, NULL, '2022-08-03 01:33:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(906, NULL, '2022-08-03 01:33:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(907, NULL, '2022-08-03 01:34:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(908, NULL, '2022-08-03 01:34:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(909, NULL, '2022-08-03 01:35:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(910, NULL, '2022-08-03 01:35:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(911, NULL, '2022-08-03 01:35:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(912, NULL, '2022-08-03 01:35:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(913, NULL, '2022-08-03 01:36:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(914, NULL, '2022-08-03 01:36:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(915, NULL, '2022-08-03 01:36:38', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(916, NULL, '2022-08-03 01:36:41', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(917, NULL, '2022-08-03 01:36:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(918, NULL, '2022-08-03 01:36:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(919, NULL, '2022-08-03 01:37:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(920, NULL, '2022-08-03 01:37:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(921, NULL, '2022-08-03 01:37:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(922, NULL, '2022-08-03 01:37:29', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(923, NULL, '2022-08-03 01:37:44', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(924, NULL, '2022-08-03 01:37:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(925, NULL, '2022-08-03 01:38:26', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(926, NULL, '2022-08-03 01:38:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(927, NULL, '2022-08-03 01:39:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(928, NULL, '2022-08-03 01:39:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(929, NULL, '2022-08-03 01:40:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(930, NULL, '2022-08-03 01:40:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(931, NULL, '2022-08-03 01:41:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(932, NULL, '2022-08-03 01:41:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(933, NULL, '2022-08-03 01:41:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(934, NULL, '2022-08-03 01:41:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(935, NULL, '2022-08-03 01:41:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(936, NULL, '2022-08-03 01:41:57', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(937, NULL, '2022-08-03 01:42:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(938, NULL, '2022-08-03 01:42:33', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(939, NULL, '2022-08-03 01:42:42', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(940, NULL, '2022-08-03 01:42:45', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(941, NULL, '2022-08-03 01:43:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(942, NULL, '2022-08-03 01:43:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(943, NULL, '2022-08-03 01:43:31', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(944, NULL, '2022-08-03 01:43:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(945, NULL, '2022-08-03 01:43:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(946, NULL, '2022-08-03 01:43:52', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(947, NULL, '2022-08-03 01:44:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(948, NULL, '2022-08-03 01:44:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(949, NULL, '2022-08-03 01:45:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(950, NULL, '2022-08-03 01:45:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(951, NULL, '2022-08-03 16:20:59', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(952, NULL, '2022-08-03 16:21:03', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(953, NULL, '2022-08-03 16:21:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(954, NULL, '2022-08-03 16:21:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(955, NULL, '2022-08-03 16:22:10', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(956, NULL, '2022-08-03 16:22:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(957, NULL, '2022-08-03 16:22:32', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(958, NULL, '2022-08-03 16:22:34', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(959, NULL, '2022-08-03 16:23:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(960, NULL, '2022-08-03 16:23:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(961, NULL, '2022-08-03 16:23:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(962, NULL, '2022-08-03 16:23:24', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(963, NULL, '2022-08-03 16:23:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(964, NULL, '2022-08-03 16:23:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(965, NULL, '2022-08-03 16:24:11', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(966, NULL, '2022-08-03 16:24:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(967, NULL, '2022-08-03 16:24:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(968, NULL, '2022-08-03 16:24:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(969, NULL, '2022-08-03 16:25:05', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(970, NULL, '2022-08-03 16:25:08', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(971, NULL, '2022-08-03 16:25:17', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(972, NULL, '2022-08-03 16:25:20', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(973, NULL, '2022-08-03 16:25:37', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(974, NULL, '2022-08-03 16:25:40', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(975, NULL, '2022-08-03 16:25:53', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(976, NULL, '2022-08-03 16:25:56', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(977, NULL, '2022-08-03 16:26:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(978, NULL, '2022-08-03 16:26:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(979, NULL, '2022-08-03 16:27:19', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(980, NULL, '2022-08-03 16:27:21', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(981, NULL, '2022-08-03 16:29:13', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(982, NULL, '2022-08-03 16:29:15', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(983, NULL, '2022-08-03 16:29:36', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(984, NULL, '2022-08-03 16:29:39', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(985, NULL, '2022-08-03 16:30:55', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(986, NULL, '2022-08-03 16:30:58', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(987, NULL, '2022-08-03 16:31:46', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(988, NULL, '2022-08-03 16:31:48', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(989, NULL, '2022-08-03 16:32:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(990, NULL, '2022-08-03 16:32:28', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(991, NULL, '2022-08-03 16:32:51', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(992, NULL, '2022-08-03 16:32:54', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(993, NULL, '2022-08-03 16:33:00', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(994, NULL, '2022-08-03 16:33:02', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(995, NULL, '2022-08-03 16:33:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(996, NULL, '2022-08-03 16:33:50', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(997, NULL, '2022-08-03 16:34:06', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(998, NULL, '2022-08-03 16:34:09', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(999, NULL, '2022-08-03 16:34:27', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(1000, NULL, '2022-08-03 16:34:30', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(1001, NULL, '2022-08-03 16:34:47', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(1002, NULL, '2022-08-03 16:34:49', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 4),
(1003, NULL, '2022-08-03 17:23:17', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1004, NULL, '2022-08-03 17:26:54', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1005, NULL, '2022-08-03 17:37:12', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(1006, NULL, '2022-08-03 17:37:14', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(1007, NULL, '2022-08-03 17:37:23', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(1008, NULL, '2022-08-03 17:37:25', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(1009, NULL, '2022-08-03 17:38:28', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1010, NULL, '2022-08-03 17:41:08', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1011, NULL, '2022-08-03 17:44:15', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1012, NULL, '2022-08-03 17:45:17', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1013, NULL, '2022-08-03 17:45:41', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1014, NULL, '2022-08-03 18:05:25', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1015, NULL, '2022-08-03 18:05:39', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1016, NULL, '2022-08-03 18:06:06', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1017, NULL, '2022-08-03 18:06:48', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1018, NULL, '2022-08-03 18:07:15', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1019, NULL, '2022-08-03 18:08:24', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1020, NULL, '2022-08-03 18:09:25', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1021, NULL, '2022-08-03 18:13:19', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1022, NULL, '2022-08-03 18:13:32', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1023, NULL, '2022-08-03 18:14:23', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1024, NULL, '2022-08-03 18:14:52', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1025, NULL, '2022-08-03 18:17:14', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1026, NULL, '2022-08-03 18:17:39', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1027, NULL, '2022-08-03 18:17:58', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1028, NULL, '2022-08-03 18:18:16', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1029, NULL, '2022-08-03 18:18:53', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1030, NULL, '2022-08-03 18:20:19', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1031, NULL, '2022-08-03 18:21:44', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1032, NULL, '2022-08-03 18:21:55', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1033, NULL, '2022-08-03 18:22:47', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1034, NULL, '2022-08-03 18:23:04', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1035, NULL, '2022-08-03 18:23:59', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1036, NULL, '2022-08-03 18:25:46', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1037, NULL, '2022-08-03 18:26:15', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1038, NULL, '2022-08-03 18:26:32', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1039, NULL, '2022-08-03 18:27:06', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1040, NULL, '2022-08-03 18:27:11', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1041, NULL, '2022-08-03 18:27:23', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1042, NULL, '2022-08-03 18:27:32', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1043, NULL, '2022-08-03 18:27:41', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1044, NULL, '2022-08-03 18:27:49', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1045, NULL, '2022-08-03 18:27:53', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1046, NULL, '2022-08-03 18:27:54', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1047, NULL, '2022-08-03 18:27:59', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1048, NULL, '2022-08-03 18:46:35', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1049, NULL, '2022-08-03 18:46:46', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1050, NULL, '2022-08-03 18:47:13', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1051, NULL, '2022-08-03 18:47:19', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1052, NULL, '2022-08-03 18:47:43', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1053, NULL, '2022-08-03 18:48:02', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1054, NULL, '2022-08-03 18:49:12', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1055, NULL, '2022-08-03 18:49:38', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1056, NULL, '2022-08-03 18:50:09', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1057, NULL, '2022-08-03 18:51:14', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1058, NULL, '2022-08-03 18:52:20', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1059, NULL, '2022-08-03 18:54:41', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1060, NULL, '2022-08-03 18:55:11', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1061, NULL, '2022-08-03 18:56:11', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1062, NULL, '2022-08-03 18:56:30', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1063, NULL, '2022-08-03 18:56:48', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1064, NULL, '2022-08-03 18:59:01', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1065, NULL, '2022-08-03 18:59:20', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1066, NULL, '2022-08-03 18:59:21', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1067, NULL, '2022-08-03 18:59:35', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1068, NULL, '2022-08-03 19:00:17', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1069, NULL, '2022-08-03 19:00:46', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1070, NULL, '2022-08-03 19:00:53', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1071, NULL, '2022-08-03 19:00:58', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1072, NULL, '2022-08-03 19:00:59', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1073, NULL, '2022-08-03 19:02:10', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1074, NULL, '2022-08-03 19:02:11', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1075, NULL, '2022-08-03 19:02:12', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1076, NULL, '2022-08-03 19:02:29', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1077, NULL, '2022-08-03 19:02:39', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1078, NULL, '2022-08-03 19:03:19', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1079, NULL, '2022-08-03 19:03:26', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1080, NULL, '2022-08-03 19:03:32', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1081, NULL, '2022-08-03 19:03:43', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1082, NULL, '2022-08-03 19:04:00', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1083, NULL, '2022-08-03 19:05:25', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1084, NULL, '2022-08-03 19:05:48', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1085, NULL, '2022-08-03 19:05:55', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1086, NULL, '2022-08-03 19:06:32', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1087, NULL, '2022-08-03 19:06:56', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1088, NULL, '2022-08-03 19:07:03', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1089, NULL, '2022-08-03 19:10:24', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1090, NULL, '2022-08-03 19:12:01', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1091, NULL, '2022-08-03 19:12:10', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1092, NULL, '2022-08-03 19:12:17', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1093, NULL, '2022-08-03 19:12:42', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1094, NULL, '2022-08-03 19:12:45', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1095, NULL, '2022-08-03 19:12:57', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1096, NULL, '2022-08-03 19:14:33', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1097, NULL, '2022-08-03 19:14:52', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1098, NULL, '2022-08-03 19:16:03', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1099, NULL, '2022-08-03 19:17:18', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1100, NULL, '2022-08-03 19:17:33', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1101, NULL, '2022-08-03 19:33:20', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1102, NULL, '2022-08-03 19:33:28', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1103, NULL, '2022-08-03 19:33:37', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL);
INSERT INTO `fs_audit_trails` (`id_audit_trail`, `id_user`, `date`, `action_type`, `description`, `table_name`, `recordid`) VALUES
(1104, NULL, '2022-08-03 19:33:57', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1105, NULL, '2022-08-03 19:34:03', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1106, NULL, '2022-08-03 19:34:28', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1107, NULL, '2022-08-03 19:34:46', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1108, NULL, '2022-08-03 19:34:52', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1109, NULL, '2022-08-03 19:37:27', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1110, NULL, '2022-08-03 19:40:20', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1111, NULL, '2022-08-03 19:40:31', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1112, NULL, '2022-08-03 19:40:37', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1113, NULL, '2022-08-03 19:46:15', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1114, NULL, '2022-08-03 19:46:24', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1115, NULL, '2022-08-03 19:46:39', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1116, NULL, '2022-08-03 19:46:57', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1117, NULL, '2022-08-03 20:00:51', 'delete', 'Eliminó un almacen', 'fs_warehouses', 1),
(1118, NULL, '2022-08-03 20:02:10', 'delete', 'Eliminó un almacen', 'fs_warehouses', 2),
(1119, NULL, '2022-08-03 20:02:15', 'delete', 'Eliminó un almacen', 'fs_warehouses', 3),
(1120, NULL, '2022-08-03 20:02:22', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1121, NULL, '2022-08-03 20:02:39', 'update', 'Editó un almacen', 'fs_warehouses', 1),
(1122, NULL, '2022-08-03 20:08:42', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1123, NULL, '2022-08-03 20:09:15', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1124, NULL, '2022-08-03 20:09:31', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1125, NULL, '2022-08-03 20:14:11', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1126, NULL, '2022-08-03 20:15:04', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1127, NULL, '2022-08-03 20:22:05', 'create', 'Creó un nuevo almacen', 'fs_warehouses', NULL),
(1128, NULL, '2022-08-03 20:43:38', 'update', 'Editó un almacen', 'fs_warehouses', 23),
(1129, NULL, '2022-08-03 20:57:39', 'update', 'Editó un almacen', 'fs_warehouses', 23),
(1130, NULL, '2022-08-09 16:59:01', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(1131, NULL, '2022-08-09 16:59:04', 'update', 'Editó un asiento', 'fs_accounting_vouchers', 2),
(1132, NULL, '2022-08-22 05:02:26', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1133, NULL, '2022-08-22 05:02:28', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1134, 1, '2022-08-25 12:18:20', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 6),
(1135, 1, '2022-08-25 12:18:23', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 7),
(1136, 1, '2022-08-25 12:19:03', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 6),
(1137, 1, '2022-08-25 12:19:05', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 8),
(1138, 1, '2022-08-25 12:19:22', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1139, 1, '2022-08-25 12:19:24', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1140, 1, '2022-08-25 12:19:50', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1141, 1, '2022-08-25 12:19:52', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1142, 1, '2022-08-25 12:20:40', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1143, 1, '2022-08-25 12:20:42', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1144, 1, '2022-09-01 09:46:54', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 9),
(1145, 1, '2022-09-01 09:46:57', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 10),
(1146, 1, '2022-09-01 09:47:09', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 9),
(1147, 1, '2022-09-01 09:47:12', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 11),
(1148, 1, '2022-09-01 09:47:19', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 12),
(1149, 1, '2022-09-01 09:47:22', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 13),
(1150, 1, '2022-09-01 09:47:53', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1151, 1, '2022-09-01 09:47:56', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1152, 1, '2022-09-01 10:00:41', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1153, 1, '2022-09-01 10:00:45', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_brands`
--

CREATE TABLE `fs_brands` (
  `id_brand` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `img` longtext DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_brands`
--

INSERT INTO `fs_brands` (`id_brand`, `name`, `img`, `op_status`) VALUES
(1, 'NIKE', '20602d43cc993811e5a6bd1886af4f33.png', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_cart`
--

CREATE TABLE `fs_cart` (
  `id_cart` int(11) NOT NULL,
  `items_total` int(255) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `total_usd` decimal(20,2) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_cart`
--

INSERT INTO `fs_cart` (`id_cart`, `items_total`, `total`, `total_usd`, `created_at`, `created_by`, `op_status`) VALUES
(1, 10, '5.00', '5.00', '2022-08-25', -1, 'C'),
(2, NULL, NULL, NULL, '2022-08-25', -1, 'C'),
(3, NULL, NULL, NULL, '2022-08-25', -1, 'C'),
(4, NULL, NULL, NULL, '2022-08-25', -1, 'C'),
(5, NULL, NULL, NULL, '2022-08-25', -1, 'C'),
(6, NULL, NULL, NULL, '2022-08-25', -1, 'C'),
(7, NULL, NULL, NULL, '2022-08-25', -1, 'C'),
(8, NULL, NULL, NULL, '2022-08-25', -1, 'C'),
(9, NULL, NULL, NULL, '2022-08-25', -1, 'C'),
(10, NULL, NULL, NULL, '2022-08-25', -1, 'C'),
(11, 3, '78.00', '8.18', '2022-08-25', 1, 'C'),
(12, 1, '160.00', '4.00', '2022-08-31', 1, 'C'),
(13, 1, '480.00', '12.00', '2022-08-31', 1, 'C'),
(14, 1, '80.00', '2.00', '2022-08-31', 1, 'C'),
(15, 1, '21.00', '2.60', '2022-08-31', 1, 'C'),
(16, 1, '63.00', '7.80', '2022-08-31', 1, 'C'),
(17, NULL, NULL, NULL, '2022-08-31', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_cart_lines`
--

CREATE TABLE `fs_cart_lines` (
  `id_cart_line` int(11) NOT NULL,
  `id_cart` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `total_usd` decimal(20,2) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_cart_lines`
--

INSERT INTO `fs_cart_lines` (`id_cart_line`, `id_cart`, `id_product`, `quantity`, `total`, `total_usd`, `op_status`) VALUES
(1, 11, 1, 10, '10.00', '10.00', 'E'),
(2, 11, 3, 5, '10.00', '10.00', 'E'),
(3, 11, 1, 5, '105.00', '13.00', 'E'),
(4, 11, 1, 5, '105.00', '13.00', 'E'),
(5, 11, 1, 1, '21.00', '2.60', 'E'),
(6, 11, 1, 1, '21.00', '2.60', 'E'),
(7, 11, 1, 1, '21.00', '2.60', 'E'),
(8, 11, 3, 5, '95.00', '9.30', 'E'),
(9, 11, 1, 2, '42.00', '5.20', 'E'),
(10, 11, 3, 3, '57.00', '5.58', 'E'),
(11, 11, 1, 5, '105.00', '13.00', 'E'),
(12, 11, 3, 1, '19.00', '1.86', 'E'),
(13, 11, 3, 1, '19.00', '1.86', 'E'),
(14, 11, 3, 1, '19.00', '1.86', 'A'),
(15, 11, 1, 1, '21.00', '2.60', 'A'),
(16, 11, 3, 2, '38.00', '3.72', 'A'),
(17, 13, 4, 6, '480.00', '12.00', 'A'),
(18, 12, 4, 2, '160.00', '4.00', 'A'),
(19, 14, 4, 1, '80.00', '2.00', 'A'),
(20, 15, 1, 1, '21.00', '2.60', 'A'),
(21, 16, 1, 3, '63.00', '7.80', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_categories`
--

CREATE TABLE `fs_categories` (
  `id_category` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `img` longtext DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `is_deleted` int(1) DEFAULT NULL,
  `num_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_categories`
--

INSERT INTO `fs_categories` (`id_category`, `name`, `img`, `is_active`, `is_deleted`, `num_order`) VALUES
(1, 'AMPOLLAS', 'Ampollas_Biphase_SI_Netiqueta_min_da96e28857.png', 1, NULL, NULL),
(2, 'CREMAS / TOPICAS Y VAGINALES', '86d01f19f14f97300e610b13361a70e7-shaving-cream-icon.png', 1, NULL, NULL),
(3, 'TABLETAS', 'pngtree-spilled-health-pills-png-image_2701038.jpg', 1, NULL, NULL),
(4, 'GOTAS - ORALES Y NASALES', '20602d43cc993811e5a6bd1886af4f33.png', 1, NULL, NULL),
(5, 'SOLUCIONES ORALES - JARABES Y SU', '45758.png', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_companies`
--

CREATE TABLE `fs_companies` (
  `id_company` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `op_city` varchar(255) DEFAULT NULL,
  `op_state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `op_country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `op_industry` varchar(255) DEFAULT NULL,
  `op_status` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_companies`
--

INSERT INTO `fs_companies` (`id_company`, `name`, `owner`, `description`, `address`, `op_city`, `op_state`, `zip_code`, `op_country`, `email`, `phone`, `op_industry`, `op_status`, `website`) VALUES
(1, 'TEST', 'Carlos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_configurations`
--

CREATE TABLE `fs_configurations` (
  `id_configuration` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_configurations`
--

INSERT INTO `fs_configurations` (`id_configuration`, `name`, `value`) VALUES
(1, 'FS_THEME_NAME', 'classic'),
(2, 'FS_DEFAULT_THEME_NAME', 'classic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_connections`
--

CREATE TABLE `fs_connections` (
  `id_connection` int(11) NOT NULL,
  `connection_userid` int(11) DEFAULT NULL,
  `connection_type` int(4) DEFAULT NULL,
  `connection_date` date DEFAULT NULL,
  `connection_time` time DEFAULT NULL,
  `connection_last_time` time DEFAULT NULL,
  `connection_token` varchar(64) DEFAULT NULL,
  `connection_status` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_countrys`
--

CREATE TABLE `fs_countrys` (
  `id_company` int(11) DEFAULT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `op_city` varchar(255) DEFAULT NULL,
  `op_state` varchar(255) DEFAULT NULL,
  `op_country` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_discounts`
--

CREATE TABLE `fs_discounts` (
  `id_discount` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `coupon_code` varchar(64) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `amount_usd` decimal(20,2) DEFAULT NULL,
  `percentage` decimal(20,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_order_value` varchar(32) DEFAULT NULL,
  `max_order_value` varchar(32) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_discounts`
--

INSERT INTO `fs_discounts` (`id_discount`, `name`, `coupon_code`, `amount`, `amount_usd`, `percentage`, `quantity`, `start_date`, `end_date`, `min_order_value`, `max_order_value`, `op_status`) VALUES
(1, 'TEST 2', 'AS5-FD1A5-6SD', '0.00', '0.00', '10.00', 10, '2022-08-09', '2022-08-10', '1', '10', 'A'),
(2, 'Carlos Sandrea', '4002', '0.00', '0.00', '0.00', 0, '0000-00-00', '0000-00-00', '', '', 'E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_entities`
--

CREATE TABLE `fs_entities` (
  `id_entity` int(11) NOT NULL,
  `id_role` int(4) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `last_connection` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `is_deleted` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_entities`
--

INSERT INTO `fs_entities` (`id_entity`, `id_role`, `firstname`, `lastname`, `username`, `email`, `password`, `last_connection`, `date_creation`, `is_active`, `is_deleted`) VALUES
(1, -1, 'Carlos', 'Sandrea', 'csandrea', 'cjoseare1995@gmail.com', 'd598aac945ef5d16a15b067cf096ab3005e792aaf110c090f46f4741716cbc3b', NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_invoices`
--

CREATE TABLE `fs_invoices` (
  `id_invoice` int(11) NOT NULL,
  `id_transaction` int(255) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_period` int(11) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `number` int(10) UNSIGNED ZEROFILL NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_created_by` int(11) DEFAULT NULL,
  `printed_on` datetime DEFAULT NULL,
  `id_printed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_invoices`
--

INSERT INTO `fs_invoices` (`id_invoice`, `id_transaction`, `id_order`, `id_period`, `amount`, `code`, `number`, `created_at`, `id_created_by`, `printed_on`, `id_printed_by`) VALUES
(1, 1, 3, NULL, '10.00', 'F022', 0000000001, NULL, NULL, NULL, NULL),
(2, NULL, 4, NULL, '2.00', 'N022', 0000000001, NULL, NULL, NULL, NULL),
(3, NULL, 5, NULL, '40.00', 'N022', 0000000001, NULL, NULL, NULL, NULL),
(4, NULL, 1, NULL, '10.00', 'F022', 0000000002, NULL, NULL, NULL, NULL),
(5, NULL, 2, NULL, '42.00', 'F022', 0000000003, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, '32.00', 'N022', 0000000003, NULL, NULL, NULL, NULL),
(7, NULL, 6, NULL, '15.00', 'N022', 0000000001, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_invoice_lines`
--

CREATE TABLE `fs_invoice_lines` (
  `id_invoice_line` int(255) NOT NULL,
  `id_invoive` int(255) DEFAULT NULL,
  `id_account` int(255) DEFAULT NULL,
  `id_order_line` int(255) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_ledger_entries`
--

CREATE TABLE `fs_ledger_entries` (
  `id_ledger_entries` int(11) NOT NULL,
  `id_transaction` int(11) DEFAULT NULL,
  `id_account` int(11) DEFAULT NULL,
  `op_entry_type` char(1) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `entry_at` datetime DEFAULT NULL,
  `id_entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_menu_items`
--

CREATE TABLE `fs_menu_items` (
  `id_menu_item` int(11) NOT NULL,
  `type` varchar(1) NOT NULL,
  `name` varchar(32) NOT NULL,
  `link` varchar(256) NOT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `is_parent` int(1) DEFAULT NULL,
  `is_child` int(1) DEFAULT NULL,
  `is_header` int(1) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `is_deleted` int(1) DEFAULT NULL,
  `num_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_menu_items`
--

INSERT INTO `fs_menu_items` (`id_menu_item`, `type`, `name`, `link`, `icon`, `is_parent`, `is_child`, `is_header`, `id_parent`, `is_active`, `is_deleted`, `num_order`) VALUES
(1, 'F', 'Inicio', 'dashboard', 'fas fa-home', 0, 0, 0, 0, 1, NULL, 0),
(2, 'F', 'Catálogo', 'Catalog/featured', 'fas fa-book', 0, 0, 0, 0, 1, NULL, 1),
(3, 'A', 'Inicio', 'AdminDashboard', 'fas fa-home', 0, 0, 0, 0, 1, NULL, 1),
(4, 'A', 'Catálogo', 'AdminCatalog', 'fas fa-shop', 1, 0, 0, 0, 1, NULL, 4),
(5, 'A', 'Productos', 'AdminCatalog&action=products', NULL, 0, 1, 0, 4, 1, NULL, NULL),
(6, 'A', 'Pedidos', '', 'fas fa-shopping-cart', 1, 0, 0, 0, 1, NULL, 5),
(7, 'A', 'Clientes', '', 'fas fa-users', 1, 0, 0, 0, 1, NULL, 9),
(8, 'A', 'Soporte', 'AdminSupport', 'fas fa-headset', 1, 0, 0, 0, 1, NULL, 777),
(9, 'A', 'Categorias', 'AdminCatalog&action=categories', NULL, 0, 1, 0, 4, 1, NULL, NULL),
(10, 'A', 'Descuentos', 'AdminCatalog&action=discounts', NULL, 0, 1, 0, 4, 1, NULL, NULL),
(11, 'A', 'Marcas', 'AdminCatalog&action=brands', NULL, 0, 1, 0, 4, 1, NULL, NULL),
(12, 'A', 'Impuestos', 'AdminCatalog&action=taxes', NULL, 0, 1, 0, 4, 1, NULL, NULL),
(13, 'A', 'Paramatros', 'AdminManager', 'fas fa-user-gear', 1, 0, 0, 0, 1, NULL, 888),
(14, 'A', 'Caja Chica', 'AdminCash&action=flow', NULL, 0, 1, 0, 29, 1, NULL, 666),
(15, 'A', 'Dev Parametros', 'AdminAdvanced', 'fas fa-code', 1, 0, 0, 0, 1, NULL, 999),
(16, 'A', 'Gestion de Caja', 'AdminCash&action=manegement', NULL, 0, 1, 0, 29, 1, NULL, 4),
(17, 'A', 'Asientos Contable', 'AdminAccounting&action=vouchers', NULL, 0, 1, 0, 27, 1, NULL, 3),
(18, 'A', 'Pedidos', 'AdminOrders&action=orders', NULL, 0, 1, 0, 6, 1, NULL, NULL),
(19, 'A', 'Facturas', 'AdminOrders&action=invoices', NULL, 0, 1, 0, 6, 1, NULL, NULL),
(20, 'A', 'Clientes', 'AdminCustomers&action=customers', NULL, 0, 1, 0, 7, 1, NULL, NULL),
(21, 'A', 'Direcciones', 'AdminCustomers&action=addresses', NULL, 0, 1, 0, 7, 0, NULL, NULL),
(22, 'A', 'Compuesto Activos', 'AdminCatalog&action=actives', NULL, 0, 1, 0, 4, 1, NULL, NULL),
(23, 'A', 'Tipos de Tipos de Asientos', 'AdminAccounting&action=voucherTypes', NULL, 0, 1, 0, 27, 1, NULL, 2),
(24, 'A', 'Cuentas Contables', 'AdminAccounting&action=accounts', NULL, 0, 1, 0, 27, 1, NULL, 1),
(25, 'A', 'Entidades Bancarias', 'AdminBank&action=banks', NULL, 0, 1, 0, 26, 1, NULL, 1),
(26, 'A', 'Bancos', '', 'fas fa-building-columns', 1, 0, 0, 0, 1, NULL, 14),
(27, 'A', 'Contabilidad', '', 'fas fa-table-list', 1, 0, 0, 0, 1, NULL, 15),
(28, 'A', 'Cuentas Bancarias', 'AdminBanks&action=accounts', NULL, 0, 1, 0, 26, 1, NULL, 2),
(29, 'A', 'Caja', '', 'fas fa-cash-register', 1, 0, 0, 0, 1, NULL, 13),
(30, 'A', 'Almacenes', '', 'fas fa-warehouse', 1, 0, 0, 0, 1, NULL, 3),
(31, 'A', 'Compras', '', 'fas fa-basket-shopping', 1, 0, 0, 0, 1, NULL, 7),
(32, 'A', 'Reclamos', 'AdminCustomers&action=requests', 'fas fa-exclamation-circle', 0, 1, 0, 7, 1, NULL, 666),
(33, 'A', 'Empresa', 'AdminParameters&action=companies', 'fas fa-building', 0, 1, 0, 13, 1, NULL, 0),
(34, 'A', 'Orden de Menus', '', 'fas fa-sitemap', 0, 1, 0, 15, 1, NULL, NULL),
(35, 'A', 'Gestion de Almacenes', 'AdminWarehouse', NULL, 0, 1, 0, 30, 1, NULL, NULL),
(36, 'A', 'Ordenes', 'AdminShopping&action=orders', NULL, 0, 1, 0, 31, 1, NULL, NULL),
(37, 'A', 'Despachar', 'AdminOrders&action=dispatch', NULL, 0, 1, 0, 6, 0, NULL, NULL),
(38, 'A', 'Proveedores', 'AdminShopping&action=suppliers', NULL, 0, 1, 0, 31, 1, NULL, NULL),
(39, 'A', 'Opciones', 'AdminDev&action=options', NULL, 0, 1, 0, 15, 1, NULL, NULL),
(40, 'A', 'Importar', 'AdminBulk&action=import', '', 0, 1, 0, 13, 1, NULL, 9),
(41, 'A', 'Exportar', 'AdminBulk&action=export', NULL, 0, 1, 0, 13, 1, 0, 10),
(42, 'A', 'Existencias', 'AdminWarehouse&action=stock', '', 0, 1, 0, 30, 1, 0, NULL),
(43, 'F', 'Pedidos', 'Orders', 'fas fa-shopping-cart', 0, 0, 0, 0, 1, NULL, 2),
(44, 'F', 'Reclamos', 'Request', 'fas fa-phone-alt', 0, 0, 0, 0, 1, 0, 6),
(45, 'F', 'Reportar Pagos', 'Payments', 'fas fa-money-bill', 0, 0, 0, 0, 1, NULL, 3),
(46, 'F', 'Facturas', 'Invoices', 'fas fa-receipt', 0, 0, 0, 0, 1, 0, 5),
(47, 'F', 'Cuentas x Pagar', 'accounts', 'fas fa-handshake', 0, 0, 0, 0, 0, 0, 4),
(48, 'A', 'Historial BCV', 'AdminParameters&action=bcv', NULL, 0, 1, 0, 13, 1, 0, 1),
(49, 'A', 'Ajustes Masivos', 'AdminParameters&action=masive', NULL, 0, 1, 0, 13, 1, 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_options`
--

CREATE TABLE `fs_options` (
  `id_option` int(11) NOT NULL,
  `id_option_group` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_options`
--

INSERT INTO `fs_options` (`id_option`, `id_option_group`, `name`, `value`) VALUES
(1, 1, 'PENDIENTE', 'P'),
(2, 3, 'Amazonas', 'VE-X'),
(3, 3, 'Anzoátegui', 'VE-B'),
(4, 3, 'Apure', 'VE-C'),
(5, 3, 'Aragua', 'VE-D'),
(6, 3, 'Barinas', 'VE-E'),
(7, 3, 'Bolívar', 'VE-F'),
(8, 3, 'Carabobo', 'VE-G'),
(9, 3, 'Cojedes', 'VE-H'),
(10, 3, 'Delta Amacuro', 'VE-Y'),
(11, 3, 'Falcón', 'VE-I'),
(12, 3, 'Guárico', 'VE-J'),
(13, 3, 'Lara', 'VE-K'),
(14, 3, 'Mérida', 'VE-L'),
(15, 3, 'Miranda', 'VE-M'),
(16, 3, 'Monagas', 'VE-N'),
(17, 3, 'Nueva Esparta', 'VE-O'),
(18, 3, 'Portuguesa', 'VE-P'),
(19, 3, 'Sucre', 'VE-R'),
(20, 3, 'Táchira', 'VE-S'),
(21, 3, 'Trujillo', 'VE-T'),
(22, 3, 'La Guaira', 'VE-W'),
(23, 3, 'Yaracuy', 'VE-U'),
(24, 3, 'Zulia', 'VE-V'),
(25, 3, 'Distrito Capital', 'VE-A'),
(26, 3, 'Dependencias Federales', 'VE-Z'),
(27, 2, 'Maroa', NULL),
(28, 2, 'Puerto Ayacucho', NULL),
(29, 2, 'San Fernando de Atabapo', NULL),
(30, 2, 'Anaco', NULL),
(31, 2, 'Aragua de Barcelona', NULL),
(32, 2, 'Barcelona', NULL),
(33, 2, 'Boca de Uchire', NULL),
(34, 2, 'Cantaura', NULL),
(35, 2, 'Clarines', NULL),
(36, 2, 'El Chaparro', NULL),
(37, 2, 'El Pao Anzoátegui', NULL),
(38, 2, 'El Tigre', NULL),
(39, 2, 'El Tigrito', NULL),
(40, 2, 'Guanape', NULL),
(41, 2, 'Guanta', NULL),
(42, 2, 'Lechería', NULL),
(43, 2, 'Onoto', NULL),
(44, 2, 'Pariaguán', NULL),
(45, 2, 'Píritu', NULL),
(46, 2, 'Puerto La Cruz', NULL),
(47, 2, 'Puerto Píritu', NULL),
(48, 2, 'Sabana de Uchire', NULL),
(49, 2, 'San Mateo Anzoátegui', NULL),
(50, 2, 'San Pablo Anzoátegui', NULL),
(51, 2, 'San Tomé', NULL),
(52, 2, 'Santa Ana de Anzoátegui', NULL),
(53, 2, 'Santa Fe Anzoátegui', NULL),
(54, 2, 'Santa Rosa', NULL),
(55, 2, 'Soledad', NULL),
(56, 2, 'Urica', NULL),
(57, 2, 'Valle de Guanape', NULL),
(58, 2, 'Achaguas', NULL),
(59, 2, 'Biruaca', NULL),
(60, 2, 'Bruzual', NULL),
(61, 2, 'El Amparo', NULL),
(62, 2, 'El Nula', NULL),
(63, 2, 'Elorza', NULL),
(64, 2, 'Guasdualito', NULL),
(65, 2, 'Mantecal', NULL),
(66, 2, 'Puerto Páez', NULL),
(67, 2, 'San Fernando de Apure', NULL),
(68, 2, 'San Juan de Payara', NULL),
(69, 2, 'Barbacoas', NULL),
(70, 2, 'Cagua', NULL),
(71, 2, 'Camatagua', NULL),
(72, 2, 'Choroní', NULL),
(73, 2, 'Colonia Tovar', NULL),
(74, 2, 'El Consejo', NULL),
(75, 2, 'La Victoria', NULL),
(76, 2, 'Las Tejerías', NULL),
(77, 2, 'Magdaleno', NULL),
(78, 2, 'Maracay', NULL),
(79, 2, 'Ocumare de La Costa', NULL),
(80, 2, 'Palo Negro', NULL),
(81, 2, 'San Casimiro', NULL),
(82, 2, 'San Mateo', NULL),
(83, 2, 'San Sebastián', NULL),
(84, 2, 'Santa Cruz de Aragua', NULL),
(85, 2, 'Tocorón', NULL),
(86, 2, 'Turmero', NULL),
(87, 2, 'Villa de Cura', NULL),
(88, 2, 'Zuata', NULL),
(89, 2, 'Barinas', NULL),
(90, 2, 'Barinitas', NULL),
(91, 2, 'Barrancas', NULL),
(92, 2, 'Calderas', NULL),
(93, 2, 'Capitanejo', NULL),
(94, 2, 'Ciudad Bolivia', NULL),
(95, 2, 'El Cantón', NULL),
(96, 2, 'Las Veguitas', NULL),
(97, 2, 'Libertad de Barinas', NULL),
(98, 2, 'Sabaneta', NULL),
(99, 2, 'Santa Bárbara de Barinas', NULL),
(100, 2, 'Socopó', NULL),
(101, 2, 'Caicara del Orinoco', NULL),
(102, 2, 'Canaima', NULL),
(103, 2, 'Ciudad Bolívar', NULL),
(104, 2, 'Ciudad Piar', NULL),
(105, 2, 'El Callao', NULL),
(106, 2, 'El Dorado', NULL),
(107, 2, 'El Manteco', NULL),
(108, 2, 'El Palmar', NULL),
(109, 2, 'El Pao', NULL),
(110, 2, 'Guasipati', NULL),
(111, 2, 'Guri', NULL),
(112, 2, 'La Paragua', NULL),
(113, 2, 'Matanzas', NULL),
(114, 2, 'Puerto Ordaz', NULL),
(115, 2, 'San Félix', NULL),
(116, 2, 'Santa Elena de Uairén', NULL),
(117, 2, 'Tumeremo', NULL),
(118, 2, 'Unare', NULL),
(119, 2, 'Upata', NULL),
(120, 2, 'Bejuma', NULL),
(121, 2, 'Belén', NULL),
(122, 2, 'Campo de Carabobo', NULL),
(123, 2, 'Canoabo', NULL),
(124, 2, 'Central Tacarigua', NULL),
(125, 2, 'Chirgua', NULL),
(126, 2, 'Ciudad Alianza', NULL),
(127, 2, 'El Palito', NULL),
(128, 2, 'Guacara', NULL),
(129, 2, 'Guigue', NULL),
(130, 2, 'Las Trincheras', NULL),
(131, 2, 'Los Guayos', NULL),
(132, 2, 'Mariara', NULL),
(133, 2, 'Miranda', NULL),
(134, 2, 'Montalbán', NULL),
(135, 2, 'Morón', NULL),
(136, 2, 'Naguanagua', NULL),
(137, 2, 'Puerto Cabello', NULL),
(138, 2, 'San Joaquín', NULL),
(139, 2, 'Tocuyito', NULL),
(140, 2, 'Urama', NULL),
(141, 2, 'Valencia', NULL),
(142, 2, 'Vigirimita', NULL),
(143, 2, 'Aguirre', NULL),
(144, 2, 'Apartaderos Cojedes', NULL),
(145, 2, 'Arismendi', NULL),
(146, 2, 'Camuriquito', NULL),
(147, 2, 'El Baúl', NULL),
(148, 2, 'El Limón', NULL),
(149, 2, 'El Pao Cojedes', NULL),
(150, 2, 'El Socorro', NULL),
(151, 2, 'La Aguadita', NULL),
(152, 2, 'Las Vegas', NULL),
(153, 2, 'Libertad de Cojedes', NULL),
(154, 2, 'Mapuey', NULL),
(155, 2, 'Piñedo', NULL),
(156, 2, 'Samancito', NULL),
(157, 2, 'San Carlos', NULL),
(158, 2, 'Sucre', NULL),
(159, 2, 'Tinaco', NULL),
(160, 2, 'Tinaquillo', NULL),
(161, 2, 'Vallecito', NULL),
(162, 2, 'Tucupita', NULL),
(163, 2, 'Caracas', NULL),
(164, 2, 'El Junquito', NULL),
(165, 2, 'Adícora', NULL),
(166, 2, 'Boca de Aroa', NULL),
(167, 2, 'Cabure', NULL),
(168, 2, 'Capadare', NULL),
(169, 2, 'Capatárida', NULL),
(170, 2, 'Chichiriviche', NULL),
(171, 2, 'Churuguara', NULL),
(172, 2, 'Coro', NULL),
(173, 2, 'Cumarebo', NULL),
(174, 2, 'Dabajuro', NULL),
(175, 2, 'Judibana', NULL),
(176, 2, 'La Cruz de Taratara', NULL),
(177, 2, 'La Vela de Coro', NULL),
(178, 2, 'Los Taques', NULL),
(179, 2, 'Maparari', NULL),
(180, 2, 'Mene de Mauroa', NULL),
(181, 2, 'Mirimire', NULL),
(182, 2, 'Pedregal', NULL),
(183, 2, 'Píritu Falcón', NULL),
(184, 2, 'Pueblo Nuevo Falcón', NULL),
(185, 2, 'Puerto Cumarebo', NULL),
(186, 2, 'Punta Cardón', NULL),
(187, 2, 'Punto Fijo', NULL),
(188, 2, 'San Juan de Los Cayos', NULL),
(189, 2, 'San Luis', NULL),
(190, 2, 'Santa Ana Falcón', NULL),
(191, 2, 'Santa Cruz De Bucaral', NULL),
(192, 2, 'Tocopero', NULL),
(193, 2, 'Tocuyo de La Costa', NULL),
(194, 2, 'Tucacas', NULL),
(195, 2, 'Yaracal', NULL),
(196, 2, 'Altagracia de Orituco', NULL),
(197, 2, 'Cabruta', NULL),
(198, 2, 'Calabozo', NULL),
(199, 2, 'Camaguán', NULL),
(200, 2, 'Chaguaramas Guárico', NULL),
(201, 2, 'El Socorro', NULL),
(202, 2, 'El Sombrero', NULL),
(203, 2, 'Las Mercedes de Los Llanos', NULL),
(204, 2, 'Lezama', NULL),
(205, 2, 'Onoto', NULL),
(206, 2, 'Ortíz', NULL),
(207, 2, 'San José de Guaribe', NULL),
(208, 2, 'San Juan de Los Morros', NULL),
(209, 2, 'San Rafael de Laya', NULL),
(210, 2, 'Santa María de Ipire', NULL),
(211, 2, 'Tucupido', NULL),
(212, 2, 'Valle de La Pascua', NULL),
(213, 2, 'Zaraza', NULL),
(214, 2, 'Aguada Grande', NULL),
(215, 2, 'Atarigua', NULL),
(216, 2, 'Barquisimeto', NULL),
(217, 2, 'Bobare', NULL),
(218, 2, 'Cabudare', NULL),
(219, 2, 'Carora', NULL),
(220, 2, 'Cubiro', NULL),
(221, 2, 'Cují', NULL),
(222, 2, 'Duaca', NULL),
(223, 2, 'El Manzano', NULL),
(224, 2, 'El Tocuyo', NULL),
(225, 2, 'Guaríco', NULL),
(226, 2, 'Humocaro Alto', NULL),
(227, 2, 'Humocaro Bajo', NULL),
(228, 2, 'La Miel', NULL),
(229, 2, 'Moroturo', NULL),
(230, 2, 'Quíbor', NULL),
(231, 2, 'Río Claro', NULL),
(232, 2, 'Sanare', NULL),
(233, 2, 'Santa Inés', NULL),
(234, 2, 'Sarare', NULL),
(235, 2, 'Siquisique', NULL),
(236, 2, 'Tintorero', NULL),
(237, 2, 'Apartaderos Mérida', NULL),
(238, 2, 'Arapuey', NULL),
(239, 2, 'Bailadores', NULL),
(240, 2, 'Caja Seca', NULL),
(241, 2, 'Canaguá', NULL),
(242, 2, 'Chachopo', NULL),
(243, 2, 'Chiguara', NULL),
(244, 2, 'Ejido', NULL),
(245, 2, 'El Vigía', NULL),
(246, 2, 'La Azulita', NULL),
(247, 2, 'La Playa', NULL),
(248, 2, 'Lagunillas Mérida', NULL),
(249, 2, 'Mérida', NULL),
(250, 2, 'Mesa de Bolívar', NULL),
(251, 2, 'Mucuchíes', NULL),
(252, 2, 'Mucujepe', NULL),
(253, 2, 'Mucuruba', NULL),
(254, 2, 'Nueva Bolivia', NULL),
(255, 2, 'Palmarito', NULL),
(256, 2, 'Pueblo Llano', NULL),
(257, 2, 'Santa Cruz de Mora', NULL),
(258, 2, 'Santa Elena de Arenales', NULL),
(259, 2, 'Santo Domingo', NULL),
(260, 2, 'Tabáy', NULL),
(261, 2, 'Timotes', NULL),
(262, 2, 'Torondoy', NULL),
(263, 2, 'Tovar', NULL),
(264, 2, 'Tucani', NULL),
(265, 2, 'Zea', NULL),
(266, 2, 'Araguita', NULL),
(267, 2, 'Carrizal', NULL),
(268, 2, 'Caucagua', NULL),
(269, 2, 'Chaguaramas Miranda', NULL),
(270, 2, 'Charallave', NULL),
(271, 2, 'Chirimena', NULL),
(272, 2, 'Chuspa', NULL),
(273, 2, 'Cúa', NULL),
(274, 2, 'Cupira', NULL),
(275, 2, 'Curiepe', NULL),
(276, 2, 'El Guapo', NULL),
(277, 2, 'El Jarillo', NULL),
(278, 2, 'Filas de Mariche', NULL),
(279, 2, 'Guarenas', NULL),
(280, 2, 'Guatire', NULL),
(281, 2, 'Higuerote', NULL),
(282, 2, 'Los Anaucos', NULL),
(283, 2, 'Los Teques', NULL),
(284, 2, 'Ocumare del Tuy', NULL),
(285, 2, 'Panaquire', NULL),
(286, 2, 'Paracotos', NULL),
(287, 2, 'Río Chico', NULL),
(288, 2, 'San Antonio de Los Altos', NULL),
(289, 2, 'San Diego de Los Altos', NULL),
(290, 2, 'San Fernando del Guapo', NULL),
(291, 2, 'San Francisco de Yare', NULL),
(292, 2, 'San José de Los Altos', NULL),
(293, 2, 'San José de Río Chico', NULL),
(294, 2, 'San Pedro de Los Altos', NULL),
(295, 2, 'Santa Lucía', NULL),
(296, 2, 'Santa Teresa', NULL),
(297, 2, 'Tacarigua de La Laguna', NULL),
(298, 2, 'Tacarigua de Mamporal', NULL),
(299, 2, 'Tácata', NULL),
(300, 2, 'Turumo', NULL),
(301, 2, 'Aguasay', NULL),
(302, 2, 'Aragua de Maturín', NULL),
(303, 2, 'Barrancas del Orinoco', NULL),
(304, 2, 'Caicara de Maturín', NULL),
(305, 2, 'Caripe', NULL),
(306, 2, 'Caripito', NULL),
(307, 2, 'Chaguaramal', NULL),
(308, 2, 'Chaguaramas Monagas', NULL),
(309, 2, 'El Furrial', NULL),
(310, 2, 'El Tejero', NULL),
(311, 2, 'Jusepín', NULL),
(312, 2, 'La Toscana', NULL),
(313, 2, 'Maturín', NULL),
(314, 2, 'Miraflores', NULL),
(315, 2, 'Punta de Mata', NULL),
(316, 2, 'Quiriquire', NULL),
(317, 2, 'San Antonio de Maturín', NULL),
(318, 2, 'San Vicente Monagas', NULL),
(319, 2, 'Santa Bárbara', NULL),
(320, 2, 'Temblador', NULL),
(321, 2, 'Teresen', NULL),
(322, 2, 'Uracoa', NULL),
(323, 2, 'Altagracia', NULL),
(324, 2, 'Boca de Pozo', NULL),
(325, 2, 'Boca de Río', NULL),
(326, 2, 'El Espinal', NULL),
(327, 2, 'El Valle del Espíritu Santo', NULL),
(328, 2, 'El Yaque', NULL),
(329, 2, 'Juangriego', NULL),
(330, 2, 'La Asunción', NULL),
(331, 2, 'La Guardia', NULL),
(332, 2, 'Pampatar', NULL),
(333, 2, 'Porlamar', NULL),
(334, 2, 'Puerto Fermín', NULL),
(335, 2, 'Punta de Piedras', NULL),
(336, 2, 'San Francisco de Macanao', NULL),
(337, 2, 'San Juan Bautista', NULL),
(338, 2, 'San Pedro de Coche', NULL),
(339, 2, 'Santa Ana de Nueva Esparta', NULL),
(340, 2, 'Villa Rosa', NULL),
(341, 2, 'Acarigua', NULL),
(342, 2, 'Agua Blanca', NULL),
(343, 2, 'Araure', NULL),
(344, 2, 'Biscucuy', NULL),
(345, 2, 'Boconoito', NULL),
(346, 2, 'Campo Elías', NULL),
(347, 2, 'Chabasquén', NULL),
(348, 2, 'Guanare', NULL),
(349, 2, 'Guanarito', NULL),
(350, 2, 'La Aparición', NULL),
(351, 2, 'La Misión', NULL),
(352, 2, 'Mesa de Cavacas', NULL),
(353, 2, 'Ospino', NULL),
(354, 2, 'Papelón', NULL),
(355, 2, 'Payara', NULL),
(356, 2, 'Pimpinela', NULL),
(357, 2, 'Píritu de Portuguesa', NULL),
(358, 2, 'San Rafael de Onoto', NULL),
(359, 2, 'Santa Rosalía', NULL),
(360, 2, 'Turén', NULL),
(361, 2, 'Altos de Sucre', NULL),
(362, 2, 'Araya', NULL),
(363, 2, 'Cariaco', NULL),
(364, 2, 'Carúpano', NULL),
(365, 2, 'Casanay', NULL),
(366, 2, 'Cumaná', NULL),
(367, 2, 'Cumanacoa', NULL),
(368, 2, 'El Morro Puerto Santo', NULL),
(369, 2, 'El Pilar', NULL),
(370, 2, 'El Poblado', NULL),
(371, 2, 'Guaca', NULL),
(372, 2, 'Guiria', NULL),
(373, 2, 'Irapa', NULL),
(374, 2, 'Manicuare', NULL),
(375, 2, 'Mariguitar', NULL),
(376, 2, 'Río Caribe', NULL),
(377, 2, 'San Antonio del Golfo', NULL),
(378, 2, 'San José de Aerocuar', NULL),
(379, 2, 'San Vicente de Sucre', NULL),
(380, 2, 'Santa Fe de Sucre', NULL),
(381, 2, 'Tunapuy', NULL),
(382, 2, 'Yaguaraparo', NULL),
(383, 2, 'Yoco', NULL),
(384, 2, 'Abejales', NULL),
(385, 2, 'Borota', NULL),
(386, 2, 'Bramon', NULL),
(387, 2, 'Capacho', NULL),
(388, 2, 'Colón', NULL),
(389, 2, 'Coloncito', NULL),
(390, 2, 'Cordero', NULL),
(391, 2, 'El Cobre', NULL),
(392, 2, 'El Pinal', NULL),
(393, 2, 'Independencia', NULL),
(394, 2, 'La Fría', NULL),
(395, 2, 'La Grita', NULL),
(396, 2, 'La Pedrera', NULL),
(397, 2, 'La Tendida', NULL),
(398, 2, 'Las Delicias', NULL),
(399, 2, 'Las Hernández', NULL),
(400, 2, 'Lobatera', NULL),
(401, 2, 'Michelena', NULL),
(402, 2, 'Palmira', NULL),
(403, 2, 'Pregonero', NULL),
(404, 2, 'Queniquea', NULL),
(405, 2, 'Rubio', NULL),
(406, 2, 'San Antonio del Tachira', NULL),
(407, 2, 'San Cristobal', NULL),
(408, 2, 'San José de Bolívar', NULL),
(409, 2, 'San Josecito', NULL),
(410, 2, 'San Pedro del Río', NULL),
(411, 2, 'Santa Ana Táchira', NULL),
(412, 2, 'Seboruco', NULL),
(413, 2, 'Táriba', NULL),
(414, 2, 'Umuquena', NULL),
(415, 2, 'Ureña', NULL),
(416, 2, 'Batatal', NULL),
(417, 2, 'Betijoque', NULL),
(418, 2, 'Boconó', NULL),
(419, 2, 'Carache', NULL),
(420, 2, 'Chejende', NULL),
(421, 2, 'Cuicas', NULL),
(422, 2, 'El Dividive', NULL),
(423, 2, 'El Jaguito', NULL),
(424, 2, 'Escuque', NULL),
(425, 2, 'Isnotú', NULL),
(426, 2, 'Jajó', NULL),
(427, 2, 'La Ceiba', NULL),
(428, 2, 'La Concepción de Trujllo', NULL),
(429, 2, 'La Mesa de Esnujaque', NULL),
(430, 2, 'La Puerta', NULL),
(431, 2, 'La Quebrada', NULL),
(432, 2, 'Mendoza Fría', NULL),
(433, 2, 'Meseta de Chimpire', NULL),
(434, 2, 'Monay', NULL),
(435, 2, 'Motatán', NULL),
(436, 2, 'Pampán', NULL),
(437, 2, 'Pampanito', NULL),
(438, 2, 'Sabana de Mendoza', NULL),
(439, 2, 'San Lázaro', NULL),
(440, 2, 'Santa Ana de Trujillo', NULL),
(441, 2, 'Tostós', NULL),
(442, 2, 'Trujillo', NULL),
(443, 2, 'Valera', NULL),
(444, 2, 'Carayaca', NULL),
(445, 2, 'Litoral', NULL),
(446, 2, 'Archipiélago Los Roques', NULL),
(447, 2, 'Aroa', NULL),
(448, 2, 'Boraure', NULL),
(449, 2, 'Campo Elías de Yaracuy', NULL),
(450, 2, 'Chivacoa', NULL),
(451, 2, 'Cocorote', NULL),
(452, 2, 'Farriar', NULL),
(453, 2, 'Guama', NULL),
(454, 2, 'Marín', NULL),
(455, 2, 'Nirgua', NULL),
(456, 2, 'Sabana de Parra', NULL),
(457, 2, 'Salom', NULL),
(458, 2, 'San Felipe', NULL),
(459, 2, 'San Pablo de Yaracuy', NULL),
(460, 2, 'Urachiche', NULL),
(461, 2, 'Yaritagua', NULL),
(462, 2, 'Yumare', NULL),
(463, 2, 'Bachaquero', NULL),
(464, 2, 'Bobures', NULL),
(465, 2, 'Cabimas', NULL),
(466, 2, 'Campo Concepción', NULL),
(467, 2, 'Campo Mara', NULL),
(468, 2, 'Campo Rojo', NULL),
(469, 2, 'Carrasquero', NULL),
(470, 2, 'Casigua', NULL),
(471, 2, 'Chiquinquirá', NULL),
(472, 2, 'Ciudad Ojeda', NULL),
(473, 2, 'El Batey', NULL),
(474, 2, 'El Carmelo', NULL),
(475, 2, 'El Chivo', NULL),
(476, 2, 'El Guayabo', NULL),
(477, 2, 'El Mene', NULL),
(478, 2, 'El Venado', NULL),
(479, 2, 'Encontrados', NULL),
(480, 2, 'Gibraltar', NULL),
(481, 2, 'Isla de Toas', NULL),
(482, 2, 'La Concepción del Zulia', NULL),
(483, 2, 'La Paz', NULL),
(484, 2, 'La Sierrita', NULL),
(485, 2, 'Lagunillas del Zulia', NULL),
(486, 2, 'Las Piedras de Perijá', NULL),
(487, 2, 'Los Cortijos', NULL),
(488, 2, 'Machiques', NULL),
(489, 2, 'Maracaibo', NULL),
(490, 2, 'Mene Grande', NULL),
(491, 2, 'Palmarejo', NULL),
(492, 2, 'Paraguaipoa', NULL),
(493, 2, 'Potrerito', NULL),
(494, 2, 'Pueblo Nuevo del Zulia', NULL),
(495, 2, 'Puertos de Altagracia', NULL),
(496, 2, 'Punta Gorda', NULL),
(497, 2, 'Sabaneta de Palma', NULL),
(498, 2, 'San Francisco', NULL),
(499, 2, 'San José de Perijá', NULL),
(500, 2, 'San Rafael del Moján', NULL),
(501, 2, 'San Timoteo', NULL),
(502, 2, 'Santa Bárbara Del Zulia', NULL),
(503, 2, 'Santa Cruz de Mara', NULL),
(504, 2, 'Santa Cruz del Zulia', NULL),
(505, 2, 'Santa Rita', NULL),
(506, 2, 'Sinamaica', NULL),
(507, 2, 'Tamare', NULL),
(508, 2, 'Tía Juana', NULL),
(509, 2, 'Villa del Rosario', NULL),
(510, 2, 'La Guaira', NULL),
(511, 2, 'Catia La Mar', NULL),
(512, 2, 'Macuto', NULL),
(513, 2, 'Naiguatá', NULL),
(514, 2, 'Archipiélago Los Monjes', NULL),
(515, 2, 'Isla La Tortuga y Cayos adyacentes', NULL),
(516, 2, 'Isla La Sola', NULL),
(517, 2, 'Islas Los Testigos', NULL),
(518, 2, 'Islas Los Frailes', NULL),
(519, 2, 'Isla La Orchila', NULL),
(520, 2, 'Archipiélago Las Aves', NULL),
(521, 2, 'Isla de Aves', NULL),
(522, 2, 'Isla La Blanquilla', NULL),
(523, 2, 'Isla de Patos', NULL),
(524, 2, 'Islas Los Hermanos', NULL),
(525, 4, 'Venezuela', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_option_groups`
--

CREATE TABLE `fs_option_groups` (
  `id_option_group` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_option_groups`
--

INSERT INTO `fs_option_groups` (`id_option_group`, `name`) VALUES
(1, 'TIPOS DE ESTATUS'),
(2, 'CIUDADES'),
(3, 'ESTADOS/PROVINCIA'),
(4, 'PAISES'),
(5, 'ESTATUS PEDIDOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_orders`
--

CREATE TABLE `fs_orders` (
  `id_order` int(11) NOT NULL,
  `id_cart` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_payment` int(11) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `amount_usd` decimal(20,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_orders`
--

INSERT INTO `fs_orders` (`id_order`, `id_cart`, `id_customer`, `id_payment`, `reference`, `amount`, `amount_usd`, `created_at`, `op_status`) VALUES
(1, 12, 1, NULL, 'SDANANASD', '0.00', '0.00', '2022-08-31 04:19:31', 'P'),
(2, 11, 1, NULL, 'ASDNNKFAN', '78.00', '8.18', '2022-08-31 04:24:22', 'P'),
(3, 0, 1, NULL, 'VAWSKMQDS', '0.00', '0.00', '2022-08-31 04:26:50', 'P'),
(4, 0, 1, NULL, 'NIASDNAKSG', '0.00', '0.00', '2022-08-31 04:29:09', 'P'),
(5, 0, 1, NULL, 'DAKSNDQWD', '0.00', '0.00', '2022-08-31 04:30:57', 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_order_lines`
--

CREATE TABLE `fs_order_lines` (
  `id_order_line` int(255) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `amount_usd` decimal(20,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_order_lines`
--

INSERT INTO `fs_order_lines` (`id_order_line`, `id_order`, `id_product`, `quantity`, `amount`, `amount_usd`, `created_at`) VALUES
(1, 1, 1, 5, NULL, NULL, NULL),
(2, 1, 2, 5, NULL, NULL, NULL),
(3, 2, 2, 1, NULL, NULL, NULL),
(4, 3, 1, 6, NULL, NULL, NULL),
(5, 4, 3, 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_payments`
--

CREATE TABLE `fs_payments` (
  `id_payment` int(255) NOT NULL,
  `id_order` varchar(255) DEFAULT NULL,
  `id_payment_method` varchar(255) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_created_by` int(11) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_payment_methods`
--

CREATE TABLE `fs_payment_methods` (
  `id_payment_menthod` int(255) NOT NULL,
  `id_bank_account` int(11) DEFAULT NULL,
  `is_tangible` int(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `op_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_periods`
--

CREATE TABLE `fs_periods` (
  `id_period` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_init` datetime DEFAULT NULL,
  `date_ent` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_permissions`
--

CREATE TABLE `fs_permissions` (
  `id_permission` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `add` varchar(255) DEFAULT NULL,
  `edit` varchar(255) DEFAULT NULL,
  `delete` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_products`
--

CREATE TABLE `fs_products` (
  `id_product` int(11) NOT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_tax` int(11) DEFAULT NULL,
  `id_active_compound` int(11) DEFAULT NULL,
  `id_discount` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `ref` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `bar_code` varchar(64) DEFAULT NULL,
  `price_cost` decimal(20,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `price_unit` decimal(20,2) DEFAULT NULL,
  `price_usd` decimal(10,2) DEFAULT NULL,
  `price_suggested` decimal(20,2) DEFAULT NULL,
  `img_name` longtext DEFAULT NULL,
  `min_sell` int(11) DEFAULT NULL,
  `max_sell` bigint(255) DEFAULT NULL,
  `multiple_sell` int(11) DEFAULT NULL,
  `units_per_pack` int(1) DEFAULT NULL,
  `codisb` int(11) DEFAULT NULL,
  `expire_at` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `is_regulated` int(1) DEFAULT NULL,
  `is_featured` int(1) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_products`
--

INSERT INTO `fs_products` (`id_product`, `id_brand`, `id_category`, `id_tax`, `id_active_compound`, `id_discount`, `id_supplier`, `ref`, `name`, `short_description`, `description`, `code`, `bar_code`, `price_cost`, `price`, `price_unit`, `price_usd`, `price_suggested`, `img_name`, `min_sell`, `max_sell`, `multiple_sell`, `units_per_pack`, `codisb`, `expire_at`, `created_at`, `is_active`, `is_regulated`, `is_featured`, `op_status`) VALUES
(1, 1, 1, 1, 1, 1, NULL, NULL, 'Acetaminofeno pediatrico', NULL, 'Acetaminofen', '555123', '52168412138', NULL, '21.00', NULL, '2.60', NULL, 'Acetaminofem-600x450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 'A'),
(2, 1, 2, 1, 1, 1, NULL, NULL, 'venda', NULL, NULL, '123456', '49845261396', NULL, '10.00', NULL, '6.00', NULL, 'Acetaminofem-600x450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'A'),
(3, 1, 3, 1, 2, 1, NULL, NULL, 'Ibuprofeno', NULL, NULL, '211345', '48941134764', NULL, '19.00', NULL, '1.86', NULL, 'Acetaminofem-600x450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'A'),
(4, 1, 2, 1, 1, 1, NULL, NULL, 'Alpran', NULL, NULL, '214523', '48845365199', NULL, '80.00', NULL, '2.00', NULL, 'Acetaminofem-600x450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 'A'),
(5, 1, 2, 1, 1, 1, NULL, NULL, 'mirosidil', NULL, NULL, '548766', '19848164169', NULL, '13.00', NULL, '1.00', NULL, 'Acetaminofem-600x450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'A'),
(6, 1, 3, 1, 1, 1, NULL, NULL, 'medicina', NULL, NULL, '165975', '15644987646', NULL, '6.00', NULL, '4.00', NULL, 'Acetaminofem-600x450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_roles`
--

CREATE TABLE `fs_roles` (
  `id_role` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `is_deleted` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_roles`
--

INSERT INTO `fs_roles` (`id_role`, `name`, `is_active`, `is_deleted`) VALUES
(-1, 'SuperSu', -1, -1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_role_permissions`
--

CREATE TABLE `fs_role_permissions` (
  `id_role_permission` int(255) NOT NULL,
  `id_role` int(255) DEFAULT NULL,
  `id_permission` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_stock`
--

CREATE TABLE `fs_stock` (
  `id_stock` int(11) NOT NULL,
  `id_warehouse` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `current_stock` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_stock`
--

INSERT INTO `fs_stock` (`id_stock`, `id_warehouse`, `id_product`, `current_stock`) VALUES
(1, 1, 1, '0.00'),
(2, 1, 3, '8.00'),
(3, 1, 2, '5.00'),
(4, 1, 4, '7.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_taxes`
--

CREATE TABLE `fs_taxes` (
  `id_tax` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_taxes`
--

INSERT INTO `fs_taxes` (`id_tax`, `name`, `rate`, `op_status`) VALUES
(1, 'IVA 16%', '16.00', '1'),
(2, 'TEST', '7.00', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_transactions`
--

CREATE TABLE `fs_transactions` (
  `id_transaction` int(11) NOT NULL,
  `id_document` int(11) DEFAULT NULL,
  `id_move` int(11) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_transactions`
--

INSERT INTO `fs_transactions` (`id_transaction`, `id_document`, `id_move`, `transaction_date`, `description`) VALUES
(1, 1, 1, '2022-07-18 03:24:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_usd_rates`
--

CREATE TABLE `fs_usd_rates` (
  `id_rate` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `rate` decimal(20,2) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_usd_rates`
--

INSERT INTO `fs_usd_rates` (`id_rate`, `date`, `rate`, `op_status`) VALUES
(1, '2022-08-31 01:46:32', '7.82', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_vouchers`
--

CREATE TABLE `fs_vouchers` (
  `id_voucher` int(11) NOT NULL,
  `id_voucher_type` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `id_employeer` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `observations` varchar(64) DEFAULT NULL,
  `op_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_vouchers`
--

INSERT INTO `fs_vouchers` (`id_voucher`, `id_voucher_type`, `id_customer`, `id_supplier`, `id_employeer`, `code`, `number`, `date`, `amount`, `observations`, `op_status`, `created_at`, `id_created_by`) VALUES
(1, 1, NULL, NULL, NULL, 'NC-1', 3, '07/28/2022', '0.00', '', 2, '2022-08-02 03:02:44', 1),
(2, 7, NULL, NULL, NULL, 'COM', NULL, '07/28/2022', '0.00', '', 1, '2022-07-28 06:11:24', 1),
(3, 5, NULL, NULL, NULL, 'F', NULL, '07/28/2022', '0.00', '', 1, '2022-07-28 06:08:40', 1),
(4, 2, NULL, NULL, NULL, 'NV-2', NULL, '07/28/2022', '0.00', '', 2, '2022-07-28 06:34:13', 1),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-07-23 09:47:50', 1),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-08-25 12:18:20', 1),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-08-25 12:18:22', 1),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-08-25 12:19:05', 1),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-01 09:46:54', 1),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-01 09:46:57', 1),
(11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-01 09:47:12', 1),
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-01 09:47:19', 1),
(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-01 09:47:22', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_voucher_lines`
--

CREATE TABLE `fs_voucher_lines` (
  `id_voucher_line` int(255) NOT NULL,
  `id_voucher` int(11) DEFAULT NULL,
  `id_account` int(11) DEFAULT NULL,
  `is_net_income` varchar(255) DEFAULT NULL,
  `line_text` varchar(255) DEFAULT NULL,
  `left_index` decimal(20,2) DEFAULT NULL,
  `right_index` decimal(20,2) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `id_created_by` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `id_update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_voucher_lines`
--

INSERT INTO `fs_voucher_lines` (`id_voucher_line`, `id_voucher`, `id_account`, `is_net_income`, `line_text`, `left_index`, `right_index`, `op_status`, `created_at`, `id_created_by`, `update_at`, `id_update_by`) VALUES
(1, 0, 0, NULL, 'APERTURA DE CAJA', '0.00', NULL, 'D', NULL, NULL, NULL, NULL),
(2, 1, 1, NULL, 'test', '5.50', '5.66', 'A', 'NOW()', 1, NULL, NULL),
(3, 1, 1, NULL, 'test', '5.50', '5.66', 'A', '2022-07-23 07:05:00', 1, NULL, NULL),
(4, 1, 1, NULL, 'txt', '5.00', '512.00', NULL, NULL, NULL, NULL, NULL),
(5, 2, 0, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(6, 2, 0, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(7, 2, 2, NULL, 'hola', '123.00', '123.00', NULL, NULL, NULL, NULL, NULL),
(8, 2, 1, NULL, 'Hola', '12.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(9, 1, 1, NULL, 'Hola', '5.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(10, 1, 3, NULL, 'Adquisicion de Terreno Valdio', '0.00', '500.00', NULL, NULL, NULL, NULL, NULL),
(11, 1, 4, NULL, 'regalos', '1000.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(12, 3, 1, NULL, 'Hola', '15.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(13, 3, 1, NULL, 'Hola', '15.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(14, 2, 1, NULL, 'Hola', '12.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(15, 2, 1, NULL, 'Hola', '12.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(16, 2, 1, NULL, 'Hola', '12.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(17, 2, 1, NULL, 'asd', '5.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(18, 3, 2, NULL, 'Adquisicion de Terreno Valdio', '0.00', '30.00', NULL, NULL, NULL, NULL, NULL),
(19, 3, 3, NULL, 'asd', '5.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(20, 3, 0, NULL, '', '0.00', '1231.00', NULL, NULL, NULL, NULL, NULL),
(21, 3, 0, NULL, 'Adquisicion de Terreno Valdio', '12.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(22, 3, 1, NULL, 'Hola', '1.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(23, 3, 1, NULL, 'Hola', '1.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(24, 3, 1, NULL, '', '0.00', '5.00', NULL, NULL, NULL, NULL, NULL),
(25, 3, 2, NULL, 'Hola', '0.00', '1.00', NULL, NULL, NULL, NULL, NULL),
(26, 3, 2, NULL, '123', '123.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(27, 3, 3, NULL, 'Hola', '0.00', '15.50', NULL, NULL, NULL, NULL, NULL),
(28, 3, 4, NULL, '123', '0.00', '30.00', NULL, NULL, NULL, NULL, NULL),
(29, 3, 4, NULL, '123', '0.00', '30.00', NULL, NULL, NULL, NULL, NULL),
(30, 3, 4, NULL, '123', '0.00', '30.00', NULL, NULL, NULL, NULL, NULL),
(31, 3, 4, NULL, '123', '0.00', '30.00', NULL, NULL, NULL, NULL, NULL),
(32, 3, 3, NULL, 'Hola', '11.50', '0.00', NULL, NULL, NULL, NULL, NULL),
(33, 3, 2, NULL, 'Hola', '0.00', '1.00', NULL, NULL, NULL, NULL, NULL),
(34, 3, 2, NULL, '123', '5.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(35, 3, 1, NULL, 'Hola', '12.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(36, 3, 2, NULL, 'Hola', '0.00', '10.00', NULL, NULL, NULL, NULL, NULL),
(37, 3, 2, NULL, 'Hola', '5.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(38, 3, 3, NULL, 'Hola', '0.00', '10.00', NULL, NULL, NULL, NULL, NULL),
(39, 3, 2, NULL, 'Hola', '0.00', '1.00', NULL, NULL, NULL, NULL, NULL),
(40, 3, 2, NULL, 'Hola', '0.00', '1.00', NULL, NULL, NULL, NULL, NULL),
(41, 3, 2, NULL, 'Hola', '0.00', '1.00', NULL, NULL, NULL, NULL, NULL),
(42, 3, 4, NULL, 'Adquisicion de Terreno Valdio', '2.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(43, 3, 4, NULL, 'Adquisicion de Terreno Valdio', '2.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(44, 3, 2, NULL, 'Hola', '0.00', '12.00', NULL, NULL, NULL, NULL, NULL),
(45, 3, 2, NULL, 'Hola', '0.00', '12.00', NULL, NULL, NULL, NULL, NULL),
(46, 3, 2, NULL, 'Hola', '0.00', '12.00', NULL, NULL, NULL, NULL, NULL),
(47, 3, 2, NULL, 'Hola', '5.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(48, 3, 2, NULL, 'Hola', '5.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(49, 3, 1, NULL, 'Hola', '5.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(50, 3, 2, NULL, 'Hola', '0.00', '19.00', NULL, NULL, NULL, NULL, NULL),
(51, 3, 2, NULL, 'Adquisicion de Terreno Valdio', '38.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(52, 3, 3, NULL, 'Adquisicion de Terreno Valdio', '1219.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(53, 3, 1, NULL, 'Hola', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(54, 3, 2, NULL, 'Hola', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(55, 3, 2, NULL, 'Hola', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(56, 3, 3, NULL, 'Hola', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(57, 3, 1, NULL, 'Adquisicion de Terreno Valdio', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(58, 3, 2, NULL, 'Hola', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(59, 3, 2, NULL, 'Hola', '123.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(60, 3, 2, NULL, 'Hola', '0.00', '123.00', NULL, NULL, NULL, NULL, NULL),
(61, 3, 2, NULL, 'Hola', '123.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(62, 3, -1, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(63, 3, -1, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(64, 3, -1, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(65, 3, 2, NULL, 'Adquisicion de Terreno Valdio', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(66, 2, -1, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(67, 2, -1, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(68, 2, -1, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(69, 2, -1, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(70, 2, -1, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(71, 2, -1, NULL, '', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(72, 2, 1, NULL, 'Adquisicion de Terreno Valdio', '0.00', '53.00', NULL, NULL, NULL, NULL, NULL),
(73, 2, 2, NULL, 'Adquisicion de Terreno Valdio', '123.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(74, 2, 4, NULL, '123', '0.00', '123.00', NULL, NULL, NULL, NULL, NULL),
(75, 4, 1, NULL, 'Ingreso', '32.75', '0.00', NULL, NULL, NULL, NULL, NULL),
(76, 4, 1, NULL, 'Ingreso', '32.75', '0.00', NULL, NULL, NULL, NULL, NULL),
(77, 4, 1, NULL, 'Ingreso', '32.75', '0.00', NULL, NULL, NULL, NULL, NULL),
(78, 4, 1, NULL, 'Ingreso', '32.75', '0.00', NULL, NULL, NULL, NULL, NULL),
(79, 4, 4, NULL, 'otros', '0.00', '131.00', NULL, NULL, NULL, NULL, NULL),
(80, 4, 2, NULL, 'pagare', '32.75', '0.00', NULL, NULL, NULL, NULL, NULL),
(81, 4, 2, NULL, 'Adquisicion de Terreno Valdio', '35.75', '0.00', NULL, NULL, NULL, NULL, NULL),
(82, 1, 1, NULL, 'Hola', '662.62', '0.00', NULL, NULL, NULL, NULL, NULL),
(83, 1, 2, NULL, 'Adquisicion de Terreno Valdio', '0.00', '660.30', NULL, NULL, NULL, NULL, NULL),
(84, 6, 1, NULL, 'Adquisicion de Terreno Valdio', '100.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(85, 2, 3, NULL, 'Hola', '12.00', '0.00', NULL, NULL, NULL, NULL, NULL),
(86, 2, 4, NULL, 'nick', '0.00', '12.00', NULL, NULL, NULL, NULL, NULL),
(87, 9, 2, NULL, 'Hola', '123.00', '0.00', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_voucher_types`
--

CREATE TABLE `fs_voucher_types` (
  `id_voucher_type` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `serie` varchar(32) DEFAULT NULL,
  `id_subsidiary_ledger` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_created_by` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_voucher_types`
--

INSERT INTO `fs_voucher_types` (`id_voucher_type`, `name`, `serie`, `id_subsidiary_ledger`, `created_at`, `id_created_by`) VALUES
(1, 'NOTAS DE COMPRA', 'NC-1', NULL, NULL, NULL),
(2, 'NOTAS DE VENTA', 'NV-2', NULL, NULL, NULL),
(4, 'ASIENTO GENERAL', 'A', NULL, NULL, NULL),
(5, 'FACTURA', 'F', NULL, NULL, NULL),
(6, 'NOMINA', 'N', NULL, NULL, NULL),
(7, 'COMPRA', 'COM', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_warehouses`
--

CREATE TABLE `fs_warehouses` (
  `id_warehouse` int(11) NOT NULL,
  `id_company` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fs_warehouses`
--

INSERT INTO `fs_warehouses` (`id_warehouse`, `id_company`, `name`, `address_1`, `address_2`, `op_status`) VALUES
(1, 1, 'ALMACEN GENERAL FARMA GO', 'SANTA RITA', 'CALLE 8', 'A'),
(2, 1, NULL, NULL, NULL, 'E'),
(3, 1, NULL, NULL, NULL, 'E'),
(4, NULL, NULL, NULL, NULL, 'T'),
(5, NULL, NULL, NULL, NULL, 'E'),
(6, NULL, NULL, NULL, NULL, 'T'),
(7, NULL, NULL, NULL, NULL, 'T'),
(8, NULL, NULL, NULL, NULL, 'T'),
(9, NULL, NULL, NULL, NULL, 'T'),
(10, NULL, NULL, NULL, NULL, 'T'),
(11, NULL, NULL, NULL, NULL, 'T'),
(12, NULL, NULL, NULL, NULL, 'T'),
(13, NULL, NULL, NULL, NULL, 'T'),
(14, NULL, NULL, NULL, NULL, 'T'),
(15, NULL, NULL, NULL, NULL, 'T'),
(16, NULL, NULL, NULL, NULL, 'T'),
(17, NULL, NULL, NULL, NULL, 'T'),
(18, NULL, NULL, NULL, NULL, 'T'),
(19, NULL, NULL, NULL, NULL, 'T'),
(20, NULL, NULL, NULL, NULL, 'T'),
(21, NULL, NULL, NULL, NULL, 'T'),
(22, NULL, NULL, NULL, NULL, 'T'),
(23, 1, 'ALMACEN GENERAL FARMA GO', 'Mi Casa', 'en sol amado', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fs_accounts`
--
ALTER TABLE `fs_accounts`
  ADD PRIMARY KEY (`id_account`);

--
-- Indices de la tabla `fs_active_compounds`
--
ALTER TABLE `fs_active_compounds`
  ADD PRIMARY KEY (`id_active_compound`) USING BTREE;

--
-- Indices de la tabla `fs_audit_trails`
--
ALTER TABLE `fs_audit_trails`
  ADD PRIMARY KEY (`id_audit_trail`);

--
-- Indices de la tabla `fs_brands`
--
ALTER TABLE `fs_brands`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indices de la tabla `fs_cart`
--
ALTER TABLE `fs_cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indices de la tabla `fs_cart_lines`
--
ALTER TABLE `fs_cart_lines`
  ADD PRIMARY KEY (`id_cart_line`);

--
-- Indices de la tabla `fs_categories`
--
ALTER TABLE `fs_categories`
  ADD PRIMARY KEY (`id_category`) USING BTREE;

--
-- Indices de la tabla `fs_companies`
--
ALTER TABLE `fs_companies`
  ADD PRIMARY KEY (`id_company`);

--
-- Indices de la tabla `fs_configurations`
--
ALTER TABLE `fs_configurations`
  ADD PRIMARY KEY (`id_configuration`);

--
-- Indices de la tabla `fs_connections`
--
ALTER TABLE `fs_connections`
  ADD PRIMARY KEY (`id_connection`);

--
-- Indices de la tabla `fs_discounts`
--
ALTER TABLE `fs_discounts`
  ADD PRIMARY KEY (`id_discount`);

--
-- Indices de la tabla `fs_entities`
--
ALTER TABLE `fs_entities`
  ADD PRIMARY KEY (`id_entity`) USING BTREE;

--
-- Indices de la tabla `fs_invoices`
--
ALTER TABLE `fs_invoices`
  ADD PRIMARY KEY (`id_invoice`);

--
-- Indices de la tabla `fs_invoice_lines`
--
ALTER TABLE `fs_invoice_lines`
  ADD PRIMARY KEY (`id_invoice_line`);

--
-- Indices de la tabla `fs_ledger_entries`
--
ALTER TABLE `fs_ledger_entries`
  ADD PRIMARY KEY (`id_ledger_entries`);

--
-- Indices de la tabla `fs_menu_items`
--
ALTER TABLE `fs_menu_items`
  ADD PRIMARY KEY (`id_menu_item`);

--
-- Indices de la tabla `fs_options`
--
ALTER TABLE `fs_options`
  ADD PRIMARY KEY (`id_option`);

--
-- Indices de la tabla `fs_option_groups`
--
ALTER TABLE `fs_option_groups`
  ADD PRIMARY KEY (`id_option_group`);

--
-- Indices de la tabla `fs_orders`
--
ALTER TABLE `fs_orders`
  ADD PRIMARY KEY (`id_order`);

--
-- Indices de la tabla `fs_order_lines`
--
ALTER TABLE `fs_order_lines`
  ADD PRIMARY KEY (`id_order_line`);

--
-- Indices de la tabla `fs_payments`
--
ALTER TABLE `fs_payments`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indices de la tabla `fs_payment_methods`
--
ALTER TABLE `fs_payment_methods`
  ADD PRIMARY KEY (`id_payment_menthod`);

--
-- Indices de la tabla `fs_periods`
--
ALTER TABLE `fs_periods`
  ADD PRIMARY KEY (`id_period`);

--
-- Indices de la tabla `fs_products`
--
ALTER TABLE `fs_products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indices de la tabla `fs_roles`
--
ALTER TABLE `fs_roles`
  ADD PRIMARY KEY (`id_role`) USING BTREE;

--
-- Indices de la tabla `fs_role_permissions`
--
ALTER TABLE `fs_role_permissions`
  ADD PRIMARY KEY (`id_role_permission`);

--
-- Indices de la tabla `fs_stock`
--
ALTER TABLE `fs_stock`
  ADD PRIMARY KEY (`id_stock`);

--
-- Indices de la tabla `fs_taxes`
--
ALTER TABLE `fs_taxes`
  ADD PRIMARY KEY (`id_tax`);

--
-- Indices de la tabla `fs_transactions`
--
ALTER TABLE `fs_transactions`
  ADD PRIMARY KEY (`id_transaction`);

--
-- Indices de la tabla `fs_usd_rates`
--
ALTER TABLE `fs_usd_rates`
  ADD PRIMARY KEY (`id_rate`);

--
-- Indices de la tabla `fs_vouchers`
--
ALTER TABLE `fs_vouchers`
  ADD PRIMARY KEY (`id_voucher`) USING BTREE;

--
-- Indices de la tabla `fs_voucher_lines`
--
ALTER TABLE `fs_voucher_lines`
  ADD PRIMARY KEY (`id_voucher_line`) USING BTREE;

--
-- Indices de la tabla `fs_voucher_types`
--
ALTER TABLE `fs_voucher_types`
  ADD PRIMARY KEY (`id_voucher_type`);

--
-- Indices de la tabla `fs_warehouses`
--
ALTER TABLE `fs_warehouses`
  ADD PRIMARY KEY (`id_warehouse`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fs_accounts`
--
ALTER TABLE `fs_accounts`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fs_active_compounds`
--
ALTER TABLE `fs_active_compounds`
  MODIFY `id_active_compound` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fs_audit_trails`
--
ALTER TABLE `fs_audit_trails`
  MODIFY `id_audit_trail` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1154;

--
-- AUTO_INCREMENT de la tabla `fs_brands`
--
ALTER TABLE `fs_brands`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fs_cart`
--
ALTER TABLE `fs_cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `fs_cart_lines`
--
ALTER TABLE `fs_cart_lines`
  MODIFY `id_cart_line` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `fs_categories`
--
ALTER TABLE `fs_categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fs_companies`
--
ALTER TABLE `fs_companies`
  MODIFY `id_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fs_configurations`
--
ALTER TABLE `fs_configurations`
  MODIFY `id_configuration` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fs_discounts`
--
ALTER TABLE `fs_discounts`
  MODIFY `id_discount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fs_entities`
--
ALTER TABLE `fs_entities`
  MODIFY `id_entity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fs_invoices`
--
ALTER TABLE `fs_invoices`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `fs_invoice_lines`
--
ALTER TABLE `fs_invoice_lines`
  MODIFY `id_invoice_line` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_ledger_entries`
--
ALTER TABLE `fs_ledger_entries`
  MODIFY `id_ledger_entries` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_menu_items`
--
ALTER TABLE `fs_menu_items`
  MODIFY `id_menu_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `fs_options`
--
ALTER TABLE `fs_options`
  MODIFY `id_option` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=526;

--
-- AUTO_INCREMENT de la tabla `fs_option_groups`
--
ALTER TABLE `fs_option_groups`
  MODIFY `id_option_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fs_orders`
--
ALTER TABLE `fs_orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fs_order_lines`
--
ALTER TABLE `fs_order_lines`
  MODIFY `id_order_line` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fs_payments`
--
ALTER TABLE `fs_payments`
  MODIFY `id_payment` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_payment_methods`
--
ALTER TABLE `fs_payment_methods`
  MODIFY `id_payment_menthod` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_periods`
--
ALTER TABLE `fs_periods`
  MODIFY `id_period` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_products`
--
ALTER TABLE `fs_products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `fs_roles`
--
ALTER TABLE `fs_roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_role_permissions`
--
ALTER TABLE `fs_role_permissions`
  MODIFY `id_role_permission` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_stock`
--
ALTER TABLE `fs_stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fs_taxes`
--
ALTER TABLE `fs_taxes`
  MODIFY `id_tax` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fs_transactions`
--
ALTER TABLE `fs_transactions`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fs_usd_rates`
--
ALTER TABLE `fs_usd_rates`
  MODIFY `id_rate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fs_vouchers`
--
ALTER TABLE `fs_vouchers`
  MODIFY `id_voucher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `fs_voucher_lines`
--
ALTER TABLE `fs_voucher_lines`
  MODIFY `id_voucher_line` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `fs_voucher_types`
--
ALTER TABLE `fs_voucher_types`
  MODIFY `id_voucher_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `fs_warehouses`
--
ALTER TABLE `fs_warehouses`
  MODIFY `id_warehouse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
