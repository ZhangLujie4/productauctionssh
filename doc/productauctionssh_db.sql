/*
 Navicat Premium Data Transfer

 Source Server         : zhanglujie
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : productauctionssh_db

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 16/09/2018 23:24:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Car
-- ----------------------------
DROP TABLE IF EXISTS `Car`;
CREATE TABLE `Car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `goodsid` varchar(255) DEFAULT NULL,
  `maxprice` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `fkstatus` varchar(255) DEFAULT NULL,
  `fhstatus` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `shr` varchar(255) DEFAULT NULL,
  `shtel` varchar(255) DEFAULT NULL,
  `shaddr` varchar(255) DEFAULT NULL,
  `saleid` varchar(255) DEFAULT NULL,
  `thstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Car
-- ----------------------------
BEGIN;
INSERT INTO `Car` VALUES (3, '0113011902', '2', '1', '600', '588.0', '已付款', '已发货', '已签收', '冯涛', '138937843498', '武汉光谷广场', '1', '');
COMMIT;

-- ----------------------------
-- Table structure for Gongneng
-- ----------------------------
DROP TABLE IF EXISTS `Gongneng`;
CREATE TABLE `Gongneng` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Gongneng
-- ----------------------------
BEGIN;
INSERT INTO `Gongneng` VALUES (2, '拍品信息管理', '', '1');
INSERT INTO `Gongneng` VALUES (3, '拍品管理', 'goodslist.jsp', '0');
INSERT INTO `Gongneng` VALUES (6, '人员管理', '', '1');
INSERT INTO `Gongneng` VALUES (7, '会员管理', 'huiyuanmanager.jsp', '0');
INSERT INTO `Gongneng` VALUES (10, '拍卖管理', 'dingdanmanager.jsp', '1');
INSERT INTO `Gongneng` VALUES (11, '管理员管理', 'usersmanager.jsp', '1');
INSERT INTO `Gongneng` VALUES (12, '基础信息', '', '0');
INSERT INTO `Gongneng` VALUES (13, '友情链接管理', 'yqljlist.jsp', '1');
INSERT INTO `Gongneng` VALUES (14, '系统公告管理', 'noticelist.jsp', '1');
INSERT INTO `Gongneng` VALUES (15, '焦点图管理', 'imglist.jsp', '1');
INSERT INTO `Gongneng` VALUES (16, '在线留言管理', 'liuyanlist.jsp', '1');
INSERT INTO `Gongneng` VALUES (17, '举报管理', 'jubaolist.jsp', '1');
INSERT INTO `Gongneng` VALUES (18, '系统设置', '', '0');
INSERT INTO `Gongneng` VALUES (19, '修改密码', 'modifypw.jsp', '1');
INSERT INTO `Gongneng` VALUES (20, '测试', '', '1');
INSERT INTO `Gongneng` VALUES (21, '测试', 'aa.jsp', '1');
INSERT INTO `Gongneng` VALUES (22, '拍品类别管理', 'producttypelist.jsp', '1');
COMMIT;

-- ----------------------------
-- Table structure for Goods
-- ----------------------------
DROP TABLE IF EXISTS `Goods`;
CREATE TABLE `Goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `jiajia` int(11) DEFAULT NULL,
  `shuishou` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `content` text,
  `delstatus` varchar(255) DEFAULT NULL,
  `stime` varchar(255) DEFAULT NULL,
  `etime` varchar(255) DEFAULT NULL,
  `maxprice` int(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `cs` int(11) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `chengdu` varchar(255) DEFAULT NULL,
  `buytime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Goods
-- ----------------------------
BEGIN;
INSERT INTO `Goods` VALUES (1, '蜘蛛纹手串', 200, 100, 2, '3', '/productauctionssh/upfile/20171216142859.jpg', '交易完成', '<img src=\"/productauctionssh/attached/image/20180107/20180107155101_264.jpg\" alt=\"\" />', '0', '2018-01-08 20:29:35', '2018-01-13 13:19:00', 600, '1', 46, '通过审核', '九成新', '2018-01-07');
INSERT INTO `Goods` VALUES (2, '持莲观音', 300, 120, 3, '3', '/productauctionssh/upfile/20171216145623.jpg', '正在拍卖', '<img src=\"/productauctionssh/attached/image/20180107/20180107155045_809.jpg\" alt=\"\" />', '0', '2018-01-08 20:29:35', '2018-12-13 23:50:00', 780, '1', 44, '通过审核', '八成新', '2018-01-07');
INSERT INTO `Goods` VALUES (3, '童子戏佛', 350, 150, 5, '3', '/productauctionssh/upfile/20171216145913.jpg', '正在拍卖', '<img src=\"/productauctionssh/attached/image/20180107/20180107155031_317.jpg\" alt=\"\" />....', '0', '2018-01-08 19:29:35', '2018-12-13 23:50:00', 500, '1', 32, '通过审核', '全新', '2018-01-07');
INSERT INTO `Goods` VALUES (4, '矿紫泥', 500, 210, 6, '3', '/productauctionssh/upfile/20171216150438.jpg', '正在拍卖', '<p>\r\n	<img src=\"/productauctionssh/attached/image/20180113/20180113131423_193.jpg\" alt=\"\" /><img src=\"/productauctionssh/attached/image/20180107/20180107154515_697.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/productauctionssh/attached/image/20180113/20180113131431_770.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	11111111111111111111111111111111111111111111111111111111\r\n</p>', '0', '2018-01-08 20:29:35', '2018-12-13 23:44:00', 2000000, '1', 15, '通过审核', '七成新', '2018-01-07');
INSERT INTO `Goods` VALUES (5, '花鸟四条屏', 320, 120, 5, '3', '/productauctionssh/upfile/20171216142859.jpg', '正在拍卖', '<p>\r\n	<img src=\"/productauctionssh/attached/image/20180108/20180108115328_422.jpg\" alt=\"\" /><img src=\"/productauctionssh/attached/image/20180113/20180113115947_21.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/productauctionssh/attached/image/20180113/20180113120004_248.jpg\" alt=\"\" />\r\n</p>', '0', '2018-01-08 14:22:54', '2018-12-13 14:33:56', 320, '1', 38, '通过审核', '八成新', '2018-01-07');
INSERT INTO `Goods` VALUES (11, '猛犸象牙', 200, 100, 2, '4', '/productauctionssh/upfile/20180107155400.jpg', '等待拍卖', '<img src=\"/productauctionssh/attached/image/20180107/20180107155602_129.jpg\" alt=\"\" />', '0', '2018-01-08 15:55:23', '2018-01-13 23:56:07', 1000, '3', 110, '通过审核', '全新', '2018-01-08');
INSERT INTO `Goods` VALUES (12, '玉山坑水波纹', 500, 100, 4, '4', '/productauctionssh/upfile/20180109113309.jpg', '正在拍卖', '<img src=\"/productauctionssh/attached/image/20180109/20180109113022_85.jpg\" alt=\"\" />', '0', '2018-01-09 11:30:24', '2018-01-25 11:29:21', 500, '4', 3, '待审核', '九成新', '2018-01-09');
INSERT INTO `Goods` VALUES (13, '董牧之', 2, 100, 0, '3', '/productauctionssh/upfile/no.jpg', '正在拍卖', '么么哒', '0', '2018-09-06 23:37:08', '2018-10-06 23:36:53', 100000, '2', 6, '通过审核', '全新', '2018-09-13');
INSERT INTO `Goods` VALUES (14, '蜘蛛螺纹凤盏玲珑', 23, 12, 0, '3', '/productauctionssh/upfile/no.jpg', '正在拍卖', '', '0', '2018-09-13 20:48:27', '2018-09-21 20:48:23', 23, '2', 0, '待审核', '全新', '2018-09-19');
COMMIT;

-- ----------------------------
-- Table structure for Imgv
-- ----------------------------
DROP TABLE IF EXISTS `Imgv`;
CREATE TABLE `Imgv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Imgv
-- ----------------------------
BEGIN;
INSERT INTO `Imgv` VALUES (2, '/productauctionssh/upfile/20171216151117.jpg');
INSERT INTO `Imgv` VALUES (3, '/productauctionssh/upfile/20171216151101.jpg');
INSERT INTO `Imgv` VALUES (4, '/productauctionssh/upfile/20171216151027.jpg');
COMMIT;

-- ----------------------------
-- Table structure for Jingjia
-- ----------------------------
DROP TABLE IF EXISTS `Jingjia`;
CREATE TABLE `Jingjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `chuprice` int(11) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Jingjia
-- ----------------------------
BEGIN;
INSERT INTO `Jingjia` VALUES (1, '2', '2', 600, '0', '2018-09-06 23:06:46');
INSERT INTO `Jingjia` VALUES (2, '2', '2', 780, '0', '2018-09-06 23:23:52');
INSERT INTO `Jingjia` VALUES (3, '13', '5', 100000, '0', '2018-09-07 00:54:37');
INSERT INTO `Jingjia` VALUES (4, '3', '2', 500, '0', '2018-09-07 14:53:02');
INSERT INTO `Jingjia` VALUES (5, '4', '6', 2000000, '0', '2018-09-14 00:10:07');
COMMIT;

-- ----------------------------
-- Table structure for Juese
-- ----------------------------
DROP TABLE IF EXISTS `Juese`;
CREATE TABLE `Juese` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Juese
-- ----------------------------
BEGIN;
INSERT INTO `Juese` VALUES (1, '超级管理员', '0');
INSERT INTO `Juese` VALUES (2, '普通管理员', '0');
COMMIT;

-- ----------------------------
-- Table structure for Lishi
-- ----------------------------
DROP TABLE IF EXISTS `Lishi`;
CREATE TABLE `Lishi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Lishi
-- ----------------------------
BEGIN;
INSERT INTO `Lishi` VALUES (5, '1', '3');
INSERT INTO `Lishi` VALUES (8, '2', '2');
INSERT INTO `Lishi` VALUES (10, '3', '2');
INSERT INTO `Lishi` VALUES (11, '4', '6');
COMMIT;

-- ----------------------------
-- Table structure for Liuyan
-- ----------------------------
DROP TABLE IF EXISTS `Liuyan`;
CREATE TABLE `Liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` varchar(255) DEFAULT NULL,
  `content` text,
  `lsavetime` varchar(255) DEFAULT NULL,
  `hcontent` text,
  `adminid` varchar(255) DEFAULT NULL,
  `hsavetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Member
-- ----------------------------
DROP TABLE IF EXISTS `Member`;
CREATE TABLE `Member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `yue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Member
-- ----------------------------
BEGIN;
INSERT INTO `Member` VALUES (1, 'xm', '123', '李白', '女', NULL, '13643290486', 'dd@126.com', '河北保定', '/productauctionssh/upfile/201304051943520002.jpg', '2017-12-15 20:29:35', '0', '909.3');
INSERT INTO `Member` VALUES (2, 'dd', '123', '冯涛', '女', NULL, '138937843498', '1225272681@qq.com', '武汉光谷广场', '/productauctionssh/upfile/201405171715420005.jpg', '2017-12-16 23:13:15', '0', '513.0');
INSERT INTO `Member` VALUES (3, 'zhangsan', '123', '张三', '女', NULL, '13483098204', 'zhangsan@126.com', '北京海滨', '/productauctionssh/upfile/201304051943520002.jpg', '2017-12-18 14:16:35', '0', '0');
INSERT INTO `Member` VALUES (4, 'lisi', '123', '李四', '女', NULL, '138937843498', 'lisi@126.com', '武汉光谷广场', '/productauctionssh/upfile/201405231955010015.jpg', '2018-01-09 11:27:30', '0', '1180.0');
INSERT INTO `Member` VALUES (5, 'zhanglujie', '19961119', '张璐杰', '男', NULL, '15957183556', '949941475@qq.com', '杭州', NULL, '2018-09-07 00:54:08', '0', '0');
INSERT INTO `Member` VALUES (6, 'dmz', '123', '董牧之', '男', NULL, '15957183556', 'dmzz@dmz.com', '湖蓝', '/productauctionssh/upload/nopic.jpg', '2018-09-14 00:05:23', '0', '10000000000000000000.0');
COMMIT;

-- ----------------------------
-- Table structure for Notice
-- ----------------------------
DROP TABLE IF EXISTS `Notice`;
CREATE TABLE `Notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `img` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Notice
-- ----------------------------
BEGIN;
INSERT INTO `Notice` VALUES (1, '双十一大抢购', '大牌集聚,现货抢购,正品低价,限时特惠，,送货快,省事又省心，真的超棒呢', '/freshfoodshoppingssh/upload/nopic.jpg', '2018-01-08 20:29:35', '0');
INSERT INTO `Notice` VALUES (2, '一大波拍品来袭', '快来买吧', '/productauctionssh/upload/nopic.jpg', '2018-09-07 00:57:05', '0');
COMMIT;

-- ----------------------------
-- Table structure for Producttype
-- ----------------------------
DROP TABLE IF EXISTS `Producttype`;
CREATE TABLE `Producttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Producttype
-- ----------------------------
BEGIN;
INSERT INTO `Producttype` VALUES (3, '古玩', '0');
INSERT INTO `Producttype` VALUES (4, '艺术品', '0');
INSERT INTO `Producttype` VALUES (5, '测试下', '1');
COMMIT;

-- ----------------------------
-- Table structure for Score
-- ----------------------------
DROP TABLE IF EXISTS `Score`;
CREATE TABLE `Score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) DEFAULT NULL,
  `content` text,
  `gid` varchar(255) DEFAULT NULL,
  `saleid` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Score
-- ----------------------------
BEGIN;
INSERT INTO `Score` VALUES (3, 4, '....', '5', '1', '2');
INSERT INTO `Score` VALUES (4, 3, '....', '5', '1', '3');
COMMIT;

-- ----------------------------
-- Table structure for Shouquan
-- ----------------------------
DROP TABLE IF EXISTS `Shouquan`;
CREATE TABLE `Shouquan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jsid` varchar(255) DEFAULT NULL,
  `gnid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Shouquan
-- ----------------------------
BEGIN;
INSERT INTO `Shouquan` VALUES (26, '2', '3');
INSERT INTO `Shouquan` VALUES (27, '2', '7');
INSERT INTO `Shouquan` VALUES (28, '2', '19');
INSERT INTO `Shouquan` VALUES (40, '1', '3');
INSERT INTO `Shouquan` VALUES (41, '1', '7');
INSERT INTO `Shouquan` VALUES (42, '1', '11');
INSERT INTO `Shouquan` VALUES (43, '1', '13');
INSERT INTO `Shouquan` VALUES (44, '1', '14');
INSERT INTO `Shouquan` VALUES (45, '1', '15');
INSERT INTO `Shouquan` VALUES (46, '1', '16');
INSERT INTO `Shouquan` VALUES (47, '1', '17');
INSERT INTO `Shouquan` VALUES (48, '1', '19');
INSERT INTO `Shouquan` VALUES (49, '1', '22');
COMMIT;

-- ----------------------------
-- Table structure for Sysuser
-- ----------------------------
DROP TABLE IF EXISTS `Sysuser`;
CREATE TABLE `Sysuser` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Sysuser
-- ----------------------------
BEGIN;
INSERT INTO `Sysuser` VALUES (1, '1', 'admin', '123', '王老大', '男', '13643290486', 'admin@163.com', '/productauctionssh/upfile/201405231955010015.jpg', '0', '2017-10-10 00:00:00');
INSERT INTO `Sysuser` VALUES (2, '2', 'root', '123', 'root', '男', '13798423810', 'root@126.com', '/productauctionssh/upfile/20.jpg', '0', '2017-10-16 00:00:00');
INSERT INTO `Sysuser` VALUES (3, '2', 'emp', '123', 'emp', '男', '134839212311', 'emp@126.com', '/freshfoodshoppingssh/upfile/201304051942500001.jpg', '1', '2017-10-16 00:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
