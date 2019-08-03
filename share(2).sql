/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : share

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2018-05-18 12:20:53
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `new_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_new1_idx` (`new_id`),
  KEY `fk_comment_user1_idx` (`user_id`),
  CONSTRAINT `fk_comment_new1` FOREIGN KEY (`new_id`) REFERENCES `new` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2018-03-05 19:59:21', '加油', '1', '1');
INSERT INTO `comment` VALUES ('2', '2018-03-03 19:59:39', '好评', '1', '2');
INSERT INTO `comment` VALUES ('3', '2018-03-01 19:59:53', '差评', '1', '6');
INSERT INTO `comment` VALUES ('4', '2018-03-02 20:00:16', '标题党', '1', '9');
INSERT INTO `comment` VALUES ('5', '2018-02-24 20:02:00', '2333333', '1', '21');

-- ----------------------------
-- Table structure for `know`
-- ----------------------------
DROP TABLE IF EXISTS `know`;
CREATE TABLE `know` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `text` mediumtext,
  `time` datetime DEFAULT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_new_newstype1_idx` (`category`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of know
-- ----------------------------
INSERT INTO `know` VALUES ('1', 'test', null, null, null, '1');
INSERT INTO `know` VALUES ('2', 'test2', null, null, null, '1');
INSERT INTO `know` VALUES ('9', 't3', null, null, null, '1');
INSERT INTO `know` VALUES ('10', '123654', null, '<p>78976543</p>', null, '0');
INSERT INTO `know` VALUES ('11', '123', null, '<p>32132134554</p>', null, '0');

-- ----------------------------
-- Table structure for `new`
-- ----------------------------
DROP TABLE IF EXISTS `new`;
CREATE TABLE `new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `cover` varchar(45) DEFAULT NULL,
  `text` varchar(5000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `newstype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_new_newstype1_idx` (`newstype_id`),
  CONSTRAINT `fk_new_newstype1` FOREIGN KEY (`newstype_id`) REFERENCES `newstype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of new
-- ----------------------------
INSERT INTO `new` VALUES ('1', '捷克总统泽曼赢得连任 今日宣誓就职', '新华网', '无', '【环球网快讯】美国福克斯新闻网3月8日报道称，美国总统唐纳德特朗普表示，韩国将在美国东部时间周四晚上7点(北京时间9日早8点)就朝鲜做出“重大声明”。\r\n\r\n      当地时间3月8号下午5点多，特朗普总统忽然走进白宫简报室，告诉记者们“韩国将在今晚7点宣布重大朝鲜政策”。', '2018-03-05 10:48:15', '1');
INSERT INTO `new` VALUES ('2', '亚马逊与阿里全球争霸，看过分析后你看好谁？', '今日头条', '无', '', '2018-03-05 11:20:31', '2');
INSERT INTO `new` VALUES ('3', '白宫:特朗普接受金正恩会见邀请', '环球网', null, '', '2018-03-05 11:21:28', '1');
INSERT INTO `new` VALUES ('6', '温格有一万种方法保帅位!加图索服了', '网易新闻', '无', '', '2018-03-05 11:50:46', '1');
INSERT INTO `new` VALUES ('7', '300多业主办房产证费用被开发商挪用', '广州日报', '无', '', '2018-03-05 11:51:32', '1');
INSERT INTO `new` VALUES ('8', '大佬出没！那英两臂似戴辣椒串霸气现身', '腾讯娱乐', '无', '', '2018-03-05 11:51:30', '1');

-- ----------------------------
-- Table structure for `newstype`
-- ----------------------------
DROP TABLE IF EXISTS `newstype`;
CREATE TABLE `newstype` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of newstype
-- ----------------------------
INSERT INTO `newstype` VALUES ('1', '推荐');
INSERT INTO `newstype` VALUES ('2', '最新');
INSERT INTO `newstype` VALUES ('3', '最热');
INSERT INTO `newstype` VALUES ('4', '军事');
INSERT INTO `newstype` VALUES ('5', '国际');
INSERT INTO `newstype` VALUES ('6', '游戏');
INSERT INTO `newstype` VALUES ('7', '社会');
INSERT INTO `newstype` VALUES ('8', '财经');

-- ----------------------------
-- Table structure for `read`
-- ----------------------------
DROP TABLE IF EXISTS `read`;
CREATE TABLE `read` (
  `id` int(11) NOT NULL,
  `time` varchar(45) DEFAULT NULL,
  `new_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_read_new1_idx` (`new_id`),
  KEY `fk_read_user1_idx` (`user_id`),
  CONSTRAINT `fk_read_new1` FOREIGN KEY (`new_id`) REFERENCES `new` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_read_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of read
-- ----------------------------

-- ----------------------------
-- Table structure for `reoly`
-- ----------------------------
DROP TABLE IF EXISTS `reoly`;
CREATE TABLE `reoly` (
  `id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `comment_id` int(11) NOT NULL,
  `reoly_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reoly_comment1_idx` (`comment_id`),
  KEY `fk_reoly_reoly1_idx` (`reoly_id`),
  KEY `fk_reoly_user1_idx` (`user_id`),
  CONSTRAINT `fk_reoly_comment1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reoly_reoly1` FOREIGN KEY (`reoly_id`) REFERENCES `reoly` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reoly_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of reoly
-- ----------------------------

-- ----------------------------
-- Table structure for `report`
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  `new_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reporttype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_report_new1_idx` (`new_id`),
  KEY `fk_report_user1_idx` (`user_id`),
  KEY `fk_report_reporttype1_idx` (`reporttype_id`),
  CONSTRAINT `fk_report_new1` FOREIGN KEY (`new_id`) REFERENCES `new` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_reporttype1` FOREIGN KEY (`reporttype_id`) REFERENCES `reporttype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for `reporttype`
-- ----------------------------
DROP TABLE IF EXISTS `reporttype`;
CREATE TABLE `reporttype` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of reporttype
-- ----------------------------

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL,
  `score` varchar(45) DEFAULT NULL,
  `new_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_score_new1_idx` (`new_id`),
  KEY `fk_score_user1_idx` (`user_id`),
  CONSTRAINT `fk_score_new1` FOREIGN KEY (`new_id`) REFERENCES `new` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_score_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '腾讯新闻', '15119534661', '123456');
INSERT INTO `user` VALUES ('2', '张无忌', '11111111111', '123456');
INSERT INTO `user` VALUES ('6', '张三丰', '33333333333', '123456');
INSERT INTO `user` VALUES ('7', '段誉', '99999999999', '123456');
INSERT INTO `user` VALUES ('9', '乔峰', '55555555555', '123456');
INSERT INTO `user` VALUES ('21', '张飞', '123333333333', '123456');

-- ----------------------------
-- View structure for `commentanduser`
-- ----------------------------
DROP VIEW IF EXISTS `commentanduser`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `commentanduser` AS select `comment`.`id` AS `id`,`comment`.`user_id` AS `user_id`,`user`.`name` AS `name`,`comment`.`text` AS `text`,`comment`.`time` AS `time`,`comment`.`new_id` AS `new_id` from (`comment` join `user`) where (`user`.`id` = `comment`.`user_id`);
