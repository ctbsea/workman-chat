/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : chat

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-03-17 12:07:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gw_chat_bind
-- ----------------------------
DROP TABLE IF EXISTS `gw_chat_bind`;
CREATE TABLE `gw_chat_bind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='咨询绑定';

-- ----------------------------
-- Records of gw_chat_bind
-- ----------------------------

-- ----------------------------
-- Table structure for gw_chat_leval
-- ----------------------------
DROP TABLE IF EXISTS `gw_chat_leval`;
CREATE TABLE `gw_chat_leval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `send_time` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='咨询消息';

-- ----------------------------
-- Records of gw_chat_leval
-- ----------------------------

-- ----------------------------
-- Table structure for gw_chat_log
-- ----------------------------
DROP TABLE IF EXISTS `gw_chat_log`;
CREATE TABLE `gw_chat_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1. 用户  2.管理员',
  `admin_id` varchar(100) DEFAULT NULL,
  `client_id` varchar(100) NOT NULL COMMENT '管理员ID 或者 用户的ID',
  `client_name` varchar(100) DEFAULT NULL,
  `send_time` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1 上线 2 下线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb4 COMMENT='客服在线日志';

-- ----------------------------
-- Records of gw_chat_log
-- ----------------------------
INSERT INTO `gw_chat_log` VALUES ('1', '1', 'helloword', '7f00000108fc00000001', null, '1489568268', '1');
INSERT INTO `gw_chat_log` VALUES ('2', '1', 'helloword', '7f00000108fc00000001', '12312312', '1489568672', '1');
INSERT INTO `gw_chat_log` VALUES ('3', '2', 'helloword', '7f00000108fc00000002', '精灵小妹', '1489568687', '1');
INSERT INTO `gw_chat_log` VALUES ('4', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489569542', '1');
INSERT INTO `gw_chat_log` VALUES ('5', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489569609', '1');
INSERT INTO `gw_chat_log` VALUES ('6', '1', 'helloword', '7f00000108fc00000010', '12312312', '1489569839', '1');
INSERT INTO `gw_chat_log` VALUES ('7', '1', 'helloword', '7f00000108fc00000009', '12312312', '1489569855', '1');
INSERT INTO `gw_chat_log` VALUES ('8', '1', 'helloword', '7f00000108fc00000006', '12312312', '1489569966', '1');
INSERT INTO `gw_chat_log` VALUES ('9', '1', 'helloword', '7f00000108fc00000007', '12312312', '1489570030', '1');
INSERT INTO `gw_chat_log` VALUES ('10', '1', 'helloword', '7f00000108fc00000001', '12312312', '1489570079', '1');
INSERT INTO `gw_chat_log` VALUES ('11', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489570079', '1');
INSERT INTO `gw_chat_log` VALUES ('12', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489570158', '1');
INSERT INTO `gw_chat_log` VALUES ('13', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489570159', '1');
INSERT INTO `gw_chat_log` VALUES ('14', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489570233', '1');
INSERT INTO `gw_chat_log` VALUES ('15', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489570237', '1');
INSERT INTO `gw_chat_log` VALUES ('16', '1', 'helloword', '7f00000108fc00000001', '12312312', '1489570716', '1');
INSERT INTO `gw_chat_log` VALUES ('17', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489570717', '1');
INSERT INTO `gw_chat_log` VALUES ('18', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489570790', '1');
INSERT INTO `gw_chat_log` VALUES ('19', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489570792', '1');
INSERT INTO `gw_chat_log` VALUES ('20', '1', 'helloword', '7f00000108fc00000016', '12312312', '1489570979', '1');
INSERT INTO `gw_chat_log` VALUES ('21', '1', 'helloword', '7f00000108fc00000017', '12312312', '1489570981', '1');
INSERT INTO `gw_chat_log` VALUES ('22', '1', 'helloword', '7f00000108fc00000001', '12312312', '1489571065', '1');
INSERT INTO `gw_chat_log` VALUES ('23', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489571074', '1');
INSERT INTO `gw_chat_log` VALUES ('24', '1', 'helloword', '7f00000108fc0000000c', '12312312', '1489571256', '1');
INSERT INTO `gw_chat_log` VALUES ('25', '1', 'helloword', '7f00000108fc0000000e', '12312312', '1489571260', '1');
INSERT INTO `gw_chat_log` VALUES ('26', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489571385', '1');
INSERT INTO `gw_chat_log` VALUES ('27', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489571390', '1');
INSERT INTO `gw_chat_log` VALUES ('28', '1', 'helloword', '7f00000108fc00000017', '12312312', '1489571476', '1');
INSERT INTO `gw_chat_log` VALUES ('29', '1', 'helloword', '7f00000108fc00000019', '12312312', '1489571478', '1');
INSERT INTO `gw_chat_log` VALUES ('30', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489571563', '1');
INSERT INTO `gw_chat_log` VALUES ('31', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489571567', '1');
INSERT INTO `gw_chat_log` VALUES ('32', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489571613', '1');
INSERT INTO `gw_chat_log` VALUES ('33', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489571615', '1');
INSERT INTO `gw_chat_log` VALUES ('34', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489571775', '1');
INSERT INTO `gw_chat_log` VALUES ('35', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489571777', '1');
INSERT INTO `gw_chat_log` VALUES ('36', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489571821', '1');
INSERT INTO `gw_chat_log` VALUES ('37', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489571823', '1');
INSERT INTO `gw_chat_log` VALUES ('38', '1', 'helloword', '7f00000108fc00000024', '12312312', '1489571887', '1');
INSERT INTO `gw_chat_log` VALUES ('39', '1', 'helloword', '7f00000108fc00000025', '12312312', '1489571891', '1');
INSERT INTO `gw_chat_log` VALUES ('40', '2', 'helloword', '7f00000108fc00000023', '精灵小妹', '1489572375', '1');
INSERT INTO `gw_chat_log` VALUES ('41', '1', 'helloword', '7f00000108fc00000001', '12312312', '1489628574', '1');
INSERT INTO `gw_chat_log` VALUES ('42', '1', 'helloword', '7f00000108fc0000000b', '12312312', '1489628701', '1');
INSERT INTO `gw_chat_log` VALUES ('43', '1', 'helloword', '7f00000108fc0000000c', '12312312', '1489628704', '1');
INSERT INTO `gw_chat_log` VALUES ('44', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489628788', '1');
INSERT INTO `gw_chat_log` VALUES ('45', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489628791', '1');
INSERT INTO `gw_chat_log` VALUES ('46', '1', 'helloword', '7f00000108fc00000002', '12312312', '1489628849', '1');
INSERT INTO `gw_chat_log` VALUES ('47', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489628852', '1');
INSERT INTO `gw_chat_log` VALUES ('48', '1', 'helloword', '7f00000108fc00000001', '12312312', '1489628922', '1');
INSERT INTO `gw_chat_log` VALUES ('49', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489628923', '1');
INSERT INTO `gw_chat_log` VALUES ('50', '2', 'helloword', '7f00000108fc00000002', '精灵小妹', '1489628942', '1');
INSERT INTO `gw_chat_log` VALUES ('51', '1', 'helloword', '7f00000108fc00000001', '12312312', '1489629275', '1');
INSERT INTO `gw_chat_log` VALUES ('52', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489629279', '1');
INSERT INTO `gw_chat_log` VALUES ('53', '2', 'helloword', '7f00000108fc00000002', '精灵小妹', '1489629291', '1');
INSERT INTO `gw_chat_log` VALUES ('54', '2', 'helloword', '7f00000108fc00000002', '精灵小妹', '1489629294', '2');
INSERT INTO `gw_chat_log` VALUES ('55', '1', 'helloword', '7f00000108fc00000003', '12312312', '1489629302', '2');
INSERT INTO `gw_chat_log` VALUES ('56', '1', 'helloword', '7f00000108fc00000004', '陈先生', '1489629340', '1');
INSERT INTO `gw_chat_log` VALUES ('57', '2', 'helloword', '7f00000108fc00000005', '精灵小妹', '1489629350', '1');
INSERT INTO `gw_chat_log` VALUES ('58', '1', 'helloword', '7f00000108fc0000001c', '陈先生', '1489629397', '1');
INSERT INTO `gw_chat_log` VALUES ('59', '2', 'helloword', '7f00000108fc0000001e', '精灵小妹', '1489629401', '1');
INSERT INTO `gw_chat_log` VALUES ('60', '2', 'helloword', '7f00000108fc0000001e', '精灵小妹', '1489629419', '2');
INSERT INTO `gw_chat_log` VALUES ('61', '2', 'helloword', '7f00000108fc00000020', '精灵小妹', '1489629438', '1');
INSERT INTO `gw_chat_log` VALUES ('62', '1', 'helloword', '7f00000108fc00000002', '陈先生', '1489629497', '1');
INSERT INTO `gw_chat_log` VALUES ('63', '2', 'helloword', '7f00000108fc00000001', '精灵小妹', '1489629501', '1');
INSERT INTO `gw_chat_log` VALUES ('64', '1', 'helloword', '7f00000108fc00000013', '陈先生', '1489629621', '1');
INSERT INTO `gw_chat_log` VALUES ('65', '2', 'helloword', '7f00000108fc00000014', '精灵小妹', '1489629636', '1');
INSERT INTO `gw_chat_log` VALUES ('66', '1', 'helloword', '7f00000108fc00000015', '陈先生', '1489629871', '1');
INSERT INTO `gw_chat_log` VALUES ('67', '1', 'helloword', '7f00000108fc00000016', '陈先生', '1489629872', '1');
INSERT INTO `gw_chat_log` VALUES ('68', '1', 'helloword', '7f00000108fc00000001', '陈先生', '1489629933', '1');
INSERT INTO `gw_chat_log` VALUES ('69', '1', 'helloword', '7f00000108fc00000003', '陈先生', '1489629935', '1');
INSERT INTO `gw_chat_log` VALUES ('70', '1', 'helloword', '7f00000108fc00000002', '陈先生', '1489630018', '1');
INSERT INTO `gw_chat_log` VALUES ('71', '1', 'helloword', '7f00000108fc00000003', '陈先生', '1489630019', '1');
INSERT INTO `gw_chat_log` VALUES ('72', '1', 'helloword', '7f00000108fc00000001', '陈先生', '1489631523', '1');
INSERT INTO `gw_chat_log` VALUES ('73', '1', 'helloword', '7f00000108fc00000001', '陈先生', '1489631627', '1');
INSERT INTO `gw_chat_log` VALUES ('74', '1', 'helloword', '7f00000108fc00000008', '陈先生', '1489631711', '1');
INSERT INTO `gw_chat_log` VALUES ('75', '1', 'helloword', '7f00000108fc00000017', '陈先生', '1489634874', '1');
INSERT INTO `gw_chat_log` VALUES ('76', '1', 'helloword', '7f00000108fc00000018', '陈先生', '1489634876', '1');
INSERT INTO `gw_chat_log` VALUES ('77', '1', 'helloword', '7f00000108fc00000019', '陈先生', '1489634893', '1');
INSERT INTO `gw_chat_log` VALUES ('78', '1', 'helloword', '7f00000108fc0000001a', '陈先生', '1489634957', '1');
INSERT INTO `gw_chat_log` VALUES ('79', '1', 'helloword', '7f00000108fc00000023', '陈先生', '1489634971', '1');
INSERT INTO `gw_chat_log` VALUES ('80', '1', 'helloword', '7f00000108fc00000025', '陈先生', '1489634972', '1');
INSERT INTO `gw_chat_log` VALUES ('81', '1', 'helloword', '7f00000108fc00000026', '陈先生', '1489634979', '1');
INSERT INTO `gw_chat_log` VALUES ('82', '1', 'helloword', '7f00000108fc00000027', '陈先生', '1489634979', '1');
INSERT INTO `gw_chat_log` VALUES ('83', '1', 'helloword', '7f00000108fc00000028', '陈先生', '1489634979', '1');
INSERT INTO `gw_chat_log` VALUES ('84', '1', 'helloword', '7f00000108fc00000029', '陈先生', '1489634998', '1');
INSERT INTO `gw_chat_log` VALUES ('85', '1', 'helloword', '7f00000108fc0000002a', '陈先生', '1489635002', '1');
INSERT INTO `gw_chat_log` VALUES ('86', '1', 'helloword', '7f00000108fc0000002b', '陈先生', '1489635026', '1');
INSERT INTO `gw_chat_log` VALUES ('87', '1', 'helloword', '7f00000108fc0000002c', '陈先生', '1489635063', '1');
INSERT INTO `gw_chat_log` VALUES ('88', '1', 'helloword', '7f00000108fc0000002d', '陈先生', '1489635073', '1');
INSERT INTO `gw_chat_log` VALUES ('89', '1', 'helloword', '7f00000108fc0000002e', '陈先生', '1489635079', '1');
INSERT INTO `gw_chat_log` VALUES ('90', '1', 'helloword', '7f00000108fc0000002f', '陈先生', '1489635080', '1');
INSERT INTO `gw_chat_log` VALUES ('91', '1', 'helloword', '7f00000108fc00000030', '陈先生', '1489635080', '1');
INSERT INTO `gw_chat_log` VALUES ('92', '1', 'helloword', '7f00000108fc00000031', '陈先生', '1489635086', '1');
INSERT INTO `gw_chat_log` VALUES ('93', '1', 'helloword', '7f00000108fc00000032', '陈先生', '1489635086', '1');
INSERT INTO `gw_chat_log` VALUES ('94', '1', 'helloword', '7f00000108fc00000033', '陈先生', '1489635087', '1');
INSERT INTO `gw_chat_log` VALUES ('95', '1', 'helloword', '7f00000108fc00000001', '陈先生', '1489635105', '1');
INSERT INTO `gw_chat_log` VALUES ('96', '1', 'helloword', '7f00000108fc00000003', '123123', '1489635113', '1');
INSERT INTO `gw_chat_log` VALUES ('97', '1', 'helloword', '7f00000108fc00000004', '123123', '1489635171', '1');
INSERT INTO `gw_chat_log` VALUES ('98', '1', 'helloword', '7f00000108fc00000001', '123123', '1489635178', '1');
INSERT INTO `gw_chat_log` VALUES ('99', '1', 'helloword', '7f00000108fc00000003', '123123', '1489635187', '1');
INSERT INTO `gw_chat_log` VALUES ('100', '1', 'helloword', '7f00000108fc00000004', '123123', '1489635197', '1');
INSERT INTO `gw_chat_log` VALUES ('101', '1', 'helloword', '7f00000108fc00000005', '123123', '1489635206', '1');
INSERT INTO `gw_chat_log` VALUES ('102', '1', 'helloword', '7f00000108fc00000001', '123123', '1489635310', '1');
INSERT INTO `gw_chat_log` VALUES ('103', '1', 'helloword', '7f00000108fc00000003', '123123', '1489635311', '1');
INSERT INTO `gw_chat_log` VALUES ('104', '2', 'helloword', '7f00000108fc00000002', '精灵小妹', '1489635333', '1');
INSERT INTO `gw_chat_log` VALUES ('105', '1', 'helloword', '7f00000108fc00000002', '123123', '1489635411', '1');
INSERT INTO `gw_chat_log` VALUES ('106', '2', 'helloword', '7f00000108fc00000001', '精灵小妹', '1489635414', '1');
INSERT INTO `gw_chat_log` VALUES ('107', '2', 'helloword', '7f00000108fc00000001', '精灵小妹', '1489635415', '2');
INSERT INTO `gw_chat_log` VALUES ('108', '2', 'helloword', '7f00000108fc00000003', '精灵小妹', '1489635418', '1');
INSERT INTO `gw_chat_log` VALUES ('109', '1', 'helloword', '7f00000108fc00000002', '123123', '1489635423', '2');
INSERT INTO `gw_chat_log` VALUES ('110', '1', 'helloword', '7f00000108fc00000004', '123123', '1489635423', '1');
INSERT INTO `gw_chat_log` VALUES ('111', '1', 'helloword', '7f00000108fc00000002', '123123', '1489635518', '1');
INSERT INTO `gw_chat_log` VALUES ('112', '2', 'helloword', '7f00000108fc00000006', '精灵小妹', '1489635531', '1');
INSERT INTO `gw_chat_log` VALUES ('113', '1', 'helloword', '7f00000108fc00000002', '123123', '1489635551', '2');
INSERT INTO `gw_chat_log` VALUES ('114', '1', 'helloword', '7f00000108fc00000007', '123123', '1489635551', '1');
INSERT INTO `gw_chat_log` VALUES ('115', '1', 'helloword', '7f00000108fc00000007', '123123', '1489635553', '2');
INSERT INTO `gw_chat_log` VALUES ('116', '1', 'helloword', '7f00000108fc00000008', '123', '1489635558', '1');
INSERT INTO `gw_chat_log` VALUES ('117', '2', 'helloword', '7f00000108fc00000006', '精灵小妹', '1489635657', '2');
INSERT INTO `gw_chat_log` VALUES ('118', '2', 'helloword', '7f00000108fc00000009', '精灵小妹', '1489635660', '1');
INSERT INTO `gw_chat_log` VALUES ('119', '1', 'helloword', '7f00000108fc0000001c', '123', '1489635822', '1');
INSERT INTO `gw_chat_log` VALUES ('120', '1', 'helloword', '7f00000108fc0000001d', '123', '1489635836', '1');
INSERT INTO `gw_chat_log` VALUES ('121', '2', 'helloword', '7f00000108fc0000001e', '精灵小妹', '1489635855', '1');
INSERT INTO `gw_chat_log` VALUES ('122', '2', 'helloword', '7f00000108fc0000001e', '精灵小妹', '1489636025', '2');
INSERT INTO `gw_chat_log` VALUES ('123', '2', 'helloword', '7f00000108fc0000001f', '精灵小妹', '1489636028', '1');
INSERT INTO `gw_chat_log` VALUES ('124', '2', 'helloword', '7f00000108fc0000001f', '精灵小妹', '1489636057', '2');
INSERT INTO `gw_chat_log` VALUES ('125', '2', 'helloword', '7f00000108fc00000020', '精灵小妹', '1489636059', '1');
INSERT INTO `gw_chat_log` VALUES ('126', '2', 'helloword', '7f00000108fc00000020', '精灵小妹', '1489636084', '2');
INSERT INTO `gw_chat_log` VALUES ('127', '2', 'helloword', '7f00000108fc00000021', '精灵小妹', '1489636086', '1');
INSERT INTO `gw_chat_log` VALUES ('128', '2', 'helloword', '7f00000108fc00000021', '精灵小妹', '1489636124', '2');
INSERT INTO `gw_chat_log` VALUES ('129', '2', 'helloword', '7f00000108fc00000022', '精灵小妹', '1489636127', '1');
INSERT INTO `gw_chat_log` VALUES ('130', '1', 'helloword', '7f00000108fc0000001d', '123', '1489644057', '2');
INSERT INTO `gw_chat_log` VALUES ('131', '1', 'helloword', '7f00000108fc00000023', '123', '1489644057', '1');
INSERT INTO `gw_chat_log` VALUES ('132', '1', 'helloword', '7f00000108fc00000023', '123', '1489644096', '2');
INSERT INTO `gw_chat_log` VALUES ('133', '1', 'helloword', '7f00000108fc00000024', '123', '1489644096', '1');
INSERT INTO `gw_chat_log` VALUES ('134', '1', 'helloword', '7f00000108fc00000024', '123', '1489644097', '2');
INSERT INTO `gw_chat_log` VALUES ('135', '1', 'helloword', '7f00000108fc00000025', '123', '1489644097', '1');
INSERT INTO `gw_chat_log` VALUES ('136', '1', 'helloword', '7f00000108fc00000025', '123', '1489644124', '2');
INSERT INTO `gw_chat_log` VALUES ('137', '1', 'helloword', '7f00000108fc00000026', '123', '1489644124', '1');
INSERT INTO `gw_chat_log` VALUES ('138', '1', 'helloword', '7f00000108fc00000026', '123', '1489644124', '2');
INSERT INTO `gw_chat_log` VALUES ('139', '1', 'helloword', '7f00000108fc00000027', '123', '1489644124', '1');
INSERT INTO `gw_chat_log` VALUES ('140', '1', 'helloword', '7f00000108fc00000027', '123', '1489644125', '2');
INSERT INTO `gw_chat_log` VALUES ('141', '1', 'helloword', '7f00000108fc00000028', '123', '1489644125', '1');
INSERT INTO `gw_chat_log` VALUES ('142', '1', 'helloword', '7f00000108fc00000028', '123', '1489644177', '2');
INSERT INTO `gw_chat_log` VALUES ('143', '1', 'helloword', '7f00000108fc00000029', '123', '1489644177', '1');
INSERT INTO `gw_chat_log` VALUES ('144', '1', 'helloword', '7f00000108fc00000029', '123', '1489644195', '2');
INSERT INTO `gw_chat_log` VALUES ('145', '1', 'helloword', '7f00000108fc0000002a', '123', '1489644195', '1');
INSERT INTO `gw_chat_log` VALUES ('146', '1', 'helloword', '7f00000108fc0000002a', '123', '1489644195', '2');
INSERT INTO `gw_chat_log` VALUES ('147', '1', 'helloword', '7f00000108fc0000002b', '123', '1489644196', '1');
INSERT INTO `gw_chat_log` VALUES ('148', '1', 'helloword', '7f00000108fc00000001', '123', '1489644243', '1');
INSERT INTO `gw_chat_log` VALUES ('149', '1', 'helloword', '7f00000108fc00000003', '123', '1489644246', '1');
INSERT INTO `gw_chat_log` VALUES ('150', '1', 'helloword', '7f00000108fc00000004', '123', '1489644247', '1');
INSERT INTO `gw_chat_log` VALUES ('151', '1', 'helloword', '7f00000108fc00000005', '123', '1489644247', '1');
INSERT INTO `gw_chat_log` VALUES ('152', '1', 'helloword', '7f00000108fc00000002', '123', '1489648342', '1');
INSERT INTO `gw_chat_log` VALUES ('153', '1', 'helloword', '7f00000108fc00000003', '123', '1489648347', '1');
INSERT INTO `gw_chat_log` VALUES ('154', '1', 'helloword', '7f00000108fc00000004', '123', '1489648360', '1');
INSERT INTO `gw_chat_log` VALUES ('155', '1', 'helloword', '7f00000108fc00000002', '123', '1489648380', '1');
INSERT INTO `gw_chat_log` VALUES ('156', '1', 'helloword', '7f00000108fc00000003', '123', '1489648382', '1');
INSERT INTO `gw_chat_log` VALUES ('157', '1', 'helloword', '7f00000108fc00000002', '123', '1489648412', '1');
INSERT INTO `gw_chat_log` VALUES ('158', '1', 'helloword', '7f00000108fc00000009', '123', '1489649627', '1');
INSERT INTO `gw_chat_log` VALUES ('159', '1', 'helloword', '7f00000108fc00000001', '123', '1489649742', '1');
INSERT INTO `gw_chat_log` VALUES ('160', '1', 'helloword', '7f00000108fc00000003', '123', '1489649746', '1');
INSERT INTO `gw_chat_log` VALUES ('161', '1', 'helloword', '7f00000108fc00000002', '123', '1489650356', '1');
INSERT INTO `gw_chat_log` VALUES ('162', '1', 'helloword', '7f00000108fc00000003', '123', '1489650360', '1');
INSERT INTO `gw_chat_log` VALUES ('163', '1', 'helloword', '7f00000108fc00000001', '123', '1489650575', '1');
INSERT INTO `gw_chat_log` VALUES ('164', '1', 'helloword', '7f00000108fc00000003', '123', '1489650586', '1');
INSERT INTO `gw_chat_log` VALUES ('165', '1', 'helloword', '7f00000108fc00000012', '123', '1489650622', '1');
INSERT INTO `gw_chat_log` VALUES ('166', '1', 'helloword', '7f00000108fc00000014', '123', '1489650650', '1');
INSERT INTO `gw_chat_log` VALUES ('167', '1', 'helloword', '7f00000108fc00000002', '123', '1489650676', '1');
INSERT INTO `gw_chat_log` VALUES ('168', '1', 'helloword', '7f00000108fc00000001', '123', '1489650728', '1');
INSERT INTO `gw_chat_log` VALUES ('169', '1', 'helloword', '7f00000108fc00000003', '123', '1489650733', '1');
INSERT INTO `gw_chat_log` VALUES ('170', '1', 'helloword', '7f00000108fc00000002', '123', '1489652822', '1');
INSERT INTO `gw_chat_log` VALUES ('171', '1', 'helloword', '7f00000108fc00000003', '123', '1489652828', '1');
INSERT INTO `gw_chat_log` VALUES ('172', '1', 'helloword', '7f00000108fc00000001', '123', '1489652886', '1');
INSERT INTO `gw_chat_log` VALUES ('173', '1', 'helloword', '7f00000108fc00000003', '123', '1489652896', '1');
INSERT INTO `gw_chat_log` VALUES ('174', '1', 'helloword', '7f00000108fc00000004', '123', '1489652897', '1');
INSERT INTO `gw_chat_log` VALUES ('175', '1', 'helloword', '7f00000108fc00000002', '123', '1489653689', '1');
INSERT INTO `gw_chat_log` VALUES ('176', '1', 'helloword', '7f00000108fc00000003', '123', '1489653746', '1');
INSERT INTO `gw_chat_log` VALUES ('177', '1', 'helloword', '7f00000108fc00000015', '123', '1489653805', '1');
INSERT INTO `gw_chat_log` VALUES ('178', '1', 'helloword', '7f00000108fc00000016', '123', '1489653807', '1');
INSERT INTO `gw_chat_log` VALUES ('179', '1', 'helloword', '7f00000108fc00000001', '123', '1489653872', '1');
INSERT INTO `gw_chat_log` VALUES ('180', '1', 'helloword', '7f00000108fc00000003', '123', '1489653889', '1');
INSERT INTO `gw_chat_log` VALUES ('181', '1', 'helloword', '7f00000108fc00000002', '123', '1489655263', '1');
INSERT INTO `gw_chat_log` VALUES ('182', '1', 'helloword', '7f00000108fc00000003', '123', '1489655265', '1');
INSERT INTO `gw_chat_log` VALUES ('183', '1', 'helloword', '7f00000108fc00000004', '123', '1489655266', '1');
INSERT INTO `gw_chat_log` VALUES ('184', '1', 'helloword', '7f00000108fc00000007', '123', '1489655536', '1');
INSERT INTO `gw_chat_log` VALUES ('185', '1', 'helloword', '7f00000108fc00000008', '123', '1489655539', '1');
INSERT INTO `gw_chat_log` VALUES ('186', '1', 'helloword', '7f00000108fc00000001', '123', '1489655626', '1');
INSERT INTO `gw_chat_log` VALUES ('187', '1', 'helloword', '7f00000108fc00000003', '123', '1489655627', '1');
INSERT INTO `gw_chat_log` VALUES ('188', '1', 'helloword', '7f00000108fc00000002', '123', '1489656004', '1');
INSERT INTO `gw_chat_log` VALUES ('189', '1', 'helloword', '7f00000108fc00000003', '123', '1489656008', '1');
INSERT INTO `gw_chat_log` VALUES ('190', '1', 'helloword', '7f00000108fc0000001e', '123', '1489656059', '1');
INSERT INTO `gw_chat_log` VALUES ('191', '1', 'helloword', '7f00000108fc0000001f', '123', '1489656060', '1');
INSERT INTO `gw_chat_log` VALUES ('192', '1', 'helloword', '7f00000108fc00000001', '123', '1489656146', '1');
INSERT INTO `gw_chat_log` VALUES ('193', '1', 'helloword', '7f00000108fc00000003', '123', '1489656148', '1');
INSERT INTO `gw_chat_log` VALUES ('194', '1', 'helloword', '7f00000108fc00000002', '123', '1489656249', '1');
INSERT INTO `gw_chat_log` VALUES ('195', '1', 'helloword', '7f00000108fc00000003', '123', '1489656252', '1');
INSERT INTO `gw_chat_log` VALUES ('196', '1', 'helloword', '7f00000108fc00000001', '123', '1489656298', '1');
INSERT INTO `gw_chat_log` VALUES ('197', '1', 'helloword', '7f00000108fc00000003', '123', '1489656309', '1');
INSERT INTO `gw_chat_log` VALUES ('198', '1', 'helloword', '7f00000108fc00000004', '123', '1489656320', '1');
INSERT INTO `gw_chat_log` VALUES ('199', '1', 'helloword', '7f00000108fc0000002d', '123', '1489656387', '1');
INSERT INTO `gw_chat_log` VALUES ('200', '1', 'helloword', '7f00000108fc0000002e', '123', '1489656392', '1');
INSERT INTO `gw_chat_log` VALUES ('201', '1', 'helloword', '7f00000108fc00000001', '123', '1489656627', '1');
INSERT INTO `gw_chat_log` VALUES ('202', '1', 'helloword', '7f00000108fc00000003', '123', '1489656634', '1');
INSERT INTO `gw_chat_log` VALUES ('203', '1', 'helloword', '7f00000108fc00000001', '123', '1489656888', '1');
INSERT INTO `gw_chat_log` VALUES ('204', '1', 'helloword', '7f00000108fc00000003', '123', '1489656890', '1');
INSERT INTO `gw_chat_log` VALUES ('205', '1', 'helloword', '7f00000108fc00000001', '123', '1489657121', '1');
INSERT INTO `gw_chat_log` VALUES ('206', '1', 'helloword', '7f00000108fc00000003', '123', '1489657124', '1');
INSERT INTO `gw_chat_log` VALUES ('207', '1', 'helloword', '7f00000108fc00000004', '123', '1489657125', '1');
INSERT INTO `gw_chat_log` VALUES ('208', '1', 'helloword', '7f00000108fc00000002', '123', '1489657339', '1');
INSERT INTO `gw_chat_log` VALUES ('209', '1', 'helloword', '7f00000108fc00000009', '123', '1489657610', '1');
INSERT INTO `gw_chat_log` VALUES ('210', '1', 'helloword', '7f00000108fc0000000b', '123', '1489657612', '1');
INSERT INTO `gw_chat_log` VALUES ('211', '1', 'helloword', '7f00000108fc00000002', '123', '1489657637', '1');
INSERT INTO `gw_chat_log` VALUES ('212', '1', 'helloword', '7f00000108fc00000001', '123', '1489658443', '1');
INSERT INTO `gw_chat_log` VALUES ('213', '1', 'helloword', '7f00000108fc00000003', '123', '1489658450', '1');
INSERT INTO `gw_chat_log` VALUES ('214', '1', 'helloword', '7f00000108fc00000004', '123', '1489658452', '1');
INSERT INTO `gw_chat_log` VALUES ('215', '1', 'helloword', '7f00000108fc00000003', '123', '1489658616', '1');
INSERT INTO `gw_chat_log` VALUES ('216', '1', 'helloword', '7f00000108fc00000004', '123', '1489658619', '1');
INSERT INTO `gw_chat_log` VALUES ('217', '1', 'helloword', '7f00000108fc00000001', '123', '1489658662', '1');
INSERT INTO `gw_chat_log` VALUES ('218', '1', 'helloword', '7f00000108fc00000003', '123', '1489658663', '1');
INSERT INTO `gw_chat_log` VALUES ('219', '1', 'helloword', '7f00000108fc00000004', '123', '1489658732', '1');
INSERT INTO `gw_chat_log` VALUES ('220', '1', 'helloword', '7f00000108fc00000005', '123', '1489658733', '1');
INSERT INTO `gw_chat_log` VALUES ('221', '1', 'helloword', '7f00000108fc00000001', '123', '1489658795', '1');
INSERT INTO `gw_chat_log` VALUES ('222', '1', 'helloword', '7f00000108fc00000003', '123', '1489658798', '1');
INSERT INTO `gw_chat_log` VALUES ('223', '1', 'helloword', '7f00000108fc00000004', '123', '1489658807', '1');
INSERT INTO `gw_chat_log` VALUES ('224', '2', 'helloword', '7f00000108fc00000002', '精灵小妹', '1489659024', '1');
INSERT INTO `gw_chat_log` VALUES ('225', '1', 'helloword', '7f00000108fc00000002', '123', '1489716929', '1');
INSERT INTO `gw_chat_log` VALUES ('226', '1', 'helloword', '7f00000108fc00000004', '123', '1489716934', '1');
INSERT INTO `gw_chat_log` VALUES ('227', '1', 'helloword', '7f00000108fc00000005', '123', '1489716940', '1');
INSERT INTO `gw_chat_log` VALUES ('228', '1', 'helloword', '7f00000108fc00000002', '123', '1489717110', '1');
INSERT INTO `gw_chat_log` VALUES ('229', '1', 'helloword', '7f00000108fc00000003', '123', '1489717114', '1');
INSERT INTO `gw_chat_log` VALUES ('230', '1', 'helloword', '7f00000108fc00000004', '123', '1489717116', '1');
INSERT INTO `gw_chat_log` VALUES ('231', '1', 'helloword', '7f00000108fc00000003', '123', '1489717140', '1');
INSERT INTO `gw_chat_log` VALUES ('232', '1', 'helloword', '7f00000108fc00000004', '123', '1489717141', '1');
INSERT INTO `gw_chat_log` VALUES ('233', '1', 'helloword', '7f00000108fc00000005', '123', '1489717189', '1');
INSERT INTO `gw_chat_log` VALUES ('234', '1', 'helloword', '7f00000108fc00000002', '123', '1489717283', '1');
INSERT INTO `gw_chat_log` VALUES ('235', '1', 'helloword', '7f00000108fc00000002', '123', '1489717504', '1');
INSERT INTO `gw_chat_log` VALUES ('236', '1', 'helloword', '7f00000108fc00000003', '123', '1489717507', '1');
INSERT INTO `gw_chat_log` VALUES ('237', '1', 'helloword', '7f00000108fc00000004', '123', '1489717509', '1');
INSERT INTO `gw_chat_log` VALUES ('238', '1', 'helloword', '7f00000108fc00000002', '123', '1489719676', '1');
INSERT INTO `gw_chat_log` VALUES ('239', '1', 'helloword', '7f00000108fc00000003', '123', '1489719683', '1');
INSERT INTO `gw_chat_log` VALUES ('240', '1', 'helloword', '7f00000108fc00000004', '123', '1489719687', '1');
INSERT INTO `gw_chat_log` VALUES ('241', '1', 'helloword', '7f00000108fc00000001', '123', '1489719768', '1');
INSERT INTO `gw_chat_log` VALUES ('242', '1', 'helloword', '7f00000108fc00000003', '123', '1489719769', '1');
INSERT INTO `gw_chat_log` VALUES ('243', '1', 'helloword', '7f00000108fc00000005', '123', '1489721090', '1');
INSERT INTO `gw_chat_log` VALUES ('244', '1', 'helloword', '7f00000108fc00000007', '123', '1489721094', '1');
INSERT INTO `gw_chat_log` VALUES ('245', '1', 'helloword', '7f00000108fc00000008', '123', '1489721105', '1');
INSERT INTO `gw_chat_log` VALUES ('246', '1', 'helloword', '7f00000108fc00000001', '123', '1489721111', '1');
INSERT INTO `gw_chat_log` VALUES ('247', '1', 'helloword', '7f00000108fc00000003', '123', '1489721112', '1');
INSERT INTO `gw_chat_log` VALUES ('248', '1', 'helloword', '7f00000108fc00000002', '123', '1489721271', '1');
INSERT INTO `gw_chat_log` VALUES ('249', '1', 'helloword', '7f00000108fc00000001', '123', '1489721594', '1');
INSERT INTO `gw_chat_log` VALUES ('250', '1', 'helloword', '7f00000108fc00000003', '123', '1489721599', '1');
INSERT INTO `gw_chat_log` VALUES ('251', '1', 'helloword', '7f00000108fc00000004', '123', '1489721602', '1');
INSERT INTO `gw_chat_log` VALUES ('252', '1', 'helloword', '7f00000108fc00000002', '123', '1489722090', '1');
INSERT INTO `gw_chat_log` VALUES ('253', '1', 'helloword', '7f00000108fc00000003', '123', '1489722092', '1');
INSERT INTO `gw_chat_log` VALUES ('254', '1', 'helloword', '7f00000108fc00000004', '123', '1489722982', '1');
INSERT INTO `gw_chat_log` VALUES ('255', '1', 'helloword', '7f00000108fc00000001', '123', '1489722998', '1');
INSERT INTO `gw_chat_log` VALUES ('256', '1', 'helloword', '7f00000108fc00000003', '123123123', '1489723058', '1');
INSERT INTO `gw_chat_log` VALUES ('257', '1', 'helloword', '7f00000108fc00000004', '123123123', '1489723080', '1');
INSERT INTO `gw_chat_log` VALUES ('258', '1', 'helloword', '7f00000108fc00000005', '123123123', '1489723083', '1');
INSERT INTO `gw_chat_log` VALUES ('259', '1', 'helloword', '7f00000108fc00000006', '123123123', '1489723084', '1');
INSERT INTO `gw_chat_log` VALUES ('260', '1', 'helloword', '7f00000108fc00000007', '123123123', '1489723084', '1');
INSERT INTO `gw_chat_log` VALUES ('261', '1', 'helloword', '7f00000108fc00000008', '123123123', '1489723090', '1');
INSERT INTO `gw_chat_log` VALUES ('262', '1', 'helloword', '7f00000108fc00000009', '123123123', '1489723091', '1');
INSERT INTO `gw_chat_log` VALUES ('263', '1', 'helloword', '7f00000108fc0000000a', '123123123', '1489723091', '1');
INSERT INTO `gw_chat_log` VALUES ('264', '1', 'helloword', '7f00000108fc0000000b', '123123123', '1489723091', '1');
INSERT INTO `gw_chat_log` VALUES ('265', '1', 'helloword', '7f00000108fc0000000c', '123123123', '1489723092', '1');
INSERT INTO `gw_chat_log` VALUES ('266', '1', 'helloword', '7f00000108fc0000000d', '123', '1489723127', '1');
INSERT INTO `gw_chat_log` VALUES ('267', '1', 'helloword', '7f00000108fc00000002', '123', '1489723161', '1');
INSERT INTO `gw_chat_log` VALUES ('268', '1', 'helloword', '7f00000108fc00000003', '123', '1489723163', '1');
INSERT INTO `gw_chat_log` VALUES ('269', '1', 'helloword', '7f00000108fc00000001', '123', '1489723231', '1');
INSERT INTO `gw_chat_log` VALUES ('270', '1', 'helloword', '7f00000108fc00000003', '123', '1489723233', '1');
INSERT INTO `gw_chat_log` VALUES ('271', '2', 'helloword', '7f00000108fc00000005', '精灵小妹', '1489723242', '1');
INSERT INTO `gw_chat_log` VALUES ('272', '1', 'helloword', '7f00000108fc00000001', '123', '1489723458', '1');
INSERT INTO `gw_chat_log` VALUES ('273', '2', 'helloword', '7f00000108fc00000003', '精灵小妹', '1489723464', '1');
INSERT INTO `gw_chat_log` VALUES ('274', '1', 'helloword', '7f00000108fc00000001', '123', '1489723466', '2');
INSERT INTO `gw_chat_log` VALUES ('275', '1', 'helloword', '7f00000108fc00000004', '123', '1489723466', '1');

-- ----------------------------
-- Table structure for gw_chat_msg
-- ----------------------------
DROP TABLE IF EXISTS `gw_chat_msg`;
CREATE TABLE `gw_chat_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(100) NOT NULL,
  `client_id` varchar(100) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1. 收到  2. 发出',
  `content` varchar(2500) NOT NULL,
  `send_time` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='咨询消息';

-- ----------------------------
-- Records of gw_chat_msg
-- ----------------------------
INSERT INTO `gw_chat_msg` VALUES ('1', 'helloword', '7f00000108fc00000001', '12312312', '1', '123123123', '1489568800', '1');
INSERT INTO `gw_chat_msg` VALUES ('2', 'helloword', '7f00000108fc00000001', '12312312', '2', '是单纯的测算得出', '1489568839', '1');
INSERT INTO `gw_chat_msg` VALUES ('3', 'helloword', '7f00000108fc00000001', '12312312', '2', 'dscsdcsd', '1489568858', '1');
INSERT INTO `gw_chat_msg` VALUES ('4', 'helloword', '7f00000108fc00000001', '12312312', '2', '四大措施调查', '1489568859', '1');
INSERT INTO `gw_chat_msg` VALUES ('5', 'helloword', '7f00000108fc00000001', '12312312', '1', 'sdcsdcsdcsdc<br />\n', '1489568864', '1');
INSERT INTO `gw_chat_msg` VALUES ('6', 'helloword', '7f00000108fc00000001', '12312312', '1', 'sdcsdcdcdss<br />\ndsfsdfsdf', '1489568983', '1');
INSERT INTO `gw_chat_msg` VALUES ('7', 'helloword', '7f00000108fc00000001', '12312312', '2', '》<br />\n', '1489569240', '1');
INSERT INTO `gw_chat_msg` VALUES ('8', 'helloword', '7f00000108fc00000001', '12312312', '2', '&gt;<br />\n', '1489569243', '1');
INSERT INTO `gw_chat_msg` VALUES ('9', 'helloword', '7f00000108fc00000001', '12312312', '2', '&gt;', '1489569246', '1');
INSERT INTO `gw_chat_msg` VALUES ('10', 'helloword', '7f00000108fc00000001', '12312312', '2', '&amp;<br />\n', '1489569502', '1');
INSERT INTO `gw_chat_msg` VALUES ('11', 'helloword', '7f00000108fc00000001', '12312312', '2', '!@#$%%^&amp;*(())_++', '1489569509', '1');
INSERT INTO `gw_chat_msg` VALUES ('12', 'helloword', '7f00000108fc00000025', '12312312', '1', '结婚的多少 ', '1489625868', '1');
INSERT INTO `gw_chat_msg` VALUES ('13', 'helloword', '7f00000108fc00000025', '12312312', '1', 'sdcsdcd四大措施调查<br />\nsdfsdf<br />\n', '1489627976', '1');
INSERT INTO `gw_chat_msg` VALUES ('14', 'helloword', '7f00000108fc00000003', '12312312', '1', 'sdcds<br />\nsdcsd<br />\nsdcs', '1489628946', '1');
INSERT INTO `gw_chat_msg` VALUES ('15', 'helloword', '7f00000108fc00000004', '陈先生', '2', 'sdfsdfsdsdf<br />\nsdf', '1489629361', '1');
INSERT INTO `gw_chat_msg` VALUES ('16', 'helloword', '7f00000108fc0000001c', '陈先生', '2', 'sdc<br />\ndc<br />\ndsc', '1489629405', '1');
INSERT INTO `gw_chat_msg` VALUES ('17', 'helloword', '7f00000108fc00000013', '陈先生', '2', '速度sdc<br />\ncd<br />\ncds', '1489629641', '1');
INSERT INTO `gw_chat_msg` VALUES ('18', 'helloword', '7f00000108fc00000003', '123123', '1', '[em_20][em_24]', '1489635338', '1');
INSERT INTO `gw_chat_msg` VALUES ('19', 'helloword', '7f00000108fc00000004', '123123', '1', '[em_2][em_3]', '1489635427', '1');
INSERT INTO `gw_chat_msg` VALUES ('20', 'helloword', '7f00000108fc00000004', '123123', '1', '[em_3]<br />\n[em_17]', '1489635438', '1');
INSERT INTO `gw_chat_msg` VALUES ('21', 'helloword', '7f00000108fc00000002', '123123', '2', '[em_31][em_3][em_8]<br />\n[em_17]', '1489635546', '1');
INSERT INTO `gw_chat_msg` VALUES ('22', 'helloword', '7f00000108fc00000008', '123', '2', '[em_17]<br />\n[em_2]', '1489635568', '1');
INSERT INTO `gw_chat_msg` VALUES ('23', 'helloword', '7f00000108fc00000008', '123', '1', '[em_20]<br />\nsd[em_3]', '1489635577', '1');
INSERT INTO `gw_chat_msg` VALUES ('24', 'helloword', '7f00000108fc00000008', '123', '1', 'sdc[em_3]', '1489635590', '1');
INSERT INTO `gw_chat_msg` VALUES ('25', 'helloword', '7f00000108fc00000008', '123', '2', '[em_1]dscsdcdscsdcsdc', '1489635605', '1');
INSERT INTO `gw_chat_msg` VALUES ('26', 'helloword', '7f00000108fc00000008', '123', '2', '[em_18]csdcdsc', '1489635613', '1');
INSERT INTO `gw_chat_msg` VALUES ('27', 'helloword', '7f00000108fc00000008', '123', '1', '123123123[em_18]', '1489635618', '1');
INSERT INTO `gw_chat_msg` VALUES ('28', 'helloword', '7f00000108fc00000008', '123', '2', '[em_19]sdcdscfsd<br />\n', '1489635637', '1');
INSERT INTO `gw_chat_msg` VALUES ('29', 'helloword', '7f00000108fc00000008', '123', '1', '1231231231', '1489635641', '1');
INSERT INTO `gw_chat_msg` VALUES ('30', 'helloword', '7f00000108fc00000008', '123', '2', '123123123123123[em_3]', '1489635665', '1');
INSERT INTO `gw_chat_msg` VALUES ('31', 'helloword', '7f00000108fc00000008', '123', '1', '123123123123[em_20]', '1489635671', '1');
INSERT INTO `gw_chat_msg` VALUES ('32', 'helloword', '7f00000108fc00000008', '123', '1', '[em_49]<br />\n123123[em_34]', '1489635682', '1');
INSERT INTO `gw_chat_msg` VALUES ('33', 'helloword', '7f00000108fc0000001d', '123', '1', '[em_50][em_21]<br />\ndsdcs', '1489635888', '1');
INSERT INTO `gw_chat_msg` VALUES ('34', 'helloword', '7f00000108fc0000001d', '123', '2', '1231231', '1489635894', '1');
INSERT INTO `gw_chat_msg` VALUES ('35', 'helloword', '7f00000108fc0000001d', '123', '1', '1231231', '1489635897', '1');
INSERT INTO `gw_chat_msg` VALUES ('36', 'helloword', '7f00000108fc0000001d', '123', '2', '[em_2]<br />\nsdcsd[em_3]', '1489635994', '1');
INSERT INTO `gw_chat_msg` VALUES ('37', 'helloword', '7f00000108fc0000001d', '123', '2', '23123', '1489636034', '1');
INSERT INTO `gw_chat_msg` VALUES ('38', 'helloword', '7f00000108fc0000001d', '123', '2', '1231231', '1489636035', '1');
INSERT INTO `gw_chat_msg` VALUES ('39', 'helloword', '7f00000108fc0000001d', '123', '2', '12312', '1489636036', '1');
INSERT INTO `gw_chat_msg` VALUES ('40', 'helloword', '7f00000108fc0000001d', '123', '2', '1123123', '1489636038', '1');
INSERT INTO `gw_chat_msg` VALUES ('41', 'helloword', '7f00000108fc0000001d', '123', '2', '123123123', '1489636070', '1');
INSERT INTO `gw_chat_msg` VALUES ('42', 'helloword', '7f00000108fc0000001d', '123', '2', '123123123[em_17]', '1489636140', '1');
INSERT INTO `gw_chat_msg` VALUES ('43', 'helloword', '7f00000108fc0000001d', '123', '2', '123131231[em_38]', '1489636147', '1');
INSERT INTO `gw_chat_msg` VALUES ('44', 'helloword', '7f00000108fc0000001d', '123', '2', '[em_18]<br />\n[em_18]', '1489636155', '1');
INSERT INTO `gw_chat_msg` VALUES ('45', 'helloword', '7f00000108fc0000001d', '123', '2', '[em_28]<br />\nsdc<br />\ncd[em_19]<br />\n', '1489636182', '1');
INSERT INTO `gw_chat_msg` VALUES ('46', 'helloword', '7f00000108fc0000001d', '123', '2', '[em_17][em_20][em_22]', '1489636197', '1');
INSERT INTO `gw_chat_msg` VALUES ('47', 'helloword', '7f00000108fc00000004', '123', '1', '[em_36]', '1489659029', '1');
INSERT INTO `gw_chat_msg` VALUES ('48', 'helloword', '7f00000108fc00000004', '123', '2', '[em_6]', '1489659034', '1');
INSERT INTO `gw_chat_msg` VALUES ('49', 'helloword', '7f00000108fc00000003', '123', '1', 'http://img.com/upload/20170317/20170317040047508.png', '1489723247', '1');
INSERT INTO `gw_chat_msg` VALUES ('50', 'helloword', '7f00000108fc00000004', '123', '1', '<img src=\'http://img.com/upload/20170317/20170317040429854.jpg\' style=\'width:50%\'>', '1489723469', '1');
INSERT INTO `gw_chat_msg` VALUES ('51', 'helloword', '7f00000108fc00000004', '123', '1', '<img src=\'http://img.com/upload/20170317/20170317040434418.jpg\' style=\'width:50%\'>', '1489723474', '1');
INSERT INTO `gw_chat_msg` VALUES ('52', 'helloword', '7f00000108fc00000004', '123', '1', '<img src=\'http://img.com/upload/20170317/20170317040439571.jpg\' style=\'width:50%\'>', '1489723479', '1');
INSERT INTO `gw_chat_msg` VALUES ('53', 'helloword', '7f00000108fc00000004', '123', '2', '[em_23]', '1489723519', '1');
INSERT INTO `gw_chat_msg` VALUES ('54', 'helloword', '7f00000108fc00000004', '123', '1', 'sd [em_39]', '1489723528', '1');

-- ----------------------------
-- Table structure for gw_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `gw_chat_user`;
CREATE TABLE `gw_chat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_secret` varchar(50) NOT NULL DEFAULT '' COMMENT '客服生成的唯一标识串 房间号',
  `admin_client_id` varchar(100) NOT NULL,
  `admin_pass` int(11) NOT NULL COMMENT '进入的密码',
  `admin_name` varchar(100) NOT NULL,
  `admin_img` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='客服';

-- ----------------------------
-- Records of gw_chat_user
-- ----------------------------
INSERT INTO `gw_chat_user` VALUES ('1', 'helloword', '', '123456', '精灵小妹', '/img/admin.png', '1');
