/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : swim

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2018-02-28 08:50:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'root', '7cb249c04ec33fdfeb14d0fc356498c5');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `creat_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for statistics
-- ----------------------------
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `method` char(5) DEFAULT NULL,
  `course_name` varchar(40) DEFAULT NULL,
  `creat_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistics
-- ----------------------------

-- ----------------------------
-- Table structure for timetable
-- ----------------------------
DROP TABLE IF EXISTS `timetable`;
CREATE TABLE `timetable` (
  `id` smallint(2) NOT NULL AUTO_INCREMENT,
  `course_id` tinyint(1) DEFAULT NULL,
  `course_name` varchar(40) DEFAULT NULL,
  `user_id` smallint(2) DEFAULT NULL,
  `creat_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `number` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timetable
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` tinyint(1) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `parent_name` varchar(20) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `creat_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `all_state` tinyint(1) DEFAULT NULL,
  `swim_number` smallint(2) DEFAULT NULL,
  `card_state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
