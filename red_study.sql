/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : red_study

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 08/10/2024 07:16:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '管理员账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '管理员头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/download/avatar.png', 'ADMIN');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '书籍分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Java Web');
INSERT INTO `category` VALUES (3, 'C');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `article_id` int NULL DEFAULT NULL COMMENT '文章ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `content_type` int NULL DEFAULT NULL COMMENT '内容类型',
  `order` int NULL DEFAULT NULL COMMENT '内容顺序',
  `show_type` int NULL DEFAULT NULL COMMENT '展示方式',
  `special_column_id` int NULL DEFAULT NULL COMMENT '专栏ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '内容库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (1, 1, '1', 0, 0, 0, NULL);
INSERT INTO `content` VALUES (2, 1, '2', 1, 0, 1, NULL);
INSERT INTO `content` VALUES (3, 1, '3', 0, 0, 2, NULL);
INSERT INTO `content` VALUES (4, 2, '1', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品简介',
  `specials` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品特色',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `discount` double NULL DEFAULT 1 COMMENT '折扣',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品单位',
  `stock` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '库存',
  `category_id` int NULL DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (12, 'C语言：从入门到精通', 'http://localhost:9090/files/download/1725368644124-C.jpg', 'C语言基础教材', '通俗易懂，快速入门', 40.50, 1, '本', '98', 3);
INSERT INTO `goods` VALUES (14, 'java web', NULL, NULL, NULL, 38.20, 1, '本', '48', 1);

-- ----------------------------
-- Table structure for goods_in
-- ----------------------------
DROP TABLE IF EXISTS `goods_in`;
CREATE TABLE `goods_in`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '进货ID',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `num` int NULL DEFAULT NULL COMMENT '进货数量',
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '进货渠道',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '进货日期',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品进货表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_in
-- ----------------------------
INSERT INTO `goods_in` VALUES (2, 12, 100, '出版社', '2024-09-04 09:08:20', '');
INSERT INTO `goods_in` VALUES (3, 14, 11, '出版社', '2024-09-04 09:17:15', NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (3, '测试公告', '测试公告', '2024-09-03 14:29:53');
INSERT INTO `notice` VALUES (4, '系统维护公告', '系统将于2024-09-01 09:00到2024-09-01 14:00进行更新维护', '2024-09-03 14:36:01');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单编号',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `num` int NULL DEFAULT NULL COMMENT '购买数量',
  `user_id` int NULL DEFAULT NULL COMMENT '下单人',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单状态',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (2, '2cb099dae2a14af0967cbf56cb084c9d', 12, 1, 1, '已取消', '2024-09-18 14:24:09');
INSERT INTO `orders` VALUES (3, '35f1a3fe1c414bbcb8c25ee6a79e4f0c', 12, 0, 1, '已收货', '2024-09-18 14:26:53');
INSERT INTO `orders` VALUES (5, '95a7b9bf4f6f49b38e70454ba2578a2f', 12, 1, 13, '待支付', '2024-09-18 14:56:01');
INSERT INTO `orders` VALUES (6, 'b219ee1ab0fe45489694fd178484b504', 12, 0, 1, '已取消', '2024-09-19 13:27:52');
INSERT INTO `orders` VALUES (13, '29d2bf49fbc5476c882cf6c16d2558d8', 12, 1, 1, '待支付', '2024-09-19 13:33:25');
INSERT INTO `orders` VALUES (14, '79193c2c42f94dfe8db607717ca852e4', 12, 3, 2, '已取消', '2024-09-19 14:33:32');
INSERT INTO `orders` VALUES (15, 'bb4b797eb32442eb84cd712f6c6d03ee', 12, 1, 2, '待发货', '2024-09-19 14:33:50');

-- ----------------------------
-- Table structure for study_basefrom
-- ----------------------------
DROP TABLE IF EXISTS `study_basefrom`;
CREATE TABLE `study_basefrom`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '研学基地ID',
  `study_baseform_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '研学基地名字',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '研学基地介绍',
  `article_id` int NULL DEFAULT NULL COMMENT '文章ID',
  `special_column_id` int NULL DEFAULT NULL COMMENT '专栏ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '研学基地表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of study_basefrom
-- ----------------------------
INSERT INTO `study_basefrom` VALUES (1, '1号研学基地', NULL, 1, NULL);
INSERT INTO `study_basefrom` VALUES (2, '2号研学基地', NULL, 2, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户性别',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '普通用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user', 'user', '普通用户', 'http://localhost:9090/files/download/avatar.png', 'USER', '不愿透露', '13362991597', '17721453389@163.com', '2024-09-05 15:44:40');
INSERT INTO `user` VALUES (2, 'user2', 'user2', '普通用户2', NULL, 'USER', '女', '17721453389', '2469724709@qq.com', '2024-09-05 15:43:43');
INSERT INTO `user` VALUES (13, 'user3', 'user3', 'user3', NULL, 'USER', NULL, NULL, NULL, '2024-09-18 08:12:06');

SET FOREIGN_KEY_CHECKS = 1;
