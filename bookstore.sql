/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2017-03-11 19:08:13
*/

SET FOREIGN_KEY_CHECKS=0;


-- ----------------------------
-- Table structure for `user`
-- ----------------------------
drop database if exists bookstore;
create database bookstore;
use bookstore;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL DEFAULT '0',
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `cdkey` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0ca470d38bbc4b9da3b75ea1769aa0d8', 'lisi', '123123', '526745683@qq.com', '1', 'bad8aa1a9d744a2c8ed2f629f11e29b094cae4af0080472caaf69a09980616d7');
INSERT INTO `user` VALUES ('185832da4da54da3bde58e5a6064649a', 'huang', '123', '847692936@qq.com', '1', 'c80b9e661208425eb5f9d45a041cfcc31792ade1d4f94f32988882b86b791e22');
INSERT INTO `user` VALUES ('45737667af904bb5925ebe53a7b0d5f6', '123456', '123456', '910346681@qq.com', '1', '5ff419943e9c4b58b853e668c42055409301f808110a4af99bf1611501ebbb7a');
INSERT INTO `user` VALUES ('7a990bb06179433e905584fe48db0557', '123456', '123456', '910346681@qq.com', '0', '309918f08afd48a79aff163655374517d6d2c00931ed412fb32e9b6f658fa980');
INSERT INTO `user` VALUES ('8076fd1148e848cd981629a8a6ac61d6', 'laiweitao', '123', '1965086568@qq.com', '1', 'd7237ddbff7f492f8137730c3d014323a2f65518edec407fab58cce7a74374ca');
INSERT INTO `user` VALUES ('88e99aca445b4f5685da2db23f0a40e3', 'asd123', 'asd123', '15297800339@139.com', '1', 'db4f2aeabb174356878883db98ff4ec38d854f3899454f2d94f2b56aded5b669');
INSERT INTO `user` VALUES ('b5c353bac6a042858e413895252cd5a8', 'wuhao', '123', '526745683@qq.com', '1', 'd422ecb1c60d43ff877f71b025db77ec5ad8811b046848c985be0afbf6744140');
INSERT INTO `user` VALUES ('b69183c7faac4563b6135d991e251898', 'admin', '123', '526745683@qq.com', '1', '1111');
INSERT INTO `user` VALUES ('cf1db51f71b34acb95ecf19114819d36', '    ', '    ', 'bbb', '0', '6aa5c62d667b4fd4bc5dfed0c8fae48c9c4c6dbcfedf4bb2b7687ff4a1ff5d66');



-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(32) NOT NULL DEFAULT '',
  `cname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'fiction');
INSERT INTO `category` VALUES ('2', 'lover');
INSERT INTO `category` VALUES ('3', 'horn');
INSERT INTO `category` VALUES ('4', 'warror');
INSERT INTO `category` VALUES ('5', 'technology');


-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` char(32) NOT NULL DEFAULT '',
  `bname` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `isdel` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `cid` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'peferct world', '45.60', 'Nathan', '/book_img/xuanhuan/wanmeishijie.jpg', '1', '0');
INSERT INTO `book` VALUES ('10', 'yunyong', '50.00', 'Nathan', '/book_img/kongbu/yinyangshi.jpg', '3', '0');
INSERT INTO `book` VALUES ('11', 'apple book', '43.00', 'Nathan', '/book_img/kongbu/diyudianyingyuan.jpg', '3', '0');
INSERT INTO `book` VALUES ('12', 'diamond', '15.00', 'Nathan', '/book_img/kongbu/qumoren.jpg', '3', '0');
INSERT INTO `book` VALUES ('13', 'Hello', '34.00', 'Nathan', '/book_img/wuxia/zhetian.jpg', '4', '0');
INSERT INTO `book` VALUES ('14', 'Tian Long Ba bu', '78.00', 'Nathan', '/book_img/wuxia/tianlongbabu.jpg', '4', '0');
INSERT INTO `book` VALUES ('15', 'xxxxxxxxx', '49.00', 'Nathan', '/book_img/wuxia/xiaoaojianghu.jpg', '4', '0');
INSERT INTO `book` VALUES ('17', 'heloo', '77.00', 'Nathan', '/book_img/keji/jijiabubing.jpg', '5', '0');
INSERT INTO `book` VALUES ('2', 'ping pong', '30.50', 'Alex', '/book_img/xuanhuan/dazhuzai.jpg', '1', '0');
INSERT INTO `book` VALUES ('3', 'good boy', '50.60', 'Allen', '/book_img/xuanhuan/doupocangqiong.jpg', '1', '0');
INSERT INTO `book` VALUES ('4', 'Playboy', '26.40', 'Alex', '/book_img/xuanhuan/douluodalu.jpg', '1', '0');
INSERT INTO `book` VALUES ('5', 'Playgirl', '33.30', 'Jimmy', '/book_img/xuanhuan/wudongqiankun.jpg', '1', '0');
INSERT INTO `book` VALUES ('6', 'daomubiji', '22.00', 'Jimmy', '/book_img/xuanhuan/daomubiji.jpg', '1', '0');
INSERT INTO `book` VALUES ('7', 'haohaohao', '60.50', 'Nathan', '/book_img/yanqing/weiweiyixiaohenqingcheng.jpg', '2', '0');
INSERT INTO `book` VALUES ('8', 'haohao', '51.60', 'Nathan', '/book_img/yanqing/bubujingxin.jpg', '2', '0');
INSERT INTO `book` VALUES ('9', 'douyu', '33.60', 'Nathan', '/book_img/yanqing/douyu.jpg', '2', '0');


-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` char(32) NOT NULL DEFAULT '',
  `total` decimal(10,2) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('05b67a97580c435dbc4601af60b89c58', '20.30', '2017-03-08 21:01:16', '3', 'Jianxi', '0ca470d38bbc4b9da3b75ea1769aa0d8');
INSERT INTO `orders` VALUES ('22702ba6319844678988d559309a1661', '63.30', '2017-03-09 08:34:31', '1', null, '0ca470d38bbc4b9da3b75ea1769aa0d8');
INSERT INTO `orders` VALUES ('3a32dcfe383342aeb7262ad7114d8198', '71.90', '2017-03-08 21:03:18', '1', null, '0ca470d38bbc4b9da3b75ea1769aa0d8');
INSERT INTO `orders` VALUES ('535633d8c15445c0a5319ccfaba0b7f7', '121.00', '2017-03-10 12:11:00', '1', 'nanchang', '8076fd1148e848cd981629a8a6ac61d6');
INSERT INTO `orders` VALUES ('59b04c63079a4c8db588658d3fd2383f', '50.00', '2017-03-09 08:59:58', '1', null, 'b5c353bac6a042858e413895252cd5a8');
INSERT INTO `orders` VALUES ('5bbceab670d34332b60ba5ac67622827', '121.00', '2017-03-10 12:14:34', '1', 'jihjk', '8076fd1148e848cd981629a8a6ac61d6');
INSERT INTO `orders` VALUES ('7417c88a141d42149b33128144e99b17', '442.00', '2017-03-10 12:01:13', '1', '', '0ca470d38bbc4b9da3b75ea1769aa0d8');
INSERT INTO `orders` VALUES ('77fac01c2cbc43ab8bd38609718b7db0', '50.00', '2017-03-10 11:06:17', '1', null, '0ca470d38bbc4b9da3b75ea1769aa0d8');
INSERT INTO `orders` VALUES ('8792c64534eb4a5081ecc7a05e17675e', '91.20', '2017-03-10 12:23:11', '1', null, '45737667af904bb5925ebe53a7b0d5f6');
INSERT INTO `orders` VALUES ('f6bed53e25ff4363ab72da9d1b610cd3', '45.60', '2017-03-11 09:37:04', '4', '', '88e99aca445b4f5685da2db23f0a40e3');
INSERT INTO `orders` VALUES ('fe852f8fcc94459ca8298e6b1807d8e6', '77.00', '2017-03-11 10:08:31', '1', null, '185832da4da54da3bde58e5a6064649a');




-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` char(32) NOT NULL DEFAULT '',
  `count` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `bid` (`bid`),
  KEY `oid` (`oid`),
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('0206e3838ede4909a8cb01f19686b65c', '1', '50.00', '10', '59b04c63079a4c8db588658d3fd2383f');
INSERT INTO `orderitem` VALUES ('0e64a7fde103467aa9a8e7091f5f15c8', '1', '20.30', '1', '3a32dcfe383342aeb7262ad7114d8198');
INSERT INTO `orderitem` VALUES ('1525770d91a345adb469cac0733fa075', '1', '43.00', '11', '22702ba6319844678988d559309a1661');
INSERT INTO `orderitem` VALUES ('2bcbc3b1b6034eeb8f70df44a77d5009', '1', '50.00', '10', '77fac01c2cbc43ab8bd38609718b7db0');
INSERT INTO `orderitem` VALUES ('39d0a685d92b478eb80c25a42ed02bb7', '1', '77.00', '17', 'fe852f8fcc94459ca8298e6b1807d8e6');
INSERT INTO `orderitem` VALUES ('465ff71835124de2aad6685ae1ad5c6a', '2', '121.00', '7', '535633d8c15445c0a5319ccfaba0b7f7');
INSERT INTO `orderitem` VALUES ('46c4e73689c54785bf4c577be6791c5f', '13', '442.00', '13', '7417c88a141d42149b33128144e99b17');
INSERT INTO `orderitem` VALUES ('4aba822d7649422581ae7c48dad56dbd', '1', '20.30', '1', '22702ba6319844678988d559309a1661');
INSERT INTO `orderitem` VALUES ('551de5abee0c49f5b885e321c9657cf4', '1', '51.60', '8', '3a32dcfe383342aeb7262ad7114d8198');
INSERT INTO `orderitem` VALUES ('6f495193af8042d797c0258b3fac3b65', '1', '45.60', '1', 'f6bed53e25ff4363ab72da9d1b610cd3');
INSERT INTO `orderitem` VALUES ('add510f7e56341298b0e3b53e0c0fdeb', '2', '91.20', '1', '8792c64534eb4a5081ecc7a05e17675e');
INSERT INTO `orderitem` VALUES ('b0c983f04284457182c74d9f4e822128', '1', '20.30', '1', '05b67a97580c435dbc4601af60b89c58');
INSERT INTO `orderitem` VALUES ('d977fba9517c47a2a829a8b17b83a872', '2', '121.00', '7', '5bbceab670d34332b60ba5ac67622827');
