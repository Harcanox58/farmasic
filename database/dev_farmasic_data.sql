/*
 Navicat Premium Data Transfer

 Source Server         : [DEV] Localhost
 Source Server Type    : MariaDB
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : dev_farmasic

 Target Server Type    : MariaDB
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 12/07/2022 16:11:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fs_brands
-- ----------------------------
DROP TABLE IF EXISTS `fs_brands`;
CREATE TABLE `fs_brands`  (
  `id_brand` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_active` int(1) NULL DEFAULT NULL,
  `is_delected` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_brand`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_brands
-- ----------------------------

-- ----------------------------
-- Table structure for fs_categories
-- ----------------------------
DROP TABLE IF EXISTS `fs_categories`;
CREATE TABLE `fs_categories`  (
  `id_categories` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_active` int(1) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  `num_order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_categories`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_categories
-- ----------------------------
INSERT INTO `fs_categories` VALUES (1, 'AMPOLLAS', 'Ampollas_Biphase_SI_Netiqueta_min_da96e28857.png', 1, NULL, NULL);
INSERT INTO `fs_categories` VALUES (2, 'CREMAS / TOPICAS Y VAGINALES', '86d01f19f14f97300e610b13361a70e7-shaving-cream-icon.png', 1, NULL, NULL);
INSERT INTO `fs_categories` VALUES (3, 'TABLETAS', NULL, 1, NULL, NULL);
INSERT INTO `fs_categories` VALUES (4, 'GOTAS - ORALES Y NASALES', NULL, 1, NULL, NULL);
INSERT INTO `fs_categories` VALUES (5, 'SOLUCIONES ORALES - JARABES Y SU', NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for fs_configuration
-- ----------------------------
DROP TABLE IF EXISTS `fs_configuration`;
CREATE TABLE `fs_configuration`  (
  `id_configuration` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_configuration`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_configuration
-- ----------------------------
INSERT INTO `fs_configuration` VALUES (1, 'FS_THEME_NAME', 'classic');
INSERT INTO `fs_configuration` VALUES (2, 'FS_DEFAULT_THEME_NAME', 'classic');

-- ----------------------------
-- Table structure for fs_connections
-- ----------------------------
DROP TABLE IF EXISTS `fs_connections`;
CREATE TABLE `fs_connections`  (
  `id_connection` int(11) NOT NULL,
  `connection_userid` int(11) NULL DEFAULT NULL,
  `connection_type` int(4) NULL DEFAULT NULL,
  `connection_date` date NULL DEFAULT NULL,
  `connection_time` time(0) NULL DEFAULT NULL,
  `connection_last_time` time(0) NULL DEFAULT NULL,
  `connection_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `connection_status` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id_connection`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_connections
-- ----------------------------

-- ----------------------------
-- Table structure for fs_menu_items
-- ----------------------------
DROP TABLE IF EXISTS `fs_menu_items`;
CREATE TABLE `fs_menu_items`  (
  `id_menu_item` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_parent` int(1) NULL DEFAULT NULL,
  `is_child` int(1) NULL DEFAULT NULL,
  `is_header` int(1) NULL DEFAULT NULL,
  `id_parent` int(11) NULL DEFAULT NULL,
  `is_active` int(1) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  `num_order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_menu_item`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_menu_items
-- ----------------------------
INSERT INTO `fs_menu_items` VALUES (1, 'F', 'Inicio', 'dashboard', 'fas fa-home', 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (2, 'F', 'Cátalogo', 'catalog', 'fas fa-book', 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (3, 'A', 'Inicio', 'AdminDashboard', 'fas fa-home', 0, 0, 0, 0, 1, NULL, 1);
INSERT INTO `fs_menu_items` VALUES (4, 'A', 'Catálogo', 'AdminCatalog', 'fas fa-book', 1, 0, 0, 0, 1, NULL, 3);
INSERT INTO `fs_menu_items` VALUES (5, 'A', 'Productos', 'AdminCatalog&action=products', NULL, 0, 1, 0, 4, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (6, 'A', 'Pedidos', '', 'fas fa-shopping-cart', 1, 0, 0, 0, 1, NULL, 4);
INSERT INTO `fs_menu_items` VALUES (7, 'A', 'Clientes', '', 'fas fa-user-circle', 1, 0, 0, 0, 1, NULL, 5);
INSERT INTO `fs_menu_items` VALUES (8, 'A', 'Soporte', '', 'fas fa-headset', 1, 0, 0, 0, 1, NULL, 7);
INSERT INTO `fs_menu_items` VALUES (9, 'A', 'Categorias', 'AdminCatalog&action=categories', NULL, 0, 1, 0, 4, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (10, 'A', 'Descuentos', 'AdminCatalog&action=discount', NULL, 0, 1, 0, 4, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (11, 'A', 'Marcas', 'AdminCatalog&action=brands', NULL, 0, 1, 0, 4, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (12, 'A', 'Impuestos', 'AdminCatalog&action=taxes', NULL, 0, 1, 0, 4, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (13, 'A', 'Paramatros', 'AdminManager', 'fas fa-user-gear', 1, 0, 0, 0, 1, NULL, 9);
INSERT INTO `fs_menu_items` VALUES (14, 'A', 'Configuracion', '', NULL, 0, 0, 1, 0, 1, NULL, 8);
INSERT INTO `fs_menu_items` VALUES (15, 'A', 'Dev Parametros', 'AdminAdvanced', 'fas fa-code', 1, 0, 0, 0, 1, NULL, 10);
INSERT INTO `fs_menu_items` VALUES (16, 'A', 'Ventas', '', NULL, 0, 0, 1, 0, 1, NULL, 2);
INSERT INTO `fs_menu_items` VALUES (17, 'A', 'Mejorar', '', NULL, 0, 0, 1, 0, 1, NULL, 6);
INSERT INTO `fs_menu_items` VALUES (18, 'A', 'Pedidos', 'AdminOrders', NULL, 0, 1, 0, 6, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (19, 'A', 'Facturas', 'AdminOrders&action=invoices', NULL, 0, 1, 0, 6, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (20, 'A', 'Clientes', 'AdminCustomers', NULL, 0, 1, 0, 7, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (21, 'A', 'Direcciones', 'AdminCustomers&action=addresses', NULL, 0, 1, 0, 7, 1, NULL, NULL);
INSERT INTO `fs_menu_items` VALUES (22, 'A', 'Reactivos', 'AdminCatalog&action=reactive', NULL, 0, 1, 0, 4, 1, NULL, NULL);

-- ----------------------------
-- Table structure for fs_product
-- ----------------------------
DROP TABLE IF EXISTS `fs_product`;
CREATE TABLE `fs_product`  (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `id_brand` int(11) NULL DEFAULT NULL,
  `id_categories` int(11) NULL DEFAULT NULL,
  `id_tax` int(11) NULL DEFAULT NULL,
  `id_reactive_component` int(11) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bar_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `price_usd` decimal(10, 2) NULL DEFAULT NULL,
  `img_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_active` int(1) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_product
-- ----------------------------
INSERT INTO `fs_product` VALUES (1, 1, 1, 1, 1, 'Acetaminofeno pediatrico', 'Acetaminofen', '1564', '5432', 19, 21.00, 2.60, 'Acetaminofem-600x450.jpg', 1, 0);
INSERT INTO `fs_product` VALUES (2, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fs_product` VALUES (3, 1, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fs_product` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fs_product` VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `fs_product` VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for fs_reactive_components
-- ----------------------------
DROP TABLE IF EXISTS `fs_reactive_components`;
CREATE TABLE `fs_reactive_components`  (
  `id_reactive_component` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` int(1) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_reactive_component`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_reactive_components
-- ----------------------------

-- ----------------------------
-- Table structure for fs_roles
-- ----------------------------
DROP TABLE IF EXISTS `fs_roles`;
CREATE TABLE `fs_roles`  (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` int(1) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_roles
-- ----------------------------
INSERT INTO `fs_roles` VALUES (-1, 'SuperSu', -1, -1);

-- ----------------------------
-- Table structure for fs_taxes
-- ----------------------------
DROP TABLE IF EXISTS `fs_taxes`;
CREATE TABLE `fs_taxes`  (
  `id_tax` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `is_active` int(1) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tax`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_taxes
-- ----------------------------
INSERT INTO `fs_taxes` VALUES (1, 'IVA 16%', 16.00, 1, NULL);

-- ----------------------------
-- Table structure for fs_users
-- ----------------------------
DROP TABLE IF EXISTS `fs_users`;
CREATE TABLE `fs_users`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(4) NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lastname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_connection` datetime(0) NULL DEFAULT NULL,
  `date_creation` datetime(0) NULL DEFAULT NULL,
  `is_active` int(1) NULL DEFAULT NULL,
  `is_deleted` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fs_users
-- ----------------------------
INSERT INTO `fs_users` VALUES (1, -1, 'Carlos', 'Sandrea', 'csandrea', 'cjoseare1995@gmail.com', 'd598aac945ef5d16a15b067cf096ab3005e792aaf110c090f46f4741716cbc3b', NULL, NULL, 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
