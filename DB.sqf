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
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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




-- Query: SELECT * FROM valor.persistent_vehicles
-- Date: 2019-06-25 14:51

INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (5,'[[13306.7,3233.46,0.0200424],233.154,[-0.0660851,-0.0445456,0.996819]]','\"CUP_B_SA330_Puma_HC1_BAF\"','helicopter',0,0,'[[13306.7,3233.46,0.0200272],233.173,[-0.0661703,-0.0444163,0.996819]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575]\"',0,0,0,-1,0,'2019-06-24 23:10:31','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (6,'[[12239.7,12593.1,-0.341278],321.69,[0.0407437,-0.0432611,0.998233]]','\"CUP_B_Mi171Sh_Unarmed_ACR\"','helicopter',0,0,'[[12239.7,12593.1,-0.341278],321.69,[0.0407437,-0.0432611,0.998233]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"',0,0,0,-1,0,'2019-06-24 23:11:28','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (7,'[[11452.8,7488.48,12.363],198.525,[0.0173622,0.0270102,0.999484]]','\"CUP_O_MI6T_RU\"','helicopter',0,0,'[[11452.8,7488.48,12.363],198.525,[0.0173622,0.0270102,0.999484]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"',0,0,0,-1,0,'2019-06-24 23:13:21','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (8,'[[4386.42,10704.5,0.0177612],60.8365,[0.00263919,0.000280679,0.999997]]','\"CUP_B_CH53E_GER\"','helicopter',0,0,'[[4386.42,10704.5,0.0177612],60.8365,[0.00263919,0.000280679,0.999997]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"',0,0,0,-1,0,'2019-06-24 23:14:12','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (9,'[[13059.6,10720.5,-0.17557],17.1328,[0.000181757,0.00501628,0.999987]]','\"CUP_C_Lada_White_CIV\"','land',0,0,'[[13059.6,10720.5,-0.0230503],17.1384,[-0.00348309,-0.00397173,0.999986]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,1,1,1,1,0.901575,0.850394,0.901575,0.901575]\"',0,0,0,-1,0,'2019-06-24 23:14:48','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (10,'[[9120.67,7432.43,-0.170959],359.945,[-0.0030902,0.000182592,0.999995]]','\"AlessioAventadorM\"','land',0,0,'[[9120.67,7432.43,0.0393982],359.948,[-0.00384463,-0.000613867,0.999992]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,1,1,1,1,0.901575,0.850394,0.901575,0,0.901575,0]\"',0,0,0,-1,0,'2019-06-24 23:16:52','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (11,'[[1943.88,12469.4,-0.0155029],338.705,[0.0239708,0.0167428,0.999572]]','\"CUP_C_Ural_Civ_02\"','land',0,0,'[[1943.88,12469.4,-0.0155029],338.705,[0.0239708,0.0167428,0.999572]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-06-24 23:19:05','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (12,'[[1977.73,9151.19,-0.0391541],48.0001,[0.0413494,0.0137227,0.999051]]','\"interceptor_1\"','land',0,0,'[[1977.73,9151.19,-0.0391541],48.0001,[0.0413494,0.0137227,0.999051]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"',0,0,0,-1,0,'2019-06-24 23:20:13','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (13,'[[6872.97,11460.1,-0.0449524],173.671,[-0.0495215,-0.00199618,0.998771]]','\"CUP_B_HMMWV_M2_NATO_T\"','land',0,0,'[[6872.97,11460.1,-0.0449524],173.671,[-0.0495215,-0.00199618,0.998771]]','\"[0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9]\"',0,0,0,-1,0,'2019-06-24 23:24:14','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (14,'[[1863.51,2216.5,-0.0256643],249.222,[0.0102952,-0.00683242,0.999924]]','\"CUP_B_S1203_Ambulance_CDF\"','land',0,0,'[[1863.51,2216.5,-0.0256643],249.222,[0.0102952,-0.00683242,0.999924]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-06-24 23:26:36','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (15,'[[3719.4,5966.15,0.0168762],275.838,[0.00214536,-1.96538e-005,0.999998]]','\"CUP_O_UAZ_Unarmed_RU\"','land',0,0,'[[3719.4,5966.15,0.0168762],275.838,[0.00214536,-1.96538e-005,0.999998]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0.9,0.9,0.9]\"',0,0,0,-1,0,'2019-06-24 23:27:52','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (16,'[[6533.82,6103.3,-0.0352478],245.59,[0.0108483,-0.00396631,0.999933]]','\"Fox_Tahoe_Apocalypse\"','land',0,0,'[[6533.82,6103.3,-0.0352478],245.59,[0.0108483,-0.00396631,0.999933]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"',0,0,0,-1,0,'2019-06-24 23:28:49','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (17,'[[6353.08,2436.63,-0.0105143],21.8999,[0.00102455,0.000574868,0.999999]]','\"CUP_C_Ikarus_Chernarus\"','land',0,0,'[[6353.08,2436.63,-0.0105143],21.8999,[0.00102455,0.000574868,0.999999]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-06-24 23:29:34','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (18,'[[6126.49,1988.81,-0.000101089],51.752,[0.0191178,-0.0067809,0.999794]]','\"CUP_C_TT650_CIV\"','land',0,0,'[[6126.5,1988.8,-9.34601e-005],50.4752,[0.0164289,-0.00245893,0.999862]]','\"[0.9,0.9,0.9,0.9,0.9,1,1,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,1,1,0.9]\"',0,0,0,-1,0,'2019-06-24 23:30:21','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (19,'[[11386.4,13884,-0.00216675],354.424,[0.00621234,-0.00564857,0.999965]]','\"CUP_C_Volha_Limo_TKCIV\"','land',0,0,'[[11386.4,13884,-0.00216675],354.424,[0.00621234,-0.00564857,0.999965]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,-1,0,'2019-06-24 23:32:17','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (22,'[[3839.14,8868.57,17.8443],206.393,[4.22914e-006,9.27177e-006,1]]','\"CUP_O_UH1H_SLA\"','helicopter',0,0,'[[3839.14,8868.57,17.8443],206.4,[0,0,1]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0,0,0,0,0.901575]\"',0,0,0,-1,1,'2019-06-24 23:49:51','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (23,'[[3856.74,8885.57,-0.382782],206.557,[0.0223602,-0.0117321,0.999681]]','\"CUP_O_GAZ_Vodnik_PK_RU\"','land',0,0,'[[3856.74,8885.57,0.022583],206.584,[0.0169981,-0.00857434,0.999819]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.85,0.9,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.85,0,0,0,0,0.9,0.9]\"',0,0,0,-1,1,'2019-06-24 23:54:05','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (24,'[[3861.23,8881.73,-0.319489],204.468,[-0.000351461,8.76526e-005,1]]','\"B_T_MRAP_01_F\"','land',0,0,'[[3861.23,8881.73,-0.00305176],204.468,[-0.000328668,8.25033e-005,1]]','\"[1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0,0,0,0,0.9,0.9]\"',0,0,0,-1,1,'2019-06-24 23:54:40','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (25,'[[3876.19,8877.9,0.00250244],293.784,[0.00677406,-0.000124204,0.999977]]','\"rhs_zil131_msv\"','land',0,0,'[[3876.19,8877.9,0.000915527],293.786,[0.0067988,-1.06012e-005,0.999977]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',1,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,0,-1,1,'2019-06-24 23:55:02','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (26,'[[3873.92,8873.69,-0.272095],295.373,[-0.000913548,-0.00319407,0.999994]]','\"rhs_tigr_msv\"','land',0,0,'[[3873.93,8873.69,0.028656],295.361,[0.000349973,-0.000686647,1]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0,0,0.9,0,0,0.9,0,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0,0,0,0,0.9,0,0,0,0,0.9,0,0,0.9,0.9]\"',0,0,0,-1,1,'2019-06-24 23:55:10','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (27,'[[3660.83,8937.19,-0.0877075],309.118,[-0.0512389,0.0472958,0.997566]]','\"CUP_O_Volha_SLA\"','land',0,0,'[[3872.78,8869.95,-0.0123291],295.99,[0.00433488,0.00053489,0.99999]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.97647,'\"[1,0.145669,1,0.110236,0,0,0,0.649606,0.192913,0.106299,0.0354331,0,0,0,0,0,0,0,0,0,1,1]\"',0,0,-2,-1,1,'2019-06-24 23:55:52','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (28,'[[3871.49,8867,0.00216675],295.434,[0.0061015,0.00252564,0.999978]]','\"CUP_O_Volha_SLA\"','land',0,0,'[[3871.33,8867.21,-0.0121155],295.99,[0.00472265,0.000494615,0.999989]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.986707,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,-1,1,'2019-06-24 23:56:00','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (29,'[[3870.16,8864.46,0.00186157],295.992,[0.0056504,0.00268317,0.99998]]','\"CUP_O_Volha_SLA\"','land',0,0,'[[3870.16,8864.46,-0.0121765],295.99,[0.00472265,0.000494615,0.999989]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',1,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,0,-1,1,'2019-06-24 23:56:12','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (30,'[[3868.78,8861.99,0.00222778],295.992,[0.0061939,0.00242892,0.999978]]','\"CUP_O_Volha_SLA\"','land',0,0,'[[3868.78,8861.99,-0.0118103],295.99,[0.00525529,0.000472969,0.999986]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',1,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,0,-1,1,'2019-06-24 23:56:20','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (31,'[[10445,2554.71,-0.476284],21.4374,[-0.0021719,0.0105831,0.999942]]','\"Fox_Fireengine\"','land',0,0,'[[10445,2554.7,-0.112472],21.426,[-0.000398847,0.00520512,0.999986]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,-1,0,'2019-06-25 00:00:24','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (32,'[[4602.19,9753.21,-0.267731],172.778,[0.00183869,0.00556368,0.999983]]','\"rhs_tigr_3camo_msv\"','land',0,0,'[[4602.19,9753.21,0.0336914],172.777,[0.00163039,0.00543611,0.999984]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0,0,0.9,0,0,0.9,0,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0,0,0,0,0.9,0,0,0,0,0.9,0,0,0.9,0.9]\"',0,0,0,-1,0,'2019-06-25 00:01:35','2019-06-25 13:36:50');
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`group_id`,`cop`,`insert_time`,`last_seen`) VALUES (33,'[[3853.32,8888.33,-0.00427246],206.634,[0.00691489,0.00837288,0.999941]]','\"CUP_C_Lada_GreenTK_CIV\"','land',0,0,'[[3853.32,8888.34,-0.0218811],206.637,[0.00775195,0.00894888,0.99993]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',1,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,0,-1,1,'2019-06-25 00:06:17','2019-06-25 13:36:50');





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















-- TESTS DO NOT USE EVERYTHING BELOW THIS


INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (12,'srifle_EBR_F','general','0.0001','0.0010','weapon','[[\"20Rnd_762x51_Mag\",4,\"magazin\"]]','2019-06-28 22:43:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (13,'arifle_TRG20_F','general','1.0001','3','weapon','[[\"30Rnd_556x45_Stanag\",4,\"magazin\"]]','2019-06-28 22:43:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (14,'U_BG_Guerilla2_3','general','1','5','item','[]','2019-06-28 22:43:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (15,'U_C_Poor_1','general','1','10','item','[]','2019-06-28 22:44:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (16,'CUP_U_C_Fireman_01','general','1','3','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (17,'CUP_U_C_Citizen_01','general','1','7','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (18,'CUP_U_O_CHDKZ_Bardak','general','1','7','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (19,'U_C_HunterBody_grn','general','1','10','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (20,'CUP_U_C_Pilot_01','general','1','7','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (21,'CUP_U_C_Profiteer_01','general','1','6','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (22,'CUP_U_C_Rocker_03','general','1','5','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (23,'CUP_U_C_Suit_01','general','1','6','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (24,'CUP_U_C_Villager_02','general','1','6','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (25,'CUP_U_C_Worker_02','general','1','6','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (26,'CUP_V_OI_TKI_Jacket1_04','general','1','6','item','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (27,'B_AssaultPack_blk','general','1','10','backpack','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (28,'CUP_B_Bergen_BAF','general','1','7','backpack','[]','2019-06-28 22:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (29,'B_Carryall_khk','general','1','2','backpack','[]','2019-06-28 22:47:35');


INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (12,'Land_HouseV_2L','general','2019-06-28 22:41:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (13,'Land_HouseV_1I4','general','2019-06-28 22:41:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (14,'Land_HouseV2_04_interier_dam','general','2019-06-28 22:41:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (15,'Land_HouseV_2I','general','2019-06-28 22:41:20');
