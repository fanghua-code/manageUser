/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : manageuser

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2019-09-27 13:14:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) NOT NULL,
  `apassword` varchar(30) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `uage` varchar(5) NOT NULL,
  `usex` varchar(5) NOT NULL,
  `upassword` varchar(20) NOT NULL,
  `uqq` varchar(15) NOT NULL,
  `uemail` varchar(30) NOT NULL,
  `uaddress` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', 'zhangsan', '20', '女', '1234567', '125789645', 'zhangsan@qq.com', '江西');
INSERT INTO `user` VALUES ('6', 'lisi', '19', '男', '1234567', '1924737404', 'lisi@qq.com', '江西');
INSERT INTO `user` VALUES ('7', 'wangwu', '30', '男', '123456789', '569847236', 'wangwu@qq.com', '广东');
INSERT INTO `user` VALUES ('16', 'rain', '20', '男', '123456', '330029675', '330029675@qq.com', '江西');
