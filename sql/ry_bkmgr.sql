/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : ry_bkmgr

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 26/02/2023 18:27:54
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bkmgr_book
-- ----------------------------
DROP TABLE IF EXISTS `bkmgr_book`;
CREATE TABLE `bkmgr_book`  (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '图书名',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '图书编号',
  `publishing_house` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '出版社',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '语言',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL,
  `inventory` int(11) NULL DEFAULT 0 COMMENT '库存',
  `book_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bkmgr_book
-- ----------------------------
INSERT INTO `bkmgr_book` VALUES (6, '库存测试', '库存测试', '1212312312312', '库存测试库存测试库存测试', '1', '11', 123.00, '2023-02-04 13:27:38', '2023-02-25 14:59:31', 'admin', 'admin', 2208, '/profile/bookCover/2023/02/16/blob_20230216203347A001.png');
INSERT INTO `bkmgr_book` VALUES (8, '类型测试', '类型测试图书', '12312321412421', '出版社测试', '1', NULL, 222.00, '2023-02-08 21:07:19', '2023-02-10 22:01:10', 'admin', 'admin', 0, '/profile/bookCover/2023/02/11/blob_20230211160218A001.png');
INSERT INTO `bkmgr_book` VALUES (10, '最后测试', '最后测试', '22222222', '最后测试最后测试', '1', NULL, 22.00, '2023-02-08 21:28:32', '2023-02-09 22:38:13', 'admin', 'admin', 0, NULL);

-- ----------------------------
-- Table structure for bkmgr_book_comment
-- ----------------------------
DROP TABLE IF EXISTS `bkmgr_book_comment`;
CREATE TABLE `bkmgr_book_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL,
  `star` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL,
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL,
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `record_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bkmgr_book_comment
-- ----------------------------
INSERT INTO `bkmgr_book_comment` VALUES (17, 6, 1, 's', '4', 'admin', 'admin', '2023-02-26 14:38:42', '2023-02-26 14:38:42', 32);
INSERT INTO `bkmgr_book_comment` VALUES (18, 6, 1, '测试分享', '4', 'admin', 'admin', '2023-02-26 14:45:27', '2023-02-26 14:45:27', 31);
INSERT INTO `bkmgr_book_comment` VALUES (19, 6, 1, '再次测试', '4', 'admin', 'admin', '2023-02-26 14:46:03', '2023-02-26 14:46:03', 30);
INSERT INTO `bkmgr_book_comment` VALUES (20, 6, 1, 'cccc', '5', 'admin', 'admin', '2023-02-26 14:46:36', '2023-02-26 14:46:36', 35);
INSERT INTO `bkmgr_book_comment` VALUES (21, 6, 1, 'qwe', '4', 'admin', 'admin', '2023-02-26 14:48:05', '2023-02-26 14:48:05', 29);
INSERT INTO `bkmgr_book_comment` VALUES (22, 6, 1, 'dsadsa', '4', 'admin', 'admin', '2023-02-26 14:48:15', '2023-02-26 14:48:15', 15);

-- ----------------------------
-- Table structure for bkmgr_book_type
-- ----------------------------
DROP TABLE IF EXISTS `bkmgr_book_type`;
CREATE TABLE `bkmgr_book_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NULL DEFAULT NULL,
  `book_type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bkmgr_book_type
-- ----------------------------
INSERT INTO `bkmgr_book_type` VALUES (19, 8, 1);

-- ----------------------------
-- Table structure for bkmgr_borrow_record
-- ----------------------------
DROP TABLE IF EXISTS `bkmgr_borrow_record`;
CREATE TABLE `bkmgr_borrow_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint(20) NULL DEFAULT NULL COMMENT '图书id',
  `borrow_time` datetime(0) NULL DEFAULT NULL COMMENT '借用时间',
  `return_time` datetime(0) NULL DEFAULT NULL COMMENT '归还时间',
  `borrow_user` bigint(20) NULL DEFAULT NULL COMMENT '借用人',
  `return_user` bigint(20) NULL DEFAULT NULL COMMENT '归还人',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bkmgr_borrow_record
-- ----------------------------
INSERT INTO `bkmgr_borrow_record` VALUES (6, 6, '2023-02-05 14:18:10', '2023-02-11 14:20:05', 1, 1, 'admin', 'admin', '2023-02-05 14:18:10', '2023-02-11 14:20:05');
INSERT INTO `bkmgr_borrow_record` VALUES (7, 6, '2023-02-05 14:18:40', '2023-02-11 14:21:49', 1, 1, 'admin', 'admin', '2023-02-05 14:18:40', '2023-02-11 14:21:49');
INSERT INTO `bkmgr_borrow_record` VALUES (8, 6, '2023-02-05 14:19:14', '2023-02-11 14:37:28', 1, 1, 'admin', 'admin', '2023-02-05 14:19:14', '2023-02-11 14:37:28');
INSERT INTO `bkmgr_borrow_record` VALUES (9, 6, '2023-02-05 14:20:11', '2023-02-11 14:37:59', 1, 1, 'admin', 'admin', '2023-02-05 14:20:11', '2023-02-11 14:37:59');
INSERT INTO `bkmgr_borrow_record` VALUES (10, 6, '2023-02-05 14:21:08', '2023-02-11 14:37:59', 1, 1, 'admin', 'admin', '2023-02-05 14:21:08', '2023-02-11 14:37:59');
INSERT INTO `bkmgr_borrow_record` VALUES (11, 6, '2023-02-05 14:21:18', '2023-02-11 14:37:59', 1, 1, 'admin', 'admin', '2023-02-05 14:21:18', '2023-02-11 14:37:59');
INSERT INTO `bkmgr_borrow_record` VALUES (12, 6, '2023-02-05 14:21:22', '2023-02-11 14:37:59', 1, 1, 'admin', 'admin', '2023-02-05 14:21:22', '2023-02-11 14:37:59');
INSERT INTO `bkmgr_borrow_record` VALUES (13, 6, '2023-02-05 14:26:51', '2023-02-11 14:37:59', 1, 1, 'admin', 'admin', '2023-02-05 14:26:51', '2023-02-11 14:37:59');
INSERT INTO `bkmgr_borrow_record` VALUES (14, 6, '2023-02-05 14:27:01', '2023-02-11 14:37:59', 1, 1, 'admin', 'admin', '2023-02-05 14:27:01', '2023-02-11 14:37:59');
INSERT INTO `bkmgr_borrow_record` VALUES (15, 6, '2023-02-05 14:27:08', '2023-02-11 14:37:59', 1, 1, 'admin', 'admin', '2023-02-05 14:27:08', '2023-02-11 14:37:59');
INSERT INTO `bkmgr_borrow_record` VALUES (16, 6, '2023-02-08 19:45:42', NULL, 1, NULL, 'admin', 'admin', '2023-02-08 19:45:42', '2023-02-08 19:45:42');
INSERT INTO `bkmgr_borrow_record` VALUES (17, 6, '2023-02-08 19:45:49', NULL, 1, NULL, 'admin', 'admin', '2023-02-08 19:45:49', '2023-02-08 19:45:49');
INSERT INTO `bkmgr_borrow_record` VALUES (18, 10, '2023-02-09 22:38:13', NULL, 1, NULL, 'admin', 'admin', '2023-02-09 22:38:13', '2023-02-09 22:38:13');
INSERT INTO `bkmgr_borrow_record` VALUES (19, 6, '2023-02-09 23:10:33', NULL, 1, NULL, 'admin', 'admin', '2023-02-09 23:10:33', '2023-02-09 23:10:33');
INSERT INTO `bkmgr_borrow_record` VALUES (20, 6, '2023-02-09 23:12:55', NULL, 1, NULL, 'admin', 'admin', '2023-02-09 23:12:55', '2023-02-09 23:12:55');
INSERT INTO `bkmgr_borrow_record` VALUES (21, 8, '2023-02-10 20:38:51', NULL, 1, NULL, 'admin', 'admin', '2023-02-10 20:38:51', '2023-02-10 20:38:51');
INSERT INTO `bkmgr_borrow_record` VALUES (22, 6, '2023-02-10 21:30:04', NULL, 1, NULL, 'admin', 'admin', '2023-02-10 21:30:04', '2023-02-10 21:30:04');
INSERT INTO `bkmgr_borrow_record` VALUES (23, 8, '2023-02-10 21:30:04', NULL, 1, NULL, 'admin', 'admin', '2023-02-10 21:30:04', '2023-02-10 21:30:04');
INSERT INTO `bkmgr_borrow_record` VALUES (24, 6, '2023-02-10 21:30:53', NULL, 1, NULL, 'admin', 'admin', '2023-02-10 21:30:53', '2023-02-10 21:30:53');
INSERT INTO `bkmgr_borrow_record` VALUES (25, 6, '2023-02-10 21:44:01', NULL, 1, NULL, 'admin', 'admin', '2023-02-10 21:44:01', '2023-02-10 21:44:01');
INSERT INTO `bkmgr_borrow_record` VALUES (26, 6, '2023-02-10 21:49:25', '2023-02-25 14:59:31', 1, 1, 'admin', 'admin', '2023-02-10 21:49:25', '2023-02-25 14:59:31');
INSERT INTO `bkmgr_borrow_record` VALUES (27, 6, '2023-02-10 21:51:09', NULL, 1, NULL, 'admin', 'admin', '2023-02-10 21:51:09', '2023-02-10 21:51:09');
INSERT INTO `bkmgr_borrow_record` VALUES (28, 6, '2023-02-10 21:52:11', NULL, 1, NULL, 'admin', 'admin', '2023-02-10 21:52:11', '2023-02-10 21:52:11');
INSERT INTO `bkmgr_borrow_record` VALUES (29, 6, '2023-02-10 21:54:53', NULL, 1, NULL, 'admin', 'admin', '2023-02-10 21:54:53', '2023-02-10 21:54:53');
INSERT INTO `bkmgr_borrow_record` VALUES (30, 6, '2023-02-11 14:38:31', NULL, 1, NULL, 'admin', 'admin', '2023-02-11 14:38:31', '2023-02-11 14:38:31');
INSERT INTO `bkmgr_borrow_record` VALUES (31, 6, '2023-02-11 14:38:34', NULL, 1, NULL, 'admin', 'admin', '2023-02-11 14:38:34', '2023-02-11 14:38:34');
INSERT INTO `bkmgr_borrow_record` VALUES (32, 6, '2023-02-11 14:38:43', NULL, 1, NULL, 'admin', 'admin', '2023-02-11 14:38:43', '2023-02-11 14:38:43');
INSERT INTO `bkmgr_borrow_record` VALUES (33, 6, '2023-02-11 14:39:08', '2023-02-11 14:39:52', 3, 3, '王权', '王权', '2023-02-11 14:39:08', '2023-02-11 14:39:52');
INSERT INTO `bkmgr_borrow_record` VALUES (34, 6, '2023-02-11 14:40:15', '2023-02-11 14:40:27', 3, 3, '王权', '王权', '2023-02-11 14:40:15', '2023-02-11 14:40:27');
INSERT INTO `bkmgr_borrow_record` VALUES (35, 6, '2023-02-11 14:43:24', '2023-02-16 20:43:13', 1, 1, 'admin', 'admin', '2023-02-11 14:43:24', '2023-02-16 20:43:13');

-- ----------------------------
-- Table structure for bkmgr_type
-- ----------------------------
DROP TABLE IF EXISTS `bkmgr_type`;
CREATE TABLE `bkmgr_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '图书类型',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bkmgr_type
-- ----------------------------
INSERT INTO `bkmgr_type` VALUES (1, '测试', '测试', '2023-01-11 23:35:37', '2023-01-11 23:35:40', 'admin', 'admin');
INSERT INTO `bkmgr_type` VALUES (2, '测试2', '测试2', '2023-01-18 22:16:18', '2023-01-11 22:16:21', 'admin', 'admin');
INSERT INTO `bkmgr_type` VALUES (3, '测试3', '测试3', '2023-01-10 23:25:56', '2023-02-01 20:37:08', NULL, 'admin');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'bkmgr_book', '图书', NULL, NULL, 'Book', 'crud', 'com.ruoyi.bkmgr', 'bkmgr', 'book', '图书信息', 'wq', '0', '/', '{\"parentMenuId\":\"2018\"}', 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:51', '图书实体');
INSERT INTO `gen_table` VALUES (5, 'bkmgr_book_type', '', NULL, NULL, 'BkmgrBookType', 'crud', 'com.ruoyi.system', 'system', 'type', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-01-17 20:38:56', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'bkmgr_type', '图书类型', NULL, NULL, 'BookType', 'crud', 'com.ruoyi.bkmgr', 'bkmgr', 'type', '图书类型', 'wq', '0', '/', '{\"parentMenuId\":\"2018\"}', 'admin', '2023-01-17 20:38:56', '', '2023-02-10 20:21:05', '图书类型');
INSERT INTO `gen_table` VALUES (7, 'bkmgr_borrow_record', '借用记录', NULL, NULL, 'BorrowRecord', 'crud', 'com.ruoyi.bkmgr', 'bkmgr', 'borrowRecord', '借用记录管理', 'wq', '0', '/', '{\"parentMenuId\":2018}', 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15', '借用记录');
INSERT INTO `gen_table` VALUES (8, 'bkmgr_book_comment', '图书评论', NULL, NULL, 'BookComment', 'crud', 'com.ruoyi.bkmgr', 'bkmgr', 'comment', '图书评论', 'wq', '0', '/', '{}', 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21', '图书评价');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (33, '4', 'book_id', 'id', 'bigint', 'Long', 'bookId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (34, '4', 'book_name', '图书名', 'varchar(255)', 'String', 'bookName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (35, '4', 'author', '作者', 'varchar(255)', 'String', 'author', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (36, '4', 'number', '图书编号', 'varchar(255)', 'String', 'number', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (37, '4', 'publishing_house', '出版社', 'varchar(255)', 'String', 'publishingHouse', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (38, '4', 'language', '语言', 'varchar(255)', 'String', 'language', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'wq_book_language', 6, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (39, '4', 'description', '描述', 'varchar(255)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (40, '4', 'price', '价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (41, '4', 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (42, '4', 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'datetime', '', 10, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (43, '4', 'create_by', NULL, 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (44, '4', 'update_by', NULL, 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '0', '0', '1', '0', 'EQ', 'input', '', 12, 'admin', '2023-01-17 20:38:56', '', '2023-01-17 20:56:52');
INSERT INTO `gen_table_column` VALUES (45, '5', 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-17 20:38:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '5', 'book_id', NULL, 'int', 'Long', 'bookId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-17 20:38:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '5', 'book_type_id', NULL, 'int', 'Long', 'bookTypeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-17 20:38:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '6', 'type_id', 'id', 'int', 'Long', 'typeId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-17 20:38:56', '', '2023-02-10 20:21:05');
INSERT INTO `gen_table_column` VALUES (49, '6', 'type', '图书类型', 'varchar(255)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-01-17 20:38:56', '', '2023-02-10 20:21:05');
INSERT INTO `gen_table_column` VALUES (50, '6', 'desc', '描述', 'varchar(255)', 'String', 'desc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-17 20:38:56', '', '2023-02-10 20:21:05');
INSERT INTO `gen_table_column` VALUES (51, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2023-01-17 20:38:56', '', '2023-02-10 20:21:05');
INSERT INTO `gen_table_column` VALUES (52, '6', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', '1', NULL, 'EQ', 'datetime', '', 5, 'admin', '2023-01-17 20:38:57', '', '2023-02-10 20:21:05');
INSERT INTO `gen_table_column` VALUES (53, '6', 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2023-01-17 20:38:57', '', '2023-02-10 20:21:05');
INSERT INTO `gen_table_column` VALUES (54, '6', 'update_by', '修改者', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, '0', '0', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2023-01-17 20:38:57', '', '2023-02-10 20:21:05');
INSERT INTO `gen_table_column` VALUES (55, '7', 'id', '主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (56, '7', 'book_id', '图书id', 'bigint', 'Long', 'bookId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (57, '7', 'borrow_time', '借用时间', 'datetime', 'Date', 'borrowTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (58, '7', 'return_time', '归还时间', 'datetime', 'Date', 'returnTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (59, '7', 'borrow_user', '借用人', 'varchar(25)', 'String', 'borrowUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (60, '7', 'return_user', '归还人', 'varchar(25)', 'String', 'returnUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (61, '7', 'create_by', '创建者', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (62, '7', 'update_by', '最后更新人', 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '0', '0', NULL, '1', 'EQ', 'input', '', 8, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (63, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (64, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '0', '0', NULL, '1', 'EQ', 'datetime', '', 10, 'admin', '2023-02-04 13:45:53', '', '2023-02-04 13:48:15');
INSERT INTO `gen_table_column` VALUES (65, '8', 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21');
INSERT INTO `gen_table_column` VALUES (66, '8', 'book_id', NULL, 'bigint(20)', 'Long', 'bookId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21');
INSERT INTO `gen_table_column` VALUES (67, '8', 'user_id', NULL, 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21');
INSERT INTO `gen_table_column` VALUES (68, '8', 'comment', NULL, 'text', 'String', 'comment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21');
INSERT INTO `gen_table_column` VALUES (69, '8', 'star', NULL, 'varchar(255)', 'String', 'star', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21');
INSERT INTO `gen_table_column` VALUES (70, '8', 'update_by', NULL, 'varchar(20)', 'String', 'updateBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21');
INSERT INTO `gen_table_column` VALUES (71, '8', 'create_by', NULL, 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21');
INSERT INTO `gen_table_column` VALUES (72, '8', 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21');
INSERT INTO `gen_table_column` VALUES (73, '8', 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2023-02-13 21:25:46', '', '2023-02-13 21:28:21');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-01-10 19:05:32', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-01-10 19:05:32', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-01-10 19:05:32', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-01-10 19:05:32', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-01-10 19:05:32', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'XX大学', 0, 'xxx', '15888888888', 'xxx@xxx.com', '0', '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:20:32');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', 'XXX学院', 1, 'xxx', '15888888888', 'xxx@xxx.com', '0', '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:21:02');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', 'xxxx学院2', 2, 'xxx', '15888888888', 'xxx@xxx.com', '0', '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:23:20');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', 'xxx班级1', 1, 'xxx', '15888888888', 'xxx@xxx.com', '0', '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:21:16');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', 'xxxx班级2', 2, 'xxx2', '15888888888', 'xxx@xxx.com', '0', '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:21:30');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', 'XXX班级3', 3, 'xxx', '15888888888', 'xxx@xxx.com', '0', '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:22:52');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-01-10 19:05:31', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-01-10 19:05:31', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-01-10 19:05:31', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-01-10 19:05:31', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, 'Chinese', '1', 'wq_book_language', NULL, 'default', 'N', '0', 'admin', '2023-01-11 21:33:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, 'English', '2', 'wq_book_language', NULL, 'default', 'N', '0', 'admin', '2023-01-11 21:34:06', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-01-10 19:05:32', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '图书语言', 'wq_book_language', '0', 'admin', '2023-01-11 21:33:11', 'admin', '2023-01-11 22:00:35', '图书语言');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-01-10 19:05:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-01-10 19:05:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-01-10 19:05:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 19:06:54');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 19:12:47');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-01-11 21:30:12');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 21:30:16');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 22:21:53');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 22:25:58');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-11 23:02:12');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 21:07:16');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-12 21:48:54');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-12 21:48:57');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 22:37:05');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-16 23:14:02');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-16 23:14:10');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 20:31:49');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-18 14:38:02');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-21 09:41:45');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 20:29:18');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-01 20:57:36');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 20:57:37');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-02 21:25:07');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-03 21:12:15');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-03 22:32:08');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-03 22:45:45');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-03 22:46:18');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 12:13:19');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 13:19:50');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 13:45:17');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 13:45:18');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 14:01:29');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 14:01:33');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 14:44:09');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 14:52:44');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 14:52:51');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 14:55:23');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 14:55:31');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 15:56:29');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 20:29:44');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 21:24:18');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 21:46:57');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 21:47:03');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 21:47:22');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 22:25:32');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 22:25:43');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 14:07:10');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-05 14:26:51');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 14:26:53');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-05 18:17:40');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 18:17:43');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 18:57:09');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-05 19:20:47');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 19:20:51');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 19:20:53');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 20:24:59');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 20:49:57');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-06 20:50:25');
INSERT INTO `sys_logininfor` VALUES (155, 'wangquan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：wangquan 不存在', '2023-02-06 20:50:38');
INSERT INTO `sys_logininfor` VALUES (156, '王权', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 20:50:52');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-06 21:00:24');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 21:00:29');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 21:00:30');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-06 21:13:49');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 21:14:16');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 21:40:37');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-06 21:57:21');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 21:57:22');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 20:52:23');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:01:30');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 21:01:31');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:01:33');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:11:17');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 21:11:20');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:11:29');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:26:25');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:26:30');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 21:26:30');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 19:45:03');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-08 19:57:18');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 19:57:23');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-08 20:02:33');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 20:02:33');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 20:09:50');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 20:13:22');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 21:11:08');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 22:36:47');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 22:36:48');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 22:36:51');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 23:08:27');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 23:51:02');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-10 19:22:54');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-10 20:05:39');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-10 21:09:30');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-10 21:09:40');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-10 22:07:17');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-10 22:07:23');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-11 12:47:29');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-11 13:02:59');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-11 14:06:44');
INSERT INTO `sys_logininfor` VALUES (197, 'wangquan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：wangquan 不存在', '2023-02-11 14:23:38');
INSERT INTO `sys_logininfor` VALUES (198, '王权', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 14:23:48');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-11 15:52:59');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-11 19:56:06');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-11 20:34:34');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 21:08:19');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-11 21:08:35');
INSERT INTO `sys_logininfor` VALUES (204, '王权', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 21:08:45');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-11 22:19:55');
INSERT INTO `sys_logininfor` VALUES (206, '王权', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 22:20:16');
INSERT INTO `sys_logininfor` VALUES (207, '王权', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-11 22:21:38');
INSERT INTO `sys_logininfor` VALUES (208, '王权', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 22:21:46');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-11 22:52:06');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 22:52:21');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-11 22:54:11');
INSERT INTO `sys_logininfor` VALUES (212, 'wangquan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：wangquan 不存在', '2023-02-11 22:54:20');
INSERT INTO `sys_logininfor` VALUES (213, '王权', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 22:54:27');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 22:54:51');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-11 22:55:16');
INSERT INTO `sys_logininfor` VALUES (216, 'wangquan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：wangquan 不存在', '2023-02-11 22:55:25');
INSERT INTO `sys_logininfor` VALUES (217, '王权', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 22:55:31');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-11 22:55:45');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-11 22:57:28');
INSERT INTO `sys_logininfor` VALUES (220, '王权', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-11 22:57:37');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-12 00:23:35');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-12 12:39:16');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-12 12:43:22');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-12 13:41:33');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-12 18:39:59');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-12 18:40:24');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-12 19:04:47');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-12 20:30:59');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 20:14:34');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 20:58:22');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 21:03:50');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 21:05:19');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 21:06:14');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 19:56:47');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 21:21:57');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-15 19:58:32');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-15 21:02:43');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-16 20:27:32');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-18 13:00:04');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 19:49:03');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 14:01:09');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-25 14:56:39');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-25 22:46:32');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-25 22:48:03');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-26 12:19:29');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-26 12:44:25');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-26 12:44:29');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-26 17:19:13');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-26 17:28:41');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2051 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-01-11 23:03:51', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-01-11 23:03:51', 'admin', '2023-01-11 23:14:01', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-01-11 23:03:51', 'admin', '2023-01-11 23:14:05', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-01-11 23:03:51', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-01-11 23:03:51', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-01-11 23:03:51', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '学院管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-01-11 23:03:51', 'admin', '2023-02-26 12:24:34', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '职位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-01-11 23:03:51', 'admin', '2023-02-26 12:28:05', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-01-11 23:03:51', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-01-11 23:03:51', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-01-11 23:03:51', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-01-11 23:03:51', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-01-11 23:03:51', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-01-11 23:03:51', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-01-11 23:03:51', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-01-11 23:03:51', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-01-11 23:03:51', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-01-11 23:03:51', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-01-11 23:03:51', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-01-11 23:03:51', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-01-11 23:03:51', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-01-11 23:03:51', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-01-11 23:03:51', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-01-11 23:03:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-01-11 23:03:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '图书管理', 0, 2, 'bkmgr', NULL, NULL, 1, 0, 'M', '0', '0', '', 'book', 'admin', '2023-01-11 23:09:06', 'admin', '2023-02-03 22:51:05', '');
INSERT INTO `sys_menu` VALUES (2031, '图书信息', 2018, 1, 'book', 'bkmgr/book/index', NULL, 1, 0, 'C', '0', '0', 'bkmgr:book:list', 'bookInfo', 'admin', '2023-01-17 20:50:07', 'admin', '2023-02-03 22:53:07', '图书信息菜单');
INSERT INTO `sys_menu` VALUES (2032, '图书信息查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:book:query', '#', 'admin', '2023-01-17 20:50:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '图书信息新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:book:add', '#', 'admin', '2023-01-17 20:50:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '图书信息修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:book:edit', '#', 'admin', '2023-01-17 20:50:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '图书信息删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:book:remove', '#', 'admin', '2023-01-17 20:50:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '图书信息导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:book:export', '#', 'admin', '2023-01-17 20:50:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '图书类型', 2018, 1, 'type', 'bkmgr/type/index', NULL, 1, 0, 'C', '0', '0', 'bkmgr:type:list', 'bookType', 'admin', '2023-01-17 21:42:05', 'admin', '2023-02-03 22:54:22', '图书类型菜单');
INSERT INTO `sys_menu` VALUES (2038, '图书类型查询', 2037, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:type:query', '#', 'admin', '2023-01-17 21:42:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '图书类型新增', 2037, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:type:add', '#', 'admin', '2023-01-17 21:42:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '图书类型修改', 2037, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:type:edit', '#', 'admin', '2023-01-17 21:42:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '图书类型删除', 2037, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:type:remove', '#', 'admin', '2023-01-17 21:42:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '图书类型导出', 2037, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:type:export', '#', 'admin', '2023-01-17 21:42:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '借用记录', 2018, 1, 'borrowRecord', 'bkmgr/borrowRecord/index', NULL, 1, 0, 'C', '0', '0', 'bkmgr:borrowRecord:list', 'record', 'admin', '2023-02-04 13:55:50', 'admin', '2023-02-04 14:01:00', '借用记录管理菜单');
INSERT INTO `sys_menu` VALUES (2044, '借用记录管理查询', 2043, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:borrowRecord:query', '#', 'admin', '2023-02-04 13:55:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '借用记录管理新增', 2043, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:borrowRecord:add', '#', 'admin', '2023-02-04 13:55:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '借用记录管理修改', 2043, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:borrowRecord:edit', '#', 'admin', '2023-02-04 13:55:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '借用记录管理删除', 2043, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:borrowRecord:remove', '#', 'admin', '2023-02-04 13:55:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '借用记录管理导出', 2043, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'bkmgr:borrowRecord:export', '#', 'admin', '2023-02-04 13:55:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '图书借用', 2031, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bkmgr:book:borrow', '#', 'admin', '2023-02-04 15:04:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '图书归还', 2031, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'bkmgr:book:return', '#', 'admin', '2023-02-11 13:29:03', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-01-10 19:05:33', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-01-10 19:05:33', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 350 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"wq_book\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 21:30:35');
INSERT INTO `sys_oper_log` VALUES (101, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"图书语言\",\"dictType\":\"wq_book_languag\",\"params\":{},\"remark\":\"图书语言\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 21:33:11');
INSERT INTO `sys_oper_log` VALUES (102, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"Chinese\",\"dictSort\":0,\"dictType\":\"wq_book_languag\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 21:33:49');
INSERT INTO `sys_oper_log` VALUES (103, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"English\",\"dictSort\":1,\"dictType\":\"wq_book_languag\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 21:34:06');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/wq_book', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 21:34:29');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"book\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:30:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 21:34:29\",\"usableColumn\":false},{\"capJavaField\":\"BookName\",\"columnComment\":\"图书名\",\"columnId\":2,\"columnName\":\"book_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:30:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"bookName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 21:34:29\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":3,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:30:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 21:34:29\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"图书编号\",\"columnId\":4,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:30:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 21:37:58');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wq_book\"}', NULL, 0, NULL, '2023-01-11 21:38:01');
INSERT INTO `sys_oper_log` VALUES (107, '图书管理', 1, 'com.ruoyi.book.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/book/book', '127.0.0.1', '内网IP', '{\"author\":\"王权\",\"bookName\":\"测试\",\"createTime\":\"2023-01-11 21:42:47.338\",\"description\":\"测试\",\"id\":1,\"language\":\"1\",\"number\":\"123456\",\"params\":{},\"price\":100,\"publishingHouse\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 21:42:47');
INSERT INTO `sys_oper_log` VALUES (108, '图书管理', 3, 'com.ruoyi.book.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/book/book/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 21:48:30');
INSERT INTO `sys_oper_log` VALUES (109, '图书管理', 1, 'com.ruoyi.book.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/book/book', '127.0.0.1', '内网IP', '{\"author\":\"测试\",\"bookName\":\"测试\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:48:46.482\",\"description\":\"测试\",\"id\":2,\"language\":\"1\",\"number\":\"123\",\"params\":{},\"price\":123,\"publishingHouse\":\"测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-11 21:48:46.482\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 21:48:46');
INSERT INTO `sys_oper_log` VALUES (110, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:33:11\",\"dictId\":100,\"dictName\":\"图书语言\",\"dictType\":\"wq_book_language\",\"params\":{},\"remark\":\"图书语言\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:00:35');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"book/book/index\",\"createTime\":\"2023-01-11 21:40:41\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"图书管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"book\",\"perms\":\"book:book:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:03:39');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"book_type_data\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:11:10');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"bookType\",\"className\":\"BookType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:11:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"图书类型\",\"columnId\":14,\"columnName\":\"type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:11:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Desc\",\"columnComment\":\"描述\",\"columnId\":15,\"columnName\":\"desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:11:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"desc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":16,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:11:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:13:24');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"book_type_data\"}', NULL, 0, NULL, '2023-01-11 22:13:28');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"book/bookList/index\",\"createTime\":\"2023-01-11 21:40:41\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"图书管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"book\",\"perms\":\"book:bookInfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:27:58');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:28:17');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:28:20');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:28:23');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:28:25');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:28:28');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/wq_book', '127.0.0.1', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2023-01-11 22:28:54');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:28:58');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"book_book_info\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:29:05');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"图书\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":20,\"columnName\":\"id\",\"columnType\":\"bigint(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BookName\",\"columnComment\":\"图书名\",\"columnId\":21,\"columnName\":\"book_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"bookName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":22,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"图书编号\",\"columnId\":23,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"number\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"qu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:30:00');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"book_book_info\"}', NULL, 0, NULL, '2023-01-11 22:30:03');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"bookList\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":20,\"columnName\":\"id\",\"columnType\":\"bigint(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 22:30:00\",\"usableColumn\":false},{\"capJavaField\":\"BookName\",\"columnComment\":\"图书名\",\"columnId\":21,\"columnName\":\"book_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"bookName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 22:30:00\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":22,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 22:30:00\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"图书编号\",\"columnId\":23,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 22:31:41');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"book_book_info\"}', NULL, 0, NULL, '2023-01-11 22:31:45');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"el-icon-notebook-2\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"book\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:09:06');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-11 23:09:06\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"图书管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"book\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:09:44');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"bookType\",\"className\":\"BookType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:11:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 22:13:24\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"图书类型\",\"columnId\":14,\"columnName\":\"type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:11:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 22:13:24\",\"usableColumn\":false},{\"capJavaField\":\"Desc\",\"columnComment\":\"描述\",\"columnId\":15,\"columnName\":\"desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:11:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"desc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 22:13:24\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":16,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:11:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"j', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:10:04');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"book_type_data\"}', NULL, 0, NULL, '2023-01-11 23:10:10');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"book_type_data\"}', NULL, 0, NULL, '2023-01-11 23:10:23');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"bookList\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":20,\"columnName\":\"id\",\"columnType\":\"bigint(30)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 22:31:41\",\"usableColumn\":false},{\"capJavaField\":\"BookName\",\"columnComment\":\"图书名\",\"columnId\":21,\"columnName\":\"book_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"bookName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 22:31:41\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":22,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-01-11 22:31:41\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"图书编号\",\"columnId\":23,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 22:29:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:12:27');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"book_book_info\"}', NULL, 0, NULL, '2023-01-11 23:12:30');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-11 23:09:06\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"图书管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"book\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:13:46');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-11 23:03:51\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:14:01');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-11 23:03:51\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:14:05');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-01-11 23:14:08');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-11 23:09:06\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"图书管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"book\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:14:24');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"book/bookList/index\",\"createTime\":\"2023-01-11 23:13:05\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"图书信息\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2018,\"path\":\"bookList\",\"perms\":\"book:bookList:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:14:52');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"book/bookType/index\",\"createTime\":\"2023-01-11 23:11:07\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"图书类型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"bookType\",\"perms\":\"book:bookType:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-11 23:14:57');
INSERT INTO `sys_oper_log` VALUES (142, '图书管理', 1, 'com.ruoyi.book.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/book/book', '127.0.0.1', '内网IP', '{\"author\":\"图书\",\"bookName\":\"图书\",\"description\":\"图书\",\"language\":\"1\",\"number\":\"123\",\"params\":{},\"price\":123,\"publishingHouse\":\"图书\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'name\' in \'where clause\'\r\n### The error may exist in file [D:\\java_app\\RuoYi-Vue\\wq_book\\target\\classes\\mapper\\book\\BookMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select book_id,                book_name,                author,                number,                publishing_house, language, description, price, create_time, update_time, create_by, update_by         from book_book_info               where name =?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'name\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'name\' in \'where clause\'', '2023-01-12 23:33:45');
INSERT INTO `sys_oper_log` VALUES (143, '图书管理', 1, 'com.ruoyi.book.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/book/book', '127.0.0.1', '内网IP', '{\"author\":\"图书\",\"bookName\":\"图书\",\"createBy\":\"admin\",\"createTime\":\"2023-01-12 23:35:02.552\",\"description\":\"图书\",\"language\":\"1\",\"number\":\"123\",\"params\":{},\"price\":123,\"publishingHouse\":\"图书\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-12 23:35:02.552\"}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'id\' in \'com.ruoyi.book.domain.Book\'.', '2023-01-12 23:35:02');
INSERT INTO `sys_oper_log` VALUES (144, '图书管理', 1, 'com.ruoyi.book.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/book/book', '127.0.0.1', '内网IP', '{\"author\":\"图书\",\"bookName\":\"图书\",\"description\":\"图书\",\"language\":\"1\",\"number\":\"123\",\"params\":{},\"price\":123,\"publishingHouse\":\"图书\"}', NULL, 1, '添加失败：图书名重复', '2023-01-12 23:35:31');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 20:35:00');
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-01-10 19:05:31\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:35:17');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:35:30');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2025', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-01-17 20:35:33');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2026', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:35:39');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:35:41');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2027', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:35:46');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2029', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:35:49');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2030', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:35:51');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2025', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:35:54');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2020', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:35:59');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2021', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:36:01');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2022', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:36:03');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2023', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:36:06');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2024', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:36:08');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2019', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:36:12');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/book_type_data', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:37:28');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:37:33');
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:37:36');
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"bkmgr_book_type,bkmgr_book,bkmgr_type\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:38:57');
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"bkmgr\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"BookId\",\"columnComment\":\"id\",\"columnId\":33,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BookName\",\"columnComment\":\"图书名\",\"columnId\":34,\"columnName\":\"book_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"bookName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":35,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"图书编号\",\"columnId\":36,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"number\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:41:55');
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bkmgr_book\"}', NULL, 0, NULL, '2023-01-17 20:42:00');
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"book\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"BookId\",\"columnComment\":\"id\",\"columnId\":33,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-01-17 20:41:54\",\"usableColumn\":false},{\"capJavaField\":\"BookName\",\"columnComment\":\"图书名\",\"columnId\":34,\"columnName\":\"book_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"bookName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-01-17 20:41:54\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":35,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-01-17 20:41:54\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"图书编号\",\"columnId\":36,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:45:33');
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bkmgr_book\"}', NULL, 0, NULL, '2023-01-17 20:46:35');
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"book\",\"className\":\"Book\",\"columns\":[{\"capJavaField\":\"BookId\",\"columnComment\":\"id\",\"columnId\":33,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-01-17 20:45:32\",\"usableColumn\":false},{\"capJavaField\":\"BookName\",\"columnComment\":\"图书名\",\"columnId\":34,\"columnName\":\"book_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"bookName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-01-17 20:45:32\",\"usableColumn\":false},{\"capJavaField\":\"Author\",\"columnComment\":\"作者\",\"columnId\":35,\"columnName\":\"author\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"author\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-01-17 20:45:33\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"图书编号\",\"columnId\":36,\"columnName\":\"number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:56:52');
INSERT INTO `sys_oper_log` VALUES (170, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"author\",\"bookId\":4,\"bookName\":\"book\",\"createTime\":\"2023-01-17 20:59:38.993\",\"language\":\"1\",\"number\":\"123123\",\"params\":{},\"price\":123,\"publishingHouse\":\"chubanshe\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 20:59:39');
INSERT INTO `sys_oper_log` VALUES (171, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"aaaa\",\"bookName\":\"aaaaa\",\"description\":\"aaa\",\"language\":\"1\",\"number\":\"123\",\"params\":{},\"price\":123,\"publishingHouse\":\"aaaa\"}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2023-01-17 21:18:41');
INSERT INTO `sys_oper_log` VALUES (172, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"aaaa\",\"bookName\":\"aaaaa\",\"description\":\"aaa\",\"language\":\"1\",\"number\":\"123123\",\"params\":{},\"price\":123,\"publishingHouse\":\"aaaa\"}', NULL, 1, '图书编号已存在', '2023-01-17 21:18:50');
INSERT INTO `sys_oper_log` VALUES (173, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 21:19:36');
INSERT INTO `sys_oper_log` VALUES (174, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"测试\",\"bookId\":5,\"bookName\":\"测试图书\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 21:19:56.902\",\"description\":\"描述\",\"language\":\"2\",\"number\":\"123123\",\"params\":{},\"price\":123,\"publishingHouse\":\"出版社\",\"updateBy\":\"admin\",\"updateTime\":\"2023-01-17 21:19:56.902\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 21:19:57');
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"BookType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"id\",\"columnId\":48,\"columnName\":\"type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"图书类型\",\"columnId\":49,\"columnName\":\"type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Desc\",\"columnComment\":\"描述\",\"columnId\":50,\"columnName\":\"desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"desc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":51,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-01-17 21:38:49');
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"bkmgr_type\"}', NULL, 0, NULL, '2023-01-17 21:38:53');
INSERT INTO `sys_oper_log` VALUES (177, '图书类型', 2, 'com.ruoyi.bkmgr.controller.BookTypeController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/type', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-01-10 23:25:56\",\"desc\":\"测试3\",\"params\":{},\"type\":\"测试3\",\"typeId\":3,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 20:33:31\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'测试3\',\n            create_time = \'2023-01-10 23:25:56\',\n            u\' at line 3\r\n### The error may exist in file [D:\\java_apps\\RuoYi-Vue\\ruoyi-bookmanager\\target\\classes\\mapper\\bkmgr\\BookTypeMapper.xml]\r\n### The error may involve com.ruoyi.bkmgr.mapper.BookTypeMapper.updateBookType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update bkmgr_type          SET type = ?,             desc = ?,             create_time = ?,             update_time = ?,                          update_by = ?          where type_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'测试3\',\n            create_time = \'2023-01-10 23:25:56\',\n            u\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'测试3\',\n            create_time = \'2023-01-10 23:25:56\',\n            u\' at line 3', '2023-02-01 20:33:32');
INSERT INTO `sys_oper_log` VALUES (178, '图书类型', 2, 'com.ruoyi.bkmgr.controller.BookTypeController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/type', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-01-10 23:25:56\",\"desc\":\"测试3\",\"params\":{},\"type\":\"测试3\",\"typeId\":3,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 20:34:07\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'测试3\',\n            create_time = \'2023-01-10 23:25:56\',\n            u\' at line 3\r\n### The error may exist in file [D:\\java_apps\\RuoYi-Vue\\ruoyi-bookmanager\\target\\classes\\mapper\\bkmgr\\BookTypeMapper.xml]\r\n### The error may involve com.ruoyi.bkmgr.mapper.BookTypeMapper.updateBookType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update bkmgr_type          SET type = ?,             desc = ?,             create_time = ?,             update_time = ?,                          update_by = ?          where type_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'测试3\',\n            create_time = \'2023-01-10 23:25:56\',\n            u\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'测试3\',\n            create_time = \'2023-01-10 23:25:56\',\n            u\' at line 3', '2023-02-01 20:34:09');
INSERT INTO `sys_oper_log` VALUES (179, '图书类型', 2, 'com.ruoyi.bkmgr.controller.BookTypeController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/type', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-01-10 23:25:56\",\"desc\":\"测试3\",\"params\":{},\"type\":\"测试3\",\"typeId\":3,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 20:34:15\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'测试3\',\n            create_time = \'2023-01-10 23:25:56\',\n            u\' at line 3\r\n### The error may exist in file [D:\\java_apps\\RuoYi-Vue\\ruoyi-bookmanager\\target\\classes\\mapper\\bkmgr\\BookTypeMapper.xml]\r\n### The error may involve com.ruoyi.bkmgr.mapper.BookTypeMapper.updateBookType-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update bkmgr_type          SET type = ?,             desc = ?,             create_time = ?,             update_time = ?,                          update_by = ?          where type_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'测试3\',\n            create_time = \'2023-01-10 23:25:56\',\n            u\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'desc = \'测试3\',\n            create_time = \'2023-01-10 23:25:56\',\n            u\' at line 3', '2023-02-01 20:34:16');
INSERT INTO `sys_oper_log` VALUES (180, '图书类型', 2, 'com.ruoyi.bkmgr.controller.BookTypeController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/type', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-01-10 23:25:56\",\"desc\":\"测试3\",\"params\":{},\"type\":\"测试3\",\"typeId\":3,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-01 20:37:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-01 20:37:09');
INSERT INTO `sys_oper_log` VALUES (181, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-02-03 21:30:22');
INSERT INTO `sys_oper_log` VALUES (182, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, 'com.ruoyi.bkmgr.domain.BookType cannot be cast to com.ruoyi.bkmgr.domain.dto.BookTypeDto', '2023-02-03 22:32:17');
INSERT INTO `sys_oper_log` VALUES (183, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, 'com.ruoyi.bkmgr.domain.BookType cannot be cast to com.ruoyi.bkmgr.domain.dto.BookTypeDto', '2023-02-03 22:34:01');
INSERT INTO `sys_oper_log` VALUES (184, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '', '2023-02-03 22:39:09');
INSERT INTO `sys_oper_log` VALUES (185, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '', '2023-02-03 22:43:02');
INSERT INTO `sys_oper_log` VALUES (186, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '', '2023-02-03 22:44:47');
INSERT INTO `sys_oper_log` VALUES (187, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-02-03 22:46:28');
INSERT INTO `sys_oper_log` VALUES (188, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-02-03 22:47:35');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-01-11 23:09:06\",\"icon\":\"book\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"图书管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"bkmgr\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-03 22:51:05');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bkmgr/book/index\",\"createTime\":\"2023-01-17 20:50:07\",\"icon\":\"bookInfo\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"图书信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"book\",\"perms\":\"bkmgr:book:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-03 22:53:07');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bkmgr/type/index\",\"createTime\":\"2023-01-17 21:42:05\",\"icon\":\"bookType\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"图书类型\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"type\",\"perms\":\"bkmgr:type:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-03 22:54:22');
INSERT INTO `sys_oper_log` VALUES (192, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-02-04 12:39:05');
INSERT INTO `sys_oper_log` VALUES (193, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"库存测试\",\"bookName\":\"库存测试\",\"description\":\"123\",\"inventory\":2,\"language\":\"1\",\"number\":\"1231232321321\",\"params\":{},\"price\":123,\"publishingHouse\":\"库存测试库存测试\"}', NULL, 1, '添加失败:图书编号已存在', '2023-02-04 13:24:34');
INSERT INTO `sys_oper_log` VALUES (194, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"库存测试\",\"bookName\":\"库存测试\",\"description\":\"123\",\"inventory\":2,\"language\":\"1\",\"number\":\"123123232132122\",\"params\":{},\"price\":123,\"publishingHouse\":\"库存测试库存测试\"}', NULL, 1, '添加失败:图书编号已存在', '2023-02-04 13:24:38');
INSERT INTO `sys_oper_log` VALUES (195, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"库存测试\",\"bookName\":\"库存测试\",\"description\":\"123\",\"inventory\":2,\"language\":\"1\",\"number\":\"22222\",\"params\":{},\"price\":123,\"publishingHouse\":\"库存测试库存测试\"}', NULL, 1, '添加失败:图书编号已存在', '2023-02-04 13:25:12');
INSERT INTO `sys_oper_log` VALUES (196, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"库存测试\",\"bookId\":6,\"bookName\":\"库存测试\",\"createBy\":\"admin\",\"createTime\":\"2023-02-04 13:27:37\",\"inventory\":222,\"language\":\"1\",\"number\":\"1212312312312\",\"params\":{},\"price\":123,\"publishingHouse\":\"库存测试库存测试库存测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-04 13:27:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-04 13:27:48');
INSERT INTO `sys_oper_log` VALUES (197, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"库存测试\",\"bookId\":6,\"bookName\":\"库存测试\",\"createBy\":\"admin\",\"createTime\":\"2023-02-04 13:27:38\",\"description\":\"11\",\"inventory\":2222,\"language\":\"1\",\"number\":\"1212312312312\",\"params\":{},\"price\":123,\"publishingHouse\":\"库存测试库存测试库存测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-04 13:28:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-04 13:28:15');
INSERT INTO `sys_oper_log` VALUES (198, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"inventory\":0,\"params\":{}}', NULL, 0, NULL, '2023-02-04 13:29:45');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"bkmgr_borrow_record\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-04 13:45:54');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"borrowRecord\",\"className\":\"BorrowRecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":55,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-02-04 13:45:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BookId\",\"columnComment\":\"图书id\",\"columnId\":56,\"columnName\":\"book_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-02-04 13:45:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BorrowTime\",\"columnComment\":\"借用时间\",\"columnId\":57,\"columnName\":\"borrow_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-02-04 13:45:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"borrowTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ReturnTime\",\"columnComment\":\"归还时间\",\"columnId\":58,\"columnName\":\"return_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-02-04 13:45:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"returnTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":f', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-04 13:48:15');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bkmgr/borrowRecord/index\",\"createTime\":\"2023-02-04 13:55:50\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"借用记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"borrowRecord\",\"perms\":\"bkmgr:borrowRecord:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-04 13:59:34');
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"bkmgr/borrowRecord/index\",\"createTime\":\"2023-02-04 13:55:50\",\"icon\":\"record\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"借用记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"borrowRecord\",\"perms\":\"bkmgr:borrowRecord:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-04 14:01:00');
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"图书借用\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2031,\"perms\":\"bkmgr:book:borrow\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-04 15:04:18');
INSERT INTO `sys_oper_log` VALUES (204, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"123\"]', '{\"msg\":\"图书 测试 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:13:10');
INSERT INTO `sys_oper_log` VALUES (205, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"123\"]', '{\"msg\":\"图书 测试 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:13:30');
INSERT INTO `sys_oper_log` VALUES (206, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"123\"]', '{\"msg\":\"0、图书 测试 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:14:51');
INSERT INTO `sys_oper_log` VALUES (207, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"123\"]', '{\"msg\":\"1、图书 测试 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:15:26');
INSERT INTO `sys_oper_log` VALUES (208, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"123\"]', '{\"msg\":\"1、图书 《测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:17:19');
INSERT INTO `sys_oper_log` VALUES (209, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"123\"]', '{\"msg\":\"1、图书 《测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:17:46');
INSERT INTO `sys_oper_log` VALUES (210, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:17:50');
INSERT INTO `sys_oper_log` VALUES (211, '借用记录管理', 3, 'com.ruoyi.bkmgr.controller.BorrowRecordController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/borrowRecord/1,2,3,4,5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-05 14:18:04');
INSERT INTO `sys_oper_log` VALUES (212, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:18:10');
INSERT INTO `sys_oper_log` VALUES (213, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:18:56');
INSERT INTO `sys_oper_log` VALUES (214, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:19:13');
INSERT INTO `sys_oper_log` VALUES (215, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:20:10');
INSERT INTO `sys_oper_log` VALUES (216, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:21:07');
INSERT INTO `sys_oper_log` VALUES (217, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:21:18');
INSERT INTO `sys_oper_log` VALUES (218, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:21:21');
INSERT INTO `sys_oper_log` VALUES (219, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:26:50');
INSERT INTO `sys_oper_log` VALUES (220, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:27:00');
INSERT INTO `sys_oper_log` VALUES (221, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-05 14:27:08');
INSERT INTO `sys_oper_log` VALUES (222, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/02/06/blob_20230206202546A001.png\",\"code\":200}', 0, NULL, '2023-02-06 20:25:46');
INSERT INTO `sys_oper_log` VALUES (223, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"wangquan\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-06 20:48:40');
INSERT INTO `sys_oper_log` VALUES (224, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/02/06/blob_20230206214710A001.png\",\"code\":200}', 0, NULL, '2023-02-06 21:47:11');
INSERT INTO `sys_oper_log` VALUES (225, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/02/06/blob_20230206215200A002.png\",\"code\":200}', 0, NULL, '2023-02-06 21:52:01');
INSERT INTO `sys_oper_log` VALUES (226, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/1', '127.0.0.1', '内网IP', '1', '{\"msg\":\"上传图片异常，请联系管理员\",\"code\":500}', 0, NULL, '2023-02-06 21:58:00');
INSERT INTO `sys_oper_log` VALUES (227, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/02/07/blob_20230207210211A001.png\",\"code\":200}', 0, NULL, '2023-02-07 21:02:20');
INSERT INTO `sys_oper_log` VALUES (228, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/07/blob_20230207214234A002.png\",\"code\":200}', 0, NULL, '2023-02-07 21:42:34');
INSERT INTO `sys_oper_log` VALUES (229, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/07/blob_20230207214327A003.png\",\"code\":200}', 0, NULL, '2023-02-07 21:43:27');
INSERT INTO `sys_oper_log` VALUES (230, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/07/blob_20230207214801A004.png\",\"code\":200}', 0, NULL, '2023-02-07 21:48:01');
INSERT INTO `sys_oper_log` VALUES (231, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/07/blob_20230207214921A005.png\",\"code\":200}', 0, NULL, '2023-02-07 21:49:21');
INSERT INTO `sys_oper_log` VALUES (232, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"123\"]', '{\"msg\":\"1、图书 《测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-08 19:45:31');
INSERT INTO `sys_oper_log` VALUES (233, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-08 19:45:43');
INSERT INTO `sys_oper_log` VALUES (234, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-08 19:45:50');
INSERT INTO `sys_oper_log` VALUES (235, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"123\"]', '{\"msg\":\"1、图书 《测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-08 19:46:35');
INSERT INTO `sys_oper_log` VALUES (236, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"类型\",\"bookId\":7,\"bookName\":\"类型添加测试\",\"bookTypes\":[1,4,5],\"createBy\":\"admin\",\"createTime\":\"2023-02-08 21:05:30\",\"inventory\":2,\"language\":\"1\",\"number\":\"123321123321\",\"params\":{},\"price\":233,\"publishingHouse\":\"出版社\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:05:30\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \',  \n            (7,1)\n          \n            (7,4)\n          \n            (7,5)\' at line 2\r\n### The error may exist in file [D:\\java_apps\\RuoYi-Vue\\ruoyi-bookmanager\\target\\classes\\mapper\\bkmgr\\BookTypeMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into bkmgr_book_type(book_id, book_type_id) values          ,               (?,?)                        (?,?)                        (?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \',  \n            (7,1)\n          \n            (7,4)\n          \n            (7,5)\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \',  \n            (7,1)\n          \n            (7,4)\n          \n            (7,5)\' at line 2', '2023-02-08 21:05:40');
INSERT INTO `sys_oper_log` VALUES (237, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"类型测试图书\",\"bookId\":8,\"bookName\":\"类型测试\",\"bookTypes\":[7,3,5],\"createBy\":\"admin\",\"createTime\":\"2023-02-08 21:07:19\",\"inventory\":2,\"language\":\"1\",\"number\":\"12312321412421\",\"params\":{},\"price\":222,\"publishingHouse\":\"出版社测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:07:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:07:20');
INSERT INTO `sys_oper_log` VALUES (238, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/6', '127.0.0.1', '内网IP', '6', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/08/blob_20230208210740A001.png\",\"code\":200}', 0, NULL, '2023-02-08 21:07:41');
INSERT INTO `sys_oper_log` VALUES (239, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"作者\",\"bookId\":9,\"bookName\":\"测试第二次\",\"createBy\":\"admin\",\"createTime\":\"2023-02-08 21:20:32\",\"inventory\":0,\"language\":\"1\",\"number\":\"1233212354412321\",\"params\":{},\"price\":123,\"publishingHouse\":\"出版社\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:20:32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:20:33');
INSERT INTO `sys_oper_log` VALUES (240, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"测试\",\"bookCover\":\"/profile/bookCover/2023/02/07/blob_20230207214921A005.png\",\"bookId\":2,\"bookName\":\"测试\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:48:46\",\"description\":\"测试\",\"inventory\":0,\"language\":\"1\",\"number\":\"123\",\"params\":{},\"price\":123,\"publishingHouse\":\"测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:27:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:27:05');
INSERT INTO `sys_oper_log` VALUES (241, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"测试\",\"bookCover\":\"/profile/bookCover/2023/02/07/blob_20230207214921A005.png\",\"bookId\":2,\"bookName\":\"测试\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:48:46\",\"description\":\"测试\",\"inventory\":0,\"language\":\"1\",\"number\":\"123\",\"params\":{},\"price\":123,\"publishingHouse\":\"测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:27:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:27:41');
INSERT INTO `sys_oper_log` VALUES (242, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"测试\",\"bookCover\":\"/profile/bookCover/2023/02/07/blob_20230207214921A005.png\",\"bookId\":2,\"bookName\":\"测试\",\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:48:46\",\"description\":\"测试\",\"inventory\":0,\"language\":\"1\",\"number\":\"123\",\"params\":{},\"price\":123,\"publishingHouse\":\"测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:28:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:28:11');
INSERT INTO `sys_oper_log` VALUES (243, '图书信息', 1, 'com.ruoyi.bkmgr.controller.BookController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"最后测试\",\"bookId\":10,\"bookName\":\"最后测试\",\"createBy\":\"admin\",\"createTime\":\"2023-02-08 21:28:32\",\"inventory\":1,\"language\":\"1\",\"number\":\"22222222\",\"params\":{},\"price\":22,\"publishingHouse\":\"最后测试最后测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:28:32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:28:33');
INSERT INTO `sys_oper_log` VALUES (244, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"最后测试\",\"bookId\":10,\"bookName\":\"最后测试\",\"bookTypeIds\":[2,3,4],\"createBy\":\"admin\",\"createTime\":\"2023-02-08 21:28:32\",\"inventory\":1,\"language\":\"1\",\"number\":\"22222222\",\"params\":{},\"price\":22,\"publishingHouse\":\"最后测试最后测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:29:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:29:46');
INSERT INTO `sys_oper_log` VALUES (245, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"最后测试\",\"bookId\":10,\"bookName\":\"最后测试\",\"bookTypeIds\":[],\"createBy\":\"admin\",\"createTime\":\"2023-02-08 21:28:32\",\"inventory\":1,\"language\":\"1\",\"number\":\"22222222\",\"params\":{},\"price\":22,\"publishingHouse\":\"最后测试最后测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:29:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:29:57');
INSERT INTO `sys_oper_log` VALUES (246, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"测试\",\"bookCover\":\"/profile/bookCover/2023/02/07/blob_20230207214921A005.png\",\"bookId\":2,\"bookName\":\"测试\",\"bookTypeIds\":[1],\"createBy\":\"admin\",\"createTime\":\"2023-01-11 21:48:46\",\"description\":\"测试\",\"inventory\":0,\"language\":\"1\",\"number\":\"123\",\"params\":{},\"price\":123,\"publishingHouse\":\"测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:30:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:30:53');
INSERT INTO `sys_oper_log` VALUES (247, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"图书\",\"bookCover\":\"/profile/avatar/2023/02/07/blob_20230207210211A001.png\",\"bookId\":3,\"bookName\":\"图书\",\"bookTypeIds\":[1,2],\"createBy\":\"admin\",\"createTime\":\"2023-01-12 23:35:03\",\"description\":\"图书\",\"inventory\":0,\"language\":\"1\",\"number\":\"1234\",\"params\":{},\"price\":123,\"publishingHouse\":\"图书\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-08 21:31:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-08 21:31:21');
INSERT INTO `sys_oper_log` VALUES (248, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/08/blob_20230208213548A001.png\",\"code\":200}', 0, NULL, '2023-02-08 21:35:49');
INSERT INTO `sys_oper_log` VALUES (249, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"inventory\":0,\"params\":{}}', NULL, 0, NULL, '2023-02-09 22:37:37');
INSERT INTO `sys_oper_log` VALUES (250, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"22222222\"]', '{\"msg\":\"1、图书 《最后测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-09 22:38:15');
INSERT INTO `sys_oper_log` VALUES (251, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"22222222\"]', '{\"msg\":\"1、图书 《最后测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-09 22:38:19');
INSERT INTO `sys_oper_log` VALUES (252, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1、图书 《库存测试》 删除失败 原因：已被借用<br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:09:34');
INSERT INTO `sys_oper_log` VALUES (253, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:10:35');
INSERT INTO `sys_oper_log` VALUES (254, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1、图书 《库存测试》 删除失败 原因：已被借用<br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:10:39');
INSERT INTO `sys_oper_log` VALUES (255, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1、图书 《库存测试》 删除失败 原因：已被借用<br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:12:13');
INSERT INTO `sys_oper_log` VALUES (256, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:12:57');
INSERT INTO `sys_oper_log` VALUES (257, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1、图书 《库存测试》 删除失败 原因：已被借用<br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:13:01');
INSERT INTO `sys_oper_log` VALUES (258, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1、图书 《库存测试》 删除失败 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:51:13');
INSERT INTO `sys_oper_log` VALUES (259, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:图书 《库存测试》 删除失败 原因 <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:52:12');
INSERT INTO `sys_oper_log` VALUES (260, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:《库存测试》 删除失败 原因 <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:53:02');
INSERT INTO `sys_oper_log` VALUES (261, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:《库存测试》 删除失败。 原因 -><span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:54:20');
INSERT INTO `sys_oper_log` VALUES (262, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1、图书 《测试图书》 删除成功<br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:55:25');
INSERT INTO `sys_oper_log` VALUES (263, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/3,6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:《库存测试》 删除失败。 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-09 23:55:38');
INSERT INTO `sys_oper_log` VALUES (264, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:图书 《测试》 删除成功<br/>\",\"code\":200}', 0, NULL, '2023-02-10 00:02:03');
INSERT INTO `sys_oper_log` VALUES (265, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:图书 《库存测试》 删除失败。 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 00:02:48');
INSERT INTO `sys_oper_log` VALUES (266, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:图书 《库存测试》 删除失败。 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 00:02:55');
INSERT INTO `sys_oper_log` VALUES (267, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6,10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:图书 《库存测试》 删除失败。 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>2:图书 《最后测试》 删除失败。 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 00:03:05');
INSERT INTO `sys_oper_log` VALUES (268, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/6,9,10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:图书 《库存测试》 删除失败。 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>2:图书 《测试第二次》 删除成功<br/>3:图书 《最后测试》 删除失败。 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 00:03:22');
INSERT INTO `sys_oper_log` VALUES (269, '图书类型', 3, 'com.ruoyi.bkmgr.controller.BookTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/type/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 20:16:21');
INSERT INTO `sys_oper_log` VALUES (270, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"BookType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"id\",\"columnId\":48,\"columnName\":\"type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-01-17 21:38:49\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"图书类型\",\"columnId\":49,\"columnName\":\"type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-01-17 21:38:49\",\"usableColumn\":false},{\"capJavaField\":\"Desc\",\"columnComment\":\"描述\",\"columnId\":50,\"columnName\":\"desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"desc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-01-17 21:38:49\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":51,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"0\",\"javaField\":\"createTi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 20:18:49');
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"BookType\",\"columns\":[{\"capJavaField\":\"TypeId\",\"columnComment\":\"id\",\"columnId\":48,\"columnName\":\"type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-02-10 20:18:49\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"图书类型\",\"columnId\":49,\"columnName\":\"type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-02-10 20:18:49\",\"usableColumn\":false},{\"capJavaField\":\"Desc\",\"columnComment\":\"描述\",\"columnId\":50,\"columnName\":\"desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"desc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-02-10 20:18:49\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":51,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-01-17 20:38:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"0\",\"javaField\":\"createTim', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 20:21:05');
INSERT INTO `sys_oper_log` VALUES (272, '图书类型', 1, 'com.ruoyi.bkmgr.controller.BookTypeController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-02-10 20:30:04\",\"desc\":\"123\",\"params\":{},\"type\":\"测试测试\",\"typeId\":10,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-10 20:30:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 20:30:04');
INSERT INTO `sys_oper_log` VALUES (273, '图书类型', 5, 'com.ruoyi.bkmgr.controller.BookTypeController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/type/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-02-10 20:31:23');
INSERT INTO `sys_oper_log` VALUES (274, '图书类型', 5, 'com.ruoyi.bkmgr.controller.BookTypeController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/type/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-02-10 20:37:08');
INSERT INTO `sys_oper_log` VALUES (275, '图书类型', 5, 'com.ruoyi.bkmgr.controller.BookTypeController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/type/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-02-10 20:38:12');
INSERT INTO `sys_oper_log` VALUES (276, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"12312321412421\"]', '{\"msg\":\"1、图书 《类型测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-10 20:38:51');
INSERT INTO `sys_oper_log` VALUES (277, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"inventory\":0,\"params\":{}}', NULL, 0, NULL, '2023-02-10 20:52:44');
INSERT INTO `sys_oper_log` VALUES (278, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\",\"12312321412421\"]', '{\"msg\":\"1、图书 《库存测试》 借用成功<br/>2、图书 《类型测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-10 21:30:04');
INSERT INTO `sys_oper_log` VALUES (279, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[]', '{\"msg\":\"借用列表为空\",\"code\":200}', 0, NULL, '2023-02-10 21:30:07');
INSERT INTO `sys_oper_log` VALUES (280, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\",\"12312321412421\",\"22222222\"]', '{\"msg\":\"1、图书 《最后测试》 库存不足<br/>2、图书 《类型测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-10 21:30:53');
INSERT INTO `sys_oper_log` VALUES (281, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[]', '{\"msg\":\"借用列表为空\",\"code\":200}', 0, NULL, '2023-02-10 21:31:01');
INSERT INTO `sys_oper_log` VALUES (282, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\",\"12312321412421\",\"22222222\"]', '{\"msg\":\"1、图书 《最后测试》 库存不足<br/>2、图书 《类型测试》 库存不足<br/>\",\"code\":200}', 0, NULL, '2023-02-10 21:44:00');
INSERT INTO `sys_oper_log` VALUES (283, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\",\"12312321412421\",\"22222222\"]', '{\"msg\":\"1:图书 《库存测试》 借用成功<br/>2:图书 《最后测试》 借用失败 原因: <span style=\\\"color: red\\\">当前图书库存不足</span><br/>3:图书 《类型测试》 借用失败 原因: <span style=\\\"color: red\\\">当前图书库存不足</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 21:49:25');
INSERT INTO `sys_oper_log` VALUES (284, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\",\"12312321412421\",\"22222222\"]', '{\"msg\":\"0:图书 《库存测试》 借用成功<br/>1:图书 《最后测试》 借用失败 原因: <span style=\\\"color: red\\\">当前图书库存不足</span><br/>2:图书 《类型测试》 借用失败 原因: <span style=\\\"color: red\\\">当前图书库存不足</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 21:51:09');
INSERT INTO `sys_oper_log` VALUES (285, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\",\"12312321412421\",\"22222222\"]', '{\"msg\":\"1:图书 《库存测试》 借用成功<br/>2:图书 《最后测试》 借用失败 原因: <span style=\\\"color: red\\\">当前图书库存不足</span><br/>3:图书 《类型测试》 借用失败 原因: <span style=\\\"color: red\\\">当前图书库存不足</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 21:52:11');
INSERT INTO `sys_oper_log` VALUES (286, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:图书 《最后测试》 删除失败。 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 21:52:32');
INSERT INTO `sys_oper_log` VALUES (287, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/book/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"1:图书 《类型测试》 删除失败。 原因: <span style=\\\"color: red\\\">图书已被借用</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 21:52:40');
INSERT INTO `sys_oper_log` VALUES (288, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\",\"12312321412421\",\"22222222\"]', '{\"msg\":\"1:图书 《库存测试》 借用成功<br/>2:图书 《最后测试》 借用失败 原因: <span style=\\\"color: red\\\">当前图书库存不足</span><br/>3:图书 《类型测试》 借用失败 原因: <span style=\\\"color: red\\\">当前图书库存不足</span><br/>\",\"code\":200}', 0, NULL, '2023-02-10 21:54:53');
INSERT INTO `sys_oper_log` VALUES (289, '图书类型', 3, 'com.ruoyi.bkmgr.controller.BookTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/type/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 21:55:40');
INSERT INTO `sys_oper_log` VALUES (290, '图书类型', 3, 'com.ruoyi.bkmgr.controller.BookTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/type/4,5,6,7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 21:55:48');
INSERT INTO `sys_oper_log` VALUES (291, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"库存测试\",\"bookCover\":\"/profile/bookCover/2023/02/08/blob_20230208210740A001.png\",\"bookId\":6,\"bookName\":\"库存测试\",\"bookTypeIds\":[1,2,3,10],\"createBy\":\"admin\",\"createTime\":\"2023-02-04 13:27:38\",\"description\":\"11\",\"inventory\":2200,\"language\":\"1\",\"number\":\"1212312312312\",\"params\":{},\"price\":123,\"publishingHouse\":\"库存测试库存测试库存测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-10 22:00:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 22:00:43');
INSERT INTO `sys_oper_log` VALUES (292, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"类型测试图书\",\"bookId\":8,\"bookName\":\"类型测试\",\"bookTypeIds\":[1],\"createBy\":\"admin\",\"createTime\":\"2023-02-08 21:07:19\",\"inventory\":0,\"language\":\"1\",\"number\":\"12312321412421\",\"params\":{},\"price\":222,\"publishingHouse\":\"出版社测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-10 22:01:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 22:01:09');
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"图书归还\",\"menuType\":\"F\",\"orderNum\":7,\"params\":{},\"parentId\":2031,\"perms\":\"bkmgr:book:return\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 13:29:03');
INSERT INTO `sys_oper_log` VALUES (294, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2018,2031,2032,2033,2034,2035,2036,2049,2050,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":3,\"roleKey\":\"book-admin\",\"roleName\":\"图书管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 14:23:12');
INSERT INTO `sys_oper_log` VALUES (295, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-06 20:50:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[3],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 14:23:20');
INSERT INTO `sys_oper_log` VALUES (296, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1:图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-11 14:38:31');
INSERT INTO `sys_oper_log` VALUES (297, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1:图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-11 14:38:34');
INSERT INTO `sys_oper_log` VALUES (298, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1:图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-11 14:38:43');
INSERT INTO `sys_oper_log` VALUES (299, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, '王权', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1:图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-11 14:39:07');
INSERT INTO `sys_oper_log` VALUES (300, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, '王权', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1:图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-11 14:40:14');
INSERT INTO `sys_oper_log` VALUES (301, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.bookBorrow()', 'POST', 1, 'admin', NULL, '/bkmgr/book/borrow/', '127.0.0.1', '内网IP', '[\"1212312312312\"]', '{\"msg\":\"1:图书 《库存测试》 借用成功<br/>\",\"code\":200}', 0, NULL, '2023-02-11 14:43:24');
INSERT INTO `sys_oper_log` VALUES (302, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/8', '127.0.0.1', '内网IP', '8', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/11/blob_20230211160218A001.png\",\"code\":200}', 0, NULL, '2023-02-11 16:02:18');
INSERT INTO `sys_oper_log` VALUES (303, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"inventory\":0,\"params\":{}}', NULL, 0, NULL, '2023-02-11 16:02:37');
INSERT INTO `sys_oper_log` VALUES (304, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2018,2031,2037,2043,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2032,2036,2049,2050,2038,2042,2044,2048,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":4,\"roleKey\":\"book-common\",\"roleName\":\"图书普通角色\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 21:10:40');
INSERT INTO `sys_oper_log` VALUES (305, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 21:08:46\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"book-admin\",\"roleName\":\"图书管理员\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 21:10:51');
INSERT INTO `sys_oper_log` VALUES (306, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 21:08:46\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"book-common\",\"roleName\":\"图书普通角色\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 21:13:06');
INSERT INTO `sys_oper_log` VALUES (307, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 22:20:17\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4,3,2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"book-common\",\"roleName\":\"图书普通角色\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 22:20:53');
INSERT INTO `sys_oper_log` VALUES (308, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 22:21:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"book-admin\",\"roleName\":\"图书管理员\",\"roleSort\":0,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"book-common\",\"roleName\":\"图书普通角色\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 22:53:03');
INSERT INTO `sys_oper_log` VALUES (309, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 22:21:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4,3],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"book-admin\",\"roleName\":\"图书管理员\",\"roleSort\":0,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"book-common\",\"roleName\":\"图书普通角色\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 22:53:49');
INSERT INTO `sys_oper_log` VALUES (310, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 22:21:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4,3,2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"book-admin\",\"roleName\":\"图书管理员\",\"roleSort\":0,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"book-common\",\"roleName\":\"图书普通角色\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 22:54:05');
INSERT INTO `sys_oper_log` VALUES (311, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 22:21:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"book-admin\",\"roleName\":\"图书管理员\",\"roleSort\":0,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"book-common\",\"roleName\":\"图书普通角色\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 22:54:41');
INSERT INTO `sys_oper_log` VALUES (312, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 22:21:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"book-common\",\"roleName\":\"图书普通角色\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 22:55:02');
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 22:55:31\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[3],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 22:55:38');
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 22:55:31\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"book-admin\",\"roleName\":\"图书管理员\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 22:56:49');
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-02-06 20:48:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2023-02-11 22:55:31\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wangquan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"book-common\",\"roleName\":\"图书普通角色\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"王权\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-11 22:57:02');
INSERT INTO `sys_oper_log` VALUES (316, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/6', '127.0.0.1', '内网IP', '6', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/12/blob_20230212002614A001.png\",\"code\":200}', 0, NULL, '2023-02-12 00:26:14');
INSERT INTO `sys_oper_log` VALUES (317, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"inventory\":0,\"params\":{}}', NULL, 0, NULL, '2023-02-12 00:26:25');
INSERT INTO `sys_oper_log` VALUES (318, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 12:40:20');
INSERT INTO `sys_oper_log` VALUES (319, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 12:40:23');
INSERT INTO `sys_oper_log` VALUES (320, '图书类型', 3, 'com.ruoyi.bkmgr.controller.BookTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/bkmgr/type/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 14:01:17');
INSERT INTO `sys_oper_log` VALUES (321, '图书信息', 2, 'com.ruoyi.bkmgr.controller.BookController.edit()', 'PUT', 1, 'admin', NULL, '/bkmgr/book', '127.0.0.1', '内网IP', '{\"author\":\"库存测试\",\"bookCover\":\"/profile/bookCover/2023/02/12/blob_20230212002614A001.png\",\"bookId\":6,\"bookName\":\"库存测试\",\"bookTypeIds\":[1,2],\"createBy\":\"admin\",\"createTime\":\"2023-02-04 13:27:38\",\"description\":\"11\",\"inventory\":2206,\"language\":\"1\",\"number\":\"1212312312312\",\"params\":{},\"price\":123,\"publishingHouse\":\"库存测试库存测试库存测试\",\"updateBy\":\"admin\",\"updateTime\":\"2023-02-12 19:20:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 19:20:03');
INSERT INTO `sys_oper_log` VALUES (322, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/6', '127.0.0.1', '内网IP', '6', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/13/blob_20230213211856A001.png\",\"code\":200}', 0, NULL, '2023-02-13 21:18:56');
INSERT INTO `sys_oper_log` VALUES (323, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"bkmgr_book_comment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 21:25:46');
INSERT INTO `sys_oper_log` VALUES (324, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comment\",\"className\":\"BookComment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":65,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-13 21:25:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BookId\",\"columnId\":66,\"columnName\":\"book_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-13 21:25:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"bookId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnId\":67,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-02-13 21:25:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Comment\",\"columnId\":68,\"columnName\":\"comment\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2023-02-13 21:25:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"comment\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 21:28:21');
INSERT INTO `sys_oper_log` VALUES (325, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/6', '127.0.0.1', '内网IP', '6', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/14/blob_20230214213718A001.png\",\"code\":200}', 0, NULL, '2023-02-14 21:37:18');
INSERT INTO `sys_oper_log` VALUES (326, '图书信息', 3, 'com.ruoyi.bkmgr.controller.BookController.updateBookCover()', 'POST', 1, 'admin', NULL, '/bkmgr/book/bookCover/6', '127.0.0.1', '内网IP', '6', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/bookCover/2023/02/16/blob_20230216203347A001.png\",\"code\":200}', 0, NULL, '2023-02-16 20:33:47');
INSERT INTO `sys_oper_log` VALUES (327, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-02-26 12:19:54');
INSERT INTO `sys_oper_log` VALUES (328, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-02-26 12:19:57');
INSERT INTO `sys_oper_log` VALUES (329, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"XX大学\",\"email\":\"xxx@xxx.com\",\"leader\":\"xxx\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:20:32');
INSERT INTO `sys_oper_log` VALUES (330, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"XXX学院\",\"email\":\"xxx@xxx.com\",\"leader\":\"xxx\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"XX大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:21:02');
INSERT INTO `sys_oper_log` VALUES (331, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"xxx班级1\",\"email\":\"xxx@xxx.com\",\"leader\":\"xxx\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"XXX学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:21:16');
INSERT INTO `sys_oper_log` VALUES (332, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"xxxx班级2\",\"email\":\"xxx@xxx.com\",\"leader\":\"xxx2\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"XXX学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:21:30');
INSERT INTO `sys_oper_log` VALUES (333, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-02-26 12:22:30');
INSERT INTO `sys_oper_log` VALUES (334, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"XXX班级3\",\"email\":\"xxx@xxx.com\",\"leader\":\"xxx\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"XXX学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:22:53');
INSERT INTO `sys_oper_log` VALUES (335, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:22:56');
INSERT INTO `sys_oper_log` VALUES (336, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:22:59');
INSERT INTO `sys_oper_log` VALUES (337, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-02-26 12:23:01');
INSERT INTO `sys_oper_log` VALUES (338, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:23:04');
INSERT INTO `sys_oper_log` VALUES (339, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:23:06');
INSERT INTO `sys_oper_log` VALUES (340, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"xxxx学院2\",\"email\":\"xxx@xxx.com\",\"leader\":\"xxx\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"XX大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:23:20');
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-01-11 23:03:51\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"学院管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:24:34');
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-01-11 23:03:51\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"职位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:28:05');
INSERT INTO `sys_oper_log` VALUES (343, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-10 19:05:31\",\"flag\":false,\"params\":{},\"postCode\":\"principal\",\"postId\":1,\"postName\":\"校长\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:29:31');
INSERT INTO `sys_oper_log` VALUES (344, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-10 19:05:31\",\"flag\":false,\"params\":{},\"postCode\":\"dean\",\"postId\":2,\"postName\":\"院长\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:29:46');
INSERT INTO `sys_oper_log` VALUES (345, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-10 19:05:31\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":3,\"postName\":\"老师\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:29:55');
INSERT INTO `sys_oper_log` VALUES (346, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-01-10 19:05:31\",\"flag\":false,\"params\":{},\"postCode\":\"student\",\"postId\":4,\"postName\":\"学生\",\"postSort\":4,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 12:30:05');
INSERT INTO `sys_oper_log` VALUES (347, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', NULL, '/system/post/export', '127.0.0.1', '内网IP', '{\"flag\":false,\"params\":{}}', NULL, 0, NULL, '2023-02-26 12:38:24');
INSERT INTO `sys_oper_log` VALUES (348, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', NULL, '/system/post/export', '127.0.0.1', '内网IP', '{\"flag\":false,\"params\":{}}', NULL, 0, NULL, '2023-02-26 12:41:45');
INSERT INTO `sys_oper_log` VALUES (349, '图书信息', 5, 'com.ruoyi.bkmgr.controller.BookController.export()', 'POST', 1, 'admin', NULL, '/bkmgr/book/export', '127.0.0.1', '内网IP', '{\"inventory\":0,\"params\":{}}', NULL, 0, NULL, '2023-02-26 13:22:24');
INSERT INTO `sys_oper_log` VALUES (350, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":32,\"comment\":\"123\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:09:26\",\"params\":{},\"star\":3,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:09:26\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:09:26');
INSERT INTO `sys_oper_log` VALUES (351, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":32,\"comment\":\"123WQW\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:11:17\",\"params\":{},\"star\":3,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:11:17\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:11:17');
INSERT INTO `sys_oper_log` VALUES (352, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"SDSADAS\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:11:49\",\"params\":{},\"star\":3,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:11:49\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:11:49');
INSERT INTO `sys_oper_log` VALUES (353, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"asdsa\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:32:56\",\"params\":{},\"recordId\":0,\"star\":0,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:32:56\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:32:56');
INSERT INTO `sys_oper_log` VALUES (354, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"sadasd\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:33:26\",\"params\":{},\"recordId\":0,\"star\":4,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:33:26\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:33:26');
INSERT INTO `sys_oper_log` VALUES (355, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"ssss\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:36:01\",\"params\":{},\"recordId\":0,\"star\":4,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:36:01\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:36:01');
INSERT INTO `sys_oper_log` VALUES (356, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"ss\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:36:21\",\"params\":{},\"recordId\":31,\"star\":3,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:36:21\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:36:21');
INSERT INTO `sys_oper_log` VALUES (357, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"ss\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:36:33\",\"params\":{},\"recordId\":32,\"star\":4,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:36:33\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:36:33');
INSERT INTO `sys_oper_log` VALUES (358, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"qq\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:37:21\",\"params\":{},\"recordId\":32,\"star\":4,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:37:21\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:37:21');
INSERT INTO `sys_oper_log` VALUES (359, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"sss\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:37:35\",\"params\":{},\"recordId\":31,\"star\":3,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:37:35\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:37:35');
INSERT INTO `sys_oper_log` VALUES (360, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"s\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:38:41\",\"params\":{},\"recordId\":32,\"star\":4,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:38:41\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:38:41');
INSERT INTO `sys_oper_log` VALUES (361, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"测试分享\",\"params\":{},\"recordId\":31,\"star\":4}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2023-02-26 14:44:03');
INSERT INTO `sys_oper_log` VALUES (362, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"测试分享\",\"params\":{},\"recordId\":31,\"star\":4}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2023-02-26 14:44:07');
INSERT INTO `sys_oper_log` VALUES (363, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"测试分享\",\"params\":{},\"recordId\":31,\"star\":4}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userId\' not found. Available parameters are [arg1, arg0, param1, param2]', '2023-02-26 14:44:13');
INSERT INTO `sys_oper_log` VALUES (364, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"测试分享\",\"params\":{},\"recordId\":31,\"star\":4}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'record_id\' not found. Available parameters are [recordId, userId, param1, param2]', '2023-02-26 14:45:04');
INSERT INTO `sys_oper_log` VALUES (365, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"测试分享\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:45:27\",\"params\":{},\"recordId\":31,\"star\":4,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:45:27\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:45:27');
INSERT INTO `sys_oper_log` VALUES (366, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"再次测试\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:46:03\",\"params\":{},\"recordId\":30,\"star\":4,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:46:03\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:46:03');
INSERT INTO `sys_oper_log` VALUES (367, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"cccc\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:46:36\",\"params\":{},\"recordId\":35,\"star\":5,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:46:36\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:46:36');
INSERT INTO `sys_oper_log` VALUES (368, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"sds\",\"params\":{},\"recordId\":35,\"star\":0}', NULL, 1, '分享失败，当前记录已经分享', '2023-02-26 14:47:08');
INSERT INTO `sys_oper_log` VALUES (369, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"qwe\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:48:05\",\"params\":{},\"recordId\":29,\"star\":4,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:48:05\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:48:05');
INSERT INTO `sys_oper_log` VALUES (370, '图书评论', 1, 'com.ruoyi.bkmgr.controller.BookCommentController.add()', 'POST', 1, 'admin', NULL, '/bkmgr/comment', '127.0.0.1', '内网IP', '{\"bookId\":6,\"comment\":\"dsadsa\",\"createBy\":\"admin\",\"createTime\":\"2023-02-26 14:48:15\",\"params\":{},\"recordId\":15,\"star\":4,\"updateBy\":\"admin\",\"updateTime\":\"2023-02-26 14:48:15\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-26 14:48:15');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'principal', '校长', 1, '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:29:31', '');
INSERT INTO `sys_post` VALUES (2, 'dean', '院长', 2, '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:29:46', '');
INSERT INTO `sys_post` VALUES (3, 'teacher', '老师', 3, '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:29:55', '');
INSERT INTO `sys_post` VALUES (4, 'student', '学生', 4, '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-02-26 12:30:05', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-01-10 19:05:31', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-01-10 19:05:31', 'admin', '2023-01-17 20:35:17', '普通角色');
INSERT INTO `sys_role` VALUES (3, '图书管理员', 'book-admin', 0, '1', 1, 1, '0', '0', 'admin', '2023-02-11 14:23:12', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '图书普通角色', 'book-common', 0, '1', 1, 1, '0', '0', 'admin', '2023-02-11 21:10:40', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 109);
INSERT INTO `sys_role_menu` VALUES (3, 110);
INSERT INTO `sys_role_menu` VALUES (3, 111);
INSERT INTO `sys_role_menu` VALUES (3, 112);
INSERT INTO `sys_role_menu` VALUES (3, 113);
INSERT INTO `sys_role_menu` VALUES (3, 114);
INSERT INTO `sys_role_menu` VALUES (3, 115);
INSERT INTO `sys_role_menu` VALUES (3, 116);
INSERT INTO `sys_role_menu` VALUES (3, 117);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1000);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1046);
INSERT INTO `sys_role_menu` VALUES (3, 1047);
INSERT INTO `sys_role_menu` VALUES (3, 1048);
INSERT INTO `sys_role_menu` VALUES (3, 1049);
INSERT INTO `sys_role_menu` VALUES (3, 1050);
INSERT INTO `sys_role_menu` VALUES (3, 1051);
INSERT INTO `sys_role_menu` VALUES (3, 1052);
INSERT INTO `sys_role_menu` VALUES (3, 1053);
INSERT INTO `sys_role_menu` VALUES (3, 1054);
INSERT INTO `sys_role_menu` VALUES (3, 1055);
INSERT INTO `sys_role_menu` VALUES (3, 1056);
INSERT INTO `sys_role_menu` VALUES (3, 1057);
INSERT INTO `sys_role_menu` VALUES (3, 1058);
INSERT INTO `sys_role_menu` VALUES (3, 1059);
INSERT INTO `sys_role_menu` VALUES (3, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 2018);
INSERT INTO `sys_role_menu` VALUES (3, 2031);
INSERT INTO `sys_role_menu` VALUES (3, 2032);
INSERT INTO `sys_role_menu` VALUES (3, 2033);
INSERT INTO `sys_role_menu` VALUES (3, 2034);
INSERT INTO `sys_role_menu` VALUES (3, 2035);
INSERT INTO `sys_role_menu` VALUES (3, 2036);
INSERT INTO `sys_role_menu` VALUES (3, 2037);
INSERT INTO `sys_role_menu` VALUES (3, 2038);
INSERT INTO `sys_role_menu` VALUES (3, 2039);
INSERT INTO `sys_role_menu` VALUES (3, 2040);
INSERT INTO `sys_role_menu` VALUES (3, 2041);
INSERT INTO `sys_role_menu` VALUES (3, 2042);
INSERT INTO `sys_role_menu` VALUES (3, 2043);
INSERT INTO `sys_role_menu` VALUES (3, 2044);
INSERT INTO `sys_role_menu` VALUES (3, 2045);
INSERT INTO `sys_role_menu` VALUES (3, 2046);
INSERT INTO `sys_role_menu` VALUES (3, 2047);
INSERT INTO `sys_role_menu` VALUES (3, 2048);
INSERT INTO `sys_role_menu` VALUES (3, 2049);
INSERT INTO `sys_role_menu` VALUES (3, 2050);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 2);
INSERT INTO `sys_role_menu` VALUES (4, 3);
INSERT INTO `sys_role_menu` VALUES (4, 100);
INSERT INTO `sys_role_menu` VALUES (4, 101);
INSERT INTO `sys_role_menu` VALUES (4, 102);
INSERT INTO `sys_role_menu` VALUES (4, 103);
INSERT INTO `sys_role_menu` VALUES (4, 104);
INSERT INTO `sys_role_menu` VALUES (4, 105);
INSERT INTO `sys_role_menu` VALUES (4, 106);
INSERT INTO `sys_role_menu` VALUES (4, 107);
INSERT INTO `sys_role_menu` VALUES (4, 108);
INSERT INTO `sys_role_menu` VALUES (4, 109);
INSERT INTO `sys_role_menu` VALUES (4, 110);
INSERT INTO `sys_role_menu` VALUES (4, 111);
INSERT INTO `sys_role_menu` VALUES (4, 112);
INSERT INTO `sys_role_menu` VALUES (4, 113);
INSERT INTO `sys_role_menu` VALUES (4, 114);
INSERT INTO `sys_role_menu` VALUES (4, 115);
INSERT INTO `sys_role_menu` VALUES (4, 116);
INSERT INTO `sys_role_menu` VALUES (4, 117);
INSERT INTO `sys_role_menu` VALUES (4, 500);
INSERT INTO `sys_role_menu` VALUES (4, 501);
INSERT INTO `sys_role_menu` VALUES (4, 1000);
INSERT INTO `sys_role_menu` VALUES (4, 1001);
INSERT INTO `sys_role_menu` VALUES (4, 1002);
INSERT INTO `sys_role_menu` VALUES (4, 1003);
INSERT INTO `sys_role_menu` VALUES (4, 1004);
INSERT INTO `sys_role_menu` VALUES (4, 1005);
INSERT INTO `sys_role_menu` VALUES (4, 1006);
INSERT INTO `sys_role_menu` VALUES (4, 1007);
INSERT INTO `sys_role_menu` VALUES (4, 1008);
INSERT INTO `sys_role_menu` VALUES (4, 1009);
INSERT INTO `sys_role_menu` VALUES (4, 1010);
INSERT INTO `sys_role_menu` VALUES (4, 1011);
INSERT INTO `sys_role_menu` VALUES (4, 1012);
INSERT INTO `sys_role_menu` VALUES (4, 1013);
INSERT INTO `sys_role_menu` VALUES (4, 1014);
INSERT INTO `sys_role_menu` VALUES (4, 1015);
INSERT INTO `sys_role_menu` VALUES (4, 1016);
INSERT INTO `sys_role_menu` VALUES (4, 1017);
INSERT INTO `sys_role_menu` VALUES (4, 1018);
INSERT INTO `sys_role_menu` VALUES (4, 1019);
INSERT INTO `sys_role_menu` VALUES (4, 1020);
INSERT INTO `sys_role_menu` VALUES (4, 1021);
INSERT INTO `sys_role_menu` VALUES (4, 1022);
INSERT INTO `sys_role_menu` VALUES (4, 1023);
INSERT INTO `sys_role_menu` VALUES (4, 1024);
INSERT INTO `sys_role_menu` VALUES (4, 1025);
INSERT INTO `sys_role_menu` VALUES (4, 1026);
INSERT INTO `sys_role_menu` VALUES (4, 1027);
INSERT INTO `sys_role_menu` VALUES (4, 1028);
INSERT INTO `sys_role_menu` VALUES (4, 1029);
INSERT INTO `sys_role_menu` VALUES (4, 1030);
INSERT INTO `sys_role_menu` VALUES (4, 1031);
INSERT INTO `sys_role_menu` VALUES (4, 1032);
INSERT INTO `sys_role_menu` VALUES (4, 1033);
INSERT INTO `sys_role_menu` VALUES (4, 1034);
INSERT INTO `sys_role_menu` VALUES (4, 1035);
INSERT INTO `sys_role_menu` VALUES (4, 1036);
INSERT INTO `sys_role_menu` VALUES (4, 1037);
INSERT INTO `sys_role_menu` VALUES (4, 1038);
INSERT INTO `sys_role_menu` VALUES (4, 1039);
INSERT INTO `sys_role_menu` VALUES (4, 1040);
INSERT INTO `sys_role_menu` VALUES (4, 1041);
INSERT INTO `sys_role_menu` VALUES (4, 1042);
INSERT INTO `sys_role_menu` VALUES (4, 1043);
INSERT INTO `sys_role_menu` VALUES (4, 1044);
INSERT INTO `sys_role_menu` VALUES (4, 1045);
INSERT INTO `sys_role_menu` VALUES (4, 1046);
INSERT INTO `sys_role_menu` VALUES (4, 1047);
INSERT INTO `sys_role_menu` VALUES (4, 1048);
INSERT INTO `sys_role_menu` VALUES (4, 1049);
INSERT INTO `sys_role_menu` VALUES (4, 1050);
INSERT INTO `sys_role_menu` VALUES (4, 1051);
INSERT INTO `sys_role_menu` VALUES (4, 1052);
INSERT INTO `sys_role_menu` VALUES (4, 1053);
INSERT INTO `sys_role_menu` VALUES (4, 1054);
INSERT INTO `sys_role_menu` VALUES (4, 1055);
INSERT INTO `sys_role_menu` VALUES (4, 1056);
INSERT INTO `sys_role_menu` VALUES (4, 1057);
INSERT INTO `sys_role_menu` VALUES (4, 1058);
INSERT INTO `sys_role_menu` VALUES (4, 1059);
INSERT INTO `sys_role_menu` VALUES (4, 1060);
INSERT INTO `sys_role_menu` VALUES (4, 2018);
INSERT INTO `sys_role_menu` VALUES (4, 2031);
INSERT INTO `sys_role_menu` VALUES (4, 2032);
INSERT INTO `sys_role_menu` VALUES (4, 2036);
INSERT INTO `sys_role_menu` VALUES (4, 2037);
INSERT INTO `sys_role_menu` VALUES (4, 2038);
INSERT INTO `sys_role_menu` VALUES (4, 2042);
INSERT INTO `sys_role_menu` VALUES (4, 2043);
INSERT INTO `sys_role_menu` VALUES (4, 2044);
INSERT INTO `sys_role_menu` VALUES (4, 2048);
INSERT INTO `sys_role_menu` VALUES (4, 2049);
INSERT INTO `sys_role_menu` VALUES (4, 2050);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2023/02/07/blob_20230207210211A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-02-26 17:28:42', 'admin', '2023-01-10 19:05:31', '', '2023-02-26 17:28:41', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-01-10 19:05:31', 'admin', '2023-01-10 19:05:31', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, 100, '王权', 'wangquan', '00', '', '', '0', '', '$2a$10$dtjuFf8yB3OUSFcVEySlf.9B7TIuXbDKDuS9r7ZEEu2A7l9mrR32W', '0', '0', '127.0.0.1', '2023-02-11 22:57:38', 'admin', '2023-02-06 20:48:40', 'admin', '2023-02-12 12:40:23', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 4);

SET FOREIGN_KEY_CHECKS = 1;
