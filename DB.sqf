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
  `classname` text NOT NULL DEFAULT,
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