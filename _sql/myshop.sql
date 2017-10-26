/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : myshop

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-10-26 19:21:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_address`
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `street` varchar(30) NOT NULL COMMENT '街道地址',
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_11` (`region_id`),
  KEY `FK_Reference_9` (`uid`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`region_id`) REFERENCES `t_region` (`id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`uid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of t_address
-- ----------------------------

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
  `uid` text COMMENT '用户id',
  `level` varchar(20) DEFAULT NULL COMMENT '管理员级别 0 、root 1、普通',
  `money` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of t_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `t_cash_records`
-- ----------------------------
DROP TABLE IF EXISTS `t_cash_records`;
CREATE TABLE `t_cash_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='流水记录';

-- ----------------------------
-- Records of t_cash_records
-- ----------------------------

-- ----------------------------
-- Table structure for `t_evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluate`;
CREATE TABLE `t_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
  `content` varchar(15) DEFAULT NULL COMMENT '内容',
  `uid` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `anonymous` int(11) NOT NULL COMMENT '0 、匿名 1、非匿名',
  `level` int(11) DEFAULT NULL COMMENT '1 到5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='评价表';

-- ----------------------------
-- Records of t_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for `t_logistics`
-- ----------------------------
DROP TABLE IF EXISTS `t_logistics`;
CREATE TABLE `t_logistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
  `waybill_code` varchar(30) DEFAULT NULL COMMENT '运单号',
  `state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='物流表';

-- ----------------------------
-- Records of t_logistics
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `address_id` int(11) NOT NULL COMMENT '收货地址id',
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
  `imgurl` varchar(300) DEFAULT NULL COMMENT '商品图片',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `intro` text COMMENT '简介',
  `descrip` text COMMENT '图文描述',
  `seller_id` int(11) DEFAULT NULL COMMENT '商家id',
  `price` float NOT NULL COMMENT '价格 不算在业务 只是展示',
  `count` int(11) NOT NULL COMMENT '总量',
  `product_class_id` int(11) DEFAULT NULL COMMENT '商品种类id',
  `self_count` int(11) DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000251 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('100000154', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/12a4332af9d84d5cb915eb0b2c4f1f.jpg', '肤蓓氨基酸均衡洗面奶', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/c93fcb03067d48538a41d3ba0720bf.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/6b032fa5793b45db9c0bbc74665448.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/274a8b047ab7472482f985f8791965.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/aed775946b004c2aba700999bbafbc.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/405f6521687a4c58abf902fc78aa97.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '65', '100', null, null);
INSERT INTO `t_product` VALUES ('100000155', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/b57819754dd645f6b037ca91fe85ae.jpg', '艾诗恩女士方领衬衫短袖', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/043d5b1e0ca84ebebdef1a1ff3e579.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/82216cc8708c4a21b54b4dbb23f744.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/3053313fd9df477bbc65afb1643938.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/340e48e73ca841e49f162d2af606a6.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/14714567ca1d4b3cbd55bb60fcee1f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/4570745666cb485d9b1a39666dac1f.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '278', '101', null, null);
INSERT INTO `t_product` VALUES ('100000156', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '1', '', '123', '', '', null, '123', '102', null, null);
INSERT INTO `t_product` VALUES ('100000157', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/864c69e5234c4af4a041296f4392f1.jpg', '贵州聚仙台 聚福 酱香型白酒 53%vol 500ml', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/5a52b61744e946c486060947f38c61.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/c30ffd7df6b34b0182b0d3088fe807.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '289', '103', null, null);
INSERT INTO `t_product` VALUES ('100000158', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/256e6a72b4664ce7980560d2e6b3b3.jpg', '倾城之吻牡丹口红', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/f01819a133354211b7f5ffce0a0566.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/cc3856dd62ec4083b77eeed4bb3a59.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/e0a1b9e2cf0d4fe4bf84d2a4bc8c68.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/b6997a0c689b4c0288635866f3529f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/32358f372f88424c8087044c461cc0.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '159', '104', null, null);
INSERT INTO `t_product` VALUES ('100000159', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/72fb55360d454d6e989619ce06278c.jpg', '爱酒堡干红葡萄酒', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/e2c850911fa645809bf63c198aad5a.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/70edb5973520401ebccfa1572d78ab.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '568', '105', null, null);
INSERT INTO `t_product` VALUES ('100000160', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/c958852534ae441fb32304e59bf3e9.jpg', '抚参堂 全须红参 35g/支', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/b5a1da1881a549e6b8418e20c7ec7d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/be16eae0a40b49c48ea01390638f61.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/559e65fc71f84e0c8a0ac8a28bc4ba.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/9d665cf09fd040bcaa2e0c138126cf.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/44a7888aa00643bb94101bbee6f774.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/538ea764fc8a447a8c72723934e540.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/a95788eecbe6412ab1fb7b0dfcf34f.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '288', '106', null, null);
INSERT INTO `t_product` VALUES ('100000161', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/b872858969b04d8ba72e787fe623a3.jpg', '一品秋葵蛋酥 110g*6盒  ', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/54d45399e4414f169ea24d708ba175.jpg\"/><img src=\"http://img.liqiang365.com/image/2017/7/6f91b02c480340b4ba8e3d51f24b74.jpg\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/615486b1b0864effa4fc5e1158df16.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/265369ace5de411eab3d80d1affd9b.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c77f4681fef048eb98c68290d96594.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '60', '107', null, null);
INSERT INTO `t_product` VALUES ('100000162', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://dev-img.liqiang365.com/shop/2017/8/7affce36e21647708ee7cf708ff37c.jpg', '阿妹', '张惠妹', '<p><img src=\"http://dev-img.liqiang365.com/image/2017/8/7c2fb86e69884ff48413d4689c91b2.jpg\" style=\"float:none;\"/></p><p><img src=\"http://dev-img.liqiang365.com/image/2017/8/e1baaf639f5b4a2fbaaac58f05c2c5.jpg\" style=\"float:none;\"/></p><p>阿密特<br/></p>', null, '9', '108', null, null);
INSERT INTO `t_product` VALUES ('100000163', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/b9058554eda740e6902bacf561c15a.jpg', '(抚参堂)十八年野山参', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/45ee3de60e8943d8b98a6a70c8dc6a.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/26e6721d198a418b894b95ad64673b.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/b674590a700a4772a64431f6a05589.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/2956dcc8f6a44a8abf445ebda3993a.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c801d86ba0474b419b63b5233a6621.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/0ef0737139b04b96801f8e8420f101.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/02f5f79723e24481bf72daabdc85f2.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/40b2e587db4040bea9f246b6dd7969.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/0d00f59662f74c75867c4391f49621.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/7b6e7569188048c8a0109af668167e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/5c65a31b876644a8a3a826196c4821.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/8a67cbfd83b941a5befb0d3119fc0e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/6c6ab82bc00d4dddbb65f4eb4ca01f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/093ec827536f4ba7af633e48bfa5d5.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/cc2b71fee2de4bf3834cf0c8cc217e.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '6666', '109', null, null);
INSERT INTO `t_product` VALUES ('100000164', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/cfae408d91934fa4902d0fea36fb27.jpg', '音乐酵素面膜', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/f10c7dfc660441a9ad422c99d1f020.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c26c42aeb3074a03a0fa9f1e6e80b8.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1d1a17e7d4b5465e95cec1111dad70.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/8a7bdcf1e15349cfab4028f5ee4d02.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '108', '110', null, null);
INSERT INTO `t_product` VALUES ('100000165', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/c47e816a8a5b4fc5a43dee083d3f56.jpg', '国红憩苑焕颜紧致精华液', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/fac87acc16b64c81b2044680275214.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/36931688cfc6403297857033f11bd2.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '5999', '111', null, null);
INSERT INTO `t_product` VALUES ('100000166', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/c74bb504414c49cea8282bd0f8c576.jpg', '爱薇牛（jersey）孕产妇配方奶粉', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/7c9a713f01ea4d5f91c70ab65b39af.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/fc1a24929f77473cbfde799c22d36c.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '208', '112', null, null);
INSERT INTO `t_product` VALUES ('100000167', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/f436ea46f99a43108548f6dd124409.jpg', '蓝果庄园冰酒贵族（礼盒2瓶装）', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/7b5b2a43b47541ccb27ef2b5e5162c.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/efba727c7e7449c28b4d9e755ba6bc.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/cc5eff1b0fe8404e93322295c414c3.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '2000', '113', null, null);
INSERT INTO `t_product` VALUES ('100000168', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/d1568bb57f334e1081ebf206e1f873.jpg', '医之草艾条 十年金艾 2盒装', '', '<p><br/></p><p><br/></p><p><img style=\"float: none;\" src=\"http://img.liqiang365.com/image/2017/8/1cd8b32a2b1f4189be14e08871b3d7.jpg\"/></p><p><img style=\"float: none;\" src=\"http://img.liqiang365.com/image/2017/8/55953f53dbe543809b9e436e5002ed.jpg\"/></p><p><img style=\"float: none;\" src=\"http://img.liqiang365.com/image/2017/8/12981a60a9024ba6968f6a0a244db5.jpg\"/></p><p><br/></p>', null, '89', '114', null, null);
INSERT INTO `t_product` VALUES ('100000169', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/d2800eff2d4846f889292496714f88.jpg', '(抚参堂)十二年林下山参', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/1a16dddeabc540aaa0789999e357e5.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c57f93d598504f56ae82374a8ede66.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/f90043397c874a688bc006d7b3364c.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/66bbb9aeea0a41b89f0fff9bcd1e73.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/0b30ffbcf18746758c406dc7d60b70.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/d8d628de5d7243ddb1b380efb88434.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/408d6aab5b4042308abf6b9d14f6ce.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/613e2300446c4e21815d594c6cde26.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c8b5f48c87ef4e47baa19befc6a4de.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/94d64e064ab845468af04f59d00751.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/3aa0447f348e4fd4831e9f192e667d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/8a62554b2f3a44c8818d31ed285635.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/7efe885f098f4f16b7d4737e4c1c35.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/b8479d96597545fe98f82125261424.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '3200', '115', null, null);
INSERT INTO `t_product` VALUES ('100000170', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/0027c82d23d24815b52313903400c0.jpg', 'MAKEUPSHOW魅卡秀套刷', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/4f9199f5b0e0412b851058669c3555.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/ecfac5469df84390a2aea33bd734b2.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/23ce8a70514247c793b7e7fd86d5c0.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '428', '116', null, null);
INSERT INTO `t_product` VALUES ('100000171', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/435a1f7bd32b40ddb688c15101094b.jpg', '(抚参堂)人参花', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/85584719f4f140d88587551bac5aa3.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c48cdc0008604dd290921851b610c0.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/0b7e2d0e760c448a8c7ab2caea504f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/07b9eace9a76413398fa14959d7861.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/ead4c664233f4b7b9062f93f961b33.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/bc606901127d47f2946d57c08f2926.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/9734381d7cc24fe5a8227846316922.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/76e89121fed6402bb39a6b9cab88e0.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/7da61073316f4defb45f322770c9ec.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '389', '117', null, null);
INSERT INTO `t_product` VALUES ('100000172', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/875556c1bd43494db2f03dd288fa4c.jpg', '蓝果庄园蓝莓冰酒', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/963c81c5667a4b8ebb17884c13e229.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/7868fc73da76468cbde4a78e8beb50.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/f1b3d998e81441d08a7b7902f7c7c9.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/ec916957b62c49c7b6a01869947d07.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/35f4bf7b819a490e89679ac56dc38a.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/ff70894b722c428eb4a6551ed004e9.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '1988', '118', null, null);
INSERT INTO `t_product` VALUES ('100000173', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/883e51c6d0404a8f88050c5f8d731e.jpg', '锦慕洋服男士商务正装', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/461572f4b908412b940f6fe969f8c9.png\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/9e206066167c48f0b6e4c9cd8ed0da.png\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/2d0c6b71f20b46e9bb603a772627fd.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '8800', '119', null, null);
INSERT INTO `t_product` VALUES ('100000174', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/7cedc3a5b13c4f139cb831aa37727c.jpg', 'MAKEUPSHOW魅卡秀7支装便携套刷', '', '<p></p><p></p><p></p><p><img src=\"http://img.liqiang365.com/image/2017/7/323fea248ce644be86b9687fdf87bb.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/9ef6f95807b74e98a9cf3862fbd0e3.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '199', '120', null, null);
INSERT INTO `t_product` VALUES ('100000175', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/f7a3765815b54b679a8765aee55f1e.jpg', '冰糖.蓝莓果干', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/f7cc0e8b1e524bb6b23f1a8621b5f0.jpg\"/><img src=\"http://img.liqiang365.com/image/2017/7/c32700b84a0a4b1fa1090c8f57a1b7.jpg\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/0b1899de65e54e37960c64dfe3c8ac.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/fa94eb7a2ad8443c80bf5208589f28.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '188', '121', null, null);
INSERT INTO `t_product` VALUES ('100000176', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/e223d2ab96a7409ca71e6e19defd09.jpg', '私洁内衣专用洗衣片', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/00ce7b5694424efd807003989c3a28.jpg\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1fb82789fdc149db9d0e6b98294535.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/e6afbc62e32346d9bb2413d956d58a.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/07463a9fc487480eaa46f00097ac77.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/577dcc59c07842f284aa2f429a3273.jpg\" style=\"float:none;\"/></p><p><br/></p><p><br/></p>', null, '198', '122', null, null);
INSERT INTO `t_product` VALUES ('100000177', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://dev-img.liqiang365.com/shop/2017/9/90b451d4374c4465aaffc9eede2138.jpeg', '胡夏004', '111', '<p>111</p>', null, '0.01', '123', null, null);
INSERT INTO `t_product` VALUES ('100000178', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://dev-img.liqiang365.com/shop/2017/8/fa9001930d7e4050b501c531bb8212.jpg', '内部测试002', '', '', null, '1', '124', null, null);
INSERT INTO `t_product` VALUES ('100000179', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/182f18d6ac144cb395baaf9f371673.jpg', '医之草手造茶 手工艾茶 2厅/盒', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/899171a68b424c8ba4ffedbc0b878d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/64fd2a6362154858b9050cd6baba94.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '259', '125', null, null);
INSERT INTO `t_product` VALUES ('100000180', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/9be45c55a9a34d53ae4d5130ca362f.jpg', '爱薇牛（jersey）中老年配方奶粉', '', '<p></p><p></p><p></p><p></p><p><img src=\"http://img.liqiang365.com/image/2017/7/9e45791980394e5f87211fbc4ffddb.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/cf2f398aa9c043e1a475841284220c.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/49bfc7e9bd9a4408b37edc53248be7.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/57ae7e1fbd724a7286717f1340be72.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/a9f0973612f24669801c98042b82c2.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '188', '126', null, null);
INSERT INTO `t_product` VALUES ('100000181', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/001f713c669c422ab32cde433378ff.jpg', '锦慕洋服男士礼服套装', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/cd6257fd07da4d8988e6d46ab319a3.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/4b1761a247cd4182bd2df050a3e1d4.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/d6ddc6319ef34d71ad2f6826f71ec4.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '8800', '127', null, null);
INSERT INTO `t_product` VALUES ('100000182', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/a92062f5c40249578d34e1ea97bc55.jpg', '唯美乐园 白T恤沙豹 儿童玩具礼品', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/5282e5fc241e4f7cb786381a965891.jpg\"/></p>', null, '199', '128', null, null);
INSERT INTO `t_product` VALUES ('100000183', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/44bcc96beabf43e2b7f9c551a3aae9.jpg', ' 澳洲进口AUNA桉树蜂蜜  400g ', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/7440ffce8d1a488c8fd9ccb252bd5d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/cc5b70e563d3407b8badc0b22b38d2.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1184589cc1b543599350afec86f958.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/fa0701f8924348b99872bd69d68501.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/e5fe8eb446ab4e039f5958f8098c83.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c956671770a44b5187bfe64edcb234.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '398', '129', null, null);
INSERT INTO `t_product` VALUES ('100000184', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/dc879d6c9763481ab173b716d3e00c.jpg', '含芙漱口水 380ML 除口腔异味 清洁护齿', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/2ce5051a71f84488994dbd324bdeec.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/77f81372b2024cb2ae188425fd9355.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1f6eacee7ce343f2b225892af910cb.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/19eb8c5b85104cc58550639bdd3657.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '178', '130', null, null);
INSERT INTO `t_product` VALUES ('100000185', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/8d35cf4d271c40328321d2961075d2.jpg', '茶先生养生壶 CXS-604', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/45704a4213ad4c09a67c6c046ad732.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/4d0c2c4377e94ed5aa6c3ab0763337.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '298', '131', null, null);
INSERT INTO `t_product` VALUES ('100000186', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/9f333cd560804491a6bca75c9db2fa.jpg', 'MAKEUPSHOW魅卡秀12支装便携套刷', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/42942745716e420aa6ca8ef17a487e.jpg\"/></p>', null, '388', '132', null, null);
INSERT INTO `t_product` VALUES ('100000187', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://dev-img.liqiang365.com/shop/2017/9/9b308630b4f54774b32e61fad80ef9.jpg', '胡夏003', '12', '<p>23123</p>', null, '0.01', '133', null, null);
INSERT INTO `t_product` VALUES ('100000188', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/f20b86c3896244d5a3c7d179bfc0ad.jpg', '贵州聚仙台 聚首酱香型白酒 53%vol  500ml', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/2c3c4d70d12a43b59c66dde7765395.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/b6db5cbb389840d5ac90b44ebf2c65.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '899', '134', null, null);
INSERT INTO `t_product` VALUES ('100000189', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/f8394f3046a2491a8ec4ea6a914223.jpg', '爽脆黄秋葵', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/59a9c8a417e34de19be22586b833e1.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/e30714b335094cec966873be11736c.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/28b1152e3a2041bea09d22e227d8a7.jpg\" style=\"float:none;\"/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p>', null, '180', '135', null, null);
INSERT INTO `t_product` VALUES ('100000190', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/f2dfe6d685b24f28acb6a5b337d24f.jpg', '艾诗恩男士衬衫短袖', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/3e0f7f3bcb6a4800b4b42f481cae95.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/b7e99a0e8bb14c48a8539e6b4e7d28.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/cd4566ee2992455e9504ba62ca9b51.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/fabcea2435f643cb96378f8d7f218e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/3c5939bf2466400a85bd7cac270084.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/9ae80103c2ed4adcb02e40195174a5.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/4df3e295d8664c249f7fd5b4c801c0.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '299', '136', null, null);
INSERT INTO `t_product` VALUES ('100000191', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/915c47769dff4404a9689e631efe7f.jpg', '柬埔寨贡邑净米', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/c780ca7e9d5246b4a9dcc92e86ebf1.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/b0fb7cf09354418a94f96df4f49320.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/af6b0bea3cb5481f8dc48e02fe3c07.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/dc96226a6caa4aa4abec260b5c2e8c.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/88b924430c304d1284c1ed809d4f30.jpg\" style=\"float:none;\"/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p>', null, '99', '137', null, null);
INSERT INTO `t_product` VALUES ('100000192', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/f43761abd5854b66ac5c3f06a30396.jpg', '艾诗恩女士方领衬衫长袖', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/4ec6bada1b864f0ca904128e285404.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/0c8c1228a3e84e93b659eaba979305.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/75dbfb14410c4e1093b43cc79895d0.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/7a96aa77527e4369ac36f19493443e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/4afc717272654029bdcdbec223cf2a.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '278', '138', null, null);
INSERT INTO `t_product` VALUES ('100000193', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/d48d55a6fd43414199ac3b71a83e69.jpg', '桐人唐皮影T恤', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/c938fb43996b4e33ab590cdfa863c4.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/4c7e4473f70a4018b6ea05a861e6d9.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/34c973aa706546a8a8f94100b27474.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '699', '139', null, null);
INSERT INTO `t_product` VALUES ('100000194', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/3612fc70747945ebac5f089d541034.jpg', '锦慕洋服女士衬衣', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/607da2b4ae29495baf2a6cd57543b3.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/4311cafb7e2a4ab9b005c1de6d95cc.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/e03c7fa7ef37452bb5011d7276e629.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '1980', '140', null, null);
INSERT INTO `t_product` VALUES ('100000195', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://dev-img.liqiang365.com/shop/2017/9/7daab425bf3a407fb3c88eb8d2704e.jpg', '胡夏005', '1234', '<p>1234</p>', null, '0.01', '141', null, null);
INSERT INTO `t_product` VALUES ('100000196', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/4f72c44310ed4dd2ba80958dbf2f66.jpg', '爱薇牛（jersey）速溶配方奶粉', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/421387fa58104ad08d477122ddeb32.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/a3a8b9bf1e29493a9d57a777ff4b41.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/ae41daea58b342078d10b7d1f3b5ba.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '188', '142', null, null);
INSERT INTO `t_product` VALUES ('100000197', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/f6d70110f118464ba76fe96fd0dd9b.jpg', '幸运谷 头茬中宁枸杞200g/瓶', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/045a3667730d449eb9799c1a464889.jpg\"/></p>', null, '48.9', '143', null, null);
INSERT INTO `t_product` VALUES ('100000198', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/d92ad02f627d46929a0550f7f8ca58.jpg', '医之草艾艾贴 艾灸贴 2盒装', '', '<p><img style=\"float: none;\" src=\"http://img.liqiang365.com/image/2017/8/09013db325ed49bf81141bb06b1b98.jpg\"/></p><p><img style=\"float: none;\" src=\"http://img.liqiang365.com/image/2017/8/4d11024d69784953be349940d4cb8b.jpg\"/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p>', null, '89', '144', null, null);
INSERT INTO `t_product` VALUES ('100000199', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/6c1bafe7fa4442a3bacee57096b4ac.jpg', '贵州聚仙台 聚禧 浓香型白酒 52%vol 500ml', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/cd00f6b3c10e408d8e058cd658aa23.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/14a22e484be447e5827827b7adfdcd.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '158', '145', null, null);
INSERT INTO `t_product` VALUES ('100000200', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/ea7460e15b784c3a873f918597de57.jpg', '爱薇牛（jersey）玫瑰花麦卢卡蜂蜜奶粉', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/97cef9b6a98b403e8c8ff1ce738f88.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/fae6664934cc473e8a136cc8679c30.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/e14787529f02408eb962498031b4c2.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '188', '146', null, null);
INSERT INTO `t_product` VALUES ('100000201', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/06c2fc99709244df887adff50b060a.jpg', '《微商兵法》作者亲笔签名收藏版', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/31b1b0a86ed34f2ab59f6fb158d82b.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/929222dbf5124ecfa0965ed5e51f8f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/0ecd4813146c4747a93be5a67cc970.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '78', '147', null, null);
INSERT INTO `t_product` VALUES ('100000202', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/99703f74c7504625abb793611ad80b.jpg', ' (抚参堂)鲜参醇窖  500ML', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/7546aeb908564054a9df01900d530d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1a502a1ce5da400e978b06140e5e82.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/96cb753792be4f628b2b818b7f4e6d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/70ddff2252ae4fe1af8d733d416d80.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/bd2c0cdd820f4beaad6cf844d5717e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/0e4bf72c57e54a958761c014e69f08.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/200f5fdc488d47838335b2ff29ceda.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/f819520a4e554d98a77281df5dba16.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/afea6134d320403180850a7266bc3a.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/64f51a72c7a7406d9f92194086baf9.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/6c8e0ea70eb44e31862abdb64be2a4.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1de40b13a3a04e4d9da3fa59a153a7.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/babf1b2b30084c9b8556fa3808c0d8.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/782fa1719c074c1b8ae2bd1d95176d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/f87d00e46c3f4d31bd1c676df2c856.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/4281cf1bf29a4ffc9f918dd697e586.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c05150db092649e0a97aed72a275c6.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '298', '148', null, null);
INSERT INTO `t_product` VALUES ('100000203', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/f5034b6b507e4ff08285035bc2e659.jpg', '幸运谷 阿克苏核桃350g', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/e45a01f8f1bb43b8b155ca664fea24.jpg\"/></p>', null, '48.9', '149', null, null);
INSERT INTO `t_product` VALUES ('100000204', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/540657cf7c4e4ac4af2a527a2eb2f5.jpg', '吉蜜拉斐卫生巾日夜组合装 日用×3包 夜用×2包 护垫×1包', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/008f2d3d2b51462b8365aa4854baac.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/71e57a796ab74b38a66df953595340.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/8271605c2c78463ca34d4527212179.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '130', '150', null, null);
INSERT INTO `t_product` VALUES ('100000205', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/1e32c7663f4b4a2d8c141cfe59c116.jpg', '(抚参堂)林下山参酒', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/357e6e73d22e4cce94b63ddef00eb0.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/3488ca088d4b4a0a9e840a223be9df.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/010494c62ecd4c4eb4160573a29b69.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/cfa26e4a946044f7b4c0ff019bc0fd.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/ffa225a183ea4da1be1a2b52bbd911.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1a561f940ee14437a5e454d92cfe68.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/6bc53e1051534718a34431afd29036.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/942a8766d8464d269dde1552c00dd0.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/7e98a6c78c894b3898226b049451b7.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '780', '151', null, null);
INSERT INTO `t_product` VALUES ('100000206', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/7ae17fa25f934b31bcf5c4558cfa82.jpg', '抚参堂 鲜参礼盒  12支/盒（10-15g/支）', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/8d1cfb937406494d98c10eeafd40a0.jpg\"/></p>', null, '499', '152', null, null);
INSERT INTO `t_product` VALUES ('100000207', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/772a6f3a9d3340cbbd6d451e3a205e.jpg', '桐人唐青花瓷T恤', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/b9f3dee4398d4fc3883968e5496e1e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/7dce5b3b2dc8459fa2c3a4ef0b516c.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/61cb02968c8e4e159cfd48fd1af372.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/8d6be22598dc42a3a3c88dac59910a.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '539', '153', null, null);
INSERT INTO `t_product` VALUES ('100000208', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/f5af84e6b6b244b3a184dcecd01cdb.jpg', '艾诗恩女士小领衬衫短袖', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/a168d8be7e23494e9ecdcab7fb2ba4.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/4bfe4804da7f4b1ebaad7ea516aa8e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/88841c4332b74611818dfd1d84b4a0.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/efe0ab131996465a9ec6b31049aed5.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/54ec5ad4eda74ecd89bdf3c745e5ac.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/409beecfa46e470eabb49b32499b3c.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '278', '154', null, null);
INSERT INTO `t_product` VALUES ('100000209', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', '', '1技术部测试', '', '', null, '0.01', '155', null, null);
INSERT INTO `t_product` VALUES ('100000210', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/c1fa50454fff4d8e95b5d613db35ee.jpg', '锦慕洋服女士商务正装', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/e0e5a8a0d84a4897b2af2210d30556.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/d0288fa4f8b64d4aa52e12eb27e8d6.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/429842850ceb4a96b6ba518c8bcfb2.jpg\" style=\"float:none;\"/></p>', null, '8800', '156', null, null);
INSERT INTO `t_product` VALUES ('100000211', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/587e297082e243cd803731d88d6743.jpg', '幸运谷莆田桂圆干250g', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/26c67a326fde4239bb725471c3bed2.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/d7d58f0031d84fa7a147305adbb9a0.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '48.9', '157', null, null);
INSERT INTO `t_product` VALUES ('100000212', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', '', '抚参堂 人参米 750g/袋  口感软糯 参味淡雅', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/c2ae24ad453b4f068a2c303eab8f8d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/7da97257aa744b88aab3f6ee509410.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/966ba360a780487fa3fce45ac80e07.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/6d6168aa1aae4219bc473bf44a3a53.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/4120a75c40cd4ba58e3aa4ee7aebd6.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/228de2ce953c4dc99b0720ebf39f65.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/2ddd1b292f63493eb76c75daca388d.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '348', '158', null, null);
INSERT INTO `t_product` VALUES ('100000213', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/0902f0a90a9e4ac88623558f2bc476.jpg', '学者徽章', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/50ae21bdf5dd48aca36b951bc9afa9.jpg\"/></p>', null, '58.9', '159', null, null);
INSERT INTO `t_product` VALUES ('100000214', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/d4ffa24f33b548dc81848ed8dba9a8.jpg', '给立净浓缩洗衣液', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/bf1af1ae30b14dc4b3904ea4f3cc60.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/95d6d0f515d341538cff67dc4ff0d1.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/a160e2b8519544fba72d5706542b6b.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/a5b3e7d5ef5b486798f675e4268046.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1d6cafa7d6034e01a73ac14e407ff3.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '72.8', '160', null, null);
INSERT INTO `t_product` VALUES ('100000215', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/35f6be18726f46428764a5ad85548d.jpg', '锦慕洋服女士商务休闲套装', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/d876de5a2f574336965759a9e6cfe6.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/6ef4135fe11e4ef19927a025188102.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/2e42045788fa4bd7a63c1624ce8f63.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '8800', '161', null, null);
INSERT INTO `t_product` VALUES ('100000216', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/7efff43f09ef4206a40be567130f83.jpg', '盛博草原如家牛肉干 干度适中  上等牛肉', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/ff12ad6002284e0d8240de721950e1.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/d6a14f4364704ead9f239635c6fc9e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/042c323a0054408a9dd248992dbce3.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '99', '162', null, null);
INSERT INTO `t_product` VALUES ('100000217', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://dev-img.liqiang365.com/shop/2017/8/989989c94a1a4177ae0e0d8f6ad7a2.jpg', '益达', '技术监督局', '<p>交换机暗黑城看见好看岁</p>', null, '10', '163', null, null);
INSERT INTO `t_product` VALUES ('100000218', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/0a1c10247d3d4748b7aa509cebbef4.jpg', '爱薇牛（jersey）婴儿配方奶粉', '', '<p></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c7b58ec1099a4f66a5bd1f56a2ed7d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/4058145379d6414f937dcede44d71e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/151d6d0bb6124139aaca97b557e7c5.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/24f50a2ea4f743948224445dc9befe.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '388', '164', null, null);
INSERT INTO `t_product` VALUES ('100000219', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/8948663789ee4d0d80a136269306c7.jpg', '爱薇牛（jersey）学生配方奶粉', '', '<p></p><p></p><p><img src=\"http://img.liqiang365.com/image/2017/7/10b4be2a4437421984d4a305bbfb6f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/0b3a7c5af596432989f1c572c58345.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/9f50ec7d393048e1844d1690ec52c2.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '188', '165', null, null);
INSERT INTO `t_product` VALUES ('100000220', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/86b38ac7612f4406b5a1c8385a6b97.jpg', '唯美乐园猴子空调被', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/8b67d73c70f34bc59ec31dd87ebf8e.jpg\"/></p>', null, '99', '166', null, null);
INSERT INTO `t_product` VALUES ('100000221', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/8b38ff4e4a10458286c2560d063793.jpg', '贵州聚仙台 聚信酱香型白酒 53%vol 500ml', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/fde55cad97ca41b3adb758f6f1f28d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/d0b24e30cb6b4f8a9595405565a6b5.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '469', '167', null, null);
INSERT INTO `t_product` VALUES ('100000222', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/dc79804b516c4007b78e4ae5d88696.jpg', '特色呼伦贝尔熏三样礼盒', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/b118288bdff444e2a7d51deb9d1afc.jpg\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c1b7aab65e1242a7a0447b852a7d87.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/50860b8cad974d109865034e8e243b.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/da98599877c840df89d1c169067ba3.jpg\" style=\"float:none;\"/></p><p><br/></p><p><br/></p><p><br/></p>', null, '188', '168', null, null);
INSERT INTO `t_product` VALUES ('100000223', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/70bfd67757094ecc8ea9e29779971b.jpg', '信马由缰红葡萄酒', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/1ca21f0291314b628cd86d79327d69.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/c7b98549938a41208997afbb909a98.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '498', '169', null, null);
INSERT INTO `t_product` VALUES ('100000224', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/b49cf778d7f048789ae0a68b5cb460.jpg', ' 澳洲进口 特级初榨橄榄油  1L', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/3da042ccfcf645b3bfe822a2125cef.jpg\"/></p>', null, '338', '170', null, null);
INSERT INTO `t_product` VALUES ('100000225', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/100aae9019c4467eaede23e852ae18.jpg', '内蒙古特产熙牛牛肉干 风干牛肉干 独立包装', '', '<p>&nbsp;</p><p>&nbsp;</p><p><img src=\"http://img.liqiang365.com/image/2017/8/bb440d639f374ef685e40200ea11fa.jpg\"/></p><p><br/></p>', null, '158', '171', null, null);
INSERT INTO `t_product` VALUES ('100000226', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/41ced40aa46a4b7eb52cd90978fdf4.jpg', '吉蜜拉斐卫生巾礼盒装', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/fca84d225fa74527bc920843a6d543.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/355687d06ea247c280326375487143.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/e17051c814a04cb5949957111782d8.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '128', '172', null, null);
INSERT INTO `t_product` VALUES ('100000227', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/099bd57f425f4edb810bbbd474fe63.jpg', '茶先生蒸汽式煮茶器 CXS-327', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/48bacc14a3494b86a9af191d538b92.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/55b66f9fe1d9473ab4443b4dfc6e72.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '258', '173', null, null);
INSERT INTO `t_product` VALUES ('100000228', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/e8b6ecefefd34191a3449c78590ab8.jpg', '抚参堂 红参片 80g/盒', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/9b1e623deb6c4fafbbe03f6c785a34.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/fe37e1fed8aa40a5a8132df79bef6f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/81e1e0f5e7444f6fbf1d13d5555be5.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/d2414b1c404f4b69984caa1c5f30bb.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/a57cdd04b2e1409f8939ae5c415614.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/7da4d58ff5f3441ab7797d47c95dbe.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/f13b34d02c934e92b20fb6e89ddee2.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '220', '174', null, null);
INSERT INTO `t_product` VALUES ('100000229', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/15d9c7f02faa4f0c995a8d9eb262d4.jpg', '锦慕洋服男士衬衣 ', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/c58a3ca670674cadb37fd17a62985d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/25a14dadba1c4d388e6694e951682f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/5065461a6a9848d69d741fa2f1e996.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '1980', '175', null, null);
INSERT INTO `t_product` VALUES ('100000230', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/f0a1acb5eabf4b34a89dfcc7b8ae43.jpg', '爱薇牛（jersey）麦卢卡蜂蜜配方奶粉', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/27e94096c1374a38ad3887a6836773.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/2feb385b1db64b11a568a7c02963cd.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/ef9a3d3857904c6eb11e5f30b4e484.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '188', '176', null, null);
INSERT INTO `t_product` VALUES ('100000231', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/3d65e025f5884c2297ca47e94a8cdb.jpg', '医之草艾柱 2盒装', '', '<p></p><p><img src=\"http://img.liqiang365.com/image/2017/8/48a34d7a67c04d4f8c5d04bd2fbba2.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/0c9ca49c15f44630a6896516932e75.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '69', '177', null, null);
INSERT INTO `t_product` VALUES ('100000232', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/0317f128f8b24b24809f6e2fd94e47.jpg', '艾诗恩女士小领衬衫短袖', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/247b644000f842838ebd8066e1b5d3.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/bf1023203b2144d29989ff102b50b8.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/f653f4df9b8b465db6106638af0e50.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/e61d20a4c5394ba1ba846c71cede91.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/a7a600edeaea489189b38039d3a2e7.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/5c348030715944ee97b4a6921f74f9.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/5b52978827774360837636cebf7817.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '0', '178', null, null);
INSERT INTO `t_product` VALUES ('100000233', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '1', '', '测试001', '', '', null, '0.01', '179', null, null);
INSERT INTO `t_product` VALUES ('100000234', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://dev-img.liqiang365.com/shop/2017/10/bca5edb7ba1149a89e6601db8fb84b.jpeg', '闪电购测试', '1111', '<p>111</p>', null, '0.01', '180', null, null);
INSERT INTO `t_product` VALUES ('100000235', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '1', '', '1测试', '', '', null, '0.01', '181', null, null);
INSERT INTO `t_product` VALUES ('100000236', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/35e6a26cca304443960024b83bf731.jpg', '盛葉®雅安藏茶   100g  口感醇厚  顺滑甘爽', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/372d332727084073ac42dc33ceb60f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/89d1b4817b4246368108d8da7a99ad.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/5b232bdeb2fb4e8f8c2ee54e4169fb.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '209', '182', null, null);
INSERT INTO `t_product` VALUES ('100000237', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/6c045b8973f7421ab5f66f38315bbb.jpg', '蓝果庄园蓝莓干红', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/1238a505696e43ba95de903d6c2f72.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/5c65ff835e004082b6908a3807c51e.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/f7db9197c5b24c56aa5b145aabfea4.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/a6b226a3c6dd4e768595c79a5cd22b.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '199', '183', null, null);
INSERT INTO `t_product` VALUES ('100000238', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/195de908f4d940618d88b8301fa35c.jpg', '木之香·空酵素手工皂 100g 品质生活 空本自然', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/a3a425b82b5444fa813c23e8de0949.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/07dfb488686f41ce9dadc1a40a78eb.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '168', '184', null, null);
INSERT INTO `t_product` VALUES ('100000239', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/4e6b44afa5c849d7812540c6c58bbe.jpg', '锦慕洋服男士正式西服', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/222ada3f78c74c6e85e92592f89508.png\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/7fe6c346d61b4beb8bfb6414d1d015.png\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/b18a54b23bad46879956a3e0ff98f6.png\" style=\"float:none;\"/></p><p><br/></p>', null, '8800', '185', null, null);
INSERT INTO `t_product` VALUES ('100000240', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/4140ba0484aa47fda38fbed7215cd6.jpg', '艾诗恩男士衬衫长袖', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/afab61882dce4b2a9e95c6dbc7bf87.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/1919667b777c4aaeaffaa8f10e7bb4.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/0f3db227ce994ff696a17df86c7a9b.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/441a6d2d2039499a905735454891e9.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/c4f9ef67f9b44fd0a2b7bf9c8e4c4f.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/c82ae3c9046b4f959a1f3a54a0c0aa.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/8df48fdb858444d6993c9b43a78024.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/a7380ca8a5e447a2b483616f5b655c.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/b7af6fb9dc1d4980a89c6cfbe15e55.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '299', '186', null, null);
INSERT INTO `t_product` VALUES ('100000241', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/a71ca9ffbf234965aa42df6f09c8a4.jpg', '澳洲进口 罗亚兰诺 无醇葡萄酒', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/a7ec9012214e4cd7b26bc750f84018.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/8f8421c862b74f9eba58f6b37977de.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/add6aeff92f74f3ba09846573e331d.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/ab87fd065a6943a891ff8e72059b97.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/b3123fefb5e94b46a4f112941d73ca.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/86bcd7f0346c41798e36a72e4e6419.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/98b9095290c2406789d9afafe9ba87.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/b99850aaccb54c41ad9fc638c49acf.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '398', '187', null, null);
INSERT INTO `t_product` VALUES ('100000242', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://dev-img.liqiang365.com/shop/2017/9/34b457d3fa8246ddb5c3671f4ac07b.jpg', '胡夏003', '23e', '<p>234&nbsp;</p>', null, '0.01', '188', null, null);
INSERT INTO `t_product` VALUES ('100000243', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/2066f490780d4bcc889ccab725c2e5.jpg', '李强365竹浆本色纸', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/674c8dc8047d4dd0a924610d4927d8.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/ecb4b493ce4a4b1f822145370d20a3.jpg\"/></p><p><br/></p>', null, '188', '189', null, null);
INSERT INTO `t_product` VALUES ('100000244', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/e2c1e9ca1f4d43b78233807279d238.jpg', '幸运谷精选东北无根木耳', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/e6d6745fdefc4543b493b12fb4f168.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1ce867e11cce4a349fe7fa7eea5127.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '48.9', '190', null, null);
INSERT INTO `t_product` VALUES ('100000245', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/5332f707327e4d74a694a654705143.jpg', '柬埔寨贡邑香米', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/ecb547217fd74b4a9f4f93af96b3a7.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/5bcd4203cea946479c34e762c0f8a2.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/a378516524fd4c63a1196f978d7e33.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/e92b5684480141ed875524689f525b.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/aa0b3447999c4682b4f328e97523f9.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/6b66d6b1a5544fb19e3c10db049b24.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '198', '192', null, null);
INSERT INTO `t_product` VALUES ('100000246', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/c8b6e3c2f0e748eab6f0aa402e6f6d.jpg', '锦慕洋服女士正式西服', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/9ba9aedb5aa54f089bab8916edf198.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/617b95d43cd243388098dd8731f344.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/f13b87d38d1140ff96d97d406b58ac.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '8800', '193', null, null);
INSERT INTO `t_product` VALUES ('100000247', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/56cc226e690449da8db33f0c9776e6.jpg', '吉蜜拉斐安心睡 2包装', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/9e6d0d3282164553a3b20484566126.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/f8c00531cd3545a797c10af73d7265.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/422beba79ffe4da0a60a011f3357f6.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '38', '194', null, null);
INSERT INTO `t_product` VALUES ('100000248', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/b7ac5d37e1ea473d9582a47d24934e.jpg', '李强365周年庆旅行箱', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/26db8a641075461eb78f634a66d060.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/5991d5c5556a47b1aa151b02844fb4.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/885e515c1acf4e52909c2d69205613.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/36cf493c8ad54d11aeeeab73ac35b6.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/1ca5745a053a4fde906c12393397d2.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/f2d4f7ca2b1846a896d9f83aaf25dc.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '600', '195', null, null);
INSERT INTO `t_product` VALUES ('100000249', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/7/45837260fd5144fda5639038320dae.jpg', '幸运谷精选和田大枣', '', '<p><img src=\"http://img.liqiang365.com/image/2017/7/7de26c05a86a4afaa948d749164ead.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/7/838c6dae732d4d13874ae43c51eaf7.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '48.9', '196', null, null);
INSERT INTO `t_product` VALUES ('100000250', '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', 'http://img.liqiang365.com/shop/2017/8/17742e9481da41eb9b9799a46d5f4c.jpg', '茶先生电热烧水壶 CXS-8091', '', '<p><img src=\"http://img.liqiang365.com/image/2017/8/8af3bfc59e5f4b75872f957875a66c.jpg\" style=\"float:none;\"/></p><p><img src=\"http://img.liqiang365.com/image/2017/8/5640150fa42144b1be681da4c0eb3d.jpg\" style=\"float:none;\"/></p><p><br/></p>', null, '168', '197', null, null);

-- ----------------------------
-- Table structure for `t_product_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_class`;
CREATE TABLE `t_product_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
  `name` varchar(15) DEFAULT NULL COMMENT '地名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='商品种类表';

-- ----------------------------
-- Records of t_product_class
-- ----------------------------

-- ----------------------------
-- Table structure for `t_product_spec`
-- ----------------------------
DROP TABLE IF EXISTS `t_product_spec`;
CREATE TABLE `t_product_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `color` text COMMENT '颜色',
  `modeltype` text COMMENT '规格',
  `price` float NOT NULL COMMENT '价格',
  `count` int(11) NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='库存规格表';

-- ----------------------------
-- Records of t_product_spec
-- ----------------------------

-- ----------------------------
-- Table structure for `t_region`
-- ----------------------------
DROP TABLE IF EXISTS `t_region`;
CREATE TABLE `t_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
  `level` int(11) NOT NULL COMMENT '1、省2、市3、区',
  `parent_id` int(11) NOT NULL COMMENT '父id  level=1 时都为0',
  `name` varchar(15) DEFAULT NULL COMMENT '地名',
  `postalcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='地址表';

-- ----------------------------
-- Records of t_region
-- ----------------------------

-- ----------------------------
-- Table structure for `t_seller`
-- ----------------------------
DROP TABLE IF EXISTS `t_seller`;
CREATE TABLE `t_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(20) NOT NULL,
  `updatetime` varchar(20) NOT NULL,
  `deletestate` int(11) DEFAULT '0',
  `imgurl` varchar(300) DEFAULT NULL COMMENT '商店logo',
  `name` varchar(20) DEFAULT NULL COMMENT '商家名称',
  `intro` text COMMENT '简述',
  `uid` text COMMENT '用户id',
  `shopname` varchar(20) DEFAULT NULL COMMENT '商店名',
  `state` int(11) NOT NULL COMMENT '认证状态',
  `descrip` text COMMENT '商家描述',
  `money` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000001 DEFAULT CHARSET=utf8 COMMENT='商家表';

-- ----------------------------
-- Records of t_seller
-- ----------------------------
INSERT INTO `t_seller` VALUES ('100000000', '2017-10-26 15:25:31', '2017-10-26 15:25:31', '0', null, '陈泽功', '陈泽功的', '100000021', '陈泽功的店', '1', null, null);

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(30) NOT NULL COMMENT '账号',
  `password` varchar(32) NOT NULL COMMENT '密码',
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
  `deletestate` int(11) DEFAULT '0',
  `type` int(11) DEFAULT NULL COMMENT '用户类型0、管理员用户 1 、普通用户  2、 商家用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000023 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('100000000', '!111', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 14:10:50', '2017-10-26 14:10:50', '0', null);
INSERT INTO `t_user` VALUES ('100000001', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 14:18:01', '2017-10-26 14:18:01', '0', null);
INSERT INTO `t_user` VALUES ('100000002', '1', 'a1667edeb02944f8674338defe66ccdb', '4', '1', null, null, null, null, null, null, '2017-10-26 14:22:27', '2017-10-26 14:22:27', '0', null);
INSERT INTO `t_user` VALUES ('100000003', '2222', 'a1667edeb02944f8674338defe66ccdb', '4', '1', null, null, null, null, null, null, '2017-10-26 14:28:55', '2017-10-26 14:28:55', '0', null);
INSERT INTO `t_user` VALUES ('100000004', '22111122', 'a1667edeb02944f8674338defe66ccdb', '4', '1', null, null, null, null, null, null, '2017-10-26 14:29:36', '2017-10-26 14:29:36', '0', null);
INSERT INTO `t_user` VALUES ('100000005', '22111111122', 'a1667edeb02944f8674338defe66ccdb', '4', '1', null, null, null, null, null, null, '2017-10-26 14:58:25', '2017-10-26 14:58:25', '0', null);
INSERT INTO `t_user` VALUES ('100000006', '221111111122', 'a1667edeb02944f8674338defe66ccdb', '4', '1', null, null, null, null, null, null, '2017-10-26 14:58:39', '2017-10-26 14:58:39', '0', null);
INSERT INTO `t_user` VALUES ('100000007', '221111111111122', 'a1667edeb02944f8674338defe66ccdb', '4', '1', null, null, null, null, null, null, '2017-10-26 14:58:43', '2017-10-26 14:58:43', '0', null);
INSERT INTO `t_user` VALUES ('100000008', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:25:31', '2017-10-26 15:25:31', '0', null);
INSERT INTO `t_user` VALUES ('100000009', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:28:22', '2017-10-26 15:28:22', '0', null);
INSERT INTO `t_user` VALUES ('100000010', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:30:56', '2017-10-26 15:30:56', '0', null);
INSERT INTO `t_user` VALUES ('100000011', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:37:55', '2017-10-26 15:37:55', '0', null);
INSERT INTO `t_user` VALUES ('100000012', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:39:09', '2017-10-26 15:39:09', '0', null);
INSERT INTO `t_user` VALUES ('100000013', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:40:04', '2017-10-26 15:40:04', '0', null);
INSERT INTO `t_user` VALUES ('100000014', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:40:42', '2017-10-26 15:40:42', '0', null);
INSERT INTO `t_user` VALUES ('100000015', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:41:01', '2017-10-26 15:41:01', '0', null);
INSERT INTO `t_user` VALUES ('100000016', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:44:29', '2017-10-26 15:44:29', '0', null);
INSERT INTO `t_user` VALUES ('100000017', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:45:42', '2017-10-26 15:45:42', '0', null);
INSERT INTO `t_user` VALUES ('100000018', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:50:51', '2017-10-26 15:50:51', '0', null);
INSERT INTO `t_user` VALUES ('100000019', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 15:51:38', '2017-10-26 15:51:38', '0', null);
INSERT INTO `t_user` VALUES ('100000021', '781015928@qq.com', 'e1a9e3bb9f8688da3125c582756e4df5', '781015928@qq.com', null, null, null, null, null, null, null, '2017-10-26 16:12:41', '2017-10-26 16:12:41', '0', null);
INSERT INTO `t_user` VALUES ('100000022', '222222', '7575df46686d4f7f7b3a2ee714d42d0e', '111', '111', null, null, null, null, null, null, '2017-10-26 17:53:09', '2017-10-26 17:53:09', '0', null);
