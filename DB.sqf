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
  `stats_killed` varchar(150) NOT NULL DEFAULT '[0,0,0,0,0,0]',
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

DROP TABLE IF EXISTS `weather`;
CREATE TABLE IF NOT EXISTS `weather (
 `uid` int(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `probability` varchar(32) NOT NULL,
  `time` varchar(17) NOT NULL,
  PRIMARY KEY (`uid`)
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

--
-- Table structure for table `player_satistics`
--
DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `log` text NOT NULL,
  `insert_time` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
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
  `displaytext` text NOT NULL,
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
  `owners` text,
  `attach_pos` text,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `cop` tinyint(1) NOT NULL DEFAULT '0',
  `updated` int(64) NOT NULL DEFAULT '0',
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
  `group_id` int(10) NOT NULL DEFAULT '-1',
  `layout_id` varchar(64) NOT NULL,
  `classname` text NOT NULL,
  `pos` text NOT NULL,
  `dir` varchar(64) NOT NULL,
  `vector` text NOT NULL,
  `inventory` text NOT NULL,
  `wall` tinyint(1) NOT NULL DEFAULT '0',
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
  `config_id` int(10) NOT NULL,
  `layout_id` int(10) NOT NULL,
  `group_id` int(10) NOT NULL,
  `owner` varchar(17) NOT NULL,
  `entry_list` text NOT NULL,
  `cop` tinyint(1) NOT NULL DEFAULT '0',
  `raptor` tinyint(1) NOT NULL DEFAULT '0',
  `raptor_classname` varchar(128) NOT NULL DEFAULT '"babe_raptorb_east_5_F"',
  `classname` text NOT NULL,
  `pos` text NOT NULL,
  `dir` varchar(64) NOT NULL,
  `vector` text NOT NULL,
  `inventory` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`base_id`)
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
-- weather

INSERT INTO `weather` (`uid`,`type`,`probability`,`time`) VALUES (12,'Heavy_Rain','3','[900,1050,1200]');
INSERT INTO `weather` (`uid`,`type`,`probability`,`time`) VALUES (13,'Light_Rain','7','[1200,1500,1800]');
INSERT INTO `weather` (`uid`,`type`,`probability`,`time`) VALUES (14,'Sunny','20','[3000,3600,4200]');
INSERT INTO `weather` (`uid`,`type`,`probability`,`time`) VALUES (15,'Light_fog','8','[1800,2100,2400]');
INSERT INTO `weather` (`uid`,`type`,`probability`,`time`) VALUES (16,'Heavy_fog','3','[600,720,900]');
INSERT INTO `weather` (`uid`,`type`,`probability`,`time`) VALUES (17,'Cloudy','15','[2700,3120,3600]');
INSERT INTO `weather` (`uid`,`type`,`probability`,`time`) VALUES (18,'Thunderstorm','1','[900,1050,1200]');



-- VEHICLE PRICES



/*
-- Query: SELECT * FROM valor.loottable_classnames
-- Date: 2019-10-09 03:11
*/
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (185,'CUP_U_C_Fireman_01','firestation','1','30','item','[]','2019-07-14 18:17:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (191,'CUP_U_C_Rescuer_01','firestation','1','20','item','[]','2019-07-14 18:19:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (215,'CUP_H_C_Fireman_Helmet_01','firestation','1','20','item','[]','2019-07-14 18:26:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (278,'valor_defibrillator','medical','1','5','item','[]','2019-07-14 19:03:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (279,'valor_bandage','medical','1','25','item','[]','2019-07-14 19:03:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (280,'valor_bloodbag','medical','1','25','item','[]','2019-07-14 19:05:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (281,'valor_firstaidkit_01_closed','medical','1','5','item','[]','2019-07-14 19:06:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (282,'valor_painkillers','medical','1','20','item','[]','2019-07-14 19:06:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (283,'valor_vitaminbottle','medical','1','20','item','[]','2019-07-14 19:06:47');
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
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (578,'rhs_weap_rsp30_white','general','1','10','weapon','[]','2019-07-17 21:25:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (580,'rhs_weap_rsp30_green','general','1','10','weapon','[]','2019-07-17 21:25:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (582,'rhs_weap_rsp30_red','general','1','10','weapon','[]','2019-07-17 21:26:05');
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
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (933,'CUP_sgun_Saiga12K','general','1','15','weapon','[[\"CUP_8Rnd_B_Saiga12_74Pellets_M\",2,\"magazin\"]]','2019-07-18 16:20:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (934,'CUP_8Rnd_B_Saiga12_74Pellets_M','general','1','15','magazin','[[\"CUP_8Rnd_B_Saiga12_74Pellets_M\",2,\"magazin\"]]','2019-07-18 16:20:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (935,'CUP_8Rnd_B_Saiga12_74Slug_M','general','1','15','magazin','[[\"CUP_8Rnd_B_Saiga12_74Slug_M\",2,\"magazin\"]]','2019-07-18 16:20:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (936,'CUP_30Rnd_9x19_Vityaz','general','1','15','magazin','[[\"CUP_30Rnd_9x19_Vityaz\",2,\"magazin\"]]','2019-07-18 16:21:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (937,'valor_bakedbeans','food','1','150','item','[]','2019-07-18 17:02:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (938,'valor_can_v2','food','1','150','item','[]','2019-07-18 17:02:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (939,'valor_can_v3','food','1','150','item','[]','2019-07-18 17:02:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (940,'valor_can_rusty','food','1','150','item','[]','2019-07-18 17:03:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (941,'valor_can_v1','food','1','150','item','[]','2019-07-18 17:03:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (942,'valor_cerealsbox','food','1','150','item','[]','2019-07-18 17:04:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (943,'valor_orange_01','food','1','150','item','[]','2019-07-18 17:04:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (944,'valor_bottleplastic_v2','food','1','150','item','[]','2019-07-18 17:04:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (945,'valor_tacticalbacon','food','1','150','item','[]','2019-07-18 17:04:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (946,'valor_canteen','food','1','150','item','[]','2019-07-18 17:04:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (947,'rhs_weap_ak74m_npz','l_military','1','8','weapon','[[\"rhs_30Rnd_545x39_7N10_AK\",2,\"magazin\"]]','2019-07-18 18:15:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (948,'rhs_30Rnd_545x39_7N10_AK','l_military','1','6','magazin','[[\"rhs_30Rnd_545x39_7N10_AK\",2,\"magazin\"]]','2019-07-18 18:15:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (949,'rhs_weap_ak74m','l_military','1','10','weapon','[[\"rhs_30Rnd_545x39_7N10_AK\",2,\"magazin\"]]','2019-07-18 18:15:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (950,'rhs_30Rnd_545x39_7N10_AK','l_military','1','7','magazin','[[\"rhs_30Rnd_545x39_7N10_AK\",2,\"magazin\"]]','2019-07-18 18:15:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (951,'SMG_03_black','l_military','1','15','weapon','[[\"50Rnd_570x28_SMG_03\",2,\"magazin\"]]','2019-07-18 18:18:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (952,'50Rnd_570x28_SMG_03','l_military','1','12','magazin','[[\"50Rnd_570x28_SMG_03\",2,\"magazin\"]]','2019-07-18 18:18:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (953,'SMG_03_TR_black','l_military','1','12','weapon','[[\"50Rnd_570x28_SMG_03\",2,\"magazin\"]]','2019-07-18 18:18:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (954,'50Rnd_570x28_SMG_03','l_military','1','8','magazin','[[\"50Rnd_570x28_SMG_03\",2,\"magazin\"]]','2019-07-18 18:18:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (955,'SMG_03C_TR_black','l_military','1','12','weapon','[[\"50Rnd_570x28_SMG_03\",2,\"magazin\"]]','2019-07-18 18:20:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (956,'50Rnd_570x28_SMG_03','l_military','1','8','magazin','[[\"50Rnd_570x28_SMG_03\",2,\"magazin\"]]','2019-07-18 18:20:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (957,'rhs_weap_akmn','l_military','1','10','weapon','[[\"rhs_30Rnd_762x39mm_bakelite\",2,\"magazin\"]]','2019-07-18 18:20:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (958,'rhs_30Rnd_762x39mm_bakelite','l_military','1','8','magazin','[[\"rhs_30Rnd_762x39mm_bakelite\",2,\"magazin\"]]','2019-07-18 18:20:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (959,'CUP_arifle_xm8_sharpshooter','l_military','1','8','weapon','[[\"CUP_30Rnd_556x45_XM8\",2,\"magazin\"]]','2019-07-18 18:20:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (960,'CUP_30Rnd_556x45_XM8','l_military','1','6','magazin','[[\"CUP_30Rnd_556x45_XM8\",2,\"magazin\"]]','2019-07-18 18:20:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (961,'CUP_arifle_XM8_Carbine_FG','l_military','1','8','weapon','[[\"CUP_30Rnd_556x45_XM8\",2,\"magazin\"]]','2019-07-18 18:20:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (962,'CUP_30Rnd_556x45_XM8','l_military','1','6','magazin','[[\"CUP_30Rnd_556x45_XM8\",2,\"magazin\"]]','2019-07-18 18:20:37');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (963,'CUP_arifle_XM8_Railed','l_military','1','8','weapon','[[\"CUP_30Rnd_556x45_XM8\",2,\"magazin\"]]','2019-07-18 18:21:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (964,'CUP_30Rnd_556x45_XM8','l_military','1','6','magazin','[[\"CUP_30Rnd_556x45_XM8\",2,\"magazin\"]]','2019-07-18 18:21:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (965,'SMG_01_F','l_military','1','20','weapon','[[\"30Rnd_45ACP_Mag_SMG_01\",2,\"magazin\"]]','2019-07-18 18:21:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (966,'30Rnd_45ACP_Mag_SMG_01','l_military','1','15','magazin','[[\"30Rnd_45ACP_Mag_SMG_01\",2,\"magazin\"]]','2019-07-18 18:21:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (967,'CUP_arifle_TYPE_56_2','l_military','1','14','weapon','[[\"CUP_30Rnd_762x39_AK47_M\",2,\"magazin\"]]','2019-07-18 18:22:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (968,'CUP_30Rnd_762x39_AK47_M','l_military','1','10','magazin','[[\"CUP_30Rnd_762x39_AK47_M\",2,\"magazin\"]]','2019-07-18 18:22:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (969,'CUP_arifle_TYPE_56_2_top_rail','l_military','1','10','weapon','[[\"CUP_30Rnd_762x39_AK47_M\",2,\"magazin\"]]','2019-07-18 18:22:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (970,'CUP_30Rnd_762x39_AK47_M','l_military','1','8','magazin','[[\"CUP_30Rnd_762x39_AK47_M\",2,\"magazin\"]]','2019-07-18 18:22:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (971,'CUP_srifle_CZ550_rail','l_military','1','5','weapon','[[\"CUP_5x_22_LR_17_HMR_M\",2,\"magazin\"],[\"optic_SOS\",1,\"item\"]]','2019-07-18 18:23:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (972,'CUP_5x_22_LR_17_HMR_M','l_military','1','4','magazin','[[\"CUP_5x_22_LR_17_HMR_M\",2,\"magazin\"]]','2019-07-18 18:23:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (973,'rhs_weap_svdp','l_military','1','6','weapon','[[\"rhs_10Rnd_762x54mmR_7N1\",2,\"magazin\"],[\"rhs_acc_pso1m21_svd\",1,\"item\"]]','2019-07-18 18:23:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (974,'rhs_10Rnd_762x54mmR_7N1','l_military','1','5','magazin','[[\"rhs_10Rnd_762x54mmR_7N1\",2,\"magazin\"]]','2019-07-18 18:23:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (975,'rhs_weap_svdp_wd','l_military','1','6','weapon','[[\"rhs_10Rnd_762x54mmR_7N1\",2,\"magazin\"],[\"rhs_acc_pso1m21_svd\",1,\"item\"]]','2019-07-18 18:25:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (976,'rhs_10Rnd_762x54mmR_7N1','l_military','1','5','magazin','[[\"rhs_10Rnd_762x54mmR_7N1\",2,\"magazin\"]]','2019-07-18 18:25:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (977,'rhs_weap_svds','l_military','1','6','weapon','[[\"rhs_10Rnd_762x54mmR_7N1\",2,\"magazin\"],[\"rhs_acc_pso1m21_svd\",1,\"item\"]]','2019-07-18 18:25:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (978,'rhs_10Rnd_762x54mmR_7N1','l_military','1','5','magazin','[[\"rhs_10Rnd_762x54mmR_7N1\",2,\"magazin\"]]','2019-07-18 18:25:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (979,'srifle_DMR_01_F','l_military','1','5','weapon','[[\"10Rnd_762x54_Mag\",2,\"magazin\"],[\"optic_DMS\",1,\"item\"]]','2019-07-18 18:27:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (980,'10Rnd_762x54_Mag','l_military','1','4','magazin','[[\"10Rnd_762x54_Mag\",2,\"magazin\"]]','2019-07-18 18:27:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (981,'rhs_weap_ak74_2','l_military','1','20','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:27:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (982,'rhs_30Rnd_545x39_7N6M_AK','l_military','1','15','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:27:48');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (983,'rhs_weap_ak74','l_military','1','20','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:28:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (984,'rhs_30Rnd_545x39_7N6M_AK','l_military','1','15','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:28:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (985,'rhs_weap_aks74u','l_military','1','20','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:28:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (986,'rhs_30Rnd_545x39_7N6M_AK','l_military','1','15','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:28:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (987,'rhs_weap_aks74un','l_military','1','15','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:28:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (988,'rhs_30Rnd_545x39_7N6M_AK','l_military','1','15','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:28:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (989,'CUP_arifle_SR3M_Vikhr','l_military','1','15','weapon','[[\"CUP_30Rnd_9x39_SP5_VIKHR_M\",2,\"magazin\"]]','2019-07-18 18:28:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (990,'CUP_30Rnd_9x39_SP5_VIKHR_M','l_military','1','15','magazin','[[\"CUP_30Rnd_9x39_SP5_VIKHR_M\",2,\"magazin\"]]','2019-07-18 18:28:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (991,'CUP_arifle_SR3M_Vikhr_top_rail','l_military','1','12','weapon','[[\"CUP_30Rnd_9x39_SP5_VIKHR_M\",2,\"magazin\"]]','2019-07-18 18:30:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (992,'CUP_30Rnd_9x39_SP5_VIKHR_M','l_military','1','10','magazin','[[\"CUP_30Rnd_9x39_SP5_VIKHR_M\",2,\"magazin\"]]','2019-07-18 18:30:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (993,'CUP_srifle_Mk12SPR','l_military','1','8','weapon','[[\"CUP_20Rnd_556x45_Stanag\",2,\"magazin\"],[\"optic_SOS\",1,\"item\"]]','2019-07-18 18:30:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (994,'CUP_20Rnd_556x45_Stanag','l_military','1','6','magazin','[[\"CUP_20Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:30:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (995,'rhs_weap_pp2000','l_military','1','25','weapon','[[\"rhs_mag_9x19mm_7n21_20\",2,\"magazin\"]]','2019-07-18 18:30:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (996,'rhs_mag_9x19mm_7n21_20','l_military','1','20','magazin','[[\"rhs_mag_9x19mm_7n21_20\",2,\"magazin\"]]','2019-07-18 18:30:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (997,'CUP_lmg_PKM','l_military','1','10','weapon','[[\"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M\",2,\"magazin\"]]','2019-07-18 18:30:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (998,'CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M','l_military','1','8','magazin','[[\"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M\",2,\"magazin\"]]','2019-07-18 18:30:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (999,'CUP_smg_vityaz_top_rail','l_military','1','18','weapon','[[\"CUP_30Rnd_9x19AP_Vityaz\",2,\"magazin\"]]','2019-07-18 18:31:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1000,'CUP_30Rnd_9x19AP_Vityaz','l_military','1','15','magazin','[[\"CUP_30Rnd_9x19AP_Vityaz\",2,\"magazin\"]]','2019-07-18 18:31:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1001,'CUP_smg_vityaz','l_military','1','18','weapon','[[\"CUP_30Rnd_9x19AP_Vityaz\",2,\"magazin\"]]','2019-07-18 18:31:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1002,'CUP_30Rnd_9x19AP_Vityaz','l_military','1','15','magazin','[[\"CUP_30Rnd_9x19AP_Vityaz\",2,\"magazin\"]]','2019-07-18 18:31:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1003,'CUP_smg_bizon','l_military','1','20','weapon','[[\"CUP_64Rnd_9x19_Bizon_M\",2,\"magazin\"]]','2019-07-18 18:31:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1004,'CUP_64Rnd_9x19_Bizon_M','l_military','1','15','magazin','[[\"CUP_64Rnd_9x19_Bizon_M\",2,\"magazin\"]]','2019-07-18 18:31:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1005,'SMG_02_F','l_military','1','20','weapon','[[\"30Rnd_9x21_Mag_SMG_02\",2,\"magazin\"]]','2019-07-18 18:31:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1006,'30Rnd_9x21_Mag_SMG_02','l_military','1','15','magazin','[[\"30Rnd_9x21_Mag_SMG_02\",2,\"magazin\"]]','2019-07-18 18:31:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1007,'arifle_Mk20_F','l_military','1','16','weapon','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:32:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1008,'30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:32:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1009,'arifle_Mk20_plain_F','l_military','1','16','weapon','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:32:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1010,'30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:32:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1011,'CUP_smg_EVO','l_military','1','20','weapon','[[\"CUP_30Rnd_9x19_EVO\",2,\"magazin\"]]','2019-07-18 18:33:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1012,'CUP_30Rnd_9x19_EVO','l_military','1','15','magazin','[[\"CUP_30Rnd_9x19_EVO\",2,\"magazin\"]]','2019-07-18 18:33:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1013,'rhs_weap_ak74m_camo','l_military','1','10','weapon','[[\"rhs_30Rnd_545x39_7N22_camo_AK\",2,\"magazin\"]]','2019-07-18 18:33:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1014,'rhs_30Rnd_545x39_7N22_camo_AK','l_military','1','7','magazin','[[\"rhs_30Rnd_545x39_7N22_camo_AK\",2,\"magazin\"]]','2019-07-18 18:33:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1015,'rhs_weap_ak74m_fullplum_npz','l_military','1','10','weapon','[[\"rhs_30Rnd_545x39_7N10_plum_AK\",2,\"magazin\"]]','2019-07-18 18:33:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1016,'rhs_30Rnd_545x39_7N10_plum_AK','l_military','1','7','magazin','[[\"rhs_30Rnd_545x39_7N10_plum_AK\",2,\"magazin\"]]','2019-07-18 18:33:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1017,'rhs_weap_akmn_npz','l_military','1','10','weapon','[[\"rhs_30Rnd_762x39mm_bakelite\",2,\"magazin\"]]','2019-07-18 18:33:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1018,'rhs_30Rnd_762x39mm_bakelite','l_military','1','7','magazin','[[\"rhs_30Rnd_762x39mm_bakelite\",2,\"magazin\"]]','2019-07-18 18:33:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1019,'CUP_arifle_RPK74','l_military','1','8','weapon','[[\"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M\",2,\"magazin\"]]','2019-07-18 18:34:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1020,'CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M','l_military','1','6','magazin','[[\"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M\",2,\"magazin\"]]','2019-07-18 18:34:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1021,'arifle_TRG21_F','l_military','1','20','weapon','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:34:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1022,'30Rnd_556x45_Stanag','l_military','1','15','magazin','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:34:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1023,'arifle_TRG20_F','l_military','1','20','weapon','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:34:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1024,'30Rnd_556x45_Stanag','l_military','1','15','magazin','[[\"30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:34:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1025,'CUP_arifle_RPK74_45','l_military','1','8','weapon','[[\"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M\",2,\"magazin\"]]','2019-07-18 18:34:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1026,'CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M','l_military','1','6','magazin','[[\"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M\",2,\"magazin\"]]','2019-07-18 18:34:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1027,'CUP_arifle_RPK74_top_rail','l_military','1','8','weapon','[[\"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M\",2,\"magazin\"]]','2019-07-18 18:35:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1028,'CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M','l_military','1','6','magazin','[[\"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M\",2,\"magazin\"]]','2019-07-18 18:35:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1029,'CUP_arifle_RPK74M_railed','l_military','1','8','weapon','[[\"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M\",2,\"magazin\"]]','2019-07-18 18:35:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1030,'CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M','l_military','1','6','magazin','[[\"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M\",2,\"magazin\"]]','2019-07-18 18:35:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1031,'CUP_arifle_G36A','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_G36\",2,\"magazin\"]]','2019-07-18 18:35:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1032,'CUP_arifle_FNFAL','l_military','1','15','weapon','[[\"CUP_20Rnd_762x51_FNFAL_M\",2,\"magazin\"]]','2019-07-18 18:35:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1033,'CUP_30Rnd_556x45_G36','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_G36\",2,\"magazin\"]]','2019-07-18 18:35:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1034,'CUP_20Rnd_762x51_FNFAL_M','l_military','1','12','magazin','[[\"CUP_20Rnd_762x51_FNFAL_M\",2,\"magazin\"]]','2019-07-18 18:35:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1035,'CUP_arifle_FNFAL5062','l_military','1','15','weapon','[[\"CUP_20Rnd_762x51_FNFAL_M\",2,\"magazin\"]]','2019-07-18 18:36:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1036,'CUP_20Rnd_762x51_FNFAL_M','l_military','1','12','magazin','[[\"CUP_20Rnd_762x51_FNFAL_M\",2,\"magazin\"]]','2019-07-18 18:36:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1037,'CUP_srifle_L129A1','l_military','1','8','weapon','[[\"CUP_20Rnd_762x51_L129_M\",2,\"magazin\"]]','2019-07-18 18:36:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1038,'CUP_20Rnd_762x51_L129_M','l_military','1','6','magazin','[[\"CUP_20Rnd_762x51_L129_M\",2,\"magazin\"]]','2019-07-18 18:36:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1039,'CUP_arifle_Mk16_CQC_black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:36:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1040,'CUP_30Rnd_556x45_Stanag_Mk16_black','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:36:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1041,'CUP_arifle_M16A1','l_military','1','15','weapon','[[\"CUP_20Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:36:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1042,'CUP_20Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_20Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:36:41');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1043,'CUP_arifle_Sa58V_camo','l_military','1','18','weapon','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:37:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1044,'CUP_30Rnd_Sa58_M_TracerG','l_military','1','14','magazin','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:37:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1045,'CUP_arifle_L85A2','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag_L85\",2,\"magazin\"]]','2019-07-18 18:37:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1046,'CUP_30Rnd_556x45_Stanag_L85','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag_L85\",2,\"magazin\"]]','2019-07-18 18:37:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1047,'CUP_arifle_Sa58RIS1_des','l_military','1','10','weapon','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:38:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1048,'CUP_30Rnd_Sa58_M_TracerG','l_military','1','7','magazin','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:38:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1049,'CUP_arifle_Sa58RIS1','l_military','1','10','weapon','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:38:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1050,'CUP_30Rnd_Sa58_M_TracerG','l_military','1','7','magazin','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:38:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1051,'CUP_arifle_SAIGA_MK03','l_military','1','14','weapon','[[\"CUP_10Rnd_762x39_SaigaMk03_M\",2,\"magazin\"]]','2019-07-18 18:38:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1052,'CUP_10Rnd_762x39_SaigaMk03_M','l_military','1','10','magazin','[[\"CUP_10Rnd_762x39_SaigaMk03_M\",2,\"magazin\"]]','2019-07-18 18:38:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1053,'CUP_arifle_M4A1_black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:38:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1054,'CUP_30Rnd_556x45_Stanag','l_military','1','11','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:38:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1055,'CUP_arifle_Mk16_STD_black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:39:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1056,'CUP_30Rnd_556x45_Stanag_Mk16_black','l_military','1','11','magazin','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:39:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1057,'CUP_arifle_XM16E1','l_military','1','15','weapon','[[\"CUP_20Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:39:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1058,'CUP_20Rnd_556x45_Stanag','l_military','1','11','magazin','[[\"CUP_20Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:39:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1059,'CUP_lmg_minimi','l_military','1','2','weapon','[[\"CUP_200Rnd_TE4_Red_Tracer_556x45_M249\",2,\"magazin\"]]','2019-07-18 18:39:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1060,'CUP_200Rnd_TE4_Red_Tracer_556x45_M249','l_military','1','2','magazin','[[\"CUP_200Rnd_TE4_Red_Tracer_556x45_M249\",2,\"magazin\"]]','2019-07-18 18:39:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1061,'CUP_20Rnd_762x51_L129_M','l_military','1','5','magazin','[[\"CUP_20Rnd_762x51_L129_M\",2,\"magazin\"]]','2019-07-18 18:39:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1062,'CUP_srifle_L129A1_HG','l_military','1','8','weapon','[[\"CUP_20Rnd_762x51_L129_M\",2,\"magazin\"]]','2019-07-18 18:39:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1063,'CUP_arifle_L85A2_NG','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag_L85\",2,\"magazin\"]]','2019-07-18 18:40:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1064,'CUP_30Rnd_556x45_Stanag_L85','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag_L85\",2,\"magazin\"]]','2019-07-18 18:40:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1065,'CUP_arifle_L86A2','l_military','1','4','weapon','[[\"150Rnd_556x45_Drum_Sand_Mag_Tracer_F\",2,\"magazin\"]]','2019-07-18 18:40:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1066,'150Rnd_556x45_Drum_Sand_Mag_Tracer_F','l_military','1','3','magazin','[[\"150Rnd_556x45_Drum_Sand_Mag_Tracer_F\",2,\"magazin\"]]','2019-07-18 18:40:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1067,'CUP_arifle_Mk16_CQC_FG_black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:41:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1068,'CUP_30Rnd_556x45_Stanag_Mk16_black','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:41:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1069,'CUP_arifle_Mk16_STD_FG_black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:41:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1070,'CUP_30Rnd_556x45_Stanag_Mk16_black','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:41:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1071,'CUP_arifle_Mk16_STD_SFG_black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:41:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1072,'CUP_30Rnd_556x45_Stanag_Mk16_black','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:41:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1073,'CUP_arifle_Mk16_CQC_SFG_black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:41:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1074,'CUP_30Rnd_556x45_Stanag_Mk16_black','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag_Mk16_black\",2,\"magazin\"]]','2019-07-18 18:41:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1075,'CUP_arifle_G36A_RIS','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_G36\",2,\"magazin\"]]','2019-07-18 18:41:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1076,'CUP_30Rnd_556x45_G36','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_G36\",2,\"magazin\"]]','2019-07-18 18:41:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1077,'CUP_arifle_G36C','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_G36\",2,\"magazin\"]]','2019-07-18 18:41:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1078,'CUP_30Rnd_556x45_G36','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_G36\",2,\"magazin\"]]','2019-07-18 18:41:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1079,'CUP_arifle_G36C_VFG','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_G36\",2,\"magazin\"]]','2019-07-18 18:41:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1080,'CUP_30Rnd_556x45_G36','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_G36\",2,\"magazin\"]]','2019-07-18 18:41:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1081,'CUP_arifle_HK416_Black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_PMAG_QP\",2,\"magazin\"]]','2019-07-18 18:41:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1082,'CUP_30Rnd_556x45_PMAG_QP','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_PMAG_QP\",2,\"magazin\"]]','2019-07-18 18:41:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1083,'CUP_arifle_Sa58P','l_military','1','20','weapon','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:42:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1084,'CUP_30Rnd_Sa58_M_TracerG','l_military','1','15','magazin','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:42:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1085,'CUP_arifle_Sa58V','l_military','1','20','weapon','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:42:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1086,'CUP_30Rnd_Sa58_M_TracerG','l_military','1','15','magazin','[[\"CUP_30Rnd_Sa58_M_TracerG\",2,\"magazin\"]]','2019-07-18 18:42:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1087,'CUP_arifle_MG36','l_military','1','4','weapon','[[\"CUP_100Rnd_556x45_BetaCMag\",2,\"magazin\"]]','2019-07-18 18:42:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1088,'CUP_100Rnd_556x45_BetaCMag','l_military','1','3','magazin','[[\"CUP_100Rnd_556x45_BetaCMag\",2,\"magazin\"]]','2019-07-18 18:42:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1089,'CUP_arifle_MG36_wdl','l_military','1','4','weapon','[[\"CUP_100Rnd_556x45_BetaCMag_wdl\",2,\"magazin\"]]','2019-07-18 18:42:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1090,'CUP_100Rnd_556x45_BetaCMag_wdl','l_military','1','3','magazin','[[\"CUP_100Rnd_556x45_BetaCMag_wdl\",2,\"magazin\"]]','2019-07-18 18:42:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1091,'CUP_arifle_M16A4_Base','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:43:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1092,'CUP_30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:43:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1093,'CUP_arifle_M16A4_Grip','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:43:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1094,'CUP_30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:43:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1095,'CUP_arifle_HK_M27','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_PMAG_QP\",2,\"magazin\"]]','2019-07-18 18:43:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1096,'CUP_30Rnd_556x45_PMAG_QP','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_PMAG_QP\",2,\"magazin\"]]','2019-07-18 18:43:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1097,'CUP_arifle_HK_M27_VFG','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_PMAG_QP\",2,\"magazin\"]]','2019-07-18 18:43:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1098,'CUP_30Rnd_556x45_PMAG_QP','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_PMAG_QP\",2,\"magazin\"]]','2019-07-18 18:43:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1099,'CUP_smg_MP5A5','l_military','1','25','weapon','[[\"CUP_30Rnd_9x19_MP5\",2,\"magazin\"]]','2019-07-18 18:44:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1100,'CUP_30Rnd_9x19_MP5','l_military','1','15','magazin','[[\"CUP_30Rnd_9x19_MP5\",2,\"magazin\"]]','2019-07-18 18:44:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1101,'CUP_smg_MP5SD6','l_military','1','20','weapon','[[\"CUP_30Rnd_9x19_MP5\",2,\"magazin\"]]','2019-07-18 18:44:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1102,'CUP_30Rnd_9x19_MP5','l_military','1','15','magazin','[[\"CUP_30Rnd_9x19_MP5\",2,\"magazin\"]]','2019-07-18 18:44:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1103,'CUP_arifle_M16A2','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:44:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1104,'CUP_30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:44:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1105,'CUP_arifle_XM8_Compact','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_XM8\",2,\"magazin\"]]','2019-07-18 18:45:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1106,'CUP_30Rnd_556x45_XM8','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_XM8\",2,\"magazin\"]]','2019-07-18 18:45:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1107,'CUP_arifle_HK416_Wood','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_PMAG_QP_Olive\",2,\"magazin\"]]','2019-07-18 18:45:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1108,'CUP_30Rnd_556x45_PMAG_QP_Olive','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_PMAG_QP_Olive\",2,\"magazin\"]]','2019-07-18 18:45:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1109,'CUP_arifle_HK416_CQB_Black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_PMAG_QP\",2,\"magazin\"]]','2019-07-18 18:45:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1110,'CUP_30Rnd_556x45_PMAG_QP','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_PMAG_QP\",2,\"magazin\"]]','2019-07-18 18:45:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1111,'CUP_arifle_HK416_CQB_Wood','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_PMAG_QP_Olive\",2,\"magazin\"]]','2019-07-18 18:45:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1112,'CUP_30Rnd_556x45_PMAG_QP_Olive','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_PMAG_QP_Olive\",2,\"magazin\"]]','2019-07-18 18:45:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1113,'CUP_arifle_M4A1','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:45:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1114,'CUP_30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:45:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1115,'CUP_arifle_M4A3_black','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:45:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1116,'CUP_30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:45:50');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1117,'CUP_arifle_M4A3_camo','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:46:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1118,'CUP_30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:46:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1119,'CUP_lmg_FNMAG','l_military','1','3','weapon','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",2,\"magazin\"]]','2019-07-18 18:46:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1120,'CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M','l_military','1','2','magazin','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",2,\"magazin\"]]','2019-07-18 18:46:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1121,'CUP_arifle_M4A1_camo','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:46:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1122,'CUP_30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:46:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1123,'rhs_weap_ak74n','l_military','1','15','weapon','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:46:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1124,'rhs_30Rnd_545x39_7N6M_AK','l_military','1','12','magazin','[[\"rhs_30Rnd_545x39_7N6M_AK\",2,\"magazin\"]]','2019-07-18 18:46:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1125,'rhs_weap_ak74_3','l_military','1','20','weapon','[[\"rhs_30Rnd_545x39_7N6_green_AK\",2,\"magazin\"]]','2019-07-18 18:47:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1126,'rhs_30Rnd_545x39_7N6_green_AK','l_military','1','15','magazin','[[\"rhs_30Rnd_545x39_7N6_green_AK\",2,\"magazin\"]]','2019-07-18 18:47:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1127,'CUP_arifle_Colt727','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:47:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1128,'CUP_30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:47:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1129,'CUP_arifle_M4A1_camo_carryhandle','l_military','1','15','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:47:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1130,'CUP_30Rnd_556x45_Stanag','l_military','1','12','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-07-18 18:47:52');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1131,'CUP_hgun_MicroUzi','l_military','1','8','weapon','[[\"CUP_30Rnd_9x19_UZI\",2,\"magazin\"]]','2019-07-18 18:51:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1132,'CUP_30Rnd_9x19_UZI','l_military','1','6','magazin','[[\"CUP_30Rnd_9x19_UZI\",2,\"magazin\"]]','2019-07-18 18:51:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1133,'rhs_weap_pp2000_folded','l_military','1','8','weapon','[[\"rhs_mag_9x19mm_7n21_20\",2,\"magazin\"]]','2019-07-18 18:51:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1134,'rhs_mag_9x19mm_7n21_20','l_military','1','6','magazin','[[\"rhs_mag_9x19mm_7n21_20\",2,\"magazin\"]]','2019-07-18 18:51:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1135,'rhs_mag_9x19mm_7n21_44','l_military','1','6','magazin','[[\"rhs_mag_9x19mm_7n21_44\",2,\"magazin\"]]','2019-07-18 18:51:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1136,'CUP_hgun_M9','l_military','1','10','weapon','[[\"CUP_15Rnd_9x19_M9\",2,\"magazin\"]]','2019-07-18 18:51:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1137,'CUP_15Rnd_9x19_M9','l_military','1','7','magazin','[[\"CUP_15Rnd_9x19_M9\",2,\"magazin\"]]','2019-07-18 18:51:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1138,'hgun_Pistol_heavy_01_F','l_military','1','10','weapon','[[\"11Rnd_45ACP_Mag\",2,\"magazin\"]]','2019-07-18 18:52:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1139,'11Rnd_45ACP_Mag','l_military','1','7','magazin','[[\"11Rnd_45ACP_Mag\",2,\"magazin\"]]','2019-07-18 18:52:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1140,'CUP_hgun_Phantom','l_military','1','10','weapon','[[\"CUP_18Rnd_9x19_Phantom\",2,\"magazin\"]]','2019-07-18 18:54:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1141,'CUP_18Rnd_9x19_Phantom','l_military','1','7','magazin','[[\"CUP_18Rnd_9x19_Phantom\",2,\"magazin\"]]','2019-07-18 18:54:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1142,'CUP_hgun_SA61','l_military','1','8','weapon','[[\"CUP_20Rnd_B_765x17_Ball_M\",2,\"magazin\"]]','2019-07-18 18:54:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1143,'CUP_20Rnd_B_765x17_Ball_M','l_military','1','6','magazin','[[\"CUP_20Rnd_B_765x17_Ball_M\",2,\"magazin\"]]','2019-07-18 18:54:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1144,'CUP_50Rnd_B_765x17_Ball_M','l_military','1','2','magazin','[[\"CUP_50Rnd_B_765x17_Ball_M\",2,\"magazin\"]]','2019-07-18 18:54:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1145,'CUP_U_O_TK_MixedCamo','l_military','1','12','item','[]','2019-07-18 19:08:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1146,'CUP_U_B_GER_BDU_Flecktarn','l_military','1','12','item','[]','2019-07-18 19:08:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1147,'CUP_U_B_CZ_DST_TShirt','l_military','1','12','item','[]','2019-07-18 19:08:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1148,'U_B_CTRG_2','l_military','1','12','item','[]','2019-07-18 19:08:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1149,'CUP_I_B_PMC_Unit_16','l_military','1','12','item','[]','2019-07-18 19:09:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1150,'CUP_U_B_FR_Corpsman','l_military','1','12','item','[]','2019-07-18 19:09:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1151,'CUP_U_B_BAF_DPM_UBACSTSHIRT','l_military','1','12','item','[]','2019-07-18 19:09:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1152,'U_B_CombatUniform_mcam_worn','l_military','1','12','item','[]','2019-07-18 19:09:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1153,'CUP_U_B_BAF_DDPM_UBACSLONGKNEE','l_military','1','12','item','[]','2019-07-18 19:09:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1154,'CUP_U_B_USMC_FROG3_WMARPAT','l_military','1','12','item','[]','2019-07-18 19:09:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1155,'CUP_U_I_RACS_Desert_1','l_military','1','12','item','[]','2019-07-18 19:09:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1156,'CUP_U_O_Partisan_TTsKO','l_military','1','12','item','[]','2019-07-18 19:09:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1157,'V_TacVest_khk','l_military','1','12','item','[]','2019-07-18 19:10:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1158,'V_TacVest_oli','l_military','1','12','item','[]','2019-07-18 19:10:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1159,'CUP_V_B_BAF_MTP_Osprey_Mk4_Scout','l_military','1','12','item','[]','2019-07-18 19:10:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1160,'V_PlateCarrier_Kerry','l_military','1','12','item','[]','2019-07-18 19:10:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1161,'V_PlateCarrier1_rgr','l_military','1','12','item','[]','2019-07-18 19:10:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1162,'V_TacVest_camo','l_military','1','12','item','[]','2019-07-18 19:10:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1163,'V_I_G_resistanceLeader_F','l_military','1','12','item','[]','2019-07-18 19:10:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1164,'CUP_V_B_BAF_MTP_Osprey_Mk4_Officer','l_military','1','12','item','[]','2019-07-18 19:10:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1165,'CUP_V_B_BAF_DDPM_Osprey_Mk3_Grenadier','l_military','1','12','item','[]','2019-07-18 19:10:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1166,'CUP_V_B_Eagle_SPC_TL','l_military','1','12','item','[]','2019-07-18 19:10:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1167,'CUP_V_B_BAF_DPM_Osprey_Mk3_Empty','l_military','1','12','item','[]','2019-07-18 19:10:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1168,'rhs_6b23_ML_rifleman','l_military','1','12','item','[]','2019-07-18 19:10:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1169,'CUP_V_PMC_IOTV_Black_TL','l_military','1','12','item','[]','2019-07-18 19:10:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1170,'CUP_V_B_Interceptor_Rifleman','l_military','1','12','item','[]','2019-07-18 19:10:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1171,'CUP_V_CZ_vest15','l_military','1','12','item','[]','2019-07-18 19:10:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1172,'CUP_V_B_GER_Carrier_Vest','l_military','1','12','item','[]','2019-07-18 19:10:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1173,'CUP_V_CZ_vest18','l_military','1','12','item','[]','2019-07-18 19:11:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1174,'V_PlateCarrier1_blk','l_military','1','12','item','[]','2019-07-18 19:11:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1175,'CUP_V_B_Interceptor_Base_M81','l_military','1','12','item','[]','2019-07-18 19:11:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1176,'CUP_V_CZ_vest01','l_military','1','12','item','[]','2019-07-18 19:11:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1177,'CUP_V_CZ_vest13','l_military','1','12','item','[]','2019-07-18 19:11:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1178,'CUP_V_CDF_6B3_4_FST','l_military','1','12','item','[]','2019-07-18 19:11:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1179,'CUP_V_PMC_CIRAS_Black_Veh','l_military','1','12','item','[]','2019-07-18 19:11:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1180,'rhs_6b26_green','l_military','1','14','item','[]','2019-07-18 19:13:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1181,'H_HelmetSpecO_ocamo','l_military','1','14','item','[]','2019-07-18 19:13:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1182,'H_HelmetB_grass','l_military','1','14','item','[]','2019-07-18 19:13:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1183,'rhs_beanie_green','l_military','1','14','item','[]','2019-07-18 19:13:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1184,'rhs_altyn','l_military','1','14','item','[]','2019-07-18 19:13:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1185,'rhs_altyn_visordown','l_military','1','14','item','[]','2019-07-18 19:13:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1186,'BL_eimer_Hat','l_military','1','14','item','[]','2019-07-18 19:13:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1187,'rhs_altyn_bala','l_military','1','14','item','[]','2019-07-18 19:13:30');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1188,'CUP_H_RACS_Helmet_TPAT','l_military','1','14','item','[]','2019-07-18 19:13:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1189,'rhs_balaclava','l_military','1','20','item','[]','2019-07-18 19:14:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1190,'rhs_balaclava1_olive','l_military','1','20','item','[]','2019-07-18 19:14:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1191,'G_Balaclava_blk','l_military','1','20','item','[]','2019-07-18 19:14:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1192,'rhs_1PN138','l_military','1','40','item','[]','2019-07-18 19:14:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1193,'ItemGPS','l_military','1','25','item','[]','2019-07-18 19:15:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1194,'CUP_B_USPack_Coyote','l_military','1','25','backpack','[]','2019-07-18 19:15:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1195,'CUP_B_USMC_MOLLE_WDL','l_military','1','25','backpack','[]','2019-07-18 19:15:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1196,'CUP_B_USPack_Black','l_military','1','25','backpack','[]','2019-07-18 19:15:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1197,'CUP_T10_Parachute_backpack','l_military','1','25','backpack','[]','2019-07-18 19:15:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1198,'B_Kitbag_sgg','l_military','1','25','backpack','[]','2019-07-18 19:15:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1199,'B_Kitbag_mcamo','l_military','1','25','backpack','[]','2019-07-18 19:15:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1200,'CUP_B_HikingPack_Civ','l_military','1','25','backpack','[]','2019-07-18 19:16:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1201,'rhs_acc_pso1m2','l_military','1','12','item','[]','2019-07-18 19:21:23');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1202,'optic_ACO_grn','l_military','1','15','item','[]','2019-07-18 19:21:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1203,'optic_Aco','l_military','1','15','item','[]','2019-07-18 19:21:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1204,'CUP_optic_Eotech553_Black','l_military','1','15','item','[]','2019-07-18 19:21:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1205,'CUP_optic_CompM4','l_military','1','15','item','[]','2019-07-18 19:21:58');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1206,'CUP_optic_ElcanM145','l_military','1','12','item','[]','2019-07-18 19:22:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1207,'CUP_optic_RCO','l_military','1','12','item','[]','2019-07-18 19:22:06');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1208,'CUP_optic_ZeissZPoint','l_military','1','15','item','[]','2019-07-18 19:22:12');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1209,'CUP_optic_CompM2_low','l_military','1','15','item','[]','2019-07-18 19:22:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1210,'CUP_optic_ACOG2','l_military','1','12','item','[]','2019-07-18 19:22:20');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1211,'CUP_optic_ACOG','l_military','1','12','item','[]','2019-07-18 19:22:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1212,'CUP_optic_Elcan','l_military','1','12','item','[]','2019-07-18 19:22:25');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1213,'CUP_optic_HoloBlack','l_military','1','15','item','[]','2019-07-18 19:22:27');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1214,'CUP_optic_SUSAT','l_military','1','15','item','[]','2019-07-18 19:22:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1215,'CUP_optic_CompM2_Black','l_military','1','15','item','[]','2019-07-18 19:22:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1216,'optic_KHS_old','l_military','1','14','item','[]','2019-07-18 19:22:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1217,'optic_Hamr','l_military','1','12','item','[]','2019-07-18 19:23:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1218,'optic_MRCO','l_military','1','12','item','[]','2019-07-18 19:23:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1219,'optic_Yorris','l_military','1','20','item','[]','2019-07-18 19:23:11');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1220,'optic_ACO_grn_smg','l_military','1','20','item','[]','2019-07-18 19:23:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1221,'optic_Aco_smg','l_military','1','20','item','[]','2019-07-18 19:23:17');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1222,'optic_SOS','l_military','1','14','item','[]','2019-07-18 19:23:21');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1223,'rhs_acc_pso1m21_svd','l_military','1','12','item','[]','2019-07-18 19:23:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1224,'optic_DMS','l_military','1','12','item','[]','2019-07-18 19:23:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1225,'CUP_acc_ANPEQ_15_Black','l_military','1','20','item','[]','2019-07-18 19:24:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1226,'CUP_bipod_Harris_1A2_L','l_military','1','20','item','[]','2019-07-18 19:24:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1227,'acc_pointer_IR','l_military','1','20','item','[]','2019-07-18 19:24:34');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1228,'rhs_acc_harris_swivel','l_military','1','20','item','[]','2019-07-18 19:24:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1231,'rhs_acc_pkas_asval','l_military','1','12','item','[]','2019-10-08 17:58:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1232,'CUP_optic_PSO_1_AK','l_military','1','12','item','[]','2019-10-08 17:58:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1233,'rhs_acc_1p63','l_military','1','12','item','[]','2019-10-08 17:58:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1234,'rhs_acc_1p29','l_military','1','12','item','[]','2019-10-08 17:58:10');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1235,'rhs_weap_ak103','m_military','1','10','weapon','[[\"rhs_30Rnd_762x39mm_polymer\",2,\"magazin\"]]','2019-10-08 18:36:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1236,'rhs_30Rnd_762x39mm_polymer','m_military','1','10','magazin','[[\"rhs_30Rnd_762x39mm_polymer\",2,\"magazin\"]]','2019-10-08 18:36:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1237,'rhs_weap_vss','m_military','1','4','weapon','[[\"rhs_10rnd_9x39mm_SP5\",2,\"magazin\"],[\"CUP_optic_SB_3_12x50_PMII\",1,\"item\"]]','2019-10-08 18:37:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1238,'rhs_10rnd_9x39mm_SP5','m_military','1','4','magazin','[[\"rhs_10rnd_9x39mm_SP5\",2,\"magazin\"]]','2019-10-08 18:37:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1239,'rhs_weap_ak103_1_npz','m_military','1','10','weapon','[[\"rhs_30Rnd_762x39mm_polymer\",2,\"magazin\"]]','2019-10-08 18:37:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1240,'rhs_30Rnd_762x39mm_polymer','m_military','1','10','magazin','[[\"rhs_30Rnd_762x39mm_polymer\",2,\"magazin\"]]','2019-10-08 18:37:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1241,'rhs_weap_vss_npz','m_military','1','4','weapon','[[\"rhs_10rnd_9x39mm_SP5\",2,\"magazin\"],[\"CUP_optic_SB_3_12x50_PMII\",1,\"item\"]]','2019-10-08 18:38:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1242,'rhs_10rnd_9x39mm_SP5','m_military','1','4','magazin','[[\"rhs_10rnd_9x39mm_SP5\",2,\"magazin\"]]','2019-10-08 18:38:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1243,'rhs_weap_asval_grip','m_military','1','8','weapon','[[\"rhs_20rnd_9x39mm_SP5\",2,\"magazin\"]]','2019-10-08 18:38:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1244,'rhs_20rnd_9x39mm_SP5','m_military','1','8','magazin','[[\"rhs_20rnd_9x39mm_SP5\",2,\"magazin\"]]','2019-10-08 18:38:28');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1245,'rhs_weap_pkm','m_military','1','3','weapon','[[\"rhs_100Rnd_762x54mmR\",2,\"magazin\"]]','2019-10-08 18:38:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1246,'rhs_100Rnd_762x54mmR','m_military','1','3','magazin','[[\"rhs_100Rnd_762x54mmR\",2,\"magazin\"]]','2019-10-08 18:38:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1247,'CUP_srifle_M110','m_military','1','2','weapon','[[\"CUP_20Rnd_762x51_B_M110\",2,\"magazin\"],[\"optic_AMS\",1,\"item\"]]','2019-10-08 18:38:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1248,'CUP_20Rnd_762x51_B_M110','m_military','1','2','magazin','[[\"CUP_20Rnd_762x51_B_M110\",2,\"magazin\"]]','2019-10-08 18:38:57');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1249,'rhs_weap_ak105','m_military','1','8','weapon','[[\"rhs_30Rnd_545x39_7N10_AK\",2,\"magazin\"]]','2019-10-08 18:42:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1250,'rhs_30Rnd_545x39_7N10_AK','m_military','1','8','magazin','[[\"rhs_30Rnd_545x39_7N10_AK\",2,\"magazin\"]]','2019-10-08 18:42:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1251,'rhs_weap_ak105_zenitco01_b33','m_military','1','8','weapon','[[\"rhs_30Rnd_545x39_7N10_AK\",2,\"magazin\"]]','2019-10-08 18:42:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1252,'rhs_30Rnd_545x39_7N10_AK','m_military','1','8','magazin','[[\"rhs_30Rnd_545x39_7N10_AK\",2,\"magazin\"]]','2019-10-08 18:42:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1253,'rhs_weap_asval_npz','m_military','1','4','weapon','[[\"rhs_20rnd_9x39mm_SP5\",2,\"magazin\"]]','2019-10-08 18:42:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1254,'rhs_20rnd_9x39mm_SP5','m_military','1','4','magazin','[[\"rhs_20rnd_9x39mm_SP5\",2,\"magazin\"]]','2019-10-08 18:42:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1255,'CUP_srifle_M14_DMR','m_military','1','3','weapon','[[\"20Rnd_762x51_Mag\",2,\"magazin\"],[\"optic_AMS\",1,\"item\"]]','2019-10-08 18:42:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1256,'20Rnd_762x51_Mag','m_military','1','3','magazin','[[\"20Rnd_762x51_Mag\",2,\"magazin\"]]','2019-10-08 18:42:53');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1257,'arifle_MXM_Black_F','m_military','1','5','weapon','[[\"30Rnd_65x39_caseless_black_mag\",2,\"magazin\"]]','2019-10-08 18:43:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1258,'30Rnd_65x39_caseless_black_mag','m_military','1','5','magazin','[[\"30Rnd_65x39_caseless_black_mag\",2,\"magazin\"]]','2019-10-08 18:43:40');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1259,'arifle_MX_Black_F','m_military','1','7','weapon','[[\"30Rnd_65x39_caseless_black_mag\",2,\"magazin\"]]','2019-10-08 18:43:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1260,'30Rnd_65x39_caseless_black_mag','m_military','1','7','magazin','[[\"30Rnd_65x39_caseless_black_mag\",2,\"magazin\"]]','2019-10-08 18:43:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1261,'CUP_srifle_M14','m_military','1','3','weapon','[[\"20Rnd_762x51_Mag\",2,\"magazin\"],[\"CUP_optic_ZDDot\",1,\"item\"]]','2019-10-08 18:44:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1262,'20Rnd_762x51_Mag','m_military','1','3','magazin','[[\"20Rnd_762x51_Mag\",2,\"magazin\"]]','2019-10-08 18:44:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1263,'CUP_srifle_M40A3','m_military','1','3','weapon','[[\"CUP_5Rnd_762x51_M24\",2,\"magazin\"],[\"optic_AMS\",1,\"item\"]]','2019-10-08 18:45:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1264,'CUP_5Rnd_762x51_M24','m_military','1','3','magazin','[[\"CUP_5Rnd_762x51_M24\",2,\"magazin\"]]','2019-10-08 18:45:09');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1265,'CUP_srifle_M24_wdl','m_military','1','3','weapon','[[\"CUP_5Rnd_762x51_M24\",2,\"magazin\"],[\"optic_AMS\",1,\"item\"]]','2019-10-08 18:45:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1266,'CUP_5Rnd_762x51_M24','m_military','1','3','magazin','[[\"CUP_5Rnd_762x51_M24\",2,\"magazin\"]]','2019-10-08 18:45:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1267,'arifle_MX_SW_Black_F','m_military','1','3','weapon','[[\"100Rnd_65x39_caseless_black_mag\",2,\"magazin\"]]','2019-10-08 18:46:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1268,'100Rnd_65x39_caseless_black_mag','m_military','1','3','magazin','[[\"100Rnd_65x39_caseless_black_mag\",2,\"magazin\"]]','2019-10-08 18:46:03');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1269,'CUP_arifle_mk18_black','m_military','1','5','weapon','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-10-08 18:46:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1270,'CUP_30Rnd_556x45_Stanag','m_military','1','5','magazin','[[\"CUP_30Rnd_556x45_Stanag\",2,\"magazin\"]]','2019-10-08 18:46:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1271,'CUP_arifle_Mk17_STD_SFG_black','m_military','1','7','weapon','[[\"CUP_20Rnd_762x51_B_SCAR_bkl\",2,\"magazin\"]]','2019-10-08 18:46:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1272,'CUP_20Rnd_762x51_B_SCAR_bkl','m_military','1','7','magazin','[[\"CUP_20Rnd_762x51_B_SCAR_bkl\",2,\"magazin\"]]','2019-10-08 18:46:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1273,'arifle_Katiba_C_F','m_military','1','7','weapon','[[\"30Rnd_65x39_caseless_green\",2,\"magazin\"]]','2019-10-08 18:46:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1274,'30Rnd_65x39_caseless_green','m_military','1','7','magazin','[[\"30Rnd_65x39_caseless_green\",2,\"magazin\"]]','2019-10-08 18:46:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1275,'arifle_Katiba_F','m_military','1','7','weapon','[[\"30Rnd_65x39_caseless_green\",2,\"magazin\"]]','2019-10-08 18:47:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1276,'30Rnd_65x39_caseless_green','m_military','1','7','magazin','[[\"30Rnd_65x39_caseless_green\",2,\"magazin\"]]','2019-10-08 18:47:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1277,'CUP_arifle_Mk17_CQC_Black','m_military','1','7','weapon','[[\"CUP_20Rnd_762x51_B_SCAR_bkl\",2,\"magazin\"]]','2019-10-08 18:47:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1278,'CUP_20Rnd_762x51_B_SCAR_bkl','m_military','1','7','magazin','[[\"CUP_20Rnd_762x51_B_SCAR_bkl\",2,\"magazin\"]]','2019-10-08 18:47:15');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1279,'CUP_arifle_Mk17_STD_black','m_military','1','7','weapon','[[\"CUP_20Rnd_762x51_B_SCAR_bkl\",2,\"magazin\"]]','2019-10-08 18:47:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1280,'CUP_20Rnd_762x51_B_SCAR_bkl','m_military','1','7','magazin','[[\"CUP_20Rnd_762x51_B_SCAR_bkl\",2,\"magazin\"]]','2019-10-08 18:47:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1281,'CUP_20Rnd_762x51_FNFAL_M','m_military','1','4','magazin','[[\"CUP_20Rnd_762x51_FNFAL_M\",2,\"magazin\"]]','2019-10-08 18:47:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1282,'CUP_arifle_FNFAL_railed','m_military','1','4','weapon','[[\"CUP_20Rnd_762x51_FNFAL_M\",2,\"magazin\"]]','2019-10-08 18:47:38');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1283,'CUP_20Rnd_762x51_HK417','m_military','1','5','magazin','[[\"CUP_20Rnd_762x51_HK417\",2,\"magazin\"]]','2019-10-08 18:47:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1284,'CUP_arifle_HK417_12','m_military','1','5','weapon','[[\"CUP_20Rnd_762x51_HK417\",2,\"magazin\"]]','2019-10-08 18:47:51');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1285,'CUP_arifle_RPK74M_railed','m_military','1','9','weapon','[[\"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M\",2,\"magazin\"]]','2019-10-08 18:48:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1286,'CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M','m_military','1','9','magazin','[[\"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M\",2,\"magazin\"]]','2019-10-08 18:48:05');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1287,'CUP_arifle_RPK74','m_military','1','10','weapon','[[\"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M\",2,\"magazin\"]]','2019-10-08 18:48:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1288,'CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M','m_military','1','10','magazin','[[\"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M\",2,\"magazin\"]]','2019-10-08 18:48:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1289,'CUP_arifle_RPK74M','m_military','1','8','weapon','[[\"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M\",2,\"magazin\"]]','2019-10-08 18:48:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1290,'CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M','m_military','1','8','magazin','[[\"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M\",2,\"magazin\"]]','2019-10-08 18:48:35');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1291,'CUP_optic_LeupoldMk4','m_military','1','4','item','[]','2019-10-08 18:50:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1292,'CUP_optic_LeupoldM3LR','m_military','1','4','item','[]','2019-10-08 18:50:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1293,'rhs_acc_dh520x56','m_military','1','10','item','[]','2019-10-08 18:50:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1294,'optic_AMS','m_military','1','7','item','[]','2019-10-08 18:51:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1295,'CUP_optic_SB_3_12x50_PMII','m_military','1','10','item','[]','2019-10-08 18:51:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1296,'CUP_optic_ZDDot','m_military','1','10','item','[]','2019-10-08 18:51:22');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1297,'NVGoggles_OPFOR','m_military','1','7','item','[]','2019-10-08 18:51:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1298,'Rangefinder','m_military','1','7','item','[]','2019-10-08 18:52:02');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1299,'V_PlateCarrierSpec_blk','m_military','1','10','item','[]','2019-10-08 18:53:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1300,'V_PlateCarrier2_blk','m_military','1','15','item','[]','2019-10-08 18:53:26');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1301,'V_PlateCarrierSpec_mtp','m_military','1','10','item','[]','2019-10-08 18:53:39');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1302,'V_PlateCarrierGL_blk','m_military','1','10','item','[]','2019-10-08 18:53:49');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1303,'V_PlateCarrierSpec_rgr','m_military','1','10','item','[]','2019-10-08 18:53:59');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1304,'V_PlateCarrierGL_rgr','m_military','1','10','item','[]','2019-10-08 18:54:08');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1305,'CUP_U_O_SLA_Urban','m_military','1','10','item','[]','2019-10-08 18:55:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1306,'CUP_U_B_US_BDU_urban','m_military','1','10','item','[]','2019-10-08 18:55:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1307,'CUP_I_B_PMC_Unit_24','m_military','1','10','item','[]','2019-10-08 18:56:04');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1308,'CUP_I_B_PMC_Unit_14','m_military','1','10','item','[]','2019-10-08 18:56:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1309,'CUP_U_B_USMC_FROG3_WMARPAT','m_military','1','10','item','[]','2019-10-08 18:56:24');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1310,'CUP_U_B_BAF_DPM_UBACSROLLED','m_military','1','10','item','[]','2019-10-08 18:56:33');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1311,'CUP_U_B_BAF_DPM_UBACSLONG','m_military','1','10','item','[]','2019-10-08 18:56:42');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1312,'CUP_sgun_AA12','h_military','1','4','weapon','[[\"CUP_20Rnd_B_AA12_Pellets\",2,\"magazin\"]]','2019-10-08 18:58:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1313,'CUP_20Rnd_B_AA12_Pellets','h_military','1','4','magazin','[[\"CUP_20Rnd_B_AA12_Pellets\",2,\"magazin\"]]','2019-10-08 18:58:14');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1314,'CUP_lmg_Mk48_wdl','h_military','1','2','weapon','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",2,\"magazin\"]]','2019-10-08 18:58:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1315,'CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M','h_military','1','2','magazin','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",2,\"magazin\"]]','2019-10-08 18:58:36');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1316,'CUP_lmg_MG3_rail','h_military','1','2','weapon','[[\"CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",2,\"magazin\"]]','2019-10-08 18:58:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1317,'CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M','h_military','1','2','magazin','[[\"CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",2,\"magazin\"]]','2019-10-08 18:58:46');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1318,'rhs_weap_pkp','h_military','1','2','weapon','[[\"rhs_100Rnd_762x54mmR\",2,\"magazin\"]]','2019-10-08 18:58:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1319,'rhs_100Rnd_762x54mmR','h_military','1','2','magazin','[[\"rhs_100Rnd_762x54mmR\",2,\"magazin\"]]','2019-10-08 18:58:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1320,'CUP_lmg_M60E4','h_military','1','4','weapon','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",2,\"magazin\"]]','2019-10-08 18:59:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1321,'CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M','h_military','1','4','magazin','[[\"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M\",2,\"magazin\"]]','2019-10-08 18:59:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1322,'rhs_weap_t5000','h_military','1','1.5','weapon','[[\"rhs_5Rnd_338lapua_t5000\",2,\"magazin\"],[\"optic_AMS\",1,\"item\"]]','2019-10-08 18:59:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1323,'rhs_5Rnd_338lapua_t5000','h_military','1','1.5','magazin','[[\"rhs_5Rnd_338lapua_t5000\",2,\"magazin\"]]','2019-10-08 18:59:54');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1324,'CUP_srifle_CZ750','h_military','1','1.5','weapon','[[\"CUP_10Rnd_762x51_CZ750_Tracer\",2,\"magazin\"],[\"optic_AMS\",1,\"item\"]]','2019-10-08 19:00:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1325,'CUP_10Rnd_762x51_CZ750_Tracer','h_military','1','1.5','magazin','[[\"CUP_10Rnd_762x51_CZ750_Tracer\",2,\"magazin\"]]','2019-10-08 19:00:43');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1326,'CUP_srifle_G22_wdl','h_military','1','1.4','weapon','[[\"CUP_5Rnd_762x67_G22\",2,\"magazin\"],[\"optic_AMS\",1,\"item\"]]','2019-10-08 19:01:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1327,'CUP_5Rnd_762x67_G22','h_military','1','1.4','magazin','[[\"CUP_5Rnd_762x67_G22\",2,\"magazin\"]]','2019-10-08 19:01:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1328,'B_Carryall_oli','h_military','1','5','backpack','[]','2019-10-08 19:01:56');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1329,'CUP_NVG_GPNVG_black','h_military','1','5','item','[]','2019-10-08 19:03:16');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1330,'U_B_FullGhillie_Ethereal','h_military','1','5','item','[]','2019-10-08 19:03:44');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1331,'U_B_FullGhillie_grass','h_military','1','5','item','[]','2019-10-08 19:03:55');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1332,'U_B_FullGhillie_jungle','h_military','1','5','item','[]','2019-10-08 19:04:01');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1333,'U_B_FullGhillie_marpat','h_military','1','5','item','[]','2019-10-08 19:04:07');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1334,'U_B_FullGhillie_Wisp','h_military','1','5','item','[]','2019-10-08 19:04:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1335,'U_B_FullGhillie_weeds','h_military','1','5','item','[]','2019-10-08 19:04:18');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1336,'srifle_LRR_F','radiation_zone','1','1.1','weapon','[[\"7Rnd_408_Mag\",2,\"magazin\"],[\"CUP_optic_LeupoldMk4\",1,\"item\"]]','2019-10-08 19:07:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1337,'7Rnd_408_Mag','radiation_zone','1','1.1','magazin','[[\"7Rnd_408_Mag\",2,\"magazin\"]]','2019-10-08 19:07:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1338,'srifle_GM6_F','radiation_zone','1','1.1','weapon','[[\"5Rnd_127x108_Mag\",2,\"magazin\"],[\"CUP_optic_LeupoldMk4\",1,\"item\"]]','2019-10-08 19:08:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1339,'5Rnd_127x108_Mag','radiation_zone','1','1.1','magazin','[[\"5Rnd_127x108_Mag\",2,\"magazin\"]]','2019-10-08 19:08:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1340,'CUP_srifle_AS50','radiation_zone','1','1.1','weapon','[[\"CUP_5Rnd_127x99_as50_M\",2,\"magazin\"],[\"CUP_optic_LeupoldMk4\",1,\"item\"]]','2019-10-08 19:08:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1341,'CUP_5Rnd_127x99_as50_M','radiation_zone','1','1.1','magazin','[[\"CUP_5Rnd_127x99_as50_M\",2,\"magazin\"]]','2019-10-08 19:08:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1342,'CUP_srifle_M107_Base','radiation_zone','1','1.1','weapon','[[\"CUP_10Rnd_127x99_M107\",2,\"magazin\"],[\"CUP_optic_LeupoldMk4\",1,\"item\"]]','2019-10-08 19:09:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1343,'CUP_10Rnd_127x99_M107','radiation_zone','1','1.1','magazin','[[\"CUP_10Rnd_127x99_M107\",2,\"magazin\"]]','2019-10-08 19:09:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1344,'CUP_10Rnd_127x99_M107','loot_drop','1','1.1','magazin','[[\"CUP_10Rnd_127x99_M107\",2,\"magazin\"]]','2019-10-08 19:09:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1345,'CUP_srifle_M107_Base','loot_drop','1','1.1','weapon','[[\"CUP_10Rnd_127x99_M107\",2,\"magazin\"],[\"CUP_optic_LeupoldMk4\",1,\"item\"]]','2019-10-08 19:09:13');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1346,'CUP_5Rnd_127x99_as50_M','loot_drop','1','1.1','magazin','[[\"CUP_5Rnd_127x99_as50_M\",2,\"magazin\"]]','2019-10-08 19:08:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1347,'CUP_srifle_AS50','loot_drop','1','1.1','weapon','[[\"CUP_5Rnd_127x99_as50_M\",2,\"magazin\"],[\"CUP_optic_LeupoldMk4\",1,\"item\"]]','2019-10-08 19:08:47');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1348,'5Rnd_127x108_Mag','loot_drop','1','1.1','magazin','[[\"5Rnd_127x108_Mag\",2,\"magazin\"]]','2019-10-08 19:08:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1349,'srifle_GM6_F','loot_drop','1','1.1','weapon','[[\"5Rnd_127x108_Mag\",2,\"magazin\"],[\"CUP_optic_LeupoldMk4\",1,\"item\"]]','2019-10-08 19:08:19');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1350,'7Rnd_408_Mag','loot_drop','1','1.1','magazin','[[\"7Rnd_408_Mag\",2,\"magazin\"]]','2019-10-08 19:07:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1351,'srifle_LRR_F','loot_drop','1','1.1','weapon','[[\"7Rnd_408_Mag\",2,\"magazin\"],[\"CUP_optic_LeupoldMk4\",1,\"item\"]]','2019-10-08 19:07:00');
INSERT INTO `loottable_classnames` (`uid`,`classname`,`table_type`,`min_prob`,`max_prob`,`type`,`spawn_with`,`insert_time`) VALUES (1352,'valor_torquewrench_01','industrial','1','20','item','[]','2019-10-08 19:17:57');


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
