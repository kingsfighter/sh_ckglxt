CREATE DATABASE jfinal_demo;

USE jfinal_demo;

CREATE TABLE `blog` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(200) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `blog` VALUES ('1', 'JFinal Demo Title here', 'JFinal Demo Content here');
INSERT INTO `blog` VALUES ('2', 'test 1', 'test 1');
INSERT INTO `blog` VALUES ('3', 'test 2', 'test 2');
INSERT INTO `blog` VALUES ('4', 'test 3', 'test 3');
INSERT INTO `blog` VALUES ('5', 'test 4', 'test 4');

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `sex` varchar(2) NOT NULL, -- 0:male,1:female
  `email` varchar(200) NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `user` VALUES ('1', 'admin', 'admin','管理员','男','admin@test.com','我是管理员');
commit;
/* 商品库存 */
CREATE TABLE `goods_stock` (
  `id` int(11) NOT NULL auto_increment,
  `goodsNum` varchar(200) NOT NULL,
  `goodsName` varchar(200) NOT NULL,
  `goodsStandard` varchar(200) NULL,
  `goodsCategory` varchar(200) NULL,
  `goodsPrice` double(10,2) NOT NULL,
  `goodsDesc` varchar(2000) NULL,
  
  `stockWareName` varchar(200) NULL,
  `stockShelfName` varchar(200) NULL,
  `stockCount` int(11) default 0 NOT NULL,
  
  `lastStockInTime` varchar(200) NULL,
  `lastStockInUser` varchar(200) NULL,
  `lastStockInCount` int(11) NULL,
  
  `lastStockOutTime` varchar(200) NULL,
  `lastStockOutUser` varchar(200) NULL,
  `lastStockOutCount` int(11) NULL,
  
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
