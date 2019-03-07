/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : db_wd

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-02-24 20:40:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dtproperties
-- ----------------------------
DROP TABLE IF EXISTS `dtproperties`;
CREATE TABLE `dtproperties` (
  `id` int(11) NOT NULL,
  `objectid` int(11) default NULL,
  `property` varchar(88) NOT NULL,
  `value` varchar(255) default NULL,
  `uvalue` varchar(255) default NULL,
  `lvalue` longblob,
  `version` int(11) NOT NULL,
  PRIMARY KEY  (`id`,`property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dtproperties
-- ----------------------------

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(88) default NULL,
  `userPw` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');

-- ----------------------------
-- Table structure for t_catelog
-- ----------------------------
DROP TABLE IF EXISTS `t_catelog`;
CREATE TABLE `t_catelog` (
  `catelog_id` int(11) NOT NULL,
  `catelog_name` varchar(88) default NULL,
  `catelog_del` varchar(50) default NULL,
  PRIMARY KEY  (`catelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
INSERT INTO `t_catelog` VALUES ('1', '凉拌菜', 'no');
INSERT INTO `t_catelog` VALUES ('2', '热炒菜', 'no');
INSERT INTO `t_catelog` VALUES ('3', '炖汤类', 'no');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(88) default NULL,
  `goods_miaoshu` longtext,
  `goods_pic` varchar(50) default NULL,
  `goods_shichangjia` int(11) default NULL,
  `goods_tejia` int(11) default NULL,
  `goods_isnottejia` varchar(50) default NULL,
  `goods_isnottuijian` varchar(50) default NULL,
  `goods_catelog_id` int(11) default NULL,
  `goods_Del` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '海燕鱼拌花生米', '海燕鱼拌花生米', '/upload/1331749444703.jpg', '45', '45', 'no', null, '1', 'no');
INSERT INTO `t_goods` VALUES ('4', '私房酒椒焖鱼', '私房酒椒焖鱼', '/upload/1331749653781.jpg', '50', '50', 'no', null, '2', 'no');
INSERT INTO `t_goods` VALUES ('5', '蒜黄炒鲜鱿鱼', '蒜黄炒鲜鱿鱼', '/upload/1331749693796.jpg', '50', '50', 'no', null, '2', 'no');
INSERT INTO `t_goods` VALUES ('6', '干贝烧海参', '干贝烧海参', '/upload/1331749729343.jpg', '60', '60', 'no', null, '2', 'no');
INSERT INTO `t_goods` VALUES ('7', '韩式辣白菜', '韩式辣白菜', '/upload/1331749793000.jpg', '20', '20', 'no', null, '1', 'no');
INSERT INTO `t_goods` VALUES ('10', '奥尔良鸡丁黄金脆', '奥尔良鸡丁黄金脆', '/upload/1331749925156.jpg', '50', '50', 'no', null, '2', 'no');
INSERT INTO `t_goods` VALUES ('12', '1', '请输入1容', '', '1', '1', 'no', null, '1', 'yes');

-- ----------------------------
-- Table structure for t_liuyan
-- ----------------------------
DROP TABLE IF EXISTS `t_liuyan`;
CREATE TABLE `t_liuyan` (
  `liuyan_id` int(11) NOT NULL,
  `liuyan_title` varchar(88) default NULL,
  `liuyan_content` longtext,
  `liuyan_date` varchar(50) default NULL,
  `liuyan_user` varchar(50) default NULL,
  PRIMARY KEY  (`liuyan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_liuyan
-- ----------------------------
INSERT INTO `t_liuyan` VALUES ('1', '的得得得得得得得得得得得', '<p>得得得得得得得得得得得得得得得得得</p>', '2013-4-26 23:36:23', 'liusan');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL,
  `order_bianhao` varchar(88) default NULL,
  `order_date` varchar(50) default NULL,
  `order_zhuangtai` varchar(50) default NULL,
  `order_songhuodizhi` varchar(50) default NULL,
  `order_fukuangfangshi` varchar(50) default NULL,
  `order_jine` int(11) default NULL,
  `order_user_id` int(11) default NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '20130428011834', '2013-04-28 01:18:34', 'yes', 'xxxxxxxxxxxx', '货到付款', '145', '1');

-- ----------------------------
-- Table structure for t_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `orderItem_id` int(11) NOT NULL,
  `order_id` int(11) default NULL,
  `goods_id` int(11) default NULL,
  `goods_quantity` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('1', '1', '1', '1');
INSERT INTO `t_orderitem` VALUES ('2', '1', '10', '2');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(88) default NULL,
  `user_pw` varchar(50) default NULL,
  `user_type` int(11) default NULL,
  `user_realname` varchar(50) default NULL,
  `user_sex` varchar(50) default NULL,
  `user_age` varchar(50) default NULL,
  `user_address` varchar(50) default NULL,
  `user_tel` varchar(50) default NULL,
  `user_email` varchar(50) default NULL,
  `user_del` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'liusan', '000000', '0', '刘三', '男', '20', '北京路', '13888888888', 'liusan@yahoo.cn', 'no');
INSERT INTO `t_user` VALUES ('2', 'wanggan', '000000', '0', '王刚', '男', '20', '北京路', '13888854666', 'wanggan@yahoo.cn', 'no');
