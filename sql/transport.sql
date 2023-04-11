/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : transport

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 11/04/2023 14:12:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `deleted` int NULL DEFAULT 0 COMMENT '删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `c_d`(`code`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user', 'user', 'icon', 0);
INSERT INTO `sys_dict` VALUES (2, 'message', 'message', 'icon', 0);
INSERT INTO `sys_dict` VALUES (3, 'menu', 'menu', 'icon', 0);
INSERT INTO `sys_dict` VALUES (4, 'grid', 'grid', 'icon', 0);
INSERT INTO `sys_dict` VALUES (5, 'house', 'house', 'icon', 0);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `size` bigint NULL DEFAULT NULL COMMENT '大小',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '访问链接',
  `md5` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件摘要',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '存储地址',
  `deleted` int NULL DEFAULT 0 COMMENT '软删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作',
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入参',
  `output` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '出参',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'url',
  `duration` int NULL DEFAULT NULL COMMENT '执行时间',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int NULL DEFAULT 0 COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `orders` int NULL DEFAULT 1 COMMENT '顺序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'grid' COMMENT '图标',
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `pid` int NULL DEFAULT NULL COMMENT '父级id',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `type` int NULL DEFAULT NULL COMMENT '类型，1目录  2菜单 3按钮',
  `hide` tinyint(1) NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `a_d_index`(`auth`, `deleted`) USING BTREE,
  UNIQUE INDEX `p_p_d_index`(`path`, `page`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 408 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '系统管理', '', 2, 'menu', NULL, NULL, NULL, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 1, 0);
INSERT INTO `sys_permission` VALUES (3, '用户管理', 'user', 1, 'grid', 'User', 'user.list', 1, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 2, 0);
INSERT INTO `sys_permission` VALUES (4, '用户新增', '', 1, NULL, '', 'user.add', 3, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (8, '用户编辑', '', 1, NULL, NULL, 'user.edit', 3, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (9, '用户删除', NULL, 1, NULL, NULL, 'user.delete', 3, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (10, '角色管理', 'role', 1, 'grid', 'Role', 'role.list', 1, 0, '2023-01-31 20:32:59', '2023-01-31 20:32:59', 2, 0);
INSERT INTO `sys_permission` VALUES (11, '权限管理', 'permission', 1, 'grid', 'Permission', 'permission.list', 1, 0, '2023-01-31 20:33:25', '2023-01-31 20:33:25', 2, 0);
INSERT INTO `sys_permission` VALUES (12, '首页', 'home', 1, 'house', 'Home', NULL, NULL, 0, '2023-01-31 21:03:00', '2023-01-31 21:03:00', 2, 0);
INSERT INTO `sys_permission` VALUES (13, '数据字典管理', 'dict', 1, 'grid', 'Dict', 'dict.list', 1, 0, '2023-02-02 20:41:32', '2023-02-02 20:41:32', 2, 0);
INSERT INTO `sys_permission` VALUES (14, '批量删除', NULL, 1, '', NULL, 'user.deleteBatch', 3, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (15, '用户导入', NULL, 1, NULL, NULL, 'user.import', 3, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (16, '用户导出', NULL, 1, NULL, NULL, 'user.export', 3, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (21, '角色新增', NULL, 1, NULL, '', 'role.add', 10, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (22, '角色编辑', NULL, 1, NULL, NULL, 'role.edit', 10, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (23, '角色删除', NULL, 1, NULL, NULL, 'role.delete', 10, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (25, '批量删除', NULL, 1, NULL, NULL, 'role.deleteBatch', 10, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (26, '角色导入', NULL, 1, NULL, NULL, 'role.import', 10, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (27, '角色导出', NULL, 1, NULL, NULL, 'role.export', 10, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (30, '权限新增', NULL, 1, NULL, '', 'permission.add', 11, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (31, '权限编辑', NULL, 1, NULL, NULL, 'permission.edit', 11, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (32, '权限删除', NULL, 1, NULL, NULL, 'permission.delete', 11, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (34, '权限导入', NULL, 1, NULL, NULL, 'permission.import', 11, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (35, '权限导出', NULL, 1, NULL, NULL, 'permission.export', 11, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (37, '数据字典新增', NULL, 1, NULL, '', 'dict.add', 13, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (38, '数据字典编辑', NULL, 1, NULL, NULL, 'dict.edit', 13, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (39, '数据字典删除', NULL, 1, NULL, NULL, 'dict.delete', 13, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (40, '批量删除', NULL, 1, NULL, NULL, 'dict.deleteBatch', 13, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (41, '数据字典导入', NULL, 1, NULL, NULL, 'dict.import', 13, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (42, '数据字典导出', NULL, 1, NULL, NULL, 'dict.export', 13, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (96, '文件管理', 'file', 1, 'grid', 'File', 'file.list', 1, 0, NULL, '2023-02-04 12:45:57', 2, 0);
INSERT INTO `sys_permission` VALUES (97, '文件新增', NULL, 1, 'grid', NULL, 'file.add', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (98, '文件导入', NULL, 1, 'grid', NULL, 'file.import', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (99, '文件导出', NULL, 1, 'grid', NULL, 'file.export', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (100, '批量删除', NULL, 1, 'grid', NULL, 'file.deleteBatch', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (101, '文件编辑', NULL, 1, 'grid', NULL, 'file.edit', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (102, '文件删除', NULL, 1, 'grid', NULL, 'file.delete', 96, 0, NULL, NULL, 3, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flag_deleted_idnex`(`flag`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2833 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户唯一id',
  `deleted` int NOT NULL DEFAULT 0 COMMENT '逻辑删除 0存在  id删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_index`(`uid`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`, `deleted`) USING BTREE,
  UNIQUE INDEX `email_index`(`email`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
