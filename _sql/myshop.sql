/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : myshop

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-10-25 19:26:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_address`
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `street` varchar(30) NOT NULL COMMENT '街道地址',
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_11` (`region_id`),
  KEY `FK_Reference_9` (`uid`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`region_id`) REFERENCES `t_region` (`id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`uid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of t_address
-- ----------------------------

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `uid` text COMMENT '用户id',
  `level` varchar(20) DEFAULT NULL COMMENT '管理员级别 0 、root 1、普通',
  `money` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of t_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `t_cash_records`
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_records`;
CREATE TABLE `t_cash_records` (
  `id` int(11) NOT NULL,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` varchar(20) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `type` text COMMENT '类型',
  `price` float DEFAULT NULL COMMENT '价格',
  `state` int(11) NOT NULL COMMENT '支付状态 ',
  `paytype` int(11) DEFAULT NULL COMMENT '支付类型',
  `cash_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '流水号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流水记录';

-- ----------------------------
-- Records of t_cash_records
-- ----------------------------

-- ----------------------------
-- Table structure for `t_evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluate`;
CREATE TABLE `t_evaluate` (
  `id` int(11) NOT NULL,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `content` varchar(15) DEFAULT NULL COMMENT '内容',
  `uid` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `anonymous` int(11) NOT NULL COMMENT '0 、匿名 1、非匿名',
  `level` int(11) DEFAULT NULL COMMENT '1 到5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价表';

-- ----------------------------
-- Records of t_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for `t_logistics`
-- ----------------------------
DROP TABLE IF EXISTS `t_logistics`;
CREATE TABLE `t_logistics` (
  `id` int(11) NOT NULL,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `waybill_code` varchar(30) DEFAULT NULL COMMENT '运单号',
  `state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物流表';

-- ----------------------------
-- Records of t_logistics
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `address_id` int(11) NOT NULL COMMENT '收货地址id',
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `product_spec_id` int(11) NOT NULL COMMENT '商品规格id',
  `count` int(11) NOT NULL COMMENT '数量',
  `price` float NOT NULL COMMENT '总价',
  `unit_price` float NOT NULL COMMENT '单价',
  `pay_state` int(11) NOT NULL COMMENT '1、未支付、2、已支付',
  `logistics_state` int(11) DEFAULT NULL COMMENT '1、未发货2、已发货3、已签收',
  `state` int(11) DEFAULT NULL COMMENT '1、等待付款2、等待发货3、确认收货4、 交易完成5、交易关闭。',
  `after_service_state` int(11) DEFAULT NULL COMMENT '1、申请售后2、退款完成',
  `logistics_id` int(11) DEFAULT NULL COMMENT '物流id',
  `cash_id` int(11) DEFAULT NULL COMMENT '流水id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `imgurl` varchar(300) DEFAULT NULL COMMENT '商品图片',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `intro` text COMMENT '简介',
  `descrip` text COMMENT '图文描述',
  `seller_id` int(11) DEFAULT NULL COMMENT '商家id',
  `price` float NOT NULL COMMENT '价格 不算在业务 只是展示',
  `count` int(11) NOT NULL COMMENT '总量',
  `product_class_id` int(11) DEFAULT NULL COMMENT '商品种类id',
  `self_count` int(11) DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of t_product
-- ----------------------------

-- ----------------------------
-- Table structure for `t_product_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_class`;
CREATE TABLE `t_product_class` (
  `id` int(11) NOT NULL,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `name` varchar(15) DEFAULT NULL COMMENT '地名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品种类表';

-- ----------------------------
-- Records of t_product_class
-- ----------------------------

-- ----------------------------
-- Table structure for `t_product_spec`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_spec`;
CREATE TABLE `t_product_spec` (
  `id` int(11) NOT NULL,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `color` text COMMENT '颜色',
  `modeltype` text COMMENT '规格',
  `price` float NOT NULL COMMENT '价格',
  `count` int(11) NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存规格表';

-- ----------------------------
-- Records of t_product_spec
-- ----------------------------

-- ----------------------------
-- Table structure for `t_region`
-- ----------------------------
DROP TABLE IF EXISTS `t_region`;
CREATE TABLE `t_region` (
  `id` int(11) NOT NULL,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL COMMENT '1、省2、市3、区',
  `parent_id` int(11) NOT NULL COMMENT '父id  level=1 时都为0',
  `name` varchar(15) DEFAULT NULL COMMENT '地名',
  `postalcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地址表';

-- ----------------------------
-- Records of t_region
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seller`
-- ----------------------------
DROP TABLE IF EXISTS `t_seller`;
CREATE TABLE `t_seller` (
  `id` int(11) NOT NULL,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `imgurl` varchar(300) DEFAULT NULL COMMENT '商店logo',
  `name` varchar(20) DEFAULT NULL COMMENT '商家名称',
  `intro` text COMMENT '简述',
  `uid` text COMMENT '用户id',
  `shopname` varchar(20) DEFAULT NULL COMMENT '商店名',
  `state` int(11) NOT NULL COMMENT '认证状态',
  `descrip` text COMMENT '商家描述',
  `money` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家表';

-- ----------------------------
-- Records of t_seller
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL COMMENT '用户id',
  `account` varchar(30) NOT NULL COMMENT '账号',
  `password` varchar(30) DEFAULT NULL COMMENT '密码',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `headimg` varchar(300) DEFAULT NULL COMMENT '头像地址',
  `default_address_id` int(11) DEFAULT NULL COMMENT '默认收货地址id',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `email_state` int(11) DEFAULT NULL COMMENT '邮箱认证状态',
  `wxid` varchar(30) DEFAULT NULL COMMENT 'wx登录id',
  `qqid` varchar(30) DEFAULT NULL COMMENT 'qq登录id',
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT NULL COMMENT '用户类型0、管理员用户 1 、普通用户  2、 商家用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '15214027378', null, null, null, null, null, null, null, null, null, '2017-10-24 20:17:14', '2017-10-24 20:17:14', '0', null);
