/*
 Navicat Premium Data Transfer

 Source Server         : xamapp_Mysql
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost:3306
 Source Schema         : uchat

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 21/12/2018 16:10:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mes
-- ----------------------------
DROP TABLE IF EXISTS `mes`;
CREATE TABLE `mes`  (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `user1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mes` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mes
-- ----------------------------
INSERT INTO `mes` VALUES (6, 'test1', 'test2', 'testsend');
INSERT INTO `mes` VALUES (7, 'test1', 'test3', 'hello');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test1', '1');
INSERT INTO `user` VALUES (2, 'test2', '2');
INSERT INTO `user` VALUES (3, 'test3', '3');
INSERT INTO `user` VALUES (4, 'test4', '4');

SET FOREIGN_KEY_CHECKS = 1;
