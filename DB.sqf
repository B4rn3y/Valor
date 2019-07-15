SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+01:00";
--
-- Compatible with newer MySQL versions. (After MySQL-5.5)
-- This SQL uses utf8mb4 and has CURRENT_TIMESTAMP function.
--




--
-- Database: `valor`
-- Default Schema
--
CREATE DATABASE IF NOT EXISTS `valor` DEFAULT CHARACTER SET utf8mb4;
USE `valor`;


-- --------------------------------------------------------

--
-- Table structure for table `players`
--
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `coplevel`  enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0' ,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '5000',
  `humanity` int(100) NOT NULL DEFAULT '3500',
  `gear` text NOT NULL,
  `gear_cop` text NOT NULL,
  `quests` text,
  `stats` varchar(32) NOT NULL DEFAULT '"[100,100,0,12000]"',
  `stats_cop` varchar(32) NOT NULL DEFAULT '"[100,100,0,12000]"',
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donatorlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `alive_cop` tinyint(1) NOT NULL DEFAULT '1',
  `position` varchar(64) NOT NULL DEFAULT '"[]"',
  `position_cop` varchar(64) NOT NULL DEFAULT '"[]"',
  `Map` text NOT NULL,
  `playtime` varchar(32) NOT NULL DEFAULT '0',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `application` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `pid` (`pid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12 ;




-- --------------------------------------------------------

DROP TABLE IF EXISTS `applications`;
CREATE TABLE IF NOT EXISTS `applications` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `grp_name` varchar(32) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `bankacc` int(100) NOT NULL DEFAULT '5000',
  `humanity` int(100) NOT NULL DEFAULT '3500',
  `playtime` varchar(32) NOT NULL DEFAULT '0',
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `pid` (`pid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `player_satistics`
--
DROP TABLE IF EXISTS `player_satistics`;
CREATE TABLE IF NOT EXISTS `player_satistics` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `steamname` varchar(32) NOT NULL,
  `resolution` text NOT NULL,
  `productversion` text NOT NULL,
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `loottable_classnames`;
CREATE TABLE IF NOT EXISTS `loottable_classnames` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `classname` varchar(100) NOT NULL,
  `table_type` varchar(50) NOT NULL,
  `min_prob` varchar(50) NOT NULL,
  `max_prob` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `spawn_with` varchar(256) NOT NULL,
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `loottable_houses`;
CREATE TABLE IF NOT EXISTS `loottable_houses` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `classname` varchar(100) NOT NULL,
  `table_type` varchar(256) NOT NULL,
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------


DROP TABLE IF EXISTS `valor_settings`;
CREATE TABLE `valor_settings` (
`varname`  varchar(50) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '' ,
`varvalue`  text CHARACTER SET latin1 COLLATE latin1_german1_ci NULL ,
`public`  enum('true','false') CHARACTER SET latin1 COLLATE latin1_german1_ci NULL DEFAULT 'false' ,
PRIMARY KEY (`varname`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;


-- --------------------------------------------------------


--
-- Table structure for table `LOG`
--
DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `steamname` varchar(32) NOT NULL,
  `happening` text NOT NULL,
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------
DROP TABLE IF EXISTS `item_shop`;
CREATE TABLE IF NOT EXISTS `item_shop` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `classname` varchar(256) NOT NULL,
  `price` int(6) NOT NULL DEFAULT '100',
  `stock` int(6) NOT NULL DEFAULT '0',
  `infinite` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(256) NOT NULL,
  `seller` varchar(128) NOT NULL default '["survivor_city"]',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `item_sell_prices`;
CREATE TABLE IF NOT EXISTS `item_sell_prices` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `classname` varchar(256) NOT NULL,
  `price` int(6) NOT NULL DEFAULT '100',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `persistent_vehicles`;
CREATE TABLE IF NOT EXISTS `persistent_vehicles` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pos` varchar(256) DEFAULT NULL,
  `classname` varchar(256) NOT NULL,
  `type` text NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `shop` tinyint(1) NOT NULL DEFAULT '0',
  `spawnpos` text NOT NULL,
  `Spawndamage` text NOT NULL,
  `inventory` text NOT NULL,
  `fuel` double NOT NULL DEFAULT '0',
  `damage` text NOT NULL,
  `sold` int(6) NOT NULL DEFAULT '0',
  `bought` int(6) NOT NULL DEFAULT '0',
  `mode` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` int(20) NOT NULL DEFAULT '-1',
  `cop` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------
--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `group_members`;
CREATE TABLE IF NOT EXISTS `group_members` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `group_id` int(25) NOT NULL DEFAULT '1',
  `name` varchar(32) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `rank` int(6) NOT NULL DEFAULT '1',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------
--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `founder` varchar(17) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------
--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `vehicle_prices`;
CREATE TABLE IF NOT EXISTS `vehicle_prices` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `classname` varchar(64) NOT NULL,
  `price` int(10) NOT NULL default '100',
  `type` text NOT NULL,
  `seller` varchar(128) NOT NULL default '["survivor_city"]',
  `sold` int(6) NOT NULL DEFAULT '0',
  `bought` int(6) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------
--
-- Table structure for table `loot_table`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `loot_table`;
CREATE TABLE IF NOT EXISTS `loot_table` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `loot_table` text NOT NULL,
  `min` varchar(64) NOT NULL,
  `max` varchar(64) NOT NULL,
  `classname` text NOT NULL,
  `spawn_with` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------
--
-- Table structure for table `house_table`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `base_objects`;
CREATE TABLE IF NOT EXISTS `base_objects` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `base_id` int(10) NOT NULL,
  `classname` text NOT NULL,
  `pos` text NOT NULL,
  `dir` varchar(64) NOT NULL,
  `vector` text NOT NULL,
  `inventory` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `base_id` (`base_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------
--
-- Table structure for table `house_table`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `bases`;
CREATE TABLE IF NOT EXISTS `bases` (
  `base_id` int(6) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `cop` tinyint(1) NOT NULL DEFAULT '0',
  `raptor` tinyint(1) NOT NULL DEFAULT '0',
  `raptor_classname` varchar(128) NOT NULL DEFAULT '"babe_raptorb_east_5_F"',
  `build` int(10) NOT NULL DEFAULT '0',
  `classname` text NOT NULL,
  `pos` text NOT NULL,
  `dir` varchar(64) NOT NULL,
  `vector` text NOT NULL,
  `inventory` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`base_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------


DROP TABLE IF EXISTS `outposts`;
CREATE TABLE IF NOT EXISTS `outposts` (
  `outpost_id` int(6) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `build` tinyint(1) NOT NULL DEFAULT '0',
  `inventory` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`outpost_id`),
  KEY `group_id` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

INSERT INTO `valor_settings` (`varname`, `varvalue`, `public`) VALUES ('COP_BANK', '0', 'false');
INSERT INTO `outposts` (`config_id`, `build`, `inventory`) VALUES ('0', '0', '"[]"');


-- Cop Shop
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (4,'U_BG_Guerilla2_1',1000,102,0,'uniform','[\"survivor_city\"]','2019-06-24 15:29:40','2019-06-24 18:28:07');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (5,'CUP_U_O_RUS_EMR_1',1000,100,0,'uniform','[\"cop_shop_1\"]','2019-06-24 18:22:18','2019-06-24 18:22:18');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (6,'CUP_U_O_RUS_VSR93_MSV',1000,100,0,'uniform','[\"cop_shop_1\"]','2019-06-24 18:23:01','2019-06-24 18:23:01');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (7,'rhs_uniform_m88_patchless',1000,100,0,'uniform','[\"cop_shop_1\"]','2019-06-24 18:23:13','2019-06-24 18:23:13');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (8,'rhs_6b23',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 18:23:33','2019-06-24 18:23:33');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (9,'rhs_6b23_digi',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 18:23:44','2019-06-24 18:23:44');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (10,'CUP_V_RUS_6B45_1',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 18:23:51','2019-06-24 18:23:51');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (11,'CUP_V_RUS_6B45_2',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 18:23:58','2019-06-24 18:23:58');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (12,'CUP_V_RUS_6B45_3',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 18:24:05','2019-06-24 18:24:05');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (13,'CUP_V_CZ_vest15',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 18:24:14','2019-06-24 18:24:14');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (14,'CUP_V_C_Police_Holster',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 18:24:23','2019-06-24 18:24:23');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (15,'CUP_V_B_PASGT_no_bags_OD',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 18:24:30','2019-06-24 18:24:30');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (16,'rhs_6b27m_digi',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 18:24:53','2019-06-24 18:24:53');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (18,'CUP_H_RUS_6B47',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 18:25:07','2019-06-24 18:25:07');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (19,'CUP_H_SLA_SLCap',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 18:25:15','2019-06-24 18:25:15');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (20,'CUP_H_SLA_OfficerCap',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 18:25:23','2019-06-24 18:25:23');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (21,'rhs_Booniehat_digi',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 18:25:32','2019-06-24 18:25:32');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (22,'CUP_H_CDF_OfficerCap_FST',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 18:25:40','2019-06-24 18:25:40');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (23,'rhs_fieldcap_digi',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 18:25:52','2019-06-24 18:25:52');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (24,'CUP_H_C_Ushanka_02',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 18:26:00','2019-06-24 18:26:00');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (25,'CUP_B_ACRPara_m95',1000,100,0,'backpack','[\"cop_shop_1\"]','2019-06-24 18:26:24','2019-06-24 18:26:24');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (26,'CUP_B_HikingPack_civ',1000,100,0,'backpack','[\"cop_shop_1\"]','2019-06-24 18:26:34','2019-06-24 18:26:34');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (27,'CUP_B_Kombat_Olive',1000,100,0,'backpack','[\"cop_shop_1\"]','2019-06-24 18:26:41','2019-06-24 18:26:41');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (28,'rhs_assault_umbts_engineer_empty',1000,100,0,'backpack','[\"cop_shop_1\"]','2019-06-24 18:26:48','2019-06-24 18:26:48');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (29,'rhs_6b28',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 18:43:52','2019-06-24 18:43:52');




/*
-- Query: SELECT * FROM valor.persistent_vehicles
-- Date: 2019-07-04 22:57
*/
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (5,'[[13305.9,3233.05,0.0260811],232.172,[-0.0673026,-0.047446,0.996604]]','\"CUP_B_SA330_Puma_HC1_BAF\"','helicopter',0,0,'[[13306.7,3233.46,0.0200272],233.173,[-0.0661703,-0.0444163,0.996819]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:10:31','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (6,'[[12239.8,12593,-0.34108],321.599,[0.0407299,-0.0431228,0.998239]]','\"CUP_B_Mi171Sh_Unarmed_ACR\"','helicopter',0,0,'[[12239.7,12593.1,-0.341278],321.69,[0.0407437,-0.0432611,0.998233]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0,0,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:11:28','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (7,'[[11452.9,7488.64,12.3636],198.489,[0.0168926,0.0266145,0.999503]]','\"CUP_O_MI6T_RU\"','helicopter',0,0,'[[11452.8,7488.48,12.363],198.525,[0.0173622,0.0270102,0.999484]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0,0,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:13:21','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (8,'[[4386.44,10704.5,0.0177612],60.8312,[0.00210605,0.00117549,0.999997]]','\"CUP_B_CH53E_GER\"','helicopter',0,0,'[[4386.42,10704.5,0.0177612],60.8365,[0.00263919,0.000280679,0.999997]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:14:12','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (9,'[[13059.6,10720.5,-0.176121],17.045,[0.000428155,0.00787059,0.999969]]','\"CUP_C_Lada_White_CIV\"','land',0,0,'[[13059.6,10720.5,-0.0230503],17.1384,[-0.00348309,-0.00397173,0.999986]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:14:48','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (10,'[[3848.53,8889.17,0.0578003],210.107,[0.00552518,-0.00135123,0.999984]]','\"AlessioAventadorM\"','land',0,0,'[[9120.67,7432.43,0.0393982],359.948,[-0.00384463,-0.000613867,0.999992]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.0148024,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,-1,0,'2019-06-25 00:16:52','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (11,'[[1944.24,12469.4,-0.394958],338.677,[0.0296073,0.0180732,0.999398]]','\"CUP_C_Ural_Civ_02\"','land',0,0,'[[1943.88,12469.4,-0.0155029],338.705,[0.0239708,0.0167428,0.999572]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:19:05','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (12,'[[12280.8,12655.3,-0.0210571],98.6611,[0.00285093,0.00138815,0.999995]]','\"interceptor_1\"','land',0,0,'[[1977.73,9151.19,-0.0391541],48.0001,[0.0413494,0.0137227,0.999051]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.965974,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,0,-1,0,'2019-06-25 00:20:13','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (13,'[[6872.21,11460.1,-0.230469],173.704,[-0.0459026,-0.00400129,0.998938]]','\"CUP_B_HMMWV_M2_NATO_T\"','land',0,0,'[[6872.97,11460.1,-0.0449524],173.671,[-0.0495215,-0.00199618,0.998771]]','\"[0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:24:14','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (14,'[[1863.64,2216.52,-0.177128],249.181,[0.0175177,0.00409507,0.999838]]','\"CUP_B_S1203_Ambulance_CDF\"','land',0,0,'[[1863.51,2216.5,-0.0256643],249.222,[0.0102952,-0.00683242,0.999924]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:26:36','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (15,'[[3719.4,5966.15,-0.231476],275.838,[0.00212832,-0.00124551,0.999997]]','\"CUP_O_UAZ_Unarmed_RU\"','land',0,0,'[[3719.4,5966.15,0.0168762],275.838,[0.00214536,-1.96538e-005,0.999998]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0.9,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:27:52','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (16,'[[6533.82,6103.3,-0.29483],245.67,[0.0113517,-0.00440409,0.999926]]','\"Fox_Tahoe_Apocalypse\"','land',0,0,'[[6533.82,6103.3,-0.0352478],245.59,[0.0108483,-0.00396631,0.999933]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-06-25 00:28:49','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (17,'[[6353.26,2436.56,-0.281585],22.0069,[-0.0152499,0.00547019,0.999869]]','\"CUP_C_Ikarus_Chernarus\"','land',0,0,'[[6353.08,2436.63,-0.0105143],21.8999,[0.00102455,0.000574868,0.999999]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,1,1,1,1,1,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:29:34','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (18,'[[6126.74,1988.67,0.00316811],54.5453,[0.016409,-0.014193,0.999765]]','\"CUP_C_TT650_CIV\"','land',0,0,'[[6126.5,1988.8,-9.34601e-005],50.4752,[0.0164289,-0.00245893,0.999862]]','\"[0.9,0.9,0.9,0.9,0.9,1,1,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,1,1,0.9]\"',0,0,0,-1,0,'2019-06-25 00:30:21','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (19,'[[11386.4,13884,-0.16658],354.506,[0.000355923,0.00272334,0.999996]]','\"CUP_C_Volha_Limo_TKCIV\"','land',0,0,'[[11386.4,13884,-0.00216675],354.424,[0.00621234,-0.00564857,0.999965]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:32:17','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (22,'[[3841.39,8872.66,17.8408],25.2226,[8.69486e-006,-9.60264e-008,1]]','\"CUP_O_UH1H_SLA\"','helicopter',0,0,'[[3839.14,8868.57,17.8443],206.4,[0,0,1]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.988454,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,-1,1,'2019-06-25 00:49:51','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (23,'[[3857.04,8885.4,-0.382355],206.578,[0.0221646,-0.0118248,0.999684]]','\"CUP_O_GAZ_Vodnik_PK_RU\"','land',0,0,'[[3856.74,8885.57,0.022583],206.584,[0.0169981,-0.00857434,0.999819]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.85,0.9,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,1,1,1,1,0.901575,0.901575,0.850394,0,0,0,0,0.901575,0.901575]\"',0,0,-2,-1,1,'2019-06-25 00:54:05','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (24,'[[3861.23,8881.73,-0.319458],204.502,[-0.000385561,0.000102213,1]]','\"B_T_MRAP_01_F\"','land',0,0,'[[3861.23,8881.73,-0.00305176],204.468,[-0.000328668,8.25033e-005,1]]','\"[1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0,0,0,0,0.9,0.9]\"',0,0,-2,-1,1,'2019-06-25 00:54:40','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (25,'[[3876.26,8877.9,0.00259399],293.787,[0.00680998,-4.52134e-006,0.999977]]','\"rhs_zil131_msv\"','land',0,0,'[[3876.19,8877.9,0.000915527],293.786,[0.0067988,-1.06012e-005,0.999977]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,-1,1,'2019-06-25 00:55:02','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (26,'[[3873.93,8873.64,-0.272125],295.356,[-0.000905152,-0.0031931,0.999994]]','\"rhs_tigr_msv\"','land',0,0,'[[3873.93,8873.69,0.028656],295.361,[0.000349973,-0.000686647,1]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0,0,0.9,0,0,0.9,0,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0,0,0,0,0.9,0,0,0,0,0.9,0,0,0.9,0.9]\"',0,0,-2,-1,1,'2019-06-25 00:55:10','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (27,'[[3872.84,8869.99,0.00183105],295.982,[0.00567804,0.00268954,0.99998]]','\"CUP_O_Volha_SLA\"','land',0,0,'[[3872.78,8869.95,-0.0123291],295.99,[0.00433488,0.00053489,0.99999]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,-1,1,'2019-06-25 00:55:52','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (28,'[[3871.39,8867.22,0.00195313],295.99,[0.00576851,0.00260384,0.99998]]','\"CUP_O_Volha_SLA\"','land',0,0,'[[3871.33,8867.21,-0.0121155],295.99,[0.00472265,0.000494615,0.999989]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,-1,1,'2019-06-25 00:56:00','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (29,'[[3870.22,8864.47,0.00192261],295.99,[0.00576335,0.0026354,0.99998]]','\"CUP_O_Volha_SLA\"','land',0,0,'[[3870.16,8864.46,-0.0121765],295.99,[0.00472265,0.000494615,0.999989]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,-1,1,'2019-06-25 00:56:12','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (30,'[[3868.84,8862,0.00219727],295.986,[0.00621368,0.00240615,0.999978]]','\"CUP_O_Volha_SLA\"','land',0,0,'[[3868.78,8861.99,-0.0118103],295.99,[0.00525529,0.000472969,0.999986]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,-1,1,'2019-06-25 00:56:20','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (31,'[[10445,2554.82,-0.47656],21.4874,[-0.00221085,0.0104061,0.999943]]','\"Fox_Fireengine\"','land',0,0,'[[10445,2554.7,-0.112472],21.426,[-0.000398847,0.00520512,0.999986]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-06-25 01:00:24','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (32,'[[4602.19,9753.27,-0.267334],172.771,[0.00182421,0.00555202,0.999983]]','\"rhs_tigr_3camo_msv\"','land',0,0,'[[4602.19,9753.21,0.0336914],172.777,[0.00163039,0.00543611,0.999984]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0,0,0.9,0,0,0.9,0,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0,0,0,0,0.9,0,0,0,0,0.9,0,0,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 01:01:35','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (33,'[[3853.38,8888.4,-0.00411987],206.619,[0.00717143,0.00885406,0.999935]]','\"CUP_C_Lada_GreenTK_CIV\"','land',0,0,'[[3853.32,8888.34,-0.0218811],206.637,[0.00775195,0.00894888,0.99993]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,-1,1,'2019-06-25 01:06:17','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (34,'[[11928.1,8962.85,-0.107216],85.6688,[0.101579,0.144926,0.984214]]','\"CUP_C_Golf4_camodark_Civ\"','land',0,0,'[[11928,8962.66,0.0304871],84.8176,[0.118489,0.13913,0.98316]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-07-04 21:21:59','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (35,'[[8883.59,11653.9,-0.188065],282.675,[-0.00288208,-0.0019682,0.999994]]','\"CUP_C_Volha_Gray_TKCIV\"','land',0,0,'[[8883.6,11653.9,-0.012085],282.668,[0.00477525,9.27558e-005,0.999989]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-07-04 21:22:11','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (36,'[[8948.71,7782.38,-0.294525],263.294,[0.00327739,-0.00143766,0.999994]]','\"Fox_Viper\"','land',0,0,'[[8948.71,7782.38,-0.125702],263.299,[0.00313724,-2.58098e-005,0.999995]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-07-04 21:23:03','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (37,'[[9479.87,8933.1,-0.255402],211.287,[0.0192376,-0.0153556,0.999697]]','\"Fox_Charger_Apocalypse\"','land',0,0,'[[9479.84,8933.12,-0.0359192],211.252,[0.0221287,-0.011145,0.999693]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-07-04 21:24:03','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (38,'[[8396.6,6661.55,-0.10318],21.5041,[-0.00984653,0.000597468,0.999951]]','\"CUP_C_LR_Transport_CTK\"','land',0,0,'[[8396.62,6661.55,0.0104675],21.5011,[-0.00842854,-0.00094362,0.999964]]','\"[0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-07-04 21:25:33','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (39,'[[8651.27,13307.9,-0.235901],59.6408,[0.00875188,0.00735908,0.999934]]','\"Fox_DaytonaStratos\"','land',0,0,'[[8651.27,13307.9,-0.0367508],59.7262,[-0.011533,0.000749588,0.999933]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-07-04 21:26:47','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (40,'[[4581.49,4517.89,-0.0545807],321.812,[-0.00140401,-0.00683242,0.999976]]','\"Fox_DaytonaGeneral\"','land',0,0,'[[4581.49,4517.9,0.119522],321.816,[8.85077e-005,-0.0124317,0.999923]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-07-04 21:27:49','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (41,'[[13078.2,7043.66,-0.33117],78.6604,[0.0254201,0.0019692,0.999675]]','\"warrig_black\"','land',0,0,'[[13078.2,7043.65,0.0227323],78.6374,[0.0275672,5.72083e-005,0.99962]]','\"[1,1,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,0.9,0.85,0.9,0.9,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-07-04 21:29:04','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (42,'[[6942.56,2630.58,0.0107226],229.148,[0.00854023,0.0298112,0.999519]]','\"CUP_O_Kamaz_Open_RU\"','land',0,1,'[[11498.8,5497.39,0.00552368],305.049,[0.104642,0.0457234,0.993458]]','\"[0.9,0.9,0.9,1,1,1,1,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.85,0.9,0.9,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.992472,'\"[0.0826772,0,0.0984252,0.259843,0,0.0314961,0,0.259843,0,0,0,0.192913,0.192913,0.192913,0.141732,0,0,0,0,0.106299,0,0,0,0]\"',0,0,0,-1,0,'2019-07-04 21:31:04','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (43,'[[7434.64,5149.74,-0.286362],130.714,[0.0405966,-0.0410597,0.998332]]','\"CUP_C_V3S_Open_TKC\"','land',0,0,'[[7434.57,5149.82,-0.0338593],130.718,[0.0379751,-0.0405518,0.998456]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-07-04 21:32:01','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (44,'[[3281.33,4938.78,-0.344437],87.244,[-0.00253408,-0.000391926,0.999997]]','\"RHS_Ural_Open_Civ_01\"','land',0,0,'[[3281.33,4938.78,-0.00553894],87.244,[-0.00244423,-1.36134e-007,0.999997]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0,0,0,0.9,0,0,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0,0,0,0.9,0,0,0.9]\"',0,0,0,-1,0,'2019-07-04 21:32:59','2019-07-04 22:29:58');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (45,'[[8110.71,9314,-0.224701],72.844,[0.00552498,0.0589019,0.998249]]','\"CUP_I_SUV_Armored_ION\"','land',0,0,'[[8110.71,9313.95,0.023468],72.7854,[0.00051071,0.0529341,0.998598]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9]\"',0,0,0,-1,0,'2019-07-04 21:33:53','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (46,'[[9074.16,4346.41,0.00244141],280.094,[0.0845115,-0.0115176,0.996356]]','\"CUP_B_UH1Y_UNA_USMC\"','helicopter',0,0,'[[9073.99,4346.42,0.00305176],279.946,[0.085231,-0.0118578,0.996291]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"',0,0,0,-1,0,'2019-07-04 21:35:10','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (47,'[[4651.21,2515.56,-0.0140896],30.7119,[-0.00150358,0.00248654,0.999996]]','\"CUP_B_UH60M_Unarmed_US\"','helicopter',0,0,'[[4651.2,2515.56,-0.0140724],30.9373,[-0.000432274,0.00182459,0.999998]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0,0]\"',0,0,0,-1,0,'2019-07-04 21:36:56','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (48,'[[11229.2,4245.11,6.84573],1.04184,[-0.00714096,-0.058629,0.998254]]','\"CUP_O_Mi8_CHDKZ\"','helicopter',0,0,'[[11229.2,4245.31,6.85321],1.05107,[-0.00585492,-0.0599606,0.998184]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"',0,0,0,-1,0,'2019-07-04 21:38:51','2019-07-04 22:56:53');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (49,'[[12161.8,9735.23,0.151004],195.548,[0.00683429,0.0245597,0.999675]]','\"CUP_B_CH47F_GB\"','helicopter',0,0,'[[12161.8,9735.14,0.151002],195.551,[0.00705331,0.0245193,0.999674]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0,0,0.9]\"',0,0,0,-1,0,'2019-07-04 21:39:33','2019-07-04 22:56:53');



-- VEHICLE PRICES

/*
-- Query: SELECT * FROM valor.vehicle_prices
-- Date: 2019-07-01 19:53
*/
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (4,'\"CUP_C_TT650_CIV\"',1000,'land','[\"survivor_city\"]',0,0,'2019-07-01 18:44:28','2019-07-01 18:44:28');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (5,'\"CUP_C_Lada_White_CIV\"',2000,'land','[\"survivor_city\"]',0,0,'2019-07-01 18:45:16','2019-07-01 18:45:16');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (6,'\"CUP_C_Lada_GreenTK_CIV\"',2000,'land','[\"survivor_city\"]',0,0,'2019-07-01 18:46:30','2019-07-01 18:46:30');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (7,'\"CUP_C_Volha_Gray_TKCIV\"',3000,'land','[\"survivor_city\"]',0,0,'2019-07-01 18:47:26','2019-07-01 18:47:26');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (8,'\"CUP_C_Volha_Limo_TKCIV\"',3000,'land','[\"survivor_city\"]',0,0,'2019-07-01 18:47:41','2019-07-01 18:47:41');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (9,'\"CUP_B_S1203_Ambulance_CDF\"',4000,'land','[\"survivor_city\"]',0,0,'2019-07-01 18:49:45','2019-07-01 18:49:45');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (10,'\"CUP_C_Golf4_camodark_Civ\"',6000,'land','[\"survivor_city\"]',0,0,'2019-07-01 18:50:17','2019-07-01 18:50:17');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (11,'\"interceptor_1\"',11000,'land','[\"survivor_city\"]',0,0,'2019-07-01 18:56:35','2019-07-01 18:56:35');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (13,'\"Fox_Tahoe_Apocalypse\"',15000,'land','[\"survivor_city\"]',0,0,'2019-07-01 18:59:15','2019-07-01 18:59:15');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (14,'\"Fox_Viper\"',12000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:00:44','2019-07-01 19:00:44');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (15,'\"Fox_Charger_Apocalypse\"',14000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:02:34','2019-07-01 19:02:34');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (16,'\"CUP_C_LR_Transport_CTK\"',19000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:03:30','2019-07-01 19:03:30');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (17,'\"Fox_DaytonaStratos\"',14000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:04:41','2019-07-01 19:04:41');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (18,'\"Fox_DaytonaGeneral\"',14000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:04:53','2019-07-01 19:04:53');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (19,'\"Fox_Fireengine\"',45000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:08:22','2019-07-01 19:08:22');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (20,'\"warrig_black\"',55000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:10:12','2019-07-01 19:10:12');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (21,'\"CUP_O_UAZ_Unarmed_RU\"',13000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:11:59','2019-07-01 19:11:59');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (22,'\"CUP_C_Ikarus_Chernarus\"',23000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:14:50','2019-07-01 19:14:50');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (23,'\"CUP_O_Kamaz_Open_RU\"',50000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:16:29','2019-07-01 19:16:29');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (24,'\"CUP_C_V3S_Open_TKC\"',50000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:18:07','2019-07-01 19:18:07');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (25,'\"CUP_C_Ural_Civ_02\"',60000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:18:43','2019-07-01 19:18:43');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (26,'\"RHS_Ural_Open_Civ_01\"',58000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:20:21','2019-07-01 19:20:21');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (27,'\"rhs_tigr_msv\"',50000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:22:36','2019-07-01 19:22:36');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (28,'\"CUP_O_Volha_SLA\"',3000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:23:09','2019-07-01 19:23:09');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (29,'\"rhs_tigr_3camo_msv\"',50000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:24:12','2019-07-01 19:24:12');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (30,'\"rhs_zil131_msv\"',60000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:24:52','2019-07-01 19:24:52');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (31,'\"B_T_MRAP_01_F\"',55000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:26:00','2019-07-01 19:26:00');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (32,'\"CUP_I_SUV_Armored_ION\"',120000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:31:24','2019-07-01 19:31:24');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (33,'\"CUP_B_HMMWV_M2_NATO_T\"',110000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:31:42','2019-07-01 19:31:42');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (34,'\"CUP_O_GAZ_Vodnik_PK_RU\"',140000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:33:43','2019-07-01 19:33:43');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (35,'\"CUP_B_SA330_Puma_HC1_BAF\"',80000,'helicopter','[\"survivor_city\"]',0,0,'2019-07-01 19:37:37','2019-07-01 19:37:37');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (36,'\"CUP_B_UH1Y_UNA_USMC\"',92000,'helicopter','[\"survivor_city\"]',0,0,'2019-07-01 19:39:25','2019-07-01 19:39:25');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (37,'\"CUP_B_UH60M_Unarmed_US\"',95000,'helicopter','[\"survivor_city\"]',0,0,'2019-07-01 19:40:02','2019-07-01 19:40:02');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (38,'\"CUP_B_CH53E_GER\"',110000,'helicopter','[\"survivor_city\"]',0,0,'2019-07-01 19:42:12','2019-07-01 19:42:12');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (39,'\"CUP_O_MI6T_RU\"',125000,'helicopter','[\"survivor_city\"]',0,0,'2019-07-01 19:42:28','2019-07-01 19:42:28');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (40,'\"CUP_O_UH1H_SLA\"',140000,'helicopter','[\"survivor_city\"]',0,0,'2019-07-01 19:45:13','2019-07-01 19:45:13');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (41,'\"CUP_O_Mi8_CHDKZ\"',150000,'helicopter','[\"survivor_city\"]',0,0,'2019-07-01 19:46:41','2019-07-01 19:46:41');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (42,'\"CUP_B_Mi171Sh_Unarmed_ACR\"',170000,'helicopter','[\"survivor_city\"]',0,0,'2019-07-01 19:47:28','2019-07-01 19:47:28');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (43,'\"CUP_B_CH47F_GB\"',230000,'helicopter','[\"survivor_city\"]',0,0,'2019-07-01 19:50:50','2019-07-01 19:50:50');
INSERT INTO `vehicle_prices` (`id`,`classname`,`price`,`type`,`seller`,`sold`,`bought`,`insert_time`,`last_seen`) VALUES (44,'\"AlessioAventadorM\"',250000,'land','[\"survivor_city\"]',0,0,'2019-07-01 19:53:39','2019-07-01 19:53:39');










INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (32,'CUP_sgun_AA12','m_military','1','3','weapon','[[\"CUP_20Rnd_B_AA12_Pellets\",2,\"magazin\"]]','2019-07-14 16:41:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (33,'CUP_20Rnd_B_AA12_Pellets','m_military','1','5','magazin','[[\"CUP_20Rnd_B_AA12_Pellets\",2,\"magazin\"]]','2019-07-14 16:41:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (34,'CUP_arifle_AK102_railed','l_military','1','7','weapon','[[\"CUP_30Rnd_556x45_AK\",2,\"magazin\"]]','2019-07-14 16:42:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (35,'CUP_30Rnd_556x45_AK','l_military','1','10','magazin','[[\"CUP_30Rnd_556x45_AK\",2,\"magazin\"]]','2019-07-14 16:42:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (36,'CUP_arifle_AK47_Early','l_military','1','5','weapon','[[\"CUP_30Rnd_762x39_AK47_M\",2,\"magazin\"]]','2019-07-14 16:44:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (37,'CUP_30Rnd_762x39_AK47_M','l_military','1','7','magazin','[[\"CUP_30Rnd_762x39_AK47_M\",2,\"magazin\"]]','2019-07-14 16:44:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (38,'LMG_Zafir_F','h_military','1','2','weapon','[[\"150Rnd_762x54_Box\",1,\"magazin\"]]','2019-07-14 16:45:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (39,'150Rnd_762x54_Box','h_military','1','3','magazin','[[\"150Rnd_762x54_Box\",2,\"magazin\"]]','2019-07-14 16:45:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (40,'CUP_arifle_AK74','l_military','1','5','weapon','[[\"CUP_30Rnd_545x39_AK_M\",2,\"magazin\"]]','2019-07-14 16:47:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (41,'CUP_arifle_xm8_SAW','m_military','1','4','weapon','[[\"CUP_100Rnd_556x45_BetaCMag\",2,\"magazin\"]]','2019-07-14 16:48:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (42,'CUP_100Rnd_556x45_BetaCMag','m_military','1','6','magazin','[[\"CUP_100Rnd_556x45_BetaCMag\",2,\"magazin\"]]','2019-07-14 16:48:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (43,'CUP_srifle_VSSVintorez_flash_top','m_military','1','2','weapon','[[\"CUP_10Rnd_9x39_SP5_VSS_M\",2,\"magazin\"]]','2019-07-14 16:49:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (44,'CUP_10Rnd_9x39_SP5_VSS_M','m_military','1','4','magazin','[[\"CUP_10Rnd_9x39_SP5_VSS_M\",2,\"magazin\"]]','2019-07-14 16:49:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (46,'CUP_arifle_AKS_Gold','h_military','1','1.5','weapon','[[\"CUP_30Rnd_762x39_AK47_M\",2,\"magazin\"]]','2019-07-14 16:50:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (47,'CUP_30Rnd_762x39_AK47_M','h_military','1','4','magazin','[[\"CUP_30Rnd_762x39_AK47_M\",2,\"magazin\"]]','2019-07-14 16:50:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (48,'CUP_lmg_UK59','m_military','1','3','weapon','[[\"CUP_50Rnd_UK59_762x54R_Tracer\",1,\"magazin\"]]','2019-07-14 16:51:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (49,'CUP_50Rnd_UK59_762x54R_Tracer','m_military','1','5','magazin','[[\"CUP_50Rnd_UK59_762x54R_Tracer\",2,\"magazin\"]]','2019-07-14 16:51:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (50,'CUP_srifle_CZ550','l_military','1','5','weapon','[[\"CUP_5x_22_LR_17_HMR_M\",2,\"magazin\"]]','2019-07-14 16:52:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (51,'CUP_5x_22_LR_17_HMR_M','l_military','1','7','magazin','[[\"CUP_5x_22_LR_17_HMR_M\",2,\"magazin\"]]','2019-07-14 16:52:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (52,'arifle_TRG21_F','l_military','1','8','weapon','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-14 16:53:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (53,'30Rnd_556x45_Stanag','l_military','1','10','magazin','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-14 16:53:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (54,'CUP_smg_EVO','l_military','1','8','weapon','[[\"CUP_30Rnd_9x19_EVO\",2,\"magazin\"]]','2019-07-14 16:53:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (55,'CUP_30Rnd_9x19_EVO','l_military','1','10','magazin','[[\"CUP_30Rnd_9x19_EVO\",3,\"magazin\"]]','2019-07-14 16:53:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (60,'rhs_weap_t5000','h_military','1','2','weapon','[[\"rhs_5Rnd_338lapua_t5000\",2,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 16:57:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (61,'rhs_5Rnd_338lapua_t5000','h_military','1','4','magazin','[[\"rhs_5Rnd_338lapua_t5000\",3,\"magazin\"]]','2019-07-14 16:57:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (62,'srifle_GM6_F','h_military','1','1.5','weapon','[[\"5Rnd_127x108_Mag\",2,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 16:59:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (63,'5Rnd_127x108_Mag','h_military','1','3','magazin','[[\"5Rnd_127x108_Mag\",3,\"magazin\"]]','2019-07-14 16:59:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (64,'CUP_srifle_M107_Base','h_military','1','1.1','weapon','[[\"CUP_10Rnd_127x99_M107\",2,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 17:00:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (65,'CUP_10Rnd_127x99_M107','h_military','1','2','magazin','[[\"CUP_10Rnd_127x99_M107\",3,\"magazin\"]]','2019-07-14 17:00:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (66,'CUP_srifle_ksvk','h_military','1','1.1','weapon','[[\"CUP_5Rnd_127x108_KSVK_M\",3,\"magazin\"],[\"CUP_optic_PSO_1_1\",1,\"item\"]]','2019-07-14 17:01:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (67,'CUP_5Rnd_127x108_KSVK_M','h_military','1','2','magazin','[[\"CUP_5Rnd_127x108_KSVK_M\",2,\"magazin\"]]','2019-07-14 17:01:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (68,'CUP_srifle_AWM_wdl','h_military','1','2','weapon','[[\"CUP_5Rnd_86x70_L115A1\",3,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 17:02:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (69,'CUP_5Rnd_86x70_L115A1','h_military','1','3','magazin','[[\"CUP_5Rnd_86x70_L115A1\",3,\"magazin\"]]','2019-07-14 17:02:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (70,'srifle_LRR_camo_F','h_military','1','1.75','weapon','[[\"7Rnd_408_Mag\",3,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 17:03:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (71,'7Rnd_408_Mag','h_military','1','3','magazin','[[\"7Rnd_408_Mag\",3,\"magazin\"]]','2019-07-14 17:03:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (72,'CUP_srifle_AS50','h_military','1','1.1','weapon','[[\"CUP_5Rnd_127x99_as50_M\",3,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 17:04:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (73,'CUP_5Rnd_127x99_as50_M','h_military','1','2','magazin','[[\"CUP_5Rnd_127x99_as50_M\",3,\"magazin\"]]','2019-07-14 17:04:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (74,'CUP_lmg_MG3_rail','h_military','1','3','weapon','[[\"CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",3,\"magazin\"]]','2019-07-14 17:06:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (75,'CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M','h_military','1','5','magazin','[[\"CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",3,\"magazin\"]]','2019-07-14 17:06:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (76,'CUP_lmg_M240','h_military','1','4','weapon','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",3,\"magazin\"]]','2019-07-14 17:07:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (77,'CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M','h_military','1','6','magazin','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",3,\"magazin\"]]','2019-07-14 17:07:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (78,'CUP_lmg_Mk48_wdl','h_military','1','4','weapon','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",3,\"magazin\"]]','2019-07-14 17:08:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (79,'CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M','h_military','1','6','magazin','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",3,\"magazin\"]]','2019-07-14 17:08:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (80,'LMG_Mk200_F','m_military','1','2','weapon','[[\"200Rnd_65x39_cased_Box\",3,\"magazin\"]]','2019-07-14 17:09:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (81,'200Rnd_65x39_cased_Box','m_military','1','4','magazin','[[\"200Rnd_65x39_cased_Box\",2,\"magazin\"]]','2019-07-14 17:09:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (82,'CUP_arifle_MG36_wdl','m_military','1','4','weapon','[[\"CUP_100Rnd_556x45_BetaCMag_wdl\",3,\"magazin\"]]','2019-07-14 17:09:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (83,'CUP_100Rnd_556x45_BetaCMag_wdl','m_military','1','6','magazin','[[\"CUP_100Rnd_556x45_BetaCMag_wdl\",2,\"magazin\"]]','2019-07-14 17:09:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (84,'CUP_lmg_L110A1','m_military','1','4','weapon','[[\"CUP_200Rnd_TE4_Red_Tracer_556x45_M249\",3,\"magazin\"]]','2019-07-14 17:11:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (85,'CUP_200Rnd_TE4_Red_Tracer_556x45_M249','m_military','1','6','magazin','[[\"CUP_200Rnd_TE4_Red_Tracer_556x45_M249\",2,\"magazin\"]]','2019-07-14 17:11:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (86,'CUP_srifle_LeeEnfield','l_military','1','7','weapon','[[\"CUP_10x_303_M\",3,\"magazin\"]]','2019-07-14 17:12:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (87,'CUP_10x_303_M','l_military','1','9','magazin','[[\"CUP_10x_303_M\",2,\"magazin\"]]','2019-07-14 17:12:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (88,'CUP_arifle_SR3M_Vikhr_VFG_top_rail','l_military','1','15','weapon','[[\"CUP_30Rnd_9x39_SP5_VIKHR_M\",3,\"magazin\"]]','2019-07-14 17:12:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (89,'CUP_30Rnd_9x39_SP5_VIKHR_M','l_military','1','17','magazin','[[\"CUP_30Rnd_9x39_SP5_VIKHR_M\",3,\"magazin\"]]','2019-07-14 17:12:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (90,'CUP_arifle_HK417_12','l_military','1','4','weapon','[[\"CUP_20Rnd_762x51_HK417\",3,\"magazin\"]]','2019-07-14 17:13:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (91,'CUP_20Rnd_762x51_HK417','l_military','1','6','magazin','[[\"CUP_20Rnd_762x51_HK417\",3,\"magazin\"]]','2019-07-14 17:13:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (92,'CUP_arifle_TYPE_56_2_Early','l_military','1','5','weapon','[[\"CUP_30Rnd_762x39_AK47_M\",3,\"magazin\"]]','2019-07-14 17:14:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (93,'CUP_30Rnd_762x39_AK47_M','l_military','1','7','magazin','[[\"CUP_30Rnd_762x39_AK47_M\",3,\"magazin\"]]','2019-07-14 17:14:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (94,'CUP_arifle_FNFAL_railed','m_military','1','10','weapon','[[\"CUP_20Rnd_762x51_FNFAL_M\",3,\"magazin\"]]','2019-07-14 17:16:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (95,'CUP_20Rnd_762x51_FNFAL_M','m_military','1','12','magazin','[[\"CUP_20Rnd_762x51_FNFAL_M\",3,\"magazin\"]]','2019-07-14 17:16:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (96,'rhs_weap_pp2000','l_military','1','20','weapon','[[\"rhs_mag_9x19mm_7n21_20\",3,\"magazin\"]]','2019-07-14 17:16:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (97,'rhs_mag_9x19mm_7n21_20','l_military','1','22','magazin','[[\"rhs_mag_9x19mm_7n21_20\",3,\"magazin\"]]','2019-07-14 17:16:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (98,'rhs_weap_svdp_npz','m_military','1','5','weapon','[[\"rhs_10Rnd_762x54mmR_7N1\",3,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 17:17:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (99,'rhs_10Rnd_762x54mmR_7N1','m_military','1','7','magazin','[[\"rhs_10Rnd_762x54mmR_7N1\",3,\"magazin\"]]','2019-07-14 17:17:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (100,'CUP_arifle_SAIGA_MK03_top_rail','m_military','1','15','weapon','[[\"CUP_10Rnd_762x39_SaigaMk03_M\",3,\"magazin\"]]','2019-07-14 17:18:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (101,'CUP_10Rnd_762x39_SaigaMk03_M','m_military','1','17','magazin','[[\"CUP_10Rnd_762x39_SaigaMk03_M\",3,\"magazin\"]]','2019-07-14 17:18:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (102,'rhs_weap_pkp','h_military','1','7','weapon','[[\"rhs_100Rnd_762x54mmR\",3,\"magazin\"]]','2019-07-14 17:19:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (103,'rhs_100Rnd_762x54mmR','h_military','1','9','magazin','[[\"rhs_100Rnd_762x54mmR\",2,\"magazin\"]]','2019-07-14 17:19:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (104,'CUP_arifle_Mk17_CQC','m_military','1','10','weapon','[[\"CUP_20Rnd_762x51_B_SCAR\",3,\"magazin\"]]','2019-07-14 17:20:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (105,'CUP_20Rnd_762x51_B_SCAR','m_military','1','12','magazin','[[\"CUP_20Rnd_762x51_B_SCAR\",3,\"magazin\"]]','2019-07-14 17:20:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (106,'CUP_arifle_Sa58RIS2_camo','m_military','1','20','weapon','[[\"CUP_30Rnd_Sa58_M_TracerG\",3,\"magazin\"]]','2019-07-14 17:20:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (107,'CUP_30Rnd_Sa58_M_TracerG','m_military','1','22','magazin','[[\"CUP_30Rnd_Sa58_M_TracerG\",3,\"magazin\"]]','2019-07-14 17:20:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (109,'srifle_EBR_F','m_military','1','8','weapon','[[\"20Rnd_762x51_Mag\",3,\"magazin\"]]','2019-07-14 17:21:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (110,'20Rnd_762x51_Mag','m_military','1','10','magazin','[[\"20Rnd_762x51_Mag\",3,\"magazin\"]]','2019-07-14 17:21:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (111,'CUP_arifle_Mk17_CQC_SFG_woodland','m_military','1','8','weapon','[[\"CUP_20Rnd_762x51_B_SCAR_wdl\",3,\"magazin\"]]','2019-07-14 17:22:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (112,'CUP_20Rnd_762x51_B_SCAR_wdl','m_military','1','10','magazin','[[\"CUP_20Rnd_762x51_B_SCAR_wdl\",3,\"magazin\"]]','2019-07-14 17:22:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (113,'CUP_srifle_M14_DMR','m_military','1','7','weapon','[[\"CUP_20Rnd_762x51_DMR\",3,\"magazin\"]]','2019-07-14 17:22:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (114,'CUP_20Rnd_762x51_DMR','m_military','1','9','magazin','[[\"CUP_20Rnd_762x51_DMR\",3,\"magazin\"]]','2019-07-14 17:22:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (115,'CUP_srifle_M40A3','m_military','1','3','weapon','[[\"CUP_5Rnd_762x51_M24\",3,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 17:23:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (116,'CUP_5Rnd_762x51_M24','m_military','1','5','magazin','[[\"CUP_5Rnd_762x51_M24\",3,\"magazin\"]]','2019-07-14 17:23:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (117,'CUP_srifle_M110','m_military','1','2','weapon','[[\"CUP_20Rnd_762x51_B_M110\",3,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 17:25:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (118,'CUP_20Rnd_762x51_B_M110','m_military','1','3','magazin','[[\"CUP_20Rnd_762x51_B_M110\",3,\"magazin\"]]','2019-07-14 17:25:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (119,'CUP_srifle_M14','m_military','1','8','weapon','[[\"CUP_20Rnd_762x51_DMR\",3,\"magazin\"]]','2019-07-14 17:26:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (120,'CUP_20Rnd_762x51_DMR','m_military','1','10','magazin','[[\"CUP_20Rnd_762x51_DMR\",3,\"magazin\"]]','2019-07-14 17:26:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (121,'CUP_arifle_G36A_RIS_wdl','l_military','1','8','weapon','[[\"CUP_30Rnd_556x45_G36_wdl\",3,\"magazin\"]]','2019-07-14 17:26:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (122,'CUP_30Rnd_556x45_G36_wdl','l_military','1','10','magazin','[[\"CUP_30Rnd_556x45_G36_wdl\",3,\"magazin\"]]','2019-07-14 17:26:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (123,'CUP_arifle_SAIGA_MK03_top_rail','l_military','1','15','weapon','[[\"CUP_10Rnd_762x39_SaigaMk03_M\",3,\"magazin\"]]','2019-07-14 17:27:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (124,'CUP_10Rnd_762x39_SaigaMk03_M','l_military','1','17','magazin','[[\"CUP_10Rnd_762x39_SaigaMk03_M\",3,\"magazin\"]]','2019-07-14 17:27:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (125,'CUP_srifle_SVD_wdl','m_military','1','3','weapon','[[\"CUP_10Rnd_762x54_SVD_M\",3,\"magazin\"],[\"CUP_optic_PSO_1\",1,\"item\"]]','2019-07-14 17:28:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (126,'CUP_10Rnd_762x54_SVD_M','m_military','1','5','magazin','[[\"CUP_10Rnd_762x54_SVD_M\",3,\"magazin\"]]','2019-07-14 17:28:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (127,'CUP_arifle_M4A3_camo','l_military','1','5','weapon','[[\"CUP_30Rnd_556x45_Stanag\",3,\"magazin\"]]','2019-07-14 17:29:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (128,'CUP_30Rnd_556x45_Stanag','l_military','1','7','magazin','[[\"CUP_30Rnd_556x45_Stanag\",3,\"magazin\"]]','2019-07-14 17:29:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (129,'SMG_03C_black','l_military','1','8','weapon','[[\"50Rnd_570x28_SMG_03\",3,\"magazin\"]]','2019-07-14 17:29:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (130,'50Rnd_570x28_SMG_03','l_military','1','10','magazin','[[\"50Rnd_570x28_SMG_03\",3,\"magazin\"]]','2019-07-14 17:29:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (131,'CUP_srifle_M24_wdl','m_military','1','3','weapon','[[\"CUP_5Rnd_762x51_M24\",3,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 17:30:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (132,'CUP_5Rnd_762x51_M24','m_military','1','5','magazin','[[\"CUP_5Rnd_762x51_M24\",3,\"magazin\"]]','2019-07-14 17:30:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (135,'rhs_weap_6p53','l_military','1','25','weapon','[[\"rhs_18rnd_9x21mm_7N28\",3,\"magazin\"]]','2019-07-14 17:32:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (136,'rhs_18rnd_9x21mm_7N28','l_military','1','27','magazin','[[\"rhs_18rnd_9x21mm_7N28\",3,\"magazin\"]]','2019-07-14 17:32:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (137,'CUP_hgun_Colt1911','l_military','1','20','weapon','[[\"CUP_7Rnd_45ACP_1911\",3,\"magazin\"]]','2019-07-14 17:33:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (138,'CUP_7Rnd_45ACP_1911','l_military','1','22','magazin','[[\"CUP_7Rnd_45ACP_1911\",3,\"magazin\"]]','2019-07-14 17:33:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (139,'CUP_hgun_M9','l_military','1','20','weapon','[[\"CUP_15Rnd_9x19_M9\",3,\"magazin\"]]','2019-07-14 17:33:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (140,'CUP_15Rnd_9x19_M9','l_military','1','22','magazin','[[\"CUP_15Rnd_9x19_M9\",3,\"magazin\"]]','2019-07-14 17:33:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (141,'CUP_hgun_Makarov','l_military','1','35','weapon','[[\"CUP_8Rnd_9x18_Makarov_M\",3,\"magazin\"]]','2019-07-14 17:34:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (142,'CUP_8Rnd_9x18_Makarov_M','l_military','1','37','magazin','[[\"CUP_8Rnd_9x18_Makarov_M\",3,\"magazin\"]]','2019-07-14 17:34:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (143,'CHR_FlashLight','l_military','1','5','weapon','[]','2019-07-14 17:36:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (144,'hgun_Pistol_heavy_02_F','l_military','1','20','weapon','[[\"6Rnd_45ACP_Cylinder\",3,\"magazin\"]]','2019-07-14 17:37:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (145,'6Rnd_45ACP_Cylinder','l_military','1','22','magazin','[[\"6Rnd_45ACP_Cylinder\",3,\"magazin\"]]','2019-07-14 17:37:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (146,'rhs_mag_9x18_8_57N181S','l_military','1','32','magazin','[[\"rhs_mag_9x18_8_57N181S\",3,\"magazin\"]]','2019-07-14 17:37:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (147,'rhs_weap_makarov_pm','l_military','1','30','weapon','[[\"rhs_mag_9x18_8_57N181S\",3,\"magazin\"]]','2019-07-14 17:37:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (148,'rhs_weap_pp2000_folded','m_military','1','10','weapon','[[\"rhs_mag_9x19mm_7n21_20\",3,\"magazin\"]]','2019-07-14 17:38:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (149,'rhs_mag_9x19mm_7n21_20','m_military','1','12','magazin','[[\"rhs_mag_9x19mm_7n21_20\",3,\"magazin\"]]','2019-07-14 17:38:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (150,'MadArmA_Revolver_01','l_military','1','20','weapon','[[\"6Rnd_45ACP_Cylinder\",3,\"magazin\"]]','2019-07-14 17:39:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (151,'6Rnd_45ACP_Cylinder','l_military','1','22','magazin','[[\"6Rnd_45ACP_Cylinder\",3,\"magazin\"]]','2019-07-14 17:39:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (152,'CUP_hgun_Phantom','l_military','1','20','weapon','[[\"CUP_18Rnd_9x19_Phantom\",3,\"magazin\"]]','2019-07-14 17:39:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (153,'CUP_18Rnd_9x19_Phantom','l_military','1','22','magazin','[[\"CUP_18Rnd_9x19_Phantom\",3,\"magazin\"]]','2019-07-14 17:39:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (154,'rhs_weap_tr8','l_military','1','5','weapon','[]','2019-07-14 17:40:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (155,'Binocular','general','1','10','item','[]','2019-07-14 17:42:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (156,'Rangefinder','h_military','1','2','item','[]','2019-07-14 17:43:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (157,'CUP_U_B_BAF_BDU_DPM','l_military','1','27','item','[]','2019-07-14 18:05:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (158,'U_B_CTRG_2','l_military','1','20','item','[]','2019-07-14 18:06:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (159,'U_I_G_resistanceLeader_F','l_military','1','20','item','[]','2019-07-14 18:07:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (160,'U_O_CombatUniform_oucamo','l_military','1','15','item','[]','2019-07-14 18:07:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (161,'CUP_U_B_CZ_DST_TShirt','l_military','1','20','item','[]','2019-07-14 18:07:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (162,'CUP_U_B_US_BDU_winter','l_military','1','20','item','[]','2019-07-14 18:08:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (163,'U_BG_Guerilla1_1','l_military','1','20','item','[]','2019-07-14 18:08:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (164,'U_BG_Guerrilla_6_1','l_military','1','20','item','[]','2019-07-14 18:08:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (165,'CUP_I_B_PMC_Unit_17','l_military','1','12','item','[]','2019-07-14 18:08:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (166,'U_B_FullGhillie_Ethereal','h_military','1','7','item','[]','2019-07-14 18:11:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (167,'U_B_FullGhillie_grass','h_military','1','7','item','[]','2019-07-14 18:11:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (168,'U_B_FullGhillie_jungle','h_military','1','7','item','[]','2019-07-14 18:11:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (169,'U_B_FullGhillie_marpat','h_military','1','7','item','[]','2019-07-14 18:11:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (170,'U_B_FullGhillie_weeds','h_military','1','7','item','[]','2019-07-14 18:11:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (171,'U_B_FullGhillie_Wisp','h_military','1','7','item','[]','2019-07-14 18:12:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (172,'U_B_GhillieSuit_Night','h_military','1','7','item','[]','2019-07-14 18:12:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (173,'U_I_GhillieSuit_Base','h_military','1','7','item','[]','2019-07-14 18:12:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (174,'U_B_GhillieSuit_CTRG','h_military','1','7','item','[]','2019-07-14 18:12:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (175,'U_Tank_green_F','l_military','1','20','item','[]','2019-07-14 18:13:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (176,'CUP_U_O_CHDKZ_Bardak','general','1','30','item','[]','2019-07-14 18:14:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (177,'CUP_U_O_CHDKZ_Lopotev','general','1','30','item','[]','2019-07-14 18:15:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (178,'CUP_U_C_Citizen_02','general','1','30','item','[]','2019-07-14 18:15:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (179,'CUP_U_C_Citizen_04','general','1','30','item','[]','2019-07-14 18:15:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (180,'U_C_Poloshirt_blue','general','1','25','item','[]','2019-07-14 18:15:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (181,'U_C_Poloshirt_burgundy','general','1','25','item','[]','2019-07-14 18:15:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (182,'U_C_Poloshirt_salmon','general','1','25','item','[]','2019-07-14 18:16:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (183,'U_Competitor','general','1','20','item','[]','2019-07-14 18:16:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (184,'U_C_Driver_1_black','general','1','10','item','[]','2019-07-14 18:16:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (185,'CUP_U_C_Fireman_01','firestation','1','30','item','[]','2019-07-14 18:17:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (186,'U_C_HunterBody_grn','general','1','15','item','[]','2019-07-14 18:17:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (187,'CUP_U_C_Mechanic_02','general','1','10','item','[]','2019-07-14 18:18:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (188,'CUP_O_TKI_Khet_Partug_02','general','1','5','item','[]','2019-07-14 18:18:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (189,'CUP_U_C_Labcoat_01','general','1','5','item','[]','2019-07-14 18:18:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (190,'U_C_Journalist','general','1','10','item','[]','2019-07-14 18:18:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (191,'CUP_U_C_Rescuer_01','firestation','1','20','item','[]','2019-07-14 18:19:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (192,'U_Marshal','general','1','2','item','[]','2019-07-14 18:19:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (193,'CUP_U_C_Villager_01','general','1','15','item','[]','2019-07-14 18:19:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (194,'CUP_U_C_Villager_04','general','1','15','item','[]','2019-07-14 18:20:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (195,'CUP_U_C_Villager_02','general','1','15','item','[]','2019-07-14 18:20:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (196,'CUP_U_C_Villager_03','general','1','15','item','[]','2019-07-14 18:20:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (197,'CUP_U_C_Profiteer_02','general','1','20','item','[]','2019-07-14 18:20:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (198,'CUP_U_C_Woodlander_02','general','1','20','item','[]','2019-07-14 18:20:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (199,'CUP_U_C_Suit_01','general','1','3','item','[]','2019-07-14 18:20:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (200,'CUP_U_C_Suit_02','general','1','3','item','[]','2019-07-14 18:21:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (201,'CUP_U_O_SLA_Overalls_Tank','general','1','20','item','[]','2019-07-14 18:21:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (202,'CUP_U_C_Woodlander_04','general','1','20','item','[]','2019-07-14 18:21:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (203,'rhs_6b26_green','m_military','1','5','item','[]','2019-07-14 18:22:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (204,'rhs_6b28_flora_bala','m_military','1','5','item','[]','2019-07-14 18:23:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (205,'rhs_6b28_green','m_military','1','5','item','[]','2019-07-14 18:23:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (206,'CUP_H_USMC_ACVC_WDL','m_military','1','5','item','[]','2019-07-14 18:23:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (207,'H_Cap_brn_SPECOPS','general','1','15','item','[]','2019-07-14 18:23:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (208,'H_Bandanna_mcamo','general','1','15','item','[]','2019-07-14 18:24:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (209,'H_PASGT_basic_black_F','m_military','1','5','item','[]','2019-07-14 18:24:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (210,'CUP_H_NAPA_Fedora','h_military','1','2','item','[]','2019-07-14 18:24:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (211,'H_Watchcap_camo','general','1','10','item','[]','2019-07-14 18:24:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (212,'CUP_H_C_Beret_03','general','1','20','item','[]','2019-07-14 18:25:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (213,'H_Booniehat_mcamo','general','1','15','item','[]','2019-07-14 18:25:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (214,'rhs_altyn_novisor_bala','m_military','1','5','item','[]','2019-07-14 18:26:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (215,'CUP_H_C_Fireman_Helmet_01','firestation','1','20','item','[]','2019-07-14 18:26:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (216,'H_MilCap_mcamo','general','1','15','item','[]','2019-07-14 18:27:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (217,'H_Cap_headphones','l_military','1','15','item','[]','2019-07-14 18:27:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (218,'H_Shemag_olive','l_military','1','10','item','[]','2019-07-14 18:28:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (219,'CUP_H_TKI_Lungee_Open_04','general','1','10','item','[]','2019-07-14 18:28:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (220,'CUP_H_TKI_Lungee_02','general','1','10','item','[]','2019-07-14 18:28:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (221,'CUP_H_RUS_ZSH_Shield_Down','l_military','1','5','item','[]','2019-07-14 18:29:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (222,'rhs_6b23_engineer','h_military','1','8','item','[]','2019-07-14 18:32:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (223,'CUP_V_O_SLA_6B3_1_WDL','m_military','1','6','item','[]','2019-07-14 18:32:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (224,'V_PlateCarrierIA2_dgtl','m_military','1','6','item','[]','2019-07-14 18:32:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (225,'V_PlateCarrier1_rgr','h_military','1','10','item','[]','2019-07-14 18:33:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (226,'CUP_V_O_SLA_M23_1_OD','l_military','1','10','item','[]','2019-07-14 18:33:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (227,'CUP_V_I_Guerilla_Jacket','l_military','1','20','item','[]','2019-07-14 18:33:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (228,'V_BandollierB_rgr','general','1','14','item','[]','2019-07-14 18:34:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (229,'V_PlateCarrier2_blk','h_military','1','6','item','[]','2019-07-14 18:34:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (230,'CUP_V_OI_TKI_Jacket1_03','general','1','14','item','[]','2019-07-14 18:35:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (231,'CUP_V_OI_TKI_Jacket4_01','l_military','1','16','item','[]','2019-07-14 18:35:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (232,'CUP_V_O_SLA_Carrier_Belt','general','1','16','item','[]','2019-07-14 18:35:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (233,'CUP_V_B_RRV_Scout2','l_military','1','12','item','[]','2019-07-14 18:36:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (234,'V_I_G_resistanceLeader_F','l_military','1','17','item','[]','2019-07-14 18:36:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (235,'CUP_V_I_RACS_Carrier_Rig_wdl_3','l_military','1','20','item','[]','2019-07-14 18:36:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (236,'rhs_vest_commander','general','1','25','item','[]','2019-07-14 18:36:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (237,'CUP_V_B_Interceptor_Grenadier_M81','m_military','1','11','item','[]','2019-07-14 18:37:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (238,'CUP_V_CDF_6B3_1_Green','l_military','1','6','item','[]','2019-07-14 18:37:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (239,'CUP_V_B_BAF_DPM_Osprey_Mk3_Engineer','m_military','1','8','item','[]','2019-07-14 18:37:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (240,'CUP_V_B_PASGT','l_military','1','13','item','[]','2019-07-14 18:38:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (241,'CUP_V_CZ_vest10','l_military','1','13','item','[]','2019-07-14 18:38:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (242,'CUP_V_CZ_vest03','l_military','1','13','item','[]','2019-07-14 18:38:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (243,'CUP_V_RUS_6B3_Flora_3','m_military','1','9','item','[]','2019-07-14 18:38:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (244,'U_BG_Guerilla2_1','general','1','20','item','[]','2019-07-14 18:39:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (245,'CUP_U_I_GUE_Anorak_01','general','1','20','item','[]','2019-07-14 18:40:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (246,'CUP_I_B_PMC_Unit_5','general','1','20','item','[]','2019-07-14 18:40:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (247,'CUP_O_TKI_Khet_Jeans_02','general','1','20','item','[]','2019-07-14 18:40:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (248,'B_Carryall_khk','general','1','10','backpack','[]','2019-07-14 18:41:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (249,'B_Carryall_oli','general','1','10','backpack','[]','2019-07-14 18:46:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (250,'B_LegStrapBag_coyote_F','general','1','25','backpack','[]','2019-07-14 18:47:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (251,'B_LegStrapBag_black_F','general','1','25','backpack','[]','2019-07-14 18:47:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (252,'CUP_B_ACRPara_m95','l_military','1','20','backpack','[]','2019-07-14 18:48:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (253,'CUP_B_AlicePack_Khaki','l_military','1','20','backpack','[]','2019-07-14 18:48:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (254,'rhs_medic_bag','general','1','20','backpack','[]','2019-07-14 18:49:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (255,'B_AssaultPack_blk','general','1','18','backpack','[]','2019-07-14 18:49:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (256,'CUP_B_USMC_AssaultPack','l_military','1','30','backpack','[]','2019-07-14 18:50:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (257,'CUP_B_HikingPack_Civ','general','1','14','backpack','[]','2019-07-14 18:51:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (258,'CUP_B_Bergen_BAF','general','1','16','backpack','[]','2019-07-14 18:51:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (259,'rhs_d6_Parachute_backpack','h_military','1','6','backpack','[]','2019-07-14 18:52:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (260,'valor_ducttape','general','1','25','item','[]','2019-07-14 18:55:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (261,'valor_orange_01','general','1','50','item','[]','2019-07-14 18:55:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (262,'valor_ricebox','general','1','40','item','[]','2019-07-14 18:56:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (263,'valor_tacticalbacon','general','1','40','item','[]','2019-07-14 18:56:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (264,'valor_bottleplastic_v2','general','1','60','item','[]','2019-07-14 18:56:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (265,'valor_bakedbeans','general','1','45','item','[]','2019-07-14 18:56:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (266,'valor_can_v2','general','1','40','item','[]','2019-07-14 18:56:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (267,'valor_can_v2','general','1','40','item','[]','2019-07-14 18:57:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (268,'valor_can_rusty','general','1','40','item','[]','2019-07-14 18:57:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (269,'valor_can_v1','general','1','40','item','[]','2019-07-14 18:57:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (270,'valor_ducttape','industrial','1','20','item','[]','2019-07-14 18:59:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (271,'valor_rotor','industrial','1','10','item','[]','2019-07-14 18:59:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (272,'valor_canisterfuel','industrial','1','20','item','[]','2019-07-14 18:59:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (273,'valor_tankboresighter_01','industrial','1','20','item','[]','2019-07-14 19:00:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (274,'valor_torquewrench_01','industrial','1','20','item','[]','2019-07-14 19:00:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (275,'valor_van_02_rimless_tire','industrial','1','20','item','[]','2019-07-14 19:00:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (276,'valor_canisterfuel_empty','industrial','1','30','item','[]','2019-07-14 19:00:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (277,'valor_cerealsbox','general','1','50','item','[]','2019-07-14 19:01:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (278,'valor_defibrillator','medical','1','5','item','[]','2019-07-14 19:03:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (279,'valor_bandage','medical','1','25','item','[]','2019-07-14 19:03:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (280,'valor_bloodbag','medical','1','25','item','[]','2019-07-14 19:05:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (281,'valor_firstaidkit_01_closed','medical','1','5','item','[]','2019-07-14 19:06:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (282,'valor_painkillers','medical','1','20','item','[]','2019-07-14 19:06:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (283,'valor_vitaminbottle','medical','1','20','item','[]','2019-07-14 19:06:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (284,'NVGoggles_OPFOR','m_military','1','4','item','[]','2019-07-14 19:08:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (285,'ItemGPS','l_military','1','10','item','[]','2019-07-14 19:09:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (286,'ItemWatch','general','1','30','item','[]','2019-07-14 19:09:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (287,'ItemCompass','general','1','30','item','[]','2019-07-14 19:09:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (288,'G_Bandanna_beast','general','1','30','item','[]','2019-07-14 19:10:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (289,'G_Bandanna_oli','general','1','20','item','[]','2019-07-14 19:11:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (290,'CUP_PMC_Facewrap_Skull','general','1','20','item','[]','2019-07-14 19:11:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (291,'G_Bandanna_aviator','general','1','20','item','[]','2019-07-14 19:11:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (292,'CUP_FR_NeckScarf2','l_military','1','15','item','[]','2019-07-14 19:12:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (293,'CUP_PMC_Facewrap_Smilie','general','1','20','item','[]','2019-07-14 19:12:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (294,'G_Balaclava_lowprofile','general','1','20','item','[]','2019-07-14 19:12:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (295,'CUP_PMC_Facewrap_Tropical','general','1','20','item','[]','2019-07-14 19:12:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (296,'G_Aviator','general','1','20','item','[]','2019-07-14 19:12:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (297,'G_Spectacles_Tinted','general','1','20','item','[]','2019-07-14 19:13:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (298,'G_Sport_Blackyellow','general','1','20','item','[]','2019-07-14 19:13:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (299,'CUP_FR_NeckScarf4','general','1','20','item','[]','2019-07-14 19:13:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (300,'CUP_FR_NeckScarf5','general','1','20','item','[]','2019-07-14 19:13:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (301,'CUP_RUS_Balaclava_grn','general','1','20','item','[]','2019-07-14 19:13:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (303,'G_Spectacles_Tinted','general','1','20','item','[]','2019-07-14 19:14:21');





INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (16,'Land_Mil_Barracks_i','h_military','2019-07-14 19:26:44');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (17,'Land_Mil_ControlTower','m_military','2019-07-14 19:27:27');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (18,'Land_a_stationhouse','firestation','2019-07-14 19:27:45');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (19,'Land_Ss_hangar','m_military','2019-07-14 19:27:56');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (20,'Land_u_Barracks_V2_F','h_military','2019-07-14 19:30:53');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (21,'Land_Mil_House','h_military','2019-07-14 19:31:33');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (22,'Land_Airport_01_hangar_F','m_military','2019-07-14 19:33:07');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (23,'Land_Mil_ControlTower_EP1','h_military','2019-07-14 19:33:52');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (24,'Land_tent_west','l_military','2019-07-14 19:35:37');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (25,'Land_Stan_east','l_military','2019-07-14 19:35:59');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (26,'Land_Airport_02_hangar_right_F','m_military','2019-07-14 19:37:08');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (27,'Land_mash_ep1','medical','2019-07-14 19:39:09');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (28,'Land_Mil_ControlTower_dam','h_military','2019-07-14 19:40:38');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (29,'Land_Hlidac_budka','l_military','2019-07-14 19:41:12');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (30,'Land_chz_skladoleju_06_06','l_military','2019-07-14 19:41:38');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (31,'Land_Mil_Guardhouse','l_military','2019-07-14 19:43:11');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (32,'Land_Vez','l_military','2019-07-14 19:44:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (33,'Land_A_TVTower_Base','h_military','2019-07-14 19:45:01');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (34,'Land_A_Castle_Gate','l_military','2019-07-14 19:47:09');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (35,'Land_A_Castle_Bergfrit','l_military','2019-07-14 19:47:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (36,'Land_A_Castle_Donjon','l_military','2019-07-14 19:48:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (37,'Land_Misc_deerstand','l_military','2019-07-14 19:49:29');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (38,'Land_Barn_Metal','industrial','2019-07-14 19:50:39');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (39,'Land_Ind_Workshop01_L','industrial','2019-07-14 19:50:48');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (40,'Land_Ind_Workshop01_04','industrial','2019-07-14 19:51:43');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (41,'Land_Shed_Ind02','industrial','2019-07-14 19:51:52');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (42,'Land_Ind_Workshop01_01','industrial','2019-07-14 19:51:57');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (43,'Land_Ind_Garage01','industrial','2019-07-14 19:52:11');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (44,'Land_Repair_center','industrial','2019-07-14 19:52:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (45,'Land_Hangar_2','industrial','2019-07-14 19:52:41');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (46,'Land_Ind_Workshop01_02','industrial','2019-07-14 19:52:58');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (48,'Land_Tovarna2','industrial','2019-07-14 19:53:35');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (49,'Land_Ind_TankBig','industrial','2019-07-14 19:53:42');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (50,'Land_Ind_Pec_03a','industrial','2019-07-14 19:53:56');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (51,'Land_Shed_M01','industrial','2019-07-14 19:54:08');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (52,'Land_Ind_MalyKomin','industrial','2019-07-14 19:54:14');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (53,'Land_IndPipe2_big_ground1','industrial','2019-07-14 19:54:38');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (54,'Land_IndPipe2_big_18ladder','industrial','2019-07-14 19:54:50');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (55,'Land_IndPipe2_bigL_R','industrial','2019-07-14 19:55:14');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (56,'Land_IndPipe2_big_18','industrial','2019-07-14 19:55:16');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (57,'Land_IndPipe2_Small_ground1','industrial','2019-07-14 19:57:02');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (58,'Land_IndPipe2_SmallL_L','industrial','2019-07-14 19:57:25');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (59,'Land_Komin','industrial','2019-07-14 19:57:37');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (60,'Land_Ind_Expedice_1','industrial','2019-07-14 19:57:54');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (61,'Land_Ind_Expedice_3','industrial','2019-07-14 19:58:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (62,'Land_Ind_Workshop01_03','industrial','2019-07-14 19:58:29');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (63,'Land_dp_smallTank_F','industrial','2019-07-14 19:59:19');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (64,'Land_cmp_Tower_F','industrial','2019-07-14 19:59:26');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (65,'Land_Misc_CargoMarket1a_EP1','industrial','2019-07-14 19:59:40');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (69,'Land_Ind_Vysypka','industrial','2019-07-14 20:01:24');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (70,'Land_wagon_box','industrial','2019-07-14 20:02:14');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (71,'Land_i_Shed_Ind_F','industrial','2019-07-14 20:02:39');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (72,'Land_A_BuildingWIP','industrial','2019-07-14 20:03:02');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (73,'Land_Ind_Quarry','industrial','2019-07-14 20:03:16');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (74,'Land_Ind_TankBig','industrial','2019-07-14 20:03:30');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (75,'Land_A_Crane_02a','industrial','2019-07-14 20:03:37');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (76,'Land_Misc_Cargo1Bo','industrial','2019-07-14 20:04:05');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (77,'Land_cargo_house_slum_F','industrial','2019-07-14 20:04:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (78,'Land_water_tank','industrial','2019-07-14 20:05:39');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (79,'Land_A_CraneCon','industrial','2019-07-14 20:06:02');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (80,'Land_Watertower1','industrial','2019-07-14 20:06:37');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (81,'Land_SCF_01_storageBin_big_F','industrial','2019-07-14 20:07:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (82,'Land_SCF_01_storageBin_medium_F','industrial','2019-07-14 20:07:25');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (83,'Land_SCF_01_warehouse_F','industrial','2019-07-14 20:07:31');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (84,'Land_SCF_01_crystallizerTowers_F','industrial','2019-07-14 20:07:45');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (86,'Land_SCF_01_storageBin_big_F','industrial','2019-07-14 20:08:07');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (87,'Land_SCF_01_generalBuilding_F','industrial','2019-07-14 20:08:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (88,'Land_Misc_CargoMarket1a_EP1','industrial','2019-07-14 20:08:36');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (89,'Land_SCF_01_feeder_F','industrial','2019-07-14 20:08:51');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (90,'Land_SCF_01_washer_F','industrial','2019-07-14 20:08:55');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (91,'Land_SCF_01_clarifier_F','industrial','2019-07-14 20:09:14');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (92,'Land_SCF_01_condenser_F','industrial','2019-07-14 20:09:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (93,'Land_SCF_01_generalBuilding_F','industrial','2019-07-14 20:09:31');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (94,'Land_FuelStation_01_workshop_F','industrial','2019-07-14 20:09:54');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (96,'Land_dp_mainFactory_F','industrial','2019-07-14 20:10:19');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (97,'Land_Misc_PowerStation','industrial','2019-07-14 20:12:02');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (98,'Land_Ind_Mlyn_03','industrial','2019-07-14 20:12:50');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (99,'Land_A_Hospital','medical','2019-07-14 20:13:19');
