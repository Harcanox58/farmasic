-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-02-2023 a las 10:10:20
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

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
-- Estructura de tabla para la tabla `fs_accounting_accounts`
--

CREATE TABLE `fs_accounting_accounts` (
  `id_accounting_account` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_accounting_accounts`
--

INSERT INTO `fs_accounting_accounts` (`id_accounting_account`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'CXC', '18899', '2022-07-18 03:23:08', 1, '2022-10-25 01:41:36', 1),
(2, 'CXP', '27299', NULL, 1, '2022-10-25 01:42:15', 1),
(3, 'VENTAS', '00001', NULL, 1, NULL, 1),
(4, 'OTRAS ENTIDADES FINANCIERAS', '8010502', NULL, 1, NULL, 1),
(5, 'CAJA', '0010101', '2022-10-25 01:42:57', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_accounting_entry_types`
--

CREATE TABLE `fs_accounting_entry_types` (
  `id_accounting_entry_type` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_accounting_entry_types`
--

INSERT INTO `fs_accounting_entry_types` (`id_accounting_entry_type`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'CUENTAS POR COBRAR', 'CC', NULL, NULL, NULL, NULL),
(2, 'CUENTAS POR PAGAR', 'CP', NULL, NULL, NULL, NULL),
(4, 'ASIENTO GENERAL', 'A', NULL, NULL, NULL, NULL),
(5, 'FACTURA DE VENTA', 'F', NULL, NULL, NULL, NULL),
(6, 'NOTA DE VENTA', 'NV', NULL, NULL, NULL, NULL),
(7, 'NOTA DE COMPRA', 'NC', NULL, NULL, NULL, NULL),
(8, 'NOMINA', 'N', NULL, NULL, NULL, NULL),
(9, 'COMPRAS', 'C', NULL, NULL, '2022-10-25 17:24:48', 1),
(10, 'CAJA', 'CA', '2022-10-25 17:25:19', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_accounting_journal_entries`
--

CREATE TABLE `fs_accounting_journal_entries` (
  `id_accounting_journal_entry` int(11) NOT NULL,
  `id_accounting_entry_type` int(11) DEFAULT NULL,
  `id_entity` varchar(255) DEFAULT NULL,
  `corelative` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `amount_positive` decimal(20,2) DEFAULT NULL,
  `amount_negative` decimal(20,2) DEFAULT NULL,
  `observations` longtext DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_accounting_journal_entries`
--

INSERT INTO `fs_accounting_journal_entries` (`id_accounting_journal_entry`, `id_accounting_entry_type`, `id_entity`, `corelative`, `created_at`, `updated_at`, `amount_positive`, `amount_negative`, `observations`, `op_status`) VALUES
(1, 1, '1', 1, '2022-10-23 00:06:28', NULL, NULL, NULL, NULL, 'A'),
(2, 2, '3', 5544, '2022-10-04 00:23:30', NULL, NULL, NULL, NULL, 'F'),
(3, 4, '3', 1, '2022-10-23 01:17:15', NULL, NULL, NULL, NULL, 'F'),
(4, 5, '3', 5, '2022-10-23 01:18:32', NULL, NULL, NULL, 'hlasdsad', 'A'),
(5, 6, '4', 1, '2022-10-23 01:19:38', NULL, NULL, NULL, NULL, 'P'),
(6, 5, '1', NULL, '2022-10-26 17:56:22', NULL, NULL, NULL, NULL, 'P'),
(7, 5, '1', NULL, '2022-10-26 17:56:22', NULL, NULL, NULL, NULL, 'P'),
(8, 5, '1', NULL, '2022-10-26 17:59:40', NULL, NULL, NULL, NULL, 'P'),
(9, 5, '1', NULL, '2022-10-26 18:00:43', NULL, NULL, NULL, NULL, 'F'),
(10, 5, '1', 6, '2022-10-26 18:07:45', NULL, NULL, NULL, NULL, 'F'),
(11, 5, '1', 7, '2022-10-26 18:16:59', NULL, NULL, NULL, NULL, 'F'),
(12, 5, '1', 8, '2022-10-26 18:17:58', NULL, NULL, NULL, NULL, 'F'),
(13, 5, '1', 9, '2022-10-26 19:39:09', NULL, NULL, NULL, NULL, 'F'),
(14, 5, '1', 10, '2022-10-27 08:53:47', NULL, NULL, NULL, NULL, 'A'),
(15, 5, '1', 11, '2022-10-27 09:07:46', NULL, NULL, NULL, NULL, 'A'),
(16, 5, '1', 12, '2022-10-27 17:03:19', NULL, NULL, NULL, NULL, 'F'),
(17, 5, '1', 13, '2022-10-27 17:12:35', NULL, NULL, NULL, NULL, 'F'),
(18, 5, '1', 14, '2022-10-27 17:28:58', NULL, NULL, NULL, NULL, 'F'),
(19, 5, '1', 15, '2022-10-27 17:33:43', NULL, NULL, NULL, NULL, 'F'),
(20, 5, '1', 16, '2022-10-27 22:02:05', NULL, NULL, NULL, NULL, 'F'),
(21, 5, '1', 17, '2022-10-27 22:42:11', NULL, NULL, NULL, '', 'A'),
(22, 9, '3', 1, '2022-10-27 23:15:52', NULL, NULL, NULL, NULL, 'F'),
(23, 9, '3', 2, '2022-10-27 23:19:26', NULL, NULL, NULL, NULL, 'F'),
(24, 9, '3', 3, '2022-10-28 04:43:38', NULL, NULL, NULL, NULL, 'F'),
(25, 9, '3', 4, '2022-10-28 04:52:08', NULL, NULL, NULL, NULL, 'F'),
(26, 9, '3', 5, '2022-10-28 04:54:48', NULL, NULL, NULL, NULL, 'F'),
(27, 9, '3', 6, '2022-10-28 04:56:17', NULL, NULL, NULL, NULL, 'F'),
(28, 9, '3', 7, '2022-10-28 04:58:53', NULL, NULL, NULL, NULL, 'F'),
(29, 9, '3', 8, '2022-10-28 05:01:53', NULL, NULL, NULL, NULL, 'F'),
(30, 9, '3', 9, '2022-10-28 05:03:39', NULL, NULL, NULL, NULL, 'F'),
(31, 9, '3', 10, '2022-10-28 05:05:08', NULL, NULL, NULL, NULL, 'F'),
(32, 9, '3', 11, '2022-10-28 05:05:13', NULL, NULL, NULL, NULL, 'F'),
(33, 5, '1', 18, '2022-11-03 22:17:06', NULL, NULL, NULL, NULL, 'F'),
(34, 5, '1', 19, '2022-11-03 22:25:11', NULL, NULL, NULL, NULL, 'F'),
(35, 5, '1', 20, '2022-11-03 22:34:13', NULL, NULL, NULL, NULL, 'F'),
(36, 5, '1', 21, '2022-11-03 22:40:31', NULL, NULL, NULL, NULL, 'F'),
(37, 5, '1', 22, '2022-11-03 22:40:44', NULL, NULL, NULL, NULL, 'F'),
(38, 5, '1', 23, '2022-11-03 22:40:57', NULL, NULL, NULL, NULL, 'F'),
(39, 5, '1', 24, '2022-11-03 22:46:46', NULL, NULL, NULL, NULL, 'F'),
(40, 5, '1', 25, '2022-11-03 23:05:03', NULL, NULL, NULL, NULL, 'F'),
(41, 5, '1', 26, '2022-11-03 23:05:42', NULL, NULL, NULL, NULL, 'F'),
(42, 5, '1', 27, '2022-11-03 23:25:30', NULL, NULL, NULL, NULL, 'F'),
(43, 5, '1', 28, '2022-11-06 17:58:43', NULL, NULL, NULL, NULL, 'F'),
(44, 5, '1', 29, '2022-11-06 19:26:06', NULL, NULL, NULL, NULL, 'F'),
(45, 5, '1', 30, '2022-11-06 20:36:50', NULL, NULL, NULL, NULL, 'F'),
(46, 5, '1', 31, '2022-11-17 12:12:07', NULL, NULL, NULL, NULL, 'F'),
(47, 5, '1', 32, '2022-11-17 12:31:27', NULL, NULL, NULL, NULL, 'F'),
(48, 5, '1', 33, '2023-02-16 09:08:23', NULL, NULL, NULL, NULL, 'F'),
(49, 5, '1', 34, '2023-02-16 09:16:08', NULL, NULL, NULL, NULL, 'F'),
(50, NULL, NULL, NULL, '2023-02-16 09:41:29', NULL, NULL, NULL, NULL, 'P'),
(51, 5, '1', 35, '2023-02-16 09:51:08', NULL, NULL, NULL, '', 'A'),
(52, NULL, NULL, NULL, '2023-02-16 10:38:48', NULL, NULL, NULL, NULL, 'P'),
(53, 5, '1', 36, '2023-02-21 01:13:26', NULL, NULL, NULL, NULL, 'F'),
(54, 5, '1', 37, '2023-02-21 02:39:10', NULL, NULL, NULL, NULL, 'F'),
(55, 5, '1', 38, '2023-02-21 07:16:13', NULL, NULL, NULL, NULL, 'F'),
(56, 5, '1', 39, '2023-02-22 00:32:44', NULL, NULL, NULL, NULL, 'F'),
(57, 5, '1', 40, '2023-02-24 02:51:41', NULL, NULL, NULL, NULL, 'F'),
(58, 5, '1', 41, '2023-02-24 02:52:31', NULL, NULL, NULL, NULL, 'F'),
(59, 5, '1', 42, '2023-02-24 02:59:29', NULL, NULL, NULL, NULL, 'F'),
(60, 5, '1', 43, '2023-02-24 03:50:16', NULL, NULL, NULL, NULL, 'F'),
(61, 5, '1', 44, '2023-02-24 04:26:46', NULL, NULL, NULL, NULL, 'F'),
(62, 5, '1', 45, '2023-02-24 04:28:15', NULL, NULL, NULL, NULL, 'F'),
(63, 5, '1', 46, '2023-02-24 04:30:55', NULL, NULL, NULL, NULL, 'F'),
(64, 5, '1', 47, '2023-02-24 04:56:56', NULL, NULL, NULL, NULL, 'F'),
(65, 5, '1', 48, '2023-02-24 05:04:47', NULL, NULL, NULL, NULL, 'F'),
(66, 5, '1', 49, '2023-02-24 05:19:01', NULL, NULL, NULL, NULL, 'F'),
(67, 5, '1', 50, '2023-02-24 05:27:25', NULL, NULL, NULL, NULL, 'F'),
(68, 5, '1', 51, '2023-02-24 05:51:00', NULL, NULL, NULL, NULL, 'F'),
(69, 5, '1', 52, '2023-02-25 01:41:22', NULL, NULL, NULL, NULL, 'F'),
(70, 5, '1', 53, '2023-02-25 23:12:49', NULL, NULL, NULL, NULL, 'F'),
(71, 5, '1', 54, '2023-02-25 23:23:32', NULL, NULL, NULL, NULL, 'F'),
(72, 5, '1', 55, '2023-02-25 23:36:25', NULL, NULL, NULL, NULL, 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_accounting_journal_entry_details`
--

CREATE TABLE `fs_accounting_journal_entry_details` (
  `id_accounting_journal_entry_detail` int(11) NOT NULL,
  `id_accounting_journal_entry` varchar(255) DEFAULT NULL,
  `id_accounting_account` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `debit` decimal(20,2) DEFAULT NULL,
  `credit` decimal(20,2) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_accounting_journal_entry_details`
--

INSERT INTO `fs_accounting_journal_entry_details` (`id_accounting_journal_entry_detail`, `id_accounting_journal_entry`, `id_accounting_account`, `description`, `debit`, `credit`, `op_status`) VALUES
(1, '1', 1, 'test', '106.00', '0.00', NULL),
(2, '1', 3, 'test2', '0.00', '56.00', NULL),
(3, '1', 3, 'TEST 3', '0.00', '23.00', NULL),
(4, '4', 1, 'pago a banco', '500.00', '0.00', 'A'),
(5, '4', 3, 'TEST', '0.00', '250.00', 'A'),
(6, '4', 2, 'asdad', '0.00', '100.00', 'A'),
(7, '4', 4, 'QWEW', '0.00', '150.00', 'A'),
(8, '4', 2, 'ASDRQW', '175.60', '0.00', 'A'),
(9, '4', 1, 'FANSES', '0.00', '175.60', 'A'),
(10, '4', 3, 'Hola', '10.75', '0.00', 'A'),
(11, '4', 4, 'Hola 2', '0.00', '10.75', 'E'),
(12, '4', 4, 'TESTEO', '0.00', '10.75', 'A'),
(13, '4', 1, 'NULL', '0.00', '0.00', 'A'),
(14, '4', 2, 'FONDOS', '1.00', '0.00', 'A'),
(15, '4', 3, 'REGALOS', '0.00', '1.00', 'A'),
(16, '7', 1, 'CXC', '127.60', '0.00', 'A'),
(17, '7', 3, 'VENTAS', '0.00', '127.60', 'A'),
(18, '', 1, 'CXC', '127.60', '0.00', 'A'),
(19, '', 3, 'VENTAS', '0.00', '127.60', 'A'),
(20, '4', 1, 'CXC', '127.60', '0.00', 'A'),
(21, '4', 3, 'VENTAS', '0.00', '127.60', 'A'),
(22, '10', 1, 'CXC', '127.60', '0.00', 'A'),
(23, '10', 3, 'VENTAS', '0.00', '127.60', 'A'),
(24, '11', 1, 'CXC', '127.60', '0.00', 'A'),
(25, '11', 3, 'VENTAS', '0.00', '127.60', 'A'),
(26, '12', 1, 'CXC', '127.60', '0.00', 'A'),
(27, '12', 3, 'VENTAS', '0.00', '127.60', 'A'),
(28, '13', 1, 'CXC', '127.60', '0.00', 'A'),
(29, '13', 3, 'VENTAS', '0.00', '127.60', 'A'),
(30, '14', 1, 'CXC', '127.60', '0.00', 'A'),
(31, '14', 3, 'VENTAS', '0.00', '127.60', 'A'),
(32, '15', 1, 'CXC', '127.60', '0.00', 'A'),
(33, '15', 3, 'VENTAS', '0.00', '127.60', 'A'),
(34, '16', 1, 'CXC', '282.40', '0.00', 'A'),
(35, '16', 3, 'VENTAS', '0.00', '282.40', 'A'),
(36, '17', 1, 'CXC', '240.88', '0.00', 'A'),
(37, '17', 3, 'VENTAS', '0.00', '240.88', 'A'),
(38, '18', 1, 'CXC', '77.25', '0.00', 'A'),
(39, '18', 3, 'VENTAS', '0.00', '77.25', 'A'),
(40, '19', 1, 'CXC', '33.22', '0.00', 'A'),
(41, '19', 3, 'VENTAS', '0.00', '33.22', 'A'),
(42, '20', 1, 'CXC', '33.22', '0.00', 'A'),
(43, '20', 3, 'VENTAS', '0.00', '33.22', 'A'),
(44, '21', 1, 'CXC', '33.22', '0.00', 'A'),
(45, '21', 3, 'FACTURA DE VENTA No. 000005', '0.00', '33.22', 'A'),
(46, '21', -1, '', '0.00', '0.00', 'A'),
(47, '21', -1, '', '0.00', '0.00', 'A'),
(48, '21', -1, '', '0.00', '0.00', 'A'),
(49, '22', 2, 'CXP', '2095.20', '0.00', 'A'),
(50, '22', 3, 'ORDEN DE COMPRA No. 000003', '0.00', '2095.20', 'A'),
(51, '23', 2, 'CXP', '2095.20', '0.00', 'A'),
(52, '23', 3, 'ORDEN DE COMPRA No. 000003', '0.00', '2095.20', 'A'),
(53, '24', 2, 'CXP', '5778.90', '0.00', 'A'),
(54, '24', 3, 'ORDEN DE COMPRA No. 000001', '0.00', '5778.90', 'A'),
(55, '25', 2, 'CXP', '5778.90', '0.00', 'A'),
(56, '25', 3, 'ORDEN DE COMPRA No. 000001', '0.00', '5778.90', 'A'),
(57, '26', 2, 'CXP', '5778.90', '0.00', 'A'),
(58, '26', 3, 'ORDEN DE COMPRA No. 000001', '0.00', '5778.90', 'A'),
(59, '27', 2, 'CXP', '5778.90', '0.00', 'A'),
(60, '27', 3, 'ORDEN DE COMPRA No. 000001', '0.00', '5778.90', 'A'),
(61, '28', 2, 'CXP', '5778.90', '0.00', 'A'),
(62, '28', 3, 'ORDEN DE COMPRA No. 000001', '0.00', '5778.90', 'A'),
(63, '29', 2, 'CXP', '5778.90', '0.00', 'A'),
(64, '29', 3, 'ORDEN DE COMPRA No. 000001', '0.00', '5778.90', 'A'),
(65, '30', 2, 'CXP', '5778.90', '0.00', 'A'),
(66, '30', 3, 'ORDEN DE COMPRA No. 000001', '0.00', '5778.90', 'A'),
(67, '31', 2, 'CXP', '5778.90', '0.00', 'A'),
(68, '31', 3, 'ORDEN DE COMPRA No. 000001', '0.00', '5778.90', 'A'),
(69, '32', 2, 'CXP', '5778.90', '0.00', 'A'),
(70, '32', 3, 'ORDEN DE COMPRA No. 000001', '0.00', '5778.90', 'A'),
(71, '33', 1, 'CXC', '1762.56', '0.00', 'A'),
(72, '33', 3, 'FACTURA DE VENTA No. 000006', '0.00', '1762.56', 'A'),
(73, '34', 1, 'CXC', '80.35', '0.00', 'A'),
(74, '34', 3, 'FACTURA DE VENTA No. 000007', '0.00', '80.35', 'A'),
(75, '35', 1, 'CXC', '34.56', '0.00', 'A'),
(76, '35', 3, 'FACTURA DE VENTA No. 000008', '0.00', '34.56', 'A'),
(77, '36', 1, 'CXC', '34.56', '0.00', 'A'),
(78, '36', 3, 'FACTURA DE VENTA No. 000009', '0.00', '34.56', 'A'),
(79, '37', 1, 'CXC', '0.00', '0.00', 'A'),
(80, '37', 3, 'FACTURA DE VENTA No. 000010', '0.00', '0.00', 'A'),
(81, '38', 1, 'CXC', '0.00', '0.00', 'A'),
(82, '38', 3, 'FACTURA DE VENTA No. 000011', '0.00', '0.00', 'A'),
(83, '39', 1, 'CXC', '0.00', '0.00', 'A'),
(84, '39', 3, 'FACTURA DE VENTA No. 000012', '0.00', '0.00', 'A'),
(85, '40', 1, 'CXC', '34.56', '0.00', 'A'),
(86, '40', 3, 'FACTURA DE VENTA No. 000013', '0.00', '34.56', 'A'),
(87, '41', 1, 'CXC', '0.00', '0.00', 'A'),
(88, '41', 3, 'FACTURA DE VENTA No. 000014', '0.00', '0.00', 'A'),
(89, '42', 1, 'CXC', '34.56', '0.00', 'A'),
(90, '42', 3, 'FACTURA DE VENTA No. 000001', '0.00', '34.56', 'A'),
(91, '43', 1, 'CXC', '378.95', '0.00', 'A'),
(92, '43', 3, 'FACTURA DE VENTA No. 000002', '0.00', '378.95', 'A'),
(93, '44', 1, 'CXC', '734.40', '0.00', 'A'),
(94, '44', 3, 'FACTURA DE VENTA No. 000003', '0.00', '734.40', 'A'),
(95, '45', 1, 'CXC', '1175.04', '0.00', 'A'),
(96, '45', 3, 'FACTURA DE VENTA No. 000004', '0.00', '1175.04', 'A'),
(97, '46', 1, 'CXC', '17.32', '0.00', 'A'),
(98, '46', 3, 'FACTURA DE VENTA No. 000005', '0.00', '17.32', 'A'),
(99, '47', 1, 'CXC', '17.32', '0.00', 'A'),
(100, '47', 3, 'FACTURA DE VENTA No. 000001', '0.00', '17.32', 'A'),
(101, '48', 1, 'CXC', '2398.00', '0.00', 'A'),
(102, '48', 3, 'FACTURA DE VENTA No. 000007', '0.00', '2398.00', 'A'),
(103, '49', 1, 'CXC', '411.40', '0.00', 'A'),
(104, '49', 3, 'FACTURA DE VENTA No. 000008', '0.00', '411.40', 'A'),
(105, '50', -1, '', '0.00', '0.00', 'A'),
(106, '51', 1, 'CXC', '1210.00', '0.00', 'A'),
(107, '51', 3, 'FACTURA DE VENTA No. 000001', '0.00', '1210.00', 'A'),
(108, '53', 1, 'CXC', '45.01', '0.00', 'A'),
(109, '53', 3, 'FACTURA DE VENTA No. 000002', '0.00', '45.01', 'A'),
(110, '54', 1, 'CXC', '373.64', '0.00', 'A'),
(111, '54', 3, 'FACTURA DE VENTA No. 000003', '0.00', '373.64', 'A'),
(112, '55', 1, 'CXC', '180.04', '0.00', 'A'),
(113, '55', 3, 'FACTURA DE VENTA No. 000004', '0.00', '180.04', 'A'),
(114, '56', 1, 'CXC', '902.65', '0.00', 'A'),
(115, '56', 3, 'FACTURA DE VENTA No. 000005', '0.00', '902.65', 'A'),
(116, '57', 1, 'CXC', '836.23', '0.00', 'A'),
(117, '57', 3, 'FACTURA DE VENTA No. 000010', '0.00', '836.23', 'A'),
(118, '58', 1, 'CXC', '414.46', '0.00', 'A'),
(119, '58', 3, 'FACTURA DE VENTA No. 000011', '0.00', '414.46', 'A'),
(120, '59', 1, 'CXC', '787.47', '0.00', 'A'),
(121, '59', 3, 'FACTURA DE VENTA No. 000012', '0.00', '787.47', 'A'),
(122, '60', 1, 'CXC', '121.90', '0.00', 'A'),
(123, '60', 3, 'FACTURA DE VENTA No. 000013', '0.00', '121.90', 'A'),
(124, '61', 1, 'CXC', '48.76', '0.00', 'A'),
(125, '61', 3, 'FACTURA DE VENTA No. 000018', '0.00', '48.76', 'A'),
(126, '62', 1, 'CXC', '195.04', '0.00', 'A'),
(127, '62', 3, 'FACTURA DE VENTA No. 000019', '0.00', '195.04', 'A'),
(128, '63', 1, 'CXC', '292.56', '0.00', 'A'),
(129, '63', 3, 'FACTURA DE VENTA No. 000021', '0.00', '292.56', 'A'),
(130, '64', 1, 'CXC', '487.60', '0.00', 'A'),
(131, '64', 3, 'FACTURA DE VENTA No. 000022', '0.00', '487.60', 'A'),
(132, '65', 1, 'CXC', '56.56', '0.00', 'A'),
(133, '65', 3, 'FACTURA DE VENTA No. 000023', '0.00', '56.56', 'A'),
(134, '66', 1, 'CXC', '3157.15', '0.00', 'A'),
(135, '66', 3, 'FACTURA DE VENTA No. 000024', '0.00', '3157.15', 'A'),
(136, '67', 1, 'CXC', '294.13', '0.00', 'A'),
(137, '67', 3, 'FACTURA DE VENTA No. 000001', '0.00', '294.13', 'A'),
(138, '68', 1, 'CXC', '772.07', '0.00', 'A'),
(139, '68', 3, 'FACTURA DE VENTA No. 000002', '0.00', '772.07', 'A'),
(140, '69', 1, 'CXC', '410.29', '0.00', 'A'),
(141, '69', 3, 'FACTURA DE VENTA No. 000003', '0.00', '410.29', 'A'),
(142, '70', 1, 'CXC', '147.06', '0.00', 'A'),
(143, '70', 3, 'FACTURA DE VENTA No. 000004', '0.00', '147.06', 'A'),
(144, '71', 1, 'CXC', '294.13', '0.00', 'A'),
(145, '71', 3, 'FACTURA DE VENTA No. 000005', '0.00', '294.13', 'A'),
(146, '72', 1, 'CXC', '359.56', '0.00', 'A'),
(147, '72', 3, 'FACTURA DE VENTA No. 000006', '0.00', '359.56', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_accounting_ledger_entries`
--

CREATE TABLE `fs_accounting_ledger_entries` (
  `id_accounting_ledger_entry` int(11) DEFAULT NULL,
  `id_accounting_account` int(11) DEFAULT NULL,
  `debit` decimal(20,2) DEFAULT NULL,
  `credit` decimal(20,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_active_compounds`
--

CREATE TABLE `fs_active_compounds` (
  `id_active_compound` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `is_psychotropic` varchar(255) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_active_compounds`
--

INSERT INTO `fs_active_compounds` (`id_active_compound`, `name`, `is_psychotropic`, `op_status`) VALUES
(1, 'Test', '0', 'A'),
(2, 'TEST 2', '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_audit_trails`
--

CREATE TABLE `fs_audit_trails` (
  `id_audit_trail` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `action_type` varchar(16) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `recordid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1153, 1, '2022-09-01 10:00:45', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1154, 1, '2022-09-12 01:45:00', 'create', 'creado un nuevo carrito #18', 'fs_fs_cart_lines', NULL),
(1155, 1, '2022-09-12 01:49:51', 'create', 'creado un nuevo carrito tipo psicotropico #19', 'fs_fs_cart_lines', NULL),
(1156, 1, '2022-09-15 11:33:07', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 14),
(1157, 1, '2022-09-15 11:33:10', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 15),
(1158, 1, '2022-09-15 11:33:11', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 16),
(1159, 1, '2022-09-15 11:47:46', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 17),
(1160, 1, '2022-09-15 11:47:49', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 18),
(1161, 1, '2022-09-15 11:47:50', 'create', 'Creó un nuevo asiento', 'fs_fs_accounting_vouchers', 19),
(1162, 1, '2022-09-15 16:48:12', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1163, 1, '2022-09-15 16:48:15', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1164, 1, '2022-09-15 16:48:16', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1165, 1, '2022-09-15 16:48:40', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1166, 1, '2022-09-15 16:48:43', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1167, 1, '2022-09-15 16:48:43', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1168, 1, '2022-09-15 16:49:21', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1169, 1, '2022-09-15 16:49:24', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1170, 1, '2022-09-15 16:49:25', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1171, 1, '2022-09-15 16:51:53', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1172, 1, '2022-09-15 16:51:56', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1173, 1, '2022-09-15 16:51:57', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1174, 1, '2022-09-15 16:52:01', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1175, 1, '2022-09-15 16:52:04', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1176, 1, '2022-09-15 16:52:05', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1177, 1, '2022-09-16 12:42:46', 'create', 'creado un nuevo carrito tipo psicotropico #6', 'fs_fs_cart_lines', 6),
(1178, NULL, '2022-09-17 15:47:07', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1179, NULL, '2022-09-17 15:47:11', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1180, NULL, '2022-09-17 15:47:13', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1181, NULL, '2022-09-17 15:49:47', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1182, NULL, '2022-09-17 15:49:52', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1183, NULL, '2022-09-17 15:49:53', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1184, NULL, '2022-09-17 15:50:40', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1185, NULL, '2022-09-17 15:50:44', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1186, NULL, '2022-09-17 15:50:45', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1187, NULL, '2022-09-17 15:51:17', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1188, NULL, '2022-09-17 15:51:21', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1189, NULL, '2022-09-17 15:51:23', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1190, NULL, '2022-09-17 15:53:11', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1191, NULL, '2022-09-17 15:53:15', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1192, NULL, '2022-09-17 15:53:16', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1193, NULL, '2022-09-17 15:54:11', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1194, NULL, '2022-09-17 15:54:15', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1195, NULL, '2022-09-17 15:54:16', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1196, NULL, '2022-09-17 15:54:53', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1197, NULL, '2022-09-17 15:54:58', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1198, NULL, '2022-09-17 15:54:59', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1199, NULL, '2022-09-17 15:57:35', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1200, NULL, '2022-09-17 15:57:40', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1201, NULL, '2022-09-17 15:57:41', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1202, NULL, '2022-09-17 18:15:12', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1203, NULL, '2022-09-17 18:15:17', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1204, NULL, '2022-09-17 18:15:18', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1205, NULL, '2022-09-18 08:36:30', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1206, NULL, '2022-09-18 08:36:41', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1207, NULL, '2022-09-18 08:36:43', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1208, NULL, '2022-09-18 10:36:29', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1209, NULL, '2022-09-18 10:36:35', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1210, NULL, '2022-09-18 10:36:37', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1211, NULL, '2022-09-18 18:45:38', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1212, NULL, '2022-09-18 18:45:47', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1213, NULL, '2022-09-18 18:45:52', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1214, 1, '2022-10-08 18:00:49', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1215, 1, '2022-10-08 18:00:52', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1216, 1, '2022-10-08 18:00:57', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1217, 1, '2022-10-08 18:00:59', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1218, NULL, '2022-10-12 01:46:32', 'create', 'Creó un nuevo almacen', 'fs_fs_warehouses', NULL),
(1219, 1, '2022-10-14 04:55:39', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1220, 1, '2022-10-14 04:55:46', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1221, 1, '2022-10-14 04:55:48', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1222, 1, '2022-10-16 00:42:40', 'insert', 'Producto Creado', 'fs_products', NULL),
(1223, 1, '2022-10-16 00:45:08', 'insert', 'Producto Creado', 'fs_products', NULL),
(1224, 1, '2022-10-16 00:45:16', 'insert', 'Producto Creado', 'fs_products', NULL),
(1225, 1, '2022-10-16 00:46:45', 'insert', 'Producto Creado', 'fs_products', NULL),
(1226, 1, '2022-10-16 00:47:37', 'insert', 'Producto Creado', 'fs_products', NULL),
(1227, 1, '2022-10-16 00:52:06', 'insert', 'Producto Creado', 'fs_products', NULL),
(1228, 1, '2022-10-16 00:57:52', 'insert', 'Producto Creado', 'fs_products', NULL),
(1229, 1, '2022-10-16 00:57:56', 'insert', 'Producto Creado', 'fs_products', NULL),
(1230, 1, '2022-10-17 23:49:24', 'insert', 'Producto Creado', 'fs_products', NULL),
(1231, 1, '2022-10-22 02:43:23', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1232, 1, '2022-10-22 02:43:30', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1233, 1, '2022-10-22 02:48:06', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1234, 1, '2022-10-22 02:48:13', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1235, 1, '2022-10-22 02:49:05', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1236, 1, '2022-10-22 02:49:12', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1237, 1, '2022-10-22 02:50:00', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1238, 1, '2022-10-22 02:50:07', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1239, 1, '2022-10-22 02:51:33', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1240, 1, '2022-10-22 02:52:06', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1241, 1, '2022-10-22 02:52:45', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 2),
(1242, 1, '2022-10-22 23:12:23', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1243, 1, '2022-10-22 23:26:47', 'update', 'Editó un asiento', 'fs_fs_accounting_vouchers', 1),
(1244, 1, '2022-10-23 01:17:16', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1245, 1, '2022-10-23 01:18:33', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1246, 1, '2022-10-23 01:19:39', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1247, 1, '2022-10-26 18:00:44', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1248, 1, '2022-10-26 18:07:45', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1249, 1, '2022-10-26 18:16:59', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1250, 1, '2022-10-26 18:17:58', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1251, 1, '2022-10-26 19:39:09', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1252, 1, '2022-10-27 08:53:47', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1253, 1, '2022-10-27 09:07:46', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1254, 1, '2022-10-27 16:01:51', 'create', 'creado un nuevo carrito #7', 'fs_fs_cart_lines', 7),
(1255, 1, '2022-10-27 16:43:00', 'create', 'creado un nuevo carrito #8', 'fs_fs_cart_lines', 8),
(1256, 1, '2022-10-27 16:47:24', 'create', 'creado un nuevo carrito #9', 'fs_fs_cart_lines', 9),
(1257, 1, '2022-10-27 16:50:12', 'create', 'creado un nuevo carrito #10', 'fs_fs_cart_lines', 10),
(1258, 1, '2022-10-27 16:59:18', 'create', 'creado un nuevo carrito #11', 'fs_fs_cart_lines', 11),
(1259, 1, '2022-10-27 17:02:57', 'create', 'creado un nuevo carrito #12', 'fs_fs_cart_lines', 12),
(1260, 1, '2022-10-27 17:03:19', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1261, 1, '2022-10-27 17:07:59', 'create', 'creado un nuevo carrito #1', 'fs_fs_cart_lines', 1),
(1262, 1, '2022-10-27 17:11:33', 'create', 'creado un nuevo carrito #1', 'fs_fs_cart_lines', 1),
(1263, 1, '2022-10-27 17:12:35', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1264, 1, '2022-10-27 17:27:24', 'create', 'creado un nuevo carrito tipo psicotropico #2', 'fs_fs_cart_lines', 2),
(1265, 1, '2022-10-27 17:28:59', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1266, 1, '2022-10-27 17:33:00', 'create', 'creado un nuevo carrito tipo psicotropico #3', 'fs_fs_cart_lines', 3),
(1267, 1, '2022-10-27 17:33:44', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1268, 1, '2022-10-27 17:41:37', 'create', 'creado un nuevo carrito tipo psicotropico #4', 'fs_fs_cart_lines', 4),
(1269, 1, '2022-10-27 22:02:06', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1270, 1, '2022-10-27 22:41:27', 'create', 'creado un nuevo carrito tipo psicotropico #5', 'fs_fs_cart_lines', 5),
(1271, 1, '2022-10-27 22:42:11', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1272, 1, '2022-10-27 23:15:53', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1273, 1, '2022-10-27 23:19:27', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1274, 1, '2022-10-28 04:43:39', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1275, 1, '2022-10-28 04:52:08', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1276, 1, '2022-10-28 04:54:48', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1277, 1, '2022-10-28 04:56:18', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1278, 1, '2022-10-28 04:58:53', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1279, 1, '2022-10-28 05:01:53', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1280, 1, '2022-10-28 05:03:40', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1281, 1, '2022-10-28 05:05:08', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1282, 1, '2022-10-28 05:05:14', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1283, 1, '2022-11-03 22:14:45', 'create', 'creado un nuevo carrito #6', 'fs_fs_cart_lines', 6),
(1284, 1, '2022-11-03 22:17:07', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1285, 1, '2022-11-03 22:24:36', 'create', 'creado un nuevo carrito tipo psicotropico #7', 'fs_fs_cart_lines', 7),
(1286, 1, '2022-11-03 22:25:12', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1287, 1, '2022-11-03 22:33:50', 'create', 'creado un nuevo carrito tipo psicotropico #8', 'fs_fs_cart_lines', 8),
(1288, 1, '2022-11-03 22:34:14', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1289, 1, '2022-11-03 22:40:03', 'create', 'creado un nuevo carrito tipo psicotropico #9', 'fs_fs_cart_lines', 9),
(1290, 1, '2022-11-03 22:40:31', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1291, 1, '2022-11-03 22:40:44', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1292, 1, '2022-11-03 22:40:58', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1293, 1, '2022-11-03 22:46:46', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1294, 1, '2022-11-03 23:04:41', 'create', 'creado un nuevo carrito tipo psicotropico #10', 'fs_fs_cart_lines', 10),
(1295, 1, '2022-11-03 23:05:03', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1296, 1, '2022-11-03 23:05:42', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1297, 1, '2022-11-03 23:25:07', 'create', 'creado un nuevo carrito tipo psicotropico #11', 'fs_fs_cart_lines', 11),
(1298, 1, '2022-11-03 23:25:30', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1299, 1, '2022-11-06 17:56:57', 'create', 'creado un nuevo carrito #12', 'fs_fs_cart_lines', 12),
(1300, 1, '2022-11-06 17:58:44', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1301, 1, '2022-11-06 19:24:38', 'create', 'creado un nuevo carrito #13', 'fs_fs_cart_lines', 13),
(1302, 1, '2022-11-06 19:26:07', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1303, 1, '2022-11-06 19:26:57', 'create', 'creado un nuevo carrito #14', 'fs_fs_cart_lines', 14),
(1304, 1, '2022-11-06 20:36:50', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1305, 1, '2022-11-06 20:48:07', 'create', 'creado un nuevo carrito #15', 'fs_fs_cart_lines', 15),
(1306, 1, '2022-11-17 12:11:38', 'create', 'creado un nuevo carrito tipo psicotrópicos #16', 'fs_fs_cart_lines', 16),
(1307, 1, '2022-11-17 12:12:08', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1308, 1, '2022-11-17 12:30:55', 'create', 'creado un nuevo carrito tipo psicotrópicos #1', 'fs_fs_cart_lines', 1),
(1309, 1, '2022-11-17 12:31:27', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1310, 1, '2022-11-28 21:29:59', 'create', 'creado un nuevo carrito #1', 'fs_fs_cart_lines', 1),
(1311, 1, '2023-02-16 09:08:23', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1312, 1, '2023-02-16 09:16:00', 'create', 'creado un nuevo carrito #2', 'fs_fs_cart_lines', 2),
(1313, 1, '2023-02-16 09:16:08', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1314, 1, '2023-02-16 09:16:39', 'create', 'creado un nuevo carrito tipo psicotrópicos #3', 'fs_fs_cart_lines', 3),
(1315, 1, '2023-02-16 09:41:29', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1316, 1, '2023-02-16 09:50:47', 'create', 'creado un nuevo carrito #1', 'fs_fs_cart_lines', 1),
(1317, 1, '2023-02-16 09:51:08', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1318, 1, '2023-02-16 10:38:48', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1319, 1, '2023-02-16 10:40:08', 'create', 'creado un nuevo carrito tipo psicotrópicos #2', 'fs_fs_cart_lines', 2),
(1320, 1, '2023-02-21 01:13:26', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1321, 1, '2023-02-21 01:16:50', 'create', 'creado un nuevo carrito tipo psicotrópicos #3', 'fs_fs_cart_lines', 3),
(1322, 1, '2023-02-21 02:39:10', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1323, 1, '2023-02-21 06:17:41', 'create', 'creado un nuevo carrito tipo psicotrópicos #4', 'fs_fs_cart_lines', 4),
(1324, 1, '2023-02-21 07:16:13', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1325, 1, '2023-02-21 07:19:06', 'create', 'creado un nuevo carrito tipo psicotrópicos #5', 'fs_fs_cart_lines', 5),
(1326, 1, '2023-02-22 00:32:44', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1327, 1, '2023-02-22 00:33:04', 'create', 'creado un nuevo carrito #6', 'fs_fs_cart_lines', 6),
(1328, 1, '2023-02-24 02:51:41', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1329, 1, '2023-02-24 02:52:24', 'create', 'creado un nuevo carrito #7', 'fs_fs_cart_lines', 7),
(1330, 1, '2023-02-24 02:52:31', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1331, 1, '2023-02-24 02:58:36', 'create', 'creado un nuevo carrito #8', 'fs_fs_cart_lines', 8),
(1332, 1, '2023-02-24 02:59:29', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1333, 1, '2023-02-24 03:31:42', 'create', 'creado un nuevo carrito #9', 'fs_fs_cart_lines', 9),
(1334, 1, '2023-02-24 03:50:16', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1335, 1, '2023-02-24 04:23:52', 'create', 'creado un nuevo carrito #10', 'fs_fs_cart_lines', 10),
(1336, 1, '2023-02-24 04:26:46', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1337, 1, '2023-02-24 04:28:09', 'create', 'creado un nuevo carrito #11', 'fs_fs_cart_lines', 11),
(1338, 1, '2023-02-24 04:28:15', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1339, 1, '2023-02-24 04:29:43', 'create', 'creado un nuevo carrito #12', 'fs_fs_cart_lines', 12),
(1340, 1, '2023-02-24 04:30:55', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1341, 1, '2023-02-24 04:56:38', 'create', 'creado un nuevo carrito #13', 'fs_fs_cart_lines', 13),
(1342, 1, '2023-02-24 04:56:56', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1343, 1, '2023-02-24 05:01:33', 'create', 'creado un nuevo carrito #14', 'fs_fs_cart_lines', 14),
(1344, 1, '2023-02-24 05:04:47', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1345, 1, '2023-02-24 05:08:50', 'create', 'creado un nuevo carrito #15', 'fs_fs_cart_lines', 15),
(1346, 1, '2023-02-24 05:19:01', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1347, 1, '2023-02-24 05:26:03', 'create', 'creado un nuevo carrito #1', 'fs_fs_cart_lines', 1),
(1348, 1, '2023-02-24 05:27:25', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1349, 1, '2023-02-24 05:33:15', 'create', 'creado un nuevo carrito #2', 'fs_fs_cart_lines', 2),
(1350, 1, '2023-02-24 05:51:00', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1351, 1, '2023-02-24 05:57:18', 'create', 'creado un nuevo carrito tipo psicotrópicos #3', 'fs_fs_cart_lines', 3),
(1352, 1, '2023-02-25 01:41:22', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1353, 1, '2023-02-25 22:07:51', 'create', 'creado un nuevo carrito #4', 'fs_fs_cart_lines', 4),
(1354, 1, '2023-02-25 23:12:49', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1355, 1, '2023-02-25 23:23:03', 'create', 'creado un nuevo carrito #5', 'fs_fs_cart_lines', 5),
(1356, 1, '2023-02-25 23:23:32', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL),
(1357, 1, '2023-02-25 23:33:23', 'create', 'creado un nuevo carrito tipo psicotrópicos #6', 'fs_fs_cart_lines', 6),
(1358, 1, '2023-02-25 23:36:25', 'insert', 'Nuevo Asiento Contable Creado', 'fs_fs_accounting_journal_entries', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_banks`
--

CREATE TABLE `fs_banks` (
  `id_bank` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `num_account` varchar(64) DEFAULT NULL,
  `op_currency` varchar(1) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_banks`
--

INSERT INTO `fs_banks` (`id_bank`, `name`, `num_account`, `op_currency`, `op_status`) VALUES
(1, 'BANCO DE VENEZUELA', '0102-0479-81-0000083085', 'B', 'A'),
(2, 'BINANCE', '15664', 'D', 'A'),
(3, 'BOD', '0116', 'B', 'E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_brands`
--

CREATE TABLE `fs_brands` (
  `id_brand` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `img` longtext DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `items_total` int(11) DEFAULT NULL,
  `cart_type` varchar(1) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `total_usd` decimal(20,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL,
  `exchange_rate` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_cart`
--

INSERT INTO `fs_cart` (`id_cart`, `items_total`, `cart_type`, `total`, `total_usd`, `created_at`, `created_by`, `op_status`, `exchange_rate`) VALUES
(1, 1, 'N', '294.13', '12.06', '2023-02-24 05:26:03', 1, 'C', '24.38'),
(2, 1, 'N', '772.07', '31.67', '2023-02-24 05:33:15', 1, 'C', '24.38'),
(3, 1, 'P', '410.29', '16.84', '2023-02-24 05:57:18', 1, 'C', '24.38'),
(4, 1, 'N', '147.06', '6.03', '2023-02-25 22:07:51', 1, 'C', '24.38'),
(5, 1, 'N', '294.13', '12.06', '2023-02-25 23:23:03', 1, 'C', '24.38'),
(6, 2, 'P', '359.56', '14.75', '2023-02-25 23:33:23', 1, 'C', '24.38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_cart_lines`
--

CREATE TABLE `fs_cart_lines` (
  `id_cart_line` int(11) NOT NULL,
  `id_cart` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `product_type` varchar(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `total_usd` decimal(20,2) DEFAULT NULL,
  `discount_percentage` decimal(10,2) DEFAULT NULL,
  `tax_rate` decimal(10,2) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_cart_lines`
--

INSERT INTO `fs_cart_lines` (`id_cart_line`, `id_cart`, `id_product`, `product_type`, `quantity`, `total`, `total_usd`, `discount_percentage`, `tax_rate`, `op_status`) VALUES
(1, 1, 4, 'N', 4, '253.56', '10.40', '0.00', '16.00', 'A'),
(2, 2, 7, 'N', 3, '665.58', '27.30', '0.00', '16.00', 'A'),
(3, 3, 3, 'P', 6, '353.70', '14.52', '0.00', '16.00', 'A'),
(4, 4, 4, 'N', 2, '126.78', '5.20', '0.00', '16.00', 'A'),
(5, 5, 4, 'N', 4, '253.56', '10.40', '0.00', '16.00', 'A'),
(6, 6, 6, 'P', 2, '253.56', '10.40', '0.00', '16.00', 'A'),
(7, 6, 3, 'P', 1, '58.95', '2.42', '5.00', '16.00', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_categories`
--

CREATE TABLE `fs_categories` (
  `id_category` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `img` longtext DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `num_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_categories`
--

INSERT INTO `fs_categories` (`id_category`, `name`, `img`, `is_active`, `is_deleted`, `num_order`) VALUES
(1, 'AMPOLLAS', 'empty-1.jpg', 1, NULL, NULL),
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
  `dni` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `op_city` int(11) DEFAULT NULL,
  `op_state` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `op_country` int(11) DEFAULT NULL,
  `email_contact` varchar(255) DEFAULT NULL,
  `email_sale` varchar(255) DEFAULT NULL,
  `email_claim` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `op_industry` int(11) DEFAULT NULL,
  `op_status` int(11) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_companies`
--

INSERT INTO `fs_companies` (`id_company`, `dni`, `name`, `owner`, `description`, `address`, `op_city`, `op_state`, `zip_code`, `op_country`, `email_contact`, `email_sale`, `email_claim`, `phone`, `facebook`, `instagram`, `twitter`, `op_industry`, `op_status`, `website`) VALUES
(1, 'J-123456', 'DROVAZ', 'HERNAN VAZQUES', 'DROGERIA VAZQUES', 'AV 8 (SANTA RITA) CON CALLE 63 N° 63-10', 489, 24, 4002, 525, 'info@drovaz.com', NULL, NULL, '261', NULL, NULL, NULL, NULL, 0, 'www.drovaz.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_comparator`
--

CREATE TABLE `fs_comparator` (
  `id_comparator_entry` int(11) NOT NULL,
  `product_name` longtext DEFAULT NULL,
  `provider` longtext DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `price_usd` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_comparator`
--

INSERT INTO `fs_comparator` (`id_comparator_entry`, `product_name`, `provider`, `price`, `price_usd`) VALUES
(1, 'ACICLOR AP TAB 1G X 10', 'DRONENA', '274.89', '17.00'),
(2, 'ACIDO FOLICO TAB 5MG X 30 GENVEN', 'DRONENA', '97.02', '6.00'),
(3, 'ALIVET JBE 125 MG/0.5MG/5ML X 120ML', 'DRONENA', '30.08', '1.86'),
(4, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 12', 'DRONENA', '32.34', '2.00'),
(5, 'ANTUX JBE 6MG/ML S/CEREZA X 180ML', 'DRONENA', '16.17', '1.00'),
(6, 'ARTRODAR TAB 50MG X 30', 'DRONENA', '64.68', '4.00'),
(7, 'ASAPROL COM 81 MG X 100', 'DRONENA', '113.19', '7.00'),
(8, 'ATORVASTATINA TAB 20MG X 30 GENVEN', 'DRONENA', '101.87', '6.30'),
(9, 'ATORVASTATINA TAB 40MG X 30 GENVEN', 'DRONENA', '16.17', '1.00'),
(10, 'ACICLOR AP TAB 1G X 11', 'DRONENA', '30.09', '6.00'),
(11, 'ACIDO FOLICO TAB 5MG X 31 GENVEN', 'DRONENA', '32.35', '4.00'),
(12, 'ALIVET JBE 125 MG/0.5MG/5ML X 121ML', 'DRONENA', '16.18', '5.00'),
(13, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 13', 'DRONENA', '64.69', '48.00'),
(14, 'ANTUX JBE 6MG/ML S/CEREZA X 181ML', 'DRONENA', '113.20', '8.00'),
(15, 'ARTRODAR TAB 50MG X 31', 'DRONENA', '101.88', '12.00'),
(16, 'ASAPROL COM 81 MG X 101', 'DRONENA', '16.18', '8.40'),
(17, 'ATORVASTATINA TAB 20MG X 31 GENVEN', 'DRONENA', '30.10', '1.86'),
(18, 'ACICLOR AP TAB 1G X 10', 'COBECA', '274.89', '17.00'),
(19, 'ACIDO FOLICO TAB 5MG X 30 GENVEN', 'COBECA', '97.02', '6.00'),
(20, 'ALIVET JBE 125 MG/0.5MG/5ML X 120ML', 'COBECA', '30.08', '1.86'),
(21, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 12', 'COBECA', '32.34', '2.00'),
(22, 'ANTUX JBE 6MG/ML S/CEREZA X 180ML', 'COBECA', '16.17', '1.00'),
(23, 'ARTRODAR TAB 50MG X 30', 'COBECA', '64.68', '4.00'),
(24, 'ASAPROL COM 81 MG X 100', 'COBECA', '113.19', '7.00'),
(25, 'ATORVASTATINA TAB 20MG X 30 GENVEN', 'COBECA', '101.87', '6.30'),
(26, 'ATORVASTATINA TAB 40MG X 30 GENVEN', 'COBECA', '16.17', '1.00'),
(27, 'ACICLOR AP TAB 1G X 11', 'COBECA', '30.09', '6.00'),
(28, 'ACIDO FOLICO TAB 5MG X 31 GENVEN', 'COBECA', '32.35', '4.00'),
(29, 'ALIVET JBE 125 MG/0.5MG/5ML X 121ML', 'COBECA', '16.18', '5.00'),
(30, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 13', 'COBECA', '64.69', '48.00'),
(31, 'ANTUX JBE 6MG/ML S/CEREZA X 181ML', 'COBECA', '113.20', '8.00'),
(32, 'ARTRODAR TAB 50MG X 31', 'COBECA', '101.88', '12.00'),
(33, 'ASAPROL COM 81 MG X 101', 'COBECA', '16.18', '8.40'),
(34, 'ATORVASTATINA TAB 20MG X 31 GENVEN', 'COBECA', '30.10', '1.86'),
(35, 'ACICLOR AP TAB 1G X 10', 'COBECA', '274.89', '17.00'),
(36, 'ACIDO FOLICO TAB 5MG X 30 GENVEN', 'COBECA', '97.02', '6.00'),
(37, 'ALIVET JBE 125 MG/0.5MG/5ML X 120ML', 'COBECA', '30.08', '1.86'),
(38, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 12', 'COBECA', '32.34', '2.00'),
(39, 'ANTUX JBE 6MG/ML S/CEREZA X 180ML', 'FARMA GO', '16.17', '1.00'),
(40, 'ARTRODAR TAB 50MG X 30', 'FARMA GO', '64.68', '4.00'),
(41, 'ASAPROL COM 81 MG X 100', 'FARMA GO', '113.19', '7.00'),
(42, 'ATORVASTATINA TAB 20MG X 30 GENVEN', 'FARMA GO', '101.87', '6.30'),
(43, 'ATORVASTATINA TAB 40MG X 30 GENVEN', 'FARMA GO', '16.17', '1.00'),
(44, 'ACICLOR AP TAB 1G X 11', 'FARMA GO', '30.09', '6.00'),
(45, 'ACIDO FOLICO TAB 5MG X 31 GENVEN', 'FARMA GO', '32.35', '4.00'),
(46, 'ALIVET JBE 125 MG/0.5MG/5ML X 121ML', 'FARMA GO', '16.18', '5.00'),
(47, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 13', 'FARMA GO', '64.69', '48.00'),
(48, 'ANTUX JBE 6MG/ML S/CEREZA X 181ML', 'FARMA GO', '113.20', '8.00'),
(49, 'ARTRODAR TAB 50MG X 31', 'FARMA GO', '101.88', '12.00'),
(50, 'ASAPROL COM 81 MG X 101', 'FARMA GO', '16.18', '8.40'),
(51, 'ATORVASTATINA TAB 20MG X 31 GENVEN', 'FARMA GO', '30.10', '1.86'),
(52, 'ACICLOR AP TAB 1G X 10', 'DRONENA', '274.89', '17.00'),
(53, 'ACIDO FOLICO TAB 5MG X 30 GENVEN', 'DRONENA', '97.02', '6.00'),
(54, 'ALIVET JBE 125 MG/0.5MG/5ML X 120ML', 'DRONENA', '30.08', '1.86'),
(55, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 12', 'DRONENA', '32.34', '2.00'),
(56, 'ANTUX JBE 6MG/ML S/CEREZA X 180ML', 'DRONENA', '16.17', '1.00'),
(57, 'ARTRODAR TAB 50MG X 30', 'DRONENA', '64.68', '4.00'),
(58, 'ASAPROL COM 81 MG X 100', 'DRONENA', '113.19', '7.00'),
(59, 'ATORVASTATINA TAB 20MG X 30 GENVEN', 'DRONENA', '101.87', '6.30'),
(60, 'ATORVASTATINA TAB 40MG X 30 GENVEN', 'DRONENA', '16.17', '1.00'),
(61, 'ACICLOR AP TAB 1G X 11', 'DRONENA', '30.09', '6.00'),
(62, 'ACIDO FOLICO TAB 5MG X 31 GENVEN', 'DRONENA', '32.35', '4.00'),
(63, 'ALIVET JBE 125 MG/0.5MG/5ML X 121ML', 'DRONENA', '16.18', '5.00'),
(64, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 13', 'DRONENA', '64.69', '48.00'),
(65, 'ANTUX JBE 6MG/ML S/CEREZA X 181ML', 'DRONENA', '113.20', '8.00'),
(66, 'ARTRODAR TAB 50MG X 31', 'DRONENA', '101.88', '12.00'),
(67, 'ASAPROL COM 81 MG X 101', 'DRONENA', '16.18', '8.40'),
(68, 'ATORVASTATINA TAB 20MG X 31 GENVEN', 'DRONENA', '30.10', '1.86'),
(69, 'ACICLOR AP TAB 1G X 10', 'COBECA', '274.89', '17.00'),
(70, 'ACIDO FOLICO TAB 5MG X 30 GENVEN', 'COBECA', '97.02', '6.00'),
(71, 'ALIVET JBE 125 MG/0.5MG/5ML X 120ML', 'COBECA', '30.08', '1.86'),
(72, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 12', 'COBECA', '32.34', '2.00'),
(73, 'ANTUX JBE 6MG/ML S/CEREZA X 180ML', 'COBECA', '16.17', '1.00'),
(74, 'ARTRODAR TAB 50MG X 30', 'COBECA', '64.68', '4.00'),
(75, 'ASAPROL COM 81 MG X 100', 'COBECA', '113.19', '7.00'),
(76, 'ATORVASTATINA TAB 20MG X 30 GENVEN', 'COBECA', '101.87', '6.30'),
(77, 'ATORVASTATINA TAB 40MG X 30 GENVEN', 'COBECA', '16.17', '1.00'),
(78, 'ACICLOR AP TAB 1G X 11', 'COBECA', '30.09', '6.00'),
(79, 'ACIDO FOLICO TAB 5MG X 31 GENVEN', 'COBECA', '32.35', '4.00'),
(80, 'ALIVET JBE 125 MG/0.5MG/5ML X 121ML', 'COBECA', '16.18', '5.00'),
(81, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 13', 'COBECA', '64.69', '48.00'),
(82, 'ANTUX JBE 6MG/ML S/CEREZA X 181ML', 'COBECA', '113.20', '8.00'),
(83, 'ARTRODAR TAB 50MG X 31', 'COBECA', '101.88', '12.00'),
(84, 'ASAPROL COM 81 MG X 101', 'COBECA', '16.18', '8.40'),
(85, 'ATORVASTATINA TAB 20MG X 31 GENVEN', 'COBECA', '30.10', '1.86'),
(86, 'ACICLOR AP TAB 1G X 10', 'COBECA', '274.89', '17.00'),
(87, 'ACIDO FOLICO TAB 5MG X 30 GENVEN', 'COBECA', '97.02', '6.00'),
(88, 'ALIVET JBE 125 MG/0.5MG/5ML X 120ML', 'COBECA', '30.08', '1.86'),
(89, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 12', 'COBECA', '32.34', '2.00'),
(90, 'ANTUX JBE 6MG/ML S/CEREZA X 180ML', 'FARMA GO', '16.17', '1.00'),
(91, 'ARTRODAR TAB 50MG X 30', 'FARMA GO', '64.68', '4.00'),
(92, 'ASAPROL COM 81 MG X 100', 'FARMA GO', '113.19', '7.00'),
(93, 'ATORVASTATINA TAB 20MG X 30 GENVEN', 'FARMA GO', '101.87', '6.30'),
(94, 'ATORVASTATINA TAB 40MG X 30 GENVEN', 'FARMA GO', '16.17', '1.00'),
(95, 'ACICLOR AP TAB 1G X 11', 'FARMA GO', '30.09', '6.00'),
(96, 'ACIDO FOLICO TAB 5MG X 31 GENVEN', 'FARMA GO', '32.35', '4.00'),
(97, 'ALIVET JBE 125 MG/0.5MG/5ML X 121ML', 'FARMA GO', '16.18', '5.00'),
(98, 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 13', 'FARMA GO', '64.69', '48.00'),
(99, 'ANTUX JBE 6MG/ML S/CEREZA X 181ML', 'FARMA GO', '113.20', '8.00'),
(100, 'ARTRODAR TAB 50MG X 31', 'FARMA GO', '101.88', '12.00'),
(101, 'ASAPROL COM 81 MG X 101', 'FARMA GO', '16.18', '8.40'),
(102, 'ATORVASTATINA TAB 20MG X 31 GENVEN', 'FARMA GO', '30.10', '1.86');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_complaints`
--

CREATE TABLE `fs_complaints` (
  `id_complaint` int(11) NOT NULL,
  `id_customer` varchar(11) DEFAULT NULL,
  `op_priority` varchar(1) DEFAULT NULL,
  `op_department` varchar(32) DEFAULT NULL,
  `subject` varchar(64) DEFAULT NULL,
  `contact_number` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `op_status` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_complaint_messages`
--

CREATE TABLE `fs_complaint_messages` (
  `id_complaint_message` int(11) NOT NULL,
  `id_complaint` int(11) DEFAULT NULL,
  `id_entity` int(11) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `send_at` datetime DEFAULT NULL,
  `img` longtext DEFAULT NULL,
  `is_operator` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_configurations`
--

CREATE TABLE `fs_configurations` (
  `id_configuration` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_configurations`
--

INSERT INTO `fs_configurations` (`id_configuration`, `name`, `value`) VALUES
(1, 'FS_THEME_NAME', 'classic'),
(2, 'FS_DEFAULT_THEME_NAME', 'classic'),
(3, 'DEFAULT_ACCOUNTING_PAYABLE', '2'),
(4, 'DEFAULT_ACCOUNTING_RECEIVABLE', '1'),
(5, 'emailMain', 'soporte@drovazca.com'),
(6, 'emailSecond', ''),
(7, 'emailDebt', 'drovazca@gmail.com'),
(8, 'emailSupport', 'soporte@drovazca.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_connections`
--

CREATE TABLE `fs_connections` (
  `id_connection` int(11) NOT NULL,
  `connection_userid` int(11) DEFAULT NULL,
  `connection_type` int(11) DEFAULT NULL,
  `connection_date` date DEFAULT NULL,
  `connection_time` time DEFAULT NULL,
  `connection_last_time` time DEFAULT NULL,
  `connection_token` varchar(64) DEFAULT NULL,
  `connection_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_contact_requests`
--

CREATE TABLE `fs_contact_requests` (
  `id_contact_request` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_cxc`
--

CREATE TABLE `fs_cxc` (
  `id_cxc` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_entity` int(11) DEFAULT NULL,
  `balance` decimal(20,2) DEFAULT NULL,
  `balance_usd` decimal(20,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_cxc`
--

INSERT INTO `fs_cxc` (`id_cxc`, `id_order`, `id_entity`, `balance`, `balance_usd`, `created_at`, `op_status`) VALUES
(1, 1, 1, '294.13', '12.06', '2023-02-24 05:27:25', 'A'),
(2, 2, 1, '772.07', '31.67', '2023-02-24 05:51:00', 'A'),
(3, 3, 1, '410.29', '16.84', '2023-02-25 01:41:22', 'A'),
(4, 4, 1, '121.90', '-115.87', '2023-02-25 23:12:49', 'F'),
(5, 5, 1, '294.13', '12.06', '2023-02-25 23:23:33', 'A'),
(6, 6, 1, '359.56', '14.75', '2023-02-25 23:36:25', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_cxp`
--

CREATE TABLE `fs_cxp` (
  `id_cxp` int(11) NOT NULL,
  `id_entity` int(11) DEFAULT NULL,
  `id_shopping_order` int(11) DEFAULT NULL,
  `balance` decimal(20,2) DEFAULT NULL,
  `balance_usd` decimal(20,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_discounts`
--

INSERT INTO `fs_discounts` (`id_discount`, `name`, `coupon_code`, `amount`, `amount_usd`, `percentage`, `quantity`, `start_date`, `end_date`, `min_order_value`, `max_order_value`, `op_status`) VALUES
(1, 'Sin Descuento', '', '0.00', '0.00', '0.00', 0, '0000-00-00', '0000-00-00', '', '', 'A'),
(2, '5%', '', '0.00', '0.00', '5.00', 0, '0000-00-00', '0000-00-00', '', '', 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_documents`
--

CREATE TABLE `fs_documents` (
  `id_document` int(11) NOT NULL,
  `id_entity` int(11) DEFAULT NULL,
  `op_document_type` int(11) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `img_support` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_documents`
--

INSERT INTO `fs_documents` (`id_document`, `id_entity`, `op_document_type`, `expire_date`, `img_support`) VALUES
(1, 1, 1, '2024-04-30', 'stream2file248590543.jpg'),
(2, 1, 2, '2023-02-25', 'stream2file248590543.jpg'),
(3, 1, 3, '2023-09-26', '13706-minimalista.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_entities`
--

CREATE TABLE `fs_entities` (
  `id_entity` int(11) NOT NULL,
  `id_role` int(11) DEFAULT NULL,
  `dni` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `company_name` varchar(64) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `trade_discount` int(11) DEFAULT NULL,
  `credit_limit` decimal(20,2) DEFAULT NULL,
  `credit_time` int(11) DEFAULT NULL,
  `contact_person` varchar(32) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `op_city` int(11) DEFAULT NULL,
  `op_state` int(11) DEFAULT NULL,
  `op_country` int(11) DEFAULT NULL,
  `last_connection` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_entities`
--

INSERT INTO `fs_entities` (`id_entity`, `id_role`, `dni`, `code`, `company_name`, `firstname`, `lastname`, `username`, `email`, `password`, `address`, `trade_discount`, `credit_limit`, `credit_time`, `contact_person`, `phone`, `op_city`, `op_state`, `op_country`, `last_connection`, `date_creation`, `is_active`, `is_deleted`, `op_status`) VALUES
(1, -1, 'V25778113', 'DEV25778113', 'CARLOS SANDREA', 'Carlos', 'Sandrea', 'csandrea', 'cjoseare1995@gmail.com', 'd598aac945ef5d16a15b067cf096ab3005e792aaf110c090f46f4741716cbc3b', NULL, NULL, NULL, NULL, 'CARLOS SANDREA', '04125899816', 489, 24, 525, NULL, '2022-10-20 04:57:17', 1, 0, 'S'),
(2, 1, NULL, NULL, NULL, 'Hernan', 'Vazquez', 'hvazquez', 'hv@gmail.com', 'e6504b288b36632d2ddb377cc4ccee59c2c6cd6c5be2d2c016ea3f108bcc7641', 'Dirección', NULL, NULL, NULL, NULL, '0424', 489, 24, 525, NULL, '2022-10-20 04:57:17', 1, 0, 'A'),
(3, 3, 'J1232113', '123121', 'TEST SUPPLIER', NULL, NULL, '', 'CORREO', 'd598aac945ef5d16a15b067cf096ab3005e792aaf110c090f46f4741716cbc3b', 'Pastor, 1 Urbanización Industrial Salinetas, Telde Las Palmas de Gran Canaria.', 0, '0.00', 0, '', 'TELEFONO', 489, 24, 525, NULL, '2022-10-20 04:57:17', NULL, NULL, 'A'),
(4, 2, 'J123', 'C123', 'FARMA GO', NULL, NULL, 'J123', 'cjoseare1995@gmail.com', 'df6634ef517d58e4d6b79cc71927a9a995e88f7afa880e5e1177efa9af64d2c1', 'Mi Casa', 15, '100.00', 60, 'Carlos Sandrea', '04124709557', 489, 24, 525, NULL, '2022-10-20 04:57:17', 1, 0, 'A'),
(5, 2, '123', '7K2L31R', 'Carlos Sandrea', NULL, NULL, 'carlos', 'cjoseare1995@gmail.com', 'd598aac945ef5d16a15b067cf096ab3005e792aaf110c090f46f4741716cbc3b', 'Mi Casa', 5, '0.00', 12, 'Carlos Sandrea', '04124709557', 489, 24, 525, NULL, '2022-10-20 04:57:17', NULL, NULL, 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_exchange_rates`
--

CREATE TABLE `fs_exchange_rates` (
  `id_exchange_rate` int(11) NOT NULL,
  `op_currency` int(11) DEFAULT NULL,
  `rate_amount` decimal(20,2) DEFAULT NULL,
  `inserted_at` datetime DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_exchange_rates`
--

INSERT INTO `fs_exchange_rates` (`id_exchange_rate`, `op_currency`, `rate_amount`, `inserted_at`, `op_status`) VALUES
(1, 1, '7.80', '2022-09-10 09:06:34', 'A'),
(2, 1, '7.99', '2022-09-10 09:06:54', 'A'),
(3, 1, '8.10', '2022-09-10 09:14:42', 'A'),
(4, 1, '8.01', '2022-09-10 10:19:59', 'A'),
(5, 1, '8.00', '2022-09-10 10:41:32', 'A'),
(6, 1, '8.00', '2022-09-10 10:42:02', 'A'),
(7, 1, '8.00', '2022-09-10 10:42:35', 'A'),
(8, 1, '8.02', '2022-09-15 11:47:41', 'A'),
(9, 1, '8.04', '2022-09-21 17:56:44', 'A'),
(10, 1, '8.09', '2022-09-22 08:42:26', 'A'),
(11, 1, '8.19', '2022-10-05 11:07:38', 'A'),
(12, 1, '8.20', '2022-10-06 11:47:52', 'A'),
(13, 1, '8.21', '2022-10-07 11:44:29', 'A'),
(14, 1, '8.26', '2022-10-14 18:59:30', 'A'),
(15, 1, '8.30', '2022-10-17 12:56:43', 'A'),
(16, 1, '8.28', '2022-10-18 08:57:04', 'A'),
(17, 1, '8.37', '2022-10-19 15:19:31', 'A'),
(18, 1, '8.39', '2022-10-21 09:50:37', 'A'),
(19, 1, '8.64', '2022-11-03 18:33:59', 'A'),
(20, 1, '8.66', '2022-11-06 23:46:30', 'A'),
(21, 1, '9.29', '2022-11-14 18:36:59', 'A'),
(22, 1, '9.31', '2022-11-15 23:01:40', 'A'),
(23, 1, '10.72', '2022-11-28 15:30:15', 'A'),
(24, 1, '16.17', '2022-12-22 14:24:52', 'A'),
(25, 1, '23.61', '2023-02-08 13:03:59', 'A'),
(26, 1, '24.20', '2023-02-13 14:29:21', 'A'),
(27, 1, '24.38', '2023-02-22 02:10:22', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_invoices`
--

CREATE TABLE `fs_invoices` (
  `id_invoice` int(11) NOT NULL,
  `id_entity` int(11) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `op_invoice_type` varchar(1) DEFAULT NULL,
  `corelative` int(11) NOT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `amount_usd` decimal(20,2) DEFAULT NULL,
  `op_currency` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_invoices`
--

INSERT INTO `fs_invoices` (`id_invoice`, `id_entity`, `id_order`, `op_invoice_type`, `corelative`, `amount`, `amount_usd`, `op_currency`, `created_at`, `id_created_by`) VALUES
(1, 1, 6, 'F', 1, '359.56', '14.75', 1, '2023-02-26 01:22:33', 1),
(2, 1, 4, 'F', 2, '147.06', '6.03', 1, '2023-02-26 01:25:00', 1);

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
  `permission_name` varchar(255) DEFAULT NULL,
  `is_parent` int(11) DEFAULT NULL,
  `is_child` int(11) DEFAULT NULL,
  `is_header` int(11) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `num_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_menu_items`
--

INSERT INTO `fs_menu_items` (`id_menu_item`, `type`, `name`, `link`, `icon`, `permission_name`, `is_parent`, `is_child`, `is_header`, `id_parent`, `is_active`, `is_deleted`, `num_order`) VALUES
(1, 'F', 'Inicio', 'dashboard', 'fas fa-home', NULL, 0, 0, 0, 0, 1, NULL, 0),
(2, 'F', 'Catálogo', 'catalog/featured', 'fas fa-book', NULL, 0, 0, 0, 0, 1, NULL, 1),
(3, 'A', 'Inicio', 'AdminDashboard', 'fas fa-chart-line', NULL, 0, 0, 0, 0, 1, NULL, 1),
(4, 'A', 'Catálogo', 'AdminCatalog', 'fas fa-shop', 'p_catalog', 1, 0, 0, 0, 1, NULL, 4),
(5, 'A', 'Productos', 'AdminCatalog&action=products', NULL, 'p_product', 0, 1, 0, 4, 1, NULL, NULL),
(6, 'A', 'Ventas', '', 'fas fa-shopping-cart', 'p_sales', 1, 0, 0, 0, 1, NULL, 5),
(7, 'A', 'Clientes', '', 'fas fa-users', 'p_client', 1, 0, 0, 0, 1, NULL, 9),
(8, 'A', 'Soporte', 'AdminSupport', 'fas fa-headset', 'p_support', 0, 0, 0, 0, 1, NULL, 888),
(9, 'A', 'Categorias', 'AdminCatalog&action=categories', NULL, 'p_categories', 0, 1, 0, 4, 1, NULL, NULL),
(10, 'A', 'Descuentos', 'AdminCatalog&action=discounts', NULL, 'p_discounts', 0, 1, 0, 4, 1, NULL, NULL),
(11, 'A', 'Marcas', 'AdminCatalog&action=brands', NULL, 'p_brands', 0, 1, 0, 4, 1, NULL, NULL),
(12, 'A', 'Impuestos', 'AdminCatalog&action=taxes', NULL, 'p_taxes', 0, 1, 0, 4, 1, NULL, NULL),
(13, 'A', 'Paramatros', 'AdminManager', 'fas fa-user-gear', 'p_parameters', 1, 0, 0, 0, 1, NULL, 777),
(14, 'A', 'Caja Chica', 'AdminCash&action=flow', NULL, NULL, 0, 1, 0, 29, 1, NULL, 666),
(15, 'A', 'Dev Parametros', 'AdminAdvanced', 'fas fa-code', 'p_dev', 1, 0, 0, 0, 1, NULL, 999),
(16, 'A', 'Gestion de Caja', 'AdminCash&action=manegement', NULL, NULL, 0, 1, 0, 29, 1, NULL, 4),
(17, 'A', 'Asientos Contable', 'AdminAccounting&action=entries', NULL, 'p_entries', 0, 1, 0, 27, 1, NULL, 3),
(18, 'A', 'Pedidos', 'AdminOrders&action=orders', NULL, 'p_orders', 0, 1, 0, 6, 1, NULL, 1),
(19, 'A', 'Facturas', 'AdminOrders&action=invoices', NULL, 'p_invoices', 0, 1, 0, 6, 1, NULL, 3),
(20, 'A', 'Clientes', 'AdminCustomers&action=customers', NULL, 'p_clients', 0, 1, 0, 7, 1, NULL, NULL),
(21, 'A', 'Direcciones', 'AdminCustomers&action=addresses', NULL, 'p_address', 0, 1, 0, 7, 0, 0, NULL),
(22, 'A', 'Compuesto Activos', 'AdminCatalog&action=actives', NULL, 'p_actives', 0, 1, 0, 4, 1, NULL, NULL),
(23, 'A', 'Tipos de Tipos de Asientos', 'AdminAccounting&action=types', NULL, 'p_accounting_types', 0, 1, 0, 27, 1, NULL, 2),
(24, 'A', 'Cuentas Contables', 'AdminAccounting&action=accounts', NULL, 'p_accounting_accounts', 0, 1, 0, 27, 1, NULL, 1),
(25, 'A', 'Entidades Bancarias', 'AdminBank&action=banks', NULL, 'p_bank_entities', 0, 1, 0, 26, 1, NULL, 1),
(26, 'A', 'Bancos', '', 'fas fa-building-columns', 'p_banks', 1, 0, 0, 0, 1, NULL, 14),
(27, 'A', 'Contabilidad', '', 'fas fa-table-list', 'p_accounting', 1, 0, 0, 0, 1, NULL, 15),
(28, 'A', 'Cuentas Bancarias', 'AdminBank&action=accounts', NULL, 'p_bank_accounts', 0, 1, 0, 26, 0, NULL, 2),
(29, 'A', 'Usuarios', 'AdminParameters&action=users', '', 'p_users', 0, 1, 0, 13, 1, NULL, 13),
(30, 'A', 'Almacenes', '', 'fas fa-warehouse', 'p_warehouses', 1, 0, 0, 0, 1, NULL, 3),
(31, 'A', 'Compras', '', 'fas fa-basket-shopping', 'p_shopping', 1, 0, 0, 0, 1, NULL, 7),
(32, 'A', 'Reclamos', 'AdminCustomers&action=requests', 'fas fa-exclamation-circle', 'p_complaints', 0, 1, 0, 7, 1, NULL, 666),
(33, 'A', 'Empresa', 'AdminParameters&action=companies', 'fas fa-building', 'p_company', 0, 1, 0, 13, 1, NULL, 0),
(34, 'A', 'Menus', 'AdminDev&action=menus', 'fas fa-sitemap', 'p_menu', 0, 1, 0, 15, 1, NULL, NULL),
(35, 'A', 'Gestion de Almacenes', 'AdminWarehouse', NULL, 'p_warehouse', 0, 1, 0, 30, 1, NULL, NULL),
(36, 'A', 'Ordenes', 'AdminShopping&action=orders', NULL, 'p_order', 0, 1, 0, 31, 1, NULL, NULL),
(37, 'A', 'Pagos', 'AdminOrders&action=payments', NULL, 'p_payments', 0, 1, 0, 6, 1, 0, 2),
(38, 'A', 'Proveedores', 'AdminShopping&action=suppliers', NULL, 'p_suppliers', 0, 1, 0, 31, 1, NULL, NULL),
(39, 'A', 'Opciones', 'AdminDev&action=options', NULL, 'p_options', 0, 1, 0, 15, 1, 0, NULL),
(40, 'A', 'Importar', 'AdminBulk&action=import', '', 'p_import', 0, 1, 0, 13, 1, 0, 9),
(41, 'A', 'Exportar', 'AdminBulk&action=export', NULL, 'p_export', 0, 1, 0, 13, 0, 1, 10),
(42, 'A', 'Existencias', 'AdminWarehouse&action=stock', '', 'p_stock', 0, 1, 0, 30, 1, 0, NULL),
(43, 'F', 'Pedidos', 'orders', 'fas fa-shopping-cart', NULL, 0, 0, 0, 0, 1, 0, 2),
(44, 'F', 'Reclamos', 'complaints', 'fas fa-phone-alt', NULL, 0, 0, 0, 0, 1, 0, 6),
(45, 'F', 'Reportar Pagos', 'payments', 'fas fa-money-bill-wave', NULL, 0, 0, 0, 0, 1, 0, 3),
(46, 'F', 'Facturas', 'invoices', 'fas fa-receipt', NULL, 0, 0, 0, 0, 1, 0, 5),
(47, 'F', 'Cuentas x Pagar', 'payable', 'fas fa-handshake', NULL, 0, 0, 0, 0, 1, 0, 4),
(48, 'A', 'Historial BCV', 'AdminParameters&action=bcv', NULL, 'p_bcv_history', 0, 1, 0, 13, 1, 0, 9999),
(49, 'A', 'Definiciones', 'AdminParameters&action=define', NULL, 'p_defines', 0, 1, 0, 13, 1, 0, 2),
(50, 'F', 'Documentación', 'documents', 'fas fa-id-card', NULL, 0, 0, 0, 0, 1, 0, 9999),
(51, 'A', 'Cuentas x Cobrar', 'AdminAccounting&action=cxc', NULL, 'p_cxc', 0, 1, 0, 27, 1, 0, 4),
(52, 'A', 'Cuentas x Pagar', 'AdminAccounting&action=cxp', NULL, 'p_cxp', 0, 1, 0, 27, 1, 0, 5),
(53, 'F', 'Información', 'info', 'fas fa-info-circle', NULL, 0, 0, 0, 0, 1, 0, 9999),
(54, 'A', 'Roles', 'AdminParameters&action=roles', NULL, 'p_roles', 0, 1, 0, 13, 1, 0, 999),
(55, 'A', 'Permisos', 'AdminDev&action=permissions', NULL, 'p_permissions', 0, 1, 0, 15, 1, 0, 9999),
(56, 'A', 'Notificaciones', 'AdminParameters&action=notify', NULL, 'p_notify', 0, 1, 0, 13, 1, 0, 2),
(57, 'A', 'Formas de Pago', 'AdminBank&action=payment_methods', NULL, 'p_payment_methods', 0, 1, 0, 26, 1, NULL, NULL),
(58, 'A', 'Comparador', 'AdminShopping&action=comparator', NULL, 'p_comparator', 0, 1, 0, 31, 1, 0, 999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_options`
--

CREATE TABLE `fs_options` (
  `id_option` int(11) NOT NULL,
  `id_option_group` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `id_customer` int(11) DEFAULT NULL,
  `order_type` varchar(1) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `amount_usd` decimal(20,2) DEFAULT NULL,
  `exchange_rate` decimal(20,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_orders`
--

INSERT INTO `fs_orders` (`id_order`, `id_customer`, `order_type`, `amount`, `amount_usd`, `exchange_rate`, `created_at`, `updated_at`, `op_status`) VALUES
(1, 1, 'N', '294.13', '12.06', '24.38', '2023-02-24 05:27:25', NULL, 'A'),
(2, 1, 'N', '772.07', '31.67', '24.38', '2023-02-24 05:51:00', NULL, 'A'),
(3, 1, 'P', '410.29', '16.84', '24.38', '2023-02-25 01:41:22', NULL, 'A'),
(4, 1, 'N', '147.06', '6.03', '24.38', '2023-02-25 23:12:49', '2023-02-26 01:11:20', 'C'),
(5, 1, 'N', '294.13', '12.06', '24.38', '2023-02-25 23:23:32', NULL, 'A'),
(6, 1, 'P', '359.56', '14.75', '24.38', '2023-02-25 23:36:25', NULL, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_order_lines`
--

CREATE TABLE `fs_order_lines` (
  `id_order_line` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `price_usd` decimal(10,2) DEFAULT NULL,
  `tax_rate` decimal(10,2) DEFAULT NULL,
  `discount_percentage` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `total_usd` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_order_lines`
--

INSERT INTO `fs_order_lines` (`id_order_line`, `id_order`, `id_product`, `quantity`, `price`, `price_usd`, `tax_rate`, `discount_percentage`, `total`, `total_usd`, `created_at`) VALUES
(1, 1, 4, 4, '48.76', '2.00', '16.00', '0.00', '294.13', '12.06', '2023-02-24 05:27:25'),
(2, 2, 7, 3, '170.66', '7.00', '16.00', '0.00', '772.07', '31.67', '2023-02-24 05:51:00'),
(3, 3, 3, 6, '45.35', '1.86', '16.00', '0.00', '410.29', '16.84', '2023-02-25 01:41:22'),
(4, 4, 4, 2, '48.76', '2.00', '16.00', '0.00', '147.06', '6.03', '2023-02-25 23:12:49'),
(5, 5, 4, 4, '63.39', '2.60', '16.00', '0.00', '294.13', '12.06', '2023-02-25 23:23:32'),
(6, 6, 6, 2, '126.78', '5.20', '16.00', '0.00', '294.13', '12.06', '2023-02-25 23:36:25'),
(7, 6, 3, 1, '58.95', '2.42', '16.00', '5.00', '65.43', '2.69', '2023-02-25 23:36:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_payments`
--

CREATE TABLE `fs_payments` (
  `id_payment` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_order` varchar(255) DEFAULT NULL,
  `id_payment_method` varchar(255) DEFAULT NULL,
  `id_bank` int(11) DEFAULT NULL,
  `op_currency` varchar(1) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `amount_usd` decimal(10,2) DEFAULT NULL,
  `exchange_rate` decimal(10,2) DEFAULT NULL,
  `img_psycho` longtext DEFAULT NULL,
  `img_support` longtext DEFAULT NULL,
  `observations` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_payments`
--

INSERT INTO `fs_payments` (`id_payment`, `id_customer`, `id_order`, `id_payment_method`, `id_bank`, `op_currency`, `reference`, `amount`, `amount_usd`, `exchange_rate`, `img_psycho`, `img_support`, `observations`, `created_at`, `updated_at`, `op_status`) VALUES
(1, 1, '4', '3', 2, '2', '1152467', '121.90', '5.00', '24.38', '', 'forest-night-full-moon-pixel-art-scenery-digital-art-2k-wallpaper-uhdpaper.com-436@0@h.jpg', 'test', '2023-02-26 00:04:06', '2023-02-26 00:26:12', 'A'),
(2, 1, '4', '3', 1, '1', '123154', '25.16', '1.03', '24.38', '', 'cyberpunk-samurai-girl-oni-mask-cgi-digital-art-2k-wallpaper-uhdpaper.com-226@0@f.jpg', 'test 2', '2023-02-26 00:50:30', '2023-02-26 00:51:17', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_payment_methods`
--

CREATE TABLE `fs_payment_methods` (
  `id_payment_menthod` int(11) NOT NULL,
  `is_tangible` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `op_currency` varchar(1) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_payment_methods`
--

INSERT INTO `fs_payment_methods` (`id_payment_menthod`, `is_tangible`, `name`, `op_currency`, `op_status`) VALUES
(1, 0, 'TRANSFERENCIA BANCARIA', 'B', 'A'),
(2, 0, 'PAGO MOVIL', 'B', 'A'),
(3, 0, 'TRANSFERENCIA BANCARIA (EXTERIOR)', 'D', 'A'),
(4, 1, 'EFECTIVO', 'B', 'A'),
(5, 1, 'EFECTIVO DOLARES', 'D', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_periods`
--

CREATE TABLE `fs_periods` (
  `id_period` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_init` datetime DEFAULT NULL,
  `date_ent` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_permissions`
--

CREATE TABLE `fs_permissions` (
  `id_permission` int(11) NOT NULL,
  `id_item` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `is_child` int(11) DEFAULT NULL,
  `is_parent` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order_grid` int(11) DEFAULT NULL,
  `op_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_permissions`
--

INSERT INTO `fs_permissions` (`id_permission`, `id_item`, `name`, `code`, `is_child`, `is_parent`, `parent_id`, `order_grid`, `op_status`) VALUES
(93, '4', 'Catálogo', 'p_catalog', 0, 1, 0, 4, NULL),
(94, '5', 'Productos', 'p_product', 1, 0, 4, 0, NULL),
(95, '6', 'Ventas', 'p_sales', 0, 1, 0, 5, NULL),
(96, '7', 'Clientes', 'p_client', 0, 1, 0, 9, NULL),
(97, '8', 'Soporte', 'p_support', 0, 0, 0, 888, NULL),
(98, '9', 'Categorias', 'p_categories', 1, 0, 4, 0, NULL),
(99, '10', 'Descuentos', 'p_discounts', 1, 0, 4, 0, NULL),
(100, '11', 'Marcas', 'p_brands', 1, 0, 4, 0, NULL),
(101, '12', 'Impuestos', 'p_taxes', 1, 0, 4, 0, NULL),
(102, '13', 'Paramatros', 'p_parameters', 0, 1, 0, 777, NULL),
(103, '15', 'Dev Parametros', 'p_dev', 0, 1, 0, 999, NULL),
(104, '17', 'Asientos Contable', 'p_entries', 1, 0, 27, 3, NULL),
(105, '18', 'Pedidos', 'p_orders', 1, 0, 6, 1, NULL),
(106, '19', 'Facturas', 'p_invoices', 1, 0, 6, 3, NULL),
(107, '20', 'Clientes', 'p_clients', 1, 0, 7, 0, NULL),
(108, '21', 'Direcciones', 'p_address', 1, 0, 7, 0, NULL),
(109, '22', 'Compuesto Activos', 'p_actives', 1, 0, 4, 0, NULL),
(110, '23', 'Tipos de Tipos de Asientos', 'p_accounting_types', 1, 0, 27, 2, NULL),
(111, '24', 'Cuentas Contables', 'p_accounting_accounts', 1, 0, 27, 1, NULL),
(112, '25', 'Entidades Bancarias', 'p_bank_entities', 1, 0, 26, 1, NULL),
(113, '26', 'Bancos', 'p_banks', 0, 1, 0, 14, NULL),
(114, '27', 'Contabilidad', 'p_accounting', 0, 1, 0, 15, NULL),
(115, '28', 'Cuentas Bancarias', 'p_bank_accounts', 1, 0, 26, 2, NULL),
(116, '29', 'Usuarios', 'p_users', 1, 0, 13, 13, NULL),
(117, '30', 'Almacenes', 'p_warehouses', 0, 1, 0, 3, NULL),
(118, '31', 'Compras', 'p_shopping', 0, 1, 0, 7, NULL),
(119, '32', 'Reclamos', 'p_complaints', 1, 0, 7, 666, NULL),
(120, '33', 'Empresa', 'p_company', 1, 0, 13, 0, NULL),
(121, '34', 'Menus', 'p_menu', 1, 0, 15, 0, NULL),
(122, '35', 'Gestion de Almacenes', 'p_warehouse', 1, 0, 30, 0, NULL),
(123, '36', 'Ordenes', 'p_order', 1, 0, 31, 0, NULL),
(124, '37', 'Pagos', 'p_payments', 1, 0, 6, 2, NULL),
(125, '38', 'Proveedores', 'p_suppliers', 1, 0, 31, 0, NULL),
(126, '39', 'Opciones', 'p_options', 1, 0, 15, 0, NULL),
(127, '40', 'Importar', 'p_import', 1, 0, 13, 9, NULL),
(128, '41', 'Exportar', 'p_export', 1, 0, 13, 10, NULL),
(129, '42', 'Existencias', 'p_stock', 1, 0, 30, 0, NULL),
(130, '48', 'Historial BCV', 'p_bcv_history', 1, 0, 13, 9999, NULL),
(131, '49', 'Definiciones', 'p_defines', 1, 0, 13, 2, NULL),
(132, '51', 'Cuentas x Cobrar', 'p_cxc', 1, 0, 27, 4, NULL),
(133, '52', 'Cuentas x Pagar', 'p_cxp', 1, 0, 27, 5, NULL),
(134, '54', 'Roles', 'p_roles', 1, 0, 13, 999, NULL),
(135, '55', 'Permisos', 'p_permissions', 1, 0, 15, 9999, NULL),
(136, '56', 'Notificaciones', 'p_notify', 1, 0, 13, 2, NULL),
(137, '57', 'Formas de Pago', 'p_payment_methods', 1, 0, 26, 0, NULL),
(138, '58', 'Comparador', 'p_comparator', 1, 0, 31, 999, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_permission_roles`
--

CREATE TABLE `fs_permission_roles` (
  `id_permission_role` int(11) NOT NULL,
  `id_permission` int(11) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `add` varchar(255) DEFAULT NULL,
  `edit` varchar(255) DEFAULT NULL,
  `delete` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_permission_roles`
--

INSERT INTO `fs_permission_roles` (`id_permission_role`, `id_permission`, `id_role`, `view`, `add`, `edit`, `delete`) VALUES
(369, 93, -1, '1', '1', '1', '1'),
(370, 94, -1, '1', '1', '1', '1'),
(371, 95, -1, '1', '1', '1', '1'),
(372, 96, -1, '1', '1', '1', '1'),
(373, 97, -1, '1', '1', '1', '1'),
(374, 98, -1, '1', '1', '1', '1'),
(375, 99, -1, '1', '1', '1', '1'),
(376, 100, -1, '1', '1', '1', '1'),
(377, 101, -1, '1', '1', '1', '1'),
(378, 102, -1, '1', '1', '1', '1'),
(379, 103, -1, '1', '1', '1', '1'),
(380, 104, -1, '1', '1', '1', '1'),
(381, 105, -1, '1', '1', '1', '1'),
(382, 106, -1, '1', '1', '1', '1'),
(383, 107, -1, '1', '1', '1', '1'),
(384, 108, -1, '1', '1', '1', '1'),
(385, 109, -1, '1', '1', '1', '1'),
(386, 110, -1, '1', '1', '1', '1'),
(387, 111, -1, '1', '1', '1', '1'),
(388, 112, -1, '1', '1', '1', '1'),
(389, 113, -1, '1', '1', '1', '1'),
(390, 114, -1, '1', '1', '1', '1'),
(391, 115, -1, '1', '1', '1', '1'),
(392, 116, -1, '1', '1', '1', '1'),
(393, 117, -1, '1', '1', '1', '1'),
(394, 118, -1, '1', '1', '1', '1'),
(395, 119, -1, '1', '1', '1', '1'),
(396, 120, -1, '1', '1', '1', '1'),
(397, 121, -1, '1', '1', '1', '1'),
(398, 122, -1, '1', '1', '1', '1'),
(399, 123, -1, '1', '1', '1', '1'),
(400, 124, -1, '1', '1', '1', '1'),
(401, 125, -1, '1', '1', '1', '1'),
(402, 126, -1, '1', '1', '1', '1'),
(403, 127, -1, '1', '1', '1', '1'),
(404, 128, -1, '1', '1', '1', '1'),
(405, 129, -1, '1', '1', '1', '1'),
(406, 130, -1, '1', '1', '1', '1'),
(407, 131, -1, '1', '1', '1', '1'),
(408, 132, -1, '1', '1', '1', '1'),
(409, 133, -1, '1', '1', '1', '1'),
(410, 134, -1, '1', '1', '1', '1'),
(411, 135, -1, '1', '1', '1', '1'),
(412, 136, -1, '1', '1', '1', '1'),
(413, 137, -1, '1', '1', '1', '1'),
(414, 138, -1, '1', '1', '1', '1'),
(415, 93, 1, '1', '1', '1', '1'),
(416, 94, 1, '1', '1', '1', '1'),
(417, 95, 1, '1', '1', '1', '1'),
(418, 96, 1, '1', '1', '1', '1'),
(419, 97, 1, '1', '1', '1', '1'),
(420, 98, 1, '1', '1', '1', '1'),
(421, 99, 1, '1', '1', '1', '1'),
(422, 100, 1, '1', '1', '1', '1'),
(423, 101, 1, '1', '1', '1', '1'),
(424, 102, 1, '1', '1', '1', '1'),
(425, 103, 1, '0', '0', '0', '0'),
(426, 104, 1, '1', '1', '1', '1'),
(427, 105, 1, '1', '1', '1', '1'),
(428, 106, 1, '1', '1', '1', '1'),
(429, 107, 1, '1', '1', '1', '1'),
(430, 108, 1, '1', '1', '1', '1'),
(431, 109, 1, '1', '1', '1', '1'),
(432, 110, 1, '1', '1', '1', '1'),
(433, 111, 1, '1', '1', '1', '1'),
(434, 112, 1, '1', '1', '1', '1'),
(435, 113, 1, '1', '1', '1', '1'),
(436, 114, 1, '1', '1', '1', '1'),
(437, 115, 1, '1', '1', '1', '1'),
(438, 116, 1, '1', '1', '1', '1'),
(439, 117, 1, '1', '1', '1', '1'),
(440, 118, 1, '1', '1', '1', '1'),
(441, 119, 1, '1', '1', '1', '1'),
(442, 120, 1, '1', '1', '1', '1'),
(443, 121, 1, '0', '0', '0', '0'),
(444, 122, 1, '1', '1', '1', '1'),
(445, 123, 1, '1', '1', '1', '1'),
(446, 124, 1, '1', '1', '1', '1'),
(447, 125, 1, '1', '1', '1', '1'),
(448, 126, 1, '0', '0', '0', '0'),
(449, 127, 1, '1', '1', '1', '1'),
(450, 128, 1, '1', '1', '1', '1'),
(451, 129, 1, '1', '1', '1', '1'),
(452, 130, 1, '1', '1', '1', '1'),
(453, 131, 1, '1', '1', '1', '1'),
(454, 132, 1, '1', '1', '1', '1'),
(455, 133, 1, '1', '1', '1', '1'),
(456, 134, 1, '1', '1', '1', '1'),
(457, 135, 1, '0', '0', '0', '0'),
(458, 136, 1, '1', '1', '1', '1'),
(459, 137, 1, '1', '1', '1', '1'),
(460, 138, 1, '1', '1', '1', '1'),
(461, 93, 2, '0', '0', '0', '0'),
(462, 94, 2, '0', '0', '0', '0'),
(463, 95, 2, '0', '0', '0', '0'),
(464, 96, 2, '0', '0', '0', '0'),
(465, 97, 2, '0', '0', '0', '0'),
(466, 98, 2, '0', '0', '0', '0'),
(467, 99, 2, '0', '0', '0', '0'),
(468, 100, 2, '0', '0', '0', '0'),
(469, 101, 2, '0', '0', '0', '0'),
(470, 102, 2, '0', '0', '0', '0'),
(471, 103, 2, '0', '0', '0', '0'),
(472, 104, 2, '0', '0', '0', '0'),
(473, 105, 2, '0', '0', '0', '0'),
(474, 106, 2, '0', '0', '0', '0'),
(475, 107, 2, '0', '0', '0', '0'),
(476, 108, 2, '0', '0', '0', '0'),
(477, 109, 2, '0', '0', '0', '0'),
(478, 110, 2, '0', '0', '0', '0'),
(479, 111, 2, '0', '0', '0', '0'),
(480, 112, 2, '0', '0', '0', '0'),
(481, 113, 2, '0', '0', '0', '0'),
(482, 114, 2, '0', '0', '0', '0'),
(483, 115, 2, '0', '0', '0', '0'),
(484, 116, 2, '0', '0', '0', '0'),
(485, 117, 2, '0', '0', '0', '0'),
(486, 118, 2, '0', '0', '0', '0'),
(487, 119, 2, '0', '0', '0', '0'),
(488, 120, 2, '0', '0', '0', '0'),
(489, 121, 2, '0', '0', '0', '0'),
(490, 122, 2, '0', '0', '0', '0'),
(491, 123, 2, '0', '0', '0', '0'),
(492, 124, 2, '0', '0', '0', '0'),
(493, 125, 2, '0', '0', '0', '0'),
(494, 126, 2, '0', '0', '0', '0'),
(495, 127, 2, '0', '0', '0', '0'),
(496, 128, 2, '0', '0', '0', '0'),
(497, 129, 2, '0', '0', '0', '0'),
(498, 130, 2, '0', '0', '0', '0'),
(499, 131, 2, '0', '0', '0', '0'),
(500, 132, 2, '0', '0', '0', '0'),
(501, 133, 2, '0', '0', '0', '0'),
(502, 134, 2, '0', '0', '0', '0'),
(503, 135, 2, '0', '0', '0', '0'),
(504, 136, 2, '0', '0', '0', '0'),
(505, 137, 2, '0', '0', '0', '0'),
(506, 138, 2, '0', '0', '0', '0'),
(507, 93, 3, '0', '0', '0', '0'),
(508, 94, 3, '0', '0', '0', '0'),
(509, 95, 3, '0', '0', '0', '0'),
(510, 96, 3, '0', '0', '0', '0'),
(511, 97, 3, '0', '0', '0', '0'),
(512, 98, 3, '0', '0', '0', '0'),
(513, 99, 3, '0', '0', '0', '0'),
(514, 100, 3, '0', '0', '0', '0'),
(515, 101, 3, '0', '0', '0', '0'),
(516, 102, 3, '0', '0', '0', '0'),
(517, 103, 3, '0', '0', '0', '0'),
(518, 104, 3, '0', '0', '0', '0'),
(519, 105, 3, '0', '0', '0', '0'),
(520, 106, 3, '0', '0', '0', '0'),
(521, 107, 3, '0', '0', '0', '0'),
(522, 108, 3, '0', '0', '0', '0'),
(523, 109, 3, '0', '0', '0', '0'),
(524, 110, 3, '0', '0', '0', '0'),
(525, 111, 3, '0', '0', '0', '0'),
(526, 112, 3, '0', '0', '0', '0'),
(527, 113, 3, '0', '0', '0', '0'),
(528, 114, 3, '0', '0', '0', '0'),
(529, 115, 3, '0', '0', '0', '0'),
(530, 116, 3, '0', '0', '0', '0'),
(531, 117, 3, '0', '0', '0', '0'),
(532, 118, 3, '0', '0', '0', '0'),
(533, 119, 3, '0', '0', '0', '0'),
(534, 120, 3, '0', '0', '0', '0'),
(535, 121, 3, '0', '0', '0', '0'),
(536, 122, 3, '0', '0', '0', '0'),
(537, 123, 3, '0', '0', '0', '0'),
(538, 124, 3, '0', '0', '0', '0'),
(539, 125, 3, '0', '0', '0', '0'),
(540, 126, 3, '0', '0', '0', '0'),
(541, 127, 3, '0', '0', '0', '0'),
(542, 128, 3, '0', '0', '0', '0'),
(543, 129, 3, '0', '0', '0', '0'),
(544, 130, 3, '0', '0', '0', '0'),
(545, 131, 3, '0', '0', '0', '0'),
(546, 132, 3, '0', '0', '0', '0'),
(547, 133, 3, '0', '0', '0', '0'),
(548, 134, 3, '0', '0', '0', '0'),
(549, 135, 3, '0', '0', '0', '0'),
(550, 136, 3, '0', '0', '0', '0'),
(551, 137, 3, '0', '0', '0', '0'),
(552, 138, 3, '0', '0', '0', '0'),
(553, 93, 4, '1', '0', '0', '0'),
(554, 94, 4, '1', '0', '0', '0'),
(555, 95, 4, '0', '0', '0', '0'),
(556, 96, 4, '0', '0', '0', '0'),
(557, 97, 4, '0', '0', '0', '0'),
(558, 98, 4, '0', '0', '0', '0'),
(559, 99, 4, '0', '0', '0', '0'),
(560, 100, 4, '0', '0', '0', '0'),
(561, 101, 4, '0', '0', '0', '0'),
(562, 102, 4, '0', '0', '0', '0'),
(563, 103, 4, '0', '0', '0', '0'),
(564, 104, 4, '0', '0', '0', '0'),
(565, 105, 4, '0', '0', '0', '0'),
(566, 106, 4, '0', '0', '0', '0'),
(567, 107, 4, '0', '0', '0', '0'),
(568, 108, 4, '0', '0', '0', '0'),
(569, 109, 4, '0', '0', '0', '0'),
(570, 110, 4, '0', '0', '0', '0'),
(571, 111, 4, '0', '0', '0', '0'),
(572, 112, 4, '0', '0', '0', '0'),
(573, 113, 4, '0', '0', '0', '0'),
(574, 114, 4, '0', '0', '0', '0'),
(575, 115, 4, '0', '0', '0', '0'),
(576, 116, 4, '0', '0', '0', '0'),
(577, 117, 4, '1', '0', '0', '0'),
(578, 118, 4, '0', '0', '0', '0'),
(579, 119, 4, '0', '0', '0', '0'),
(580, 120, 4, '0', '0', '0', '0'),
(581, 121, 4, '0', '0', '0', '0'),
(582, 122, 4, '0', '0', '0', '0'),
(583, 123, 4, '0', '0', '0', '0'),
(584, 124, 4, '0', '0', '0', '0'),
(585, 125, 4, '0', '0', '0', '0'),
(586, 126, 4, '0', '0', '0', '0'),
(587, 127, 4, '0', '0', '0', '0'),
(588, 128, 4, '0', '0', '0', '0'),
(589, 129, 4, '0', '0', '0', '0'),
(590, 130, 4, '0', '0', '0', '0'),
(591, 131, 4, '0', '0', '0', '0'),
(592, 132, 4, '0', '0', '0', '0'),
(593, 133, 4, '0', '0', '0', '0'),
(594, 134, 4, '0', '0', '0', '0'),
(595, 135, 4, '0', '0', '0', '0'),
(596, 136, 4, '0', '0', '0', '0'),
(597, 137, 4, '0', '0', '0', '0'),
(598, 138, 4, '0', '0', '0', '0'),
(599, 93, 5, '0', '0', '0', '0'),
(600, 94, 5, '0', '0', '0', '0'),
(601, 95, 5, '0', '0', '0', '0'),
(602, 96, 5, '0', '0', '0', '0'),
(603, 97, 5, '0', '0', '0', '0'),
(604, 98, 5, '0', '0', '0', '0'),
(605, 99, 5, '0', '0', '0', '0'),
(606, 100, 5, '0', '0', '0', '0'),
(607, 101, 5, '0', '0', '0', '0'),
(608, 102, 5, '0', '0', '0', '0'),
(609, 103, 5, '0', '0', '0', '0'),
(610, 104, 5, '0', '0', '0', '0'),
(611, 105, 5, '0', '0', '0', '0'),
(612, 106, 5, '0', '0', '0', '0'),
(613, 107, 5, '0', '0', '0', '0'),
(614, 108, 5, '0', '0', '0', '0'),
(615, 109, 5, '0', '0', '0', '0'),
(616, 110, 5, '0', '0', '0', '0'),
(617, 111, 5, '0', '0', '0', '0'),
(618, 112, 5, '0', '0', '0', '0'),
(619, 113, 5, '0', '0', '0', '0'),
(620, 114, 5, '0', '0', '0', '0'),
(621, 115, 5, '0', '0', '0', '0'),
(622, 116, 5, '0', '0', '0', '0'),
(623, 117, 5, '0', '0', '0', '0'),
(624, 118, 5, '0', '0', '0', '0'),
(625, 119, 5, '0', '0', '0', '0'),
(626, 120, 5, '0', '0', '0', '0'),
(627, 121, 5, '0', '0', '0', '0'),
(628, 122, 5, '0', '0', '0', '0'),
(629, 123, 5, '0', '0', '0', '0'),
(630, 124, 5, '0', '0', '0', '0'),
(631, 125, 5, '0', '0', '0', '0'),
(632, 126, 5, '0', '0', '0', '0'),
(633, 127, 5, '0', '0', '0', '0'),
(634, 128, 5, '0', '0', '0', '0'),
(635, 129, 5, '0', '0', '0', '0'),
(636, 130, 5, '0', '0', '0', '0'),
(637, 131, 5, '0', '0', '0', '0'),
(638, 132, 5, '0', '0', '0', '0'),
(639, 133, 5, '0', '0', '0', '0'),
(640, 134, 5, '0', '0', '0', '0'),
(641, 135, 5, '0', '0', '0', '0'),
(642, 136, 5, '0', '0', '0', '0'),
(643, 137, 5, '0', '0', '0', '0'),
(644, 138, 5, '0', '0', '0', '0');

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
  `price` decimal(20,2) DEFAULT NULL,
  `price_unit` decimal(20,2) DEFAULT NULL,
  `price_unit_usd` decimal(20,2) DEFAULT NULL,
  `price_usd` decimal(20,2) DEFAULT NULL,
  `price_suggested` decimal(20,2) DEFAULT NULL,
  `price_suggested_usd` decimal(20,2) DEFAULT NULL,
  `net_price` decimal(20,2) DEFAULT NULL,
  `net_price_usd` decimal(20,2) DEFAULT NULL,
  `img_name` longtext DEFAULT NULL,
  `min_sell` int(11) DEFAULT NULL,
  `max_sell` bigint(20) DEFAULT NULL,
  `multiple_sell` int(11) DEFAULT NULL,
  `units_per_pack` int(11) DEFAULT NULL,
  `codisb` int(11) DEFAULT NULL,
  `expire_at` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `profit_margin` decimal(20,2) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_regulated` int(11) DEFAULT NULL,
  `is_featured` int(11) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_products`
--

INSERT INTO `fs_products` (`id_product`, `id_brand`, `id_category`, `id_tax`, `id_active_compound`, `id_discount`, `id_supplier`, `ref`, `name`, `short_description`, `description`, `code`, `bar_code`, `price_cost`, `price`, `price_unit`, `price_unit_usd`, `price_usd`, `price_suggested`, `price_suggested_usd`, `net_price`, `net_price_usd`, `img_name`, `min_sell`, `max_sell`, `multiple_sell`, `units_per_pack`, `codisb`, `expire_at`, `created_at`, `profit_margin`, `is_active`, `is_regulated`, `is_featured`, `op_status`) VALUES
(1, 1, 1, 1, 1, 2, -1, '', 'ACICLOR AP TAB 1G X 10', '', '', '003992', '8903726180655', '19.40', '414.46', '11.73', '1.42', '17.00', '683.86', '32.01', '414.46', '17.00', '1ra.Acetaminofen-500mg-x-20-tabletas.jpg', 0, 0, 0, 12, 0, '', '0000-00-00 00:00:00', '65.00', 1, -1, 1, 'A'),
(2, 1, 2, 1, 1, 2, 3, '', 'ACIDO FOLICO TAB 5MG X 30 GENVEN', '', '', '123456', '49845261396', '6.00', '146.28', '0.00', '0.00', '6.00', '190.16', '7.80', '146.28', '6.00', 'descargar.jpg', 0, 0, 0, 30, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(3, 1, 3, 1, 2, 2, 3, '', 'ALIVET JBE 125 MG/0.5MG/5ML X 120ML', '', '', '211345', '48941134764', '1.86', '45.35', '0.00', '0.00', '1.86', '58.95', '2.42', '45.35', '1.86', '171056-800-auto.webp', 0, 0, 0, 10, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(4, 1, 2, 1, 1, 1, 3, '', 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 12', '', '', '214523', '48845365199', '2.00', '48.76', '0.00', '0.00', '2.00', '63.39', '2.60', '48.76', '2.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 16, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(5, 1, 2, 1, 1, 1, 3, '', 'ANTUX JBE 6MG/ML S/CEREZA X 180ML', '', '', '548766', '19848164169', '1.00', '24.38', '0.00', '0.00', '1.00', '31.69', '1.30', '24.38', '1.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 14, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(6, 1, 3, 1, 2, 1, 3, '', 'ARTRODAR TAB 50MG X 30', '', '', '165975', '15644987646', '4.00', '97.52', '0.00', '0.00', '4.00', '126.78', '5.20', '97.52', '4.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 20, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(7, 1, 2, 1, 1, 1, 3, '', 'ASAPROL COM 81 MG X 100', '', '', '651651', '51531563166', '7.00', '170.66', '0.00', '0.00', '7.00', '221.86', '9.10', '170.66', '7.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 24, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(8, 1, 2, 1, 1, 1, 3, '', 'ATORVASTATINA TAB 20MG X 30 GENVEN', '', '', '151664', '51654484561', '6.30', '153.59', '0.00', '0.00', '6.30', '199.67', '8.19', '153.59', '6.30', 'Acetaminofem-600x450.jpg', 0, 0, 0, 12, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(9, 0, 0, 0, 0, 0, 0, '', 'ATORVASTATINA TAB 40MG X 30 GENVEN', '', '', '', '', '1.00', '24.38', '0.00', '0.00', '1.00', '24.38', '1.00', '24.38', '1.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 1, 1, 0, 'A'),
(10, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(11, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(12, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(13, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(14, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(15, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(16, 0, 0, 1, 0, 0, 3, '', 'ACETAMINOFEN TAB 500MG X 10 GENVEN', '', '', '', '', '8.00', '204.79', '0.00', '0.00', '8.40', '225.27', '8.80', '204.79', '8.40', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '10.00', 1, 0, 0, 'A'),
(17, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'N'),
(18, 1, 1, 1, 1, 1, -1, '', 'ACICLOR AP TAB 1G X 10', '', '', '003992', '8903726180655', '19.40', '414.46', '11.73', '1.42', '17.00', '683.86', '32.01', '414.46', '17.00', '1ra.Acetaminofen-500mg-x-20-tabletas.jpg', 0, 0, 0, 12, 0, '', '0000-00-00 00:00:00', '65.00', 1, -1, 1, 'A'),
(19, 1, 2, 1, 1, 1, 3, '', 'ACIDO FOLICO TAB 5MG X 30 GENVEN', '', '', '123456', '49845261396', '6.00', '146.28', '0.00', '0.00', '6.00', '190.16', '7.80', '146.28', '6.00', 'descargar.jpg', 0, 0, 0, 30, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(20, 1, 3, 1, 2, 1, 3, '', 'ALIVET JBE 125 MG/0.5MG/5ML X 120ML', '', '', '211345', '48941134764', '1.86', '45.35', '0.00', '0.00', '1.86', '58.95', '2.42', '45.35', '1.86', '171056-800-auto.webp', 0, 0, 0, 10, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(21, 1, 2, 1, 1, 1, 3, '', 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 12', '', '', '214523', '48845365199', '2.00', '48.76', '0.00', '0.00', '2.00', '63.39', '2.60', '48.76', '2.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 16, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(22, 1, 2, 1, 1, 1, 3, '', 'ANTUX JBE 6MG/ML S/CEREZA X 180ML', '', '', '548766', '19848164169', '1.00', '24.38', '0.00', '0.00', '1.00', '31.69', '1.30', '24.38', '1.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 14, 0, '', '0000-00-00 00:00:00', '30.00', 0, 0, 1, 'A'),
(23, 1, 3, 1, 2, 1, 3, '', 'ARTRODAR TAB 50MG X 30', '', '', '165975', '15644987646', '4.00', '97.52', '0.00', '0.00', '4.00', '126.78', '5.20', '97.52', '4.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 20, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(24, 1, 2, 1, 1, 1, 3, '', 'ASAPROL COM 81 MG X 100', '', '', '651651', '51531563166', '7.00', '170.66', '0.00', '0.00', '7.00', '221.86', '9.10', '170.66', '7.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 24, 0, '', '0000-00-00 00:00:00', '30.00', 0, 0, 1, 'A'),
(25, 1, 2, 1, 1, 1, 3, '', 'ATORVASTATINA TAB 20MG X 30 GENVEN', '', '', '151664', '51654484561', '6.30', '153.59', '0.00', '0.00', '6.30', '199.67', '8.19', '153.59', '6.30', 'Acetaminofem-600x450.jpg', 0, 0, 0, 12, 0, '', '0000-00-00 00:00:00', '30.00', 0, 0, 1, 'A'),
(26, 0, 0, 0, 0, 0, 0, '', 'ATORVASTATINA TAB 40MG X 30 GENVEN', '', '', '', '', '1.00', '24.38', '0.00', '0.00', '1.00', '24.38', '1.00', '24.38', '1.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 1, 0, 'A'),
(27, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(28, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(29, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(30, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(31, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(32, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(33, 0, 0, 1, 0, 0, 3, '', 'ACETAMINOFEN TAB 500MG X 10 GENVEN', '', '', '', '', '8.00', '204.79', '0.00', '0.00', '8.40', '225.27', '8.80', '204.79', '8.40', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '10.00', 0, 0, 0, 'A'),
(34, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'N'),
(35, 1, 1, 1, 1, 1, -1, '', 'ACICLOR AP TAB 1G X 10', '', '', '003992', '8903726180655', '19.40', '414.46', '11.73', '1.42', '17.00', '683.86', '32.01', '414.46', '17.00', '1ra.Acetaminofen-500mg-x-20-tabletas.jpg', 0, 0, 0, 12, 0, '', '0000-00-00 00:00:00', '65.00', 1, -1, 1, 'A'),
(36, 1, 2, 1, 1, 1, 3, '', 'ACIDO FOLICO TAB 5MG X 30 GENVEN', '', '', '123456', '49845261396', '6.00', '146.28', '0.00', '0.00', '6.00', '190.16', '7.80', '146.28', '6.00', 'descargar.jpg', 0, 0, 0, 30, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(37, 1, 3, 1, 2, 1, 3, '', 'ALIVET JBE 125 MG/0.5MG/5ML X 120ML', '', '', '211345', '48941134764', '1.86', '45.35', '0.00', '0.00', '1.86', '58.95', '2.42', '45.35', '1.86', '171056-800-auto.webp', 0, 0, 0, 10, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(38, 1, 2, 1, 1, 1, 3, '', 'ALIVET TAB 500MG DIA/NOCHE 4 DIAS X 12', '', '', '214523', '48845365199', '2.00', '48.76', '0.00', '0.00', '2.00', '63.39', '2.60', '48.76', '2.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 16, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(39, 1, 2, 1, 1, 1, 3, '', 'ANTUX JBE 6MG/ML S/CEREZA X 180ML', '', '', '548766', '19848164169', '1.00', '24.38', '0.00', '0.00', '1.00', '31.69', '1.30', '24.38', '1.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 14, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(40, 1, 3, 1, 2, 1, 3, '', 'ARTRODAR TAB 50MG X 30', '', '', '165975', '15644987646', '4.00', '97.52', '0.00', '0.00', '4.00', '126.78', '5.20', '97.52', '4.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 20, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(41, 1, 2, 1, 1, 1, 3, '', 'ASAPROL COM 81 MG X 100', '', '', '651651', '51531563166', '7.00', '170.66', '0.00', '0.00', '7.00', '221.86', '9.10', '170.66', '7.00', 'Acetaminofem-600x450.jpg', 0, 0, 0, 24, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(42, 1, 2, 1, 1, 1, 3, '', 'ATORVASTATINA TAB 20MG X 30 GENVEN', '', '', '151664', '51654484561', '6.30', '153.59', '0.00', '0.00', '6.30', '199.67', '8.19', '153.59', '6.30', 'Acetaminofem-600x450.jpg', 0, 0, 0, 12, 0, '', '0000-00-00 00:00:00', '30.00', 1, 0, 1, 'A'),
(43, 0, 0, 0, 0, 0, 0, '', 'ATORVASTATINA TAB 40MG X 30 GENVEN', '', '', '', '', '1.00', '24.38', '0.00', '0.00', '1.00', '24.38', '1.00', '24.38', '1.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 1, 1, 0, 'A'),
(44, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(45, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(46, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(47, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(48, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(49, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'E'),
(50, 1, 3, 1, 1, -1, -1, '', 'ACETAMINOFEN TAB 500MG X 10 GENVEN', '', '', '', '', '8.00', '204.79', '0.00', '0.00', '8.40', '225.27', '8.80', '204.79', '8.40', 'cyberpunk-samurai-girl-oni-mask-cgi-digital-art-2k-wallpaper-uhdpaper.com-226@0@f.jpg', 0, 0, 0, 0, 0, '2023-02-27', '0000-00-00 00:00:00', '10.00', 1, 0, 0, 'A'),
(51, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0.00', 0, 0, 0, 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_roles`
--

CREATE TABLE `fs_roles` (
  `id_role` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  `role_type` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_roles`
--

INSERT INTO `fs_roles` (`id_role`, `name`, `is_active`, `is_deleted`, `is_default`, `role_type`) VALUES
(-1, 'SuperSu', -1, -1, 1, 'D'),
(1, 'Administrador', 1, 0, 1, 'A'),
(2, 'Clientes', 1, 0, 1, 'C'),
(3, 'Proveedores', 1, 0, 1, 'P'),
(4, 'Vendedor', 1, 0, 0, 'A'),
(5, 'Contador', 1, 0, 0, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_shopping_orders`
--

CREATE TABLE `fs_shopping_orders` (
  `id_shopping_order` int(11) NOT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `order_type` varchar(1) DEFAULT NULL,
  `amount` decimal(20,2) DEFAULT NULL,
  `amount_usd` decimal(20,2) DEFAULT NULL,
  `exchange_rate` decimal(20,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `comments` longtext DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_shopping_order_details`
--

CREATE TABLE `fs_shopping_order_details` (
  `id_shopping_order_detail` int(11) NOT NULL,
  `id_shopping_order` int(11) DEFAULT NULL,
  `id_warehouse` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `profit_margin` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_stock`
--

CREATE TABLE `fs_stock` (
  `id_stock` int(11) NOT NULL,
  `id_warehouse` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `current_stock` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_stock`
--

INSERT INTO `fs_stock` (`id_stock`, `id_warehouse`, `id_product`, `current_stock`) VALUES
(1, 1, 1, '36.00'),
(2, 1, 3, '19.00'),
(3, 1, 2, '26.00'),
(4, 1, 4, '45.00'),
(5, 1, 5, '10.00'),
(6, 1, 6, '32.00'),
(7, 1, 7, '25.00'),
(8, 1, 8, '9.00'),
(9, 1, 9, '10.00'),
(10, 23, 9, '2.00'),
(11, -1, 9, '2.00'),
(12, 1, 16, '16.00'),
(13, 23, 16, '12.00'),
(14, 23, 1, '104.00'),
(15, 23, 6, '10.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_stock_requests`
--

CREATE TABLE `fs_stock_requests` (
  `id_stock_request` int(11) NOT NULL,
  `id_requestor` int(11) DEFAULT NULL,
  `id_approver` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_stock_request_details`
--

CREATE TABLE `fs_stock_request_details` (
  `id_stock_request_detail` int(11) NOT NULL,
  `id_stock_request` varchar(255) DEFAULT NULL,
  `id_warehouse` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_support_tickets`
--

CREATE TABLE `fs_support_tickets` (
  `id_support_ticket` int(11) NOT NULL,
  `id_entity` int(11) DEFAULT NULL,
  `sender` varchar(64) DEFAULT NULL,
  `subject` varchar(64) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fs_taxes`
--

CREATE TABLE `fs_taxes` (
  `id_tax` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `op_status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_taxes`
--

INSERT INTO `fs_taxes` (`id_tax`, `name`, `rate`, `op_status`) VALUES
(1, 'IVA 16%', '16.00', '1'),
(2, '', '0.00', 'A');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fs_usd_rates`
--

INSERT INTO `fs_usd_rates` (`id_rate`, `date`, `rate`, `op_status`) VALUES
(1, '2022-08-31 01:46:32', '7.82', 'A');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(23, 1, 'ALMACEN GENERAL ', 'Mi Casa', 'en sol amado', 'A'),
(24, 0, '', '', '', 'A');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_getitemsbyorderid`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_getitemsbyorderid` (
`id_order_line` int(11)
,`id_order` int(11)
,`id_product` int(11)
,`name` varchar(64)
,`quantity` int(11)
,`discount_percentage` decimal(10,2)
,`tax_rate` decimal(10,2)
,`code` varchar(32)
,`current_stock` decimal(42,2)
,`price` decimal(10,2)
,`price_usd` decimal(10,2)
,`net_price` decimal(21,2)
,`net_price_usd` decimal(21,2)
,`total` decimal(10,2)
,`total_usd` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_getitemsbyorderid`
--
DROP TABLE IF EXISTS `vw_getitemsbyorderid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_getitemsbyorderid`  AS SELECT `ol`.`id_order_line` AS `id_order_line`, `ol`.`id_order` AS `id_order`, `ol`.`id_product` AS `id_product`, `p`.`name` AS `name`, `ol`.`quantity` AS `quantity`, CASE WHEN `ol`.`discount_percentage` is null THEN 0 ELSE `ol`.`discount_percentage` END AS `discount_percentage`, `ol`.`tax_rate` AS `tax_rate`, `p`.`code` AS `code`, (select sum(`fs_stock`.`current_stock`) from `fs_stock` where `fs_stock`.`id_product` = `ol`.`id_product`) AS `current_stock`, `ol`.`price` AS `price`, `ol`.`price_usd` AS `price_usd`, CASE WHEN `ol`.`discount_percentage` is not null THEN round(`ol`.`price` - `ol`.`price` * (`ol`.`discount_percentage` / 100) + `ol`.`price` * (`ol`.`tax_rate` / 100),2) END AS `net_price`, CASE WHEN `ol`.`discount_percentage` is not null THEN round(`ol`.`price_usd` - `ol`.`price_usd` * (`ol`.`discount_percentage` / 100) + `ol`.`price_usd` * (`ol`.`tax_rate` / 100),2) END AS `net_price_usd`, `ol`.`total` AS `total`, `ol`.`total_usd` AS `total_usd` FROM (`fs_order_lines` `ol` join `fs_products` `p` on(`p`.`id_product` = `ol`.`id_product`)) ORDER BY `ol`.`id_order_line` ASC  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fs_accounting_accounts`
--
ALTER TABLE `fs_accounting_accounts`
  ADD PRIMARY KEY (`id_accounting_account`) USING BTREE;

--
-- Indices de la tabla `fs_accounting_entry_types`
--
ALTER TABLE `fs_accounting_entry_types`
  ADD PRIMARY KEY (`id_accounting_entry_type`) USING BTREE;

--
-- Indices de la tabla `fs_accounting_journal_entries`
--
ALTER TABLE `fs_accounting_journal_entries`
  ADD PRIMARY KEY (`id_accounting_journal_entry`) USING BTREE;

--
-- Indices de la tabla `fs_accounting_journal_entry_details`
--
ALTER TABLE `fs_accounting_journal_entry_details`
  ADD PRIMARY KEY (`id_accounting_journal_entry_detail`) USING BTREE;

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
-- Indices de la tabla `fs_banks`
--
ALTER TABLE `fs_banks`
  ADD PRIMARY KEY (`id_bank`);

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
-- Indices de la tabla `fs_comparator`
--
ALTER TABLE `fs_comparator`
  ADD PRIMARY KEY (`id_comparator_entry`);

--
-- Indices de la tabla `fs_complaints`
--
ALTER TABLE `fs_complaints`
  ADD PRIMARY KEY (`id_complaint`);

--
-- Indices de la tabla `fs_complaint_messages`
--
ALTER TABLE `fs_complaint_messages`
  ADD PRIMARY KEY (`id_complaint_message`);

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
-- Indices de la tabla `fs_contact_requests`
--
ALTER TABLE `fs_contact_requests`
  ADD PRIMARY KEY (`id_contact_request`);

--
-- Indices de la tabla `fs_cxc`
--
ALTER TABLE `fs_cxc`
  ADD PRIMARY KEY (`id_cxc`);

--
-- Indices de la tabla `fs_cxp`
--
ALTER TABLE `fs_cxp`
  ADD PRIMARY KEY (`id_cxp`);

--
-- Indices de la tabla `fs_discounts`
--
ALTER TABLE `fs_discounts`
  ADD PRIMARY KEY (`id_discount`);

--
-- Indices de la tabla `fs_documents`
--
ALTER TABLE `fs_documents`
  ADD PRIMARY KEY (`id_document`);

--
-- Indices de la tabla `fs_entities`
--
ALTER TABLE `fs_entities`
  ADD PRIMARY KEY (`id_entity`) USING BTREE;

--
-- Indices de la tabla `fs_exchange_rates`
--
ALTER TABLE `fs_exchange_rates`
  ADD PRIMARY KEY (`id_exchange_rate`);

--
-- Indices de la tabla `fs_invoices`
--
ALTER TABLE `fs_invoices`
  ADD PRIMARY KEY (`id_invoice`);

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
-- Indices de la tabla `fs_permissions`
--
ALTER TABLE `fs_permissions`
  ADD PRIMARY KEY (`id_permission`) USING BTREE,
  ADD UNIQUE KEY `name` (`code`);

--
-- Indices de la tabla `fs_permission_roles`
--
ALTER TABLE `fs_permission_roles`
  ADD PRIMARY KEY (`id_permission_role`);

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
-- Indices de la tabla `fs_shopping_orders`
--
ALTER TABLE `fs_shopping_orders`
  ADD PRIMARY KEY (`id_shopping_order`) USING BTREE;

--
-- Indices de la tabla `fs_shopping_order_details`
--
ALTER TABLE `fs_shopping_order_details`
  ADD PRIMARY KEY (`id_shopping_order_detail`);

--
-- Indices de la tabla `fs_stock`
--
ALTER TABLE `fs_stock`
  ADD PRIMARY KEY (`id_stock`);

--
-- Indices de la tabla `fs_stock_requests`
--
ALTER TABLE `fs_stock_requests`
  ADD PRIMARY KEY (`id_stock_request`);

--
-- Indices de la tabla `fs_stock_request_details`
--
ALTER TABLE `fs_stock_request_details`
  ADD PRIMARY KEY (`id_stock_request_detail`);

--
-- Indices de la tabla `fs_support_tickets`
--
ALTER TABLE `fs_support_tickets`
  ADD PRIMARY KEY (`id_support_ticket`);

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
-- Indices de la tabla `fs_warehouses`
--
ALTER TABLE `fs_warehouses`
  ADD PRIMARY KEY (`id_warehouse`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fs_accounting_accounts`
--
ALTER TABLE `fs_accounting_accounts`
  MODIFY `id_accounting_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fs_accounting_entry_types`
--
ALTER TABLE `fs_accounting_entry_types`
  MODIFY `id_accounting_entry_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `fs_accounting_journal_entries`
--
ALTER TABLE `fs_accounting_journal_entries`
  MODIFY `id_accounting_journal_entry` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `fs_accounting_journal_entry_details`
--
ALTER TABLE `fs_accounting_journal_entry_details`
  MODIFY `id_accounting_journal_entry_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de la tabla `fs_active_compounds`
--
ALTER TABLE `fs_active_compounds`
  MODIFY `id_active_compound` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fs_audit_trails`
--
ALTER TABLE `fs_audit_trails`
  MODIFY `id_audit_trail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1359;

--
-- AUTO_INCREMENT de la tabla `fs_banks`
--
ALTER TABLE `fs_banks`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `fs_brands`
--
ALTER TABLE `fs_brands`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fs_cart`
--
ALTER TABLE `fs_cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `fs_cart_lines`
--
ALTER TABLE `fs_cart_lines`
  MODIFY `id_cart_line` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT de la tabla `fs_comparator`
--
ALTER TABLE `fs_comparator`
  MODIFY `id_comparator_entry` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `fs_complaints`
--
ALTER TABLE `fs_complaints`
  MODIFY `id_complaint` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_complaint_messages`
--
ALTER TABLE `fs_complaint_messages`
  MODIFY `id_complaint_message` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_configurations`
--
ALTER TABLE `fs_configurations`
  MODIFY `id_configuration` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `fs_contact_requests`
--
ALTER TABLE `fs_contact_requests`
  MODIFY `id_contact_request` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_cxc`
--
ALTER TABLE `fs_cxc`
  MODIFY `id_cxc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `fs_cxp`
--
ALTER TABLE `fs_cxp`
  MODIFY `id_cxp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_discounts`
--
ALTER TABLE `fs_discounts`
  MODIFY `id_discount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fs_documents`
--
ALTER TABLE `fs_documents`
  MODIFY `id_document` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `fs_entities`
--
ALTER TABLE `fs_entities`
  MODIFY `id_entity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fs_exchange_rates`
--
ALTER TABLE `fs_exchange_rates`
  MODIFY `id_exchange_rate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `fs_invoices`
--
ALTER TABLE `fs_invoices`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fs_menu_items`
--
ALTER TABLE `fs_menu_items`
  MODIFY `id_menu_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

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
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `fs_order_lines`
--
ALTER TABLE `fs_order_lines`
  MODIFY `id_order_line` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `fs_payments`
--
ALTER TABLE `fs_payments`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fs_payment_methods`
--
ALTER TABLE `fs_payment_methods`
  MODIFY `id_payment_menthod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fs_periods`
--
ALTER TABLE `fs_periods`
  MODIFY `id_period` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_permissions`
--
ALTER TABLE `fs_permissions`
  MODIFY `id_permission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de la tabla `fs_permission_roles`
--
ALTER TABLE `fs_permission_roles`
  MODIFY `id_permission_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=645;

--
-- AUTO_INCREMENT de la tabla `fs_products`
--
ALTER TABLE `fs_products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `fs_roles`
--
ALTER TABLE `fs_roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fs_shopping_orders`
--
ALTER TABLE `fs_shopping_orders`
  MODIFY `id_shopping_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_shopping_order_details`
--
ALTER TABLE `fs_shopping_order_details`
  MODIFY `id_shopping_order_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_stock`
--
ALTER TABLE `fs_stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `fs_stock_requests`
--
ALTER TABLE `fs_stock_requests`
  MODIFY `id_stock_request` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_stock_request_details`
--
ALTER TABLE `fs_stock_request_details`
  MODIFY `id_stock_request_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fs_support_tickets`
--
ALTER TABLE `fs_support_tickets`
  MODIFY `id_support_ticket` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `fs_warehouses`
--
ALTER TABLE `fs_warehouses`
  MODIFY `id_warehouse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
