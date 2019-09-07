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
  `xp` int(100) NOT NULL DEFAULT '0',
  `level` int(100) NOT NULL DEFAULT '0',
  `humanity` int(100) NOT NULL DEFAULT '2500',
  `stats_killed` varchar(150) NOT NULL DEFAULT '[0,0,0,0,0]',
  `classes` varchar(100) NOT NULL DEFAULT '[[false,-1],[false,-1],[false,-1]]',
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
  `type` varchar(100) NOT NULL DEFAULT 'item',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `items_sold`;
CREATE TABLE IF NOT EXISTS `items_sold` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `classname` varchar(256) NOT NULL,
  `price` int(6) NOT NULL DEFAULT '100',
  `type` varchar(100) NOT NULL DEFAULT 'item',
  `seller` varchar(128) NOT NULL,
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
  `owners` text NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
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
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (2,'rhs_uniform_emr_patchless',1000,98,1,'uniform','[\"cop_shop_1\"]','2019-06-24 19:23:13','2019-07-21 12:15:15');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (3,'rhs_uniform_vdv_emr',1000,98,1,'uniform','[\"cop_shop_1\"]','2019-06-24 19:23:13','2019-07-21 12:15:15');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (4,'U_BG_Guerilla2_1',1000,101,0,'uniform','[\"survivor_city\"]','2019-06-24 16:29:40','2019-08-30 16:07:54');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (5,'rhs_uniform_msv_emr',1000,98,1,'uniform','[\"cop_shop_1\"]','2019-06-24 19:23:13','2019-07-21 12:15:15');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (7,'rhs_uniform_m88_patchless',1000,97,0,'uniform','[\"cop_shop_1\"]','2019-06-24 19:23:13','2019-07-21 12:28:33');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (8,'rhs_6b23',1000,99,0,'vest','[\"cop_shop_1\"]','2019-06-24 19:23:33','2019-07-21 12:15:19');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (9,'rhs_6b23_digi',1000,99,0,'vest','[\"cop_shop_1\"]','2019-06-24 19:23:44','2019-07-21 12:15:22');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (10,'CUP_V_RUS_6B45_1',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 19:23:51','2019-06-24 19:23:51');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (11,'CUP_V_RUS_6B45_2',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 19:23:58','2019-06-24 19:23:58');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (12,'CUP_V_RUS_6B45_3',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 19:24:05','2019-06-24 19:24:05');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (13,'CUP_V_CZ_vest15',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 19:24:14','2019-06-24 19:24:14');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (14,'CUP_V_C_Police_Holster',1000,99,0,'vest','[\"cop_shop_1\"]','2019-06-24 19:24:23','2019-07-14 16:26:09');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (15,'CUP_V_B_PASGT_no_bags_OD',1000,100,0,'vest','[\"cop_shop_1\"]','2019-06-24 19:24:30','2019-06-24 19:24:30');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (16,'rhs_6b27m_digi',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 19:24:53','2019-06-24 19:24:53');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (18,'CUP_H_RUS_6B47',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 19:25:07','2019-06-24 19:25:07');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (19,'CUP_H_SLA_SLCap',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 19:25:15','2019-06-24 19:25:15');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (20,'CUP_H_SLA_OfficerCap',1000,99,0,'headgear','[\"cop_shop_1\"]','2019-06-24 19:25:23','2019-07-14 16:26:09');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (21,'rhs_Booniehat_digi',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 19:25:32','2019-06-24 19:25:32');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (22,'CUP_H_CDF_OfficerCap_FST',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 19:25:40','2019-06-24 19:25:40');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (23,'rhs_fieldcap_digi',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 19:25:52','2019-06-24 19:25:52');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (24,'CUP_H_C_Ushanka_02',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 19:26:00','2019-06-24 19:26:00');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (25,'CUP_B_ACRPara_m95',1000,100,0,'backpack','[\"cop_shop_1\"]','2019-06-24 19:26:24','2019-06-24 19:26:24');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (26,'CUP_B_HikingPack_civ',1000,100,0,'backpack','[\"cop_shop_1\"]','2019-06-24 19:26:34','2019-06-24 19:26:34');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (27,'CUP_B_Kombat_Olive',1000,100,0,'backpack','[\"cop_shop_1\"]','2019-06-24 19:26:41','2019-06-24 19:26:41');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (28,'rhs_assault_umbts_engineer_empty',1000,100,0,'backpack','[\"cop_shop_1\"]','2019-06-24 19:26:48','2019-06-24 19:26:48');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (29,'rhs_6b28',1000,100,0,'headgear','[\"cop_shop_1\"]','2019-06-24 19:43:52','2019-06-24 19:43:52');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (31,'CUP_U_O_CHDKZ_Lopotev',1000,100,1,'uniform','[\"bandit_shop_LVL_1\",\"bandit_shop_LVL_2\",\"bandit_shop_LVL_3\"]','2019-08-30 15:24:39','2019-08-30 15:28:27');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (32,'CUP_U_I_GUE_Anorak_02',1000,100,1,'uniform','[\"bandit_shop_LVL_2\",\"bandit_shop_LVL_3\"]','2019-08-30 15:24:39','2019-08-30 15:28:27');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (33,'CUP_I_B_PMC_Unit_24',1000,100,1,'uniform','[\"bandit_shop_LVL_3\"]','2019-08-30 15:24:39','2019-08-30 15:28:27');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (34,'U_B_GhillieFull_Night',1000,100,1,'uniform','[\"bandit_shop_LVL_3\"]','2019-08-30 15:24:39','2019-08-30 15:28:27');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (35,'U_B_GhillieSuit_Night',1000,100,1,'uniform','[\"bandit_shop_LVL_3\"]','2019-08-30 15:24:39','2019-08-30 15:28:27');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (36,'CUP_V_PMC_IOTV_Black_Empty',1000,100,1,'vest','[\"bandit_shop_LVL_3\"]','2019-08-30 15:24:39','2019-08-30 15:28:27');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (37,'G_Bandanna_beast',1000,100,1,'goggles','[\"bandit_shop_LVL_3\"]','2019-08-30 15:24:39','2019-08-30 15:28:27');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (38,'CUP_H_PMC_Cap_Back_PRR_Grey',1000,100,1,'headgear','[\"bandit_shop_LVL_3\"]','2019-08-30 15:24:39','2019-08-30 15:28:27');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (39,'CUP_B_USPack_Black',1000,100,1,'backpack','[\"bandit_shop_LVL_3\"]','2019-08-30 15:24:39','2019-08-30 15:28:27');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (40,'CUP_H_RUS_Beret_Spetsnaz',1000,100,1,'headgear','[\"cop_shop_1\"]','2019-08-30 15:27:22','2019-08-31 16:45:18');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (50,'CUP_U_C_Worker_03',1000,100,1,'uniform','[\"hero_shop_LVL_1\",\"hero_shop_LVL_2\",\"hero_shop_LVL_3\"]','2019-08-30 15:32:16','2019-08-30 15:32:16');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (51,'U_B_GEN_Commander_F',1000,100,1,'uniform','[\"hero_shop_LVL_2\",\"hero_shop_LVL_3\"]','2019-08-30 15:32:16','2019-08-30 15:32:16');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (52,'U_I_GhillieFull',1000,100,1,'uniform','[\"hero_shop_LVL_3\"]','2019-08-30 15:32:16','2019-08-30 15:32:16');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (53,'U_B_GhillieSuit_wdl',1000,100,1,'uniform','[\"hero_shop_LVL_3\"]','2019-08-30 15:32:16','2019-08-30 15:32:16');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (54,'CUP_V_PMC_CIRAS_Black_Empty',1000,100,1,'vest','[\"hero_shop_LVL_3\"]','2019-08-30 15:32:16','2019-08-30 15:32:16');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (55,'CUP_TK_NeckScarf',1000,100,1,'goggles','[\"hero_shop_LVL_3\"]','2019-08-30 15:32:16','2019-08-30 15:32:16');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (56,'H_Beret_Colonel',1000,100,1,'headgear','[\"hero_shop_LVL_3\"]','2019-08-30 15:32:16','2019-08-30 15:32:16');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (57,'CUP_I_B_PMC_Unit_5',1000,100,1,'uniform','[\"hero_shop_LVL_3\"]','2019-08-30 15:32:16','2019-08-30 15:32:16');
INSERT INTO `item_shop` (`id`,`classname`,`price`,`stock`,`infinite`,`type`,`seller`,`insert_time`,`last_seen`) VALUES (58,'CUP_B_USPack_Coyote',1000,100,1,'backpack','[\"hero_shop_LVL_3\"]','2019-08-30 15:32:16','2019-08-30 15:32:16');



/*
-- Query: SELECT * FROM valor.persistent_vehicles
-- Date: 2019-07-04 22:57
*/

INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (5,'[[13306.5,3233.35,0.0225067],232.984,[-0.0666972,-0.0450157,0.996757]]','\"CUP_B_SA330_Puma_HC1_BAF\"','helicopter',0,1,'[[13306.7,3233.46,0.0200272],233.173,[-0.0661703,-0.0444163,0.996819]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:10:31','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (6,'[[12240.2,12592.6,-0.340912],321.889,[0.0401004,-0.0431733,0.998262]]','\"CUP_B_Mi171Sh_Unarmed_ACR\"','helicopter',1,0,'[[12239.7,12593.1,-0.341278],321.69,[0.0407437,-0.0432611,0.998233]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0,0,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:11:28','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (7,'[[11452.8,7488.72,12.3646],198.492,[0.0169093,0.0267811,0.999498]]','\"CUP_O_MI6T_RU\"','helicopter',1,0,'[[11452.8,7488.48,12.363],198.525,[0.0173622,0.0270102,0.999484]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0,0,0.9,0.9]\"',0,1,0,0,'2019-06-25 01:13:21','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (8,'[[4386.44,10704.5,0.0177612],60.8355,[0.00210626,0.00117522,0.999997]]','\"CUP_B_CH53E_GER\"','helicopter',1,0,'[[4386.42,10704.5,0.0177612],60.8365,[0.00263919,0.000280679,0.999997]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:14:12','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (9,'[[13059.6,10720.5,-0.17621],16.9261,[0.000425175,0.00832302,0.999965]]','\"CUP_C_Lada_White_CIV\"','land',1,0,'[[13059.6,10720.5,-0.0230503],17.1384,[-0.00348309,-0.00397173,0.999986]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:14:48','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (10,'[[9453.5,2035.04,-0.0713754],342.975,[0.00484835,0.0361829,0.999334]]','\"AlessioAventadorM\"','land',1,0,'[[9120.67,7432.43,0.0393982],359.948,[-0.00384463,-0.000613867,0.999992]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.686711,'\"[1,0.393701,1,0.350394,0,0.0826772,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0]\"',0,0,0,0,'2019-06-25 01:16:52','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (11,'[[1944.24,12469.4,-0.394897],338.677,[0.0297126,0.0181116,0.999394]]','\"CUP_C_Ural_Civ_02\"','land',1,0,'[[1943.88,12469.4,-0.0155029],338.705,[0.0239708,0.0167428,0.999572]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:19:05','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (12,'[[1978.09,9151.05,-0.257416],53.1091,[0.0448292,0.0100922,0.998944]]','\"interceptor_1\"','land',0,1,'[[1977.73,9151.19,-0.0391541],48.0001,[0.0413494,0.0137227,0.999051]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,0,'2019-06-25 01:20:13','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (13,'[[6872.21,11460.1,-0.230469],173.713,[-0.0458971,-0.00398854,0.998938]]','\"CUP_B_HMMWV_M2_NATO_T\"','land',1,0,'[[6872.97,11460.1,-0.0449524],173.671,[-0.0495215,-0.00199618,0.998771]]','\"[0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:24:14','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (14,'[[1863.66,2216.53,-0.177243],249.18,[0.0170169,0.00382832,0.999848]]','\"CUP_B_S1203_Ambulance_CDF\"','land',1,0,'[[1863.51,2216.5,-0.0256643],249.222,[0.0102952,-0.00683242,0.999924]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:26:36','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (15,'[[3719.4,5966.15,-0.231018],275.838,[0.00213204,-0.00124324,0.999997]]','\"CUP_O_UAZ_Unarmed_RU\"','land',1,0,'[[3719.4,5966.15,0.0168762],275.838,[0.00214536,-1.96538e-005,0.999998]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0.9,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:27:52','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (16,'[[6535.64,6097.91,-0.294037],255.251,[0.00688644,-0.00501294,0.999964]]','\"Fox_Tahoe_Apocalypse\"','land',1,0,'[[6533.82,6103.3,-0.0352478],245.59,[0.0108483,-0.00396631,0.999933]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,0,'2019-06-25 01:28:49','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (17,'[[6353.09,2436.63,-0.287889],21.9015,[0.000140482,-0.000279117,1]]','\"CUP_C_Ikarus_Chernarus\"','land',0,1,'[[6353.08,2436.63,-0.0105143],21.8999,[0.00102455,0.000574868,0.999999]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:29:34','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (18,'[[6132.98,1989.93,-0.0052042],158.6,[-0.0130356,-0.0639423,0.997869]]','\"CUP_C_TT650_CIV\"','land',1,0,'[[6126.5,1988.8,-9.34601e-005],50.4752,[0.0164289,-0.00245893,0.999862]]','\"[0.9,0.9,0.9,0.9,0.9,1,1,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.998139,'\"[0.0984252,0.0984252,0.0984252,0.145669,0.0984252,0.0984252,0.0984252,0.0984252]\"',0,0,0,0,'2019-06-25 01:30:21','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (19,'[[11386.4,13884,-0.166603],354.452,[0.000353487,0.00272374,0.999996]]','\"CUP_C_Volha_Limo_TKCIV\"','land',1,0,'[[11386.4,13884,-0.00216675],354.424,[0.00621234,-0.00564857,0.999965]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,0,'2019-06-25 01:32:17','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (22,'[[3839.06,8868.6,17.8445],206.08,[-1.1966e-006,-6.17987e-006,1]]','\"CUP_O_UH1H_SLA\"','helicopter',1,0,'[[3839.14,8868.57,17.8443],206.4,[0,0,1]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0.9,0.9,0.9,0,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9]\"',0,2,-2,1,'2019-06-25 01:49:51','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (23,'[[3857.04,8885.4,-0.382599],206.578,[0.0223061,-0.0118575,0.999681]]','\"CUP_O_GAZ_Vodnik_PK_RU\"','land',1,0,'[[3856.74,8885.57,0.022583],206.584,[0.0169981,-0.00857434,0.999819]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.85,0.9,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.85,0,0,0,0,0.9,0.9]\"',0,0,-2,1,'2019-06-25 01:54:05','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (24,'[[3861.23,8881.73,-0.319489],204.468,[-0.000391243,0.000106606,1]]','\"B_T_MRAP_01_F\"','land',1,0,'[[3861.23,8881.73,-0.00305176],204.468,[-0.000328668,8.25033e-005,1]]','\"[1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0,0,0,0,0.9,0.9]\"',0,0,-2,1,'2019-06-25 01:54:40','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (25,'[[3876.27,8877.9,0.00259399],293.79,[0.00690065,3.00747e-006,0.999976]]','\"rhs_zil131_msv\"','land',1,0,'[[3876.19,8877.9,0.000915527],293.786,[0.0067988,-1.06012e-005,0.999977]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,1,'2019-06-25 01:55:02','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (26,'[[3873.93,8873.64,-0.272095],295.356,[-0.000917797,-0.00319051,0.999995]]','\"rhs_tigr_msv\"','land',1,0,'[[3873.93,8873.69,0.028656],295.361,[0.000349973,-0.000686647,1]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0,0,0.9,0,0,0.9,0,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0,0,0,0,0.9,0,0,0,0,0.9,0,0,0.9,0.9]\"',0,0,-2,1,'2019-06-25 01:55:10','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (27,'[[3872.84,8869.96,0.00186157],295.947,[0.0057461,0.00262566,0.99998]]','\"CUP_O_Volha_SLA\"','land',1,0,'[[3872.78,8869.95,-0.0123291],295.99,[0.00433488,0.00053489,0.99999]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.399764,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,1,'2019-06-25 01:55:52','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (28,'[[3871.39,8867.22,0.00195313],295.998,[0.00577327,0.00261657,0.99998]]','\"CUP_O_Volha_SLA\"','land',1,0,'[[3871.33,8867.21,-0.0121155],295.99,[0.00472265,0.000494615,0.999989]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,1,'2019-06-25 01:56:00','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (29,'[[3870.22,8864.47,0.00186157],295.987,[0.00566779,0.00265832,0.99998]]','\"CUP_O_Volha_SLA\"','land',1,0,'[[3870.16,8864.46,-0.0121765],295.99,[0.00472265,0.000494615,0.999989]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,1,'2019-06-25 01:56:12','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (30,'[[3869.26,8860.85,0.00143433],299.946,[0.006044,0.00118257,0.999981]]','\"CUP_O_Volha_SLA\"','land',1,0,'[[3868.78,8861.99,-0.0118103],295.99,[0.00525529,0.000472969,0.999986]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.890547,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,1,'2019-06-25 01:56:20','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (31,'[[10445,2554.82,-0.476151],21.4914,[-0.00218991,0.0104467,0.999943]]','\"Fox_Fireengine\"','land',1,0,'[[10445,2554.7,-0.112472],21.426,[-0.000398847,0.00520512,0.999986]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,1,1,1,1,0.901575,0.850394,0,0,0,0]\"',0,0,0,0,'2019-06-25 02:00:24','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (32,'[[4602.19,9753.22,-0.267914],172.776,[0.00187186,0.00309093,0.999994]]','\"rhs_tigr_3camo_msv\"','land',0,1,'[[4602.19,9753.21,0.0336914],172.777,[0.00163039,0.00543611,0.999984]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0.9,0.9,0,0,0.9,0,0,0.9,0,0.9,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,0.85,0.9,0.9,0.9,1,1,1,1,0,0,0,0,0.9,0,0,0,0,0.9,0,0,0.9,0.9]\"',0,0,0,0,'2019-06-25 02:01:35','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (33,'[[3853.38,8888.4,-0.00421143],206.62,[0.00698143,0.00851988,0.999939]]','\"CUP_C_Lada_GreenTK_CIV\"','land',1,0,'[[3853.32,8888.34,-0.0218811],206.637,[0.00775195,0.00894888,0.99993]]','\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,1,'2019-06-25 02:06:17','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (34,'[[11928.6,8963.86,-0.111565],89.9242,[0.106784,0.149764,0.982938]]','\"CUP_C_Golf4_camodark_Civ\"','land',1,0,'[[11928,8962.66,0.0304871],84.8176,[0.118489,0.13913,0.98316]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.85,0,0,0,0]\"',0,1,0,0,'2019-07-04 22:21:59','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (35,'[[8883.54,11653.9,-0.188065],282.72,[-0.00286406,-0.00189003,0.999994]]','\"CUP_C_Volha_Gray_TKCIV\"','land',1,0,'[[8883.6,11653.9,-0.012085],282.668,[0.00477525,9.27558e-005,0.999989]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,0,'2019-07-04 22:22:11','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (36,'[[8948.71,7782.38,-0.294403],263.281,[0.00333315,-0.00137952,0.999993]]','\"Fox_Viper\"','land',1,0,'[[8948.71,7782.38,-0.125702],263.299,[0.00313724,-2.58098e-005,0.999995]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,0,'2019-07-04 22:23:03','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (37,'[[9479.97,8933,-0.253815],211.761,[0.013778,-0.0116399,0.999837]]','\"Fox_Charger_Apocalypse\"','land',1,0,'[[9479.84,8933.12,-0.0359192],211.252,[0.0221287,-0.011145,0.999693]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,0,'2019-07-04 22:24:03','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (38,'[[8396.5,6661.55,-0.102081],21.524,[-0.0102777,0.000758954,0.999947]]','\"CUP_C_LR_Transport_CTK\"','land',1,0,'[[8396.62,6661.55,0.0104675],21.5011,[-0.00842854,-0.00094362,0.999964]]','\"[0.9,0.9,0.9,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.901575,0.901575,0.901575,1,1,1,1,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,0.901575,1,1,1,1,0.901575,0.850394,0,0,0,0]\"',0,0,0,0,'2019-07-04 22:25:33','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (39,'[[8651.3,13307.9,-0.239838],59.5668,[0.00139306,0.00764056,0.99997]]','\"Fox_DaytonaStratos\"','land',1,0,'[[8651.27,13307.9,-0.0367508],59.7262,[-0.011533,0.000749588,0.999933]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,1,0.9,0.973206,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,0,'2019-07-04 22:26:47','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (40,'[[4581.49,4517.84,-0.0541534],321.787,[-0.00201529,-0.00751337,0.99997]]','\"Fox_DaytonaGeneral\"','land',1,0,'[[4581.49,4517.9,0.119522],321.816,[8.85077e-005,-0.0124317,0.999923]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0]\"',0,0,0,0,'2019-07-04 22:27:49','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (41,'[[3865.72,8879.72,0.0413513],203.022,[-0.0142126,-0.0242673,0.999604]]','\"warrig_black\"','land',1,0,'[[13078.2,7043.65,0.0227323],78.6374,[0.0275672,5.72083e-005,0.99962]]','\"[1,1,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,0.9,0.85,0.9,0.9,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.997486,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,0,-2,0,'2019-07-04 22:29:04','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (42,'[[11500,5497.95,-0.204803],307.679,[0.0837776,0.0354513,0.995854]]','\"CUP_O_Kamaz_Open_RU\"','land',1,0,'[[11498.8,5497.39,0.00552368],305.049,[0.104642,0.0457234,0.993458]]','\"[0.9,0.9,0.9,1,1,1,1,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.85,0.9,0.9,0,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,1,1,1,1,1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.85,0,0,0,0]\"',0,0,0,0,'2019-07-04 22:31:04','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (43,'[[7435.04,5149.34,-0.286896],130.701,[0.0414866,-0.0421193,0.998251]]','\"CUP_C_V3S_Open_TKC\"','land',1,0,'[[7434.57,5149.82,-0.0338593],130.718,[0.0379751,-0.0405518,0.998456]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9]\"',0,0,0,0,'2019-07-04 22:32:01','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (44,'[[3281.1,4939.63,-0.171478],87.3709,[-0.00860849,0.123882,0.99226]]','\"RHS_Ural_Open_Civ_01\"','land',1,0,'[[3281.33,4938.78,-0.00553894],87.244,[-0.00244423,-1.36134e-007,0.999997]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0,0.9,0,0,0,0.9,0,0,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0,0,0,0,0,0,0.9,0,0,0.9]\"',0,0,0,0,'2019-07-04 22:32:59','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (45,'[[8110.71,9314.26,-0.22998],73.12,[0.00902923,0.0525127,0.998579]]','\"CUP_I_SUV_Armored_ION\"','land',1,0,'[[8110.71,9313.95,0.023468],72.7854,[0.00051071,0.0529341,0.998598]]','\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[1,1,1,1,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,1,1,1,1,0.9,0.85,0.9,0.9,0.9,0.9,0.9,0.9]\"',0,0,0,0,'2019-07-04 22:33:53','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (46,'[[9074.95,4346.31,0.000457764],280.016,[0.0792974,-0.014139,0.996751]]','\"CUP_B_UH1Y_UNA_USMC\"','helicopter',1,0,'[[9073.99,4346.42,0.00305176],279.946,[0.085231,-0.0118578,0.996291]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9]\"',0,0,0,0,'2019-07-04 22:35:10','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (47,'[[3801.52,8843.17,-0.00790405],295.337,[-0.000265366,1.00498e-005,1]]','\"CUP_B_UH60M_Unarmed_US\"','helicopter',1,0,'[[4651.2,2515.56,-0.0140724],30.9373,[-0.000432274,0.00182459,0.999998]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0.9,0]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0.981989,'\"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]\"',0,1,1,0,'2019-07-04 22:36:56','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (48,'[[11229.2,4244.26,6.85352],1.05318,[0.00217966,-0.0452147,0.998975]]','\"CUP_O_Mi8_CHDKZ\"','helicopter',1,0,'[[11229.2,4245.31,6.85321],1.05107,[-0.00585492,-0.0599606,0.998184]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0.9,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9]\"',0,0,0,0,'2019-07-04 22:38:51','2019-09-06 20:05:01',0);
INSERT INTO `persistent_vehicles` (`id`,`pos`,`classname`,`type`,`alive`,`shop`,`spawnpos`,`Spawndamage`,`inventory`,`fuel`,`damage`,`sold`,`bought`,`mode`,`cop`,`insert_time`,`last_seen`,`locked`) VALUES (49,'[[12161.8,9735.67,0.151003],195.436,[0.00678657,0.0245726,0.999675]]','\"CUP_B_CH47F_GB\"','helicopter',1,0,'[[12161.8,9735.14,0.151002],195.551,[0.00705331,0.0245193,0.999674]]','\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0.9]\"','\"[[[],[]],[[],[]],[[],[]],[[],[]]]\"',0,'\"[0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0.9,0.9,0.9,0,0,0,0,0,0,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0,0,0,0,0,0,0,0,0.9]\"',0,0,0,0,'2019-07-04 22:39:33','2019-09-06 20:05:01',0);



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





/*
-- Query: SELECT * FROM valor.loottable_classnames
-- Date: 2019-07-17 22:28
*/
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
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (64,'CUP_srifle_M107_Base','h_military','1','1.1','weapon','[[\"CUP_10Rnd_127x99_M107\",3,\"magazin\"],[\"optic_LRPS\",1,\"item\"]]','2019-07-14 17:00:27');
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
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (185,'CUP_U_C_Fireman_01','firestation','1','30','item','[]','2019-07-14 18:17:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (191,'CUP_U_C_Rescuer_01','firestation','1','20','item','[]','2019-07-14 18:19:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (203,'rhs_6b26_green','m_military','1','5','item','[]','2019-07-14 18:22:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (204,'rhs_6b28_flora_bala','m_military','1','5','item','[]','2019-07-14 18:23:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (205,'rhs_6b28_green','m_military','1','5','item','[]','2019-07-14 18:23:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (206,'CUP_H_USMC_ACVC_WDL','m_military','1','5','item','[]','2019-07-14 18:23:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (209,'H_PASGT_basic_black_F','m_military','1','5','item','[]','2019-07-14 18:24:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (210,'CUP_H_NAPA_Fedora','h_military','1','2','item','[]','2019-07-14 18:24:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (214,'rhs_altyn_novisor_bala','m_military','1','5','item','[]','2019-07-14 18:26:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (215,'CUP_H_C_Fireman_Helmet_01','firestation','1','20','item','[]','2019-07-14 18:26:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (217,'H_Cap_headphones','l_military','1','15','item','[]','2019-07-14 18:27:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (218,'H_Shemag_olive','l_military','1','10','item','[]','2019-07-14 18:28:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (221,'CUP_H_RUS_ZSH_Shield_Down','l_military','1','5','item','[]','2019-07-14 18:29:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (222,'rhs_6b23_engineer','h_military','1','8','item','[]','2019-07-14 18:32:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (223,'CUP_V_O_SLA_6B3_1_WDL','m_military','1','6','item','[]','2019-07-14 18:32:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (224,'V_PlateCarrierIA2_dgtl','m_military','1','6','item','[]','2019-07-14 18:32:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (225,'V_PlateCarrier1_rgr','h_military','1','10','item','[]','2019-07-14 18:33:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (226,'CUP_V_O_SLA_M23_1_OD','l_military','1','10','item','[]','2019-07-14 18:33:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (227,'CUP_V_I_Guerilla_Jacket','l_military','1','20','item','[]','2019-07-14 18:33:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (229,'V_PlateCarrier2_blk','h_military','1','6','item','[]','2019-07-14 18:34:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (231,'CUP_V_OI_TKI_Jacket4_01','l_military','1','16','item','[]','2019-07-14 18:35:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (233,'CUP_V_B_RRV_Scout2','l_military','1','12','item','[]','2019-07-14 18:36:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (234,'V_I_G_resistanceLeader_F','l_military','1','17','item','[]','2019-07-14 18:36:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (235,'CUP_V_I_RACS_Carrier_Rig_wdl_3','l_military','1','20','item','[]','2019-07-14 18:36:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (237,'CUP_V_B_Interceptor_Grenadier_M81','m_military','1','11','item','[]','2019-07-14 18:37:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (238,'CUP_V_CDF_6B3_1_Green','l_military','1','6','item','[]','2019-07-14 18:37:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (239,'CUP_V_B_BAF_DPM_Osprey_Mk3_Engineer','m_military','1','8','item','[]','2019-07-14 18:37:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (240,'CUP_V_B_PASGT','l_military','1','13','item','[]','2019-07-14 18:38:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (241,'CUP_V_CZ_vest10','l_military','1','13','item','[]','2019-07-14 18:38:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (242,'CUP_V_CZ_vest03','l_military','1','13','item','[]','2019-07-14 18:38:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (243,'CUP_V_RUS_6B3_Flora_3','m_military','1','9','item','[]','2019-07-14 18:38:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (252,'CUP_B_ACRPara_m95','l_military','1','20','backpack','[]','2019-07-14 18:48:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (253,'CUP_B_AlicePack_Khaki','l_military','1','20','backpack','[]','2019-07-14 18:48:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (256,'CUP_B_USMC_AssaultPack','l_military','1','30','backpack','[]','2019-07-14 18:50:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (259,'rhs_d6_Parachute_backpack','h_military','1','6','backpack','[]','2019-07-14 18:52:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (278,'valor_defibrillator','medical','1','5','item','[]','2019-07-14 19:03:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (279,'valor_bandage','medical','1','25','item','[]','2019-07-14 19:03:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (280,'valor_bloodbag','medical','1','25','item','[]','2019-07-14 19:05:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (281,'valor_firstaidkit_01_closed','medical','1','5','item','[]','2019-07-14 19:06:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (282,'valor_painkillers','medical','1','20','item','[]','2019-07-14 19:06:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (283,'valor_vitaminbottle','medical','1','20','item','[]','2019-07-14 19:06:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (284,'NVGoggles_OPFOR','m_military','1','4','item','[]','2019-07-14 19:08:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (285,'ItemGPS','l_military','1','10','item','[]','2019-07-14 19:09:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (292,'CUP_FR_NeckScarf2','l_military','1','15','item','[]','2019-07-14 19:12:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (304,'CUP_srifle_CZ550','farming','1','2','weapon','[[\"CUP_5x_22_LR_17_HMR_M\",2,\"magazin\"]]','2019-07-16 16:16:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (305,'CUP_5x_22_LR_17_HMR_M','farming','1','3','magazin','[[\"CUP_5x_22_LR_17_HMR_M\",2,\"magazin\"]]','2019-07-16 16:16:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (306,'MadArmA_Wrenchgun','farming','1','8','weapon','[[\"in005_32Rnd_9_Mag\",2,\"magazin\"]]','2019-07-16 16:17:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (307,'in005_32Rnd_9_Mag','farming','1','10','magazin','[[\"in005_32Rnd_9_Mag\",2,\"magazin\"]]','2019-07-16 16:17:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (308,'CUP_srifle_LeeEnfield','farming','1','10','weapon','[[\"CUP_10x_303_M\",3,\"magazin\"]]','2019-07-16 16:18:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (309,'CUP_10x_303_M','farming','1','12','magazin','[[\"CUP_10x_303_M\",3,\"magazin\"]]','2019-07-16 16:18:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (310,'CUP_sgun_M1014','farming','1','11','weapon','[[\"CUP_8Rnd_B_Beneli_74Slug\",3,\"magazin\"]]','2019-07-16 16:18:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (311,'CUP_8Rnd_B_Beneli_74Slug','farming','1','13','magazin','[[\"CUP_8Rnd_B_Beneli_74Slug\",3,\"magazin\"]]','2019-07-16 16:18:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (312,'MadArmA_LuckyShot','farming','1','6','weapon','[[\"20Rnd_762x51_Mag\",3,\"magazin\"]]','2019-07-16 16:19:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (313,'20Rnd_762x51_Mag','farming','1','8','magazin','[[\"20Rnd_762x51_Mag\",2,\"magazin\"]]','2019-07-16 16:19:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (314,'CUP_smg_SA61','farming','1','20','weapon','[[\"CUP_20Rnd_B_765x17_Ball_M\",3,\"magazin\"]]','2019-07-16 16:19:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (315,'CUP_20Rnd_B_765x17_Ball_M','farming','1','22','magazin','[[\"CUP_20Rnd_B_765x17_Ball_M\",2,\"magazin\"]]','2019-07-16 16:19:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (316,'MadArmA_Imperfect','farming','1','14','weapon','[[\"in005_8Rnd_12Gauge_Pellets\",3,\"magazin\"]]','2019-07-16 16:20:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (317,'in005_8Rnd_12Gauge_Pellets','farming','1','16','magazin','[[\"in005_8Rnd_12Gauge_Pellets\",2,\"magazin\"]]','2019-07-16 16:20:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (318,'MadArmA_Devastator','farming','1','25','weapon','[[\"in005_1Rnd_12Gauge_Pellets\",3,\"magazin\"]]','2019-07-16 16:20:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (319,'in005_1Rnd_12Gauge_Pellets','farming','1','27','magazin','[[\"in005_1Rnd_12Gauge_Pellets\",2,\"magazin\"]]','2019-07-16 16:20:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (320,'MadArmA_TrashGun','farming','1','20','weapon','[[\"in005_2Rnd_12Gauge_Pellets\",3,\"magazin\"]]','2019-07-16 16:21:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (321,'in005_2Rnd_12Gauge_Pellets','farming','1','22','magazin','[[\"in005_2Rnd_12Gauge_Pellets\",2,\"magazin\"]]','2019-07-16 16:21:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (324,'rhs_weap_akm','farming','1','5','weapon','[[\"rhs_30Rnd_762x39mm_bakelite\",3,\"magazin\"]]','2019-07-16 16:22:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (325,'rhs_30Rnd_762x39mm_bakelite','farming','1','7','magazin','[[\"rhs_30Rnd_762x39mm_bakelite\",2,\"magazin\"]]','2019-07-16 16:22:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (326,'rhs_weap_ak74','farming','1','4','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",3,\"magazin\"]]','2019-07-16 16:22:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (327,'rhs_30Rnd_545x39_7N6M_AK','farming','1','6','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-16 16:22:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (328,'rhs_weap_pm63','farming','1','6','weapon','[[\"rhs_30Rnd_762x39mm\",3,\"magazin\"]]','2019-07-16 16:22:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (329,'rhs_30Rnd_762x39mm','farming','1','8','magazin','[[\"rhs_30Rnd_762x39mm\",2,\"magazin\"]]','2019-07-16 16:22:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (330,'rhs_weap_pb_6p9','farming','1','12','weapon','[[\"rhs_mag_9x18_8_57N181S\",3,\"magazin\"]]','2019-07-16 16:24:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (331,'rhs_mag_9x18_8_57N181S','farming','1','14','magazin','[[\"rhs_mag_9x18_8_57N181S\",2,\"magazin\"]]','2019-07-16 16:24:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (332,'CUP_hgun_TaurusTracker455','farming','1','12','weapon','[[\"CUP_6Rnd_45ACP_M\",3,\"magazin\"]]','2019-07-16 16:25:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (333,'CUP_6Rnd_45ACP_M','farming','1','14','magazin','[[\"CUP_6Rnd_45ACP_M\",2,\"magazin\"]]','2019-07-16 16:25:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (334,'hgun_Pistol_heavy_02_F','farming','1','12','weapon','[[\"6Rnd_45ACP_Cylinder\",3,\"magazin\"]]','2019-07-16 16:25:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (335,'6Rnd_45ACP_Cylinder','farming','1','14','magazin','[[\"6Rnd_45ACP_Cylinder\",2,\"magazin\"]]','2019-07-16 16:25:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (336,'CUP_hgun_Makarov','farming','1','15','weapon','[[\"CUP_8Rnd_9x18_Makarov_M\",3,\"magazin\"]]','2019-07-16 16:25:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (337,'CUP_8Rnd_9x18_Makarov_M','farming','1','17','magazin','[[\"CUP_8Rnd_9x18_Makarov_M\",2,\"magazin\"]]','2019-07-16 16:25:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (338,'MadArmA_Revolver_01','farming','1','18','weapon','[[\"6Rnd_45ACP_Cylinder\",3,\"magazin\"]]','2019-07-16 16:26:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (339,'6Rnd_45ACP_Cylinder','farming','1','20','magazin','[[\"6Rnd_45ACP_Cylinder\",2,\"magazin\"]]','2019-07-16 16:26:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (340,'CHR_FlashLight','farming','1','25','weapon','[]','2019-07-16 16:26:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (341,'rhs_weap_tr8','farming','1','8','weapon','[]','2019-07-16 16:27:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (342,'MadArmA_Mauser_C96','farming','1','10','weapon','[[\"16Rnd_9x21_Mag\",3,\"magazin\"]]','2019-07-16 16:27:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (343,'16Rnd_9x21_Mag','farming','1','12','magazin','[[\"16Rnd_9x21_Mag\",2,\"magazin\"]]','2019-07-16 16:27:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (344,'Binocular','farming','1','9','item','[]','2019-07-16 16:29:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (345,'ItemCompass','farming','1','9','item','[]','2019-07-16 16:30:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (346,'ItemMap','farming','1','9','item','[]','2019-07-16 16:30:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (347,'ItemWatch','farming','1','9','item','[]','2019-07-16 16:30:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (348,'valor_canisterfuel','farming','1','9','item','[]','2019-07-16 16:31:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (349,'valor_canisterfuel_empty','farming','1','16','item','[]','2019-07-16 16:31:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (350,'valor_can_dented','farming','1','20','item','[[\"valor_can_dented\",4,\"item\"]]','2019-07-16 16:32:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (351,'valor_bakedbeans','farming','1','12','item','[]','2019-07-16 16:32:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (352,'valor_can_v2','farming','1','12','item','[]','2019-07-16 16:33:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (353,'valor_can_v3','farming','1','12','item','[]','2019-07-16 16:33:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (354,'valor_can_rusty','farming','1','20','item','[]','2019-07-16 16:33:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (355,'valor_can_v1','farming','1','12','item','[]','2019-07-16 16:33:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (356,'valor_canteen','farming','1','8','item','[]','2019-07-16 16:34:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (357,'valor_cerealsbox','farming','1','12','item','[]','2019-07-16 16:34:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (358,'valor_ducttape','farming','1','7','item','[]','2019-07-16 16:34:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (359,'valor_orange_01','farming','1','12','item','[]','2019-07-16 16:34:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (360,'valor_ricebox','farming','1','12','item','[]','2019-07-16 16:35:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (361,'valor_van_02_rimless_tire','farming','1','4','item','[]','2019-07-16 16:35:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (362,'valor_bottleplastic_v2','farming','1','12','item','[]','2019-07-16 16:35:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (363,'valor_tacticalbacon','farming','1','12','item','[]','2019-07-16 16:35:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (364,'Chemlight_red','farming','1','4','item','[]','2019-07-16 16:36:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (365,'Chemlight_green','farming','1','4','item','[]','2019-07-16 16:36:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (366,'Chemlight_yellow','farming','1','4','item','[]','2019-07-16 16:36:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (367,'Chemlight_blue','farming','1','4','item','[]','2019-07-16 16:36:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (368,'CUP_U_C_Villager_01','farming','1','15','item','[]','2019-07-16 16:39:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (369,'CUP_U_C_Villager_04','farming','1','15','item','[]','2019-07-16 16:39:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (370,'CUP_U_C_Villager_02','farming','1','15','item','[]','2019-07-16 16:40:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (371,'CUP_U_C_Villager_03','farming','1','15','item','[]','2019-07-16 16:40:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (372,'U_C_WorkerCoveralls','farming','1','12','item','[]','2019-07-16 16:40:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (373,'rhs_uniform_df15','farming','1','12','item','[]','2019-07-16 16:40:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (374,'U_C_HunterBody_grn','farming','1','12','item','[]','2019-07-16 16:40:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (375,'CUP_U_C_Woodlander_01','farming','1','12','item','[]','2019-07-16 16:41:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (376,'CUP_U_C_Woodlander_02','farming','1','12','item','[]','2019-07-16 16:41:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (377,'V_LegStrapBag_coyote_F','farming','1','15','item','[]','2019-07-16 16:42:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (378,'rhs_vest_commander','farming','1','15','item','[]','2019-07-16 16:42:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (379,'CUP_V_O_TK_OfficerBelt','farming','1','15','item','[]','2019-07-16 16:42:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (380,'CUP_V_OI_TKI_Jacket1_06','farming','1','8','item','[]','2019-07-16 16:42:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (381,'CUP_V_OI_TKI_Jacket1_04','farming','1','8','item','[]','2019-07-16 16:43:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (382,'CUP_V_OI_TKI_Jacket5_04','farming','1','8','item','[]','2019-07-16 16:43:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (383,'CUP_V_OI_TKI_Jacket5_03','farming','1','8','item','[]','2019-07-16 16:43:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (384,'CUP_V_OI_TKI_Jacket1_03','farming','1','8','item','[]','2019-07-16 16:44:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (385,'CUP_V_OI_TKI_Jacket5_04','farming','1','8','item','[]','2019-07-16 16:44:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (386,'CUP_V_OI_TKI_Jacket5_01','farming','1','8','item','[]','2019-07-16 16:44:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (387,'CUP_V_OI_TKI_Jacket5_06','farming','1','8','item','[]','2019-07-16 16:44:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (388,'CUP_V_OI_TKI_Jacket5_05','farming','1','8','item','[]','2019-07-16 16:45:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (389,'CUP_V_OI_TKI_Jacket6_05','farming','1','8','item','[]','2019-07-16 16:45:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (390,'V_LegStrapBag_olive_F','farming','1','15','item','[]','2019-07-16 16:46:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (391,'rhs_vest_pistol_holster','farming','1','6','item','[]','2019-07-16 16:46:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (392,'H_Bandanna_khk','farming','1','4','item','[]','2019-07-16 16:46:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (393,'H_Bandanna_blu','farming','1','4','item','[]','2019-07-16 16:47:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (394,'H_Bandanna_sand','farming','1','4','item','[]','2019-07-16 16:47:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (395,'H_Bandanna_gry','farming','1','4','item','[]','2019-07-16 16:47:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (396,'H_StrawHat','farming','1','4','item','[]','2019-07-16 16:47:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (397,'CUP_H_C_Beret_04','farming','1','4','item','[]','2019-07-16 16:47:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (398,'CUP_H_C_Beret_01','farming','1','4','item','[]','2019-07-16 16:47:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (399,'rhs_beanie_green','farming','1','4','item','[]','2019-07-16 16:47:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (400,'CUP_H_C_Beret_02','farming','1','4','item','[]','2019-07-16 16:47:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (401,'CUP_H_C_Ushanka_03','farming','1','4','item','[]','2019-07-16 16:47:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (402,'H_MM_Helmet_02','farming','1','4','item','[]','2019-07-16 16:47:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (403,'CUP_H_C_Ushanka_02','farming','1','4','item','[]','2019-07-16 16:47:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (404,'CUP_H_C_Ushanka_04','farming','1','4','item','[]','2019-07-16 16:47:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (405,'CUP_H_TKI_Pakol_1_06','farming','1','4','item','[]','2019-07-16 16:47:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (406,'CUP_H_TKI_SkullCap_06','farming','1','4','item','[]','2019-07-16 16:47:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (407,'CUP_H_TKI_Lungee_Open_01','farming','1','4','item','[]','2019-07-16 16:47:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (408,'CUP_H_TKI_Pakol_2_03','farming','1','4','item','[]','2019-07-16 16:47:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (409,'CUP_H_TKI_Pakol_1_03','farming','1','4','item','[]','2019-07-16 16:48:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (410,'CUP_H_TKI_SkullCap_03','farming','1','4','item','[]','2019-07-16 16:48:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (411,'CUP_H_C_Beret_03','farming','1','4','item','[]','2019-07-16 16:48:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (412,'CUP_H_TKI_Lungee_04','farming','1','4','item','[]','2019-07-16 16:48:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (413,'rhs_scarf','farming','1','4','item','[]','2019-07-16 16:48:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (414,'CUP_B_ACRScout_m95','farming','1','16','backpack','[]','2019-07-16 16:50:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (415,'CUP_B_CivPack_WDL','farming','1','12','backpack','[]','2019-07-16 16:51:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (416,'CUP_B_RUS_Backpack','farming','1','14','backpack','[]','2019-07-16 16:51:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (417,'rhs_sidor','farming','1','15','backpack','[]','2019-07-16 16:52:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (418,'CUP_B_AssaultPack_Coyote','farming','1','14','backpack','[]','2019-07-16 16:52:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (419,'CUP_B_AssaultPack_Black','farming','1','14','backpack','[]','2019-07-16 16:52:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (420,'CUP_B_CivPack_WDL','farming','1','10','backpack','[]','2019-07-16 16:53:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (421,'CUP_B_RUS_Backpack','farming','1','12','backpack','[]','2019-07-16 16:53:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (422,'CUP_U_C_Worker_03','industrial','1','8','item','[]','2019-07-16 17:59:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (423,'U_C_WorkerCoveralls','industrial','1','8','item','[]','2019-07-16 17:59:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (424,'CUP_U_C_Worker_01','industrial','1','8','item','[]','2019-07-16 18:00:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (425,'CUP_U_C_Worker_02','industrial','1','8','item','[]','2019-07-16 18:00:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (427,'CUP_U_C_Worker_04','industrial','1','8','item','[]','2019-07-16 18:00:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (428,'CUP_U_C_Worker_03','industrial','1','8','item','[]','2019-07-16 18:01:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (429,'CUP_U_C_Mechanic_02','industrial','1','6','item','[]','2019-07-16 18:01:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (430,'CUP_U_C_Mechanic_03','industrial','1','6','item','[]','2019-07-16 18:02:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (431,'CUP_U_C_Mechanic_01','industrial','1','6','item','[]','2019-07-16 18:02:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (432,'CUP_V_B_LHDVest_Yellow','industrial','1','7','item','[]','2019-07-16 18:02:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (433,'CUP_V_B_LHDVest_Red','industrial','1','7','item','[]','2019-07-16 18:03:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (434,'CUP_V_B_LHDVest_Brown','industrial','1','7','item','[]','2019-07-16 18:03:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (435,'rhs_6sh46','industrial','1','7','item','[]','2019-07-16 18:03:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (436,'rhs_altyn_visordown','industrial','1','2','item','[]','2019-07-16 18:03:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (437,'rhs_altyn','industrial','1','2','item','[]','2019-07-16 18:03:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (438,'H_Cap_tan','industrial','1','6','item','[]','2019-07-16 18:04:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (439,'H_Bandanna_sand','industrial','1','6','item','[]','2019-07-16 18:04:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (440,'H_Bandanna_cbr','industrial','1','6','item','[]','2019-07-16 18:04:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (441,'CUP_H_SLA_Helmet_BLK','industrial','1','4','item','[]','2019-07-16 18:04:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (442,'rhs_assault_umbts_engineer_empty','industrial','1','4','backpack','[]','2019-07-16 18:05:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (443,'FirstAidKit','industrial','1','10','item','[]','2019-07-16 18:07:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (444,'valor_carbattery_01','industrial','1','12','item','[]','2019-07-16 18:07:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (445,'valor_battery','industrial','1','14','item','[]','2019-07-16 18:07:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (446,'valor_crowbar_01','industrial','1','10','item','[]','2019-07-16 18:07:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (447,'valor_camping_light','industrial','1','10','item','[]','2019-07-16 18:08:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (448,'valor_butanetorch','industrial','1','8','item','[]','2019-07-16 18:08:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (449,'valor_butanecanister','industrial','1','9','item','[]','2019-07-16 18:08:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (450,'valor_wrench','industrial','1','11','item','[]','2019-07-16 18:08:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (451,'valor_drillaku','industrial','1','10','item','[]','2019-07-16 18:08:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (452,'valor_shovel','industrial','1','10','item','[]','2019-07-16 18:08:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (453,'valor_saw','industrial','1','10','item','[]','2019-07-16 18:08:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (454,'valor_metalwire','industrial','1','10','item','[]','2019-07-16 18:09:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (455,'valor_carbattery_02','industrial','1','12','item','[]','2019-07-16 18:09:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (456,'valor_extensioncord','industrial','1','8','item','[]','2019-07-16 18:10:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (457,'valor_woodenlog','industrial','1','6','item','[]','2019-07-16 18:10:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (458,'valor_waterbottle_01_compressed','industrial','1','10','item','[]','2019-07-16 18:10:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (459,'valor_van_02_rimless_tire','industrial','1','7','item','[]','2019-07-16 18:10:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (460,'valor_bottleplastic_v2','industrial','1','5','item','[]','2019-07-16 18:11:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (461,'valor_tacticalbacon','industrial','1','5','item','[]','2019-07-16 18:11:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (462,'valor_ricebox','industrial','1','5','item','[]','2019-07-16 18:11:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (463,'valor_hammer','industrial','1','10','item','[]','2019-07-16 18:11:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (464,'valor_orange_01','industrial','1','5','item','[]','2019-07-16 18:11:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (465,'valor_ducttape','industrial','1','18','item','[]','2019-07-16 18:12:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (466,'valor_cerealsbox','industrial','1','5','item','[]','2019-07-16 18:12:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (467,'valor_can_v1','industrial','1','5','item','[]','2019-07-16 18:12:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (468,'valor_bakedbeans','industrial','1','5','item','[]','2019-07-16 18:12:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (469,'valor_can_v3','industrial','1','5','item','[]','2019-07-16 18:12:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (470,'valor_can_v2','industrial','1','5','item','[]','2019-07-16 18:12:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (471,'valor_can_rusty','industrial','1','15','item','[]','2019-07-16 18:12:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (472,'valor_can_dented','industrial','1','15','item','[]','2019-07-16 18:13:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (473,'valor_canteen','industrial','1','3','item','[]','2019-07-16 18:13:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (474,'valor_canisterfuel_empty','industrial','1','18','item','[]','2019-07-16 18:13:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (475,'valor_canisterfuel','industrial','1','10','item','[]','2019-07-16 18:13:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (476,'valor_tankboresighter_01','industrial','1','10','item','[]','2019-07-16 18:13:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (477,'valor_portable_generator','industrial','1','2','item','[]','2019-07-16 18:14:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (478,'valor_rotor','industrial','1','4','item','[]','2019-07-16 18:14:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (481,'CUP_8Rnd_B_Beneli_74Pellets','general','1','30','magazin','[[\"CUP_8Rnd_B_Beneli_74Pellets\",2,\"magazin\"]]','2019-07-17 20:49:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (482,'CUP_sgun_M1014','general','1','30','weapon','[[\"CUP_8Rnd_B_Beneli_74Pellets\",3,\"magazin\"]]','2019-07-17 20:49:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (483,'CUP_8Rnd_B_Beneli_74Slug','general','1','30','magazin','[[\"CUP_8Rnd_B_Beneli_74Slug\",2,\"magazin\"]]','2019-07-17 20:50:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (484,'CUP_smg_SA61','general','1','35','weapon','[[\"CUP_10Rnd_B_765x17_Ball_M\",3,\"magazin\"]]','2019-07-17 20:51:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (485,'CUP_10Rnd_B_765x17_Ball_M','general','1','35','magazin','[[\"CUP_10Rnd_B_765x17_Ball_M\",2,\"magazin\"]]','2019-07-17 20:51:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (486,'CUP_20Rnd_B_765x17_Ball_M','general','1','30','magazin','[[\"CUP_20Rnd_B_765x17_Ball_M\",2,\"magazin\"]]','2019-07-17 20:52:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (487,'CUP_arifle_TYPE_56_2_Early','general','1','20','weapon','[[\"CUP_30Rnd_762x39_AK47_M\",3,\"magazin\"]]','2019-07-17 20:52:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (488,'CUP_30Rnd_762x39_AK47_M','general','1','20','magazin','[[\"CUP_30Rnd_762x39_AK47_M\",2,\"magazin\"]]','2019-07-17 20:52:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (489,'CUP_lmg_UK59','general','1','10','weapon','[[\"CUP_50Rnd_UK59_762x54R_Tracer\",3,\"magazin\"]]','2019-07-17 20:53:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (490,'CUP_50Rnd_UK59_762x54R_Tracer','general','1','10','magazin','[[\"CUP_50Rnd_UK59_762x54R_Tracer\",2,\"magazin\"]]','2019-07-17 20:53:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (491,'rhs_weap_ak74','general','1','20','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",3,\"magazin\"]]','2019-07-17 20:53:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (492,'rhs_30Rnd_545x39_7N6M_AK','general','1','20','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-17 20:53:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (493,'rhs_weap_akm','general','1','20','weapon','[[\"rhs_30Rnd_762x39mm_bakelite\",3,\"magazin\"]]','2019-07-17 20:53:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (494,'rhs_30Rnd_762x39mm_bakelite','general','1','20','magazin','[[\"rhs_30Rnd_762x39mm_bakelite\",2,\"magazin\"]]','2019-07-17 20:53:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (495,'CUP_arifle_Sa58P','general','1','20','weapon','[[\"CUP_30Rnd_Sa58_M_TracerG\",3,\"magazin\"]]','2019-07-17 20:53:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (496,'CUP_30Rnd_Sa58_M_TracerG','general','1','20','magazin','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-17 20:53:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (497,'CUP_smg_saiga9','general','1','15','weapon','[[\"CUP_10Rnd_9x19_Saiga9\",3,\"magazin\"]]','2019-07-17 20:53:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (498,'CUP_10Rnd_9x19_Saiga9','general','1','15','magazin','[[\"CUP_10Rnd_9x19_Saiga9\",2,\"magazin\"]]','2019-07-17 20:53:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (499,'CUP_arifle_FNFAL','general','1','10','weapon','[[\"CUP_20Rnd_762x51_FNFAL_M\",3,\"magazin\"]]','2019-07-17 20:54:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (500,'CUP_20Rnd_762x51_FNFAL_M','general','1','10','magazin','[[\"CUP_20Rnd_762x51_FNFAL_M\",2,\"magazin\"]]','2019-07-17 20:54:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (501,'CUP_arifle_FNFAL5061','general','1','10','weapon','[[\"CUP_20Rnd_762x51_FNFAL_M\",3,\"magazin\"]]','2019-07-17 20:54:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (502,'CUP_20Rnd_762x51_FNFAL_M','general','1','10','magazin','[[\"CUP_20Rnd_762x51_FNFAL_M\",2,\"magazin\"]]','2019-07-17 20:54:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (503,'CUP_srifle_CZ550','general','1','5','weapon','[[\"CUP_5x_22_LR_17_HMR_M\",3,\"magazin\"]]','2019-07-17 20:55:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (504,'CUP_5x_22_LR_17_HMR_M','general','1','5','magazin','[[\"CUP_5x_22_LR_17_HMR_M\",2,\"magazin\"]]','2019-07-17 20:55:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (505,'rhs_weap_aks74_2','general','1','20','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",3,\"magazin\"]]','2019-07-17 20:55:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (506,'rhs_30Rnd_545x39_7N6M_AK','general','1','20','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-17 20:55:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (507,'rhs_weap_pm63','general','1','20','weapon','[[\"rhs_30Rnd_762x39mm\",3,\"magazin\"]]','2019-07-17 20:55:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (508,'rhs_30Rnd_762x39mm','general','1','20','magazin','[[\"rhs_30Rnd_762x39mm\",2,\"magazin\"]]','2019-07-17 20:55:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (509,'rhs_weap_aks74un','general','1','22','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",3,\"magazin\"]]','2019-07-17 20:57:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (510,'rhs_30Rnd_545x39_7N6M_AK','general','1','22','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-17 20:57:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (511,'CUP_srifle_LeeEnfield_rail','general','1','8','weapon','[[\"CUP_10x_303_M\",3,\"magazin\"]]','2019-07-17 20:58:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (512,'CUP_10x_303_M','general','1','8','magazin','[[\"CUP_10x_303_M\",2,\"magazin\"]]','2019-07-17 20:58:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (513,'arifle_TRG20_F','general','1','10','weapon','[[\"30Rnd_556x45_Stanag\",3,\"magazin\"]]','2019-07-17 20:59:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (514,'30Rnd_556x45_Stanag','general','1','10','magazin','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-17 20:59:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (515,'arifle_TRG21_F','general','1','10','weapon','[[\"30Rnd_556x45_Stanag\",3,\"magazin\"]]','2019-07-17 20:59:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (516,'30Rnd_556x45_Stanag','general','1','10','magazin','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-17 20:59:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (517,'CUP_smg_MP5A5','general','1','15','weapon','[[\"CUP_30Rnd_9x19_MP5\",3,\"magazin\"]]','2019-07-17 20:59:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (518,'CUP_30Rnd_9x19_MP5','general','1','15','magazin','[[\"CUP_30Rnd_9x19_MP5\",2,\"magazin\"]]','2019-07-17 20:59:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (519,'CUP_smg_MP5A5_flashlight','general','1','15','weapon','[[\"CUP_30Rnd_9x19_MP5\",3,\"magazin\"]]','2019-07-17 21:00:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (520,'CUP_30Rnd_9x19_MP5','general','1','15','magazin','[[\"CUP_30Rnd_9x19_MP5\",2,\"magazin\"]]','2019-07-17 21:00:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (521,'CUP_srifle_LeeEnfield','general','1','25','weapon','[[\"CUP_10x_303_M\",3,\"magazin\"]]','2019-07-17 21:00:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (522,'CUP_10x_303_M','general','1','25','magazin','[[\"CUP_10x_303_M\",2,\"magazin\"]]','2019-07-17 21:00:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (523,'optic_ACO_grn','general','1','15','item','[]','2019-07-17 21:01:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (524,'optic_ACO_grn_smg','general','1','15','item','[]','2019-07-17 21:02:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (525,'optic_Aco','general','1','15','item','[]','2019-07-17 21:02:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (526,'CUP_optic_MicroT1','general','1','15','item','[]','2019-07-17 21:02:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (527,'CUP_optic_CompM4','general','1','15','item','[]','2019-07-17 21:02:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (528,'CUP_optic_ZDDot','general','1','15','item','[]','2019-07-17 21:03:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (529,'rhs_acc_ekp8_18','general','1','15','item','[]','2019-07-17 21:03:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (530,'CUP_optic_MRad','general','1','15','item','[]','2019-07-17 21:03:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (531,'CUP_optic_Kobra','general','1','12','item','[]','2019-07-17 21:04:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (532,'rhs_acc_1p63','general','1','12','item','[]','2019-07-17 21:04:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (533,'optic_KHS_old','general','1','3','item','[]','2019-07-17 21:04:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (534,'CUP_optic_SUSAT','general','1','7','item','[]','2019-07-17 21:04:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (535,'rhs_acc_ekp8_02','general','1','12','item','[]','2019-07-17 21:04:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (536,'rhs_weap_ak74_3','general','1','20','weapon','[[\"rhs_30Rnd_545x39_7N6_green_AK\",2,\"magazin\"]]','2019-07-17 21:05:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (537,'rhs_30Rnd_545x39_7N6_green_AK','general','1','20','magazin','[[\"rhs_30Rnd_545x39_7N6_green_AK\",2,\"magazin\"]]','2019-07-17 21:05:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (538,'CUP_arifle_AK74M','general','1','12','weapon','[[\"CUP_30Rnd_545x39_AK74M_M\",2,\"magazin\"]]','2019-07-17 21:06:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (539,'CUP_30Rnd_545x39_AK74M_M','general','1','12','magazin','[[\"CUP_30Rnd_545x39_AK74M_M\",2,\"magazin\"]]','2019-07-17 21:06:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (540,'rhs_weap_ak74m_fullplum','general','1','12','weapon','[[\"rhs_30Rnd_545x39_7N10_plum_AK\",2,\"magazin\"]]','2019-07-17 21:08:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (541,'rhs_30Rnd_545x39_7N10_plum_AK','general','1','12','magazin','[[\"rhs_30Rnd_545x39_7N10_plum_AK\",2,\"magazin\"]]','2019-07-17 21:08:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (542,'rhs_weap_akmn','general','1','12','weapon','[[\"rhs_30Rnd_762x39mm_bakelite\",2,\"magazin\"]]','2019-07-17 21:09:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (543,'rhs_30Rnd_762x39mm_bakelite','general','1','12','magazin','[[\"rhs_30Rnd_762x39mm_bakelite\",2,\"magazin\"]]','2019-07-17 21:09:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (544,'rhs_weap_aks74u','general','1','25','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-17 21:12:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (545,'rhs_30Rnd_545x39_7N6M_AK','general','1','25','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-17 21:12:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (546,'rhs_weap_6p53','general','1','30','weapon','[[\"rhs_18rnd_9x21mm_7N28\",2,\"magazin\"]]','2019-07-17 21:14:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (547,'rhs_18rnd_9x21mm_7N28','general','1','30','magazin','[[\"rhs_18rnd_9x21mm_7N28\",2,\"magazin\"]]','2019-07-17 21:14:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (548,'rhs_weap_pb_6p9','general','1','25','weapon','[[\"rhs_mag_9x18_8_57N181S\",2,\"magazin\"]]','2019-07-17 21:15:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (549,'rhs_mag_9x18_8_57N181S','general','1','25','magazin','[[\"rhs_mag_9x18_8_57N181S\",2,\"magazin\"]]','2019-07-17 21:15:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (550,'hgun_Pistol_heavy_02_F','general','1','20','weapon','[[\"6Rnd_45ACP_Cylinder\",2,\"magazin\"]]','2019-07-17 21:15:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (551,'6Rnd_45ACP_Cylinder','general','1','20','magazin','[[\"6Rnd_45ACP_Cylinder\",3,\"magazin\"]]','2019-07-17 21:15:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (552,'CUP_hgun_TaurusTracker455_gold','general','1','2','weapon','[[\"CUP_6Rnd_45ACP_M\",2,\"magazin\"]]','2019-07-17 21:15:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (553,'CUP_6Rnd_45ACP_M','general','1','2','magazin','[[\"CUP_6Rnd_45ACP_M\",3,\"magazin\"]]','2019-07-17 21:15:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (554,'CUP_hgun_SA61','general','1','20','weapon','[[\"CUP_10Rnd_B_765x17_Ball_M\",2,\"magazin\"]]','2019-07-17 21:16:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (555,'CUP_10Rnd_B_765x17_Ball_M','general','1','20','magazin','[[\"CUP_10Rnd_B_765x17_Ball_M\",3,\"magazin\"]]','2019-07-17 21:16:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (556,'CUP_20Rnd_B_765x17_Ball_M','general','1','20','magazin','[[\"CUP_20Rnd_B_765x17_Ball_M\",3,\"magazin\"]]','2019-07-17 21:19:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (557,'CUP_hgun_Makarov','general','1','30','weapon','[[\"CUP_8Rnd_9x18_Makarov_M\",2,\"magazin\"]]','2019-07-17 21:20:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (558,'CUP_8Rnd_9x18_Makarov_M','general','1','30','magazin','[[\"CUP_8Rnd_9x18_Makarov_M\",3,\"magazin\"]]','2019-07-17 21:20:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (559,'CUP_hgun_M9','general','1','30','weapon','[[\"CUP_15Rnd_9x19_M9\",2,\"magazin\"]]','2019-07-17 21:21:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (560,'CUP_15Rnd_9x19_M9','general','1','30','magazin','[[\"CUP_15Rnd_9x19_M9\",3,\"magazin\"]]','2019-07-17 21:21:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (561,'CUP_hgun_MicroUzi','general','1','10','weapon','[[\"CUP_30Rnd_9x19_UZI\",2,\"magazin\"]]','2019-07-17 21:21:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (562,'CUP_30Rnd_9x19_UZI','general','1','10','magazin','[[\"CUP_30Rnd_9x19_UZI\",3,\"magazin\"]]','2019-07-17 21:21:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (563,'CUP_hgun_PMM','general','1','30','weapon','[[\"CUP_12Rnd_9x18_PMM_M\",2,\"magazin\"]]','2019-07-17 21:22:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (564,'CUP_12Rnd_9x18_PMM_M','general','1','30','magazin','[[\"CUP_12Rnd_9x18_PMM_M\",3,\"magazin\"]]','2019-07-17 21:22:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (565,'CUP_hgun_Colt1911','general','1','28','weapon','[[\"CUP_7Rnd_45ACP_1911\",2,\"magazin\"]]','2019-07-17 21:22:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (566,'CUP_7Rnd_45ACP_1911','general','1','28','magazin','[[\"CUP_7Rnd_45ACP_1911\",3,\"magazin\"]]','2019-07-17 21:22:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (567,'CUP_hgun_Glock17','general','1','20','weapon','[[\"CUP_17Rnd_9x19_glock17\",2,\"magazin\"]]','2019-07-17 21:22:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (568,'CUP_17Rnd_9x19_glock17','general','1','20','magazin','[[\"CUP_17Rnd_9x19_glock17\",3,\"magazin\"]]','2019-07-17 21:22:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (569,'CHR_FlashLight','general','1','15','weapon','[]','2019-07-17 21:23:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (570,'hgun_Rook40_F','general','1','28','weapon','[[\"16Rnd_9x21_Mag\",2,\"magazin\"]]','2019-07-17 21:23:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (571,'16Rnd_9x21_Mag','general','1','28','magazin','[[\"16Rnd_9x21_Mag\",3,\"magazin\"]]','2019-07-17 21:23:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (572,'hgun_ACPC2_F','general','1','28','weapon','[[\"9Rnd_45ACP_Mag\",2,\"magazin\"]]','2019-07-17 21:24:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (573,'9Rnd_45ACP_Mag','general','1','28','magazin','[[\"9Rnd_45ACP_Mag\",3,\"magazin\"]]','2019-07-17 21:24:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (574,'hgun_Pistol_heavy_01_F','general','1','25','weapon','[[\"11Rnd_45ACP_Mag\",2,\"magazin\"]]','2019-07-17 21:24:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (575,'11Rnd_45ACP_Mag','general','1','25','magazin','[[\"11Rnd_45ACP_Mag\",3,\"magazin\"]]','2019-07-17 21:24:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (576,'CUP_hgun_Compact','general','1','25','weapon','[[\"CUP_10Rnd_9x19_Compact\",2,\"magazin\"]]','2019-07-17 21:24:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (577,'CUP_10Rnd_9x19_Compact','general','1','25','magazin','[[\"CUP_10Rnd_9x19_Compact\",3,\"magazin\"]]','2019-07-17 21:24:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (578,'rhs_weap_rsp30_white','general','1','10','weapon','[[\"rhs_mag_rsp30_white\",2,\"magazin\"]]','2019-07-17 21:25:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (579,'rhs_mag_rsp30_white','general','1','10','magazin','[[\"rhs_mag_rsp30_white\",3,\"magazin\"]]','2019-07-17 21:25:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (580,'rhs_weap_rsp30_green','general','1','10','weapon','[[\"rhs_mag_rsp30_green\",2,\"magazin\"]]','2019-07-17 21:25:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (581,'rhs_mag_rsp30_green','general','1','10','magazin','[[\"rhs_mag_rsp30_green\",3,\"magazin\"]]','2019-07-17 21:25:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (582,'rhs_weap_rsp30_red','general','1','10','weapon','[[\"rhs_mag_rsp30_red\",2,\"magazin\"]]','2019-07-17 21:26:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (583,'rhs_mag_rsp30_red','general','1','10','magazin','[[\"rhs_mag_rsp30_red\",3,\"magazin\"]]','2019-07-17 21:26:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (584,'rhs_acc_1p29','general','1','7','item','[]','2019-07-17 21:27:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (585,'rhs_acc_nita','general','1','7','item','[]','2019-07-17 21:27:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (586,'CUP_optic_PechenegScope','general','1','7','item','[]','2019-07-17 21:27:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (587,'rhs_acc_pkas','general','1','7','item','[]','2019-07-17 21:27:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (588,'CUP_U_I_GUE_Anorak_01','general','1','6','item','[]','2019-07-17 21:32:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (589,'CUP_U_I_GUE_Anorak_03','general','1','6','item','[]','2019-07-17 21:32:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (590,'CUP_U_I_GUE_Anorak_02','general','1','6','item','[]','2019-07-17 21:32:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (591,'CUP_U_B_US_BDU_OD','general','1','6','item','[]','2019-07-17 21:32:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (592,'CUP_U_O_CHDKZ_Bardak','general','1','6','item','[]','2019-07-17 21:33:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (593,'CUP_U_O_CHDKZ_Lopotev','general','1','6','item','[]','2019-07-17 21:33:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (594,'CUP_U_C_Citizen_02','general','1','6','item','[]','2019-07-17 21:33:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (595,'CUP_U_C_Citizen_01','general','1','6','item','[]','2019-07-17 21:33:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (596,'CUP_U_C_Citizen_04','general','1','6','item','[]','2019-07-17 21:33:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (597,'CUP_U_C_Citizen_03','general','1','6','item','[]','2019-07-17 21:33:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (598,'U_B_FullGhillie_Ethereal','general','1','1.5','item','[]','2019-07-17 21:33:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (599,'U_B_FullGhillie_grass','general','1','1.5','item','[]','2019-07-17 21:33:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (600,'U_B_FullGhillie_jungle','general','1','1.5','item','[]','2019-07-17 21:33:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (601,'U_B_FullGhillie_Phantom','general','1','1.5','item','[]','2019-07-17 21:33:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (602,'U_B_FullGhillie_marpat','general','1','1.5','item','[]','2019-07-17 21:33:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (603,'U_BG_Guerilla2_1','general','1','6','item','[]','2019-07-17 21:34:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (604,'U_BG_Guerilla2_3','general','1','6','item','[]','2019-07-17 21:34:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (605,'U_BG_Guerilla2_2','general','1','6','item','[]','2019-07-17 21:34:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (606,'U_BG_Guerilla3_1','general','1','6','item','[]','2019-07-17 21:34:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (607,'CUP_O_TKI_Khet_Jeans_04','general','1','6','item','[]','2019-07-17 21:34:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (608,'CUP_O_TKI_Khet_Jeans_02','general','1','6','item','[]','2019-07-17 21:34:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (609,'CUP_O_TKI_Khet_Jeans_01','general','1','6','item','[]','2019-07-17 21:34:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (610,'U_Marshal','general','1','6','item','[]','2019-07-17 21:34:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (611,'CUP_U_I_GUE_Flecktarn2','general','1','6','item','[]','2019-07-17 21:34:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (612,'CUP_U_I_GUE_Flecktarn3','general','1','6','item','[]','2019-07-17 21:34:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (613,'CUP_U_I_GUE_Flecktarn','general','1','6','item','[]','2019-07-17 21:34:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (614,'CUP_U_C_Pilot_01','general','1','6','item','[]','2019-07-17 21:34:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (615,'CUP_I_B_PMC_Unit_20','general','1','6','item','[]','2019-07-17 21:34:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (616,'CUP_I_B_PMC_Unit_22','general','1','6','item','[]','2019-07-17 21:34:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (617,'CUP_I_B_PMC_Unit_21','general','1','6','item','[]','2019-07-17 21:35:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (618,'CUP_I_B_PMC_Unit_19','general','1','6','item','[]','2019-07-17 21:35:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (619,'CUP_I_B_PMC_Unit_13','general','1','6','item','[]','2019-07-17 21:35:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (620,'CUP_I_B_PMC_Unit_14','general','1','6','item','[]','2019-07-17 21:35:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (621,'CUP_I_B_PMC_Unit_16','general','1','6','item','[]','2019-07-17 21:35:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (622,'CUP_I_B_PMC_Unit_15','general','1','6','item','[]','2019-07-17 21:35:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (623,'CUP_I_B_PMC_Unit_3','general','1','6','item','[]','2019-07-17 21:35:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (624,'CUP_I_B_PMC_Unit_3','general','1','6','item','[]','2019-07-17 21:35:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (625,'CUP_I_B_PMC_Unit_2','general','1','6','item','[]','2019-07-17 21:35:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (626,'CUP_I_B_PMC_Unit_1','general','1','6','item','[]','2019-07-17 21:35:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (627,'CUP_I_B_PMC_Unit_4','general','1','6','item','[]','2019-07-17 21:35:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (628,'CUP_I_B_PMC_Unit_7','general','1','6','item','[]','2019-07-17 21:35:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (629,'CUP_I_B_PMC_Unit_6','general','1','6','item','[]','2019-07-17 21:35:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (630,'CUP_I_B_PMC_Unit_5','general','1','6','item','[]','2019-07-17 21:35:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (631,'CUP_I_B_PMC_Unit_8','general','1','6','item','[]','2019-07-17 21:35:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (632,'CUP_I_B_PMC_Unit_11','general','1','6','item','[]','2019-07-17 21:36:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (633,'CUP_I_B_PMC_Unit_10','general','1','6','item','[]','2019-07-17 21:36:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (634,'CUP_I_B_PMC_Unit_9','general','1','6','item','[]','2019-07-17 21:36:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (635,'CUP_I_B_PMC_Unit_12','general','1','6','item','[]','2019-07-17 21:36:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (636,'CUP_U_C_Priest_01','general','1','2','item','[]','2019-07-17 21:36:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (637,'CUP_U_C_Profiteer_02','general','1','6','item','[]','2019-07-17 21:36:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (638,'CUP_U_C_Profiteer_03','general','1','6','item','[]','2019-07-17 21:37:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (639,'CUP_U_C_Profiteer_01','general','1','6','item','[]','2019-07-17 21:37:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (640,'CUP_U_C_Profiteer_04','general','1','6','item','[]','2019-07-17 21:37:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (641,'CUP_U_C_Rocker_01','general','1','6','item','[]','2019-07-17 21:37:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (642,'CUP_U_C_Rocker_03','general','1','6','item','[]','2019-07-17 21:37:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (643,'CUP_U_C_Rocker_02','general','1','6','item','[]','2019-07-17 21:37:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (644,'CUP_U_C_Rocker_04','general','1','6','item','[]','2019-07-17 21:37:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (645,'U_Rangemaster','general','1','6','item','[]','2019-07-17 21:37:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (646,'CUP_U_O_SLA_Overalls_Pilot','general','1','6','item','[]','2019-07-17 21:37:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (647,'rhs_acc_1p87','general','1','15','item','[]','2019-07-17 21:39:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (648,'CUP_U_O_SLA_Overalls_Tank','general','1','6','item','[]','2019-07-17 21:39:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (649,'CUP_U_C_Suit_01','general','1','2','item','[]','2019-07-17 21:39:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (650,'CUP_U_C_Suit_02','general','1','2','item','[]','2019-07-17 21:39:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (651,'U_O_FullGhillie_ard','general','1','1.5','item','[]','2019-07-17 21:39:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (652,'U_O_FullGhillie_sard','general','1','1.5','item','[]','2019-07-17 21:39:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (653,'U_O_FullGhillie_lsh','general','1','1.5','item','[]','2019-07-17 21:39:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (654,'U_Competitor','general','1','6','item','[]','2019-07-17 21:40:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (655,'CUP_U_C_Woodlander_01','general','1','6','item','[]','2019-07-17 21:40:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (656,'CUP_U_C_Woodlander_02','general','1','6','item','[]','2019-07-17 21:40:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (657,'CUP_U_C_Woodlander_04','general','1','6','item','[]','2019-07-17 21:40:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (658,'CUP_U_C_Worker_04','general','1','6','item','[]','2019-07-17 21:40:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (659,'CUP_U_C_Worker_02','general','1','6','item','[]','2019-07-17 21:40:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (660,'CUP_U_C_Worker_01','general','1','6','item','[]','2019-07-17 21:40:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (661,'CUP_U_C_Worker_03','general','1','6','item','[]','2019-07-17 21:40:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (662,'CUP_V_O_Ins_Carrier_Rig','general','1','4','item','[]','2019-07-17 21:41:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (663,'CUP_V_O_SLA_Carrier_Belt02','general','1','4','item','[]','2019-07-17 21:42:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (664,'CUP_V_O_SLA_Carrier_Belt03','general','1','4','item','[]','2019-07-17 21:42:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (665,'CUP_V_O_SLA_Carrier_Belt','general','1','4','item','[]','2019-07-17 21:42:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (666,'CUP_V_I_Carrier_Belt','general','1','4','item','[]','2019-07-17 21:42:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (667,'CUP_V_OI_TKI_Jacket2_01','general','1','4','item','[]','2019-07-17 21:42:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (668,'CUP_V_OI_TKI_Jacket2_05','general','1','4','item','[]','2019-07-17 21:42:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (669,'CUP_V_OI_TKI_Jacket2_02','general','1','4','item','[]','2019-07-17 21:42:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (670,'CUP_V_OI_TKI_Jacket2_03','general','1','4','item','[]','2019-07-17 21:42:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (671,'CUP_V_OI_TKI_Jacket2_06','general','1','4','item','[]','2019-07-17 21:43:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (672,'CUP_V_OI_TKI_Jacket2_04','general','1','4','item','[]','2019-07-17 21:43:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (673,'CUP_V_OI_TKI_Jacket6_01','general','1','4','item','[]','2019-07-17 21:43:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (674,'CUP_V_OI_TKI_Jacket6_03','general','1','4','item','[]','2019-07-17 21:43:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (675,'CUP_V_OI_TKI_Jacket6_06','general','1','4','item','[]','2019-07-17 21:43:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (676,'CUP_V_OI_TKI_Jacket6_02','general','1','4','item','[]','2019-07-17 21:43:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (677,'CUP_V_OI_TKI_Jacket6_05','general','1','4','item','[]','2019-07-17 21:43:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (678,'CUP_V_OI_TKI_Jacket6_04','general','1','4','item','[]','2019-07-17 21:43:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (679,'CUP_V_OI_TKI_Jacket3_01','general','1','4','item','[]','2019-07-17 21:43:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (680,'CUP_V_OI_TKI_Jacket3_06','general','1','4','item','[]','2019-07-17 21:43:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (681,'CUP_V_OI_TKI_Jacket3_05','general','1','4','item','[]','2019-07-17 21:43:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (682,'CUP_V_OI_TKI_Jacket3_03','general','1','4','item','[]','2019-07-17 21:43:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (683,'CUP_V_OI_TKI_Jacket3_02','general','1','4','item','[]','2019-07-17 21:44:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (684,'CUP_V_OI_TKI_Jacket3_04','general','1','4','item','[]','2019-07-17 21:44:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (685,'CUP_V_O_TK_OfficerBelt','general','1','4','item','[]','2019-07-17 21:44:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (686,'CUP_V_O_TK_OfficerBelt2','general','1','4','item','[]','2019-07-17 21:44:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (687,'CUP_V_OI_TKI_Jacket5_01','general','1','4','item','[]','2019-07-17 21:44:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (688,'CUP_V_OI_TKI_Jacket5_03','general','1','4','item','[]','2019-07-17 21:44:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (689,'CUP_V_OI_TKI_Jacket5_06','general','1','4','item','[]','2019-07-17 21:44:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (690,'CUP_V_OI_TKI_Jacket5_02','general','1','4','item','[]','2019-07-17 21:44:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (691,'CUP_V_OI_TKI_Jacket5_04','general','1','4','item','[]','2019-07-17 21:44:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (692,'CUP_V_OI_TKI_Jacket4_01','general','1','4','item','[]','2019-07-17 21:44:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (693,'CUP_V_OI_TKI_Jacket4_03','general','1','4','item','[]','2019-07-17 21:45:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (694,'CUP_V_OI_TKI_Jacket4_06','general','1','4','item','[]','2019-07-17 21:45:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (695,'CUP_V_OI_TKI_Jacket4_02','general','1','4','item','[]','2019-07-17 21:45:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (696,'CUP_V_OI_TKI_Jacket4_04','general','1','4','item','[]','2019-07-17 21:45:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (697,'CUP_V_OI_TKI_Jacket1_03','general','1','4','item','[]','2019-07-17 21:45:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (698,'CUP_V_OI_TKI_Jacket1_02','general','1','4','item','[]','2019-07-17 21:45:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (699,'CUP_V_OI_TKI_Jacket1_05','general','1','4','item','[]','2019-07-17 21:45:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (700,'CUP_V_OI_TKI_Jacket1_01','general','1','4','item','[]','2019-07-17 21:45:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (701,'CUP_V_OI_TKI_Jacket1_06','general','1','4','item','[]','2019-07-17 21:45:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (702,'CUP_V_OI_TKI_Jacket1_04','general','1','4','item','[]','2019-07-17 21:45:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (703,'CUP_V_O_TK_CrewBelt','general','1','4','item','[]','2019-07-17 21:45:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (704,'CUP_V_O_Ins_Carrier_Rig_Light','general','1','4','item','[]','2019-07-17 21:45:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (705,'V_Rangemaster_belt','general','1','4','item','[]','2019-07-17 21:45:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (706,'CUP_V_RUS_Smersh_1','general','1','4','item','[]','2019-07-17 21:46:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (707,'CUP_V_C_Police_Holster','general','1','4','item','[]','2019-07-17 21:46:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (708,'rhs_vest_pistol_holster','general','1','4','item','[]','2019-07-17 21:46:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (709,'V_BandollierB_blk','general','1','4','item','[]','2019-07-17 21:46:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (710,'V_BandollierB_oli','general','1','4','item','[]','2019-07-17 21:46:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (711,'V_BandollierB_khk','general','1','4','item','[]','2019-07-17 21:46:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (712,'V_BandollierB_rgr','general','1','4','item','[]','2019-07-17 21:46:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (713,'CUP_V_B_BAF_MTP_Osprey_Mk4_Webbing','general','1','4','item','[]','2019-07-17 21:46:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (714,'CUP_V_B_BAF_MTP_Osprey_Mk4_Belt','general','1','4','item','[]','2019-07-17 21:46:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (715,'CUP_V_I_RACS_Carrier_Rig_wdl_2','general','1','4','item','[]','2019-07-17 21:46:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (716,'CUP_V_I_RACS_Carrier_Rig_wdl_3','general','1','4','item','[]','2019-07-17 21:46:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (717,'CUP_V_B_GER_Carrier_Rig_2','general','1','4','item','[]','2019-07-17 21:46:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (718,'CUP_V_B_GER_Carrier_Rig','general','1','4','item','[]','2019-07-17 21:47:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (719,'CUP_V_I_RACS_Carrier_Rig_2','general','1','4','item','[]','2019-07-17 21:47:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (720,'CUP_V_I_RACS_Carrier_Rig_3','general','1','4','item','[]','2019-07-17 21:47:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (721,'CUP_V_B_GER_Carrier_Rig_3_Brown','general','1','4','item','[]','2019-07-17 21:47:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (722,'CUP_V_O_TK_Vest_1','general','1','4','item','[]','2019-07-17 21:47:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (723,'CUP_V_O_TK_Vest_2','general','1','4','item','[]','2019-07-17 21:47:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (724,'CUP_V_O_SLA_M23_1_OD','general','1','4','item','[]','2019-07-17 21:47:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (725,'CUP_V_O_SLA_M23_1_BRN','general','1','4','item','[]','2019-07-17 21:47:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (726,'rhs_vest_commander','general','1','4','item','[]','2019-07-17 21:47:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (727,'CUP_V_I_Guerilla_Jacket','general','1','4','item','[]','2019-07-17 21:47:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (728,'V_HarnessOGL_gry','general','1','4','item','[]','2019-07-17 21:47:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (729,'V_HarnessO_brn','general','1','4','item','[]','2019-07-17 21:47:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (730,'V_Chestrig_blk','general','1','4','item','[]','2019-07-17 21:47:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (731,'V_Chestrig_oli','general','1','4','item','[]','2019-07-17 21:47:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (732,'V_Chestrig_khk','general','1','4','item','[]','2019-07-17 21:47:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (733,'V_Chestrig_rgr','general','1','4','item','[]','2019-07-17 21:47:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (734,'CUP_V_CDF_CrewBelt','general','1','4','item','[]','2019-07-17 21:47:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (735,'CUP_V_CDF_OfficerBelt','general','1','4','item','[]','2019-07-17 21:47:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (736,'CUP_V_CDF_OfficerBelt2','general','1','4','item','[]','2019-07-17 21:48:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (737,'CUP_V_B_ALICE','general','1','4','item','[]','2019-07-17 21:48:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (738,'rhs_6sh92_vsr_vog','general','1','4','item','[]','2019-07-17 21:48:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (739,'rhs_6sh92_vsr_radio','general','1','4','item','[]','2019-07-17 21:48:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (740,'rhs_6sh92_vsr','general','1','4','item','[]','2019-07-17 21:48:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (741,'rhs_6sh92_digi_vog','general','1','4','item','[]','2019-07-17 21:48:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (742,'rhs_6sh92_digi','general','1','4','item','[]','2019-07-17 21:48:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (743,'rhs_6sh92','general','1','4','item','[]','2019-07-17 21:48:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (744,'rhs_6sh92_digi_radio','general','1','4','item','[]','2019-07-17 21:48:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (746,'H_Bandanna_blu','general','1','5','item','[]','2019-07-17 21:51:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (747,'CUP_H_FR_BandanaGreen','general','1','5','item','[]','2019-07-17 21:51:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (748,'H_Bandanna_sand','general','1','5','item','[]','2019-07-17 21:51:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (749,'H_Bandanna_gry','general','1','5','item','[]','2019-07-17 21:51:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (750,'H_Bandanna_surfer_grn','general','1','5','item','[]','2019-07-17 21:51:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (751,'H_Bandanna_surfer_blk','general','1','5','item','[]','2019-07-17 21:51:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (752,'H_Bandanna_camo','general','1','5','item','[]','2019-07-17 21:51:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (753,'CUP_H_FR_BandanaWdl','general','1','5','item','[]','2019-07-17 21:51:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (754,'rhs_beanie_green','general','1','5','item','[]','2019-07-17 21:52:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (755,'CUP_H_PMC_Beanie_Black','general','1','5','item','[]','2019-07-17 21:52:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (756,'CUP_H_C_Beanie_01','general','1','5','item','[]','2019-07-17 21:52:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (757,'CUP_H_C_Beanie_02','general','1','5','item','[]','2019-07-17 21:52:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (758,'CUP_H_C_Beanie_03','general','1','5','item','[]','2019-07-17 21:52:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (759,'CUP_H_C_Beanie_04','general','1','5','item','[]','2019-07-17 21:52:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (760,'rhs_beanie','general','1','5','item','[]','2019-07-17 21:52:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (761,'CUP_H_SLA_BeanieGreen','general','1','5','item','[]','2019-07-17 21:52:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (762,'CUP_H_PMC_Beanie_Khaki','general','1','5','item','[]','2019-07-17 21:52:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (763,'CUP_H_PMC_Beanie_Winter','general','1','5','item','[]','2019-07-17 21:52:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (764,'CUP_H_ChDKZ_Beanie','general','1','5','item','[]','2019-07-17 21:52:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (765,'CUP_H_C_Beret_04','general','1','5','item','[]','2019-07-17 21:52:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (766,'CUP_H_C_Beret_01','general','1','5','item','[]','2019-07-17 21:52:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (767,'CUP_H_C_Beret_02','general','1','5','item','[]','2019-07-17 21:52:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (768,'H_Beret_Colonel','general','1','1.1','item','[]','2019-07-17 21:52:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (769,'H_Booniehat_khk','general','1','5','item','[]','2019-07-17 21:52:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (770,'H_Booniehat_oli','general','1','5','item','[]','2019-07-17 21:52:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (771,'H_Booniehat_tan','general','1','5','item','[]','2019-07-17 21:52:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (772,'CUP_H_PMC_Cap_Burberry','general','1','5','item','[]','2019-07-17 21:53:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (773,'CUP_H_PMC_Cap_Grey','general','1','5','item','[]','2019-07-17 21:53:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (774,'CUP_H_C_MAGA_01','general','1','5','item','[]','2019-07-17 21:53:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (775,'CUP_H_PMC_Cap_Tan','general','1','5','item','[]','2019-07-17 21:53:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (776,'CUP_H_C_TrackIR_01','general','1','5','item','[]','2019-07-17 21:53:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (777,'CUP_H_PMC_Cap_Back_Burberry','general','1','5','item','[]','2019-07-17 21:53:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (778,'CUP_H_PMC_Cap_Back_Grey','general','1','5','item','[]','2019-07-17 21:53:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (779,'CUP_H_PMC_Cap_Back_Tan','general','1','5','item','[]','2019-07-17 21:53:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (780,'H_Hat_blue','general','1','5','item','[]','2019-07-17 21:53:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (781,'H_Hat_brown','general','1','5','item','[]','2019-07-17 21:53:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (782,'H_Hat_grey','general','1','5','item','[]','2019-07-17 21:53:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (783,'H_Hat_tan','general','1','5','item','[]','2019-07-17 21:53:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (784,'H_Hat_checker','general','1','5','item','[]','2019-07-17 21:53:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (785,'H_Hat_camo','general','1','5','item','[]','2019-07-17 21:53:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (786,'H_Bandanna_cbr','general','1','5','item','[]','2019-07-17 21:53:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (787,'H_Bandanna_sgg','general','1','5','item','[]','2019-07-17 21:53:45');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (788,'H_Bandanna_khk','general','1','5','item','[]','2019-07-17 21:53:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (789,'H_Bandanna_mcamo','general','1','5','item','[]','2019-07-17 21:54:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (790,'H_Bandanna_surfer','general','1','5','item','[]','2019-07-17 21:54:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (791,'H_Cap_grn_BI','general','1','5','item','[]','2019-07-17 21:54:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (792,'H_Cap_blk_CMMG','general','1','5','item','[]','2019-07-17 21:54:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (793,'H_Cap_blu','general','1','5','item','[]','2019-07-17 21:54:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (794,'H_Cap_grn','general','1','5','item','[]','2019-07-17 21:54:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (795,'H_Cap_tan','general','1','5','item','[]','2019-07-17 21:54:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (796,'H_Cap_blk_ION','general','1','5','item','[]','2019-07-17 21:54:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (797,'H_Cap_oli','general','1','5','item','[]','2019-07-17 21:54:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (798,'H_Cap_red','general','1','5','item','[]','2019-07-17 21:54:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (799,'H_Cap_blk','general','1','5','item','[]','2019-07-17 21:54:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (800,'H_Cap_surfer','general','1','5','item','[]','2019-07-17 21:54:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (801,'H_Cap_khaki_specops_UK','general','1','5','item','[]','2019-07-17 21:55:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (802,'H_Cap_tan_specops_US','general','1','5','item','[]','2019-07-17 21:55:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (803,'H_Cap_usblack','general','1','5','item','[]','2019-07-17 21:55:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (804,'H_Cap_blk_Raven','general','1','5','item','[]','2019-07-17 21:55:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (805,'H_Cap_brn_SPECOPS','general','1','5','item','[]','2019-07-17 21:55:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (806,'H_MM_Helmet_02','general','1','5','item','[]','2019-07-17 21:55:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (807,'H_StrawHat','general','1','5','item','[]','2019-07-17 21:56:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (808,'H_ShemagOpen_tan','general','1','5','item','[]','2019-07-17 21:56:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (809,'H_Shemag_olive_hs','general','1','5','item','[]','2019-07-17 21:56:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (810,'H_StrawHat_dark','general','1','5','item','[]','2019-07-17 21:56:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (811,'H_ShemagOpen_khk','general','1','5','item','[]','2019-07-17 21:56:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (812,'CUP_H_TK_Lungee','general','1','5','item','[]','2019-07-17 21:56:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (813,'CUP_H_TKI_Lungee_Open_01','general','1','5','item','[]','2019-07-17 21:57:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (814,'CUP_H_TKI_Lungee_Open_02','general','1','5','item','[]','2019-07-17 21:57:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (815,'CUP_H_TKI_Lungee_01','general','1','5','item','[]','2019-07-17 21:57:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (816,'CUP_H_TKI_Lungee_Open_03','general','1','5','item','[]','2019-07-17 21:57:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (817,'CUP_H_TKI_Lungee_Open_04','general','1','5','item','[]','2019-07-17 21:57:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (818,'CUP_H_TKI_Lungee_Open_05','general','1','5','item','[]','2019-07-17 21:57:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (819,'CUP_H_TKI_Lungee_Open_06','general','1','5','item','[]','2019-07-17 21:57:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (820,'CUP_H_TKI_Lungee_02','general','1','5','item','[]','2019-07-17 21:57:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (821,'CUP_H_TKI_Lungee_03','general','1','5','item','[]','2019-07-17 21:57:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (822,'CUP_H_TKI_Lungee_04','general','1','5','item','[]','2019-07-17 21:57:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (823,'CUP_H_TKI_Lungee_06','general','1','5','item','[]','2019-07-17 21:57:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (824,'CUP_H_TKI_Lungee_05','general','1','5','item','[]','2019-07-17 21:58:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (825,'CUP_H_TKI_Pakol_1_01','general','1','5','item','[]','2019-07-17 21:58:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (826,'CUP_H_TKI_Pakol_2_04','general','1','5','item','[]','2019-07-17 21:58:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (827,'CUP_H_TKI_Pakol_1_03','general','1','5','item','[]','2019-07-17 21:58:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (828,'CUP_H_TKI_Pakol_1_04','general','1','5','item','[]','2019-07-17 21:58:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (829,'CUP_H_TKI_Pakol_1_06','general','1','5','item','[]','2019-07-17 21:58:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (830,'CUP_H_TKI_Pakol_1_02','general','1','5','item','[]','2019-07-17 21:58:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (831,'CUP_H_TKI_Pakol_2_02','general','1','5','item','[]','2019-07-17 21:58:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (832,'CUP_H_C_Ushanka_04','general','1','5','item','[]','2019-07-17 21:59:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (833,'CUP_H_C_Ushanka_01','general','1','5','item','[]','2019-07-17 21:59:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (834,'CUP_H_C_Ushanka_02','general','1','5','item','[]','2019-07-17 21:59:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (835,'CUP_H_C_Ushanka_03','general','1','5','item','[]','2019-07-17 21:59:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (836,'CUP_H_TK_TankerHelmet','general','1','5','item','[]','2019-07-17 21:59:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (837,'rhs_tsh4','general','1','5','item','[]','2019-07-17 21:59:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (838,'CUP_H_SLA_TankerHelmet','general','1','5','item','[]','2019-07-17 21:59:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (839,'CUP_H_RUS_TSH_4_Brown','general','1','5','item','[]','2019-07-17 21:59:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (840,'CUP_H_TKI_Pakol_2_03','general','1','5','item','[]','2019-07-17 21:59:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (841,'BL_medieval_hat','general','1','1.1','item','[]','2019-07-17 22:01:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (842,'CUP_PMC_G_thug','general','1','1.05','item','[]','2019-07-17 22:02:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (843,'G_Bandanna_beast','general','1','3','item','[]','2019-07-17 22:02:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (844,'G_Bandanna_tan','general','1','3','item','[]','2019-07-17 22:02:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (845,'G_Bandanna_khk','general','1','3','item','[]','2019-07-17 22:02:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (846,'G_Bandanna_oli','general','1','3','item','[]','2019-07-17 22:02:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (847,'G_Bandanna_aviator','general','1','3','item','[]','2019-07-17 22:02:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (848,'G_Bandanna_sport','general','1','3','item','[]','2019-07-17 22:02:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (849,'G_Lady_Blue','general','1','3','item','[]','2019-07-17 22:02:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (850,'G_Lowprofile','general','1','3','item','[]','2019-07-17 22:03:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (851,'G_Sport_Greenblack','general','1','3','item','[]','2019-07-17 22:03:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (852,'G_Sport_Blackred','general','1','3','item','[]','2019-07-17 22:03:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (853,'G_Sport_Checkered','general','1','3','item','[]','2019-07-17 22:03:29');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (854,'G_Sport_BlackWhite','general','1','3','item','[]','2019-07-17 22:03:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (855,'G_Sport_Blackyellow','general','1','3','item','[]','2019-07-17 22:03:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (856,'G_Sport_Red','general','1','3','item','[]','2019-07-17 22:03:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (857,'G_Shades_Black','general','1','3','item','[]','2019-07-17 22:03:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (858,'G_Shades_Red','general','1','3','item','[]','2019-07-17 22:03:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (859,'G_Shades_Green','general','1','3','item','[]','2019-07-17 22:04:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (860,'G_Shades_Blue','general','1','3','item','[]','2019-07-17 22:04:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (861,'CUP_FR_NeckScarf4','general','1','3','item','[]','2019-07-17 22:04:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (862,'CUP_FR_NeckScarf2','general','1','3','item','[]','2019-07-17 22:04:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (863,'CUP_FR_NeckScarf','general','1','3','item','[]','2019-07-17 22:04:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (864,'CUP_FR_NeckScarf3','general','1','3','item','[]','2019-07-17 22:04:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (865,'rhs_scarf','general','1','3','item','[]','2019-07-17 22:04:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (866,'G_Squares_Tinted','general','1','3','item','[]','2019-07-17 22:04:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (867,'G_Squares','general','1','3','item','[]','2019-07-17 22:04:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (868,'CUP_G_Oakleys_Embr','general','1','3','item','[]','2019-07-17 22:04:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (869,'CUP_G_Oakleys_Drk','general','1','3','item','[]','2019-07-17 22:04:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (870,'CUP_G_Oakleys_Clr','general','1','3','item','[]','2019-07-17 22:04:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (871,'CUP_TK_NeckScarf','general','1','3','item','[]','2019-07-17 22:04:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (872,'G_Spectacles_Tinted','general','1','3','item','[]','2019-07-17 22:04:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (873,'G_Spectacles','general','1','3','item','[]','2019-07-17 22:04:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (874,'G_Aviator','general','1','3','item','[]','2019-07-17 22:04:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (875,'CUP_G_PMC_Facewrap_Winter_Glasses_Dark','general','1','3','item','[]','2019-07-17 22:04:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (876,'CUP_G_PMC_Facewrap_Winter_Glasses_Ember','general','1','3','item','[]','2019-07-17 22:05:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (877,'CUP_G_PMC_Facewrap_Black_Glasses_Dark','general','1','3','item','[]','2019-07-17 22:05:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (878,'CUP_G_PMC_Facewrap_Black_Glasses_Ember','general','1','3','item','[]','2019-07-17 22:05:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (879,'CUP_PMC_Facewrap_Ranger','general','1','3','item','[]','2019-07-17 22:05:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (880,'CUP_PMC_Facewrap_Skull','general','1','3','item','[]','2019-07-17 22:05:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (881,'CUP_PMC_Facewrap_Smilie','general','1','3','item','[]','2019-07-17 22:05:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (882,'CUP_PMC_Facewrap_Tan','general','1','3','item','[]','2019-07-17 22:05:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (883,'CUP_G_PMC_Facewrap_Tan_Glasses_Ember','general','1','3','item','[]','2019-07-17 22:05:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (884,'CUP_G_PMC_Facewrap_Tan_Glasses_Dark','general','1','3','item','[]','2019-07-17 22:05:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (885,'CUP_PMC_Facewrap_Tropical','general','1','3','item','[]','2019-07-17 22:05:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (886,'CUP_G_PMC_Facewrap_Tropical_Glasses_Dark','general','1','3','item','[]','2019-07-17 22:05:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (887,'CUP_G_PMC_Facewrap_Tropical_Glasses_Ember','general','1','3','item','[]','2019-07-17 22:05:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (888,'CUP_PMC_Facewrap_Black','general','1','3','item','[]','2019-07-17 22:05:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (889,'G_Bandanna_shades','general','1','3','item','[]','2019-07-17 22:05:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (890,'CUP_PMC_Facewrap_Winter','general','1','3','item','[]','2019-07-17 22:05:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (891,'ItemCompass','general','1','40','item','[]','2019-07-17 22:07:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (892,'ItemMap','general','1','40','item','[]','2019-07-17 22:07:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (893,'ItemGPS','general','1','25','item','[]','2019-07-17 22:07:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (894,'ItemWatch','general','1','40','item','[]','2019-07-17 22:08:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (895,'valor_bakedbeans','general','1','20','item','[]','2019-07-17 22:08:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (896,'valor_bandage','general','1','40','item','[]','2019-07-17 22:08:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (897,'valor_can_dented','general','1','15','item','[]','2019-07-17 22:08:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (898,'valor_can_v2','general','1','20','item','[]','2019-07-17 22:08:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (899,'valor_can_v3','general','1','20','item','[]','2019-07-17 22:08:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (900,'valor_can_rusty','general','1','15','item','[]','2019-07-17 22:09:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (901,'valor_can_v1','general','1','20','item','[]','2019-07-17 22:09:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (902,'valor_canteen','general','1','20','item','[]','2019-07-17 22:09:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (903,'valor_cerealsbox','general','1','20','item','[]','2019-07-17 22:09:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (904,'valor_ducttape','general','1','20','item','[]','2019-07-17 22:09:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (905,'FirstAidKit','general','1','35','item','[]','2019-07-17 22:09:32');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (906,'valor_orange_01','general','1','20','item','[]','2019-07-17 22:09:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (907,'valor_ricebox','general','1','20','item','[]','2019-07-17 22:09:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (908,'valor_bottleplastic_v2','general','1','20','item','[]','2019-07-17 22:09:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (909,'valor_tacticalbacon','general','1','20','item','[]','2019-07-17 22:09:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (910,'Binocular','general','1','30','item','[]','2019-07-17 22:09:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (911,'CUP_B_ACRScout_m95','general','1','20','backpack','[]','2019-07-17 22:10:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (912,'CUP_B_AlicePack_Khaki','general','1','10','backpack','[]','2019-07-17 22:11:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (913,'CUP_B_AlicePack_OD','general','1','10','backpack','[]','2019-07-17 22:11:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (914,'CUP_B_AlicePack_Bedroll','general','1','10','backpack','[]','2019-07-17 22:11:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (915,'B_AssaultPack_cbr','general','1','14','backpack','[]','2019-07-17 22:11:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (916,'B_AssaultPack_rgr','general','1','14','backpack','[]','2019-07-17 22:11:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (917,'B_AssaultPack_sgg','general','1','14','backpack','[]','2019-07-17 22:11:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (918,'B_AssaultPack_blk','general','1','14','backpack','[]','2019-07-17 22:11:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (919,'B_LegStrapBag_coyote_F','general','1','22','backpack','[]','2019-07-17 22:12:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (920,'B_LegStrapBag_olive_F','general','1','22','backpack','[]','2019-07-17 22:12:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (921,'B_LegStrapBag_black_F','general','1','22','backpack','[]','2019-07-17 22:12:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (922,'CUP_B_Bergen_BAF','general','1','12','backpack','[]','2019-07-17 22:12:31');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (923,'rhs_sidor','general','1','20','backpack','[]','2019-07-17 22:12:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (924,'rhs_medic_bag','general','1','20','backpack','[]','2019-07-17 22:12:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (925,'CUP_B_CivPack_WDL','general','1','12','backpack','[]','2019-07-17 22:13:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (926,'B_FieldPack_cbr','general','1','14','backpack','[]','2019-07-17 22:13:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (927,'B_FieldPack_khk','general','1','14','backpack','[]','2019-07-17 22:13:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (928,'B_FieldPack_oli','general','1','14','backpack','[]','2019-07-17 22:13:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (929,'B_Carryall_oli','general','1','1.5','backpack','[]','2019-07-17 22:13:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (930,'B_Carryall_khk','general','1','1.5','backpack','[]','2019-07-17 22:13:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (931,'B_Carryall_cbr','general','1','1.5','backpack','[]','2019-07-17 22:14:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (932,'CUP_B_HikingPack_Civ','general','1','10','backpack','[]','2019-07-17 22:14:15');


/*
-- Query: SELECT * FROM valor.loottable_houses
-- Date: 2019-08-20 22:30
*/
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (100,'Land_Misc_deerstand','farming','2019-07-16 14:35:53');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (101,'Land_Hlidac_budka','l_military','2019-07-16 14:37:03');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (102,'Land_Ind_Workshop01_01','industrial','2019-07-16 14:37:14');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (103,'Land_Ind_Workshop01_03','industrial','2019-07-16 14:37:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (104,'Land_Mil_Guardhouse','l_military','2019-07-16 14:37:47');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (105,'Land_Ind_Workshop01_04','industrial','2019-07-16 14:37:57');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (106,'Land_R_Barn_W_01','farming','2019-07-16 14:38:08');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (107,'Land_Ind_Workshop01_L','industrial','2019-07-16 14:38:13');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (108,'Land_SY_01_conveyor_end_F','industrial','2019-07-16 14:38:29');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (109,'Land_chz_janov_boudicka','industrial','2019-07-16 14:38:52');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (110,'Land_Shed_Ind02_dam','industrial','2019-07-16 14:39:02');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (111,'Land_Bunker_01_big_F','l_military','2019-07-16 14:40:25');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (112,'Land_Stan_east','l_military','2019-07-16 14:40:33');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (113,'Land_GeneralStore_01a_PMC','food','2019-07-16 14:40:58');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (114,'Land_FuelStation_Build_F','industrial','2019-07-16 14:41:12');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (115,'Land_Vez_svetla','l_military','2019-07-16 14:41:49');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (116,'Land_Barrack2','l_military','2019-07-16 14:41:56');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (117,'Land_Misc_PowerStation','industrial','2019-07-16 14:42:17');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (118,'Land_Walkover_01_F','industrial','2019-07-16 14:42:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (119,'Land_TTowerBig_2_F','l_military','2019-07-16 14:42:57');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (120,'Land_SCF_01_condenser_F','industrial','2019-07-16 14:43:04');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (121,'Land_Bunker_01_HQ_F','l_military','2019-07-16 14:43:31');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (122,'Land_Hlidac_Budka_EP1','l_military','2019-07-16 14:43:44');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (123,'Land_ReservoirTank_01_military_F','industrial','2019-07-16 14:43:53');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (124,'Land_Bunker_01_tall_F','l_military','2019-07-16 14:43:58');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (125,'Land_Stodola_open','farming','2019-07-16 14:44:16');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (126,'Land_Tovarna1','industrial','2019-07-16 14:44:17');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (127,'Land_Ind_Garage01','industrial','2019-07-16 14:44:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (128,'Land_Sara_stodola','farming','2019-07-16 14:45:10');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (129,'Land_Shed_W01','industrial','2019-07-16 14:45:44');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (130,'Land_Hut06','industrial','2019-07-16 14:45:53');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (131,'Land_Shed_M01','industrial','2019-07-16 14:46:09');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (132,'Land_Shed_W02','industrial','2019-07-16 14:46:46');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (133,'Land_Hut_old02','farming','2019-07-16 14:46:56');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (134,'Land_Stodola_old_open','farming','2019-07-16 14:47:12');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (135,'Land_Shed_W03','industrial','2019-07-16 14:47:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (136,'Land_A_GeneralStore_01','food','2019-07-16 14:47:29');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (137,'Land_FuelStation_02_workshop_F','industrial','2019-07-16 14:47:37');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (138,'Land_Barn_Metal','industrial','2019-07-16 14:47:42');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (139,'Land_Barn_W_02','farming','2019-07-16 14:47:59');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (140,'Land_Shed_W4','farming','2019-07-16 14:48:11');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (141,'Land_Ind_Workshop01_02','industrial','2019-07-16 14:48:12');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (142,'Land_Barn_W_01','farming','2019-07-16 14:48:17');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (143,'Land_Farm_Cowshed_a','farming','2019-07-16 14:48:28');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (144,'Land_Repair_center','industrial','2019-07-16 14:48:32');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (145,'Land_Farm_Cowshed_b','farming','2019-07-16 14:48:38');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (146,'Land_Farm_Cowshed_c','farming','2019-07-16 14:48:42');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (147,'Land_Sara_stodola2','farming','2019-07-16 14:48:48');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (148,'Land_Nasypka','industrial','2019-07-16 14:48:58');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (149,'Land_A_GeneralStore_01a','food','2019-07-16 14:49:18');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (150,'Land_Shed_03_F','industrial','2019-07-16 14:49:28');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (151,'Land_hopper_old_PMC','industrial','2019-07-16 14:49:34');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (152,'Land_A_FuelStation_Build','industrial','2019-07-16 14:49:40');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (153,'Land_Vysilac_FM','l_military','2019-07-16 14:49:54');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (154,'Land_Misc_Cargo1Bo','industrial','2019-07-16 14:50:00');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (155,'Land_A_Castle_Bergfrit','l_military','2019-07-16 14:50:13');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (156,'Land_A_Castle_Gate','l_military','2019-07-16 14:50:18');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (157,'Land_Fort_Watchtower','l_military','2019-07-16 14:51:01');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (158,'Land_Vez','l_military','2019-07-16 14:51:06');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (159,'Land_water_tank','industrial','2019-07-16 14:51:11');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (160,'Land_A_BuildingWIP','industrial','2019-07-16 14:51:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (161,'Land_A_Castle_Donjon','l_military','2019-07-16 14:51:28');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (162,'Land_Shed_Ind02','industrial','2019-07-16 14:51:33');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (163,'Land_Leseni4x','industrial','2019-07-16 14:51:42');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (164,'Land_Ss_hangar','m_military','2019-07-16 14:51:55');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (165,'Land_Leseni2x','industrial','2019-07-16 14:52:01');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (166,'Land_MASH','medical','2019-07-16 14:52:14');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (167,'Land_Stan','l_military','2019-07-16 14:52:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (168,'Land_fortified_nest_small','l_military','2019-07-16 14:52:31');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (169,'Land_mash_ep1','medical','2019-07-16 14:52:37');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (170,'Land_Shed_wooden','industrial','2019-07-16 14:52:46');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (171,'Land_i_Shed_Ind_F','industrial','2019-07-16 14:52:53');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (172,'Land_WIP_F','industrial','2019-07-16 14:53:05');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (173,'Land_Crane_F','industrial','2019-07-16 14:53:10');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (174,'Land_Mil_House','m_military','2019-07-16 14:53:56');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (175,'Land_A_Hospital','medical','2019-07-16 14:54:04');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (176,'Land_Ind_Pec_03','industrial','2019-07-16 14:54:13');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (177,'Land_u_Barracks_V2_F','h_military','2019-07-16 14:54:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (178,'Land_Misc_Cargo1Ao','industrial','2019-07-16 14:54:43');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (179,'Land_a_stationhouse','firestation','2019-07-16 14:54:56');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (180,'Land_Mil_ControlTower','m_military','2019-07-16 14:55:12');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (181,'Land_Ind_IlluminantTower','l_military','2019-07-16 14:55:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (182,'Land_Komin','industrial','2019-07-16 14:55:30');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (183,'Land_Barn_01_grey_F','farming','2019-07-16 14:55:46');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (184,'Land_Mil_Barracks_i','h_military','2019-07-16 14:56:13');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (185,'Land_Shed_W03_EP1','industrial','2019-07-16 14:56:28');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (186,'Land_Mil_Barracks','h_military','2019-07-16 14:57:31');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (187,'Land_Hangar_F','m_military','2019-07-16 14:57:53');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (188,'Land_Farm_Cowshed_a_dam','farming','2019-07-16 14:58:11');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (189,'Land_Farm_Cowshed_b_dam','farming','2019-07-16 14:58:18');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (190,'Land_GuardShed','industrial','2019-07-16 14:58:42');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (191,'Land_Farm_Cowshed_c_dam','farming','2019-07-16 14:58:45');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (192,'Land_Cargo_Patrol_V1_F','m_military','2019-07-16 14:59:03');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (193,'Land_Hangar_2','industrial','2019-07-16 14:59:12');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (194,'Land_Market_stalls_01_EP1','food','2019-07-16 14:59:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (195,'Land_Market_stalls_02_EP1','food','2019-07-16 14:59:28');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (196,'Land_Misc_Scaffolding','industrial','2019-07-16 14:59:37');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (197,'Land_SM_01_shed_F','industrial','2019-07-16 14:59:41');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (198,'Land_Misc_Cargo1Bo_EP1','industrial','2019-07-16 14:59:45');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (199,'Land_Tovarna2','industrial','2019-07-16 14:59:50');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (200,'Land_SCF_01_storageBin_medium_F','industrial','2019-07-16 14:59:55');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (201,'Land_MobileCrane_01_F','industrial','2019-07-16 15:00:01');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (202,'Land_Ind_PowerStation_EP1','industrial','2019-07-16 15:00:07');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (203,'Land_Ind_Expedice_3','industrial','2019-07-16 15:00:11');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (204,'Land_SCF_01_crystallizer_F','industrial','2019-07-16 15:00:15');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (205,'Land_Ind_Expedice_1','industrial','2019-07-16 15:00:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (206,'Land_SCF_01_feeder_F','industrial','2019-07-16 15:00:28');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (207,'Land_Misc_CargoMarket1a_EP1','industrial','2019-07-16 15:00:32');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (208,'Land_SCF_01_storageBin_small_F','industrial','2019-07-16 15:00:36');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (209,'Land_SCF_01_warehouse_F','industrial','2019-07-16 15:01:03');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (210,'Land_Airport_01_hangar_F','m_military','2019-07-16 15:01:17');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (211,'Land_SCF_01_crystallizerTowers_F','industrial','2019-07-16 15:01:25');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (212,'Land_SCF_01_generalBuilding_F','industrial','2019-07-16 15:01:36');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (213,'Land_FuelStation_01_workshop_F','industrial','2019-07-16 15:01:53');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (214,'Land_SCF_01_chimney_F','industrial','2019-07-16 15:02:01');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (215,'Land_SCF_01_storageBin_big_F','industrial','2019-07-16 15:02:07');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (216,'Land_SCF_01_boilerBuilding_F','industrial','2019-07-16 15:02:13');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (217,'Land_SCF_01_diffuser_F','industrial','2019-07-16 15:02:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (218,'Land_SCF_01_clarifier_F','industrial','2019-07-16 15:02:28');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (219,'Land_ind_silomale','industrial','2019-07-16 15:02:33');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (220,'Land_Vez_Silo','industrial','2019-07-16 15:02:36');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (221,'Land_Ind_Vysypka','industrial','2019-07-16 15:02:40');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (222,'Land_A_Crane_02b','industrial','2019-07-16 15:03:00');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (223,'Land_A_TVTower_Base','h_military','2019-07-16 15:03:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (224,'Land_A_TVTower_Top','h_military','2019-07-16 15:03:33');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (225,'Land_A_Crane_02a','industrial','2019-07-16 15:03:47');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (226,'Land_Shed_M01_EP1','industrial','2019-07-16 15:04:00');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (227,'Land_Garaz','industrial','2019-07-16 15:04:15');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (228,'Land_Ind_TankBig','industrial','2019-07-16 15:04:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (229,'Land_dp_mainFactory_F','industrial','2019-07-16 15:04:32');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (230,'Land_Misc_Cargo1Eo_EP1','industrial','2019-07-16 15:04:36');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (231,'Land_Ind_Pec_03b','industrial','2019-07-16 15:04:41');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (232,'Land_wagon_flat','industrial','2019-07-16 15:05:02');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (233,'Land_chz_train_vagon_01_open_br1','industrial','2019-07-16 15:05:08');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (234,'Land_Dam_ConcP_20','industrial','2019-07-16 15:05:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (235,'Land_Ind_MalyKomin','industrial','2019-07-16 15:05:50');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (236,'Land_Ind_Stack_Big','industrial','2019-07-16 15:05:58');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (237,'Land_wagon_box','industrial','2019-07-16 15:06:07');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (238,'Land_chz_train_vagon_02_open_br1','industrial','2019-07-16 15:06:11');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (239,'Land_Ind_Quarry','industrial','2019-07-16 15:06:17');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (240,'Land_Unfinished_Building_01_F','industrial','2019-07-16 15:06:27');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (241,'Land_Ind_Pec_03a','industrial','2019-07-16 15:07:13');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (242,'Land_Com_tower_ep1','l_military','2019-07-16 15:07:36');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (243,'Land_wagon_tanker','industrial','2019-07-16 15:07:42');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (244,'Land_Telek1','l_military','2019-07-16 15:07:47');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (245,'Land_Mil_House_EP1','m_military','2019-07-16 15:07:55');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (246,'Land_HouseV2_03_dam','industrial','2019-07-16 15:08:06');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (247,'Land_Watertower1','industrial','2019-07-16 15:08:25');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (248,'Land_Budova5','l_military','2019-07-16 15:08:34');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (249,'Land_chz_sj_pristav_02','industrial','2019-07-16 15:08:50');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (250,'Land_cmp_Tower_F','industrial','2019-07-16 15:08:56');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (251,'Land_Misc_Cargo1Ao_EP1','industrial','2019-07-16 15:09:01');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (252,'Land_Ind_Coltan_Main_EP1','industrial','2019-07-16 15:09:12');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (253,'Land_Ind_SiloVelke_02','industrial','2019-07-16 15:09:17');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (254,'Land_Ind_Mlyn_03','industrial','2019-07-16 15:09:20');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (255,'Land_Ind_SiloVelke_01','industrial','2019-07-16 15:09:26');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (256,'Land_Ind_Pec_01','industrial','2019-07-16 15:09:30');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (257,'Land_Ind_Mlyn_01','industrial','2019-07-16 15:09:35');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (258,'Land_FireEscape_01_short_F','industrial','2019-07-16 15:09:44');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (259,'Land_Mil_ControlTower_EP1','m_military','2019-07-16 15:09:54');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (260,'Land_Airport_02_hangar_right_F','m_military','2019-07-16 15:10:04');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (261,'Land_Airport_02_hangar_left_F','m_military','2019-07-16 15:10:10');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (262,'Land_A_GeneralStore_01a_dam','food','2019-07-16 15:10:16');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (263,'Land_tent_west','l_military','2019-07-16 15:10:25');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (264,'Land_dp_smallTank_F','industrial','2019-07-16 15:10:40');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (265,'Land_A_CraneCon','industrial','2019-07-16 15:10:44');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (266,'Land_Ind_Oil_Tower_EP1','industrial','2019-07-16 15:11:03');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (267,'Land_chz_skladoleju_06_06','l_military','2019-07-16 15:11:15');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (268,'Land_Mil_ControlTower_dam','m_military','2019-07-16 15:11:29');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (269,'Land_A_Stationhouse_ep1','firestation','2019-07-16 15:11:46');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (270,'Land_Strazni_vez','l_military','2019-07-16 15:12:24');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (271,'C130J_wreck_EP1','l_military','2019-07-16 15:12:45');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (272,'Land_WaterTower_01_F','industrial','2019-07-16 15:13:04');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (273,'Land_Cargo_Patrol_V2_F','l_military','2019-07-16 15:13:34');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (274,'Land_Cargo_House_V2_F','l_military','2019-07-16 15:13:41');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (275,'Land_Cargo_HQ_V2_F','m_military','2019-07-16 15:13:48');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (276,'Land_FireEscape_01_tall_F','industrial','2019-08-20 22:30:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (277,'Land_bouda_plech_open','industrial','2019-08-20 22:30:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (278,'Land_chr_tent_01','m_military','2019-08-20 22:30:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (279,'Land_chr_tent_east','m_military','2019-08-20 22:30:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (280,'Land_Posed','l_military','2019-08-20 22:30:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (281,'Land_chr_tent_03','m_military','2019-08-20 22:30:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (282,'Land_chr_tent_med','medical','2019-08-20 22:30:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (283,'Land_chr_tent_01_white','medical','2019-08-20 22:30:21');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (284,'Land_chr_tent_03_white','medical','2019-08-20 22:30:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (285,'Land_Barracks_01_dilapidated_F','h_military','2019-08-20 22:30:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (286,'Land_chr_tent_02_white','medical','2019-08-20 22:30:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (287,'Land_chr_tent_01_bio','m_military','2019-08-20 22:30:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (288,'Land_chr_tent_02_bio','m_military','2019-08-20 22:30:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (289,'Land_chr_tent_bio','m_military','2019-08-20 22:30:22');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (290,'Land_chr_tent_02_cross','m_military','2019-08-20 22:30:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (291,'Land_chr_tent_01_cross','m_military','2019-08-20 22:30:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (292,'Land_Budova4_in','h_military','2019-08-20 22:30:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (293,'Land_ReservoirTank_Rust_F','industrial','2019-08-20 22:30:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (294,'Land_chr_tent_03_bio','m_military','2019-08-20 22:30:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (295,'Land_chr_tent_field_hospital_bio','m_military','2019-08-20 22:30:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (296,'Land_chr_tent_02','m_military','2019-08-20 22:30:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (297,'Land_chr_tent_03_cross','m_military','2019-08-20 22:30:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (298,'Land_Mil_Repair_center_EP1','industrial','2019-08-20 22:30:23');
INSERT INTO `loottable_houses` (`uid`,`classname`,`table_type`,`insert_time`) VALUES (299,'Land_chr_garage','industrial','2019-08-20 22:30:24');




























/*
-- Query: SELECT * FROM valor.players
-- Date: 2019-08-24 20:42
*/
INSERT INTO `players` (`uid`,`name`,`pid`,`coplevel`,`cash`,`bankacc`,`xp`,`level`,`humanity`,`gear`,`gear_cop`,`quests`,`stats`,`stats_cop`,`adminlevel`,`donatorlevel`,`alive`,`arrested`,`alive_cop`,`position`,`position_cop`,`Map`,`playtime`,`online`,`application`,`insert_time`,`last_seen`) VALUES (13,'Nico','76561198252584662','5',0,5000,0,0,3500,'\"[`CUP_U_O_RUS_EMR_1`,``,`CUP_hgun_BallisticShield_Armed`,[``,``,``,``],[`CUP_15Rnd_9x19_M9`],``,[``,``,``,``],[],``,[``,``,``,``],[],[`CUP_15Rnd_9x19_M9`,`CUP_15Rnd_9x19_M9`,`CUP_15Rnd_9x19_M9`,`CUP_15Rnd_9x19_M9`,`CUP_15Rnd_9x19_M9`,`CUP_15Rnd_9x19_M9`],`CUP_V_CZ_vest07`,[],`rhs_altyn_bala`,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemRadio`,`ItemGPS`,`Laserdesignator_01_khk_F`],[]]\"','\"[`rhs_uniform_emr_patchless`,`CUP_B_HikingPack_Civ`,``,[``,``,``,``],[],``,[``,``,``,``],[],``,[``,``,``,``],[],[`valor_tankboresighter_01`],`CUP_V_RUS_6B45_2`,[],`CUP_H_SLA_SLCap`,`G_Bandanna_khk`,[`ItemMap`],[]]\"',NULL,'\"[10,100,0,12000]\"','\"[44,100,0,12000]\"','5','0',1,0,1,'\"[[3848.33,8878.18,0.00143433],167.892]\"','\"[[3843.62,8872.42,0.903809],216.405]\"','','144',0,0,'2019-07-13 15:01:30','2019-07-21 17:53:27');
INSERT INTO `players` (`uid`,`name`,`pid`,`coplevel`,`cash`,`bankacc`,`xp`,`level`,`humanity`,`gear`,`gear_cop`,`quests`,`stats`,`stats_cop`,`adminlevel`,`donatorlevel`,`alive`,`arrested`,`alive_cop`,`position`,`position_cop`,`Map`,`playtime`,`online`,`application`,`insert_time`,`last_seen`) VALUES (14,'Armin Papperger','76561198000771544','5',0,489000,0,0,3500,'\"[`CUP_U_O_Partisan_TTsKO`,``,``,[``,``,``,``],[],``,[``,``,``,``],[],``,[``,``,``,``],[],[],``,[],``,``,[`ItemMap`],[]]\"','\"[`rhs_uniform_emr_patchless`,``,``,[``,``,``,``],[],``,[``,``,``,``],[],``,[``,``,``,``],[],[],`CUP_V_C_Police_Holster`,[`MadArmA_Revolver_01`],`CUP_H_SLA_OfficerCap`,`G_Aviator`,[`ItemGPS`],[]]\"',NULL,'\"[-50,100,0,12000]\"','\"[88,100,0,12000]\"','5','0',1,0,1,'\"[[4659.76,10051.9,0.00143433],294.978]\"','\"[[11370.1,4720.26,0.00190735],9.14634]\"','\"1111111111111111111011111111111111111111111111111111111111101111111111111110110111111110111101111111111001111111111111111111111111111111111111111111111111111111111111111111011111111111111110101111111111111111111111111111111101111111111111111111111111111111111111111111111111111111111111111\"','459',0,0,'2019-07-14 15:25:12','2019-08-19 20:45:56');
INSERT INTO `players` (`uid`,`name`,`pid`,`coplevel`,`cash`,`bankacc`,`xp`,`level`,`humanity`,`gear`,`gear_cop`,`quests`,`stats`,`stats_cop`,`adminlevel`,`donatorlevel`,`alive`,`arrested`,`alive_cop`,`position`,`position_cop`,`Map`,`playtime`,`online`,`application`,`insert_time`,`last_seen`) VALUES (15,'Seth Davenport','76561198030438715','5',0,0,0,0,3500,'\"[`CUP_U_B_US_BDU_roll2_glove`,`CUP_B_HikingPack_Civ`,`CUP_glaunch_6G30`,[``,``,``,``],[`CUP_6Rnd_HE_GP25_M`],``,[``,``,``,``],[],`MadArmA_Execution`,[``,``,``,``],[`2Rnd_127x108_Mag`],[`10Rnd_127x54_Mag`,`10Rnd_127x54_Mag`,`10Rnd_127x54_Mag`],`V_PlateCarrier1_rgr`,[`Binocular`],``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],[]]\"','\"[``,``,``,[``,``,``,``],[],``,[``,``,``,``],[],``,[``,``,``,``],[],[],``,[],``,`CUP_PMC_G_thug`,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`,`Rangefinder`],[]]\"',NULL,'\"[-663,100,0,12000]\"','\"[-32,100,0,12000]\"','5','0',1,0,1,'\"[[3844.34,8876.52,0.903809],213.551]\"','\"[[4648.1,10091.6,0.00143433],170.79]\"','','846',0,0,'2019-07-14 17:52:36','2019-07-21 17:51:59');
INSERT INTO `players` (`uid`,`name`,`pid`,`coplevel`,`cash`,`bankacc`,`xp`,`level`,`humanity`,`gear`,`gear_cop`,`quests`,`stats`,`stats_cop`,`adminlevel`,`donatorlevel`,`alive`,`arrested`,`alive_cop`,`position`,`position_cop`,`Map`,`playtime`,`online`,`application`,`insert_time`,`last_seen`) VALUES (18,'Barney','76561198018512569','5',0,419000,7160,15,3500,'\"[`CUP_U_O_TK_Green`,`B_AssaultPack_rgr`,`CUP_lmg_minimi`,[``,``,``,``],[`CUP_200Rnd_TE4_Red_Tracer_556x45_M249`],``,[``,``,``,``],[],``,[``,``,``,``],[],[`valor_Raptor_Egg`,`valor_tankboresighter_01`],`V_PlateCarrier1_wdl`,[`CUP_200Rnd_TE4_Red_Tracer_556x45_M249`],`H_Booniehat_khk_hs`,``,[`ItemMap`,`ItemCompass`],[`CUP_200Rnd_TE4_Red_Tracer_556x45_M249`]]\"','\"[`rhs_uniform_emr_patchless`,`CUP_B_HikingPack_Civ`,`CUP_srifle_M14_DMR`,[``,``,`optic_SOS`,``],[`CUP_20Rnd_762x51_DMR`],``,[``,``,``,``],[],``,[``,``,``,``],[],[],`CUP_V_RUS_6B45_2`,[],`BL_eimer_Hat`,`G_Bandanna_khk`,[`ItemMap`],[]]\"',NULL,'\"[-2302,100,0,12000]\"','\"[-219,100,0,12000]\"','5','0',1,0,1,'\"[[3792.05,8839.25,0.00143433],180.196]\"','\"[[7894.26,8389.34,0.00164795],132.636]\"','','2409',0,0,'2019-07-17 00:52:01','2019-08-24 15:50:18');
INSERT INTO `players` (`uid`,`name`,`pid`,`coplevel`,`cash`,`bankacc`,`xp`,`level`,`humanity`,`gear`,`gear_cop`,`quests`,`stats`,`stats_cop`,`adminlevel`,`donatorlevel`,`alive`,`arrested`,`alive_cop`,`position`,`position_cop`,`Map`,`playtime`,`online`,`application`,`insert_time`,`last_seen`) VALUES (19,'Inch','76561198158204122','5',0,0,0,0,3500,'\"[]\"','\"[]\"',NULL,'\"[74,100,0,12000]\"','[100,100,0,12000]','5','0',1,0,1,'\"[[5154.07,7563.07,0.00128174],305.995]\"','[]','\"1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111011111111111111111111111111111111111111111111111111111011111111111011111111111111101111111111111111111111111111111111111111111111111111111111111\"','15',0,0,'2019-07-20 16:41:38','2019-08-10 16:12:19');
INSERT INTO `players` (`uid`,`name`,`pid`,`coplevel`,`cash`,`bankacc`,`xp`,`level`,`humanity`,`gear`,`gear_cop`,`quests`,`stats`,`stats_cop`,`adminlevel`,`donatorlevel`,`alive`,`arrested`,`alive_cop`,`position`,`position_cop`,`Map`,`playtime`,`online`,`application`,`insert_time`,`last_seen`) VALUES (20,'Bloodwyn','76561198055205907','5',0,0,0,0,3500,'\"[`CUP_U_C_Mechanic_03`,`B_Carryall_khk`,`CUP_arifle_AK47_Early`,[``,``,``,``],[`CUP_30Rnd_762x39_AK47_M`],``,[``,``,``,``],[],``,[``,``,``,``],[],[`CUP_30Rnd_762x39_AK47_M`],`V_PlateCarrier1_wdl`,[`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`],`H_Bandanna_gry`,`G_Bandanna_blk`,[`ItemMap`],[`valor_woodenlog`,`valor_van_02_rimless_tire`,`valor_ducttape`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`]]\"','\"[`rhs_uniform_emr_patchless`,`CUP_B_HikingPack_Civ`,`CUP_arifle_HK416_CQB_Black`,[``,``,``,``],[`CUP_30Rnd_556x45_PMAG_QP`],``,[``,``,``,``],[],``,[``,``,``,``],[],[],`CUP_V_CZ_vest13`,[],`CUP_H_SLA_SLCap`,`G_Bandanna_khk`,[`ItemMap`],[`CUP_smg_MP5A5`]]\"',NULL,'\"[-27,100,0.35,12000]\"','\"[61,100,0.0360616,12000]\"','5','0',1,0,1,'\"[[8656.09,13248.6,0.00144196],298.205]\"','\"[[12010.4,9099.58,14.0324],44.9263]\"','','141',0,0,'2019-07-20 16:41:38','2019-08-09 23:58:27');
INSERT INTO `players` (`uid`,`name`,`pid`,`coplevel`,`cash`,`bankacc`,`xp`,`level`,`humanity`,`gear`,`gear_cop`,`quests`,`stats`,`stats_cop`,`adminlevel`,`donatorlevel`,`alive`,`arrested`,`alive_cop`,`position`,`position_cop`,`Map`,`playtime`,`online`,`application`,`insert_time`,`last_seen`) VALUES (21,'Blackdog','76561198027669628','5',0,0,0,0,3500,'\"[`CUP_U_O_TK_Green`,`B_Carryall_khk`,`CUP_arifle_AK47_Early`,[``,``,``,``],[`CUP_30Rnd_762x39_AK47_M`],``,[``,``,``,``],[],``,[``,``,``,``],[],[],`V_PlateCarrier1_wdl`,[`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`,`CUP_30Rnd_762x39_AK47_M`],`H_Bandanna_gry`,`G_Bandanna_blk`,[`ItemMap`,`ItemCompass`],[`valor_portable_generator`,`valor_woodenlog`]]\"','\"[`rhs_uniform_emr_patchless`,`CUP_B_HikingPack_Civ`,`CUP_arifle_HK416_CQB_Black`,[``,``,``,``],[`CUP_30Rnd_556x45_PMAG_QP`],``,[``,``,``,``],[],``,[``,``,``,``],[],[],`CUP_V_CZ_vest13`,[],`CUP_H_SLA_SLCap`,`G_Bandanna_khk`,[`ItemMap`],[`CUP_smg_MP5A5`]]\"',NULL,'\"[-23,100,0.25,12000]\"','\"[61,100,0.0360616,12000]\"','5','0',1,0,1,'\"[[8661.42,13277.8,0.00144196],352.3]\"','\"[[12010.4,9099.58,14.0324],44.9263]\"','','141',0,0,'2019-07-20 16:41:38','2019-08-09 23:58:27');
