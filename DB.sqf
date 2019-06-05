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
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '5000',
  `humanity` int(100) NOT NULL DEFAULT '3500',
  `gear` text NOT NULL,
  `quests` text,
  `stats` varchar(32) NOT NULL DEFAULT '"[100,100,0,12000,[]]"',
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donatorlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `position` varchar(64) NOT NULL DEFAULT '"[]"',
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


-- --------------------------------------------------------

--
-- Table structure for table `houses`
-- Needed for extDB latest update on git
--
DROP TABLE IF EXISTS `persistent_vehicles`;
CREATE TABLE IF NOT EXISTS `persistent_vehicles` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pos` varchar(64) DEFAULT NULL,
  `classname` varchar(64) NOT NULL,
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
  `seller` varchar(128) NOT NULL default '["survivor_camp"]',
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
  `gang_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `build` int(10) NOT NULL DEFAULT '0',
  `classname` text NOT NULL,
  `pos` text NOT NULL,
  `dir` varchar(64) NOT NULL,
  `vector` text NOT NULL,
  `inventory` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`base_id`),
  KEY `gang_id` (`gang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

