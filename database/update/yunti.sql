/*
Navicat MySQL Data Transfer

Source Server         : mysql7
Source Server Version : 50726
Source Host           : localhost:3308
Source Database       : yunti

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2023-07-06 21:38:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', 'Dashboard', 'fa-bar-chart', '/', null, null, '2023-06-27 15:25:03');
INSERT INTO `admin_menu` VALUES ('2', '0', '5', 'Admin', 'fa-tasks', '', null, null, '2023-07-06 13:09:04');
INSERT INTO `admin_menu` VALUES ('3', '2', '6', 'Users', 'fa-users', 'auth/users', null, null, '2023-07-06 13:09:04');
INSERT INTO `admin_menu` VALUES ('4', '2', '7', 'Roles', 'fa-user', 'auth/roles', null, null, '2023-07-06 13:09:04');
INSERT INTO `admin_menu` VALUES ('5', '2', '8', 'Permission', 'fa-ban', 'auth/permissions', null, null, '2023-07-06 13:09:04');
INSERT INTO `admin_menu` VALUES ('6', '2', '9', 'Menu', 'fa-bars', 'auth/menu', null, null, '2023-07-06 13:09:04');
INSERT INTO `admin_menu` VALUES ('7', '2', '10', 'Operation log', 'fa-history', 'auth/logs', null, null, '2023-07-06 13:09:04');
INSERT INTO `admin_menu` VALUES ('8', '0', '3', '访客管理', 'fa-bars', '/guests', '*', '2023-06-25 13:37:44', '2023-06-27 15:25:03');
INSERT INTO `admin_menu` VALUES ('9', '0', '2', '客户管理', 'fa-bars', '/users', null, '2023-06-27 15:22:55', '2023-06-27 15:25:03');
INSERT INTO `admin_menu` VALUES ('10', '0', '4', '系统管理', 'fa-bars', '/configs', null, '2023-07-06 13:08:53', '2023-07-06 13:09:04');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-18 16:41:07', '2023-06-18 16:41:07');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-18 16:41:12', '2023-06-18 16:41:12');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-18 16:41:14', '2023-06-18 16:41:14');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-18 16:41:19', '2023-06-18 16:41:19');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-18 16:41:21', '2023-06-18 16:41:21');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-18 16:41:25', '2023-06-18 16:41:25');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 09:02:28', '2023-06-25 09:02:28');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 09:02:41', '2023-06-25 09:02:41');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 09:02:42', '2023-06-25 09:02:42');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 13:36:25', '2023-06-25 13:36:25');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:36:30', '2023-06-25 13:36:30');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:36:33', '2023-06-25 13:36:33');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8bbf\\u5ba2\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/guests\",\"roles\":[null],\"permission\":null,\"_token\":\"NsrpkGcZ0zW3leVyKhbIBXRUAjv5Kx1Ks1RpUKoO\"}', '2023-06-25 13:37:43', '2023-06-25 13:37:43');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-25 13:37:44', '2023-06-25 13:37:44');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:38:02', '2023-06-25 13:38:02');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:38:09', '2023-06-25 13:38:09');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:38:14', '2023-06-25 13:38:14');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:38:18', '2023-06-25 13:38:18');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:38:29', '2023-06-25 13:38:29');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:38:39', '2023-06-25 13:38:39');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"NsrpkGcZ0zW3leVyKhbIBXRUAjv5Kx1Ks1RpUKoO\",\"_order\":\"[{\\\"id\\\":8},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2023-06-25 13:38:50', '2023-06-25 13:38:50');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:38:51', '2023-06-25 13:38:51');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:38:52', '2023-06-25 13:38:52');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-25 13:38:55', '2023-06-25 13:38:55');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:38:57', '2023-06-25 13:38:57');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-25 13:38:58', '2023-06-25 13:38:58');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:39:07', '2023-06-25 13:39:07');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-25 13:39:08', '2023-06-25 13:39:08');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:40:06', '2023-06-25 13:40:06');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-25 13:40:07', '2023-06-25 13:40:07');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:42:05', '2023-06-25 13:42:05');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-25 13:42:06', '2023-06-25 13:42:06');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:43:07', '2023-06-25 13:43:07');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:43:09', '2023-06-25 13:43:09');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 13:43:09', '2023-06-25 13:43:09');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 13:44:22', '2023-06-25 13:44:22');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:44:24', '2023-06-25 13:44:24');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 13:44:25', '2023-06-25 13:44:25');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:47:10', '2023-06-25 13:47:10');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 13:47:11', '2023-06-25 13:47:11');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:47:17', '2023-06-25 13:47:17');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:47:27', '2023-06-25 13:47:27');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:47:31', '2023-06-25 13:47:31');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8bbf\\u5ba2\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/guests\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"NsrpkGcZ0zW3leVyKhbIBXRUAjv5Kx1Ks1RpUKoO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2023-06-25 13:47:40', '2023-06-25 13:47:40');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-25 13:47:40', '2023-06-25 13:47:40');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"NsrpkGcZ0zW3leVyKhbIBXRUAjv5Kx1Ks1RpUKoO\",\"_order\":\"[{\\\"id\\\":8},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2023-06-25 13:47:45', '2023-06-25 13:47:45');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:47:45', '2023-06-25 13:47:45');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:47:47', '2023-06-25 13:47:47');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-25 13:47:47', '2023-06-25 13:47:47');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:48:22', '2023-06-25 13:48:22');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:48:53', '2023-06-25 13:48:53');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 13:51:50', '2023-06-25 13:51:50');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 13:59:07', '2023-06-25 13:59:07');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 13:59:09', '2023-06-25 13:59:09');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 14:00:03', '2023-06-25 14:00:03');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 14:00:26', '2023-06-25 14:00:26');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 14:01:42', '2023-06-25 14:01:42');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 14:02:43', '2023-06-25 14:02:43');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 14:03:03', '2023-06-25 14:03:03');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 14:04:22', '2023-06-25 14:04:22');
INSERT INTO `admin_operation_log` VALUES ('61', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 14:05:51', '2023-06-25 14:05:51');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 14:07:38', '2023-06-25 14:07:38');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"id\":null,\"country\":\"A\",\"_pjax\":\"#pjax-container\"}', '2023-06-25 14:07:44', '2023-06-25 14:07:44');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"country\":null}', '2023-06-25 14:07:57', '2023-06-25 14:07:57');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"id\":null,\"country\":null}', '2023-06-25 14:12:28', '2023-06-25 14:12:28');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"id\":null,\"country\":null}', '2023-06-25 14:13:15', '2023-06-25 14:13:15');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 14:13:59', '2023-06-25 14:13:59');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 14:14:04', '2023-06-25 14:14:04');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 14:26:06', '2023-06-25 14:26:06');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 14:26:07', '2023-06-25 14:26:07');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 14:28:19', '2023-06-25 14:28:19');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 14:33:32', '2023-06-25 14:33:32');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 14:34:10', '2023-06-25 14:34:10');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 14:35:06', '2023-06-25 14:35:06');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 14:35:11', '2023-06-25 14:35:11');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 14:35:17', '2023-06-25 14:35:17');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 14:36:44', '2023-06-25 14:36:44');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 14:43:05', '2023-06-25 14:43:05');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 14:43:29', '2023-06-25 14:43:29');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 14:44:01', '2023-06-25 14:44:01');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-25 15:04:52', '2023-06-25 15:04:52');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 15:08:10', '2023-06-25 15:08:10');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/guests', 'GET', '127.0.0.1', '[]', '2023-06-25 15:14:21', '2023-06-25 15:14:21');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-25 15:16:49', '2023-06-25 15:16:49');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-27 15:22:14', '2023-06-27 15:22:14');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:22:26', '2023-06-27 15:22:26');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"6k2PVgou5DCgK8P6t4VdZUzhGXuhGviaGpn6jacK\"}', '2023-06-27 15:22:54', '2023-06-27 15:22:54');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-27 15:22:55', '2023-06-27 15:22:55');
INSERT INTO `admin_operation_log` VALUES ('89', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"6k2PVgou5DCgK8P6t4VdZUzhGXuhGviaGpn6jacK\",\"_order\":\"[{\\\"id\\\":9},{\\\"id\\\":8},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2023-06-27 15:23:01', '2023-06-27 15:23:01');
INSERT INTO `admin_operation_log` VALUES ('90', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:23:02', '2023-06-27 15:23:02');
INSERT INTO `admin_operation_log` VALUES ('91', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-06-27 15:23:04', '2023-06-27 15:23:04');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:23:09', '2023-06-27 15:23:09');
INSERT INTO `admin_operation_log` VALUES ('93', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:23:15', '2023-06-27 15:23:15');
INSERT INTO `admin_operation_log` VALUES ('94', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2023-06-27 15:23:55', '2023-06-27 15:23:55');
INSERT INTO `admin_operation_log` VALUES ('95', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2023-06-27 15:24:19', '2023-06-27 15:24:19');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:24:35', '2023-06-27 15:24:35');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:24:45', '2023-06-27 15:24:45');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:24:53', '2023-06-27 15:24:53');
INSERT INTO `admin_operation_log` VALUES ('99', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"6k2PVgou5DCgK8P6t4VdZUzhGXuhGviaGpn6jacK\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":9},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2023-06-27 15:25:03', '2023-06-27 15:25:03');
INSERT INTO `admin_operation_log` VALUES ('100', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:25:03', '2023-06-27 15:25:03');
INSERT INTO `admin_operation_log` VALUES ('101', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:25:05', '2023-06-27 15:25:05');
INSERT INTO `admin_operation_log` VALUES ('102', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-27 15:25:07', '2023-06-27 15:25:07');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:25:09', '2023-06-27 15:25:09');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-27 15:29:23', '2023-06-27 15:29:23');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-06-27 15:29:24', '2023-06-27 15:29:24');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-06-28 08:04:29', '2023-06-28 08:04:29');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin', 'GET', '127.0.0.1', '[]', '2023-07-06 13:07:29', '2023-07-06 13:07:29');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:07:51', '2023-07-06 13:07:51');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-07-06 13:08:24', '2023-07-06 13:08:24');
INSERT INTO `admin_operation_log` VALUES ('110', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:08:28', '2023-07-06 13:08:28');
INSERT INTO `admin_operation_log` VALUES ('111', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:08:34', '2023-07-06 13:08:34');
INSERT INTO `admin_operation_log` VALUES ('112', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/configs\",\"roles\":[null],\"permission\":null,\"_token\":\"xXd3AiQEe5JkXGVraFB6OTMtJthReEDHZYGVUBoN\"}', '2023-07-06 13:08:53', '2023-07-06 13:08:53');
INSERT INTO `admin_operation_log` VALUES ('113', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-07-06 13:08:54', '2023-07-06 13:08:54');
INSERT INTO `admin_operation_log` VALUES ('114', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"xXd3AiQEe5JkXGVraFB6OTMtJthReEDHZYGVUBoN\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":9},{\\\"id\\\":8},{\\\"id\\\":10},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2023-07-06 13:09:04', '2023-07-06 13:09:04');
INSERT INTO `admin_operation_log` VALUES ('115', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:09:05', '2023-07-06 13:09:05');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-07-06 13:09:13', '2023-07-06 13:09:13');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/configs', 'GET', '127.0.0.1', '[]', '2023-07-06 13:12:05', '2023-07-06 13:12:05');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/configs', 'GET', '127.0.0.1', '[]', '2023-07-06 13:12:55', '2023-07-06 13:12:55');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin/configs/5', 'PUT', '127.0.0.1', '{\"name\":\"v\",\"value\":\"\\/down1.apk\",\"pk\":\"5\",\"_token\":\"xXd3AiQEe5JkXGVraFB6OTMtJthReEDHZYGVUBoN\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2023-07-06 13:13:01', '2023-07-06 13:13:01');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/configs', 'GET', '127.0.0.1', '{\"cid\":null,\"k\":\"API_DOMAINS\",\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:15:33', '2023-07-06 13:15:33');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/configs', 'GET', '127.0.0.1', '{\"cid\":null,\"k\":\"API_DOMAINS\"}', '2023-07-06 13:16:06', '2023-07-06 13:16:06');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:16:11', '2023-07-06 13:16:11');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:16:15', '2023-07-06 13:16:15');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:16:16', '2023-07-06 13:16:16');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin/guests', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:16:18', '2023-07-06 13:16:18');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin/configs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:16:21', '2023-07-06 13:16:21');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:19:15', '2023-07-06 13:19:15');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:19:18', '2023-07-06 13:19:18');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-07-06 13:19:21', '2023-07-06 13:19:21');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2023-06-18 16:28:58', '2023-06-18 16:28:58');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$AYSGkj/d55fwmF0z90WUleQ2ax.4VG69BSFaqgm.9OV2sAyh3K1S2', 'Administrator', null, 'tF2OV7y6ObeuMDY8QDNMJyPCrZ5zXJ458D72Md30ynnAyUdsXYS60pWWs07b', '2023-06-18 16:28:58', '2023-06-18 16:28:58');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for captchas
-- ----------------------------
DROP TABLE IF EXISTS `captchas`;
CREATE TABLE `captchas` (
  `capid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `login_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`capid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of captchas
-- ----------------------------
INSERT INTO `captchas` VALUES ('1', '', null, null, '2023-06-27 13:28:39', '2023-06-27 13:28:39');
INSERT INTO `captchas` VALUES ('3', '', null, null, '2023-06-27 13:32:06', '2023-06-27 13:32:06');
INSERT INTO `captchas` VALUES ('5', '', null, null, '2023-06-27 13:35:07', '2023-06-27 13:35:07');
INSERT INTO `captchas` VALUES ('7', '', null, null, '2023-06-27 13:44:15', '2023-06-27 14:07:12');
INSERT INTO `captchas` VALUES ('8', '', null, null, '2023-06-27 13:57:12', '2023-06-27 13:57:12');

-- ----------------------------
-- Table structure for configs
-- ----------------------------
DROP TABLE IF EXISTS `configs`;
CREATE TABLE `configs` (
  `cid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `k` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `v` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `i_k` (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of configs
-- ----------------------------
INSERT INTO `configs` VALUES ('1', 'API_DOMAINS', 'http://main.com,http://api1.com,http://api2.com,', '2023-06-27 13:28:39', '2023-06-27 13:28:39');
INSERT INTO `configs` VALUES ('3', 'DOWN_DOMAINS', 'http://www.abc.com,http://www.abc.com', '2023-06-27 13:32:06', '2023-06-27 13:32:06');
INSERT INTO `configs` VALUES ('5', 'ANDROID_DOWN_URI', '/down1.apk', '2023-06-27 13:35:07', '2023-07-06 13:13:02');
INSERT INTO `configs` VALUES ('7', 'IOS_DOWN_URI', '/main/down.plist', '2023-06-27 13:44:15', '2023-06-27 14:07:12');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for guests
-- ----------------------------
DROP TABLE IF EXISTS `guests`;
CREATE TABLE `guests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省份',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visits` int(11) NOT NULL DEFAULT '0' COMMENT '总访问量',
  `day_visits` int(11) DEFAULT '0' COMMENT '今天访问量',
  `device_type` int(11) DEFAULT '1' COMMENT '访问设备：1H5 2PC 3andriod',
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '来源哪个网站（如：百度）',
  `visited_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_ip` (`ip`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of guests
-- ----------------------------
INSERT INTO `guests` VALUES ('1', '127.0.0.3', 'United States', 'Connecticut', 'New Haven', '4', '4', null, null, null, '2023-06-25 12:58:31', '2023-06-25 12:49:10', '2023-06-25 12:58:31');
INSERT INTO `guests` VALUES ('2', '127.0.0.2', 'A', 'A', 'A', '2', '1', null, null, null, '2023-06-25 22:33:55', '2023-06-25 22:34:01', null);
INSERT INTO `guests` VALUES ('3', '115.239.212.133', 'China', 'Zhejiang', 'Hangzhou', '1', '1', null, null, null, '2023-06-25 14:39:01', '2023-06-25 14:39:01', '2023-06-25 14:39:01');
INSERT INTO `guests` VALUES ('4', '127.0.0.1', 'United States', 'Connecticut', 'New Haven', '41', '41', '1', null, null, '2023-06-28 02:51:30', '2023-06-25 15:04:49', '2023-06-28 02:51:30');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2016_01_04_173148_create_admin_tables', '2');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for statis_days
-- ----------------------------
DROP TABLE IF EXISTS `statis_days`;
CREATE TABLE `statis_days` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `new_ips` int(11) NOT NULL DEFAULT '0' COMMENT '新增IP数',
  `visits` int(11) DEFAULT '0' COMMENT 'IP日访问数',
  `ip_counts` int(11) DEFAULT '0' COMMENT '访问IP数',
  `date_at` timestamp NULL DEFAULT NULL COMMENT '统计日期',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of statis_days
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jwt_token` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fail_times` tinyint(4) DEFAULT '0',
  `fail_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `login_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '', 'test', 'test@gmail.com', null, '$2y$10$M5uLaA/imtZDdxI72RaLRu7BBbw2tUv2fSFS5XVFUMolYv.ClA4De', null, '', null, null, null, null, '2023-06-27 13:28:39', '2023-06-27 13:28:39');
INSERT INTO `users` VALUES ('3', '', 'test', 'test1@gmail.com', null, '$2y$10$QO5bhljJYSmapZJKWA86Te9zLl8Krt3E2adTMwMW8nAt6aTXJvZSy', null, '', null, null, null, null, '2023-06-27 13:32:06', '2023-06-27 13:32:06');
INSERT INTO `users` VALUES ('5', '', 'test', 'test2@gmail.com', null, '$2y$10$O3LckVkb6gfge8GgAmwzAeAK.jYJi7DTvK6o9LUkDTgsyT0grk7IO', null, '', null, null, null, null, '2023-06-27 13:35:07', '2023-06-27 13:35:07');
INSERT INTO `users` VALUES ('7', '', 'test', 'test3@gmail.com', null, '$2y$10$off0kAmAPx8DCyWYmtcZZeEd7iGA/uhwyCeBhfItDWDLRmHaf8vIi', null, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3RcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODc4NzQ4MzIsImV4cCI6MTY4Nzg3ODQzMiwibmJmIjoxNjg3ODc0ODMyLCJqdGkiOiJWQnpDQUZ6c3h6RGFqMW1aIiwic3ViIjo3LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.QyuDqvf7hNuUW6HEIKt6ATlKytvcjpTl5Q9z4V4IMOo', '0', '2023-06-27 22:10:19', null, null, '2023-06-27 13:44:15', '2023-06-27 14:07:12');
INSERT INTO `users` VALUES ('8', '', 'test1', 'test4@gmail.com', null, '$2y$10$4FxHycFFjVU6Jj79If0Ct.fvX4bUnYvMd5C3WwSInAsntC5Q7Z2ca', null, '', null, null, null, null, '2023-06-27 13:57:12', '2023-06-27 13:57:12');
