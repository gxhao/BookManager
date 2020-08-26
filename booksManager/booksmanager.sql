/*
 Navicat Premium Data Transfer

 Source Server         : xiao
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : booksmanager

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 02/08/2020 12:44:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publishing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `coding` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE,
  UNIQUE INDEX `bookName`(`bookName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '边城', '沈从文', '高等教育出版社', 2.50, '112233654', 'book1.gif');
INSERT INTO `books` VALUES (2, '流星雨', '三毛', '高等教育出版社', 77.90, '135489546', 'book2.gif');
INSERT INTO `books` VALUES (3, '解忧杂货铺', '东野圭吾', '高等教育出版社', 7.90, '112346564', 'book3.gif');
INSERT INTO `books` VALUES (4, '舞舞舞', '村上春树', '高等教育出版社', 11.80, '1123546786', 'book4.gif');
INSERT INTO `books` VALUES (5, '百年孤独', '马尔克斯', '高等教育出版社', 2.70, '112356482', 'book5.gif');
INSERT INTO `books` VALUES (6, '幻夜', '东野圭吾', '高等教育出版社', 13.50, '1123246465', 'book6.gif');
INSERT INTO `books` VALUES (7, '钢铁是怎样练成的', '查尔斯', '人民教育出版社', 3.50, '1236478', 'book7.gif');
INSERT INTO `books` VALUES (8, '沉默的大多数', '王小波', '人民教育出版社', 35.70, '1236478', 'book8.gif');
INSERT INTO `books` VALUES (9, '一只特立独行的猪', '王小波', '人民教育出版社', 3.50, '1236478', 'book9.gif');
INSERT INTO `books` VALUES (10, '皮囊', '蔡崇达', '人民教育出版社', 3.50, '1236478', 'book10.gif');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(255) NULL DEFAULT NULL,
  `bid` int(11) NULL DEFAULT NULL,
  `num` int(255) NULL DEFAULT NULL,
  `datetime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('12ec38fd4dc140cc9753920487910ed3', 1, 3, 7, '2020-07-27 10:54:25.290000');
INSERT INTO `orders` VALUES ('1fd3f4950fc14faabf943fed4235a46a', 1, 2, 5, '2020-07-23 19:14:36.763000');
INSERT INTO `orders` VALUES ('2ea2d06c079348b08c81b36f2bce1004', 1, 2, 1, '2020-07-27 08:39:56.258000');
INSERT INTO `orders` VALUES ('4e5ffd396a6847cdbd29238b04b45c06', 1, 1, 6, '2020-07-23 19:14:58.037000');
INSERT INTO `orders` VALUES ('5f74f868671244368262ed181af12541', 1, 8, 4, '2020-07-27 10:58:39.096000');
INSERT INTO `orders` VALUES ('87616afc0cb34d2191e5b36283e18d1c', 1, 4, 5, '2020-07-23 19:14:26.473000');
INSERT INTO `orders` VALUES ('f54a0c60e8fc436d99f91f565826ceb4', 1, 5, 5, '2020-07-27 08:40:01.548000');
INSERT INTO `orders` VALUES ('f6895dcca9d44bec9858ccbfee13a367', 1, 1, 1, '2020-07-27 10:58:33.610000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identity` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', 1);
INSERT INTO `user` VALUES (2, '20200722', '123', 2);

SET FOREIGN_KEY_CHECKS = 1;
