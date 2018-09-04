/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : ticket

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2018-09-04 08:18:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cinema`
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `Cinema_id` int(11) NOT NULL AUTO_INCREMENT,
  `Cinema_name` varchar(20) NOT NULL,
  `Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES ('1', 'Paramount', '18 Fifth Ave, Brooklyn, New York');

-- ----------------------------
-- Table structure for `form`
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `Order_id` int(11) NOT NULL AUTO_INCREMENT,
  `Order_Time` char(20) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Screen_id` int(11) NOT NULL,
  `Seat_id` int(11) NOT NULL,
  PRIMARY KEY (`Order_id`),
  KEY `User_id` (`User_id`),
  KEY `Screen_id` (`Screen_id`),
  KEY `Seat_id` (`Seat_id`),
  CONSTRAINT `form_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  CONSTRAINT `form_ibfk_2` FOREIGN KEY (`Screen_id`) REFERENCES `screen` (`Screen_id`),
  CONSTRAINT `form_ibfk_3` FOREIGN KEY (`Seat_id`) REFERENCES `seat` (`Seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES ('1', '2015-01-01 19:45:28', '1', '2', '21');
INSERT INTO `form` VALUES ('2', '2015-01-01 19:45:28', '1', '2', '22');
INSERT INTO `form` VALUES ('3', '2015-01-01 19:45:28', '1', '2', '23');

-- ----------------------------
-- Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `Movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `Movie_name` varchar(20) NOT NULL,
  `Release` varchar(20) NOT NULL,
  `Post_url` varchar(100) NOT NULL,
  `Introduction` varchar(100) NOT NULL,
  PRIMARY KEY (`Movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', 'Ghost', '1990-07-13', 'abcd', 'This movie display the special romance between a man who is dead and her live wife.');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `cenima_id` int(11) NOT NULL,
  `room_name` varchar(20) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `cenima_id` (`cenima_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`cenima_id`) REFERENCES `cinema` (`Cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '1', '1st Display Room');
INSERT INTO `room` VALUES ('2', '1', '2nd Display Room');

-- ----------------------------
-- Table structure for `screen`
-- ----------------------------
DROP TABLE IF EXISTS `screen`;
CREATE TABLE `screen` (
  `Screen_id` int(11) NOT NULL AUTO_INCREMENT,
  `Cenima_id` int(11) NOT NULL,
  `Movie_id` int(11) NOT NULL,
  `Time` char(20) NOT NULL,
  `Room_id` int(11) NOT NULL,
  `Price` float NOT NULL,
  PRIMARY KEY (`Screen_id`),
  KEY `Cenima_id` (`Cenima_id`),
  KEY `Movie_id` (`Movie_id`),
  KEY `Room_id` (`Room_id`),
  CONSTRAINT `screen_ibfk_1` FOREIGN KEY (`Cenima_id`) REFERENCES `cinema` (`Cinema_id`),
  CONSTRAINT `screen_ibfk_2` FOREIGN KEY (`Movie_id`) REFERENCES `movie` (`Movie_id`),
  CONSTRAINT `screen_ibfk_3` FOREIGN KEY (`Room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of screen
-- ----------------------------
INSERT INTO `screen` VALUES ('1', '1', '1', '8:00', '1', '175');
INSERT INTO `screen` VALUES ('2', '1', '1', '14:00', '1', '125');
INSERT INTO `screen` VALUES ('3', '1', '1', '21:00', '1', '195');

-- ----------------------------
-- Table structure for `seat`
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `Seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `Room_id` int(11) NOT NULL,
  `Row` int(11) NOT NULL,
  `Column` int(11) NOT NULL,
  PRIMARY KEY (`Seat_id`),
  KEY `Room_id` (`Room_id`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`Room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('1', '1', '1', '1');
INSERT INTO `seat` VALUES ('2', '1', '1', '2');
INSERT INTO `seat` VALUES ('3', '1', '1', '3');
INSERT INTO `seat` VALUES ('4', '1', '1', '4');
INSERT INTO `seat` VALUES ('5', '1', '2', '1');
INSERT INTO `seat` VALUES ('6', '1', '2', '2');
INSERT INTO `seat` VALUES ('7', '1', '2', '3');
INSERT INTO `seat` VALUES ('8', '1', '2', '4');
INSERT INTO `seat` VALUES ('9', '1', '3', '1');
INSERT INTO `seat` VALUES ('10', '1', '3', '2');
INSERT INTO `seat` VALUES ('11', '1', '3', '3');
INSERT INTO `seat` VALUES ('12', '1', '3', '4');
INSERT INTO `seat` VALUES ('13', '1', '4', '1');
INSERT INTO `seat` VALUES ('14', '1', '4', '2');
INSERT INTO `seat` VALUES ('15', '1', '4', '3');
INSERT INTO `seat` VALUES ('16', '1', '4', '4');
INSERT INTO `seat` VALUES ('17', '1', '5', '1');
INSERT INTO `seat` VALUES ('18', '1', '5', '2');
INSERT INTO `seat` VALUES ('19', '1', '5', '3');
INSERT INTO `seat` VALUES ('20', '1', '5', '4');
INSERT INTO `seat` VALUES ('21', '1', '6', '1');
INSERT INTO `seat` VALUES ('22', '1', '6', '2');
INSERT INTO `seat` VALUES ('23', '1', '6', '3');
INSERT INTO `seat` VALUES ('24', '1', '6', '4');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Money` float(16,0) NOT NULL,
  `Portrait_url` char(100) NOT NULL,
  `OpenId` char(32) NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Smile', 'smile', '0', 'abcd', 'abcd');
