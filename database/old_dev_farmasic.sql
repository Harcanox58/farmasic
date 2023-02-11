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

 Date: 12/07/2022 16:11:18
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

SET FOREIGN_KEY_CHECKS = 1;
