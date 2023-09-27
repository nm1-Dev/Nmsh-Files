-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for nmsh
CREATE DATABASE IF NOT EXISTS `nmsh` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `nmsh`;

-- Dumping structure for table nmsh.ak4y_fishing
CREATE TABLE IF NOT EXISTS `ak4y_fishing` (
  `citizenid` varchar(255) DEFAULT NULL,
  `currentXP` int(11) DEFAULT NULL,
  `tasks` longtext DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.ak4y_fishing: ~1 rows (approximately)
INSERT INTO `ak4y_fishing` (`citizenid`, `currentXP`, `tasks`, `time`) VALUES
	('IIV39976', 0, '[{"requiredCount":40,"fishName":"smallbluefish","hasCount":0,"taken":false},{"requiredCount":30,"fishName":"bluefish","hasCount":0,"taken":false},{"requiredCount":20,"fishName":"bonitosfish","hasCount":0,"taken":false},{"requiredCount":15,"fishName":"garfish","hasCount":0,"taken":false},{"requiredCount":10,"fishName":"perch","hasCount":0,"taken":false},{"requiredCount":20,"fishName":"sharkfish","hasCount":0,"taken":false}]', NULL);

-- Dumping structure for table nmsh.angelicxs_gangterritory
CREATE TABLE IF NOT EXISTS `angelicxs_gangterritory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang` varchar(60) DEFAULT NULL,
  `boss` varchar(60) DEFAULT NULL,
  `size` float NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  `locationx` float DEFAULT NULL,
  `locationy` float DEFAULT NULL,
  `locationz` float DEFAULT NULL,
  `locationw` float DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table nmsh.angelicxs_gangterritory: ~0 rows (approximately)

-- Dumping structure for table nmsh.angelicxs_gangterritorylist
CREATE TABLE IF NOT EXISTS `angelicxs_gangterritorylist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `gang` varchar(60) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `boss` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table nmsh.angelicxs_gangterritorylist: ~1 rows (approximately)
INSERT INTO `angelicxs_gangterritorylist` (`id`, `identifier`, `gang`, `name`, `boss`) VALUES
	(289, 'AIB23982', 'BALLAS', '??? ?????', 0);

-- Dumping structure for table nmsh.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.apartments: ~7 rows (approximately)
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(1, 'apartment54973', 'apartment5', 'Fantastic Plaza 4973', 'IIV39976'),
	(2, 'apartment1799', 'apartment1', 'Alta Street 799', 'IIV39976'),
	(3, 'apartment14523', 'apartment1', 'Alta Street 4523', 'IIV39976'),
	(4, 'apartment12973', 'apartment1', 'Alta Street 2973', 'IIV39976'),
	(5, 'apartment16802', 'apartment1', 'Alta Street 6802', 'IIV39976'),
	(6, 'apartment19849', 'apartment1', 'Alta Street 9849', 'IIV39976'),
	(7, 'apartment11849', 'apartment1', 'Alta Street 1849', 'IIV39976');

-- Dumping structure for table nmsh.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nmsh.bank_accounts: ~0 rows (approximately)

-- Dumping structure for table nmsh.bank_accounts_new
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.bank_accounts_new: ~11 rows (approximately)
INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 0, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('families', 0, '[]', '[]', 0, NULL),
	('lostmc', 0, '[]', '[]', 0, NULL),
	('mechanic', 0, '[]', '[]', 0, NULL),
	('police', 0, '[]', '[]', 0, NULL),
	('realestate', 0, '[]', '[]', 0, NULL),
	('triads', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL);

-- Dumping structure for table nmsh.bank_cards
CREATE TABLE IF NOT EXISTS `bank_cards` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nmsh.bank_cards: ~0 rows (approximately)

-- Dumping structure for table nmsh.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nmsh.bank_statements: ~0 rows (approximately)

-- Dumping structure for table nmsh.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `steam` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedon` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.bans: 0 rows
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;

-- Dumping structure for table nmsh.bbv_antilag
CREATE TABLE IF NOT EXISTS `bbv_antilag` (
  `plate` varchar(255) DEFAULT NULL,
  `antilag` int(11) DEFAULT NULL,
  `installer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.bbv_antilag: ~5 rows (approximately)
INSERT INTO `bbv_antilag` (`plate`, `antilag`, `installer`) VALUES
	('88SQW273', 1, 'license2:7e0ee62eeebe08a80906473f741dc2c65bd1821d'),
	('29EXU169', 1, 'license2:f58e142b5b37be564d2e91b8d406856c51a3612f'),
	('29EXU169', 1, 'license2:f58e142b5b37be564d2e91b8d406856c51a3612f'),
	('20BAI829', 1, 'license2:7e0ee62eeebe08a80906473f741dc2c65bd1821d'),
	(NULL, 1, 'license2:7e0ee62eeebe08a80906473f741dc2c65bd1821d');

-- Dumping structure for table nmsh.bees
CREATE TABLE IF NOT EXISTS `bees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext DEFAULT NULL,
  `beequeen` int(11) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Dumping data for table nmsh.bees: ~0 rows (approximately)

-- Dumping structure for table nmsh.bunkers
CREATE TABLE IF NOT EXISTS `bunkers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.bunkers: ~0 rows (approximately)

-- Dumping structure for table nmsh.cameras
CREATE TABLE IF NOT EXISTS `cameras` (
  `cid` varchar(50) DEFAULT NULL,
  `cameradata` longtext DEFAULT NULL,
  `camID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.cameras: ~2 rows (approximately)
INSERT INTO `cameras` (`cid`, `cameradata`, `camID`) VALUES
	('AIB23982', '{"camID":1,"isOnline":true,"label":"1","type":"Single Vision CCTV Camera","canRotate":false,"coords":{"x":582.8029174804688,"y":-1588.506591796875,"z":28.63543510437011,"w":325.4359436035156},"r":{"x":200.0,"z":325.4359436035156,"y":180.0}}', 1),
	('AIB23982', '{"label":"2","coords":{"x":580.6744384765625,"y":-1593.4166259765626,"z":26.0806655883789,"w":205.5131378173828},"r":{"x":200.0,"z":205.5131378173828,"y":180.0},"isOnline":true,"camID":2,"canRotate":false,"type":"Single Vision CCTV Camera"}', 2);

-- Dumping structure for table nmsh.codem_craft
CREATE TABLE IF NOT EXISTS `codem_craft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `weaponname` varchar(50) DEFAULT NULL,
  `weapontime` varchar(50) DEFAULT NULL,
  `weaponlabel` varchar(50) DEFAULT NULL,
  `itemtime` varchar(50) DEFAULT NULL,
  `images` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.codem_craft: ~0 rows (approximately)

-- Dumping structure for table nmsh.core_policepoints
CREATE TABLE IF NOT EXISTS `core_policepoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.core_policepoints: ~3 rows (approximately)
INSERT INTO `core_policepoints` (`id`, `license`, `citizenid`, `points`) VALUES
	(1, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'DML97005', 500),
	(2, 'license:3138b70881df94afecabff0a254ba609da8d65b3', 'FZN65584', 0),
	(3, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'AIB23982', 0);

-- Dumping structure for table nmsh.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.crypto: ~1 rows (approximately)
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 979, '[{"NewWorth":977,"PreviousWorth":974},{"NewWorth":977,"PreviousWorth":974},{"NewWorth":977,"PreviousWorth":974},{"NewWorth":979,"PreviousWorth":977}]');

-- Dumping structure for table nmsh.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table nmsh.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.dealers: ~1 rows (approximately)
INSERT INTO `dealers` (`id`, `name`, `coords`, `time`, `createdby`) VALUES
	(2, 'AbuGiza', '{"z":37.839599609375,"x":-700.3384399414063,"y":-147.2175750732422}', '{"max":6,"min":18}', 'AIB23982');

-- Dumping structure for table nmsh.financedata
CREATE TABLE IF NOT EXISTS `financedata` (
  `identifier` varchar(64) DEFAULT NULL,
  `max` int(64) DEFAULT NULL,
  `financed` longtext DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.financedata: ~0 rows (approximately)

-- Dumping structure for table nmsh.fuel_stations
CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `location` int(11) NOT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.fuel_stations: ~27 rows (approximately)
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES
	(1, 0, '0', 100000, 3, 0, 'Davis Avenue Ron'),
	(2, 0, '0', 100000, 3, 0, 'Grove Street LTD'),
	(3, 0, '0', 100000, 3, 0, 'Dutch London Xero'),
	(4, 0, '0', 100000, 3, 0, 'Little Seoul LTD'),
	(5, 1, 'DML97005', 99975, 3, 48, 'Strawberry Ave Xero'),
	(6, 0, '0', 100000, 3, 0, 'Popular Street Ron'),
	(7, 0, '0', 100000, 3, 0, 'Capital Blvd Ron'),
	(8, 0, '0', 100000, 3, 0, 'Mirror Park LTD'),
	(9, 0, '0', 100000, 3, 0, 'Clinton Ave Globe Oil'),
	(10, 0, '0', 100000, 3, 0, 'North Rockford Ron'),
	(11, 0, '0', 100000, 3, 0, 'Great Ocean Xero'),
	(12, 0, '0', 100000, 3, 0, 'Paleto Blvd Xero'),
	(13, 0, '0', 100000, 3, 0, 'Paleto Ron'),
	(14, 0, '0', 100000, 3, 0, 'Paleto Globe Oil'),
	(15, 0, '0', 100000, 3, 0, 'Grapeseed LTD'),
	(16, 0, '0', 99950, 3, 97, 'Sandy Shores Xero'),
	(17, 0, '0', 100000, 3, 0, 'Sandy Shores Globe Oil'),
	(18, 0, '0', 100000, 3, 0, 'Senora Freeway Xero'),
	(19, 0, '0', 100000, 3, 0, 'Harmony Globe Oil'),
	(20, 0, '0', 100000, 3, 0, 'Route 68 Globe Oil'),
	(21, 0, '0', 100000, 3, 0, 'Route 68 Workshop Globe O'),
	(22, 0, '0', 100000, 3, 0, 'Route 68 Xero'),
	(23, 0, '0', 100000, 3, 0, 'Route 68 Ron'),
	(24, 0, '0', 100000, 3, 0, 'Rex\'s Diner Globe Oil'),
	(25, 0, '0', 100000, 3, 0, 'Palmino Freeway Ron'),
	(26, 0, '0', 100000, 3, 0, 'North Rockford LTD'),
	(27, 0, '0', 100000, 3, 0, 'Alta Street Globe Oil');

-- Dumping structure for table nmsh.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.gloveboxitems: ~3 rows (approximately)
INSERT INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
	(7, '24WUM117', '[]'),
	(1, '27LOF483', '[]'),
	(8, '42BKH053', '[]');

-- Dumping structure for table nmsh.harmony_cooldown
CREATE TABLE IF NOT EXISTS `harmony_cooldown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(25) NOT NULL,
  `metadata` text NOT NULL DEFAULT '{}',
  PRIMARY KEY (`serial`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.harmony_cooldown: ~0 rows (approximately)

-- Dumping structure for table nmsh.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.houselocations: ~0 rows (approximately)

-- Dumping structure for table nmsh.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.house_plants: ~0 rows (approximately)

-- Dumping structure for table nmsh.keeppaycheck_account
CREATE TABLE IF NOT EXISTS `keeppaycheck_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `money` bigint(20) DEFAULT 0,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.keeppaycheck_account: ~13 rows (approximately)
INSERT INTO `keeppaycheck_account` (`id`, `citizenid`, `money`) VALUES
	(9, 'AIB23982', 0),
	(12, 'CJV92739', 50),
	(7, 'DML97005', 22960),
	(8, 'FZN65584', 6000),
	(10, 'HCR81520', 3420),
	(1, 'IIV39976', 14640),
	(3, 'KFA36100', 130),
	(4, 'LYY96314', 500),
	(13, 'MBZ65979', 50),
	(11, 'OGR18462', 1205),
	(6, 'QWJ19339', 60),
	(5, 'TBV94066', 20),
	(2, 'VHA78222', 10);

-- Dumping structure for table nmsh.keeppaycheck_logs
CREATE TABLE IF NOT EXISTS `keeppaycheck_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `state` tinyint(1) DEFAULT 0,
  `amount` int(11) DEFAULT 0,
  `metadata` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.keeppaycheck_logs: ~513 rows (approximately)
INSERT INTO `keeppaycheck_logs` (`id`, `citizenid`, `state`, `amount`, `metadata`, `created`) VALUES
	(1, 'IIV39976', 1, 10, '{"account":{"old_value":0,"current_value":10},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-07 23:54:24'),
	(2, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":20,"old_value":10}}', '2023-07-08 12:49:40'),
	(3, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":30,"old_value":20}}', '2023-07-08 13:10:46'),
	(4, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":40,"old_value":30}}', '2023-07-08 13:20:46'),
	(5, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":50,"old_value":40}}', '2023-07-08 13:30:46'),
	(6, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":60,"old_value":50}}', '2023-07-08 13:40:46'),
	(7, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":70,"old_value":60}}', '2023-07-08 13:50:46'),
	(8, 'IIV39976', 1, 100, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":170,"old_value":70}}', '2023-07-08 14:00:46'),
	(9, 'IIV39976', 1, 100, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":270,"old_value":170}}', '2023-07-08 14:10:46'),
	(10, 'IIV39976', 1, 100, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":370,"old_value":270}}', '2023-07-08 14:20:46'),
	(11, 'IIV39976', 1, 100, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":470,"old_value":370}}', '2023-07-08 14:30:46'),
	(12, 'IIV39976', 1, 75, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":545,"old_value":470}}', '2023-07-08 14:40:46'),
	(13, 'IIV39976', 1, 75, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":620,"old_value":545}}', '2023-07-08 14:50:46'),
	(14, 'IIV39976', 1, 10, '{"account":{"old_value":620,"current_value":630},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-08 16:23:22'),
	(15, 'IIV39976', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":630,"current_value":640}}', '2023-07-08 16:46:04'),
	(16, 'IIV39976', 1, 10, '{"account":{"old_value":640,"current_value":650},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-08 17:03:05'),
	(17, 'IIV39976', 1, 10, '{"account":{"old_value":650,"current_value":660},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-08 17:13:05'),
	(18, 'IIV39976', 1, 10, '{"account":{"old_value":660,"current_value":670},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-08 17:23:05'),
	(19, 'IIV39976', 1, 10, '{"account":{"old_value":670,"current_value":680},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-09 12:12:58'),
	(20, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":690,"old_value":680}}', '2023-07-09 12:45:53'),
	(21, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":700,"old_value":690}}', '2023-07-09 12:55:53'),
	(22, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":710,"old_value":700}}', '2023-07-09 13:05:53'),
	(23, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":720,"old_value":710}}', '2023-07-09 13:15:53'),
	(24, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":730,"old_value":720}}', '2023-07-09 13:25:53'),
	(25, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":740,"old_value":730}}', '2023-07-09 13:35:53'),
	(26, 'IIV39976', 1, 125, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":865,"old_value":740}}', '2023-07-10 12:53:15'),
	(27, 'IIV39976', 1, 125, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":990,"old_value":865}}', '2023-07-10 13:03:15'),
	(28, 'IIV39976', 1, 125, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":1115,"old_value":990}}', '2023-07-10 13:13:15'),
	(29, 'IIV39976', 1, 125, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":1240,"old_value":1115}}', '2023-07-10 13:23:15'),
	(30, 'IIV39976', 1, 125, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":1365,"old_value":1240}}', '2023-07-10 13:33:15'),
	(31, 'IIV39976', 1, 125, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":1490,"old_value":1365}}', '2023-07-10 13:43:15'),
	(32, 'IIV39976', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1500,"old_value":1490}}', '2023-07-10 14:01:25'),
	(33, 'IIV39976', 1, 10, '{"account":{"old_value":1500,"current_value":1510},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-10 19:24:23'),
	(34, 'IIV39976', 1, 150, '{"account":{"old_value":1510,"current_value":1660},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-10 19:34:23'),
	(35, 'IIV39976', 1, 10, '{"account":{"old_value":1660,"current_value":1670},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-10 20:04:23'),
	(36, 'IIV39976', 1, 150, '{"account":{"old_value":1670,"current_value":1820},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-10 20:14:23'),
	(37, 'IIV39976', 1, 150, '{"account":{"old_value":1820,"current_value":1970},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-10 20:24:23'),
	(38, 'IIV39976', 1, 150, '{"account":{"old_value":1970,"current_value":2120},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-10 20:34:23'),
	(39, 'IIV39976', 1, 150, '{"account":{"old_value":2120,"current_value":2270},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-10 20:44:23'),
	(40, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":2270,"current_value":2280}}', '2023-07-12 19:14:47'),
	(41, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":2280,"current_value":2430}}', '2023-07-12 19:24:47'),
	(42, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":2430,"current_value":2580}}', '2023-07-12 19:34:47'),
	(43, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":2730,"old_value":2580}}', '2023-07-13 12:16:35'),
	(44, 'IIV39976', 1, 150, '{"account":{"current_value":2880,"old_value":2730},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-13 12:51:07'),
	(45, 'IIV39976', 1, 150, '{"account":{"current_value":3030,"old_value":2880},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-13 13:13:30'),
	(46, 'IIV39976', 1, 150, '{"account":{"current_value":3180,"old_value":3030},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-13 13:23:30'),
	(47, 'IIV39976', 1, 150, '{"account":{"current_value":3330,"old_value":3180},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-13 13:33:31'),
	(48, 'IIV39976', 1, 150, '{"account":{"current_value":3480,"old_value":3330},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-13 13:43:30'),
	(49, 'IIV39976', 1, 150, '{"account":{"current_value":3630,"old_value":3480},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-13 13:53:31'),
	(50, 'IIV39976', 1, 150, '{"account":{"current_value":3780,"old_value":3630},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-13 14:03:31'),
	(51, 'IIV39976', 1, 150, '{"account":{"current_value":3930,"old_value":3780},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-13 14:13:31'),
	(52, 'IIV39976', 1, 150, '{"account":{"current_value":4080,"old_value":3930},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-13 14:23:31'),
	(53, 'IIV39976', 1, 150, '{"account":{"current_value":4230,"old_value":4080},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-13 14:33:31'),
	(54, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":4230,"current_value":4380}}', '2023-07-13 15:15:29'),
	(55, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":4380,"current_value":4530}}', '2023-07-13 15:25:29'),
	(56, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":4530,"current_value":4680}}', '2023-07-13 15:35:29'),
	(57, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":4680,"current_value":4830}}', '2023-07-13 15:45:29'),
	(58, 'IIV39976', 1, 150, '{"account":{"old_value":4830,"current_value":4980},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-13 16:28:05'),
	(59, 'IIV39976', 1, 150, '{"account":{"old_value":4980,"current_value":5130},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-13 16:38:05'),
	(60, 'IIV39976', 1, 150, '{"account":{"old_value":5130,"current_value":5280},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-13 16:48:05'),
	(61, 'IIV39976', 1, 150, '{"account":{"old_value":5280,"current_value":5430},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-13 18:08:06'),
	(62, 'IIV39976', 1, 150, '{"account":{"old_value":5430,"current_value":5580},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-13 18:18:06'),
	(63, 'IIV39976', 1, 10, '{"account":{"old_value":5580,"current_value":5590},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-13 18:28:06'),
	(64, 'IIV39976', 1, 150, '{"account":{"current_value":5740,"old_value":5590},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-14 12:25:43'),
	(65, 'IIV39976', 1, 150, '{"account":{"current_value":5890,"old_value":5740},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-14 12:35:43'),
	(66, 'IIV39976', 1, 150, '{"account":{"current_value":6040,"old_value":5890},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-14 12:45:43'),
	(67, 'IIV39976', 1, 150, '{"account":{"current_value":6190,"old_value":6040},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-14 12:55:43'),
	(68, 'IIV39976', 1, 150, '{"account":{"current_value":6340,"old_value":6190},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-14 13:05:43'),
	(69, 'IIV39976', 1, 150, '{"account":{"current_value":6490,"old_value":6340},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-14 13:15:43'),
	(70, 'IIV39976', 1, 150, '{"account":{"current_value":6640,"old_value":6490},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-14 13:25:43'),
	(71, 'IIV39976', 1, 150, '{"account":{"current_value":6790,"old_value":6640},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-14 13:35:43'),
	(72, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":6790,"current_value":6940}}', '2023-07-14 13:52:49'),
	(73, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":6940,"current_value":7090}}', '2023-07-14 14:02:49'),
	(74, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":7090,"current_value":7240}}', '2023-07-14 14:12:49'),
	(75, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":7240,"current_value":7390}}', '2023-07-14 14:22:49'),
	(76, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":7390,"current_value":7540}}', '2023-07-14 14:52:49'),
	(77, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":7540,"current_value":7690}}', '2023-07-14 15:02:49'),
	(78, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":7690,"current_value":7840}}', '2023-07-14 15:12:49'),
	(79, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":7840,"current_value":7990}}', '2023-07-14 15:22:49'),
	(80, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":7990,"current_value":8140}}', '2023-07-14 19:28:31'),
	(81, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":8140,"current_value":8290}}', '2023-07-14 19:38:31'),
	(82, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":8290,"current_value":8440}}', '2023-07-14 19:48:31'),
	(83, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":8440,"current_value":8590}}', '2023-07-14 19:58:31'),
	(84, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":8740,"old_value":8590}}', '2023-07-15 15:12:59'),
	(85, 'IIV39976', 1, 150, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":8890,"old_value":8740}}', '2023-07-15 15:22:59'),
	(86, 'IIV39976', 1, 100, '{"account":{"old_value":8890,"current_value":8990},"desc":{"source":{"job":"ambulance"},"type":"from"}}', '2023-07-16 12:19:58'),
	(87, 'IIV39976', 1, 100, '{"account":{"old_value":8990,"current_value":9090},"desc":{"source":{"job":"ambulance"},"type":"from"}}', '2023-07-16 12:29:58'),
	(88, 'IIV39976', 1, 100, '{"account":{"old_value":9090,"current_value":9190},"desc":{"source":{"job":"ambulance"},"type":"from"}}', '2023-07-16 12:39:58'),
	(89, 'IIV39976', 1, 10, '{"account":{"old_value":9190,"current_value":9200},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-16 13:06:12'),
	(90, 'IIV39976', 1, 75, '{"account":{"old_value":9200,"current_value":9275},"desc":{"type":"from","source":{"job":"ambulance"}}}', '2023-07-16 13:16:12'),
	(91, 'IIV39976', 1, 75, '{"account":{"old_value":9275,"current_value":9350},"desc":{"type":"from","source":{"job":"ambulance"}}}', '2023-07-16 13:26:12'),
	(92, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":9350,"current_value":9360}}', '2023-07-16 13:53:37'),
	(93, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":9360,"current_value":9370}}', '2023-07-16 14:03:37'),
	(94, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":9370,"current_value":9380}}', '2023-07-16 14:13:37'),
	(95, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":9380,"current_value":9390}}', '2023-07-16 14:23:37'),
	(96, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":9400,"old_value":9390}}', '2023-07-17 15:49:43'),
	(97, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":9400,"current_value":9410}}', '2023-07-17 20:17:15'),
	(98, 'IIV39976', 1, 10, '{"account":{"old_value":9410,"current_value":9420},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-18 13:27:47'),
	(99, 'IIV39976', 1, 10, '{"account":{"old_value":9420,"current_value":9430},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-18 13:47:47'),
	(100, 'IIV39976', 1, 10, '{"account":{"current_value":9440,"old_value":9430},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-18 16:42:23'),
	(101, 'IIV39976', 1, 10, '{"account":{"current_value":9450,"old_value":9440},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-18 16:52:23'),
	(102, 'IIV39976', 1, 10, '{"account":{"current_value":9460,"old_value":9450},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-18 17:02:23'),
	(103, 'IIV39976', 1, 10, '{"account":{"current_value":9470,"old_value":9460},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-18 17:12:23'),
	(104, 'IIV39976', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":9480,"old_value":9470}}', '2023-07-18 17:33:03'),
	(105, 'IIV39976', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":9490,"old_value":9480}}', '2023-07-18 17:43:03'),
	(106, 'IIV39976', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":9500,"old_value":9490}}', '2023-07-18 17:53:03'),
	(107, 'IIV39976', 1, 10, '{"account":{"old_value":9500,"current_value":9510},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-18 18:42:10'),
	(108, 'VHA78222', 1, 10, '{"account":{"old_value":0,"current_value":10},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-18 18:52:09'),
	(109, 'IIV39976', 1, 75, '{"account":{"old_value":9510,"current_value":9585},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-18 19:02:09'),
	(110, 'IIV39976', 1, 75, '{"account":{"old_value":9585,"current_value":9660},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-18 19:12:09'),
	(111, 'IIV39976', 1, 75, '{"account":{"old_value":9660,"current_value":9735},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-19 12:48:07'),
	(112, 'IIV39976', 1, 75, '{"account":{"old_value":9735,"current_value":9810},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-19 12:58:07'),
	(113, 'IIV39976', 1, 75, '{"account":{"old_value":9810,"current_value":9885},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-19 13:08:07'),
	(114, 'IIV39976', 1, 75, '{"account":{"old_value":9885,"current_value":9960},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-19 13:18:07'),
	(115, 'IIV39976', 1, 75, '{"account":{"old_value":9960,"current_value":10035},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-19 13:28:07'),
	(116, 'IIV39976', 1, 75, '{"account":{"old_value":10035,"current_value":10110},"desc":{"source":{"job":"taxi"},"type":"from"}}', '2023-07-19 13:38:07'),
	(117, 'IIV39976', 1, 10, '{"account":{"old_value":10110,"current_value":10120},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-19 13:48:07'),
	(118, 'IIV39976', 1, 10, '{"account":{"old_value":10120,"current_value":10130},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-19 13:58:07'),
	(119, 'IIV39976', 1, 150, '{"account":{"old_value":10130,"current_value":10280},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-19 14:08:07'),
	(120, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":10280,"current_value":10430}}', '2023-07-20 11:43:26'),
	(121, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":10430,"current_value":10580}}', '2023-07-20 11:53:26'),
	(122, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":10580,"current_value":10730}}', '2023-07-20 12:03:26'),
	(123, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":10730,"current_value":10880}}', '2023-07-20 12:13:26'),
	(124, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":10880,"current_value":11030}}', '2023-07-20 12:23:26'),
	(125, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":11030,"current_value":11180}}', '2023-07-20 12:33:26'),
	(126, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":11180,"current_value":11330}}', '2023-07-20 12:43:26'),
	(127, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":11330,"current_value":11480}}', '2023-07-20 12:53:26'),
	(128, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":11480,"current_value":11630}}', '2023-07-20 13:03:26'),
	(129, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":11630,"current_value":11780}}', '2023-07-20 13:13:26'),
	(130, 'IIV39976', 1, 150, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":11930,"old_value":11780}}', '2023-07-20 20:37:01'),
	(131, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"auction"}},"account":{"current_value":11960,"old_value":11930}}', '2023-07-20 20:56:48'),
	(132, 'IIV39976', 1, 10, '{"account":{"current_value":11970,"old_value":11960},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-22 12:34:37'),
	(133, 'IIV39976', 1, 30, '{"account":{"current_value":12000,"old_value":11970},"desc":{"source":{"job":"auction"},"type":"from"}}', '2023-07-22 12:44:37'),
	(134, 'IIV39976', 1, 30, '{"account":{"current_value":12030,"old_value":12000},"desc":{"source":{"job":"auction"},"type":"from"}}', '2023-07-22 12:54:37'),
	(135, 'IIV39976', 1, 10, '{"account":{"old_value":12030,"current_value":12040},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-23 14:44:34'),
	(136, 'IIV39976', 1, 10, '{"account":{"current_value":12050,"old_value":12040},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-23 22:34:52'),
	(137, 'IIV39976', 1, 10, '{"account":{"current_value":12060,"old_value":12050},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-23 22:44:53'),
	(138, 'IIV39976', 1, 10, '{"account":{"current_value":12070,"old_value":12060},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-24 13:07:18'),
	(139, 'IIV39976', 1, 10, '{"account":{"current_value":12080,"old_value":12070},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-24 21:30:07'),
	(140, 'IIV39976', 1, 10, '{"account":{"current_value":12090,"old_value":12080},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-24 21:55:07'),
	(141, 'IIV39976', 1, 10, '{"account":{"current_value":12100,"old_value":12090},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-24 22:05:07'),
	(142, 'IIV39976', 1, 10, '{"account":{"old_value":12100,"current_value":12110},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-25 14:39:13'),
	(143, 'IIV39976', 1, 10, '{"account":{"old_value":12110,"current_value":12120},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-25 14:49:13'),
	(144, 'IIV39976', 1, 10, '{"account":{"old_value":12120,"current_value":12130},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-07-25 14:59:13'),
	(145, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12160,"old_value":12130}}', '2023-07-25 15:50:55'),
	(146, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12190,"old_value":12160}}', '2023-07-25 16:00:55'),
	(147, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12220,"old_value":12190}}', '2023-07-25 16:10:55'),
	(148, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12250,"old_value":12220}}', '2023-07-25 16:20:55'),
	(149, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12280,"old_value":12250}}', '2023-07-25 16:30:55'),
	(150, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12310,"old_value":12280}}', '2023-07-25 16:40:55'),
	(151, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12340,"old_value":12310}}', '2023-07-25 16:50:55'),
	(152, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12370,"old_value":12340}}', '2023-07-25 17:00:55'),
	(153, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12400,"old_value":12370}}', '2023-07-25 17:10:55'),
	(154, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12430,"old_value":12400}}', '2023-07-25 17:20:55'),
	(155, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12460,"old_value":12430}}', '2023-07-25 17:30:55'),
	(156, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12490,"old_value":12460}}', '2023-07-25 17:40:55'),
	(157, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12520,"old_value":12490}}', '2023-07-25 17:50:55'),
	(158, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12550,"old_value":12520}}', '2023-07-25 18:00:55'),
	(159, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12580,"old_value":12550}}', '2023-07-25 18:10:55'),
	(160, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12610,"old_value":12580}}', '2023-07-25 18:20:56'),
	(161, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12640,"old_value":12610}}', '2023-07-25 18:30:56'),
	(162, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12670,"old_value":12640}}', '2023-07-25 18:40:56'),
	(163, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12700,"old_value":12670}}', '2023-07-25 18:50:56'),
	(164, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12730,"old_value":12700}}', '2023-07-25 19:00:56'),
	(165, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12760,"old_value":12730}}', '2023-07-25 19:10:56'),
	(166, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":12790,"old_value":12760}}', '2023-07-25 19:20:56'),
	(167, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":12790,"current_value":12820}}', '2023-07-25 19:52:37'),
	(168, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":12820,"current_value":12850}}', '2023-07-25 20:02:37'),
	(169, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":12850,"current_value":12880}}', '2023-07-25 20:23:24'),
	(170, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":12880,"current_value":12910}}', '2023-07-25 20:33:24'),
	(171, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":12910,"current_value":12940}}', '2023-07-25 20:43:24'),
	(172, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":12940,"current_value":12970}}', '2023-07-25 20:53:24'),
	(173, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":12970,"current_value":13000}}', '2023-07-25 22:30:51'),
	(174, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13000,"current_value":13030}}', '2023-07-25 22:40:51'),
	(175, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13030,"current_value":13060}}', '2023-07-25 22:50:51'),
	(176, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13060,"current_value":13090}}', '2023-07-25 23:00:51'),
	(177, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13090,"current_value":13120}}', '2023-07-25 23:10:51'),
	(178, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13120,"current_value":13150}}', '2023-07-25 23:20:51'),
	(179, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13150,"current_value":13180}}', '2023-07-25 23:30:55'),
	(180, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13180,"current_value":13210}}', '2023-07-25 23:40:55'),
	(181, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13210,"current_value":13240}}', '2023-07-25 23:50:55'),
	(182, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13240,"current_value":13270}}', '2023-07-26 00:00:56'),
	(183, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13270,"current_value":13300}}', '2023-07-26 00:10:56'),
	(184, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13300,"current_value":13330}}', '2023-07-26 00:20:56'),
	(185, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13330,"current_value":13360}}', '2023-07-26 00:30:56'),
	(186, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":13390,"old_value":13360}}', '2023-07-26 10:20:39'),
	(187, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":13420,"old_value":13390}}', '2023-07-26 10:30:39'),
	(188, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":13450,"old_value":13420}}', '2023-07-26 10:40:39'),
	(189, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":13480,"old_value":13450}}', '2023-07-26 10:50:39'),
	(190, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":13510,"old_value":13480}}', '2023-07-26 11:00:39'),
	(191, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":13540,"old_value":13510}}', '2023-07-26 11:10:39'),
	(192, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":13570,"old_value":13540}}', '2023-07-26 11:20:39'),
	(193, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":13600,"old_value":13570}}', '2023-07-26 11:30:39'),
	(194, 'IIV39976', 1, 30, '{"account":{"old_value":13600,"current_value":13630},"desc":{"type":"from","source":{"job":"police"}}}', '2023-07-26 11:43:45'),
	(195, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":13660,"old_value":13630}}', '2023-07-26 12:04:55'),
	(196, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":13690,"old_value":13660}}', '2023-07-26 12:14:55'),
	(197, 'IIV39976', 1, 30, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":13720,"old_value":13690}}', '2023-07-26 12:34:56'),
	(198, 'IIV39976', 1, 30, '{"account":{"current_value":13750,"old_value":13720},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-26 16:30:29'),
	(199, 'IIV39976', 1, 30, '{"account":{"current_value":13780,"old_value":13750},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-26 16:40:29'),
	(200, 'IIV39976', 1, 30, '{"account":{"current_value":13810,"old_value":13780},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-26 16:50:29'),
	(201, 'IIV39976', 1, 30, '{"account":{"current_value":13840,"old_value":13810},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-26 17:00:30'),
	(202, 'IIV39976', 1, 30, '{"account":{"current_value":13870,"old_value":13840},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-26 17:10:30'),
	(203, 'IIV39976', 1, 30, '{"account":{"current_value":13900,"old_value":13870},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-26 17:20:30'),
	(204, 'IIV39976', 1, 30, '{"account":{"current_value":13930,"old_value":13900},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-26 17:40:30'),
	(205, 'IIV39976', 1, 30, '{"account":{"current_value":13960,"old_value":13930},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-26 17:50:30'),
	(206, 'IIV39976', 1, 30, '{"account":{"current_value":13990,"old_value":13960},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-28 10:27:48'),
	(207, 'IIV39976', 1, 30, '{"account":{"current_value":14020,"old_value":13990},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-07-29 11:37:27'),
	(208, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":14020,"current_value":14050}}', '2023-07-29 12:26:09'),
	(209, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":14050,"current_value":14080}}', '2023-07-29 12:36:09'),
	(210, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":14080,"current_value":14110}}', '2023-07-29 14:05:41'),
	(211, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"auction"}},"account":{"old_value":14110,"current_value":14140}}', '2023-07-29 14:15:41'),
	(212, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"auction"}},"account":{"old_value":14140,"current_value":14170}}', '2023-07-29 14:25:41'),
	(213, 'IIV39976', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":14180,"old_value":14170}}', '2023-07-29 22:24:46'),
	(214, 'IIV39976', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":14190,"old_value":14180}}', '2023-07-29 22:34:46'),
	(215, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"auction"}},"account":{"current_value":14220,"old_value":14190}}', '2023-07-30 11:07:39'),
	(216, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"auction"}},"account":{"current_value":14250,"old_value":14220}}', '2023-07-30 11:17:39'),
	(217, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"auction"}},"account":{"current_value":14280,"old_value":14250}}', '2023-07-30 11:27:39'),
	(218, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"auction"}},"account":{"current_value":14310,"old_value":14280}}', '2023-07-30 11:37:39'),
	(219, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"auction"}},"account":{"current_value":14340,"old_value":14310}}', '2023-07-30 11:47:39'),
	(220, 'IIV39976', 1, 30, '{"desc":{"type":"from","source":{"job":"auction"}},"account":{"current_value":14370,"old_value":14340}}', '2023-07-30 11:57:39'),
	(221, 'IIV39976', 1, 10, '{"account":{"current_value":14380,"old_value":14370},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 19:27:12'),
	(222, 'IIV39976', 1, 10, '{"account":{"current_value":14390,"old_value":14380},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 19:37:12'),
	(223, 'IIV39976', 1, 10, '{"account":{"current_value":14400,"old_value":14390},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 19:47:12'),
	(224, 'IIV39976', 1, 10, '{"account":{"current_value":14410,"old_value":14400},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 19:57:12'),
	(225, 'IIV39976', 1, 10, '{"account":{"current_value":14420,"old_value":14410},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 20:07:12'),
	(226, 'IIV39976', 1, 10, '{"account":{"current_value":14430,"old_value":14420},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 20:17:12'),
	(227, 'IIV39976', 1, 10, '{"account":{"current_value":14440,"old_value":14430},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 20:27:12'),
	(228, 'IIV39976', 1, 10, '{"account":{"current_value":14450,"old_value":14440},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 20:37:12'),
	(229, 'IIV39976', 1, 10, '{"account":{"current_value":14460,"old_value":14450},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 20:47:12'),
	(230, 'IIV39976', 1, 10, '{"account":{"current_value":14470,"old_value":14460},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 20:57:12'),
	(231, 'IIV39976', 1, 10, '{"account":{"current_value":14480,"old_value":14470},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 21:07:12'),
	(232, 'IIV39976', 1, 10, '{"account":{"current_value":14490,"old_value":14480},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 21:17:12'),
	(233, 'IIV39976', 1, 10, '{"account":{"current_value":14500,"old_value":14490},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 21:27:12'),
	(234, 'IIV39976', 1, 10, '{"account":{"current_value":14510,"old_value":14500},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 21:37:12'),
	(235, 'IIV39976', 1, 10, '{"account":{"current_value":14520,"old_value":14510},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-07-30 21:47:12'),
	(236, 'IIV39976', 1, 10, '{"account":{"old_value":14520,"current_value":14530},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-01 11:15:07'),
	(237, 'IIV39976', 1, 10, '{"account":{"old_value":14530,"current_value":14540},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-01 11:25:07'),
	(238, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":14550,"old_value":14540}}', '2023-08-01 20:10:05'),
	(239, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":14560,"old_value":14550}}', '2023-08-01 20:20:05'),
	(240, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":14570,"old_value":14560}}', '2023-08-01 20:51:50'),
	(241, 'IIV39976', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":14580,"old_value":14570}}', '2023-08-01 21:01:50'),
	(242, 'IIV39976', 1, 10, '{"account":{"current_value":14590,"old_value":14580},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-01 21:25:53'),
	(243, 'IIV39976', 1, 10, '{"account":{"current_value":14600,"old_value":14590},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-02 13:10:37'),
	(244, 'IIV39976', 1, 10, '{"account":{"current_value":14610,"old_value":14600},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-02 13:20:37'),
	(245, 'IIV39976', 1, 10, '{"account":{"current_value":14620,"old_value":14610},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-02 13:30:37'),
	(246, 'IIV39976', 1, 10, '{"account":{"current_value":14630,"old_value":14620},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-02 13:40:37'),
	(247, 'IIV39976', 1, 10, '{"account":{"current_value":14640,"old_value":14630},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-02 13:50:37'),
	(248, 'KFA36100', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":0,"current_value":10}}', '2023-08-08 14:23:58'),
	(249, 'KFA36100', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":10,"current_value":20}}', '2023-08-08 14:33:58'),
	(250, 'KFA36100', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":20,"current_value":30}}', '2023-08-08 14:43:58'),
	(251, 'KFA36100', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":30,"current_value":40}}', '2023-08-08 14:53:58'),
	(252, 'KFA36100', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":40,"current_value":50}}', '2023-08-08 15:03:58'),
	(253, 'KFA36100', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":50,"current_value":60}}', '2023-08-08 15:13:59'),
	(254, 'KFA36100', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":60,"current_value":70}}', '2023-08-08 15:23:58'),
	(255, 'KFA36100', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":70,"current_value":80}}', '2023-08-08 15:33:59'),
	(256, 'KFA36100', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":80,"current_value":90}}', '2023-08-08 15:43:59'),
	(257, 'KFA36100', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":100,"old_value":90}}', '2023-08-08 18:47:56'),
	(258, 'KFA36100', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":110,"old_value":100}}', '2023-08-08 18:57:56'),
	(259, 'KFA36100', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":120,"old_value":110}}', '2023-08-08 19:07:56'),
	(260, 'KFA36100', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":130,"old_value":120}}', '2023-08-08 19:17:56'),
	(261, 'LYY96314', 1, 10, '{"account":{"old_value":0,"current_value":10},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-09 20:14:48'),
	(262, 'LYY96314', 1, 100, '{"account":{"old_value":10,"current_value":110},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-08-09 20:24:48'),
	(263, 'LYY96314', 1, 100, '{"account":{"old_value":110,"current_value":210},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-08-09 20:34:48'),
	(264, 'LYY96314', 1, 100, '{"account":{"old_value":210,"current_value":310},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-08-09 20:44:48'),
	(265, 'LYY96314', 1, 100, '{"account":{"old_value":310,"current_value":410},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-08-09 20:54:48'),
	(266, 'LYY96314', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":420,"old_value":410}}', '2023-08-09 21:14:00'),
	(267, 'LYY96314', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":430,"old_value":420}}', '2023-08-09 21:24:00'),
	(268, 'LYY96314', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":440,"old_value":430}}', '2023-08-09 21:34:00'),
	(269, 'LYY96314', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":450,"old_value":440}}', '2023-08-09 21:44:00'),
	(270, 'LYY96314', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":460,"old_value":450}}', '2023-08-09 21:54:00'),
	(271, 'LYY96314', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":470,"old_value":460}}', '2023-08-09 22:04:00'),
	(272, 'LYY96314', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":480,"old_value":470}}', '2023-08-09 22:14:00'),
	(273, 'LYY96314', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":490,"old_value":480}}', '2023-08-09 22:24:00'),
	(274, 'LYY96314', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":500,"old_value":490}}', '2023-08-09 22:34:00'),
	(275, 'TBV94066', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":10,"old_value":0}}', '2023-08-15 19:47:30'),
	(276, 'TBV94066', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":20,"old_value":10}}', '2023-08-15 19:57:30'),
	(277, 'QWJ19339', 1, 10, '{"account":{"old_value":0,"current_value":10},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-15 20:32:12'),
	(278, 'QWJ19339', 1, 10, '{"account":{"old_value":10,"current_value":20},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-15 20:42:12'),
	(279, 'QWJ19339', 1, 10, '{"account":{"old_value":20,"current_value":30},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-15 20:52:12'),
	(280, 'QWJ19339', 1, 10, '{"account":{"old_value":30,"current_value":40},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-15 21:02:12'),
	(281, 'QWJ19339', 1, 10, '{"account":{"old_value":40,"current_value":50},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-15 21:12:12'),
	(282, 'QWJ19339', 1, 10, '{"account":{"old_value":50,"current_value":60},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-15 21:22:12'),
	(283, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":0,"current_value":10}}', '2023-08-17 20:01:52'),
	(284, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":10,"current_value":20}}', '2023-08-17 20:11:52'),
	(285, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":20,"current_value":30}}', '2023-08-17 20:21:52'),
	(286, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":30,"current_value":40}}', '2023-08-17 20:31:52'),
	(287, 'DML97005', 1, 10, '{"account":{"old_value":40,"current_value":50},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-19 14:39:34'),
	(288, 'DML97005', 1, 10, '{"account":{"old_value":50,"current_value":60},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-19 14:49:34'),
	(289, 'DML97005', 1, 10, '{"account":{"current_value":70,"old_value":60},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-21 11:46:50'),
	(290, 'DML97005', 1, 10, '{"account":{"old_value":70,"current_value":80},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-21 16:45:07'),
	(291, 'DML97005', 1, 10, '{"account":{"old_value":80,"current_value":90},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-21 16:55:07'),
	(292, 'DML97005', 1, 10, '{"account":{"old_value":90,"current_value":100},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-21 17:05:07'),
	(293, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":100,"current_value":110}}', '2023-08-21 17:18:22'),
	(294, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":110,"current_value":120}}', '2023-08-21 17:28:22'),
	(295, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":120,"current_value":130}}', '2023-08-21 17:38:22'),
	(296, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":130,"current_value":140}}', '2023-08-21 17:48:22'),
	(297, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":140,"current_value":150}}', '2023-08-21 17:58:22'),
	(298, 'DML97005', 1, 10, '{"account":{"old_value":150,"current_value":160},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-22 17:44:27'),
	(299, 'DML97005', 1, 10, '{"account":{"old_value":160,"current_value":170},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-22 17:54:27'),
	(300, 'DML97005', 1, 100, '{"account":{"old_value":170,"current_value":270},"desc":{"type":"from","source":{"job":"police"}}}', '2023-08-22 18:04:27'),
	(301, 'DML97005', 1, 100, '{"account":{"old_value":270,"current_value":370},"desc":{"type":"from","source":{"job":"police"}}}', '2023-08-22 18:14:27'),
	(302, 'DML97005', 1, 100, '{"account":{"old_value":370,"current_value":470},"desc":{"type":"from","source":{"job":"police"}}}', '2023-08-22 18:24:27'),
	(303, 'DML97005', 1, 100, '{"account":{"old_value":470,"current_value":570},"desc":{"type":"from","source":{"job":"police"}}}', '2023-08-22 18:34:27'),
	(304, 'DML97005', 1, 100, '{"account":{"old_value":570,"current_value":670},"desc":{"type":"from","source":{"job":"police"}}}', '2023-08-22 18:44:27'),
	(305, 'DML97005', 1, 100, '{"account":{"old_value":670,"current_value":770},"desc":{"type":"from","source":{"job":"police"}}}', '2023-08-22 18:54:27'),
	(306, 'DML97005', 1, 100, '{"account":{"old_value":770,"current_value":870},"desc":{"type":"from","source":{"job":"police"}}}', '2023-08-22 19:04:27'),
	(307, 'DML97005', 1, 100, '{"account":{"old_value":870,"current_value":970},"desc":{"type":"from","source":{"job":"police"}}}', '2023-08-22 19:14:27'),
	(308, 'DML97005', 1, 10, '{"account":{"current_value":980,"old_value":970},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-22 21:38:22'),
	(309, 'DML97005', 1, 10, '{"account":{"current_value":990,"old_value":980},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-22 21:48:22'),
	(310, 'DML97005', 1, 10, '{"account":{"current_value":1000,"old_value":990},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-22 21:58:22'),
	(311, 'DML97005', 1, 10, '{"account":{"current_value":1010,"old_value":1000},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-22 22:08:22'),
	(312, 'DML97005', 1, 10, '{"account":{"current_value":1020,"old_value":1010},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 12:24:44'),
	(313, 'DML97005', 1, 10, '{"account":{"current_value":1030,"old_value":1020},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 12:34:44'),
	(314, 'DML97005', 1, 10, '{"account":{"current_value":1040,"old_value":1030},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 12:44:44'),
	(315, 'DML97005', 1, 10, '{"account":{"current_value":1050,"old_value":1040},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 12:54:44'),
	(316, 'DML97005', 1, 10, '{"account":{"current_value":1060,"old_value":1050},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 13:04:44'),
	(317, 'DML97005', 1, 10, '{"account":{"current_value":1070,"old_value":1060},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 13:14:44'),
	(318, 'DML97005', 1, 10, '{"account":{"current_value":1080,"old_value":1070},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 13:24:44'),
	(319, 'DML97005', 1, 10, '{"account":{"current_value":1090,"old_value":1080},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 13:34:44'),
	(320, 'DML97005', 1, 10, '{"account":{"current_value":1100,"old_value":1090},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 13:44:44'),
	(321, 'DML97005', 1, 10, '{"account":{"current_value":1110,"old_value":1100},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 13:54:45'),
	(322, 'DML97005', 1, 10, '{"account":{"current_value":1120,"old_value":1110},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 14:04:45'),
	(323, 'DML97005', 1, 10, '{"account":{"current_value":1130,"old_value":1120},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 14:14:45'),
	(324, 'DML97005', 1, 10, '{"account":{"current_value":1140,"old_value":1130},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 14:24:45'),
	(325, 'DML97005', 1, 10, '{"account":{"current_value":1150,"old_value":1140},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 14:34:45'),
	(326, 'DML97005', 1, 10, '{"account":{"current_value":1160,"old_value":1150},"desc":{"type":"from","source":{"job":"unemployed"}}}', '2023-08-23 14:44:45'),
	(327, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1170,"old_value":1160}}', '2023-08-23 16:31:52'),
	(328, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1180,"old_value":1170}}', '2023-08-23 16:41:52'),
	(329, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1190,"old_value":1180}}', '2023-08-23 16:51:52'),
	(330, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1200,"old_value":1190}}', '2023-08-23 17:01:52'),
	(331, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1210,"old_value":1200}}', '2023-08-23 17:11:52'),
	(332, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1220,"old_value":1210}}', '2023-08-23 17:21:52'),
	(333, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1230,"old_value":1220}}', '2023-08-23 17:31:52'),
	(334, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1240,"old_value":1230}}', '2023-08-23 17:41:52'),
	(335, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":1250,"old_value":1240}}', '2023-08-23 17:58:35'),
	(336, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":1260,"old_value":1250}}', '2023-08-23 18:08:35'),
	(337, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":1270,"old_value":1260}}', '2023-08-23 18:18:35'),
	(338, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":1280,"old_value":1270}}', '2023-08-23 18:28:35'),
	(339, 'DML97005', 1, 10, '{"account":{"old_value":1280,"current_value":1290},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 20:03:04'),
	(340, 'DML97005', 1, 10, '{"account":{"old_value":1290,"current_value":1300},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 20:13:04'),
	(341, 'DML97005', 1, 10, '{"account":{"old_value":1300,"current_value":1310},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 20:23:04'),
	(342, 'DML97005', 1, 10, '{"account":{"old_value":1310,"current_value":1320},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 20:33:04'),
	(343, 'DML97005', 1, 10, '{"account":{"old_value":1320,"current_value":1330},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 20:43:04'),
	(344, 'DML97005', 1, 10, '{"account":{"old_value":1330,"current_value":1340},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 20:53:04'),
	(345, 'DML97005', 1, 10, '{"account":{"old_value":1340,"current_value":1350},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 21:03:04'),
	(346, 'DML97005', 1, 10, '{"account":{"old_value":1350,"current_value":1360},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 21:13:04'),
	(347, 'DML97005', 1, 10, '{"account":{"old_value":1360,"current_value":1370},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 21:23:04'),
	(348, 'DML97005', 1, 10, '{"account":{"old_value":1370,"current_value":1380},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 21:33:04'),
	(349, 'DML97005', 1, 10, '{"account":{"old_value":1380,"current_value":1390},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 21:43:04'),
	(350, 'DML97005', 1, 10, '{"account":{"old_value":1390,"current_value":1400},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 21:53:04'),
	(351, 'DML97005', 1, 10, '{"account":{"old_value":1400,"current_value":1410},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 22:03:04'),
	(352, 'DML97005', 1, 10, '{"account":{"old_value":1410,"current_value":1420},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-23 22:13:05'),
	(353, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1430,"old_value":1420}}', '2023-08-26 13:53:19'),
	(354, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":1430,"current_value":1440}}', '2023-08-27 11:53:19'),
	(355, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":1440,"current_value":1450}}', '2023-08-27 12:03:19'),
	(356, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":1450,"current_value":1460}}', '2023-08-27 12:13:19'),
	(357, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":1470,"old_value":1460}}', '2023-08-27 12:28:09'),
	(358, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":1480,"old_value":1470}}', '2023-08-27 12:38:09'),
	(359, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":1490,"old_value":1480}}', '2023-08-27 12:48:09'),
	(360, 'DML97005', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":1500,"old_value":1490}}', '2023-08-27 12:58:09'),
	(361, 'DML97005', 1, 10, '{"account":{"current_value":1510,"old_value":1500},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-30 20:54:32'),
	(362, 'DML97005', 1, 10, '{"account":{"current_value":1520,"old_value":1510},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-30 21:04:32'),
	(363, 'DML97005', 1, 10, '{"account":{"current_value":1530,"old_value":1520},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-30 21:14:32'),
	(364, 'DML97005', 1, 10, '{"account":{"current_value":1540,"old_value":1530},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-08-30 21:24:32'),
	(365, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":1550,"old_value":1540}}', '2023-08-30 21:42:35'),
	(366, 'DML97005', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":2300,"old_value":1550}}', '2023-08-30 21:52:35'),
	(367, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":2310,"old_value":2300}}', '2023-08-31 12:14:19'),
	(368, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":2320,"old_value":2310}}', '2023-08-31 12:24:19'),
	(369, 'DML97005', 1, 600, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":2920,"old_value":2320}}', '2023-08-31 12:34:19'),
	(370, 'DML97005', 1, 750, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":3670,"old_value":2920}}', '2023-08-31 21:24:12'),
	(371, 'DML97005', 1, 500, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":4170,"old_value":3670}}', '2023-08-31 21:34:12'),
	(372, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":4170,"current_value":4180}}', '2023-09-01 11:03:36'),
	(373, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":4180,"current_value":4190}}', '2023-09-01 11:13:36'),
	(374, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":4190,"current_value":4200}}', '2023-09-01 11:23:36'),
	(375, 'DML97005', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":4210,"old_value":4200}}', '2023-09-01 11:38:01'),
	(376, 'DML97005', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":4960,"old_value":4210}}', '2023-09-01 11:48:01'),
	(377, 'FZN65584', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":750,"old_value":0}}', '2023-09-01 11:48:01'),
	(378, 'DML97005', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":5710,"old_value":4960}}', '2023-09-01 11:58:01'),
	(379, 'DML97005', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":6460,"old_value":5710}}', '2023-09-01 12:08:01'),
	(380, 'DML97005', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":7210,"old_value":6460}}', '2023-09-01 12:18:01'),
	(381, 'DML97005', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":7960,"old_value":7210}}', '2023-09-01 12:28:01'),
	(382, 'DML97005', 1, 750, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":8710,"old_value":7960}}', '2023-09-01 13:09:33'),
	(383, 'DML97005', 1, 750, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":9460,"old_value":8710}}', '2023-09-01 13:19:33'),
	(384, 'DML97005', 1, 750, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":10210,"old_value":9460}}', '2023-09-01 20:29:32'),
	(385, 'DML97005', 1, 750, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":10210,"current_value":10960}}', '2023-09-01 21:49:46'),
	(386, 'DML97005', 1, 750, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":10960,"current_value":11710}}', '2023-09-01 21:59:46'),
	(387, 'DML97005', 1, 750, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":11710,"current_value":12460}}', '2023-09-01 22:09:46'),
	(388, 'DML97005', 1, 750, '{"account":{"old_value":12460,"current_value":13210},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 10:53:29'),
	(389, 'FZN65584', 1, 750, '{"account":{"old_value":750,"current_value":1500},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:03:29'),
	(390, 'DML97005', 1, 750, '{"account":{"old_value":13210,"current_value":13960},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:03:29'),
	(391, 'FZN65584', 1, 750, '{"account":{"old_value":1500,"current_value":2250},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:13:29'),
	(392, 'DML97005', 1, 750, '{"account":{"old_value":13960,"current_value":14710},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:13:29'),
	(393, 'FZN65584', 1, 750, '{"account":{"old_value":2250,"current_value":3000},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:23:29'),
	(394, 'DML97005', 1, 750, '{"account":{"old_value":14710,"current_value":15460},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:23:29'),
	(395, 'FZN65584', 1, 750, '{"account":{"old_value":3000,"current_value":3750},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:33:29'),
	(396, 'DML97005', 1, 750, '{"account":{"old_value":15460,"current_value":16210},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:33:29'),
	(397, 'DML97005', 1, 750, '{"account":{"old_value":16210,"current_value":16960},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:43:29'),
	(398, 'FZN65584', 1, 750, '{"account":{"old_value":3750,"current_value":4500},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:43:29'),
	(399, 'DML97005', 1, 750, '{"account":{"old_value":16960,"current_value":17710},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:53:29'),
	(400, 'FZN65584', 1, 750, '{"account":{"old_value":4500,"current_value":5250},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 11:53:29'),
	(401, 'FZN65584', 1, 750, '{"account":{"old_value":5250,"current_value":6000},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 12:03:29'),
	(402, 'DML97005', 1, 750, '{"account":{"old_value":17710,"current_value":18460},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 12:03:29'),
	(403, 'DML97005', 1, 750, '{"account":{"old_value":18460,"current_value":19210},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 12:13:29'),
	(404, 'DML97005', 1, 750, '{"account":{"old_value":19210,"current_value":19960},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 12:23:29'),
	(405, 'DML97005', 1, 750, '{"account":{"old_value":19960,"current_value":20710},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 12:33:29'),
	(406, 'DML97005', 1, 750, '{"account":{"old_value":20710,"current_value":21460},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-02 15:08:42'),
	(407, 'DML97005', 1, 750, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":22210,"old_value":21460}}', '2023-09-02 20:05:29'),
	(408, 'DML97005', 1, 750, '{"account":{"old_value":22210,"current_value":22960},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-02 20:54:12'),
	(409, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":10,"old_value":0}}', '2023-09-02 21:19:07'),
	(410, 'AIB23982', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":10,"current_value":20}}', '2023-09-03 13:40:23'),
	(411, 'AIB23982', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":20,"current_value":30}}', '2023-09-03 13:50:23'),
	(412, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":40,"old_value":30}}', '2023-09-03 14:07:27'),
	(413, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":50,"old_value":40}}', '2023-09-03 14:17:27'),
	(414, 'AIB23982', 1, 10, '{"account":{"current_value":60,"old_value":50},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-09-03 14:29:15'),
	(415, 'AIB23982', 1, 10, '{"account":{"current_value":70,"old_value":60},"desc":{"source":{"job":"unemployed"},"type":"from"}}', '2023-09-03 14:39:15'),
	(416, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":80,"old_value":70}}', '2023-09-03 14:50:23'),
	(417, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":90,"old_value":80}}', '2023-09-03 15:00:23'),
	(418, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":100,"old_value":90}}', '2023-09-03 15:10:23'),
	(419, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"current_value":110,"old_value":100}}', '2023-09-03 15:20:23'),
	(420, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":110,"current_value":120}}', '2023-09-03 22:25:50'),
	(421, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":120,"current_value":130}}', '2023-09-03 22:35:50'),
	(422, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":130,"current_value":140}}', '2023-09-03 22:45:50'),
	(423, 'AIB23982', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":140,"current_value":150}}', '2023-09-03 22:55:50'),
	(424, 'AIB23982', 1, 185, '{"desc":{"type":"from","source":{"job":"burgershot"}},"account":{"old_value":150,"current_value":335}}', '2023-09-04 11:59:52'),
	(425, 'AIB23982', 1, 185, '{"desc":{"type":"from","source":{"job":"burgershot"}},"account":{"old_value":335,"current_value":520}}', '2023-09-04 12:09:53'),
	(426, 'HCR81520', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":0,"current_value":10}}', '2023-09-04 12:09:53'),
	(427, 'AIB23982', 1, 185, '{"desc":{"type":"from","source":{"job":"burgershot"}},"account":{"old_value":520,"current_value":705}}', '2023-09-04 12:19:53'),
	(428, 'HCR81520', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":10,"current_value":20}}', '2023-09-04 12:19:53'),
	(429, 'HCR81520', 1, 850, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":20,"current_value":870}}', '2023-09-04 12:29:53'),
	(430, 'AIB23982', 1, 30, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":705,"current_value":735}}', '2023-09-04 12:29:53'),
	(431, 'HCR81520', 1, 850, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":870,"current_value":1720}}', '2023-09-04 12:39:53'),
	(432, 'AIB23982', 1, 30, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"old_value":735,"current_value":765}}', '2023-09-04 12:39:53'),
	(433, 'HCR81520', 1, 850, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":1720,"current_value":2570}}', '2023-09-04 12:49:53'),
	(434, 'HCR81520', 1, 850, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"old_value":2570,"current_value":3420}}', '2023-09-04 12:59:53'),
	(435, 'AIB23982', 1, 30, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":795,"old_value":765}}', '2023-09-04 17:54:47'),
	(436, 'AIB23982', 1, 30, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":825,"old_value":795}}', '2023-09-04 18:04:47'),
	(437, 'AIB23982', 1, 30, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":855,"old_value":825}}', '2023-09-04 18:14:47'),
	(438, 'AIB23982', 1, 800, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":1655,"old_value":855}}', '2023-09-04 18:24:47'),
	(439, 'AIB23982', 1, 800, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":2455,"old_value":1655}}', '2023-09-04 18:34:47'),
	(440, 'AIB23982', 1, 800, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":3255,"old_value":2455}}', '2023-09-04 18:44:47'),
	(441, 'AIB23982', 1, 800, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":4055,"old_value":3255}}', '2023-09-04 18:54:47'),
	(442, 'AIB23982', 1, 800, '{"desc":{"type":"from","source":{"job":"police"}},"account":{"current_value":4855,"old_value":4055}}', '2023-09-04 19:04:47'),
	(443, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":5655,"old_value":4855}}', '2023-09-05 11:11:32'),
	(444, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":6455,"old_value":5655}}', '2023-09-05 11:21:32'),
	(445, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":7255,"old_value":6455}}', '2023-09-05 11:31:32'),
	(446, 'AIB23982', 1, 800, '{"account":{"old_value":7255,"current_value":8055},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-05 11:57:56'),
	(447, 'AIB23982', 1, 800, '{"account":{"old_value":8055,"current_value":8855},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-05 12:07:56'),
	(448, 'AIB23982', 1, 800, '{"account":{"old_value":8855,"current_value":9655},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-05 20:50:19'),
	(449, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":10455,"old_value":9655}}', '2023-09-05 21:48:26'),
	(450, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":10455,"current_value":11255}}', '2023-09-05 22:07:45'),
	(451, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":11255,"current_value":12055}}', '2023-09-05 22:17:45'),
	(452, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":12055,"current_value":12855}}', '2023-09-05 22:27:45'),
	(453, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":12855,"current_value":13655}}', '2023-09-05 22:37:45'),
	(454, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":13655,"current_value":14455}}', '2023-09-05 22:47:45'),
	(455, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":14455,"current_value":15255}}', '2023-09-05 22:57:45'),
	(456, 'AIB23982', 1, 500, '{"desc":{"source":{"job":"cigar"},"type":"from"},"account":{"current_value":15755,"old_value":15255}}', '2023-09-05 23:32:36'),
	(457, 'AIB23982', 1, 500, '{"desc":{"source":{"job":"cigar"},"type":"from"},"account":{"current_value":16255,"old_value":15755}}', '2023-09-05 23:42:36'),
	(458, 'AIB23982', 1, 500, '{"desc":{"source":{"job":"cigar"},"type":"from"},"account":{"current_value":16755,"old_value":16255}}', '2023-09-05 23:52:36'),
	(459, 'AIB23982', 1, 500, '{"desc":{"source":{"job":"cigar"},"type":"from"},"account":{"current_value":17255,"old_value":16755}}', '2023-09-06 00:02:36'),
	(460, 'AIB23982', 1, 500, '{"desc":{"source":{"job":"cigar"},"type":"from"},"account":{"current_value":17755,"old_value":17255}}', '2023-09-06 00:12:36'),
	(461, 'AIB23982', 1, 500, '{"account":{"current_value":18255,"old_value":17755},"desc":{"type":"from","source":{"job":"cigar"}}}', '2023-09-06 00:42:46'),
	(462, 'AIB23982', 1, 50, '{"account":{"current_value":18305,"old_value":18255},"desc":{"type":"from","source":{"job":"hotdog"}}}', '2023-09-06 00:52:46'),
	(463, 'AIB23982', 1, 50, '{"account":{"current_value":18355,"old_value":18305},"desc":{"type":"from","source":{"job":"hotdog"}}}', '2023-09-06 11:18:46'),
	(464, 'AIB23982', 1, 50, '{"account":{"current_value":18405,"old_value":18355},"desc":{"type":"from","source":{"job":"hotdog"}}}', '2023-09-06 11:28:46'),
	(465, 'AIB23982', 1, 50, '{"account":{"current_value":18455,"old_value":18405},"desc":{"type":"from","source":{"job":"hotdog"}}}', '2023-09-06 11:56:49'),
	(466, 'AIB23982', 1, 50, '{"account":{"current_value":18505,"old_value":18455},"desc":{"type":"from","source":{"job":"hotdog"}}}', '2023-09-06 12:06:49'),
	(467, 'AIB23982', 1, 50, '{"account":{"current_value":18555,"old_value":18505},"desc":{"type":"from","source":{"job":"hotdog"}}}', '2023-09-06 12:16:49'),
	(468, 'AIB23982', 1, 50, '{"desc":{"source":{"job":"hotdog"},"type":"from"},"account":{"current_value":18605,"old_value":18555}}', '2023-09-06 12:50:53'),
	(469, 'AIB23982', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"current_value":19355,"old_value":18605}}', '2023-09-06 13:00:53'),
	(470, 'AIB23982', 1, 750, '{"account":{"old_value":19355,"current_value":20105},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 13:15:53'),
	(471, 'AIB23982', 1, 750, '{"account":{"old_value":20105,"current_value":20855},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 13:25:53'),
	(472, 'AIB23982', 1, 750, '{"account":{"old_value":20855,"current_value":21605},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 13:35:53'),
	(473, 'AIB23982', 1, 750, '{"account":{"old_value":21605,"current_value":22355},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 13:45:53'),
	(474, 'AIB23982', 1, 750, '{"account":{"old_value":22355,"current_value":23105},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 13:55:53'),
	(475, 'AIB23982', 1, 750, '{"account":{"old_value":23105,"current_value":23855},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 14:05:53'),
	(476, 'AIB23982', 1, 750, '{"account":{"old_value":23855,"current_value":24605},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 14:15:53'),
	(477, 'AIB23982', 1, 750, '{"account":{"old_value":24605,"current_value":25355},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 14:25:53'),
	(478, 'AIB23982', 1, 750, '{"account":{"old_value":25355,"current_value":26105},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 14:35:53'),
	(479, 'AIB23982', 1, 750, '{"account":{"old_value":26105,"current_value":26855},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 14:45:53'),
	(480, 'AIB23982', 1, 750, '{"account":{"old_value":26855,"current_value":27605},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 14:55:54'),
	(481, 'AIB23982', 1, 750, '{"account":{"old_value":27605,"current_value":28355},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 15:05:54'),
	(482, 'AIB23982', 1, 750, '{"account":{"old_value":28355,"current_value":29105},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 15:15:54'),
	(483, 'AIB23982', 1, 750, '{"account":{"old_value":29105,"current_value":29855},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 15:25:54'),
	(484, 'AIB23982', 1, 750, '{"account":{"old_value":29855,"current_value":30605},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 15:35:54'),
	(485, 'AIB23982', 1, 750, '{"account":{"old_value":30605,"current_value":31355},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 15:45:54'),
	(486, 'AIB23982', 1, 750, '{"account":{"old_value":31355,"current_value":32105},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 15:55:54'),
	(487, 'AIB23982', 1, 750, '{"account":{"old_value":32105,"current_value":32855},"desc":{"source":{"job":"police"},"type":"from"}}', '2023-09-06 16:05:54'),
	(488, 'AIB23982', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":32855,"current_value":33605}}', '2023-09-06 17:01:26'),
	(489, 'OGR18462', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":0,"current_value":10}}', '2023-09-06 17:01:26'),
	(490, 'AIB23982', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":33605,"current_value":34355}}', '2023-09-06 17:11:26'),
	(491, 'OGR18462', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":10,"current_value":20}}', '2023-09-06 17:11:26'),
	(492, 'OGR18462', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":20,"current_value":30}}', '2023-09-06 17:21:26'),
	(493, 'AIB23982', 1, 750, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":34355,"current_value":35105}}', '2023-09-06 17:21:26'),
	(494, 'OGR18462', 1, 125, '{"desc":{"source":{"job":"ambulance"},"type":"from"},"account":{"old_value":30,"current_value":155}}', '2023-09-06 17:31:26'),
	(495, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":35105,"current_value":35905}}', '2023-09-06 17:31:26'),
	(496, 'OGR18462', 1, 125, '{"desc":{"source":{"job":"ambulance"},"type":"from"},"account":{"old_value":155,"current_value":280}}', '2023-09-06 17:41:26'),
	(497, 'AIB23982', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":35905,"current_value":36705}}', '2023-09-06 17:41:26'),
	(498, 'CJV92739', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":0,"current_value":10}}', '2023-09-06 17:51:26'),
	(499, 'OGR18462', 1, 125, '{"desc":{"source":{"job":"ambulance"},"type":"from"},"account":{"old_value":280,"current_value":405}}', '2023-09-06 17:51:26'),
	(500, 'MBZ65979', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":0,"current_value":10}}', '2023-09-06 17:51:26'),
	(501, 'CJV92739', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":10,"current_value":20}}', '2023-09-06 18:01:26'),
	(502, 'MBZ65979', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":10,"current_value":20}}', '2023-09-06 18:01:26'),
	(503, 'OGR18462', 1, 800, '{"desc":{"source":{"job":"police"},"type":"from"},"account":{"old_value":405,"current_value":1205}}', '2023-09-06 18:01:26'),
	(504, 'MBZ65979', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":20,"current_value":30}}', '2023-09-06 18:11:26'),
	(505, 'CJV92739', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":20,"current_value":30}}', '2023-09-06 18:11:26'),
	(506, 'CJV92739', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":30,"current_value":40}}', '2023-09-06 18:21:26'),
	(507, 'CJV92739', 1, 10, '{"desc":{"source":{"job":"unemployed"},"type":"from"},"account":{"old_value":40,"current_value":50}}', '2023-09-06 18:31:26'),
	(508, 'MBZ65979', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":40,"old_value":30}}', '2023-09-06 20:00:54'),
	(509, 'MBZ65979', 1, 10, '{"desc":{"type":"from","source":{"job":"unemployed"}},"account":{"current_value":50,"old_value":40}}', '2023-09-06 20:10:54'),
	(510, 'AIB23982', 1, 800, '{"account":{"current_value":37505,"old_value":36705},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-06 21:05:01'),
	(511, 'AIB23982', 1, 750, '{"account":{"current_value":38255,"old_value":37505},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-06 21:15:01'),
	(512, 'AIB23982', 1, 750, '{"account":{"current_value":39005,"old_value":38255},"desc":{"type":"from","source":{"job":"police"}}}', '2023-09-06 21:25:01'),
	(513, 'AIB23982', 0, 39005, '{"account":{"old_value":39005,"current_value":0},"desc":{"source":{"name":"شسي سيشسش","citizenid":"AIB23982"},"type":"to"}}', '2023-09-06 21:33:07');

-- Dumping structure for table nmsh.keep_containers
CREATE TABLE IF NOT EXISTS `keep_containers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(50) NOT NULL,
  `container_type` varchar(50) NOT NULL,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `password` char(60) DEFAULT NULL,
  `position` text DEFAULT NULL,
  `zone` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `random_id` (`random_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.keep_containers: ~1 rows (approximately)
INSERT INTO `keep_containers` (`id`, `random_id`, `container_type`, `owner_citizenid`, `password`, `position`, `zone`, `deleted`, `deleted_by`) VALUES
	(1, '3Z497enMU', 'containergreensmall', 'AIB23982', '$2a$11$lf5dg6W9CjlXzT1R651qduHXf260MrJQl4QXHMjBJ/S8pZAKhhPI2', '{"x":1182.50537109375,"y":-1361.8631591796876,"z":33.90549087524414,"w":352.5}', 'LT_WELD_SUPPLY', 0, '');

-- Dumping structure for table nmsh.keep_containers_access_log
CREATE TABLE IF NOT EXISTS `keep_containers_access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(50) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `metadata` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `random_id` (`random_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.keep_containers_access_log: ~0 rows (approximately)

-- Dumping structure for table nmsh.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.lapraces: ~0 rows (approximately)

-- Dumping structure for table nmsh.loaf_invoices
CREATE TABLE IF NOT EXISTS `loaf_invoices` (
  `id` varchar(15) NOT NULL,
  `issued` date DEFAULT curdate(),
  `biller` varchar(150) NOT NULL,
  `biller_name` varchar(150) NOT NULL,
  `billed` varchar(150) NOT NULL,
  `billed_name` varchar(150) NOT NULL,
  `owner` varchar(150) NOT NULL,
  `due` date NOT NULL,
  `interest` int(11) NOT NULL DEFAULT 0,
  `late` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `name` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL DEFAULT 'Unknown',
  `company` varchar(50) DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `signed` tinyint(1) NOT NULL DEFAULT 0,
  `signature` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.loaf_invoices: ~0 rows (approximately)

-- Dumping structure for table nmsh.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `Type` text DEFAULT NULL,
  `Steam` varchar(255) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT current_timestamp(),
  `Log` text DEFAULT NULL,
  `Cid` varchar(50) DEFAULT NULL,
  `Data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.logs: ~0 rows (approximately)

-- Dumping structure for table nmsh.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.management_funds: ~12 rows (approximately)
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 20000, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 81111, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang');

-- Dumping structure for table nmsh.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.management_outfits: ~0 rows (approximately)

-- Dumping structure for table nmsh.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_bolos: ~0 rows (approximately)

-- Dumping structure for table nmsh.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_bulletin: ~0 rows (approximately)

-- Dumping structure for table nmsh.mdt_clocking
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_clocking: ~1 rows (approximately)
INSERT INTO `mdt_clocking` (`id`, `user_id`, `firstname`, `lastname`, `clock_in_time`, `clock_out_time`, `total_time`) VALUES
	(7, 'DML97005', 'Nmsh', 'Alnmsh', '2023-09-10 03:14:14', NULL, 0);

-- Dumping structure for table nmsh.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_convictions: ~0 rows (approximately)

-- Dumping structure for table nmsh.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_data: ~0 rows (approximately)

-- Dumping structure for table nmsh.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_impound: ~0 rows (approximately)

-- Dumping structure for table nmsh.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_incidents: ~0 rows (approximately)

-- Dumping structure for table nmsh.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_logs: ~3 rows (approximately)
INSERT INTO `mdt_logs` (`id`, `text`, `time`, `jobtype`) VALUES
	(1, 'A vehicle with the plate (49OGZ795) has a new image (img/not-found.webp) edited by Nmsh Dev', '1688824714000', 'police'),
	(2, 'A vehicle with the plate (49OGZ795) was added to the vehicle information database by Nmsh Dev', '1688824714000', 'police'),
	(3, 'A vehicle with the plate (49OGZ795) has a new image (img/not-found.webp) edited by Nmsh Dev', '1689019947000', 'police');

-- Dumping structure for table nmsh.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_reports: ~0 rows (approximately)

-- Dumping structure for table nmsh.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_vehicleinfo: ~1 rows (approximately)
INSERT INTO `mdt_vehicleinfo` (`id`, `plate`, `information`, `stolen`, `code5`, `image`, `points`) VALUES
	(1, '49OGZ795', '', 0, 0, 'img/not-found.webp', 30);

-- Dumping structure for table nmsh.mdt_weaponinfo
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.mdt_weaponinfo: ~11 rows (approximately)
INSERT INTO `mdt_weaponinfo` (`id`, `serial`, `owner`, `information`, `weapClass`, `weapModel`, `image`) VALUES
	(1, '40INp0CV763TiOO', 'Nmsh Dev', 'Purchased at Ammunation', '1', 'Bat', 'https://cfx-nui-qb-inventory/html/images/weapon_bat.png'),
	(2, '39kWy7jZ273ElpF', 'Nmsh Dev', 'Ammunation Weapon', 'tbu', 'weapon_wrench', 'img/not-found.webp'),
	(3, '96wrq1nL236vMdY', 'Nmsh Dev', 'Ammunation Weapon', 'tbu', 'weapon_hammer', 'img/not-found.webp'),
	(4, '11Dbx4kr547jmVd', 'Nmsh Dev', 'Ammunation Weapon', 'tbu', 'weapon_knife', 'img/not-found.webp'),
	(5, '90MAX8Sv263FQyt', 'Nmsh Dev', 'Ammunation Weapon', 'tbu', 'weapon_bat', 'img/not-found.webp'),
	(6, '62sSK3zl583UTap', 'Nmsh Dev', 'Ammunation Weapon', 'tbu', 'weapon_pistol', 'img/not-found.webp'),
	(7, '89BBU0dy671sQDE', 'Nmsh Dev', 'Ammunation Weapon', 'tbu', 'weapon_snspistol', 'img/not-found.webp'),
	(8, '13Mjx9Sw794TdSK', 'Nmsh Dev', 'Ammunation Weapon', 'tbu', 'weapon_vintagepistol', 'img/not-found.webp'),
	(9, '72eok6Mv802TxGX', 'Nmsh Alnmsh', 'Ammunation Weapon', 'tbu', 'weapon_knife', 'img/not-found.webp'),
	(10, '17EGu7MH940Dehf', 'Nmsh Alnmsh', 'Ammunation Weapon', 'tbu', 'weapon_pistol', 'img/not-found.webp'),
	(11, '37ZAQ3SO924oeSD', 'Nmsh Alnmsh', 'Ammunation Weapon', 'tbu', 'weapon_snspistol', 'img/not-found.webp');

-- Dumping structure for table nmsh.movableshops
CREATE TABLE IF NOT EXISTS `movableshops` (
  `identifier` varchar(100) DEFAULT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `money` longtext DEFAULT NULL,
  `items` longtext DEFAULT NULL,
  `plate` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `shopname` varchar(64) DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.movableshops: ~0 rows (approximately)

-- Dumping structure for table nmsh.nightclubs
CREATE TABLE IF NOT EXISTS `nightclubs` (
  `citizenid` varchar(50) NOT NULL,
  `metadata` text NOT NULL,
  `missions` text NOT NULL,
  `employee` text NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.nightclubs: ~1 rows (approximately)
INSERT INTO `nightclubs` (`citizenid`, `metadata`, `missions`, `employee`) VALUES
	('DML97005', '{"style":"Int01_ba_Style03","neons":"nil","turntables":"nil","podium":"nil","security":"nil","worklamps":"Int01_ba_Worklamps","bands":"nil","droplets":"nil","bar":"Int01_ba_bar_content","lasers":"nil","truck":"Int01_ba_deliverytruck","speakers":"nil","booze":"nil","name":"Int01_ba_clubname_09"}', '{"posters":"1","food":5}', '{"dj":"0","dancers":"0","tenders":"0"}');

-- Dumping structure for table nmsh.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table nmsh.oilcompany_employees
CREATE TABLE IF NOT EXISTS `oilcompany_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `oilrig_hash` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.oilcompany_employees: ~0 rows (approximately)

-- Dumping structure for table nmsh.oilrig_blender
CREATE TABLE IF NOT EXISTS `oilrig_blender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `metadata` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.oilrig_blender: ~0 rows (approximately)

-- Dumping structure for table nmsh.oilrig_cdu
CREATE TABLE IF NOT EXISTS `oilrig_cdu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `metadata` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.oilrig_cdu: ~0 rows (approximately)

-- Dumping structure for table nmsh.oilrig_position
CREATE TABLE IF NOT EXISTS `oilrig_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `oilrig_hash` varchar(50) DEFAULT NULL,
  `position` text NOT NULL DEFAULT '0',
  `metadata` text NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.oilrig_position: ~0 rows (approximately)

-- Dumping structure for table nmsh.oilrig_storage
CREATE TABLE IF NOT EXISTS `oilrig_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `metadata` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.oilrig_storage: ~0 rows (approximately)

-- Dumping structure for table nmsh.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nmsh.ox_doorlock: ~31 rows (approximately)
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(32, 'gabz_mrpd 1', '{"maxDistance":2,"state":0,"groups":{"police":0,"offpolice":0},"lockpick":true,"doors":[{"heading":90,"coords":{"x":434.744384765625,"y":-983.078125,"z":30.81529998779297},"model":-1547307588},{"heading":270,"coords":{"x":434.744384765625,"y":-980.755615234375,"z":30.81529998779297},"model":-1547307588}],"coords":{"x":434.744384765625,"y":-981.9168701171875,"z":30.81529998779297},"hideUi":false}'),
	(33, 'gabz_mrpd 2', '{"maxDistance":2,"state":1,"groups":{"police":0,"offpolice":0},"doors":[{"heading":180,"coords":{"x":458.2087097167969,"y":-972.2542724609375,"z":30.81529998779297},"model":-1547307588},{"heading":0,"coords":{"x":455.8861999511719,"y":-972.2542724609375,"z":30.81529998779297},"model":-1547307588}],"coords":{"x":457.0474548339844,"y":-972.2542724609375,"z":30.81529998779297},"hideUi":false}'),
	(34, 'gabz_mrpd 3', '{"maxDistance":2,"state":1,"groups":{"police":0,"offpolice":0},"doors":[{"heading":0,"coords":{"x":440.73919677734377,"y":-998.7462158203125,"z":30.81529998779297},"model":-1547307588},{"heading":180,"coords":{"x":443.0617980957031,"y":-998.7462158203125,"z":30.81529998779297},"model":-1547307588}],"coords":{"x":441.9005126953125,"y":-998.7462158203125,"z":30.81529998779297},"hideUi":false}'),
	(35, 'gabz_mrpd 4', '{"coords":{"x":441.1300048828125,"y":-977.9299926757813,"z":30.82319068908691},"state":1,"model":-1406685646,"heading":0,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(36, 'gabz_mrpd 5', '{"coords":{"x":440.5201110839844,"y":-986.2335205078125,"z":30.82319068908691},"state":1,"model":-96679321,"heading":180,"groups":{"police":0,"offpolice":0},"maxDistance":2,"hideUi":false}'),
	(37, 'gabz_mrpd 6', '{"coords":{"x":464.1590881347656,"y":-974.6655883789063,"z":26.37070083618164},"state":1,"model":1830360419,"heading":270,"groups":{"police":0,"offpolice":0},"maxDistance":2,"hideUi":false}'),
	(38, 'gabz_mrpd 7', '{"coords":{"x":464.1565856933594,"y":-997.50927734375,"z":26.37070083618164},"state":1,"model":1830360419,"heading":90,"groups":{"police":0,"offpolice":0},"maxDistance":2,"hideUi":false}'),
	(39, 'gabz_mrpd 8', '{"coords":{"x":431.4118957519531,"y":-1000.77197265625,"z":26.69660949707031},"state":1,"model":2130672747,"heading":0,"groups":{"police":0,"offpolice":0},"auto":true,"lockSound":"button-remote","maxDistance":6,"hideUi":false}'),
	(40, 'gabz_mrpd 9', '{"coords":{"x":452.3005065917969,"y":-1000.77197265625,"z":26.69660949707031},"state":1,"model":2130672747,"heading":0,"groups":{"police":0,"offpolice":0},"auto":true,"lockSound":"button-remote","maxDistance":6,"hideUi":false}'),
	(41, 'gabz_mrpd 10', '{"coords":{"x":488.8948059082031,"y":-1017.2119750976563,"z":27.14934921264648},"state":1,"model":-1603817716,"heading":90,"groups":{"police":0,"offpolice":0},"auto":true,"lockSound":"button-remote","maxDistance":6,"hideUi":false}'),
	(42, 'gabz_mrpd 11', '{"maxDistance":2,"state":1,"groups":{"police":0,"offpolice":0},"doors":[{"heading":0,"coords":{"x":467.36859130859377,"y":-1014.406005859375,"z":26.48381996154785},"model":-692649124},{"heading":180,"coords":{"x":469.7742919921875,"y":-1014.406005859375,"z":26.48381996154785},"model":-692649124}],"coords":{"x":468.5714416503906,"y":-1014.406005859375,"z":26.48381996154785},"hideUi":false}'),
	(43, 'gabz_mrpd 12', '{"coords":{"x":475.9538879394531,"y":-1010.8189697265625,"z":26.40638923645019},"state":1,"model":-1406685646,"heading":180,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(44, 'gabz_mrpd 13', '{"coords":{"x":476.6156921386719,"y":-1008.875,"z":26.48004913330078},"unlockSound":"metallic-creak","state":1,"model":-53345114,"heading":270,"groups":{"police":0},"maxDistance":2,"lockSound":"metal-locker","hideUi":false}'),
	(45, 'gabz_mrpd 14', '{"coords":{"x":481.0083923339844,"y":-1004.1179809570313,"z":26.48004913330078},"unlockSound":"metallic-creak","state":1,"model":-53345114,"heading":180,"groups":{"police":0},"maxDistance":2,"lockSound":"metal-locker","hideUi":false}'),
	(46, 'gabz_mrpd 15', '{"coords":{"x":477.91259765625,"y":-1012.1890258789063,"z":26.48004913330078},"unlockSound":"metallic-creak","state":1,"model":-53345114,"heading":0,"groups":{"police":0},"maxDistance":2,"lockSound":"metal-locker","hideUi":false}'),
	(47, 'gabz_mrpd 16', '{"coords":{"x":480.9128112792969,"y":-1012.1890258789063,"z":26.48004913330078},"unlockSound":"metallic-creak","state":1,"model":-53345114,"heading":0,"groups":{"police":0},"maxDistance":2,"lockSound":"metal-locker","hideUi":false}'),
	(48, 'gabz_mrpd 17', '{"coords":{"x":483.9126892089844,"y":-1012.1890258789063,"z":26.48004913330078},"unlockSound":"metallic-creak","state":1,"model":-53345114,"heading":0,"groups":{"police":0},"maxDistance":2,"lockSound":"metal-locker","hideUi":false}'),
	(49, 'gabz_mrpd 18', '{"coords":{"x":486.9130859375,"y":-1012.1890258789063,"z":26.48004913330078},"unlockSound":"metallic-creak","state":1,"model":-53345114,"heading":0,"groups":{"police":0},"maxDistance":2,"lockSound":"metal-locker","hideUi":false}'),
	(50, 'gabz_mrpd 19', '{"coords":{"x":484.1763916015625,"y":-1007.7340087890625,"z":26.48004913330078},"unlockSound":"metallic-creak","state":1,"model":-53345114,"heading":180,"groups":{"police":0},"maxDistance":2,"lockSound":"metal-locker","hideUi":false}'),
	(51, 'gabz_mrpd 20', '{"coords":{"x":479.05999755859377,"y":-1003.1729736328125,"z":26.4064998626709},"state":1,"model":-288803980,"heading":90,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(52, 'gabz_mrpd 21', '{"coords":{"x":482.6694030761719,"y":-983.98681640625,"z":26.40547943115234},"state":1,"model":-1406685646,"heading":270,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(53, 'gabz_mrpd 22', '{"coords":{"x":482.67010498046877,"y":-987.5792236328125,"z":26.40547943115234},"state":1,"model":-1406685646,"heading":270,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(54, 'gabz_mrpd 23', '{"coords":{"x":482.6698913574219,"y":-992.299072265625,"z":26.40547943115234},"state":1,"model":-1406685646,"heading":270,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(55, 'gabz_mrpd 24', '{"coords":{"x":482.6702880859375,"y":-995.728515625,"z":26.40547943115234},"state":1,"model":-1406685646,"heading":270,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(56, 'gabz_mrpd 25', '{"coords":{"x":475.8323059082031,"y":-990.48388671875,"z":26.40547943115234},"state":1,"model":-692649124,"heading":135,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(57, 'gabz_mrpd 26', '{"coords":{"x":479.7507019042969,"y":-999.6290283203125,"z":30.78927040100097},"state":1,"model":-692649124,"heading":90,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(58, 'gabz_mrpd 27', '{"coords":{"x":487.43780517578127,"y":-1000.1890258789063,"z":30.7869701385498},"state":1,"model":-692649124,"heading":181,"groups":{"police":0},"maxDistance":2,"hideUi":false}'),
	(59, 'gabz_mrpd 28', '{"maxDistance":2,"state":1,"groups":{"police":0},"doors":[{"heading":0,"coords":{"x":485.6133117675781,"y":-1002.9019775390625,"z":30.7869701385498},"model":-692649124},{"heading":180,"coords":{"x":488.0184020996094,"y":-1002.9019775390625,"z":30.7869701385498},"model":-692649124}],"coords":{"x":486.81585693359377,"y":-1002.9019775390625,"z":30.7869701385498},"hideUi":false}'),
	(60, 'gabz_mrpd 29', '{"coords":{"x":464.30859375,"y":-984.5283813476563,"z":43.771240234375},"state":1,"model":-692649124,"heading":90,"groups":{"police":0},"auto":false,"maxDistance":2,"lockpick":false,"hideUi":false}'),
	(61, 'gabz_mrpd 30', '{"coords":{"x":410.0257873535156,"y":-1024.219970703125,"z":29.22019958496093},"state":1,"model":-1635161509,"heading":270,"groups":{"police":0},"lockSound":"button-remote","auto":true,"maxDistance":6,"lockpick":false,"hideUi":false}'),
	(62, 'gabz_mrpd 31', '{"coords":{"x":410.0257873535156,"y":-1024.2259521484376,"z":29.2202205657959},"state":1,"model":-1868050792,"heading":270,"groups":{"police":0},"lockSound":"button-remote","auto":true,"maxDistance":6,"lockpick":false,"hideUi":false}');

-- Dumping structure for table nmsh.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT 'user',
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=MyISAM AUTO_INCREMENT=281 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.permissions: 15 rows
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `license`, `name`, `permission`) VALUES
	(250, 'license:f8f59e57f2cb514315583b86d2091bbf8d6fcc7d', 'M3athT', 'god'),
	(268, 'license:1e9bc40fea92669cc93bf80da96305744d09fe44', 'Yos', 'god'),
	(255, 'license:45a1ea8be50df8501898f767bf5d6bee1b02f3fd', 'obev', 'god'),
	(254, 'license:03e5ba3ae350cb5f8817c20a4123ee9895627187', 'MSWAK', 'god'),
	(265, 'license:f58e142b5b37be564d2e91b8d406856c51a3612f', 'Pika', 'god'),
	(260, 'license:2fb786e582442701f56da2bdbf60e513f9977d13', '~r~enemy', 'user'),
	(263, 'license:6bfc984221c1ae4052ee2cd897444820a1c1ffd0', '! MsHary_', 'god'),
	(264, 'license:c1a64c29020abf061ac7474fff46338670c3faed', 'Loup', 'god'),
	(267, 'license:914b2ac70871589229ce34d6aab0d96a830c2d5e', 'Ahmad', 'god'),
	(271, 'license:b39a0d1de726564ae2e33f96275c28238af4059c', 'Cali', 'god'),
	(272, 'license:96a02a7e23fa7affc30b0552bfcb6b6633a79b38', 'jaser', 'god'),
	(274, 'license:0edbb9d6499bc5a77b2b8a037d9e33636060fa1f', 'Amigos', 'god'),
	(275, 'license:79906c1d973e3502ce6ad02108f6e98a5b97e051', 'Almansoori', 'god'),
	(276, 'license:1a35c58d42ed184c5995f313079feefdafed1d13', 'wajeh', 'god'),
	(277, 'license:2266eabcf350975f12fc5cb9f7070a9afc4dc502', 'Moatz', 'god'),
	(278, 'license:32df33b92e578aa6371b5d7ad88f5ac6faf33f09', 'Abdullrhman', 'god'),
	(279, 'license:f20fd3490db962d3549372c2e9deb9e426c47354', 'mggg8458', 'god');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table nmsh.phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(20) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.phone_chatrooms: ~3 rows (approximately)
INSERT INTO `phone_chatrooms` (`id`, `room_code`, `room_name`, `room_owner_id`, `room_owner_name`, `room_members`, `room_pin`, `unpaid_balance`, `is_pinned`, `created`) VALUES
	(1, '411', '411', 'official', 'Government', '{}', NULL, 0.00, 1, '2023-07-07 23:44:27'),
	(2, 'lounge', 'The Lounge', 'official', 'Government', '{}', NULL, 0.00, 1, '2023-07-07 23:44:27'),
	(3, 'events', 'Events', 'official', 'Government', '{}', NULL, 0.00, 1, '2023-07-07 23:44:27');

-- Dumping structure for table nmsh.phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.phone_chatroom_messages: ~0 rows (approximately)

-- Dumping structure for table nmsh.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.phone_gallery: ~0 rows (approximately)

-- Dumping structure for table nmsh.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.phone_invoices: ~0 rows (approximately)

-- Dumping structure for table nmsh.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.phone_messages: ~2 rows (approximately)
INSERT INTO `phone_messages` (`id`, `citizenid`, `number`, `messages`, `time`) VALUES
	(11, 'OGR18462', '3526413864', '[{"messages":[{"sender":"AIB23982","type":"message","time":"17:38","message":"سلام عليكم","data":[]},{"sender":"AIB23982","type":"message","time":"17:38","message":"س","data":[]},{"sender":"OGR18462","type":"message","time":"17:40","message":"??","data":[]}],"date":"6-8-2023"}]', NULL),
	(12, 'AIB23982', '3964367145', '[{"messages":[{"sender":"AIB23982","type":"message","time":"17:38","message":"سلام عليكم","data":[]},{"sender":"AIB23982","type":"message","time":"17:38","message":"س","data":[]},{"sender":"OGR18462","type":"message","time":"17:40","message":"??","data":[]}],"date":"6-8-2023"}]', NULL);

-- Dumping structure for table nmsh.phone_note
CREATE TABLE IF NOT EXISTS `phone_note` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `lastupdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.phone_note: ~0 rows (approximately)

-- Dumping structure for table nmsh.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `tweetId` varchar(25) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.phone_tweets: ~0 rows (approximately)

-- Dumping structure for table nmsh.pickle_prisons
CREATE TABLE IF NOT EXISTS `pickle_prisons` (
  `identifier` varchar(46) NOT NULL,
  `prison` varchar(50) DEFAULT 'default',
  `time` int(11) NOT NULL DEFAULT 0,
  `inventory` longtext NOT NULL,
  `sentence_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nmsh.pickle_prisons: ~0 rows (approximately)

-- Dumping structure for table nmsh.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `craftxp` int(11) DEFAULT 0,
  `lifeStyle` varchar(50) DEFAULT NULL,
  `aimStyle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=2170 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.players: ~17 rows (approximately)
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `craftxp`, `lifeStyle`, `aimStyle`) VALUES
	(2157, 'AVE81303', 1, 'license:10651d1bb9067f8b1a6ac568b2ad5ea48ec4bfd6', 'JERRYCO', '{"cash":488,"bank":5000,"crypto":0}', '{"nationality":"ksa","gender":0,"birthdate":"1995-03-30","phone":"8375850452","firstname":"jerry","lastname":"co","account":"US08QBCore7079921078","backstory":"placeholder backstory","cid":"1"}', '{"label":"Law Enforcement","onduty":true,"isboss":false,"type":"leo","grade":{"level":6},"payment":950,"name":"police"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":264.23736572265627,"y":-972.10546875,"z":29.3135986328125}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":84.80000000000001,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":27824573,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-15303230","fingerprint":"fr024I74Ihm1314","hunger":83.19999999999999,"attachmentcraftingrep":0,"bloodtype":"B+","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"weapon_scarh","type":"weapon","created":[1695835243],"info":{"ammo":223,"serie":"13TzR3lG935VwPG","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":98.34999999999994},"amount":1},{"slot":2,"name":"driver_license","type":"item","created":[1695834830],"info":{"firstname":"jerry","type":"Class C Driver License","lastname":"co","birthdate":"1995-03-30","quality":[100]},"amount":1},{"slot":3,"name":"lockpick","type":"item","created":[1695834830,1695834830,1695834830],"info":{"quality":[100,100,100]},"amount":3},{"slot":4,"name":"phone","type":"item","created":[1695834830],"info":{"quality":[100]},"amount":1},{"slot":5,"name":"police_badge","type":"item","created":[1695835144],"info":{"dept":"lspd","callsign":"p1","url":"https://cdn.discordapp.com/attachments/1128419772514705459/1144732318007824494/screenshot.jpg?ex=65153b4c&is=6513e9cc&hm=a05c7a52ae9d93ddab1766baa7b2a18f4615f830d0f19535b2c6a4fe7324ca26&","name":"jerryco","rank":"15","quality":[99]},"amount":1},{"slot":7,"name":"id_card","type":"item","created":[1695834830],"info":{"nationality":"ksa","firstname":"jerry","birthdate":"1995-03-30","gender":0,"lastname":"co","citizenid":"AVE81303","quality":[100]},"amount":1}]', '2023-09-27 17:28:55', 0, NULL, NULL),
	(2073, 'CEF69772', 1, 'license:96a02a7e23fa7affc30b0552bfcb6b6633a79b38', 'jaser', '{"cash":10000000428,"bank":10000005000,"crypto":0}', '{"nationality":"ss","gender":0,"birthdate":"0001-11-01","phone":"6742287896","firstname":"ss","lastname":"ss","account":"US09QBCore8163441613","backstory":"placeholder backstory","cid":"1"}', '{"label":"Law Enforcement","onduty":true,"isboss":false,"type":"leo","grade":{"level":0,"name":"No Grades"},"payment":30,"name":"police"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":448.72088623046877,"y":-994.4044189453125,"z":25.6907958984375}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":88.60000000000001,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":30098162,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[],"property_id":"25"},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-77298891","fingerprint":"im051f40QeJ5576","hunger":87.39999999999999,"attachmentcraftingrep":0,"bloodtype":"A+","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"rifle_ammo","type":"item","created":[1695813163,1695813163,1695813163,1695813163],"info":{"quality":[100,100,100,100]},"amount":4},{"slot":2,"name":"weapon_glock17","type":"weapon","created":[1695813128],"info":{"serie":"24gFv0ZV048IMBH","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_PI_FLSH"}],"quality":100},"amount":1},{"slot":3,"name":"weapon_scarh","type":"weapon","created":[1695813136],"info":{"serie":"63wYe7bj062wcDW","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":100},"amount":1},{"slot":4,"name":"pistol_ammo","type":"item","created":[1695813157,1695813157,1695813157,1695813157,1695813157],"info":{"quality":[100,100,100,100,100]},"amount":5},{"slot":5,"name":"weapon_m4","type":"weapon","created":[1695813134],"info":{"serie":"63qBE5yl357dxbu","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":100},"amount":1},{"slot":7,"name":"weapon_pistol","type":"weapon","created":[1695813192],"info":{"serie":"24LlI4XE418XAIp","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_PI_FLSH"}],"quality":100},"amount":1},{"slot":8,"name":"radio","type":"item","created":[1695813187],"info":{"quality":[100]},"amount":1},{"slot":9,"name":"handcuffs","type":"item","created":[1695813147],"info":{"quality":[100]},"amount":1},{"slot":10,"name":"armor","type":"item","created":[1695813180],"info":{"quality":[100]},"amount":1},{"slot":11,"name":"weapon_pumpshotgun","type":"weapon","created":[1695813171],"info":{"serie":"88nyM7cF152rDlw","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":100},"amount":1},{"slot":12,"name":"id_card","type":"item","created":[1695812495],"info":{"nationality":"ss","firstname":"ss","birthdate":"0001-11-01","gender":0,"lastname":"ss","citizenid":"CEF69772","quality":[100]},"amount":1},{"slot":13,"name":"driver_license","type":"item","created":[1695812495],"info":{"firstname":"ss","type":"Class C Driver License","lastname":"ss","birthdate":"0001-11-01","quality":[100]},"amount":1},{"slot":14,"name":"weapon_smg","type":"weapon","created":[1695813130],"info":{"serie":"34SVV6NK971ExiK","attachments":[{"label":"1x Scope","component":"COMPONENT_AT_SCOPE_MACRO_02"},{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":100},"amount":1},{"slot":15,"name":"weapon_stungun","type":"weapon","created":[1695813148],"info":{"quality":100,"serie":"57YQX1rT139QFgM"},"amount":1},{"slot":16,"name":"weapon_remington","type":"weapon","created":[1695813174],"info":{"serie":"81AHw0Ug350UFet","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_SG_FLSH"}],"quality":100},"amount":1},{"slot":17,"name":"phone","type":"item","created":[1695812495],"info":{"quality":[100]},"amount":1},{"slot":18,"name":"lockpick","type":"item","created":[1695812495,1695812495,1695812495],"info":{"quality":[100,100,100]},"amount":3},{"slot":19,"name":"weapon_ar15","type":"weapon","created":[1695813132],"info":{"ammo":30,"serie":"00dpa3eE198vpxG","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"},{"label":"Scope","component":"COMPONENT_AT_SCOPE_MEDIUM"},{"label":"AF-Grip","component":"COMPONENT_AT_AR_AFGRIP"}],"quality":100},"amount":1},{"slot":20,"name":"smg_ammo","type":"item","created":[1695813159,1695813159,1695813159,1695813159,1695813159],"info":{"quality":[100,100,100,100,100]},"amount":5},{"slot":22,"name":"weapon_mk14","type":"weapon","created":[1695813176],"info":{"serie":"11jhP1wk388iLLZ","attachments":[{"label":"Scope","component":"COMPONENT_AT_SCOPE_LARGE"}],"quality":100},"amount":1},{"slot":23,"name":"weapon_nightstick","type":"weapon","created":[1695813168],"info":{"serie":"40aSY1gA643gNUd","quality":100},"amount":1},{"slot":24,"name":"weapon_carbinerifle","type":"weapon","created":[1695813170],"info":{"serie":"47RFJ8bg711gmPA","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"},{"label":"3x Scope","component":"COMPONENT_AT_SCOPE_MEDIUM"}],"quality":100},"amount":1},{"slot":25,"name":"shotgun_ammo","type":"item","created":[1695813161,1695813161,1695813161,1695813161,1695813161],"info":{"quality":[100,100,100,100,100]},"amount":5}]', '2023-09-27 11:17:20', 0, NULL, NULL),
	(2091, 'CMD01952', 1, 'license:79906c1d973e3502ce6ad02108f6e98a5b97e051', 'Almansoori', '{"cash":500,"bank":5000,"crypto":0}', '{"nationality":"aaa","gender":0,"birthdate":"1111-11-11","phone":"2752649419","firstname":"saif","lastname":"aa","account":"US03QBCore5717956925","backstory":"placeholder backstory","cid":"1"}', '{"label":"Civilian","onduty":true,"isboss":false,"type":"none","grade":{"level":0,"name":"Freelancer"},"payment":10,"name":"unemployed"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":-636.2769165039063,"y":-190.984619140625,"z":37.047607421875}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":96.2,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":64765638,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-29389095","fingerprint":"IN581i20bLD7010","hunger":95.8,"attachmentcraftingrep":0,"bloodtype":"O-","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"id_card","type":"item","created":[1695823418],"info":{"nationality":"aaa","firstname":"saif","lastname":"aa","gender":0,"birthdate":"1111-11-11","citizenid":"CMD01952","quality":[100]},"amount":1},{"slot":2,"name":"driver_license","type":"item","created":[1695823418],"info":{"firstname":"saif","type":"Class C Driver License","lastname":"aa","birthdate":"1111-11-11","quality":[100]},"amount":1},{"slot":3,"name":"lockpick","type":"item","created":[1695823418,1695823418,1695823418],"info":{"quality":[100,100,100]},"amount":3},{"slot":4,"name":"phone","type":"item","created":[1695823418],"info":{"quality":[100]},"amount":1}]', '2023-09-27 14:06:14', 0, NULL, NULL),
	(2139, 'EVY21770', 1, 'license:985737016a14002ef79b3cc0db59b77c1cb9c168', 'im7f', '{"cash":500,"bank":5000,"crypto":0}', '{"nationality":"a","gender":0,"birthdate":"1111-11-11","phone":"5165908142","firstname":"M7F","lastname":"a","account":"US08QBCore3959947490","cid":"1","backstory":"placeholder backstory"}', '{"label":"Civilian","onduty":true,"isboss":false,"type":"none","grade":{"level":0,"name":"Freelancer"},"payment":10,"name":"unemployed"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":211.6483612060547,"y":-1091.129638671875,"z":29.4820556640625}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":7,"thirst":92.4,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":24400115,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-24126774","fingerprint":"cz902N21Mcg7893","hunger":91.6,"attachmentcraftingrep":0,"bloodtype":"AB+","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"lockpick","type":"item","created":[1695830890,1695830890,1695830890],"info":{"quality":[100,100,100]},"amount":3},{"slot":2,"name":"driver_license","type":"item","created":[1695830890],"info":{"firstname":"M7F","type":"Class C Driver License","lastname":"a","birthdate":"1111-11-11","quality":[100]},"amount":1},{"slot":3,"name":"id_card","type":"item","created":[1695830890],"info":{"nationality":"a","firstname":"M7F","lastname":"a","gender":0,"birthdate":"1111-11-11","citizenid":"EVY21770","quality":[100]},"amount":1},{"slot":4,"name":"phone","type":"item","created":[1695830890],"info":{"quality":[100]},"amount":1}]', '2023-09-27 16:13:37', 0, NULL, NULL),
	(1843, 'HMX75285', 1, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'Al-Hamlan-Store', '{"crypto":0,"cash":500,"bank":4800}', '{"birthdate":"0101-01-10","account":"US04QBCore5204481149","lastname":"سشي","cid":"1","backstory":"placeholder backstory","firstname":"فاطمة","phone":"1204054076","nationality":"سشيسشي","gender":0}', '{"onduty":true,"isboss":false,"type":"none","name":"unemployed","label":"Civilian","grade":{"name":"Freelancer","level":0},"payment":10}', '{"name":"ballas","isboss":false,"grade":{"name":"Enforcer","level":1},"label":"Ballas"}', '{"x":-913.7274780273438,"y":-377.8285827636719,"z":137.893798828125}', '{"inlaststand":false,"fitbit":[],"armor":0,"phonedata":{"SerialNumber":86229216,"InstalledApps":[]},"callsign":"NO CALLSIGN","laptop":{"darkfont":false,"background":"default"},"tracker":false,"walletid":"nmsh-62866441","licences":{"weapon":false,"driver":true,"business":false,"id":true},"inside":{"apartment":[]},"jailitems":[],"gameitems":[],"imadminjail":0,"dealerrep":0,"bloodtype":"O+","hunger":62.19999999999997,"criminalrecord":{"hasRecord":false},"status":[],"craftingrep":0,"jobrep":{"tow":0,"hotdog":0,"trucker":0,"taxi":0},"attachmentcraftingrep":0,"commandbinds":[],"ishandcuffed":false,"fingerprint":"lj080b08qge8222","stress":0,"phone":[],"thirst":65.80000000000003,"communityservice":0,"injail":0,"fightitems":[],"isdead":false}', '[{"amount":1,"name":"weapon_scarh","slot":1,"created":[1694439161],"type":"weapon","info":{"quality":61.29999999999867,"serie":"47BUB6gA773KItB","ammo":6}},{"amount":1,"name":"driver_license","slot":2,"created":[1694380907],"type":"item","info":{"firstname":"فاطمة","quality":[100],"birthdate":"0101-01-10","type":"Class C Driver License","lastname":"سشي"}},{"amount":1,"name":"trackerdisabler","slot":3,"created":[1694457159],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"id_card","slot":4,"created":[1694380907],"type":"item","info":{"firstname":"فاطمة","quality":[100],"citizenid":"HMX75285","gender":0,"birthdate":"0101-01-10","nationality":"سشيسشي","lastname":"سشي"}},{"amount":1,"name":"phone","slot":5,"created":[1694380907],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"rccar","slot":6,"created":[1694437094],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"rccar","slot":7,"created":[1694437094],"type":"item","info":{"quality":[100]}},{"amount":3,"name":"lockpick","slot":8,"created":[1694380907,1694380907,1694380907],"type":"item","info":{"quality":[100,100,100]}},{"amount":1,"name":"rccar","slot":9,"created":[1694437094],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"rccar","slot":10,"created":[1694437094],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"rccar","slot":11,"created":[1694437095],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"rccar","slot":12,"created":[1694437128],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"rccar","slot":13,"created":[1694437029],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"rccar","slot":14,"created":[1694437095],"type":"item","info":{"quality":[100]}},{"amount":2,"name":"sweet_herbal_tea","slot":15,"created":[1694437015,1694437016],"type":"item","info":{"quality":[100,100]}},{"amount":1,"name":"rccar","slot":16,"created":[1694437029],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"rccar","slot":17,"created":[1694437030],"type":"item","info":{"quality":[100]}},{"amount":1,"name":"rccar","slot":18,"created":[1694437030],"type":"item","info":{"quality":[100]}}]', '2023-09-12 13:53:56', 0, NULL, NULL),
	(1841, 'HSB79943', 4, 'license:f58e142b5b37be564d2e91b8d406856c51a3612f', 'Pika', '{"crypto":0,"bank":4000,"cash":333}', '{"lastname":"الفلاح","birthdate":"2000-12-01","backstory":"placeholder backstory","phone":"5827856298","account":"US03QBCore7088111827","cid":"4","firstname":"بيكا","nationality":"عراق","gender":0}', '{"type":"none","onduty":true,"name":"unemployed","label":"Civilian","isboss":false,"payment":10,"grade":{"level":0,"name":"Freelancer"}}', '{"label":"Ballas","isboss":false,"grade":{"level":1,"name":"Enforcer"},"name":"ballas"}', '{"x":1354.087890625,"y":1151.77587890625,"z":113.748046875}', '{"attachmentcraftingrep":0,"gameitems":[],"hunger":100,"criminalrecord":{"hasRecord":false},"walletid":"nmsh-41278196","bloodtype":"A+","armor":0,"phone":[],"communityservice":0,"thirst":100,"imadminjail":0,"dealerrep":0,"inlaststand":false,"licences":{"business":false,"weapon":false,"driver":true,"id":true},"fingerprint":"CN060g07CxW2688","fightitems":[],"jailitems":[],"laptop":{"background":"default","darkfont":false},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"craftingrep":0,"phonedata":{"SerialNumber":62411623,"InstalledApps":[]},"status":[],"isdead":false,"commandbinds":[],"stress":0,"inside":{"apartment":[]},"tracker":false,"fitbit":[],"injail":0,"callsign":"NO CALLSIGN","ishandcuffed":false}', '[{"slot":1,"created":[1694380742,1694380742,1694380742],"name":"lockpick","type":"item","info":{"quality":[100,100,100]},"amount":3},{"slot":2,"created":[1694381050],"name":"weapon_glock18c","type":"weapon","info":{"quality":143.29999999999789,"ammo":101,"serie":"28sDy6Vx090Arju"},"amount":1},{"slot":3,"created":[1694381442],"name":"weapon_rpg","type":"weapon","info":{"quality":83.04999999999936,"ammo":0,"serie":"28kuE7jO954cxFd"},"amount":1},{"slot":4,"created":[1694380742],"name":"phone","type":"item","info":{"quality":[100]},"amount":1},{"slot":5,"created":[1694380958],"name":"weapon_stungun","type":"weapon","info":{"serie":"54WfH9cw895AWjE","quality":100},"amount":1},{"slot":7,"created":[1694380742],"name":"driver_license","type":"item","info":{"birthdate":"2000-12-01","firstname":"بيكا","lastname":"الفلاح","quality":[100],"type":"Class C Driver License"},"amount":1},{"slot":8,"created":[1694381261],"name":"firstaid","type":"item","info":{"quality":[100]},"amount":1},{"slot":9,"created":[1694380742],"name":"id_card","type":"item","info":{"citizenid":"HSB79943","birthdate":"2000-12-01","firstname":"بيكا","lastname":"الفلاح","quality":[100],"nationality":"عراق","gender":0},"amount":1},{"slot":10,"created":[1694381799],"name":"markedbills","type":"item","info":{"worth":456,"quality":[100]},"amount":1},{"slot":11,"created":[1694381828],"name":"markedbills","type":"item","info":{"worth":1128,"quality":[100]},"amount":1}]', '2023-09-11 16:04:24', 0, NULL, NULL),
	(2086, 'JOW98010', 1, 'license:0edbb9d6499bc5a77b2b8a037d9e33636060fa1f', 'Amigos', '{"cash":500,"bank":4800,"crypto":0}', '{"nationality":"Homeless","gender":0,"birthdate":"1001-01-01","phone":"9922469937","firstname":"Ahmed","lastname":"Khaleel","account":"US03QBCore8784849280","backstory":"placeholder backstory","cid":"1"}', '{"label":"Civilian","onduty":true,"isboss":false,"type":"none","grade":{"level":0,"name":"Freelancer"},"payment":10,"name":"unemployed"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":178.33847045898438,"y":6523.31884765625,"z":31.79052734375}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":0,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":74388113,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-28004520","fingerprint":"qe244g41iNG2072","hunger":0,"attachmentcraftingrep":0,"bloodtype":"B+","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":true,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"id_card","type":"item","created":[1695822495],"info":{"nationality":"Homeless","firstname":"Ahmed","lastname":"Khaleel","gender":0,"birthdate":"1001-01-01","citizenid":"JOW98010","quality":[100]},"amount":1},{"slot":2,"name":"driver_license","type":"item","created":[1695822495],"info":{"firstname":"Ahmed","type":"Class C Driver License","lastname":"Khaleel","birthdate":"1001-01-01","quality":[100]},"amount":1},{"slot":3,"name":"lockpick","type":"item","created":[1695822495,1695822495,1695822495],"info":{"quality":[100,100,100]},"amount":3},{"slot":4,"name":"phone","type":"item","created":[1695822495],"info":{"quality":[100]},"amount":1}]', '2023-09-27 17:33:21', 0, NULL, NULL),
	(2048, 'JVY64988', 1, 'license:914b2ac70871589229ce34d6aab0d96a830c2d5e', 'Ahmad', '{"bank":5000,"crypto":0,"cash":190}', '{"phone":"3194606003","backstory":"placeholder backstory","account":"US05QBCore8193118511","birthdate":"0033-03-03","lastname":"3","nationality":"3","cid":"1","firstname":"3","gender":0}', '{"payment":750,"name":"police","onduty":true,"grade":{"level":2},"isboss":false,"label":"Law Enforcement","type":"leo"}', '{"isboss":false,"name":"none","label":"No Gang Affiliaton","grade":{"level":0,"name":"none"}}', '{"x":16.82637405395507,"y":-1710.4615478515626,"z":29.2799072265625}', '{"walletid":"nmsh-30574955","tracker":false,"licences":{"weapon":false,"business":false,"id":true,"driver":true},"fitbit":[],"bloodtype":"AB+","status":[],"ishandcuffed":false,"callsign":"NO CALLSIGN","gameitems":[],"injail":0,"communityservice":0,"stress":0,"isdead":false,"fightitems":[],"hunger":78.99999999999999,"inlaststand":false,"phone":[],"attachmentcraftingrep":0,"armor":0,"inside":{"apartment":[]},"imadminjail":0,"craftingrep":0,"dealerrep":0,"laptop":{"background":"default","darkfont":false},"jobrep":{"taxi":0,"tow":0,"hotdog":0,"trucker":0},"fingerprint":"Wv049E69BOn4257","commandbinds":[],"phonedata":{"SerialNumber":13477247,"InstalledApps":[]},"thirst":81.00000000000002,"criminalrecord":{"hasRecord":false},"jailitems":[]}', '[{"amount":1,"slot":1,"name":"weapon_glock17","info":{"quality":100,"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_PI_FLSH"}],"serie":"82bAu6QB377Deqz"},"type":"weapon","created":[1695058976]},{"amount":1,"slot":2,"name":"weapon_m4","info":{"quality":98.94999999999996,"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"serie":"82XCO6hp125YwRV","ammo":245},"type":"weapon","created":[1695058978]},{"amount":1,"slot":3,"name":"weapon_ar15","info":{"quality":99.09999999999997,"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"},{"label":"Scope","component":"COMPONENT_AT_SCOPE_MEDIUM"},{"label":"AF-Grip","component":"COMPONENT_AT_AR_AFGRIP"}],"serie":"40bZt0gz219COTf","ammo":241},"type":"weapon","created":[1695058980]},{"amount":1,"slot":4,"name":"weapon_remington","info":{"quality":99.55,"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_SG_FLSH"}],"serie":"10VAL4UM454weKY","ammo":247},"type":"weapon","created":[1695059046]},{"amount":1,"slot":5,"name":"weapon_scarh","info":{"quality":97.4499999999999,"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"serie":"03eGl6Kx041Soum","ammo":229},"type":"weapon","created":[1695058985]},{"amount":1,"slot":6,"name":"driver_license","info":{"quality":[100],"lastname":"3","type":"Class C Driver License","birthdate":"0033-03-03","firstname":"3"},"type":"item","created":[1695058729]},{"amount":1,"slot":8,"name":"radio","info":{"quality":[100]},"type":"item","created":[1695060011]},{"amount":1,"slot":13,"name":"phone","info":{"quality":[100]},"type":"item","created":[1695058729]},{"amount":3,"slot":14,"name":"lockpick","info":{"quality":[100,100,100]},"type":"item","created":[1695058729,1695058729,1695058729]},{"amount":1,"slot":17,"name":"id_card","info":{"gender":0,"birthdate":"0033-03-03","lastname":"3","firstname":"3","citizenid":"JVY64988","nationality":"3","quality":[100]},"type":"item","created":[1695058729]}]', '2023-09-18 18:01:00', 0, NULL, NULL),
	(2130, 'LQB23255', 1, 'license:f20fd3490db962d3549372c2e9deb9e426c47354', 'mggg8458', '{"cash":376,"bank":5000,"crypto":0}', '{"nationality":"AA","gender":0,"birthdate":"1111-11-11","phone":"6773192383","firstname":"A","lastname":"A","account":"US07QBCore9208913764","cid":"1","backstory":"placeholder backstory"}', '{"label":"Law Enforcement","onduty":true,"isboss":false,"type":"leo","grade":{"level":2},"payment":750,"name":"police"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":-209.92088317871095,"y":-884.7824096679688,"z":29.3978271484375}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":100,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":34143079,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-25565740","fingerprint":"oi172V53OVy9562","hunger":100,"attachmentcraftingrep":0,"bloodtype":"O+","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"weapon_scarh","type":"weapon","created":[1695829525],"info":{"ammo":231,"serie":"20hhj2IY264JZWE","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":98.19999999999993},"amount":1},{"slot":2,"name":"radio","type":"item","created":[1695829498],"info":{"quality":[100]},"amount":1},{"slot":3,"name":"weapon_carbinerifle","type":"weapon","created":[1695829518],"info":{"serie":"00krd5Fl989wWac","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"},{"label":"3x Scope","component":"COMPONENT_AT_SCOPE_MEDIUM"}],"quality":100},"amount":1},{"slot":4,"name":"weapon_smg","type":"weapon","created":[1695829520],"info":{"ammo":221,"serie":"14lDn4cV987TzJC","attachments":[{"label":"1x Scope","component":"COMPONENT_AT_SCOPE_MACRO_02"},{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":97.74999999999992},"amount":1},{"slot":5,"name":"weapon_glock17","type":"weapon","created":[1695829496],"info":{"serie":"02vQY9oV548ZXPY","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_PI_FLSH"}],"quality":100},"amount":1},{"slot":8,"name":"pistol_ammo","type":"item","created":[1695829503,1695829503,1695829503,1695829503,1695829503],"info":{"quality":[100,100,100,100,100]},"amount":5},{"slot":9,"name":"rifle_ammo","type":"item","created":[1695829507,1695829507,1695829507,1695829507,1695829507],"info":{"quality":[100,100,100,100,100]},"amount":5},{"slot":10,"name":"smg_ammo","type":"item","created":[1695829508,1695829508,1695829508,1695829508,1695829508],"info":{"quality":[100,100,100,100,100]},"amount":5},{"slot":11,"name":"driver_license","type":"item","created":[1695829284],"info":{"firstname":"A","type":"Class C Driver License","lastname":"A","birthdate":"1111-11-11","quality":[100]},"amount":1},{"slot":12,"name":"id_card","type":"item","created":[1695829284],"info":{"nationality":"AA","firstname":"A","birthdate":"1111-11-11","gender":0,"lastname":"A","citizenid":"LQB23255","quality":[100]},"amount":1},{"slot":13,"name":"lockpick","type":"item","created":[1695829284,1695829284,1695829284],"info":{"quality":[100,100,100]},"amount":3},{"slot":14,"name":"phone","type":"item","created":[1695829284],"info":{"quality":[100]},"amount":1}]', '2023-09-27 15:50:38', 0, NULL, NULL),
	(2115, 'MEL43722', 1, 'license:32df33b92e578aa6371b5d7ad88f5ac6faf33f09', 'Abdullrhman', '{"cash":500,"bank":5000,"crypto":0}', '{"cid":"1","gender":0,"birthdate":"1999-10-10","phone":"5735198513","firstname":"dev","lastname":"dev","account":"US04QBCore8976880085","nationality":"ksa","backstory":"placeholder backstory"}', '{"label":"Civilian","onduty":true,"isboss":false,"type":"none","grade":{"level":0,"name":"Freelancer"},"payment":10,"name":"unemployed"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":441.3230895996094,"y":-980.993408203125,"z":30.6783447265625}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":96.2,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":43865439,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-68035635","fingerprint":"Xm668J53xGU7293","hunger":95.8,"attachmentcraftingrep":0,"bloodtype":"B-","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"id_card","type":"item","created":[1695827220],"info":{"nationality":"ksa","firstname":"dev","lastname":"dev","gender":0,"birthdate":"1999-10-10","citizenid":"MEL43722","quality":[100]},"amount":1},{"slot":2,"name":"driver_license","type":"item","created":[1695827220],"info":{"firstname":"dev","type":"Class C Driver License","lastname":"dev","birthdate":"1999-10-10","quality":[100]},"amount":1},{"slot":3,"name":"lockpick","type":"item","created":[1695827220,1695827220,1695827220],"info":{"quality":[100,100,100]},"amount":3},{"slot":4,"name":"phone","type":"item","created":[1695827220],"info":{"quality":[100]},"amount":1}]', '2023-09-27 15:08:41', 0, NULL, NULL),
	(2096, 'NHV10602', 1, 'license:1a35c58d42ed184c5995f313079feefdafed1d13', 'wajeh', '{"cash":326,"bank":5000,"crypto":0}', '{"nationality":"ASD","gender":0,"birthdate":"1987-11-11","phone":"8745115005","firstname":"DSA","lastname":"ASD","account":"US06QBCore7617144253","backstory":"placeholder backstory","cid":"1"}', '{"label":"Law Enforcement","onduty":true,"isboss":false,"type":"leo","grade":{"level":10},"payment":1150,"name":"police"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":472.73406982421877,"y":-987.1912231445313,"z":30.6783447265625}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":92.4,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":40958177,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-63670033","fingerprint":"uv343B04jDx3009","hunger":91.6,"attachmentcraftingrep":0,"bloodtype":"B-","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"weapon_scarh","type":"weapon","created":[1695824219],"info":{"serie":"11vbB5WJ422Jvwj","ammo":0,"quality":100},"amount":1},{"slot":2,"name":"weapon_mk14","type":"weapon","created":[1695824588],"info":{"ammo":247,"serie":"57PNV6IO634ENsH","attachments":[{"label":"Scope","component":"COMPONENT_AT_SCOPE_LARGE"}],"quality":99.69999999999999},"amount":1},{"slot":3,"name":"weapon_remington","type":"weapon","created":[1695824592],"info":{"ammo":244,"serie":"75nsy3Am936fCaw","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_SG_FLSH"}],"quality":97.74999999999992},"amount":1},{"slot":4,"name":"phone","type":"item","created":[1695824079],"info":{"quality":[100]},"amount":1},{"slot":5,"name":"id_card","type":"item","created":[1695824079],"info":{"nationality":"ASD","firstname":"DSA","birthdate":"1987-11-11","gender":0,"lastname":"ASD","citizenid":"NHV10602","quality":[100]},"amount":1},{"slot":6,"name":"begging_guitar","type":"item","created":[1695824313],"info":{"quality":[100]},"amount":1},{"slot":7,"name":"driver_license","type":"item","created":[1695824079],"info":{"firstname":"DSA","type":"Class C Driver License","lastname":"ASD","birthdate":"1987-11-11","quality":[100]},"amount":1},{"slot":8,"name":"lockpick","type":"item","created":[1695824079,1695824079,1695824079],"info":{"quality":[100,100,100]},"amount":3}]', '2023-09-27 14:23:50', 0, NULL, NULL),
	(2054, 'PUL92950', 1, 'license:1e9bc40fea92669cc93bf80da96305744d09fe44', 'Yos', '{"bank":5000,"crypto":0,"cash":476}', '{"phone":"8665095754","backstory":"placeholder backstory","account":"US03QBCore1722949886","birthdate":"0111-11-11","lastname":"test","nationality":"test","cid":"1","firstname":"test","gender":0}', '{"payment":750,"name":"police","onduty":true,"grade":{"level":2},"isboss":false,"label":"Law Enforcement","type":"leo"}', '{"grade":{"level":0,"name":"none"},"name":"none","label":"No Gang Affiliaton","isboss":false}', '{"x":33.73187255859375,"y":-962.4132080078125,"z":29.3472900390625}', '{"walletid":"nmsh-42892392","tracker":false,"licences":{"driver":true,"business":false,"id":true,"weapon":false},"fitbit":[],"bloodtype":"B+","commandbinds":[],"ishandcuffed":false,"callsign":"NO CALLSIGN","gameitems":[],"thirst":92.4,"fightitems":[],"inside":{"apartment":[]},"isdead":false,"criminalrecord":{"hasRecord":false},"fingerprint":"Xl597g22hBA9468","communityservice":0,"phone":[],"jailitems":[],"armor":0,"attachmentcraftingrep":0,"imadminjail":0,"craftingrep":0,"dealerrep":0,"laptop":{"background":"default","darkfont":false},"jobrep":{"hotdog":0,"taxi":0,"tow":0,"trucker":0},"inlaststand":false,"hunger":91.6,"phonedata":{"InstalledApps":[],"SerialNumber":66413041},"stress":2,"injail":0,"status":[]}', '[{"amount":1,"slot":1,"name":"driver_license","info":{"quality":[100],"lastname":"test","type":"Class C Driver License","birthdate":"0111-11-11","firstname":"test"},"type":"item","created":[1695059488]},{"amount":1,"slot":2,"name":"weapon_remington","info":{"quality":97.59999999999991,"attachments":[{"label":"Flashlight","component":"COMPONENT_AT_SG_FLSH"}],"serie":"05jQg1uh080KvDM","ammo":241},"type":"weapon","created":[1695059916]},{"amount":1,"slot":3,"name":"weapon_mk14","info":{"quality":98.94999999999996,"attachments":[{"label":"Scope","component":"COMPONENT_AT_SCOPE_LARGE"}],"serie":"55VOj6Gz655svUE","ammo":243},"type":"weapon","created":[1695059918]},{"amount":1,"slot":4,"name":"weapon_smg","info":{"quality":100,"attachments":[{"label":"1x Scope","component":"COMPONENT_AT_SCOPE_MACRO_02"},{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"serie":"74PVz2zL736wmbE"},"type":"weapon","created":[1695059977]},{"amount":1,"slot":5,"name":"radio","info":{"quality":[100]},"type":"item","created":[1695059865]},{"amount":1,"slot":7,"name":"id_card","info":{"gender":0,"birthdate":"0111-11-11","lastname":"test","firstname":"test","citizenid":"PUL92950","nationality":"test","quality":[100]},"type":"item","created":[1695059488]},{"amount":2,"slot":9,"name":"lockpick","info":{"quality":[100,100]},"type":"item","created":[1695059488,1695059488]},{"amount":1,"slot":13,"name":"phone","info":{"quality":[100]},"type":"item","created":[1695059488]},{"amount":1,"slot":14,"name":"lockpick","info":{"quality":[100]},"type":"item","created":[1695059488]}]', '2023-09-18 18:01:02', 0, NULL, NULL),
	(1944, 'RDF76642', 1, 'license:6bfc984221c1ae4052ee2cd897444820a1c1ffd0', '! MsHary_', '{"crypto":0,"cash":500,"bank":5000}', '{"lastname":"الحربي","birthdate":"1989-02-04","backstory":"placeholder backstory","cid":"1","firstname":"مشاري","account":"US03QBCore6187990121","phone":"3585948327","nationality":"سعودي","gender":0}', '{"type":"none","onduty":true,"name":"burgershot","label":"BurgerShot","isboss":false,"payment":185,"grade":{"level":1,"name":"Crew Member"}}', '{"label":"No Gang Affiliaton","isboss":false,"grade":{"level":0,"name":"none"},"name":"none"}', '{"x":1383.9296875,"y":1123.912109375,"z":114.6241455078125}', '{"thirst":77.20000000000002,"armor":0,"hunger":74.79999999999999,"ishandcuffed":false,"communityservice":0,"phonedata":{"InstalledApps":[],"SerialNumber":17363626},"fightitems":[],"phone":[],"licences":{"business":false,"weapon":false,"driver":true,"id":true},"criminalrecord":{"hasRecord":false},"walletid":"nmsh-25764986","commandbinds":[],"inlaststand":false,"fitbit":[],"fingerprint":"hk848t29KDH2593","callsign":"NO CALLSIGN","jailitems":[],"laptop":{"background":"default","darkfont":false},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"stress":0,"attachmentcraftingrep":0,"status":[],"isdead":false,"craftingrep":0,"dealerrep":0,"inside":{"apartment":[]},"tracker":false,"imadminjail":0,"gameitems":[],"bloodtype":"B+","injail":0}', '[{"slot":1,"created":[1694446119],"name":"id_card","type":"item","info":{"citizenid":"RDF76642","birthdate":"1989-02-04","firstname":"مشاري","lastname":"الحربي","quality":[100],"nationality":"سعودي","gender":0},"amount":1},{"slot":2,"created":[1694446119],"name":"phone","type":"item","info":{"quality":[100]},"amount":1},{"slot":3,"created":[1694446119,1694446119,1694446119],"name":"lockpick","type":"item","info":{"quality":[100,100,100]},"amount":3},{"slot":4,"created":[1694446119],"name":"driver_license","type":"item","info":{"birthdate":"1989-02-04","firstname":"مشاري","lastname":"الحربي","quality":[100],"type":"Class C Driver License"},"amount":1},{"slot":5,"created":[1694447849],"name":"burger-moneyshot","type":"item","info":{"quality":[100]},"amount":1},{"slot":6,"created":[1694447858,1694447858,1694447858,1694447858],"name":"burger-fries","type":"item","info":{"quality":[100,100,100,100]},"amount":4},{"slot":7,"created":[1694447880],"name":"burger-softdrink","type":"item","info":{"quality":[100]},"amount":1}]', '2023-09-11 16:00:50', 0, NULL, NULL),
	(2070, 'RIR14294', 1, 'license:b39a0d1de726564ae2e33f96275c28238af4059c', 'Cali', '{"cash":500,"bank":5000,"crypto":0}', '{"nationality":"111","gender":0,"birthdate":"0001-11-11","phone":"5786213660","firstname":"111","lastname":"111","account":"US04QBCore6368143094","backstory":"placeholder backstory","cid":"1"}', '{"label":"Civilian","onduty":true,"isboss":false,"type":"none","grade":{"level":0,"name":"Freelancer"},"payment":10,"name":"unemployed"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":-44.22856903076172,"y":-1118.2813720703126,"z":26.4322509765625}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":4,"thirst":96.2,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":37962709,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[],"property_id":"24"},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-34465540","fingerprint":"QR463a55IQB9799","hunger":95.8,"attachmentcraftingrep":0,"bloodtype":"O-","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"id_card","type":"item","created":[1695805873],"info":{"nationality":"111","firstname":"111","lastname":"111","gender":0,"birthdate":"0001-11-11","citizenid":"RIR14294","quality":[100]},"amount":1},{"slot":2,"name":"driver_license","type":"item","created":[1695805873],"info":{"firstname":"111","type":"Class C Driver License","lastname":"111","birthdate":"0001-11-11","quality":[100]},"amount":1},{"slot":3,"name":"lockpick","type":"item","created":[1695805873,1695805873],"info":{"quality":[100,100]},"amount":2},{"slot":4,"name":"phone","type":"item","created":[1695805873],"info":{"quality":[100]},"amount":1}]', '2023-09-27 09:14:10', 0, NULL, NULL),
	(2006, 'ROF34048', 1, 'license:3138b70881df94afecabff0a254ba609da8d65b3', 'mhmds', '{"crypto":0,"cash":500,"bank":5000}', '{"lastname":"gh","birthdate":"1999-02-03","backstory":"placeholder backstory","cid":"1","firstname":"kk","account":"US03QBCore3515569642","phone":"5442868058","nationality":"w","gender":0}', '{"type":"none","onduty":true,"name":"unemployed","label":"Civilian","isboss":false,"payment":10,"grade":{"level":0,"name":"Freelancer"}}', '{"label":"No Gang Affiliaton","isboss":false,"grade":{"level":0,"name":"none"},"name":"none"}', '{"x":-849.5208740234375,"y":-2435.024169921875,"z":14.047607421875}', '{"thirst":96.2,"armor":0,"hunger":95.8,"ishandcuffed":false,"communityservice":0,"phonedata":{"InstalledApps":[],"SerialNumber":70150101},"fightitems":[],"phone":[],"licences":{"business":false,"weapon":false,"driver":true,"id":true},"criminalrecord":{"hasRecord":false},"walletid":"nmsh-94080126","commandbinds":[],"inlaststand":false,"fitbit":[],"fingerprint":"ua500D44sLN4338","callsign":"NO CALLSIGN","jailitems":[],"laptop":{"background":"default","darkfont":false},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"stress":1,"attachmentcraftingrep":0,"status":[],"isdead":true,"craftingrep":0,"dealerrep":0,"inside":{"apartment":[]},"tracker":false,"imadminjail":0,"gameitems":[],"bloodtype":"A+","injail":0}', '[{"slot":1,"created":[1694459722],"name":"id_card","type":"item","info":{"citizenid":"ROF34048","birthdate":"1999-02-03","firstname":"kk","lastname":"gh","quality":[100],"nationality":"w","gender":0},"amount":1},{"slot":2,"created":[1694459722],"name":"phone","type":"item","info":{"quality":[100]},"amount":1},{"slot":3,"created":[1694459722,1694459722,1694459722],"name":"lockpick","type":"item","info":{"quality":[100,100,100]},"amount":3},{"slot":4,"created":[1694460862],"name":"weapon_rpg","type":"weapon","info":{"quality":89.4999999999996,"ammo":1,"serie":"49XLt4wd417Rkyv"},"amount":1},{"slot":5,"created":[1694460367],"name":"weapon_mk14","type":"weapon","info":{"quality":86.49999999999949,"ammo":123,"serie":"04oFq1Sl411GAhx"},"amount":1},{"slot":6,"created":[1694459722],"name":"driver_license","type":"item","info":{"birthdate":"1999-02-03","firstname":"kk","lastname":"gh","quality":[100],"type":"Class C Driver License"},"amount":1},{"slot":7,"created":[1694460376],"name":"weapon_ak74","type":"weapon","info":{"quality":76.2999999999991,"ammo":9,"serie":"29Htt0mZ248kUWC"},"amount":1}]', '2023-09-11 19:53:51', 0, NULL, NULL),
	(2079, 'UUP96298', 1, 'license:846b1a336572db30a38b4287c9553a6c1c44eb97', 'ABO AHMED', '{"cash":476,"bank":5000,"crypto":0}', '{"nationality":"pluto","gender":0,"birthdate":"2004-12-04","phone":"7297684945","firstname":"abo","lastname":"ahmed","account":"US08QBCore5287640132","cid":"1","backstory":"placeholder backstory"}', '{"label":"Law Enforcement","onduty":true,"isboss":false,"type":"leo","grade":{"level":5},"payment":900,"name":"police"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":-212.57142639160157,"y":6304.4306640625,"z":31.5040283203125}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":96.2,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":21889017,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[],"property_id":"26"},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-60742792","fingerprint":"Wc289l51KYH2197","hunger":95.8,"attachmentcraftingrep":0,"bloodtype":"A+","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"id_card","type":"item","created":[1695817813],"info":{"nationality":"pluto","firstname":"abo","birthdate":"2004-12-04","gender":0,"lastname":"ahmed","citizenid":"UUP96298","quality":[100]},"amount":1},{"slot":2,"name":"driver_license","type":"item","created":[1695817813],"info":{"firstname":"abo","type":"Class C Driver License","lastname":"ahmed","birthdate":"2004-12-04","quality":[100]},"amount":1},{"slot":4,"name":"weapon_m4","type":"weapon","created":[1695818767],"info":{"ammo":30,"serie":"48SDZ7Uz085OQQD","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":100},"amount":1},{"slot":5,"name":"weapon_scarh","type":"weapon","created":[1695818764],"info":{"ammo":0,"serie":"75kSJ1FE176yAoY","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":100},"amount":1},{"slot":6,"name":"weapon_mg","type":"weapon","created":[1695818071],"info":{"quality":100,"serie":"78gCA4Qv311FusB"},"amount":1},{"slot":7,"name":"boombox","type":"item","created":[1695818604],"info":{"quality":[100]},"amount":1},{"slot":8,"name":"boombox","type":"item","created":[1695818605],"info":{"quality":[100]},"amount":1},{"slot":9,"name":"pistol_ammo","type":"item","created":[1695819049],"info":{"quality":[100]},"amount":1},{"slot":10,"name":"phone","type":"item","created":[1695817813],"info":{"quality":[100]},"amount":1},{"slot":13,"name":"lockpick","type":"item","created":[1695817813],"info":{"quality":[100]},"amount":1},{"slot":14,"name":"lockpick","type":"item","created":[1695817813],"info":{"quality":[100]},"amount":1},{"slot":15,"name":"weapon_mg","type":"weapon","created":[1695817933],"info":{"serie":"91uBT9zu906hqSV","ammo":0,"quality":100},"amount":1},{"slot":18,"name":"lockpick","type":"item","created":[1695817813],"info":{"quality":[100]},"amount":1}]', '2023-09-27 12:52:26', 0, NULL, NULL),
	(1852, 'VDN98168', 1, 'license:2fb786e582442701f56da2bdbf60e513f9977d13', '~r~enemy', '{"crypto":0,"cash":500,"bank":5000}', '{"gender":0,"backstory":"placeholder backstory","lastname":"1","cid":"1","account":"US09QBCore2185490915","birthdate":"1111-11-11","nationality":"1","phone":"9479757024","firstname":"1"}', '{"label":"Civilian","onduty":true,"grade":{"name":"Freelancer","level":0},"name":"unemployed","type":"none","isboss":false,"payment":10}', '{"name":"none","label":"No Gang Affiliaton","isboss":false,"grade":{"name":"none","level":0}}', '{"x":97.17362976074219,"y":-1351.84619140625,"z":29.3304443359375}', '{"armor":0,"fightitems":[],"jailitems":[],"imadminjail":0,"ishandcuffed":false,"status":[],"dealerrep":0,"callsign":"NO CALLSIGN","stress":0,"inlaststand":false,"fitbit":[],"licences":{"id":true,"driver":true,"weapon":false,"business":false},"communityservice":0,"phone":[],"hunger":100,"criminalrecord":{"hasRecord":false},"jobrep":{"trucker":0,"tow":0,"hotdog":0,"taxi":0},"inside":{"apartment":[]},"tracker":false,"walletid":"nmsh-36989620","bloodtype":"O-","laptop":{"background":"default","darkfont":false},"thirst":100,"isdead":false,"commandbinds":[],"craftingrep":0,"fingerprint":"Ck367Y52IRO6536","phonedata":{"InstalledApps":[],"SerialNumber":64147687},"gameitems":[],"attachmentcraftingrep":0,"injail":0}', '[{"type":"item","name":"lockpick","amount":3,"created":[1694382004,1694382004,1694382004],"info":{"quality":[100,100,100]},"slot":1},{"type":"item","name":"driver_license","amount":1,"created":[1694382004],"info":{"type":"Class C Driver License","birthdate":"1111-11-11","lastname":"1","quality":[100],"firstname":"1"},"slot":2},{"type":"item","name":"id_card","amount":1,"created":[1694382004],"info":{"nationality":"1","quality":[100],"birthdate":"1111-11-11","lastname":"1","gender":0,"citizenid":"VDN98168","firstname":"1"},"slot":3},{"type":"item","name":"phone","amount":1,"created":[1694382004],"info":{"quality":[100]},"slot":4}]', '2023-09-10 22:38:28', 0, NULL, NULL),
	(2061, 'VIZ97057', 1, 'license:bcd139fc3dc984d0197fe69672e4e62bd0a007c2', 'TheRealEyad ⭐', '{"cash":500,"bank":5000,"crypto":0}', '{"nationality":"ee","gender":0,"birthdate":"1111-11-11","phone":"9583084152","firstname":"eee","lastname":"ee","account":"US07QBCore9884137846","cid":"1","backstory":"placeholder backstory"}', '{"label":"Law Enforcement","onduty":true,"isboss":false,"type":"leo","grade":{"level":0,"name":"No Grades"},"payment":30,"name":"police"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":-575.6967163085938,"y":-247.5296630859375,"z":35.952392578125}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":88.60000000000001,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":27426755,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-48559632","fingerprint":"Jp311I89OzU6803","hunger":87.39999999999999,"attachmentcraftingrep":0,"bloodtype":"A-","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"id_card","type":"item","created":[1695800958],"info":{"nationality":"ee","firstname":"eee","lastname":"ee","gender":0,"birthdate":"1111-11-11","citizenid":"VIZ97057","quality":[100]},"amount":1},{"slot":2,"name":"driver_license","type":"item","created":[1695800958],"info":{"firstname":"eee","type":"Class C Driver License","lastname":"ee","birthdate":"1111-11-11","quality":[100]},"amount":1},{"slot":3,"name":"phone","type":"item","created":[1695800958],"info":{"quality":[100]},"amount":1},{"slot":4,"name":"lockpick","type":"item","created":[1695800958,1695800958,1695800958],"info":{"quality":[100,100,100]},"amount":3}]', '2023-09-27 08:02:32', 0, NULL, NULL),
	(2063, 'VJV83746', 1, 'license:be294ede633531af5c7733401e5be21a9d28cbea', 'y5mx', '{"cash":500,"bank":4990,"crypto":0}', '{"nationality":"st","gender":0,"birthdate":"1998-10-10","phone":"2047017959","firstname":"hello","lastname":"hi","account":"US01QBCore5104562179","backstory":"placeholder backstory","cid":"1"}', '{"label":"Law Enforcement","onduty":true,"isboss":false,"type":"leo","grade":{"level":1},"payment":600,"name":"police"}', '{"label":"Ballas","grade":{"level":0,"name":"Recruit"},"isboss":false,"name":"ballas"}', '{"x":389.3802185058594,"y":-1017.7977905273438,"z":29.4146728515625}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":92.4,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":80705914,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-87087385","fingerprint":"RZ265x62pac9731","hunger":91.6,"attachmentcraftingrep":0,"bloodtype":"AB+","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"id_card","type":"item","created":[1695801034],"info":{"nationality":"st","firstname":"hello","lastname":"hi","gender":0,"birthdate":"1998-10-10","citizenid":"VJV83746","quality":[100]},"amount":1},{"slot":2,"name":"spray","type":"item","created":[1695801416],"info":{"quality":[100]},"amount":1},{"slot":3,"name":"lockpick","type":"item","created":[1695801034,1695801034,1695801034],"info":{"quality":[100,100,100]},"amount":3},{"slot":4,"name":"phone","type":"item","created":[1695801034],"info":{"quality":[100]},"amount":1},{"slot":5,"name":"weapon_smg","type":"weapon","created":[1695801258],"info":{"serie":"33ajS3cm969vPaR","attachments":[{"label":"1x Scope","component":"COMPONENT_AT_SCOPE_MACRO_02"},{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":100},"amount":1},{"slot":6,"name":"radio","type":"item","created":[1695801261],"info":{"quality":[100]},"amount":1},{"slot":7,"name":"driver_license","type":"item","created":[1695801034],"info":{"firstname":"hello","type":"Class C Driver License","lastname":"hi","birthdate":"1998-10-10","quality":[100]},"amount":1}]', '2023-09-27 07:57:18', 0, NULL, NULL),
	(2107, 'WUK08631', 1, 'license:2266eabcf350975f12fc5cb9f7070a9afc4dc502', 'Moatz', '{"cash":462,"bank":5000,"crypto":0}', '{"cid":"1","gender":0,"birthdate":"3124-08-07","phone":"9237707902","firstname":"فيقل","lastname":"ثفيقل","account":"US03QBCore4709553877","nationality":"ثفقلا","backstory":"placeholder backstory"}', '{"label":"Law Enforcement","onduty":true,"isboss":false,"type":"leo","grade":{"level":2},"payment":750,"name":"police"}', '{"label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false,"name":"none"}', '{"x":-76.9186782836914,"y":-1109.9736328125,"z":25.89306640625}', '{"ishandcuffed":false,"craftingrep":0,"jailitems":[],"stress":0,"thirst":92.4,"laptop":{"background":"default","darkfont":false},"phonedata":{"SerialNumber":39394453,"InstalledApps":[]},"status":[],"inlaststand":false,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"fitbit":[],"criminalrecord":{"hasRecord":false},"walletid":"nmsh-76993957","fingerprint":"ko900J11BCn2469","hunger":91.6,"attachmentcraftingrep":0,"bloodtype":"B+","licences":{"driver":true,"business":false,"id":true,"weapon":false},"injail":0,"phone":[],"isdead":false,"commandbinds":[],"armor":0,"gameitems":[],"fightitems":[],"dealerrep":0,"imadminjail":0,"tracker":false,"communityservice":0}', '[{"slot":1,"name":"weapon_m4","type":"weapon","created":[1695827167],"info":{"ammo":205,"serie":"78mlZ2hO737mMjK","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":96.69999999999988},"amount":1},{"slot":2,"name":"weapon_scarh","type":"weapon","created":[1695827126],"info":{"ammo":0,"serie":"25TGq6pw553WEtK","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_AR_FLSH"}],"quality":81.6999999999993},"amount":1},{"slot":3,"name":"lockpick","type":"item","created":[1695826200,1695826200,1695826200],"info":{"quality":[100,100,100]},"amount":3},{"slot":4,"name":"phone","type":"item","created":[1695826200],"info":{"quality":[100]},"amount":1},{"slot":5,"name":"driver_license","type":"item","created":[1695826200],"info":{"firstname":"فيقل","type":"Class C Driver License","lastname":"ثفيقل","birthdate":"3124-08-07","quality":[100]},"amount":1},{"slot":8,"name":"weapon_glock17","type":"weapon","created":[1695827168],"info":{"ammo":132,"serie":"19tST2gd928XglY","attachments":[{"label":"Flashlight","component":"COMPONENT_AT_PI_FLSH"}],"quality":98.34999999999994},"amount":1},{"slot":15,"name":"heavyarmor","type":"item","created":[1695827169],"info":{"quality":[100]},"amount":1},{"slot":10,"name":"id_card","type":"item","created":[1695826200],"info":{"nationality":"ثفقلا","firstname":"فيقل","birthdate":"3124-08-07","gender":0,"lastname":"ثفيقل","citizenid":"WUK08631","quality":[100]},"amount":1}]', '2023-09-27 15:29:48', 0, NULL, NULL),
	(1953, 'YCI02041', 1, 'license:c1a64c29020abf061ac7474fff46338670c3faed', 'Loup', '{"crypto":0,"cash":500,"bank":5000}', '{"lastname":"1112","birthdate":"2222-02-22","backstory":"placeholder backstory","nationality":"222","firstname":"112","account":"US06QBCore2491331866","phone":"9456048077","cid":"1","gender":0}', '{"type":"none","onduty":true,"name":"unemployed","label":"Civilian","isboss":false,"payment":10,"grade":{"level":0,"name":"Freelancer"}}', '{"label":"No Gang Affiliaton","isboss":false,"grade":{"level":0,"name":"none"},"name":"none"}', '{"x":1355.88134765625,"y":1146.989013671875,"z":113.175048828125}', '{"thirst":84.80000000000001,"armor":0,"hunger":83.19999999999999,"ishandcuffed":false,"communityservice":0,"phonedata":{"InstalledApps":[],"SerialNumber":92917193},"fightitems":[],"phone":[],"licences":{"business":false,"weapon":false,"driver":true,"id":true},"criminalrecord":{"hasRecord":false},"walletid":"nmsh-21698579","commandbinds":[],"inlaststand":false,"fitbit":[],"fingerprint":"Vc956m74AOb2228","callsign":"NO CALLSIGN","jailitems":[],"laptop":{"background":"default","darkfont":false},"jobrep":{"tow":0,"hotdog":0,"taxi":0,"trucker":0},"stress":20,"attachmentcraftingrep":0,"status":[],"isdead":false,"craftingrep":0,"dealerrep":0,"inside":{"property_id":"18","apartment":[]},"tracker":false,"imadminjail":0,"gameitems":[],"bloodtype":"A+","injail":0}', '[{"slot":1,"created":[1694447187],"name":"weapon_mg","type":"weapon","info":{"quality":95.49999999999983,"ammo":140,"serie":"87iql2Re594BKGg"},"amount":1},{"slot":2,"created":[1694447188],"name":"weapon_scarh","type":"weapon","info":{"serie":"47cyW5it470YIXC","quality":100},"amount":1},{"slot":3,"created":[1694447190],"name":"weapon_remington","type":"weapon","info":{"serie":"10uwI8Ua677nvKo","quality":100},"amount":1},{"slot":4,"created":[1694447192],"name":"weapon_revolver","type":"weapon","info":{"serie":"96kPj8MU556tBLf","quality":100},"amount":1},{"slot":5,"created":[1694380967],"name":"weapon_heavypistol","type":"weapon","info":{"quality":95.19999999999983,"ammo":169,"serie":"78XCE0UK651TmHk"},"amount":1},{"slot":6,"created":[1694446838],"name":"id_card","type":"item","info":{"citizenid":"YCI02041","birthdate":"2222-02-22","firstname":"112","lastname":"1112","quality":[100],"nationality":"222","gender":0},"amount":1},{"slot":7,"created":[1694446838],"name":"phone","type":"item","info":{"quality":[100]},"amount":1},{"slot":8,"created":[1694446838,1694446838,1694446838],"name":"lockpick","type":"item","info":{"quality":[100,100,100]},"amount":3},{"slot":10,"created":[1694446838],"name":"driver_license","type":"item","info":{"birthdate":"2222-02-22","firstname":"112","lastname":"1112","quality":[100],"type":"Class C Driver License"},"amount":1},{"slot":14,"created":[1694447192],"name":"weapon_unarmed","type":"weapon","info":{"serie":"60eYU0WR858spHs","quality":100},"amount":1}]', '2023-09-11 16:07:48', 0, NULL, NULL);

-- Dumping structure for table nmsh.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nmsh.playerskins: ~27 rows (approximately)
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(19, 'IIV39976', 'mp_m_freemode_01', '{"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":18},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":38},{"texture":0,"component_id":7,"drawable":8},{"texture":0,"component_id":10,"drawable":-1},{"texture":0,"component_id":1,"drawable":210},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":11,"drawable":10},{"texture":0,"component_id":8,"drawable":10},{"texture":0,"component_id":4,"drawable":56}],"faceFeatures":{"nosePeakHigh":0,"lipsThickness":0,"chinHole":0,"eyesOpening":0,"noseBoneTwist":0,"noseBoneHigh":0,"eyeBrownHigh":0,"eyeBrownForward":0,"jawBoneBackSize":0,"chinBoneLenght":0,"noseWidth":0,"cheeksBoneHigh":0,"cheeksBoneWidth":0,"chinBoneLowering":0,"chinBoneSize":0,"nosePeakLowering":0,"neckThickness":0,"jawBoneWidth":0,"cheeksWidth":0,"nosePeakSize":0},"props":[{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1},{"prop_id":0,"texture":0,"drawable":-1}],"tattoos":{"ZONE_LEFT_LEG":[{"name":"TAT_BB_027","hashMale":"MP_Bea_M_Lleg_000","collection":"mpbeach_overlays","opacity":0.1,"label":"Tribal Star","hashFemale":"","zone":"ZONE_LEFT_LEG"}],"ZONE_RIGHT_ARM":[{"name":"TAT_BB_026","hashMale":"MP_Bea_M_RArm_000","collection":"mpbeach_overlays","opacity":0.1,"label":"Tribal Sun","hashFemale":"","zone":"ZONE_RIGHT_ARM"}],"ZONE_HEAD":[{"name":"TAT_BB_021","hashMale":"MP_Bea_M_Head_000","collection":"mpbeach_overlays","opacity":0.1,"label":"Pirate Skull","hashFemale":"","zone":"ZONE_HEAD"}],"ZONE_LEFT_ARM":[{"name":"TAT_AR_003","hashMale":"MP_Airraces_Tattoo_003_M","collection":"mpairraces_overlays","opacity":0.1,"label":"Toxic Trails","hashFemale":"MP_Airraces_Tattoo_003_F","zone":"ZONE_LEFT_ARM"}],"ZONE_RIGHT_LEG":[{"name":"TAT_BB_025","hashMale":"MP_Bea_M_Rleg_000","collection":"mpbeach_overlays","opacity":0.1,"label":"Tribal Tiki Tower","hashFemale":"","zone":"ZONE_RIGHT_LEG"}],"ZONE_TORSO":[{"name":"TAT_AR_000","hashMale":"MP_Airraces_Tattoo_000_M","collection":"mpairraces_overlays","opacity":0.1,"label":"Turbulence","hashFemale":"MP_Airraces_Tattoo_000_F","zone":"ZONE_TORSO"}]},"model":"mp_m_freemode_01","hair":{"color":0,"style":78,"highlight":0,"texture":0},"headBlend":{"skinFirst":0,"shapeFirst":0,"shapeThird":0,"shapeSecond":0,"thirdMix":0,"skinSecond":0,"shapeMix":0,"skinThird":0,"skinMix":0},"headOverlays":{"blemishes":{"opacity":0,"style":0,"color":0,"secondColor":0},"eyebrows":{"opacity":0,"style":0,"color":0,"secondColor":0},"chestHair":{"opacity":0,"style":0,"color":0,"secondColor":0},"makeUp":{"opacity":0,"style":0,"color":0,"secondColor":0},"complexion":{"opacity":0,"style":0,"color":0,"secondColor":0},"beard":{"opacity":0,"style":0,"color":0,"secondColor":0},"sunDamage":{"opacity":0,"style":0,"color":0,"secondColor":0},"moleAndFreckles":{"opacity":0,"style":0,"color":0,"secondColor":0},"lipstick":{"opacity":0,"style":0,"color":0,"secondColor":0},"blush":{"opacity":0,"style":0,"color":0,"secondColor":0},"bodyBlemishes":{"opacity":0,"style":0,"color":0,"secondColor":0},"ageing":{"opacity":0,"style":0,"color":0,"secondColor":0}},"eyeColor":0}', 1),
	(20, 'LYY96314', 'mp_m_freemode_01', '{"faceFeatures":{"cheeksWidth":0,"nosePeakHigh":0,"lipsThickness":0,"cheeksBoneHigh":0,"chinBoneSize":0,"eyesOpening":0,"jawBoneBackSize":0,"chinBoneLenght":0,"noseBoneHigh":0,"eyeBrownHigh":0,"jawBoneWidth":0,"nosePeakLowering":0,"noseBoneTwist":0,"eyeBrownForward":0,"noseWidth":0,"chinBoneLowering":0,"cheeksBoneWidth":0,"nosePeakSize":0,"chinHole":0,"neckThickness":0},"hair":{"style":0,"highlight":0,"texture":0,"color":0},"headOverlays":{"complexion":{"opacity":0,"color":0,"style":0,"secondColor":0},"blemishes":{"opacity":0,"color":0,"style":0,"secondColor":0},"beard":{"opacity":0,"color":0,"style":0,"secondColor":0},"bodyBlemishes":{"opacity":0,"color":0,"style":0,"secondColor":0},"lipstick":{"opacity":0,"color":0,"style":0,"secondColor":0},"makeUp":{"opacity":0,"color":0,"style":0,"secondColor":0},"ageing":{"opacity":0,"color":0,"style":0,"secondColor":0},"moleAndFreckles":{"opacity":0,"color":0,"style":0,"secondColor":0},"chestHair":{"opacity":0,"color":0,"style":0,"secondColor":0},"eyebrows":{"opacity":0,"color":0,"style":0,"secondColor":0},"sunDamage":{"opacity":0,"color":0,"style":0,"secondColor":0},"blush":{"opacity":0,"color":0,"style":0,"secondColor":0}},"headBlend":{"skinMix":0,"shapeFirst":0,"shapeMix":0,"thirdMix":0,"skinThird":0,"shapeSecond":0,"skinSecond":0,"shapeThird":0,"skinFirst":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}],"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"model":"mp_m_freemode_01","eyeColor":0,"tattoos":[]}', 1),
	(22, 'DML97005', 'mp_m_freemode_01', '{"faceFeatures":{"cheeksBoneWidth":0,"cheeksWidth":0,"chinBoneLenght":0,"nosePeakSize":0,"chinHole":0,"lipsThickness":0,"eyeBrownForward":0,"nosePeakLowering":0,"eyeBrownHigh":0,"eyesOpening":0,"cheeksBoneHigh":0,"noseWidth":0,"jawBoneWidth":0,"nosePeakHigh":0,"chinBoneLowering":0,"noseBoneTwist":0,"noseBoneHigh":0,"neckThickness":0,"chinBoneSize":0,"jawBoneBackSize":0},"hair":{"style":0,"highlight":0,"color":0,"texture":0},"model":"mp_m_freemode_01","props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"headBlend":{"shapeThird":0,"skinSecond":0,"skinThird":0,"shapeMix":0,"thirdMix":0,"shapeSecond":0,"shapeFirst":0,"skinFirst":0,"skinMix":0},"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":0,"texture":0},{"component_id":3,"drawable":0,"texture":0},{"component_id":4,"drawable":0,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":8,"drawable":0,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":0,"texture":0}],"headOverlays":{"moleAndFreckles":{"opacity":0,"style":0,"color":0,"secondColor":0},"chestHair":{"opacity":0,"style":0,"color":0,"secondColor":0},"lipstick":{"opacity":0,"style":0,"color":0,"secondColor":0},"blemishes":{"opacity":0,"style":0,"color":0,"secondColor":0},"beard":{"opacity":0,"style":0,"color":0,"secondColor":0},"blush":{"opacity":0,"style":0,"color":0,"secondColor":0},"sunDamage":{"opacity":0,"style":0,"color":0,"secondColor":0},"complexion":{"opacity":0,"style":0,"color":0,"secondColor":0},"ageing":{"opacity":0,"style":0,"color":0,"secondColor":0},"eyebrows":{"opacity":0,"style":0,"color":0,"secondColor":0},"makeUp":{"opacity":0,"style":0,"color":0,"secondColor":0},"bodyBlemishes":{"opacity":0,"style":0,"color":0,"secondColor":0}},"eyeColor":0,"tattoos":[]}', 0),
	(23, 'FZN65584', 'mp_f_freemode_01', '{"faceFeatures":{"eyeBrownForward":0,"jawBoneBackSize":0,"eyesOpening":0,"lipsThickness":0,"chinBoneSize":0,"neckThickness":0,"chinHole":0,"noseBoneHigh":0,"nosePeakSize":0,"cheeksBoneHigh":0,"chinBoneLowering":0,"nosePeakLowering":0,"noseBoneTwist":0,"cheeksBoneWidth":0,"cheeksWidth":0,"nosePeakHigh":0,"chinBoneLenght":0,"eyeBrownHigh":0,"jawBoneWidth":0,"noseWidth":0},"model":"mp_f_freemode_01","eyeColor":0,"headBlend":{"skinThird":0,"shapeMix":0,"shapeSecond":0,"skinMix":0,"shapeThird":0,"skinFirst":0,"thirdMix":0,"skinSecond":0,"shapeFirst":0},"tattoos":[],"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":0,"texture":0},{"component_id":3,"drawable":0,"texture":0},{"component_id":4,"drawable":0,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":8,"drawable":0,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":0,"texture":0}],"headOverlays":{"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0}},"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"hair":{"texture":0,"color":0,"highlight":0,"style":0}}', 1),
	(26, 'HCR81520', 'mp_m_freemode_01', '{"hair":{"style":0,"color":0,"texture":0,"highlight":0},"headOverlays":{"bodyBlemishes":{"opacity":0,"secondColor":0,"style":0,"color":0},"ageing":{"opacity":0,"secondColor":0,"style":0,"color":0},"chestHair":{"opacity":0,"secondColor":0,"style":0,"color":0},"moleAndFreckles":{"opacity":0,"secondColor":0,"style":0,"color":0},"makeUp":{"opacity":0,"secondColor":0,"style":0,"color":0},"complexion":{"opacity":0,"secondColor":0,"style":0,"color":0},"eyebrows":{"opacity":0,"secondColor":0,"style":0,"color":0},"blemishes":{"opacity":0,"secondColor":0,"style":0,"color":0},"sunDamage":{"opacity":0,"secondColor":0,"style":0,"color":0},"beard":{"opacity":0,"secondColor":0,"style":0,"color":0},"lipstick":{"opacity":0,"secondColor":0,"style":0,"color":0},"blush":{"opacity":0,"secondColor":0,"style":0,"color":0}},"headBlend":{"thirdMix":0,"skinFirst":0,"skinThird":0,"skinMix":0,"shapeSecond":0,"shapeMix":0,"skinSecond":0,"shapeFirst":0,"shapeThird":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":0,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"tattoos":[],"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"faceFeatures":{"nosePeakLowering":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"eyeBrownForward":0,"cheeksWidth":0,"neckThickness":0,"eyesOpening":0,"jawBoneWidth":0,"noseBoneTwist":0,"nosePeakHigh":0,"chinBoneSize":0,"chinBoneLowering":0,"chinHole":0,"noseWidth":0,"lipsThickness":0,"jawBoneBackSize":0,"chinBoneLenght":0,"noseBoneHigh":0,"eyeBrownHigh":0,"nosePeakSize":0},"model":"mp_m_freemode_01","eyeColor":0}', 1),
	(27, 'AIB23982', 'mp_m_freemode_01', '{"faceFeatures":{"eyeBrownHigh":0,"chinBoneSize":0,"jawBoneWidth":0,"eyesOpening":0,"noseWidth":0,"chinBoneLowering":0,"cheeksBoneHigh":0,"chinBoneLenght":0,"eyeBrownForward":0,"noseBoneHigh":0,"cheeksWidth":0,"nosePeakSize":0,"nosePeakLowering":0,"lipsThickness":0,"neckThickness":0,"cheeksBoneWidth":0,"jawBoneBackSize":0,"noseBoneTwist":0,"chinHole":0,"nosePeakHigh":0},"tattoos":[],"props":[{"texture":0,"drawable":160,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"headOverlays":{"bodyBlemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"beard":{"style":0,"opacity":0,"secondColor":0,"color":0},"blush":{"style":0,"opacity":0,"secondColor":0,"color":0},"sunDamage":{"style":0,"opacity":0,"secondColor":0,"color":0},"eyebrows":{"style":0,"opacity":0,"secondColor":0,"color":0},"lipstick":{"style":0,"opacity":0,"secondColor":0,"color":0},"blemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"chestHair":{"style":0,"opacity":0,"secondColor":0,"color":0},"makeUp":{"style":0,"opacity":0,"secondColor":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"secondColor":0,"color":0},"ageing":{"style":0,"opacity":0,"secondColor":0,"color":0},"complexion":{"style":0,"opacity":0,"secondColor":0,"color":0}},"eyeColor":0,"hair":{"style":0,"texture":0,"color":0,"highlight":0},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":165},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":15},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":460},{"component_id":1,"texture":0,"drawable":31}],"model":"mp_m_freemode_01","headBlend":{"skinThird":0,"shapeMix":0,"shapeSecond":0,"shapeFirst":0,"skinMix":0,"skinFirst":0,"skinSecond":0,"thirdMix":0,"shapeThird":0}}', 0),
	(28, 'OGR18462', 'mp_m_freemode_01', '{"eyeColor":24,"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headOverlays":{"lipstick":{"secondColor":0,"opacity":0,"style":0,"color":0},"blush":{"secondColor":0,"opacity":0,"style":0,"color":0},"eyebrows":{"secondColor":0,"opacity":1,"style":30,"color":54},"complexion":{"secondColor":0,"opacity":0,"style":0,"color":0},"beard":{"secondColor":0,"opacity":0,"style":0,"color":20},"makeUp":{"secondColor":0,"opacity":0,"style":0,"color":0},"chestHair":{"secondColor":0,"opacity":0,"style":0,"color":0},"ageing":{"secondColor":0,"opacity":0,"style":0,"color":0},"sunDamage":{"secondColor":0,"opacity":0,"style":0,"color":0},"blemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"moleAndFreckles":{"secondColor":0,"opacity":0.5,"style":0,"color":0}},"tattoos":[],"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":-1,"chinBoneLenght":0,"eyesOpening":0.8,"cheeksBoneHigh":-0.2,"neckThickness":1,"chinBoneSize":0,"noseBoneHigh":0.1,"chinBoneLowering":0,"lipsThickness":0,"cheeksWidth":0.5,"eyeBrownForward":0,"noseWidth":-0.7,"chinHole":1,"jawBoneWidth":0.5,"jawBoneBackSize":-0.6,"noseBoneTwist":-0.3,"nosePeakSize":-0.1,"nosePeakLowering":0.1,"nosePeakHigh":-0.3,"eyeBrownHigh":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":64},{"texture":0,"component_id":3,"drawable":12},{"texture":0,"component_id":4,"drawable":1},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":-1},{"texture":3,"component_id":8,"drawable":88},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":11}],"hair":{"texture":0,"color":20,"style":64,"highlight":20},"headBlend":{"shapeThird":0,"skinThird":0,"skinSecond":0,"thirdMix":0,"shapeFirst":45,"skinMix":0,"shapeSecond":45,"skinFirst":7,"shapeMix":0.4}}', 1),
	(30, 'DML97005', 'a_f_m_beach_01', '{"tattoos":[],"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"hair":{"texture":0,"style":0,"color":-1,"highlight":-1},"headOverlays":{"beard":{"style":0,"opacity":0,"secondColor":0,"color":0},"eyebrows":{"style":0,"opacity":0,"secondColor":0,"color":0},"ageing":{"style":0,"opacity":0,"secondColor":0,"color":0},"makeUp":{"style":0,"opacity":0,"secondColor":0,"color":0},"blemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"complexion":{"style":0,"opacity":0,"secondColor":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"secondColor":0,"color":0},"lipstick":{"style":0,"opacity":0,"secondColor":0,"color":0},"blush":{"style":0,"opacity":0,"secondColor":0,"color":0},"sunDamage":{"style":0,"opacity":0,"secondColor":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"chestHair":{"style":0,"opacity":0,"secondColor":0,"color":0}},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"faceFeatures":{"noseBoneHigh":0,"cheeksWidth":0,"chinHole":0,"nosePeakSize":0,"jawBoneBackSize":0,"cheeksBoneHigh":0,"cheeksBoneWidth":0,"nosePeakHigh":0,"eyeBrownHigh":0,"neckThickness":0,"chinBoneSize":0,"chinBoneLenght":0,"chinBoneLowering":0,"jawBoneWidth":0,"nosePeakLowering":0,"eyeBrownForward":0,"noseWidth":0,"noseBoneTwist":0,"eyesOpening":0,"lipsThickness":0},"headBlend":{"skinFirst":0,"shapeMix":0,"thirdMix":0,"skinSecond":0,"skinMix":0,"shapeThird":0,"shapeFirst":0,"shapeSecond":0,"skinThird":0},"eyeColor":-1,"model":"a_f_m_beach_01"}', 1),
	(31, 'AIB23982', 'mp_f_freemode_01', '{"headOverlays":{"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0}},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"tattoos":[],"hair":{"highlight":0,"texture":0,"color":0,"style":0},"headBlend":{"skinSecond":0,"shapeMix":0,"thirdMix":0,"shapeSecond":0,"shapeThird":0,"skinThird":0,"skinMix":0,"skinFirst":0,"shapeFirst":0},"model":"mp_f_freemode_01","eyeColor":0,"faceFeatures":{"eyeBrownForward":0,"cheeksBoneWidth":0,"chinHole":0,"noseWidth":0,"chinBoneSize":0,"neckThickness":0,"cheeksWidth":0,"nosePeakSize":0,"eyesOpening":0,"nosePeakHigh":0,"nosePeakLowering":0,"jawBoneBackSize":0,"eyeBrownHigh":0,"chinBoneLowering":0,"noseBoneHigh":0,"lipsThickness":0,"jawBoneWidth":0,"cheeksBoneHigh":0,"noseBoneTwist":0,"chinBoneLenght":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}]}', 1),
	(32, 'HSB79943', 'mp_m_freemode_01', '{"headOverlays":{"complexion":{"style":0,"secondColor":0,"color":0,"opacity":0},"bodyBlemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"eyebrows":{"style":0,"secondColor":0,"color":0,"opacity":0},"beard":{"style":2,"secondColor":0,"color":61,"opacity":1},"blush":{"style":0,"secondColor":0,"color":0,"opacity":0},"sunDamage":{"style":0,"secondColor":0,"color":0,"opacity":0},"makeUp":{"style":0,"secondColor":0,"color":0,"opacity":0},"lipstick":{"style":0,"secondColor":0,"color":0,"opacity":0},"moleAndFreckles":{"style":0,"secondColor":0,"color":0,"opacity":0},"chestHair":{"style":0,"secondColor":0,"color":0,"opacity":0},"ageing":{"style":0,"secondColor":0,"color":0,"opacity":0},"blemishes":{"style":0,"secondColor":0,"color":0,"opacity":0}},"faceFeatures":{"chinBoneSize":0,"nosePeakHigh":0,"chinBoneLenght":0,"cheeksWidth":0,"noseBoneHigh":0,"eyeBrownHigh":0,"chinHole":0,"nosePeakLowering":0,"neckThickness":0,"nosePeakSize":0,"noseBoneTwist":0,"lipsThickness":0,"eyeBrownForward":0,"jawBoneBackSize":0,"eyesOpening":0,"cheeksBoneWidth":0,"chinBoneLowering":0,"noseWidth":0,"jawBoneWidth":0,"cheeksBoneHigh":0},"model":"mp_m_freemode_01","eyeColor":0,"headBlend":{"skinThird":0,"thirdMix":0,"shapeMix":0,"shapeThird":0,"shapeSecond":0,"skinMix":0,"skinFirst":0,"shapeFirst":0,"skinSecond":0},"tattoos":[],"hair":{"style":9,"highlight":0,"color":0,"texture":0},"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}]}', 1),
	(33, 'HMX75285', 'mp_m_freemode_01', '{"headOverlays":{"makeUp":{"style":0,"secondColor":0,"color":0,"opacity":0},"bodyBlemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"eyebrows":{"style":0,"secondColor":0,"color":0,"opacity":0},"blemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"blush":{"style":0,"secondColor":0,"color":0,"opacity":0},"sunDamage":{"style":0,"secondColor":0,"color":0,"opacity":0},"beard":{"style":0,"secondColor":0,"color":0,"opacity":0},"lipstick":{"style":0,"secondColor":0,"color":0,"opacity":0},"chestHair":{"style":0,"secondColor":0,"color":0,"opacity":0},"moleAndFreckles":{"style":0,"secondColor":0,"color":0,"opacity":0},"ageing":{"style":0,"secondColor":0,"color":0,"opacity":0},"complexion":{"style":0,"secondColor":0,"color":0,"opacity":0}},"faceFeatures":{"chinBoneSize":0,"nosePeakHigh":0,"chinBoneLenght":0,"cheeksWidth":0,"noseBoneHigh":0,"eyeBrownHigh":0,"chinHole":0,"nosePeakLowering":0,"jawBoneBackSize":0,"chinBoneLowering":0,"jawBoneWidth":0,"noseBoneTwist":0,"eyeBrownForward":0,"nosePeakSize":0,"eyesOpening":0,"cheeksBoneWidth":0,"lipsThickness":0,"cheeksBoneHigh":0,"noseWidth":0,"neckThickness":0},"model":"mp_m_freemode_01","eyeColor":0,"headBlend":{"skinThird":0,"thirdMix":0,"shapeFirst":0,"shapeThird":0,"shapeMix":0,"skinMix":0,"skinFirst":0,"shapeSecond":0,"skinSecond":0},"tattoos":[],"hair":{"style":0,"highlight":0,"color":0,"texture":0},"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0},{"drawable":4,"component_id":1,"texture":0}]}', 0),
	(35, 'HMX75285', 'mp_f_freemode_01', '{"headOverlays":{"makeUp":{"style":0,"secondColor":0,"opacity":0,"color":0},"chestHair":{"style":0,"secondColor":0,"opacity":0,"color":0},"eyebrows":{"style":0,"secondColor":0,"opacity":0,"color":0},"beard":{"style":0,"secondColor":0,"opacity":0,"color":0},"blush":{"style":0,"secondColor":0,"opacity":0,"color":0},"sunDamage":{"style":0,"secondColor":0,"opacity":0,"color":0},"complexion":{"style":0,"secondColor":0,"opacity":0,"color":0},"lipstick":{"style":0,"secondColor":0,"opacity":0,"color":0},"ageing":{"style":0,"secondColor":0,"opacity":0,"color":0},"blemishes":{"style":0,"secondColor":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"secondColor":0,"opacity":0,"color":0},"moleAndFreckles":{"style":0,"secondColor":0,"opacity":0,"color":0}},"faceFeatures":{"chinBoneSize":0,"cheeksBoneHigh":0,"chinBoneLenght":0,"cheeksWidth":0,"noseBoneHigh":0,"eyeBrownHigh":0,"chinHole":0,"nosePeakLowering":0,"neckThickness":0,"eyesOpening":0,"jawBoneBackSize":0,"lipsThickness":0,"nosePeakHigh":0,"noseBoneTwist":0,"chinBoneLowering":0,"cheeksBoneWidth":0,"noseWidth":0,"jawBoneWidth":0,"eyeBrownForward":0,"nosePeakSize":0},"model":"mp_f_freemode_01","eyeColor":0,"headBlend":{"shapeSecond":0,"thirdMix":0,"shapeMix":0,"shapeThird":0,"shapeFirst":0,"skinFirst":0,"skinMix":0,"skinThird":0,"skinSecond":0},"tattoos":[],"hair":{"style":0,"highlight":0,"color":0,"texture":0},"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}]}', 1),
	(36, 'VDN98168', 'mp_m_freemode_01', '{"headOverlays":{"moleAndFreckles":{"style":0,"secondColor":0,"color":0,"opacity":0},"chestHair":{"style":0,"secondColor":0,"color":0,"opacity":0},"eyebrows":{"style":0,"secondColor":0,"color":0,"opacity":0},"blemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"blush":{"style":0,"secondColor":0,"color":0,"opacity":0},"sunDamage":{"style":0,"secondColor":0,"color":0,"opacity":0},"makeUp":{"style":0,"secondColor":0,"color":0,"opacity":0},"lipstick":{"style":0,"secondColor":0,"color":0,"opacity":0},"beard":{"style":0,"secondColor":0,"color":0,"opacity":0},"ageing":{"style":0,"secondColor":0,"color":0,"opacity":0},"bodyBlemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"complexion":{"style":0,"secondColor":0,"color":0,"opacity":0}},"faceFeatures":{"chinBoneSize":0,"eyeBrownForward":0,"chinBoneLenght":0,"cheeksWidth":0,"noseBoneHigh":0,"eyeBrownHigh":0,"chinHole":0,"nosePeakLowering":0,"jawBoneBackSize":0,"cheeksBoneHigh":0,"eyesOpening":0,"jawBoneWidth":0,"neckThickness":0,"nosePeakSize":0,"chinBoneLowering":0,"cheeksBoneWidth":0,"noseBoneTwist":0,"nosePeakHigh":0,"lipsThickness":0,"noseWidth":0},"model":"mp_m_freemode_01","eyeColor":0,"headBlend":{"shapeSecond":0,"thirdMix":0,"shapeMix":0,"shapeThird":0,"shapeFirst":0,"skinThird":0,"skinMix":0,"skinFirst":0,"skinSecond":0},"tattoos":[],"hair":{"highlight":0,"style":0,"color":0,"texture":0},"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}]}', 1),
	(37, 'RDF76642', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"highlight":0,"texture":0,"color":0,"style":3},"headBlend":{"shapeFirst":0,"shapeThird":0,"skinThird":0,"skinMix":0,"shapeMix":0,"skinSecond":0,"thirdMix":0,"skinFirst":0,"shapeSecond":0},"faceFeatures":{"noseBoneHigh":0,"cheeksWidth":0,"noseWidth":0,"chinBoneSize":0,"eyeBrownHigh":0,"jawBoneWidth":0,"eyeBrownForward":0,"nosePeakSize":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"jawBoneBackSize":0,"nosePeakLowering":0,"noseBoneTwist":0,"neckThickness":0,"nosePeakHigh":0,"chinHole":0,"chinBoneLowering":0,"eyesOpening":0,"chinBoneLenght":0,"lipsThickness":0},"model":"mp_m_freemode_01","headOverlays":{"blush":{"style":0,"secondColor":0,"opacity":0,"color":0},"ageing":{"style":0,"secondColor":0,"opacity":0,"color":0},"beard":{"style":3,"secondColor":0,"opacity":1,"color":0},"complexion":{"style":0,"secondColor":0,"opacity":0,"color":0},"chestHair":{"style":0,"secondColor":0,"opacity":0,"color":0},"moleAndFreckles":{"style":0,"secondColor":0,"opacity":0,"color":0},"makeUp":{"style":0,"secondColor":0,"opacity":0,"color":0},"blemishes":{"style":0,"secondColor":0,"opacity":0,"color":0},"lipstick":{"style":0,"secondColor":0,"opacity":0,"color":0},"eyebrows":{"style":0,"secondColor":0,"opacity":0,"color":0},"sunDamage":{"style":0,"secondColor":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"secondColor":0,"opacity":0,"color":0}},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":282,"component_id":11},{"texture":0,"drawable":150,"component_id":8},{"texture":0,"drawable":26,"component_id":3},{"texture":0,"drawable":0,"component_id":6}],"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"eyeColor":0}', 1),
	(38, 'YCI02041', 'mp_m_freemode_01', '{"eyeColor":0,"hair":{"style":0,"texture":0,"highlight":0,"color":0},"headBlend":{"shapeSecond":0,"shapeThird":0,"skinThird":0,"skinSecond":0,"shapeMix":0,"shapeFirst":0,"thirdMix":0,"skinMix":0,"skinFirst":0},"faceFeatures":{"jawBoneBackSize":0,"cheeksWidth":0,"noseWidth":0,"chinBoneSize":0,"eyesOpening":0,"jawBoneWidth":0,"eyeBrownForward":0,"nosePeakSize":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"noseBoneHigh":0,"neckThickness":0,"noseBoneTwist":0,"nosePeakLowering":0,"nosePeakHigh":0,"chinHole":0,"chinBoneLowering":0,"eyeBrownHigh":0,"chinBoneLenght":0,"lipsThickness":0},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"headOverlays":{"blush":{"style":0,"color":0,"secondColor":0,"opacity":0},"ageing":{"style":0,"color":0,"secondColor":0,"opacity":0},"beard":{"style":0,"color":0,"secondColor":0,"opacity":0},"complexion":{"style":0,"color":0,"secondColor":0,"opacity":0},"chestHair":{"style":0,"color":0,"secondColor":0,"opacity":0},"lipstick":{"style":0,"color":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"style":0,"color":0,"secondColor":0,"opacity":0},"sunDamage":{"style":0,"color":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"style":0,"color":0,"secondColor":0,"opacity":0},"makeUp":{"style":0,"color":0,"secondColor":0,"opacity":0},"blemishes":{"style":0,"color":0,"secondColor":0,"opacity":0},"eyebrows":{"style":0,"color":0,"secondColor":0,"opacity":0}},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}],"model":"mp_m_freemode_01","tattoos":[]}', 1),
	(39, 'ROF34048', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"style":0,"color":0,"texture":0,"highlight":0},"headBlend":{"shapeFirst":0,"thirdMix":0,"skinMix":0,"shapeSecond":0,"shapeMix":0,"shapeThird":0,"skinThird":0,"skinSecond":0,"skinFirst":0},"faceFeatures":{"noseBoneHigh":0,"nosePeakLowering":0,"noseWidth":0,"chinBoneSize":0,"eyeBrownHigh":0,"jawBoneWidth":0,"eyeBrownForward":0,"neckThickness":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"jawBoneBackSize":0,"eyesOpening":0,"noseBoneTwist":0,"nosePeakSize":0,"nosePeakHigh":0,"chinHole":0,"chinBoneLowering":0,"cheeksWidth":0,"chinBoneLenght":0,"lipsThickness":0},"model":"mp_m_freemode_01","headOverlays":{"lipstick":{"opacity":0,"color":0,"secondColor":0,"style":0},"ageing":{"opacity":0,"color":0,"secondColor":0,"style":0},"beard":{"opacity":0,"color":0,"secondColor":0,"style":0},"complexion":{"opacity":0,"color":0,"secondColor":0,"style":0},"chestHair":{"opacity":0,"color":0,"secondColor":0,"style":0},"blemishes":{"opacity":0,"color":0,"secondColor":0,"style":0},"makeUp":{"opacity":0,"color":0,"secondColor":0,"style":0},"sunDamage":{"opacity":0,"color":0,"secondColor":0,"style":0},"moleAndFreckles":{"opacity":0,"color":0,"secondColor":0,"style":0},"eyebrows":{"opacity":0,"color":0,"secondColor":0,"style":0},"blush":{"opacity":0,"color":0,"secondColor":0,"style":0},"bodyBlemishes":{"opacity":0,"color":0,"secondColor":0,"style":0}},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}],"eyeColor":0,"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}]}', 1),
	(40, 'JVY64988', 'mp_m_freemode_01', '{"eyeColor":0,"headOverlays":{"blush":{"style":0,"opacity":0,"color":0,"secondColor":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0,"secondColor":0},"chestHair":{"style":0,"opacity":0,"color":0,"secondColor":0},"eyebrows":{"style":0,"opacity":0,"color":0,"secondColor":0},"makeUp":{"style":0,"opacity":0,"color":0,"secondColor":0},"ageing":{"style":0,"opacity":0,"color":0,"secondColor":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0,"secondColor":0},"beard":{"style":0,"opacity":0,"color":0,"secondColor":0},"complexion":{"style":0,"opacity":0,"color":0,"secondColor":0},"blemishes":{"style":0,"opacity":0,"color":0,"secondColor":0},"sunDamage":{"style":0,"opacity":0,"color":0,"secondColor":0},"lipstick":{"style":0,"opacity":0,"color":0,"secondColor":0}},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"tattoos":[],"model":"mp_m_freemode_01","props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"hair":{"style":0,"texture":0,"highlight":0,"color":0},"faceFeatures":{"eyeBrownHigh":0,"nosePeakHigh":0,"lipsThickness":0,"chinHole":0,"neckThickness":0,"noseWidth":0,"noseBoneTwist":0,"eyeBrownForward":0,"chinBoneLowering":0,"jawBoneWidth":0,"noseBoneHigh":0,"eyesOpening":0,"chinBoneLenght":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"nosePeakLowering":0,"cheeksWidth":0,"nosePeakSize":0,"chinBoneSize":0,"jawBoneBackSize":0},"headBlend":{"shapeSecond":0,"skinFirst":0,"shapeMix":0,"skinSecond":0,"skinThird":0,"shapeThird":0,"thirdMix":0,"skinMix":0,"shapeFirst":0}}', 1),
	(41, 'PUL92950', 'mp_m_freemode_01', '{"eyeColor":0,"headOverlays":{"blush":{"style":0,"secondColor":0,"color":0,"opacity":0},"moleAndFreckles":{"style":0,"secondColor":0,"color":0,"opacity":0},"sunDamage":{"style":0,"secondColor":0,"color":0,"opacity":0},"eyebrows":{"style":0,"secondColor":0,"color":0,"opacity":0},"makeUp":{"style":0,"secondColor":0,"color":0,"opacity":0},"ageing":{"style":0,"secondColor":0,"color":0,"opacity":0},"bodyBlemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"beard":{"style":0,"secondColor":0,"color":0,"opacity":0},"complexion":{"style":0,"secondColor":0,"color":0,"opacity":0},"blemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"chestHair":{"style":0,"secondColor":0,"color":0,"opacity":0},"lipstick":{"style":0,"secondColor":0,"color":0,"opacity":0}},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"tattoos":[],"model":"mp_m_freemode_01","props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"hair":{"style":0,"texture":0,"highlight":0,"color":0},"faceFeatures":{"nosePeakLowering":0,"nosePeakHigh":0,"lipsThickness":0,"chinHole":0,"jawBoneWidth":0,"noseWidth":0,"noseBoneTwist":0,"eyesOpening":0,"chinBoneLowering":0,"cheeksBoneWidth":0,"noseBoneHigh":0,"eyeBrownHigh":0,"nosePeakSize":0,"chinBoneSize":0,"cheeksBoneHigh":0,"neckThickness":0,"cheeksWidth":0,"chinBoneLenght":0,"eyeBrownForward":0,"jawBoneBackSize":0},"headBlend":{"shapeSecond":0,"skinFirst":0,"shapeMix":0,"skinSecond":0,"skinThird":0,"shapeThird":0,"thirdMix":0,"skinMix":0,"shapeFirst":0}}', 1),
	(42, 'VIZ97057', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"highlight":0,"color":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headOverlays":{"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0}},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"headBlend":{"skinMix":0,"thirdMix":0,"shapeFirst":0,"shapeMix":0,"shapeThird":0,"shapeSecond":0,"skinThird":0,"skinFirst":0,"skinSecond":0},"eyeColor":-1,"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"chinBoneLowering":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"jawBoneBackSize":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"eyesOpening":0,"neckThickness":0,"chinHole":0,"nosePeakLowering":0,"eyeBrownForward":0,"noseBoneTwist":0,"chinBoneSize":0,"nosePeakHigh":0}}', 1),
	(43, 'VJV83746', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"color":0,"highlight":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headOverlays":{"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0}},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"headBlend":{"skinMix":0,"thirdMix":0,"shapeFirst":0,"shapeMix":0,"shapeThird":0,"skinFirst":0,"skinThird":0,"shapeSecond":0,"skinSecond":0},"eyeColor":-1,"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"chinBoneLowering":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"eyesOpening":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"chinBoneSize":0,"neckThickness":0,"chinHole":0,"noseBoneTwist":0,"eyeBrownForward":0,"nosePeakLowering":0,"jawBoneBackSize":0,"nosePeakHigh":0}}', 1),
	(44, 'RIR14294', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"color":0,"highlight":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"chinBoneLowering":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"chinBoneSize":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"jawBoneBackSize":0,"neckThickness":0,"chinHole":0,"nosePeakLowering":0,"eyeBrownForward":0,"eyesOpening":0,"noseBoneTwist":0,"nosePeakHigh":0},"eyeColor":-1,"headBlend":{"skinMix":0,"thirdMix":0,"skinFirst":0,"shapeMix":0,"shapeThird":0,"shapeFirst":0,"skinThird":0,"shapeSecond":0,"skinSecond":0},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"model":"mp_m_freemode_01","headOverlays":{"lipstick":{"color":0,"secondColor":0,"opacity":0,"style":0},"beard":{"color":0,"secondColor":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"secondColor":0,"opacity":0,"style":0},"blemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"blush":{"color":0,"secondColor":0,"opacity":0,"style":0},"chestHair":{"color":0,"secondColor":0,"opacity":0,"style":0},"ageing":{"color":0,"secondColor":0,"opacity":0,"style":0},"makeUp":{"color":0,"secondColor":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"complexion":{"color":0,"secondColor":0,"opacity":0,"style":0},"eyebrows":{"color":0,"secondColor":0,"opacity":0,"style":0},"sunDamage":{"color":0,"secondColor":0,"opacity":0,"style":0}}}', 1),
	(45, 'CEF69772', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"color":0,"highlight":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"eyeColor":-1,"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"headBlend":{"skinMix":0,"thirdMix":0,"skinFirst":0,"shapeMix":0,"shapeThird":0,"skinThird":0,"shapeSecond":0,"shapeFirst":0,"skinSecond":0},"headOverlays":{"lipstick":{"color":0,"secondColor":0,"opacity":0,"style":0},"beard":{"color":0,"secondColor":0,"opacity":0,"style":0},"ageing":{"color":0,"secondColor":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"secondColor":0,"opacity":0,"style":0},"blush":{"color":0,"secondColor":0,"opacity":0,"style":0},"chestHair":{"color":0,"secondColor":0,"opacity":0,"style":0},"eyebrows":{"color":0,"secondColor":0,"opacity":0,"style":0},"makeUp":{"color":0,"secondColor":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"blemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"complexion":{"color":0,"secondColor":0,"opacity":0,"style":0},"sunDamage":{"color":0,"secondColor":0,"opacity":0,"style":0}},"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"nosePeakHigh":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"chinBoneSize":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"jawBoneBackSize":0,"neckThickness":0,"chinHole":0,"nosePeakLowering":0,"eyeBrownForward":0,"chinBoneLowering":0,"eyesOpening":0,"noseBoneTwist":0}}', 1),
	(46, 'UUP96298', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"highlight":0,"color":0,"texture":0,"style":21},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"nosePeakHigh":0,"eyeBrownHigh":0,"chinBoneSize":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"jawBoneBackSize":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"chinBoneLowering":0,"neckThickness":0,"chinHole":0,"nosePeakLowering":0,"eyesOpening":0,"noseBoneTwist":0,"cheeksWidth":0,"eyeBrownForward":0},"eyeColor":-1,"headBlend":{"skinMix":0,"thirdMix":0,"skinFirst":0,"shapeMix":0,"shapeThird":0,"shapeFirst":0,"skinThird":0,"shapeSecond":0,"skinSecond":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":11,"drawable":22},{"texture":3,"component_id":4,"drawable":15},{"texture":8,"component_id":6,"drawable":23}],"model":"mp_m_freemode_01","headOverlays":{"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0}}}', 1),
	(47, 'JOW98010', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"highlight":0,"color":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"chinBoneLowering":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"jawBoneBackSize":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"nosePeakHigh":0,"neckThickness":0,"chinHole":0,"nosePeakLowering":0,"eyeBrownForward":0,"chinBoneSize":0,"eyesOpening":0,"noseBoneTwist":0},"eyeColor":-1,"headBlend":{"skinMix":0,"thirdMix":0,"shapeFirst":0,"shapeMix":0,"shapeThird":0,"skinFirst":0,"skinThird":0,"shapeSecond":0,"skinSecond":0},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"model":"mp_m_freemode_01","headOverlays":{"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0}}}', 1),
	(48, 'CMD01952', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"highlight":0,"color":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headOverlays":{"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0}},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":8}],"headBlend":{"skinMix":0,"thirdMix":0,"skinFirst":0,"shapeMix":0,"shapeThird":0,"shapeSecond":0,"skinThird":0,"shapeFirst":0,"skinSecond":0},"eyeColor":-1,"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"nosePeakHigh":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"jawBoneBackSize":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"eyesOpening":0,"neckThickness":0,"chinHole":0,"nosePeakLowering":0,"eyeBrownForward":0,"chinBoneSize":0,"noseBoneTwist":0,"chinBoneLowering":0}}', 1),
	(49, 'NHV10602', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"highlight":0,"color":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headOverlays":{"lipstick":{"color":0,"secondColor":0,"opacity":0,"style":0},"beard":{"color":0,"secondColor":0,"opacity":0,"style":0},"ageing":{"color":0,"secondColor":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"secondColor":0,"opacity":0,"style":0},"blush":{"color":0,"secondColor":0,"opacity":0,"style":0},"chestHair":{"color":0,"secondColor":0,"opacity":0,"style":0},"eyebrows":{"color":0,"secondColor":0,"opacity":0,"style":0},"makeUp":{"color":0,"secondColor":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"blemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"complexion":{"color":0,"secondColor":0,"opacity":0,"style":0},"sunDamage":{"color":0,"secondColor":0,"opacity":0,"style":0}},"eyeColor":-1,"headBlend":{"skinMix":0,"thirdMix":0,"skinFirst":0,"shapeMix":0,"shapeThird":0,"skinThird":0,"shapeSecond":0,"shapeFirst":0,"skinSecond":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"chinBoneLowering":0,"eyeBrownHigh":0,"chinBoneSize":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"eyeBrownForward":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"jawBoneBackSize":0,"neckThickness":0,"chinHole":0,"noseBoneTwist":0,"eyesOpening":0,"cheeksWidth":0,"nosePeakLowering":0,"nosePeakHigh":0}}', 1),
	(50, 'WUK08631', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"color":0,"highlight":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"eyeColor":-1,"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"headBlend":{"skinMix":0,"thirdMix":0,"shapeFirst":0,"shapeMix":0,"shapeThird":0,"shapeSecond":0,"skinThird":0,"skinFirst":0,"skinSecond":0},"faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"nosePeakHigh":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"eyeBrownForward":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"chinBoneLowering":0,"neckThickness":0,"chinHole":0,"nosePeakLowering":0,"eyesOpening":0,"chinBoneSize":0,"jawBoneBackSize":0,"noseBoneTwist":0},"model":"mp_m_freemode_01","headOverlays":{"lipstick":{"color":0,"secondColor":0,"opacity":0,"style":0},"beard":{"color":0,"secondColor":0,"opacity":0,"style":0},"complexion":{"color":0,"secondColor":0,"opacity":0,"style":0},"blemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"blush":{"color":0,"secondColor":0,"opacity":0,"style":0},"chestHair":{"color":0,"secondColor":0,"opacity":0,"style":0},"eyebrows":{"color":0,"secondColor":0,"opacity":0,"style":0},"makeUp":{"color":0,"secondColor":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"secondColor":0,"opacity":0,"style":0},"ageing":{"color":0,"secondColor":0,"opacity":0,"style":0},"sunDamage":{"color":0,"secondColor":0,"opacity":0,"style":0}}}', 1),
	(51, 'MEL43722', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"color":0,"highlight":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headOverlays":{"lipstick":{"color":0,"secondColor":0,"opacity":0,"style":0},"beard":{"color":0,"secondColor":0,"opacity":0,"style":0},"complexion":{"color":0,"secondColor":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"secondColor":0,"opacity":0,"style":0},"blush":{"color":0,"secondColor":0,"opacity":0,"style":0},"chestHair":{"color":0,"secondColor":0,"opacity":0,"style":0},"ageing":{"color":0,"secondColor":0,"opacity":0,"style":0},"makeUp":{"color":0,"secondColor":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"eyebrows":{"color":0,"secondColor":0,"opacity":0,"style":0},"blemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"sunDamage":{"color":0,"secondColor":0,"opacity":0,"style":0}},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"headBlend":{"skinMix":0,"thirdMix":0,"shapeFirst":0,"shapeMix":0,"shapeThird":0,"skinFirst":0,"shapeSecond":0,"skinThird":0,"skinSecond":0},"eyeColor":-1,"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"nosePeakHigh":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"jawBoneBackSize":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"chinBoneSize":0,"neckThickness":0,"chinHole":0,"noseBoneTwist":0,"eyeBrownForward":0,"nosePeakLowering":0,"eyesOpening":0,"chinBoneLowering":0}}', 1),
	(52, 'LQB23255', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"highlight":0,"color":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0},{"texture":0,"component_id":9,"drawable":0}],"eyeColor":-1,"headBlend":{"skinMix":0,"thirdMix":0,"shapeFirst":0,"shapeMix":0,"shapeThird":0,"skinFirst":0,"shapeSecond":0,"skinThird":0,"skinSecond":0},"faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"nosePeakHigh":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"jawBoneBackSize":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"eyeBrownForward":0,"neckThickness":0,"chinHole":0,"noseBoneTwist":0,"eyesOpening":0,"chinBoneSize":0,"nosePeakLowering":0,"chinBoneLowering":0},"model":"mp_m_freemode_01","headOverlays":{"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0}}}', 1),
	(53, 'EVY21770', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"color":0,"highlight":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headOverlays":{"lipstick":{"color":0,"secondColor":0,"opacity":0,"style":0},"beard":{"color":0,"secondColor":0,"opacity":0,"style":0},"ageing":{"color":0,"secondColor":0,"opacity":0,"style":0},"moleAndFreckles":{"color":0,"secondColor":0,"opacity":0,"style":0},"blush":{"color":0,"secondColor":0,"opacity":0,"style":0},"chestHair":{"color":0,"secondColor":0,"opacity":0,"style":0},"eyebrows":{"color":0,"secondColor":0,"opacity":0,"style":0},"makeUp":{"color":0,"secondColor":0,"opacity":0,"style":0},"bodyBlemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"complexion":{"color":0,"secondColor":0,"opacity":0,"style":0},"blemishes":{"color":0,"secondColor":0,"opacity":0,"style":0},"sunDamage":{"color":0,"secondColor":0,"opacity":0,"style":0}},"eyeColor":-1,"headBlend":{"skinMix":0,"thirdMix":0,"shapeFirst":0,"shapeMix":0,"shapeThird":0,"shapeSecond":0,"skinThird":0,"skinFirst":0,"skinSecond":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"chinBoneLowering":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"eyeBrownForward":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"noseBoneTwist":0,"neckThickness":0,"chinHole":0,"nosePeakLowering":0,"jawBoneBackSize":0,"chinBoneSize":0,"eyesOpening":0,"nosePeakHigh":0}}', 1),
	(54, 'AVE81303', 'mp_m_freemode_01', '{"tattoos":[],"hair":{"highlight":0,"color":0,"texture":0,"style":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headOverlays":{"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0}},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"headBlend":{"skinMix":0,"thirdMix":0,"skinFirst":0,"shapeMix":0,"shapeThird":0,"shapeFirst":0,"shapeSecond":0,"skinThird":0,"skinSecond":0},"eyeColor":-1,"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":0,"noseBoneHigh":0,"nosePeakSize":0,"chinBoneLowering":0,"eyeBrownHigh":0,"cheeksWidth":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"noseBoneTwist":0,"noseWidth":0,"lipsThickness":0,"chinBoneLenght":0,"chinBoneSize":0,"neckThickness":0,"chinHole":0,"nosePeakLowering":0,"jawBoneBackSize":0,"eyeBrownForward":0,"eyesOpening":0,"nosePeakHigh":0}}', 1);

-- Dumping structure for table nmsh.player_companies
CREATE TABLE IF NOT EXISTS `player_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.player_companies: ~0 rows (approximately)

-- Dumping structure for table nmsh.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.player_contacts: ~2 rows (approximately)
INSERT INTO `player_contacts` (`id`, `citizenid`, `name`, `number`) VALUES
	(12, 'AIB23982', 'pika alflah', '3964367145'),
	(13, 'XUM18441', 'شسي سيشسش', '3526413864');

-- Dumping structure for table nmsh.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.player_houses: ~0 rows (approximately)

-- Dumping structure for table nmsh.player_jobs
CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(50) DEFAULT NULL,
  `employees` text DEFAULT NULL,
  `maxEmployee` tinyint(11) DEFAULT 15,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1518 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.player_jobs: ~1,412 rows (approximately)
INSERT INTO `player_jobs` (`id`, `jobname`, `employees`, `maxEmployee`) VALUES
	(106, 'ambulance', '[]', 15),
	(107, 'lawyer', '[]', 15),
	(108, 'koi', '[]', 15),
	(109, 'garbage', '[]', 15),
	(110, 'realestate', '[]', 15),
	(111, 'hotdog', '[]', 15),
	(112, 'judge', '[]', 15),
	(113, 'police', '{"IIV39976":{"name":"Nmsh Dev","cid":"IIV39976","grade":4}}', 15),
	(114, 'reporter', '[]', 15),
	(115, 'vineyard', '[]', 15),
	(116, 'airport', '[]', 15),
	(117, 'taxi', '[]', 15),
	(118, 'mechanic', '[]', 15),
	(119, 'bus', '[]', 15),
	(120, 'trucker', '[]', 15),
	(121, 'oilwell', '[]', 15),
	(122, 'tow', '[]', 15),
	(123, 'cardealer', '[]', 15),
	(124, 'koi', '[]', 15),
	(125, 'airport', '[]', 15),
	(126, 'cardealer', '[]', 15),
	(127, 'ambulance', '[]', 15),
	(128, 'taxi', '[]', 15),
	(129, 'lawyer', '[]', 15),
	(130, 'burgershot', '[]', 15),
	(131, 'reporter', '[]', 15),
	(132, 'tow', '[]', 15),
	(133, 'oilwell', '[]', 15),
	(134, 'garbage', '[]', 15),
	(135, 'bus', '[]', 15),
	(136, 'mechanic', '[]', 15),
	(137, 'hotdog', '[]', 15),
	(138, 'vineyard', '[]', 15),
	(139, 'judge', '[]', 15),
	(140, 'realestate', '[]', 15),
	(141, 'police', '[]', 15),
	(142, 'trucker', '[]', 15),
	(143, 'airport', '[]', 15),
	(144, 'cigar', '[]', 15),
	(145, 'tow', '[]', 15),
	(146, 'judge', '[]', 15),
	(147, 'burgershot', '[]', 15),
	(148, 'trucker', '[]', 15),
	(149, 'cardealer', '[]', 15),
	(150, 'vineyard', '[]', 15),
	(151, 'garbage', '[]', 15),
	(152, 'vapeshop', '[]', 15),
	(153, 'taxi', '[]', 15),
	(154, 'ambulance', '[]', 15),
	(155, 'mechanic', '[]', 15),
	(156, 'lawyer', '[]', 15),
	(157, 'oilwell', '[]', 15),
	(158, 'auction', '[]', 15),
	(159, 'realestate', '[]', 15),
	(160, 'police', '{"LYY96314":{"grade":2,"name":"asaa sa","cid":"LYY96314"}}', 15),
	(161, 'limeys', '[]', 15),
	(162, 'uwu', '[]', 15),
	(163, 'reporter', '[]', 15),
	(164, 'koi', '[]', 15),
	(165, 'beanmachine', '[]', 15),
	(166, 'hotdog', '[]', 15),
	(167, 'bus', '[]', 15),
	(168, 'hotdog', '[]', 15),
	(169, 'limeys', '[]', 15),
	(170, 'garbage', '[]', 15),
	(171, 'burgershot', '[]', 15),
	(172, 'judge', '[]', 15),
	(173, 'trucker', '[]', 15),
	(174, 'auction', '[]', 15),
	(175, 'ambulance', '[]', 15),
	(176, 'vapeshop', '[]', 15),
	(177, 'lawyer', '[]', 15),
	(178, 'beanmachine', '[]', 15),
	(179, 'uwu', '[]', 15),
	(180, 'realestate', '[]', 15),
	(181, 'tow', '[]', 15),
	(182, 'bus', '[]', 15),
	(183, 'police', '{"DML97005":{"name":"Nmsh Alnmsh","grade":2,"cid":"DML97005"},"LYY96314":{"name":"asaa sa","grade":2,"cid":"LYY96314"},"FZN65584":{"name":"ad s","grade":2,"cid":"FZN65584"}}', 15),
	(184, 'taxi', '[]', 15),
	(185, 'airport', '[]', 15),
	(186, 'mechanic', '[]', 15),
	(187, 'cardealer', '[]', 15),
	(188, 'cigar', '[]', 15),
	(189, 'koi', '[]', 15),
	(190, 'oilwell', '[]', 15),
	(191, 'reporter', '[]', 15),
	(192, 'vineyard', '[]', 15),
	(193, 'hotdog', '[]', 15),
	(194, 'cigar', '[]', 15),
	(195, 'ambulance', '[]', 15),
	(196, 'vapeshop', '[]', 15),
	(197, 'reporter', '[]', 15),
	(198, 'koi', '[]', 15),
	(199, 'taxi', '[]', 15),
	(200, 'airport', '[]', 15),
	(201, 'oilwell', '[]', 15),
	(202, 'beanmachine', '[]', 15),
	(203, 'trucker', '[]', 15),
	(204, 'mechanic', '[]', 15),
	(205, 'garbage', '[]', 15),
	(206, 'tow', '[]', 15),
	(207, 'police', '{"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2}}', 15),
	(208, 'uwu', '[]', 15),
	(209, 'burgershot', '[]', 15),
	(210, 'vineyard', '[]', 15),
	(211, 'realestate', '[]', 15),
	(212, 'cardealer', '[]', 15),
	(213, 'auction', '[]', 15),
	(214, 'judge', '[]', 15),
	(215, 'lawyer', '[]', 15),
	(216, 'bus', '[]', 15),
	(217, 'limeys', '[]', 15),
	(218, 'lawyer', '[]', 15),
	(219, 'cigar', '[]', 15),
	(220, 'limeys', '[]', 15),
	(221, 'uwu', '[]', 15),
	(222, 'judge', '[]', 15),
	(223, 'auction', '[]', 15),
	(224, 'burgershot', '[]', 15),
	(225, 'garbage', '[]', 15),
	(226, 'reporter', '[]', 15),
	(227, 'tow', '[]', 15),
	(228, 'oilwell', '[]', 15),
	(229, 'realestate', '[]', 15),
	(230, 'koi', '[]', 15),
	(231, 'airport', '[]', 15),
	(232, 'vapeshop', '[]', 15),
	(233, 'vineyard', '[]', 15),
	(234, 'cardealer', '[]', 15),
	(235, 'mechanic', '[]', 15),
	(236, 'police', '{"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2}}', 15),
	(237, 'hotdog', '[]', 15),
	(238, 'beanmachine', '[]', 15),
	(239, 'trucker', '[]', 15),
	(240, 'taxi', '[]', 15),
	(241, 'ambulance', '[]', 15),
	(242, 'bus', '[]', 15),
	(243, 'oilwell', '[]', 15),
	(244, 'bus', '[]', 15),
	(245, 'beanmachine', '[]', 15),
	(246, 'ambulance', '[]', 15),
	(247, 'police', '{"DML97005":{"grade":2,"cid":"DML97005","name":"Nmsh Alnmsh"},"FZN65584":{"grade":2,"cid":"FZN65584","name":"ad s"},"LYY96314":{"grade":2,"cid":"LYY96314","name":"asaa sa"}}', 15),
	(248, 'mechanic', '[]', 15),
	(249, 'realestate', '[]', 15),
	(250, 'taxi', '[]', 15),
	(251, 'limeys', '[]', 15),
	(252, 'tow', '[]', 15),
	(253, 'vineyard', '[]', 15),
	(254, 'reporter', '[]', 15),
	(255, 'koi', '[]', 15),
	(256, 'judge', '[]', 15),
	(257, 'hotdog', '[]', 15),
	(258, 'lawyer', '[]', 15),
	(259, 'trucker', '[]', 15),
	(260, 'uwu', '[]', 15),
	(261, 'cigar', '[]', 15),
	(262, 'cardealer', '[]', 15),
	(263, 'vapeshop', '[]', 15),
	(264, 'garbage', '[]', 15),
	(265, 'airport', '[]', 15),
	(266, 'burgershot', '[]', 15),
	(267, 'auction', '[]', 15),
	(268, 'limeys', '[]', 15),
	(269, 'vineyard', '[]', 15),
	(270, 'garbage', '[]', 15),
	(271, 'tow', '[]', 15),
	(272, 'auction', '[]', 15),
	(273, 'airport', '[]', 15),
	(274, 'realestate', '[]', 15),
	(275, 'uwu', '[]', 15),
	(276, 'cardealer', '[]', 15),
	(277, 'police', '{"DML97005":{"grade":2,"name":"Nmsh Alnmsh","cid":"DML97005"},"LYY96314":{"grade":2,"name":"asaa sa","cid":"LYY96314"},"FZN65584":{"grade":2,"name":"ad s","cid":"FZN65584"}}', 15),
	(278, 'judge', '[]', 15),
	(279, 'reporter', '[]', 15),
	(280, 'mechanic', '[]', 15),
	(281, 'taxi', '[]', 15),
	(282, 'oilwell', '[]', 15),
	(283, 'bus', '[]', 15),
	(284, 'burgershot', '[]', 15),
	(285, 'vapeshop', '[]', 15),
	(286, 'ambulance', '[]', 15),
	(287, 'beanmachine', '[]', 15),
	(288, 'lawyer', '[]', 15),
	(289, 'koi', '[]', 15),
	(290, 'cigar', '[]', 15),
	(291, 'trucker', '[]', 15),
	(292, 'hotdog', '[]', 15),
	(293, 'burgershot', '[]', 15),
	(294, 'police', '{"FZN65584":{"grade":2,"name":"ad s","cid":"FZN65584"},"LYY96314":{"grade":2,"name":"asaa sa","cid":"LYY96314"},"DML97005":{"grade":2,"name":"Nmsh Alnmsh","cid":"DML97005"}}', 15),
	(295, 'cigar', '[]', 15),
	(296, 'mechanic', '[]', 15),
	(297, 'realestate', '[]', 15),
	(298, 'vineyard', '[]', 15),
	(299, 'uwu', '[]', 15),
	(300, 'limeys', '[]', 15),
	(301, 'ambulance', '[]', 15),
	(302, 'trucker', '[]', 15),
	(303, 'beanmachine', '[]', 15),
	(304, 'garbage', '[]', 15),
	(305, 'reporter', '[]', 15),
	(306, 'taxi', '[]', 15),
	(307, 'bus', '[]', 15),
	(308, 'cardealer', '[]', 15),
	(309, 'oilwell', '[]', 15),
	(310, 'vapeshop', '[]', 15),
	(311, 'lawyer', '[]', 15),
	(312, 'koi', '[]', 15),
	(313, 'judge', '[]', 15),
	(314, 'tow', '[]', 15),
	(315, 'hotdog', '[]', 15),
	(316, 'airport', '[]', 15),
	(317, 'auction', '[]', 15),
	(318, 'trucker', '[]', 15),
	(319, 'koi', '[]', 15),
	(320, 'oilwell', '[]', 15),
	(321, 'uwu', '[]', 15),
	(322, 'cardealer', '[]', 15),
	(323, 'vapeshop', '[]', 15),
	(324, 'ambulance', '[]', 15),
	(325, 'reporter', '[]', 15),
	(326, 'cigar', '[]', 15),
	(327, 'tow', '[]', 15),
	(328, 'auction', '[]', 15),
	(329, 'beanmachine', '[]', 15),
	(330, 'realestate', '[]', 15),
	(331, 'judge', '[]', 15),
	(332, 'burgershot', '[]', 15),
	(333, 'mechanic', '[]', 15),
	(334, 'garbage', '[]', 15),
	(335, 'vineyard', '[]', 15),
	(336, 'hotdog', '[]', 15),
	(337, 'police', '{"FZN65584":{"cid":"FZN65584","grade":2,"name":"ad s"},"LYY96314":{"cid":"LYY96314","grade":2,"name":"asaa sa"},"DML97005":{"cid":"DML97005","grade":2,"name":"Nmsh Alnmsh"}}', 15),
	(338, 'bus', '[]', 15),
	(339, 'lawyer', '[]', 15),
	(340, 'limeys', '[]', 15),
	(341, 'airport', '[]', 15),
	(342, 'taxi', '[]', 15),
	(343, 'burgershot', '[]', 15),
	(344, 'koi', '[]', 15),
	(345, 'reporter', '[]', 15),
	(346, 'mechanic', '[]', 15),
	(347, 'ambulance', '[]', 15),
	(348, 'auction', '[]', 15),
	(349, 'limeys', '[]', 15),
	(350, 'realestate', '[]', 15),
	(351, 'vineyard', '[]', 15),
	(352, 'taxi', '[]', 15),
	(353, 'garbage', '[]', 15),
	(354, 'vapeshop', '[]', 15),
	(355, 'airport', '[]', 15),
	(356, 'cigar', '[]', 15),
	(357, 'cardealer', '[]', 15),
	(358, 'judge', '[]', 15),
	(359, 'police', '{"DML97005":{"grade":2,"name":"Nmsh Alnmsh","cid":"DML97005"},"FZN65584":{"grade":2,"name":"ad s","cid":"FZN65584"},"LYY96314":{"grade":2,"name":"asaa sa","cid":"LYY96314"}}', 15),
	(360, 'lawyer', '[]', 15),
	(361, 'uwu', '[]', 15),
	(362, 'tow', '[]', 15),
	(363, 'oilwell', '[]', 15),
	(364, 'beanmachine', '[]', 15),
	(365, 'bus', '[]', 15),
	(366, 'trucker', '[]', 15),
	(367, 'hotdog', '[]', 15),
	(368, 'cigar', '[]', 15),
	(369, 'tow', '[]', 15),
	(370, 'auction', '[]', 15),
	(371, 'judge', '[]', 15),
	(372, 'burgershot', '[]', 15),
	(373, 'taxi', '[]', 15),
	(374, 'garbage', '[]', 15),
	(375, 'mechanic', '[]', 15),
	(376, 'koi', '[]', 15),
	(377, 'trucker', '[]', 15),
	(378, 'vineyard', '[]', 15),
	(379, 'cardealer', '[]', 15),
	(380, 'beanmachine', '[]', 15),
	(381, 'reporter', '[]', 15),
	(382, 'bus', '[]', 15),
	(383, 'oilwell', '[]', 15),
	(384, 'ambulance', '[]', 15),
	(385, 'vapeshop', '[]', 15),
	(386, 'realestate', '[]', 15),
	(387, 'lawyer', '[]', 15),
	(388, 'limeys', '[]', 15),
	(389, 'airport', '[]', 15),
	(390, 'police', '{"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2},"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2},"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2}}', 15),
	(391, 'uwu', '[]', 15),
	(392, 'hotdog', '[]', 15),
	(393, 'reporter', '[]', 15),
	(394, 'oilwell', '[]', 15),
	(395, 'tow', '[]', 15),
	(396, 'judge', '[]', 15),
	(397, 'limeys', '[]', 15),
	(398, 'beanmachine', '[]', 15),
	(399, 'airport', '[]', 15),
	(400, 'vineyard', '[]', 15),
	(401, 'garbage', '[]', 15),
	(402, 'taxi', '[]', 15),
	(403, 'ambulance', '[]', 15),
	(404, 'police', '{"LYY96314":{"cid":"LYY96314","grade":2,"name":"asaa sa"},"FZN65584":{"cid":"FZN65584","grade":2,"name":"ad s"},"DML97005":{"cid":"DML97005","grade":2,"name":"Nmsh Alnmsh"}}', 15),
	(405, 'koi', '[]', 15),
	(406, 'uwu', '[]', 15),
	(407, 'lawyer', '[]', 15),
	(408, 'burgershot', '[]', 15),
	(409, 'vapeshop', '[]', 15),
	(410, 'cardealer', '[]', 15),
	(411, 'bus', '[]', 15),
	(412, 'cigar', '[]', 15),
	(413, 'hotdog', '[]', 15),
	(414, 'trucker', '[]', 15),
	(415, 'mechanic', '[]', 15),
	(416, 'realestate', '[]', 15),
	(417, 'auction', '[]', 15),
	(418, 'reporter', '[]', 15),
	(419, 'trucker', '[]', 15),
	(420, 'vineyard', '[]', 15),
	(421, 'hotdog', '[]', 15),
	(422, 'cardealer', '[]', 15),
	(423, 'judge', '[]', 15),
	(424, 'garbage', '[]', 15),
	(425, 'taxi', '[]', 15),
	(426, 'police', '{"FZN65584":{"grade":2,"name":"ad s","cid":"FZN65584"},"DML97005":{"grade":2,"name":"Nmsh Alnmsh","cid":"DML97005"},"LYY96314":{"grade":2,"name":"asaa sa","cid":"LYY96314"}}', 15),
	(427, 'airport', '[]', 15),
	(428, 'oilwell', '[]', 15),
	(429, 'burgershot', '[]', 15),
	(430, 'mechanic', '[]', 15),
	(431, 'uwu', '[]', 15),
	(432, 'ambulance', '[]', 15),
	(433, 'bus', '[]', 15),
	(434, 'limeys', '[]', 15),
	(435, 'tow', '[]', 15),
	(436, 'realestate', '[]', 15),
	(437, 'lawyer', '[]', 15),
	(438, 'cigar', '[]', 15),
	(439, 'beanmachine', '[]', 15),
	(440, 'auction', '[]', 15),
	(441, 'koi', '[]', 15),
	(442, 'vapeshop', '[]', 15),
	(443, 'bus', '[]', 15),
	(444, 'hotdog', '[]', 15),
	(445, 'garbage', '[]', 15),
	(446, 'ambulance', '[]', 15),
	(447, 'realestate', '[]', 15),
	(448, 'auction', '[]', 15),
	(449, 'tow', '[]', 15),
	(450, 'judge', '[]', 15),
	(451, 'limeys', '[]', 15),
	(452, 'beanmachine', '[]', 15),
	(453, 'burgershot', '[]', 15),
	(454, 'oilwell', '[]', 15),
	(455, 'cigar', '[]', 15),
	(456, 'trucker', '[]', 15),
	(457, 'reporter', '[]', 15),
	(458, 'lawyer', '[]', 15),
	(459, 'koi', '[]', 15),
	(460, 'cardealer', '[]', 15),
	(461, 'taxi', '[]', 15),
	(462, 'airport', '[]', 15),
	(463, 'vineyard', '[]', 15),
	(464, 'uwu', '[]', 15),
	(465, 'vapeshop', '[]', 15),
	(466, 'police', '{"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2}}', 15),
	(467, 'mechanic', '[]', 15),
	(468, 'auction', '[]', 15),
	(469, 'reporter', '[]', 15),
	(470, 'garbage', '[]', 15),
	(471, 'mechanic', '[]', 15),
	(472, 'uwu', '[]', 15),
	(473, 'burgershot', '[]', 15),
	(474, 'bus', '[]', 15),
	(475, 'police', '{"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2}}', 15),
	(476, 'taxi', '[]', 15),
	(477, 'vineyard', '[]', 15),
	(478, 'cardealer', '[]', 15),
	(479, 'beanmachine', '[]', 15),
	(480, 'trucker', '[]', 15),
	(481, 'ambulance', '[]', 15),
	(482, 'limeys', '[]', 15),
	(483, 'vapeshop', '[]', 15),
	(484, 'realestate', '[]', 15),
	(485, 'lawyer', '[]', 15),
	(486, 'airport', '[]', 15),
	(487, 'oilwell', '[]', 15),
	(488, 'judge', '[]', 15),
	(489, 'cigar', '[]', 15),
	(490, 'tow', '[]', 15),
	(491, 'hotdog', '[]', 15),
	(492, 'koi', '[]', 15),
	(493, 'garbage', '[]', 15),
	(494, 'lawyer', '[]', 15),
	(495, 'taxi', '[]', 15),
	(496, 'trucker', '[]', 15),
	(497, 'oilwell', '[]', 15),
	(498, 'vapeshop', '[]', 15),
	(499, 'beanmachine', '[]', 15),
	(500, 'realestate', '[]', 15),
	(501, 'police', '{"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2},"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2},"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2}}', 15),
	(502, 'auction', '[]', 15),
	(503, 'hotdog', '[]', 15),
	(504, 'uwu', '[]', 15),
	(505, 'tow', '[]', 15),
	(506, 'ambulance', '[]', 15),
	(507, 'burgershot', '[]', 15),
	(508, 'koi', '[]', 15),
	(509, 'airport', '[]', 15),
	(510, 'reporter', '[]', 15),
	(511, 'limeys', '[]', 15),
	(512, 'cigar', '[]', 15),
	(513, 'vineyard', '[]', 15),
	(514, 'bus', '[]', 15),
	(515, 'mechanic', '[]', 15),
	(516, 'judge', '[]', 15),
	(517, 'cardealer', '[]', 15),
	(518, 'ambulance', '[]', 15),
	(519, 'limeys', '[]', 15),
	(520, 'judge', '[]', 15),
	(521, 'uwu', '[]', 15),
	(522, 'burgershot', '[]', 15),
	(523, 'garbage', '[]', 15),
	(524, 'oilwell', '[]', 15),
	(525, 'lawyer', '[]', 15),
	(526, 'auction', '[]', 15),
	(527, 'airport', '[]', 15),
	(528, 'vineyard', '[]', 15),
	(529, 'koi', '[]', 15),
	(530, 'mechanic', '[]', 15),
	(531, 'tow', '[]', 15),
	(532, 'cardealer', '[]', 15),
	(533, 'realestate', '[]', 15),
	(534, 'hotdog', '[]', 15),
	(535, 'police', '{"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2},"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2},"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2}}', 15),
	(536, 'bus', '[]', 15),
	(537, 'beanmachine', '[]', 15),
	(538, 'taxi', '[]', 15),
	(539, 'cigar', '[]', 15),
	(540, 'reporter', '[]', 15),
	(541, 'trucker', '[]', 15),
	(542, 'vapeshop', '[]', 15),
	(543, 'mechanic', '[]', 15),
	(544, 'uwu', '[]', 15),
	(545, 'vineyard', '[]', 15),
	(546, 'reporter', '[]', 15),
	(547, 'garbage', '[]', 15),
	(548, 'realestate', '[]', 15),
	(549, 'burgershot', '[]', 15),
	(550, 'vapeshop', '[]', 15),
	(551, 'cigar', '[]', 15),
	(552, 'hotdog', '[]', 15),
	(553, 'trucker', '[]', 15),
	(554, 'cardealer', '[]', 15),
	(555, 'ambulance', '[]', 15),
	(556, 'auction', '[]', 15),
	(557, 'taxi', '[]', 15),
	(558, 'tow', '[]', 15),
	(559, 'lawyer', '[]', 15),
	(560, 'police', '{"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2}}', 15),
	(561, 'judge', '[]', 15),
	(562, 'oilwell', '[]', 15),
	(563, 'beanmachine', '[]', 15),
	(564, 'bus', '[]', 15),
	(565, 'airport', '[]', 15),
	(566, 'koi', '[]', 15),
	(567, 'limeys', '[]', 15),
	(568, 'realestate', '[]', 15),
	(569, 'police', '{"DML97005":{"grade":2,"cid":"DML97005","name":"Nmsh Alnmsh"},"LYY96314":{"grade":2,"cid":"LYY96314","name":"asaa sa"},"FZN65584":{"grade":2,"cid":"FZN65584","name":"ad s"}}', 15),
	(570, 'uwu', '[]', 15),
	(571, 'taxi', '[]', 15),
	(572, 'beanmachine', '[]', 15),
	(573, 'trucker', '[]', 15),
	(574, 'limeys', '[]', 15),
	(575, 'burgershot', '[]', 15),
	(576, 'ambulance', '[]', 15),
	(577, 'airport', '[]', 15),
	(578, 'judge', '[]', 15),
	(579, 'bus', '[]', 15),
	(580, 'tow', '[]', 15),
	(581, 'vapeshop', '[]', 15),
	(582, 'mechanic', '[]', 15),
	(583, 'reporter', '[]', 15),
	(584, 'vineyard', '[]', 15),
	(585, 'cardealer', '[]', 15),
	(586, 'cigar', '[]', 15),
	(587, 'auction', '[]', 15),
	(588, 'oilwell', '[]', 15),
	(589, 'garbage', '[]', 15),
	(590, 'hotdog', '[]', 15),
	(591, 'koi', '[]', 15),
	(592, 'lawyer', '[]', 15),
	(593, 'garbage', '[]', 15),
	(594, 'trucker', '[]', 15),
	(595, 'burgershot', '[]', 15),
	(596, 'beanmachine', '[]', 15),
	(597, 'tow', '[]', 15),
	(598, 'judge', '[]', 15),
	(599, 'cardealer', '[]', 15),
	(600, 'oilwell', '[]', 15),
	(601, 'lawyer', '[]', 15),
	(602, 'reporter', '[]', 15),
	(603, 'auction', '[]', 15),
	(604, 'vineyard', '[]', 15),
	(605, 'cigar', '[]', 15),
	(606, 'airport', '[]', 15),
	(607, 'koi', '[]', 15),
	(608, 'realestate', '[]', 15),
	(609, 'police', '{"LYY96314":{"grade":2,"cid":"LYY96314","name":"asaa sa"},"DML97005":{"grade":2,"cid":"DML97005","name":"Nmsh Alnmsh"},"FZN65584":{"grade":2,"cid":"FZN65584","name":"ad s"}}', 15),
	(610, 'vapeshop', '[]', 15),
	(611, 'limeys', '[]', 15),
	(612, 'bus', '[]', 15),
	(613, 'taxi', '[]', 15),
	(614, 'hotdog', '[]', 15),
	(615, 'mechanic', '[]', 15),
	(616, 'ambulance', '[]', 15),
	(617, 'uwu', '[]', 15),
	(618, 'vapeshop', '[]', 15),
	(619, 'limeys', '[]', 15),
	(620, 'vineyard', '[]', 15),
	(621, 'beanmachine', '[]', 15),
	(622, 'tow', '[]', 15),
	(623, 'hotdog', '[]', 15),
	(624, 'realestate', '[]', 15),
	(625, 'taxi', '[]', 15),
	(626, 'cigar', '[]', 15),
	(627, 'ambulance', '[]', 15),
	(628, 'cardealer', '[]', 15),
	(629, 'koi', '[]', 15),
	(630, 'police', '{"DML97005":{"name":"Nmsh Alnmsh","grade":2,"cid":"DML97005"},"FZN65584":{"name":"ad s","grade":2,"cid":"FZN65584"},"LYY96314":{"name":"asaa sa","grade":2,"cid":"LYY96314"}}', 15),
	(631, 'trucker', '[]', 15),
	(632, 'burgershot', '[]', 15),
	(633, 'uwu', '[]', 15),
	(634, 'mechanic', '[]', 15),
	(635, 'bus', '[]', 15),
	(636, 'garbage', '[]', 15),
	(637, 'auction', '[]', 15),
	(638, 'judge', '[]', 15),
	(639, 'oilwell', '[]', 15),
	(640, 'airport', '[]', 15),
	(641, 'reporter', '[]', 15),
	(642, 'lawyer', '[]', 15),
	(643, 'mechanic', '[]', 15),
	(644, 'taxi', '[]', 15),
	(645, 'realestate', '[]', 15),
	(646, 'koi', '[]', 15),
	(647, 'airport', '[]', 15),
	(648, 'vapeshop', '[]', 15),
	(649, 'cigar', '[]', 15),
	(650, 'cardealer', '[]', 15),
	(651, 'trucker', '[]', 15),
	(652, 'uwu', '[]', 15),
	(653, 'tow', '[]', 15),
	(654, 'judge', '[]', 15),
	(655, 'vineyard', '[]', 15),
	(656, 'beanmachine', '[]', 15),
	(657, 'oilwell', '[]', 15),
	(658, 'police', '{"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2}}', 15),
	(659, 'burgershot', '[]', 15),
	(660, 'lawyer', '[]', 15),
	(661, 'reporter', '[]', 15),
	(662, 'auction', '[]', 15),
	(663, 'limeys', '[]', 15),
	(664, 'bus', '[]', 15),
	(665, 'garbage', '[]', 15),
	(666, 'ambulance', '[]', 15),
	(667, 'hotdog', '[]', 15),
	(668, 'vapeshop', '[]', 15),
	(669, 'bus', '[]', 15),
	(670, 'trucker', '[]', 15),
	(671, 'garbage', '[]', 15),
	(672, 'uwu', '[]', 15),
	(673, 'burgershot', '[]', 15),
	(674, 'lawyer', '[]', 15),
	(675, 'cigar', '[]', 15),
	(676, 'airport', '[]', 15),
	(677, 'koi', '[]', 15),
	(678, 'vineyard', '[]', 15),
	(679, 'ambulance', '[]', 15),
	(680, 'realestate', '[]', 15),
	(681, 'taxi', '[]', 15),
	(682, 'limeys', '[]', 15),
	(683, 'hotdog', '[]', 15),
	(684, 'cardealer', '[]', 15),
	(685, 'mechanic', '[]', 15),
	(686, 'reporter', '[]', 15),
	(687, 'tow', '[]', 15),
	(688, 'auction', '[]', 15),
	(689, 'police', '{"LYY96314":{"name":"asaa sa","grade":2,"cid":"LYY96314"},"FZN65584":{"name":"ad s","grade":2,"cid":"FZN65584"},"DML97005":{"name":"Nmsh Alnmsh","grade":2,"cid":"DML97005"}}', 15),
	(690, 'beanmachine', '[]', 15),
	(691, 'judge', '[]', 15),
	(692, 'oilwell', '[]', 15),
	(693, 'ambulance', '[]', 15),
	(694, 'reporter', '[]', 15),
	(695, 'lawyer', '[]', 15),
	(696, 'beanmachine', '[]', 15),
	(697, 'realestate', '[]', 15),
	(698, 'oilwell', '[]', 15),
	(699, 'trucker', '[]', 15),
	(700, 'uwu', '[]', 15),
	(701, 'burgershot', '[]', 15),
	(702, 'bus', '[]', 15),
	(703, 'koi', '[]', 15),
	(704, 'limeys', '[]', 15),
	(705, 'airport', '[]', 15),
	(706, 'police', '{"LYY96314":{"cid":"LYY96314","grade":2,"name":"asaa sa"},"FZN65584":{"cid":"FZN65584","grade":2,"name":"ad s"},"DML97005":{"cid":"DML97005","grade":2,"name":"Nmsh Alnmsh"}}', 15),
	(707, 'cigar', '[]', 15),
	(708, 'auction', '[]', 15),
	(709, 'mechanic', '[]', 15),
	(710, 'vapeshop', '[]', 15),
	(711, 'taxi', '[]', 15),
	(712, 'tow', '[]', 15),
	(713, 'vineyard', '[]', 15),
	(714, 'garbage', '[]', 15),
	(715, 'hotdog', '[]', 15),
	(716, 'judge', '[]', 15),
	(717, 'cardealer', '[]', 15),
	(718, 'auction', '[]', 15),
	(719, 'ambulance', '[]', 15),
	(720, 'lawyer', '[]', 15),
	(721, 'vapeshop', '[]', 15),
	(722, 'mechanic', '[]', 15),
	(723, 'bus', '[]', 15),
	(724, 'cardealer', '[]', 15),
	(725, 'reporter', '[]', 15),
	(726, 'koi', '[]', 15),
	(727, 'airport', '[]', 15),
	(728, 'tow', '[]', 15),
	(729, 'burgershot', '[]', 15),
	(730, 'oilwell', '[]', 15),
	(731, 'limeys', '[]', 15),
	(732, 'judge', '[]', 15),
	(733, 'beanmachine', '[]', 15),
	(734, 'hotdog', '[]', 15),
	(735, 'uwu', '[]', 15),
	(736, 'garbage', '[]', 15),
	(737, 'vineyard', '[]', 15),
	(738, 'trucker', '[]', 15),
	(739, 'taxi', '[]', 15),
	(740, 'cigar', '[]', 15),
	(741, 'police', '{"LYY96314":{"grade":2,"cid":"LYY96314","name":"asaa sa"},"FZN65584":{"grade":2,"cid":"FZN65584","name":"ad s"},"DML97005":{"grade":2,"cid":"DML97005","name":"Nmsh Alnmsh"},"HCR81520":{"grade":4,"cid":"HCR81520","name":"مشاري القوت"}}', 15),
	(742, 'realestate', '[]', 15),
	(743, 'vapeshop', '[]', 15),
	(744, 'cigar', '[]', 15),
	(745, 'cardealer', '[]', 15),
	(746, 'burgershot', '[]', 15),
	(747, 'bus', '[]', 15),
	(748, 'mechanic', '[]', 15),
	(749, 'judge', '[]', 15),
	(750, 'vineyard', '[]', 15),
	(751, 'airport', '[]', 15),
	(752, 'garbage', '[]', 15),
	(753, 'reporter', '[]', 15),
	(754, 'auction', '[]', 15),
	(755, 'hotdog', '[]', 15),
	(756, 'trucker', '[]', 15),
	(757, 'taxi', '[]', 15),
	(758, 'oilwell', '[]', 15),
	(759, 'ambulance', '[]', 15),
	(760, 'limeys', '[]', 15),
	(761, 'tow', '[]', 15),
	(762, 'beanmachine', '[]', 15),
	(763, 'koi', '[]', 15),
	(764, 'uwu', '[]', 15),
	(765, 'lawyer', '[]', 15),
	(766, 'police', '{"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2},"AIB23982":{"cid":"AIB23982","name":"شسي سيشسش","grade":3},"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2},"HCR81520":{"cid":"HCR81520","name":"مشاري القوت","grade":4},"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2}}', 15),
	(767, 'realestate', '[]', 15),
	(768, 'trucker', '[]', 15),
	(769, 'bus', '[]', 15),
	(770, 'cardealer', '[]', 15),
	(771, 'vineyard', '[]', 15),
	(772, 'beanmachine', '[]', 15),
	(773, 'lawyer', '[]', 15),
	(774, 'garbage', '[]', 15),
	(775, 'uwu', '[]', 15),
	(776, 'police', '{"AIB23982":{"grade":3,"name":"شسي سيشسش","cid":"AIB23982"},"HCR81520":{"grade":4,"name":"مشاري القوت","cid":"HCR81520"},"FZN65584":{"grade":2,"name":"ad s","cid":"FZN65584"},"LYY96314":{"grade":2,"name":"asaa sa","cid":"LYY96314"},"DML97005":{"grade":2,"name":"Nmsh Alnmsh","cid":"DML97005"}}', 15),
	(777, 'koi', '[]', 15),
	(778, 'limeys', '[]', 15),
	(779, 'hotdog', '[]', 15),
	(780, 'reporter', '[]', 15),
	(781, 'ambulance', '[]', 15),
	(782, 'mechanic', '[]', 15),
	(783, 'airport', '[]', 15),
	(784, 'burgershot', '[]', 15),
	(785, 'taxi', '[]', 15),
	(786, 'cigar', '[]', 15),
	(787, 'realestate', '[]', 15),
	(788, 'oilwell', '[]', 15),
	(789, 'vapeshop', '[]', 15),
	(790, 'judge', '[]', 15),
	(791, 'tow', '[]', 15),
	(792, 'auction', '[]', 15),
	(793, 'cigar', '[]', 15),
	(794, 'trucker', '[]', 15),
	(795, 'police', '{"HCR81520":{"name":"مشاري القوت","grade":4,"cid":"HCR81520"},"DML97005":{"name":"Nmsh Alnmsh","grade":2,"cid":"DML97005"},"LYY96314":{"name":"asaa sa","grade":2,"cid":"LYY96314"},"FZN65584":{"name":"ad s","grade":2,"cid":"FZN65584"},"AIB23982":{"name":"شسي سيشسش","grade":3,"cid":"AIB23982"}}', 15),
	(796, 'burgershot', '[]', 15),
	(797, 'uwu', '[]', 15),
	(798, 'reporter', '[]', 15),
	(799, 'realestate', '[]', 15),
	(800, 'limeys', '[]', 15),
	(801, 'oilwell', '[]', 15),
	(802, 'airport', '[]', 15),
	(803, 'taxi', '[]', 15),
	(804, 'koi', '[]', 15),
	(805, 'beanmachine', '[]', 15),
	(806, 'judge', '[]', 15),
	(807, 'hotdog', '[]', 15),
	(808, 'ambulance', '[]', 15),
	(809, 'lawyer', '[]', 15),
	(810, 'mechanic', '[]', 15),
	(811, 'auction', '[]', 15),
	(812, 'bus', '[]', 15),
	(813, 'garbage', '[]', 15),
	(814, 'vineyard', '[]', 15),
	(815, 'cardealer', '[]', 15),
	(816, 'tow', '[]', 15),
	(817, 'vapeshop', '[]', 15),
	(818, 'cigar', '[]', 15),
	(819, 'vineyard', '[]', 15),
	(820, 'lawyer', '[]', 15),
	(821, 'bus', '[]', 15),
	(822, 'hotdog', '[]', 15),
	(823, 'mechanic', '[]', 15),
	(824, 'tow', '[]', 15),
	(825, 'garbage', '[]', 15),
	(826, 'reporter', '[]', 15),
	(827, 'beanmachine', '[]', 15),
	(828, 'judge', '[]', 15),
	(829, 'koi', '[]', 15),
	(830, 'oilwell', '[]', 15),
	(831, 'airport', '[]', 15),
	(832, 'trucker', '[]', 15),
	(833, 'auction', '[]', 15),
	(834, 'taxi', '[]', 15),
	(835, 'ambulance', '[]', 15),
	(836, 'vapeshop', '[]', 15),
	(837, 'police', '{"FZN65584":{"name":"ad s","grade":2,"cid":"FZN65584"},"AIB23982":{"name":"شسي سيشسش","grade":3,"cid":"AIB23982"},"LYY96314":{"name":"asaa sa","grade":2,"cid":"LYY96314"},"DML97005":{"name":"Nmsh Alnmsh","grade":2,"cid":"DML97005"},"HCR81520":{"name":"مشاري القوت","grade":4,"cid":"HCR81520"}}', 15),
	(838, 'realestate', '[]', 15),
	(839, 'limeys', '[]', 15),
	(840, 'uwu', '[]', 15),
	(841, 'burgershot', '[]', 15),
	(842, 'cardealer', '[]', 15),
	(843, 'cigar', '[]', 15),
	(844, 'vineyard', '[]', 15),
	(845, 'tow', '[]', 15),
	(846, 'taxi', '[]', 15),
	(847, 'limeys', '[]', 15),
	(848, 'uwu', '[]', 15),
	(849, 'beanmachine', '[]', 15),
	(850, 'cardealer', '[]', 15),
	(851, 'airport', '[]', 15),
	(852, 'koi', '[]', 15),
	(853, 'oilwell', '[]', 15),
	(854, 'judge', '[]', 15),
	(855, 'mechanic', '[]', 15),
	(856, 'bus', '[]', 15),
	(857, 'ambulance', '[]', 15),
	(858, 'vapeshop', '[]', 15),
	(859, 'reporter', '[]', 15),
	(860, 'burgershot', '[]', 15),
	(861, 'auction', '[]', 15),
	(862, 'realestate', '[]', 15),
	(863, 'garbage', '[]', 15),
	(864, 'hotdog', '[]', 15),
	(865, 'trucker', '[]', 15),
	(866, 'police', '{"HCR81520":{"grade":4,"name":"مشاري القوت","cid":"HCR81520"},"LYY96314":{"grade":2,"name":"asaa sa","cid":"LYY96314"},"AIB23982":{"grade":3,"name":"شسي سيشسش","cid":"AIB23982"},"DML97005":{"grade":2,"name":"Nmsh Alnmsh","cid":"DML97005"},"FZN65584":{"grade":2,"name":"ad s","cid":"FZN65584"}}', 15),
	(867, 'lawyer', '[]', 15),
	(868, 'police', '{"AIB23982":{"grade":3,"cid":"AIB23982","name":"شسي سيشسش"},"HCR81520":{"grade":4,"cid":"HCR81520","name":"مشاري القوت"},"FZN65584":{"grade":2,"cid":"FZN65584","name":"ad s"},"LYY96314":{"grade":2,"cid":"LYY96314","name":"asaa sa"},"DML97005":{"grade":2,"cid":"DML97005","name":"Nmsh Alnmsh"}}', 15),
	(869, 'limeys', '[]', 15),
	(870, 'vapeshop', '[]', 15),
	(871, 'beanmachine', '[]', 15),
	(872, 'trucker', '[]', 15),
	(873, 'uwu', '[]', 15),
	(874, 'lawyer', '[]', 15),
	(875, 'realestate', '[]', 15),
	(876, 'burgershot', '[]', 15),
	(877, 'judge', '[]', 15),
	(878, 'vineyard', '[]', 15),
	(879, 'auction', '[]', 15),
	(880, 'cigar', '[]', 15),
	(881, 'koi', '[]', 15),
	(882, 'hotdog', '[]', 15),
	(883, 'reporter', '[]', 15),
	(884, 'oilwell', '[]', 15),
	(885, 'taxi', '[]', 15),
	(886, 'cardealer', '[]', 15),
	(887, 'mechanic', '[]', 15),
	(888, 'tow', '[]', 15),
	(889, 'garbage', '[]', 15),
	(890, 'ambulance', '[]', 15),
	(891, 'bus', '[]', 15),
	(892, 'airport', '[]', 15),
	(893, 'oilwell', '[]', 15),
	(894, 'mechanic', '[]', 15),
	(895, 'trucker', '[]', 15),
	(896, 'garbage', '[]', 15),
	(897, 'taxi', '[]', 15),
	(898, 'vineyard', '[]', 15),
	(899, 'airport', '[]', 15),
	(900, 'hotdog', '[]', 15),
	(901, 'reporter', '[]', 15),
	(902, 'koi', '[]', 15),
	(903, 'ambulance', '[]', 15),
	(904, 'cardealer', '[]', 15),
	(905, 'realestate', '[]', 15),
	(906, 'tow', '[]', 15),
	(907, 'burgershot', '[]', 15),
	(908, 'beanmachine', '[]', 15),
	(909, 'limeys', '[]', 15),
	(910, 'auction', '[]', 15),
	(911, 'vapeshop', '[]', 15),
	(912, 'cigar', '[]', 15),
	(913, 'judge', '[]', 15),
	(914, 'bus', '[]', 15),
	(915, 'lawyer', '[]', 15),
	(916, 'uwu', '[]', 15),
	(917, 'police', '{"FZN65584":{"cid":"FZN65584","grade":2,"name":"ad s"},"AIB23982":{"cid":"AIB23982","grade":3,"name":"شسي سيشسش"},"LYY96314":{"cid":"LYY96314","grade":2,"name":"asaa sa"},"DML97005":{"cid":"DML97005","grade":2,"name":"Nmsh Alnmsh"},"HCR81520":{"cid":"HCR81520","grade":4,"name":"مشاري القوت"}}', 15),
	(918, 'bus', '[]', 15),
	(919, 'burgershot', '[]', 15),
	(920, 'taxi', '[]', 15),
	(921, 'reporter', '[]', 15),
	(922, 'vineyard', '[]', 15),
	(923, 'mechanic', '[]', 15),
	(924, 'auction', '[]', 15),
	(925, 'hotdog', '[]', 15),
	(926, 'limeys', '[]', 15),
	(927, 'police', '{"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2},"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2},"HCR81520":{"cid":"HCR81520","name":"مشاري القوت","grade":4},"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2}}', 15),
	(928, 'trucker', '[]', 15),
	(929, 'judge', '[]', 15),
	(930, 'koi', '[]', 15),
	(931, 'oilwell', '[]', 15),
	(932, 'airport', '[]', 15),
	(933, 'vapeshop', '[]', 15),
	(934, 'beanmachine', '[]', 15),
	(935, 'realestate', '[]', 15),
	(936, 'cardealer', '[]', 15),
	(937, 'lawyer', '[]', 15),
	(938, 'cigar', '{"AIB23982":{"cid":"AIB23982","name":"شسي سيشسش","grade":1}}', 15),
	(939, 'uwu', '[]', 15),
	(940, 'ambulance', '[]', 15),
	(941, 'tow', '[]', 15),
	(942, 'garbage', '[]', 15),
	(943, 'taxi', '[]', 15),
	(944, 'tow', '[]', 15),
	(945, 'trucker', '[]', 15),
	(946, 'uwu', '[]', 15),
	(947, 'mechanic', '[]', 15),
	(948, 'koi', '[]', 15),
	(949, 'airport', '[]', 15),
	(950, 'oilwell', '[]', 15),
	(951, 'burgershot', '[]', 15),
	(952, 'hotdog', '[]', 15),
	(953, 'cardealer', '[]', 15),
	(954, 'beanmachine', '[]', 15),
	(955, 'cigar', '{"AIB23982":{"cid":"AIB23982","grade":1,"name":"شسي سيشسش"}}', 15),
	(956, 'ambulance', '[]', 15),
	(957, 'reporter', '[]', 15),
	(958, 'vineyard', '[]', 15),
	(959, 'police', '{"HCR81520":{"cid":"HCR81520","grade":4,"name":"مشاري القوت"},"LYY96314":{"cid":"LYY96314","grade":2,"name":"asaa sa"},"FZN65584":{"cid":"FZN65584","grade":2,"name":"ad s"},"DML97005":{"cid":"DML97005","grade":2,"name":"Nmsh Alnmsh"}}', 15),
	(960, 'garbage', '[]', 15),
	(961, 'limeys', '[]', 15),
	(962, 'judge', '[]', 15),
	(963, 'bus', '[]', 15),
	(964, 'vapeshop', '[]', 15),
	(965, 'auction', '[]', 15),
	(966, 'realestate', '[]', 15),
	(967, 'lawyer', '[]', 15),
	(968, 'vineyard', '[]', 15),
	(969, 'reporter', '[]', 15),
	(970, 'realestate', '[]', 15),
	(971, 'ambulance', '[]', 15),
	(972, 'limeys', '[]', 15),
	(973, 'vapeshop', '[]', 15),
	(974, 'oilwell', '[]', 15),
	(975, 'judge', '[]', 15),
	(976, 'garbage', '[]', 15),
	(977, 'airport', '[]', 15),
	(978, 'tow', '[]', 15),
	(979, 'bus', '[]', 15),
	(980, 'taxi', '[]', 15),
	(981, 'uwu', '[]', 15),
	(982, 'koi', '[]', 15),
	(983, 'lawyer', '[]', 15),
	(984, 'cardealer', '[]', 15),
	(985, 'cigar', '{"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":1}}', 15),
	(986, 'police', '{"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4}}', 15),
	(987, 'mechanic', '[]', 15),
	(988, 'hotdog', '[]', 15),
	(989, 'auction', '[]', 15),
	(990, 'burgershot', '[]', 15),
	(991, 'trucker', '[]', 15),
	(992, 'beanmachine', '[]', 15),
	(993, 'limeys', '[]', 15),
	(994, 'airport', '[]', 15),
	(995, 'vapeshop', '[]', 15),
	(996, 'beanmachine', '[]', 15),
	(997, 'judge', '[]', 15),
	(998, 'hotdog', '{"AIB23982":{"cid":"AIB23982","name":"شسي سيشسش","grade":0}}', 15),
	(999, 'cardealer', '[]', 15),
	(1000, 'reporter', '[]', 15),
	(1001, 'cigar', '[]', 15),
	(1002, 'mechanic', '[]', 15),
	(1003, 'bus', '[]', 15),
	(1004, 'burgershot', '[]', 15),
	(1005, 'vineyard', '[]', 15),
	(1006, 'realestate', '[]', 15),
	(1007, 'taxi', '[]', 15),
	(1008, 'garbage', '[]', 15),
	(1009, 'trucker', '[]', 15),
	(1010, 'lawyer', '[]', 15),
	(1011, 'police', '{"HCR81520":{"cid":"HCR81520","name":"مشاري القوت","grade":4},"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2},"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2},"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2}}', 15),
	(1012, 'auction', '[]', 15),
	(1013, 'oilwell', '[]', 15),
	(1014, 'koi', '[]', 15),
	(1015, 'uwu', '[]', 15),
	(1016, 'tow', '[]', 15),
	(1017, 'ambulance', '[]', 15),
	(1018, 'judge', '[]', 15),
	(1019, 'police', '{"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2},"HCR81520":{"cid":"HCR81520","name":"مشاري القوت","grade":4},"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2},"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2}}', 15),
	(1020, 'taxi', '[]', 15),
	(1021, 'oilwell', '[]', 15),
	(1022, 'vineyard', '[]', 15),
	(1023, 'realestate', '[]', 15),
	(1024, 'garbage', '[]', 15),
	(1025, 'reporter', '[]', 15),
	(1026, 'uwu', '[]', 15),
	(1027, 'bus', '[]', 15),
	(1028, 'lawyer', '[]', 15),
	(1029, 'cigar', '[]', 15),
	(1030, 'trucker', '[]', 15),
	(1031, 'auction', '[]', 15),
	(1032, 'limeys', '[]', 15),
	(1033, 'ambulance', '[]', 15),
	(1034, 'burgershot', '[]', 15),
	(1035, 'hotdog', '{"AIB23982":{"cid":"AIB23982","name":"شسي سيشسش","grade":0}}', 15),
	(1036, 'vapeshop', '[]', 15),
	(1037, 'mechanic', '[]', 15),
	(1038, 'beanmachine', '[]', 15),
	(1039, 'tow', '[]', 15),
	(1040, 'koi', '[]', 15),
	(1041, 'airport', '[]', 15),
	(1042, 'cardealer', '[]', 15),
	(1043, 'lawyer', '[]', 15),
	(1044, 'garbage', '[]', 15),
	(1045, 'cigar', '[]', 15),
	(1046, 'tow', '[]', 15),
	(1047, 'cardealer', '[]', 15),
	(1048, 'trucker', '[]', 15),
	(1049, 'vapeshop', '[]', 15),
	(1050, 'ambulance', '[]', 15),
	(1051, 'oilwell', '[]', 15),
	(1052, 'hotdog', '{"AIB23982":{"cid":"AIB23982","name":"شسي سيشسش","grade":0}}', 15),
	(1053, 'airport', '[]', 15),
	(1054, 'taxi', '[]', 15),
	(1055, 'police', '{"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2},"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2},"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2},"HCR81520":{"cid":"HCR81520","name":"مشاري القوت","grade":4}}', 15),
	(1056, 'reporter', '[]', 15),
	(1057, 'koi', '[]', 15),
	(1058, 'bus', '[]', 15),
	(1059, 'mechanic', '[]', 15),
	(1060, 'auction', '[]', 15),
	(1061, 'vineyard', '[]', 15),
	(1062, 'beanmachine', '[]', 15),
	(1063, 'judge', '[]', 15),
	(1064, 'uwu', '[]', 15),
	(1065, 'limeys', '[]', 15),
	(1066, 'realestate', '[]', 15),
	(1067, 'burgershot', '[]', 15),
	(1068, 'ambulance', '[]', 15),
	(1069, 'auction', '[]', 15),
	(1070, 'tow', '[]', 15),
	(1071, 'lawyer', '[]', 15),
	(1072, 'trucker', '[]', 15),
	(1073, 'hotdog', '[]', 15),
	(1074, 'airport', '[]', 15),
	(1075, 'beanmachine', '[]', 15),
	(1076, 'realestate', '[]', 15),
	(1077, 'cigar', '[]', 15),
	(1078, 'judge', '[]', 15),
	(1079, 'taxi', '[]', 15),
	(1080, 'vapeshop', '[]', 15),
	(1081, 'koi', '[]', 15),
	(1082, 'uwu', '[]', 15),
	(1083, 'reporter', '[]', 15),
	(1084, 'oilwell', '[]', 15),
	(1085, 'police', '{"LYY96314":{"grade":2,"cid":"LYY96314","name":"asaa sa"},"HCR81520":{"grade":4,"cid":"HCR81520","name":"مشاري القوت"},"DML97005":{"grade":2,"cid":"DML97005","name":"Nmsh Alnmsh"},"FZN65584":{"grade":2,"cid":"FZN65584","name":"ad s"},"AIB23982":{"grade":2,"cid":"AIB23982","name":"شسي سيشسش"}}', 15),
	(1086, 'cardealer', '[]', 15),
	(1087, 'limeys', '[]', 15),
	(1088, 'mechanic', '[]', 15),
	(1089, 'burgershot', '[]', 15),
	(1090, 'garbage', '[]', 15),
	(1091, 'vineyard', '[]', 15),
	(1092, 'bus', '[]', 15),
	(1093, 'airport', '[]', 15),
	(1094, 'cigar', '[]', 15),
	(1095, 'judge', '[]', 15),
	(1096, 'realestate', '[]', 15),
	(1097, 'beanmachine', '[]', 15),
	(1098, 'auction', '[]', 15),
	(1099, 'ambulance', '[]', 15),
	(1100, 'cardealer', '[]', 15),
	(1101, 'uwu', '[]', 15),
	(1102, 'burgershot', '[]', 15),
	(1103, 'vineyard', '[]', 15),
	(1104, 'reporter', '[]', 15),
	(1105, 'bus', '[]', 15),
	(1106, 'mechanic', '[]', 15),
	(1107, 'koi', '[]', 15),
	(1108, 'limeys', '[]', 15),
	(1109, 'tow', '[]', 15),
	(1110, 'police', '{"FZN65584":{"name":"ad s","grade":2,"cid":"FZN65584"},"AIB23982":{"name":"شسي سيشسش","grade":2,"cid":"AIB23982"},"DML97005":{"name":"Nmsh Alnmsh","grade":2,"cid":"DML97005"},"LYY96314":{"name":"asaa sa","grade":2,"cid":"LYY96314"},"HCR81520":{"name":"مشاري القوت","grade":4,"cid":"HCR81520"}}', 15),
	(1111, 'lawyer', '[]', 15),
	(1112, 'garbage', '[]', 15),
	(1113, 'hotdog', '[]', 15),
	(1114, 'vapeshop', '[]', 15),
	(1115, 'oilwell', '[]', 15),
	(1116, 'trucker', '[]', 15),
	(1117, 'taxi', '[]', 15),
	(1118, 'hotdog', '[]', 15),
	(1119, 'burgershot', '[]', 15),
	(1120, 'realestate', '[]', 15),
	(1121, 'garbage', '[]', 15),
	(1122, 'reporter', '[]', 15),
	(1123, 'uwu', '[]', 15),
	(1124, 'bus', '[]', 15),
	(1125, 'police', '{"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":2},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4}}', 15),
	(1126, 'cigar', '[]', 15),
	(1127, 'lawyer', '[]', 15),
	(1128, 'limeys', '[]', 15),
	(1129, 'auction', '[]', 15),
	(1130, 'vineyard', '[]', 15),
	(1131, 'beanmachine', '[]', 15),
	(1132, 'ambulance', '[]', 15),
	(1133, 'mechanic', '[]', 15),
	(1134, 'judge', '[]', 15),
	(1135, 'airport', '[]', 15),
	(1136, 'oilwell', '[]', 15),
	(1137, 'tow', '[]', 15),
	(1138, 'cardealer', '[]', 15),
	(1139, 'trucker', '[]', 15),
	(1140, 'vapeshop', '[]', 15),
	(1141, 'taxi', '[]', 15),
	(1142, 'koi', '[]', 15),
	(1143, 'hotdog', '[]', 15),
	(1144, 'ambulance', '[]', 15),
	(1145, 'auction', '[]', 15),
	(1146, 'cigar', '[]', 15),
	(1147, 'tow', '[]', 15),
	(1148, 'burgershot', '[]', 15),
	(1149, 'vineyard', '[]', 15),
	(1150, 'koi', '[]', 15),
	(1151, 'bus', '[]', 15),
	(1152, 'police', '{"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":3},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4},"OGR18462":{"name":"pika alflah","cid":"OGR18462","grade":3},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2}}', 15),
	(1153, 'trucker', '[]', 15),
	(1154, 'limeys', '[]', 15),
	(1155, 'oilwell', '[]', 15),
	(1156, 'uwu', '[]', 15),
	(1157, 'realestate', '[]', 15),
	(1158, 'taxi', '[]', 15),
	(1159, 'vapeshop', '[]', 15),
	(1160, 'cardealer', '[]', 15),
	(1161, 'airport', '[]', 15),
	(1162, 'mechanic', '[]', 15),
	(1163, 'judge', '[]', 15),
	(1164, 'lawyer', '[]', 15),
	(1165, 'reporter', '[]', 15),
	(1166, 'garbage', '[]', 15),
	(1167, 'beanmachine', '[]', 15),
	(1168, 'reporter', '[]', 15),
	(1169, 'vapeshop', '[]', 15),
	(1170, 'tow', '[]', 15),
	(1171, 'taxi', '[]', 15),
	(1172, 'ambulance', '[]', 15),
	(1173, 'lawyer', '[]', 15),
	(1174, 'mechanic', '[]', 15),
	(1175, 'limeys', '[]', 15),
	(1176, 'burgershot', '[]', 15),
	(1177, 'cardealer', '[]', 15),
	(1178, 'koi', '[]', 15),
	(1179, 'oilwell', '[]', 15),
	(1180, 'airport', '[]', 15),
	(1181, 'beanmachine', '[]', 15),
	(1182, 'judge', '[]', 15),
	(1183, 'garbage', '[]', 15),
	(1184, 'auction', '[]', 15),
	(1185, 'uwu', '[]', 15),
	(1186, 'realestate', '[]', 15),
	(1187, 'vineyard', '[]', 15),
	(1188, 'bus', '[]', 15),
	(1189, 'police', '{"AIB23982":{"cid":"AIB23982","grade":3,"name":"شسي سيشسش"},"FZN65584":{"cid":"FZN65584","grade":2,"name":"ad s"},"HCR81520":{"cid":"HCR81520","grade":4,"name":"مشاري القوت"},"OGR18462":{"cid":"OGR18462","grade":3,"name":"pika alflah"},"LYY96314":{"cid":"LYY96314","grade":2,"name":"asaa sa"},"DML97005":{"cid":"DML97005","grade":2,"name":"Nmsh Alnmsh"}}', 15),
	(1190, 'cigar', '[]', 15),
	(1191, 'trucker', '[]', 15),
	(1192, 'hotdog', '[]', 15),
	(1193, 'tow', '[]', 15),
	(1194, 'koi', '[]', 15),
	(1195, 'trucker', '[]', 15),
	(1196, 'burgershot', '[]', 15),
	(1197, 'airport', '[]', 15),
	(1198, 'realestate', '[]', 15),
	(1199, 'ambulance', '[]', 15),
	(1200, 'garbage', '[]', 15),
	(1201, 'taxi', '[]', 15),
	(1202, 'uwu', '[]', 15),
	(1203, 'limeys', '[]', 15),
	(1204, 'police', '{"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2},"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2},"HCR81520":{"cid":"HCR81520","name":"مشاري القوت","grade":4},"AIB23982":{"cid":"AIB23982","name":"شسي سيشسش","grade":2},"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2},"OGR18462":{"cid":"OGR18462","name":"pika alflah","grade":3}}', 15),
	(1205, 'judge', '[]', 15),
	(1206, 'lawyer', '[]', 15),
	(1207, 'oilwell', '[]', 15),
	(1208, 'cigar', '[]', 15),
	(1209, 'mechanic', '[]', 15),
	(1210, 'auction', '[]', 15),
	(1211, 'vineyard', '[]', 15),
	(1212, 'bus', '[]', 15),
	(1213, 'beanmachine', '[]', 15),
	(1214, 'reporter', '[]', 15),
	(1215, 'hotdog', '[]', 15),
	(1216, 'vapeshop', '[]', 15),
	(1217, 'cardealer', '[]', 15),
	(1218, 'burgershot', '[]', 15),
	(1219, 'cigar', '[]', 15),
	(1220, 'vineyard', '[]', 15),
	(1221, 'realestate', '[]', 15),
	(1222, 'mechanic', '[]', 15),
	(1223, 'tow', '[]', 15),
	(1224, 'taxi', '[]', 15),
	(1225, 'garbage', '[]', 15),
	(1226, 'auction', '[]', 15),
	(1227, 'judge', '[]', 15),
	(1228, 'koi', '[]', 15),
	(1229, 'vapeshop', '{"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":1}}', 15),
	(1230, 'bus', '[]', 15),
	(1231, 'oilwell', '[]', 15),
	(1232, 'cardealer', '[]', 15),
	(1233, 'reporter', '[]', 15),
	(1234, 'trucker', '[]', 15),
	(1235, 'police', '{"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"OGR18462":{"name":"pika alflah","cid":"OGR18462","grade":3}}', 15),
	(1236, 'airport', '[]', 15),
	(1237, 'uwu', '[]', 15),
	(1238, 'ambulance', '[]', 15),
	(1239, 'hotdog', '[]', 15),
	(1240, 'limeys', '[]', 15),
	(1241, 'beanmachine', '[]', 15),
	(1242, 'lawyer', '[]', 15),
	(1243, 'beanmachine', '[]', 15),
	(1244, 'limeys', '[]', 15),
	(1245, 'tow', '[]', 15),
	(1246, 'ambulance', '[]', 15),
	(1247, 'auction', '[]', 15),
	(1248, 'realestate', '[]', 15),
	(1249, 'taxi', '[]', 15),
	(1250, 'koi', '[]', 15),
	(1251, 'trucker', '[]', 15),
	(1252, 'bus', '[]', 15),
	(1253, 'airport', '[]', 15),
	(1254, 'hotdog', '[]', 15),
	(1255, 'uwu', '[]', 15),
	(1256, 'lawyer', '[]', 15),
	(1257, 'vapeshop', '{"AIB23982":{"cid":"AIB23982","grade":1,"name":"شسي سيشسش"}}', 15),
	(1258, 'oilwell', '[]', 15),
	(1259, 'burgershot', '[]', 15),
	(1260, 'cigar', '[]', 15),
	(1261, 'vineyard', '[]', 15),
	(1262, 'mechanic', '[]', 15),
	(1263, 'cardealer', '[]', 15),
	(1264, 'police', '{"LYY96314":{"cid":"LYY96314","grade":2,"name":"asaa sa"},"HCR81520":{"cid":"HCR81520","grade":4,"name":"مشاري القوت"},"FZN65584":{"cid":"FZN65584","grade":2,"name":"ad s"},"DML97005":{"cid":"DML97005","grade":2,"name":"Nmsh Alnmsh"},"OGR18462":{"cid":"OGR18462","grade":3,"name":"pika alflah"}}', 15),
	(1265, 'judge', '[]', 15),
	(1266, 'reporter', '[]', 15),
	(1267, 'garbage', '[]', 15),
	(1268, 'airport', '[]', 15),
	(1269, 'trucker', '[]', 15),
	(1270, 'cardealer', '[]', 15),
	(1271, 'burgershot', '[]', 15),
	(1272, 'reporter', '[]', 15),
	(1273, 'cigar', '[]', 15),
	(1274, 'beanmachine', '[]', 15),
	(1275, 'taxi', '[]', 15),
	(1276, 'oilwell', '[]', 15),
	(1277, 'hotdog', '[]', 15),
	(1278, 'police', '{"OGR18462":{"name":"pika alflah","cid":"OGR18462","grade":3},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2}}', 15),
	(1279, 'realestate', '{"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":4}}', 15),
	(1280, 'judge', '[]', 15),
	(1281, 'ambulance', '[]', 15),
	(1282, 'mechanic', '[]', 15),
	(1283, 'koi', '[]', 15),
	(1284, 'lawyer', '[]', 15),
	(1285, 'uwu', '[]', 15),
	(1286, 'vapeshop', '[]', 15),
	(1287, 'tow', '[]', 15),
	(1288, 'bus', '[]', 15),
	(1289, 'limeys', '[]', 15),
	(1290, 'auction', '[]', 15),
	(1291, 'garbage', '[]', 15),
	(1292, 'vineyard', '[]', 15),
	(1293, 'garbage', '[]', 15),
	(1294, 'hotdog', '[]', 15),
	(1295, 'lawyer', '[]', 15),
	(1296, 'airport', '[]', 15),
	(1297, 'cardealer', '[]', 15),
	(1298, 'auction', '[]', 15),
	(1299, 'judge', '[]', 15),
	(1300, 'cigar', '[]', 15),
	(1301, 'mechanic', '[]', 15),
	(1302, 'trucker', '[]', 15),
	(1303, 'bus', '[]', 15),
	(1304, 'tow', '[]', 15),
	(1305, 'ambulance', '[]', 15),
	(1306, 'reporter', '[]', 15),
	(1307, 'taxi', '[]', 15),
	(1308, 'oilwell', '[]', 15),
	(1309, 'beanmachine', '[]', 15),
	(1310, 'koi', '[]', 15),
	(1311, 'vapeshop', '[]', 15),
	(1312, 'limeys', '[]', 15),
	(1313, 'police', '{"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4},"OGR18462":{"name":"pika alflah","cid":"OGR18462","grade":3},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2}}', 15),
	(1314, 'burgershot', '[]', 15),
	(1315, 'vineyard', '[]', 15),
	(1316, 'realestate', '{"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":4}}', 15),
	(1317, 'uwu', '[]', 15),
	(1318, 'reporter', '[]', 15),
	(1319, 'trucker', '[]', 15),
	(1320, 'auction', '[]', 15),
	(1321, 'cigar', '[]', 15),
	(1322, 'bus', '[]', 15),
	(1323, 'mechanic', '[]', 15),
	(1324, 'burgershot', '[]', 15),
	(1325, 'cardealer', '[]', 15),
	(1326, 'uwu', '[]', 15),
	(1327, 'lawyer', '[]', 15),
	(1328, 'koi', '[]', 15),
	(1329, 'garbage', '[]', 15),
	(1330, 'hotdog', '[]', 15),
	(1331, 'oilwell', '[]', 15),
	(1332, 'limeys', '[]', 15),
	(1333, 'judge', '[]', 15),
	(1334, 'beanmachine', '[]', 15),
	(1335, 'taxi', '[]', 15),
	(1336, 'vapeshop', '[]', 15),
	(1337, 'tow', '[]', 15),
	(1338, 'ambulance', '[]', 15),
	(1339, 'realestate', '{"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":4}}', 15),
	(1340, 'vineyard', '[]', 15),
	(1341, 'police', '{"OGR18462":{"name":"pika alflah","cid":"OGR18462","grade":3},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2}}', 15),
	(1342, 'airport', '[]', 15),
	(1343, 'koi', '[]', 15),
	(1344, 'garbage', '[]', 15),
	(1345, 'realestate', '{"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":4}}', 15),
	(1346, 'cigar', '[]', 15),
	(1347, 'cardealer', '[]', 15),
	(1348, 'hotdog', '[]', 15),
	(1349, 'bus', '[]', 15),
	(1350, 'trucker', '[]', 15),
	(1351, 'mechanic', '[]', 15),
	(1352, 'vapeshop', '[]', 15),
	(1353, 'reporter', '[]', 15),
	(1354, 'taxi', '[]', 15),
	(1355, 'beanmachine', '[]', 15),
	(1356, 'tow', '[]', 15),
	(1357, 'judge', '[]', 15),
	(1358, 'limeys', '[]', 15),
	(1359, 'auction', '[]', 15),
	(1360, 'ambulance', '[]', 15),
	(1361, 'burgershot', '[]', 15),
	(1362, 'oilwell', '[]', 15),
	(1363, 'lawyer', '[]', 15),
	(1364, 'police', '{"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4},"OGR18462":{"name":"pika alflah","cid":"OGR18462","grade":3},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2}}', 15),
	(1365, 'vineyard', '[]', 15),
	(1366, 'airport', '[]', 15),
	(1367, 'uwu', '[]', 15),
	(1368, 'auction', '[]', 15),
	(1369, 'lawyer', '[]', 15),
	(1370, 'cigar', '[]', 15),
	(1371, 'vapeshop', '[]', 15),
	(1372, 'koi', '[]', 15),
	(1373, 'garbage', '[]', 15),
	(1374, 'trucker', '[]', 15),
	(1375, 'ambulance', '[]', 15),
	(1376, 'beanmachine', '[]', 15),
	(1377, 'judge', '[]', 15),
	(1378, 'uwu', '[]', 15),
	(1379, 'mechanic', '[]', 15),
	(1380, 'airport', '[]', 15),
	(1381, 'police', '{"HCR81520":{"grade":4,"name":"مشاري القوت","cid":"HCR81520"},"FZN65584":{"grade":2,"name":"ad s","cid":"FZN65584"},"DML97005":{"grade":2,"name":"Nmsh Alnmsh","cid":"DML97005"},"OGR18462":{"grade":3,"name":"pika alflah","cid":"OGR18462"},"LYY96314":{"grade":2,"name":"asaa sa","cid":"LYY96314"}}', 15),
	(1382, 'hotdog', '[]', 15),
	(1383, 'vineyard', '[]', 15),
	(1384, 'limeys', '[]', 15),
	(1385, 'taxi', '[]', 15),
	(1386, 'reporter', '[]', 15),
	(1387, 'burgershot', '[]', 15),
	(1388, 'bus', '[]', 15),
	(1389, 'cardealer', '[]', 15),
	(1390, 'realestate', '{"AIB23982":{"grade":4,"name":"شسي سيشسش","cid":"AIB23982"}}', 15),
	(1391, 'oilwell', '[]', 15),
	(1392, 'tow', '[]', 15),
	(1393, 'garbage', '[]', 15),
	(1394, 'realestate', '{"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":4}}', 15),
	(1395, 'burgershot', '[]', 15),
	(1396, 'lawyer', '[]', 15),
	(1397, 'koi', '[]', 15),
	(1398, 'judge', '[]', 15),
	(1399, 'tow', '[]', 15),
	(1400, 'oilwell', '[]', 15),
	(1401, 'bus', '[]', 15),
	(1402, 'police', '{"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"OGR18462":{"name":"pika alflah","cid":"OGR18462","grade":3},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2}}', 15),
	(1403, 'auction', '[]', 15),
	(1404, 'uwu', '[]', 15),
	(1405, 'hotdog', '[]', 15),
	(1406, 'mechanic', '[]', 15),
	(1407, 'ambulance', '[]', 15),
	(1408, 'limeys', '[]', 15),
	(1409, 'taxi', '[]', 15),
	(1410, 'airport', '[]', 15),
	(1411, 'beanmachine', '[]', 15),
	(1412, 'reporter', '[]', 15),
	(1413, 'vineyard', '[]', 15),
	(1414, 'cardealer', '[]', 15),
	(1415, 'cigar', '[]', 15),
	(1416, 'vapeshop', '[]', 15),
	(1417, 'trucker', '[]', 15),
	(1418, 'cigar', '[]', 15),
	(1419, 'garbage', '[]', 15),
	(1420, 'airport', '[]', 15),
	(1421, 'cardealer', '[]', 15),
	(1422, 'oilwell', '[]', 15),
	(1423, 'uwu', '[]', 15),
	(1424, 'mechanic', '[]', 15),
	(1425, 'bus', '[]', 15),
	(1426, 'vineyard', '[]', 15),
	(1427, 'realestate', '{"AIB23982":{"cid":"AIB23982","grade":4,"name":"شسي سيشسش"}}', 15),
	(1428, 'judge', '[]', 15),
	(1429, 'beanmachine', '[]', 15),
	(1430, 'koi', '[]', 15),
	(1431, 'vapeshop', '[]', 15),
	(1432, 'trucker', '[]', 15),
	(1433, 'auction', '[]', 15),
	(1434, 'lawyer', '[]', 15),
	(1435, 'reporter', '[]', 15),
	(1436, 'burgershot', '[]', 15),
	(1437, 'tow', '[]', 15),
	(1438, 'police', '{"OGR18462":{"cid":"OGR18462","grade":3,"name":"pika alflah"},"LYY96314":{"cid":"LYY96314","grade":2,"name":"asaa sa"},"DML97005":{"cid":"DML97005","grade":2,"name":"Nmsh Alnmsh"},"FZN65584":{"cid":"FZN65584","grade":2,"name":"ad s"},"HCR81520":{"cid":"HCR81520","grade":4,"name":"مشاري القوت"}}', 15),
	(1439, 'limeys', '[]', 15),
	(1440, 'taxi', '[]', 15),
	(1441, 'ambulance', '[]', 15),
	(1442, 'hotdog', '[]', 15),
	(1443, 'mechanic', '[]', 15),
	(1444, 'ambulance', '[]', 15),
	(1445, 'police', '{"LYY96314":{"cid":"LYY96314","name":"asaa sa","grade":2},"FZN65584":{"cid":"FZN65584","name":"ad s","grade":2},"HCR81520":{"cid":"HCR81520","name":"مشاري القوت","grade":4},"DML97005":{"cid":"DML97005","name":"Nmsh Alnmsh","grade":2},"OGR18462":{"cid":"OGR18462","name":"pika alflah","grade":3}}', 15),
	(1446, 'auction', '[]', 15),
	(1447, 'vapeshop', '[]', 15),
	(1448, 'realestate', '{"AIB23982":{"cid":"AIB23982","name":"شسي سيشسش","grade":4}}', 15),
	(1449, 'garbage', '[]', 15),
	(1450, 'uwu', '[]', 15),
	(1451, 'bus', '[]', 15),
	(1452, 'koi', '[]', 15),
	(1453, 'airport', '[]', 15),
	(1454, 'beanmachine', '[]', 15),
	(1455, 'judge', '[]', 15),
	(1456, 'taxi', '[]', 15),
	(1457, 'hotdog', '[]', 15),
	(1458, 'tow', '[]', 15),
	(1459, 'cardealer', '[]', 15),
	(1460, 'trucker', '[]', 15),
	(1461, 'limeys', '[]', 15),
	(1462, 'lawyer', '[]', 15),
	(1463, 'oilwell', '[]', 15),
	(1464, 'reporter', '[]', 15),
	(1465, 'burgershot', '[]', 15),
	(1466, 'vineyard', '[]', 15),
	(1467, 'cigar', '[]', 15),
	(1468, 'oilwell', '[]', 15),
	(1469, 'taxi', '[]', 15),
	(1470, 'bus', '[]', 15),
	(1471, 'mechanic', '[]', 15),
	(1472, 'auction', '[]', 15),
	(1473, 'cigar', '[]', 15),
	(1474, 'hotdog', '[]', 15),
	(1475, 'vapeshop', '[]', 15),
	(1476, 'uwu', '[]', 15),
	(1477, 'beanmachine', '[]', 15),
	(1478, 'cardealer', '[]', 15),
	(1479, 'koi', '[]', 15),
	(1480, 'lawyer', '[]', 15),
	(1481, 'reporter', '[]', 15),
	(1482, 'limeys', '[]', 15),
	(1483, 'police', '{"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4},"OGR18462":{"name":"pika alflah","cid":"OGR18462","grade":3},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":4}}', 15),
	(1484, 'realestate', '[]', 15),
	(1485, 'airport', '[]', 15),
	(1486, 'ambulance', '[]', 15),
	(1487, 'judge', '[]', 15),
	(1488, 'trucker', '[]', 15),
	(1489, 'garbage', '[]', 15),
	(1490, 'burgershot', '[]', 15),
	(1491, 'tow', '[]', 15),
	(1492, 'vineyard', '[]', 15),
	(1493, 'police', '{"HCR81520":{"name":"مشاري القوت","cid":"HCR81520","grade":4},"LYY96314":{"name":"asaa sa","cid":"LYY96314","grade":2},"AIB23982":{"name":"شسي سيشسش","cid":"AIB23982","grade":4},"DML97005":{"name":"Nmsh Alnmsh","cid":"DML97005","grade":2},"FZN65584":{"name":"ad s","cid":"FZN65584","grade":2},"OGR18462":{"name":"pika alflah","cid":"OGR18462","grade":3}}', 15),
	(1494, 'mechanic', '[]', 15),
	(1495, 'taxi', '[]', 15),
	(1496, 'judge', '[]', 15),
	(1497, 'auction', '[]', 15),
	(1498, 'koi', '[]', 15),
	(1499, 'ambulance', '[]', 15),
	(1500, 'bus', '[]', 15),
	(1501, 'hotdog', '[]', 15),
	(1502, 'cardealer', '[]', 15),
	(1503, 'vapeshop', '[]', 15),
	(1504, 'tow', '[]', 15),
	(1505, 'airport', '[]', 15),
	(1506, 'limeys', '[]', 15),
	(1507, 'uwu', '[]', 15),
	(1508, 'burgershot', '[]', 15),
	(1509, 'lawyer', '[]', 15),
	(1510, 'reporter', '[]', 15),
	(1511, 'oilwell', '[]', 15),
	(1512, 'garbage', '[]', 15),
	(1513, 'realestate', '[]', 15),
	(1514, 'beanmachine', '[]', 15),
	(1515, 'trucker', '[]', 15),
	(1516, 'vineyard', '[]', 15),
	(1517, 'cigar', '[]', 15);

-- Dumping structure for table nmsh.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.player_mails: ~0 rows (approximately)
INSERT INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(76, 'WUK08631', 'Turner’s Auto Wrecking', 'Vehicle List', 'You Can Only Demolish A Number Of Vehicles.<br />You Can Keep Everything You Demolish For Yourself As Long As You Dont Bother Me.<br /><br /><strong>Vehicle List:</strong><br />Dewbauchee Exemplar<br />Pegassi Zentorno<br />Übermacht Zion Cabrio<br />Albany Cavalcade<br />Declasse Sabre GT Turbo<br />Declasse Asea<br />Vapid Stanier<br />Bollokan Prairie<br />Benefactor Schafter<br />Obey 9F<br />Vapid Bobcat XL Open<br />Übermacht Oracle XS<br />Obey Rocoto<br />Canis Seminole<br />Pegassi Bati 801<br />Benefactor Feltzer<br />Obey 9F Cabrio<br />Lampadati Pigalle<br />Maxwell Asbo<br />Bravado Bison<br />Dinka Thrust<br />Enus Cognoscenti<br />Dinka Blista<br />Karin Sultan<br />Obey Tailgater<br />Dundreary Stretch<br />Dinka Blista Compact<br />Grotti Turismo R<br />', 0, 272568, '2023-09-27 15:08:52', '[]');

-- Dumping structure for table nmsh.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.player_outfits: ~2 rows (approximately)
INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `props`, `components`) VALUES
	(26, 'IIV39976', 'nsmh', 'mp_m_freemode_01', '[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}]', '[{"drawable":0,"component_id":0,"texture":0},{"drawable":52,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":172,"component_id":3,"texture":0},{"drawable":130,"component_id":4,"texture":1},{"drawable":0,"component_id":5,"texture":0},{"drawable":24,"component_id":6,"texture":0},{"drawable":133,"component_id":7,"texture":0},{"drawable":15,"component_id":8,"texture":0},{"drawable":15,"component_id":9,"texture":2},{"drawable":0,"component_id":10,"texture":0},{"drawable":336,"component_id":11,"texture":3}]'),
	(27, 'DML97005', 'شئ', 'mp_m_freemode_01', '[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}]', '[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}]');

-- Dumping structure for table nmsh.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.player_outfit_codes: ~2 rows (approximately)
INSERT INTO `player_outfit_codes` (`id`, `outfitid`, `code`) VALUES
	(1, 26, 'l2eCSPO4rO'),
	(2, 27, 'BDVKqBiOlN');

-- Dumping structure for table nmsh.player_registered_companies
CREATE TABLE IF NOT EXISTS `player_registered_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.player_registered_companies: ~1 rows (approximately)
INSERT INTO `player_registered_companies` (`id`, `citizenid`, `name`, `type`, `balance`) VALUES
	(1, 'AIB23982', 'Nmsssh', 'restaurant', '0');

-- Dumping structure for table nmsh.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.player_transactions: ~3 rows (approximately)
INSERT INTO `player_transactions` (`id`, `isFrozen`, `transactions`) VALUES
	('AIB23982', 0, '[{"amount":25000,"trans_type":"deposit","time":1693781226,"issuer":"شسي سيشسش","title":"Personal Account / AIB23982","message":"شسي سيشسش has deposited $25000","trans_id":"63bd745c-b823-44fa-8619-0e8ec0d73a4d","receiver":"شسي سيشسش"}]'),
	('DML97005', 0, '[{"amount":50000,"time":1693428539,"title":"Personal Account / DML97005","trans_id":"e8671aec-85d7-48cc-a3cc-5746442b81f2","issuer":"Nmsh Alnmsh","message":"Nmsh Alnmsh has withdrawed $50000","trans_type":"withdraw","receiver":"Nmsh Alnmsh"}]'),
	('IIV39976', 0, '[{"time":1689271606,"issuer":"Nmsh Dev","trans_id":"4eb897c4-e904-4ac0-a342-7af6f12c3294","amount":3500,"message":"Nmsh Dev has withdrawed $3500","receiver":"Nmsh Dev","trans_type":"withdraw","title":"Personal Account / IIV39976"},{"receiver":"Nmsh Dev","amount":3500,"issuer":"Nmsh Dev","time":1689254446,"message":"Nmsh Dev has withdrawed $3500","trans_type":"withdraw","trans_id":"0227f77c-189b-4af2-93ff-b51e3e01a86b","title":"Personal Account / IIV39976"},{"receiver":"Nmsh Dev","amount":250,"issuer":"Nmsh Dev","time":1688904755,"message":"Nmsh Dev has withdrawed $250","trans_type":"withdraw","trans_id":"bbf270a2-712f-403d-8134-4497d4df741a","title":"Personal Account / IIV39976"}]');

-- Dumping structure for table nmsh.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `vinnumber` varchar(50) DEFAULT NULL,
  `vinscratch` int(2) DEFAULT 0,
  `job` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `harness` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.player_vehicles: ~23 rows (approximately)
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `vinnumber`, `vinscratch`, `job`, `type`, `harness`) VALUES
	(1, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'adder', '-1216765807', '{"modFrontWheels":-1,"modAirFilter":-1,"modEngine":-1,"dashboardColor":0,"dirtLevel":0.0,"plateIndex":0,"fuelLevel":21.4468623375556,"bodyHealth":1000.0592475178704,"modAPlate":-1,"wheelWidth":0.0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit19":-1,"modBackWheels":-1,"modArmor":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":false,"0":true},"modRoof":-1,"wheelColor":156,"modShifterLeavers":-1,"modTank":-1,"modAerials":-1,"modArchCover":-1,"modSeats":-1,"tyreSmokeColor":[255,255,255],"extras":{"10":false,"1":true,"12":false},"modDial":-1,"modTransmission":-1,"wheelSize":0.0,"windowTint":-1,"modBrakes":-1,"modSteeringWheel":-1,"xenonColor":255,"modFender":-1,"modRearBumper":-1,"modTurbo":false,"wheels":7,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHood":-1,"color2":0,"tankHealth":1000.0592475178704,"modDashboard":-1,"neonEnabled":[false,false,false,false],"modWindows":-1,"liveryRoof":-1,"modCustomTiresF":false,"modExhaust":-1,"modSpoilers":-1,"modTrunk":-1,"modStruts":-1,"modTrimA":-1,"neonColor":[0,0,255],"modTrimB":-1,"modSpeakers":-1,"plate":"49OGZ795","pearlescentColor":7,"modXenon":false,"oilLevel":4.76596940834568,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSmokeEnabled":false,"color1":1,"modKit49":-1,"modKit21":-1,"modOrnaments":-1,"modKit17":-1,"modSuspension":-1,"modRightFender":-1,"model":-1216765807,"headlightColor":255,"modFrame":-1,"modFrontBumper":-1,"modDoorSpeaker":-1,"modKit47":-1,"modHydrolic":-1,"modLivery":-1,"engineHealth":1000.0592475178704,"modCustomTiresR":false,"modSideSkirt":-1,"modPlateHolder":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"interiorColor":0,"modHorns":-1,"modVanityPlate":-1,"modGrille":-1,"modEngineBlock":-1}', '49OGZ795', NULL, NULL, 100, 1000, 1000, 0, 0, 821756, NULL, 0, 0, 0, 0, '401GTE57', 0, NULL, NULL, NULL),
	(2, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'hauler', '1518533038', '{"oilLevel":4.76596940834568,"modPlateHolder":-1,"plateIndex":2,"neonColor":[0,0,255],"extras":{"1":true},"modRearBumper":-1,"xenonColor":255,"modXenon":false,"modExhaust":-1,"modSteeringWheel":-1,"modFrontWheels":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"neonEnabled":[false,false,false,false],"modLivery":-1,"modGrille":-1,"interiorColor":0,"modBrakes":-1,"modRoof":-1,"modVanityPlate":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tyreSmokeColor":[255,255,255],"modSideSkirt":-1,"modTank":-1,"modSuspension":-1,"modKit21":-1,"modKit19":-1,"modTrimB":-1,"modKit17":-1,"modHood":-1,"modStruts":-1,"liveryRoof":-1,"modRightFender":-1,"color2":107,"modArchCover":-1,"bodyHealth":1000.0592475178704,"plate":"3RE547UJ","modAerials":-1,"modBackWheels":-1,"modTrunk":-1,"modEngine":-1,"modOrnaments":-1,"dashboardColor":0,"modTransmission":-1,"modDoorSpeaker":-1,"modAPlate":-1,"modTrimA":-1,"tankHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"engineHealth":1000.0592475178704,"modTurbo":false,"modKit49":-1,"modCustomTiresR":false,"windowTint":-1,"modEngineBlock":-1,"wheelWidth":0.0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"dirtLevel":11.12059528613994,"modSeats":-1,"wheelColor":156,"modKit47":-1,"wheelSize":0.0,"modCustomTiresF":false,"modHorns":-1,"modArmor":-1,"modFrontBumper":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modSpoilers":-1,"fuelLevel":100.08535757525947,"color1":98,"headlightColor":255,"modAirFilter":-1,"modWindows":-1,"wheels":0,"model":1518533038,"modDial":-1,"modHydrolic":-1,"modSmokeEnabled":false,"modDashboard":-1,"modSpeakers":-1,"modShifterLeavers":-1,"modFender":-1,"pearlescentColor":93,"modFrame":-1}', '3RE547UJ', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, 417632, NULL, 0, 0, 0, 0, '725WEI81', 0, NULL, NULL, NULL),
	(3, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'adder', '-1216765807', '{"neonEnabled":[false,false,false,false],"modHood":-1,"fuelLevel":38.92208350148979,"tyreSmokeColor":[255,255,255],"modSideSkirt":-1,"interiorColor":0,"modStruts":-1,"plateIndex":0,"modBrakes":-1,"modGrille":-1,"modPlateHolder":-1,"modExhaust":-1,"modFender":-1,"liveryRoof":-1,"modWindows":-1,"modCustomTiresF":false,"modBackWheels":-1,"windowTint":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngineBlock":-1,"modSpoilers":-1,"wheelSize":0.0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrontBumper":-1,"modXenon":false,"extras":{"1":true,"12":false,"10":false},"modTransmission":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modCustomTiresR":false,"modFrame":-1,"modSeats":-1,"wheels":7,"modTank":-1,"color2":0,"modOrnaments":-1,"modKit19":-1,"modTrimB":-1,"modAirFilter":-1,"modShifterLeavers":-1,"wheelWidth":0.0,"modAPlate":-1,"neonColor":[0,0,255],"modArchCover":-1,"modDoorSpeaker":-1,"model":-1216765807,"bodyHealth":1000.0592475178704,"modAerials":-1,"modDial":-1,"modDashboard":-1,"modEngine":-1,"modSmokeEnabled":false,"oilLevel":4.76596940834568,"modTurbo":false,"modRoof":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrunk":-1,"modKit17":-1,"plate":"27LOF483","color1":1,"modHorns":-1,"modSuspension":-1,"modKit47":-1,"headlightColor":255,"modRightFender":-1,"dirtLevel":0.0,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":false,"0":true},"modKit49":-1,"modSpeakers":-1,"tankHealth":1000.0592475178704,"modHydrolic":-1,"modTrimA":-1,"modLivery":-1,"modVanityPlate":-1,"dashboardColor":0,"modRearBumper":-1,"modFrontWheels":-1,"xenonColor":255,"modArmor":-1,"pearlescentColor":7,"wheelColor":156,"modKit21":-1,"engineHealth":1000.0592475178704,"modSteeringWheel":-1}', '27LOF483', NULL, NULL, 100, 1000, 1000, 0, 0, 543268, NULL, 0, 0, 0, 0, '875BHF19', 0, NULL, NULL, NULL),
	(4, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'vigero', '-825837129', '{}', '8IU513OW', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, '963XVS97', 0, NULL, NULL, NULL),
	(5, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'c7', '874739883', '{"pearlescentColor":140,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"dirtLevel":0.0,"modSuspension":-1,"modTank":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modArmor":-1,"modBrakes":-1,"modGrille":-1,"modBackWheels":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"modFrame":-1,"modExhaust":-1,"modTrimB":-1,"modShifterLeavers":-1,"modHydrolic":-1,"extras":{"1":true},"modKit47":-1,"modRoof":-1,"modFender":-1,"modWindows":-1,"modHorns":-1,"modKit17":-1,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelSize":0.0,"interiorColor":0,"modSeats":-1,"modAerials":-1,"modLivery":-1,"modSideSkirt":-1,"wheelColor":1,"modEngine":-1,"tyreSmokeColor":[255,255,255],"modVanityPlate":-1,"modKit21":-1,"modRearBumper":-1,"modEngineBlock":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modOrnaments":-1,"modKit19":-1,"color1":64,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"headlightColor":255,"modSteeringWheel":-1,"tankHealth":1000.0592475178704,"plate":"23LKQ709","modXenon":false,"wheels":0,"color2":0,"modDoorSpeaker":-1,"bodyHealth":1000.0592475178704,"modCustomTiresF":false,"liveryRoof":-1,"xenonColor":255,"windowTint":-1,"modSmokeEnabled":false,"oilLevel":7.14895411251853,"neonColor":[0,0,255],"modArchCover":-1,"modHood":-1,"modAPlate":-1,"wheelWidth":0.0,"modSpeakers":-1,"modDashboard":-1,"dashboardColor":0,"modCustomTiresR":false,"model":874739883,"modKit49":-1,"plateIndex":0,"fuelLevel":50.04267878762973,"modPlateHolder":-1,"modStruts":-1,"modTrunk":-1,"engineHealth":1000.0592475178704,"modFrontBumper":-1,"modTrimA":-1,"modRightFender":-1,"modAirFilter":-1,"modDial":-1,"modTransmission":-1}', '23LKQ709', NULL, NULL, 100, 1000, 1000, 0, 0, 441255, NULL, 0, 0, 0, 0, '907ROB97', 0, NULL, NULL, NULL),
	(6, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'gtr', '-1752116803', '{"pearlescentColor":6,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"dirtLevel":0.0,"modSuspension":-1,"modTank":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modArmor":-1,"modBrakes":-1,"modGrille":-1,"modBackWheels":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"modFrame":-1,"modExhaust":-1,"modTrimB":-1,"modShifterLeavers":-1,"modHydrolic":-1,"extras":[],"modKit47":-1,"modRoof":-1,"modFender":-1,"modWindows":-1,"modHorns":-1,"modKit17":-1,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelSize":0.0,"interiorColor":0,"modSeats":-1,"modAerials":-1,"modLivery":-1,"modSideSkirt":-1,"wheelColor":0,"modEngine":-1,"tyreSmokeColor":[255,255,255],"modVanityPlate":-1,"modKit21":-1,"modRearBumper":-1,"modEngineBlock":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modOrnaments":-1,"modKit19":-1,"color1":36,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"headlightColor":255,"modSteeringWheel":-1,"tankHealth":1000.0592475178704,"plate":"42VYC458","modXenon":false,"wheels":0,"color2":0,"modDoorSpeaker":-1,"bodyHealth":1000.0592475178704,"modCustomTiresF":false,"liveryRoof":-1,"xenonColor":255,"windowTint":-1,"modSmokeEnabled":false,"oilLevel":4.76596940834568,"neonColor":[0,0,255],"modArchCover":-1,"modHood":-1,"modAPlate":-1,"wheelWidth":0.0,"modSpeakers":-1,"modDashboard":-1,"dashboardColor":0,"modCustomTiresR":false,"model":-1752116803,"modKit49":-1,"plateIndex":0,"fuelLevel":41.30506820566263,"modPlateHolder":-1,"modStruts":-1,"modTrunk":-1,"engineHealth":1000.0592475178704,"modFrontBumper":-1,"modTrimA":-1,"modRightFender":-1,"modAirFilter":-1,"modDial":-1,"modTransmission":-1}', '42VYC458', NULL, NULL, 100, 1000, 1000, 0, 0, 143592, NULL, 0, 0, 0, 0, '417PGY29', 0, NULL, NULL, NULL),
	(7, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'adder', '-1216765807', NULL, 'DI22AK45', NULL, NULL, 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, '535MGJ78', 0, NULL, NULL, NULL),
	(8, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'adder', '-1216765807', NULL, 'BG81ZM34', NULL, NULL, 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, '359MIL77', 0, NULL, NULL, NULL),
	(9, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'adder', '-1216765807', NULL, 'NW51CB75', NULL, NULL, 100, 1000, 1000, 0, 0, 326, NULL, 0, 0, 0, 0, '039IUS00', 0, NULL, NULL, NULL),
	(10, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'adder', '-1216765807', NULL, 'IV97HK62', NULL, NULL, 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, '437YAJ56', 0, NULL, NULL, NULL),
	(11, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'adder', '-1216765807', NULL, 'OL88SW94', NULL, NULL, 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, '778SLH30', 0, NULL, NULL, NULL),
	(12, 'license:657ecac803e5b1619f20628edcc1a4b9b3e98dd2', 'IIV39976', 'adder', '-1216765807', NULL, 'HC20BH41', NULL, NULL, 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, '940TFT75', 0, NULL, NULL, NULL),
	(13, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'DML97005', 'adder', '-1216765807', '{"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modStruts":-1,"liveryRoof":-1,"pearlescentColor":7,"modSideSkirt":-1,"modCustomTiresR":false,"modWindows":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"model":-1216765807,"wheelSize":1.0,"modBrakes":2,"modKit19":-1,"wheelColor":156,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimB":-1,"modRoof":-1,"dashboardColor":0,"modSpoilers":-1,"modSpeakers":-1,"modDashboard":-1,"modEngine":3,"modAerials":-1,"modBackWheels":-1,"modShifterLeavers":-1,"modSmokeEnabled":false,"modSteeringWheel":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":false,"0":true},"modFrame":-1,"bodyHealth":1000.0592475178704,"modKit49":-1,"modTrimA":-1,"modFender":-1,"modLivery":-1,"modVanityPlate":-1,"modArmor":4,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTank":-1,"xenonColor":255,"modRightFender":-1,"modOrnaments":-1,"wheels":0,"modKit47":-1,"modKit17":-1,"modCustomTiresF":false,"tyreSmokeColor":[255,255,255],"windowTint":1,"modHorns":-1,"modHydrolic":-1,"plateIndex":0,"modDial":-1,"dirtLevel":2.38298470417284,"modSeats":-1,"plate":"24WUM117","modFrontBumper":-1,"engineHealth":1000.0592475178704,"extras":{"12":false,"1":true,"10":true},"oilLevel":4.76596940834568,"modExhaust":-1,"modDoorSpeaker":-1,"modFrontWheels":50,"interiorColor":0,"modGrille":-1,"tankHealth":1000.0592475178704,"modAPlate":-1,"modArchCover":-1,"modRearBumper":-1,"modTrunk":-1,"wheelWidth":1.0,"color1":1,"neonColor":[255,0,255],"headlightColor":255,"modTurbo":1,"modSuspension":3,"modHood":-1,"modKit21":-1,"modPlateHolder":-1,"modXenon":1,"fuelLevel":44.48238114455976,"color2":0,"modTransmission":2,"modAirFilter":-1,"modEngineBlock":-1}', '24WUM117', NULL, NULL, 100, 1000, 1000, 0, 0, 534895, NULL, 0, 0, 0, 0, '963KRU14', 0, NULL, NULL, NULL),
	(14, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'DML97005', 'adder', '-1216765807', '{"dirtLevel":7.94328234724281,"modKit19":-1,"modHorns":-1,"fuelLevel":100.08535757525947,"modTurbo":1,"modSmokeEnabled":false,"modFrontBumper":-1,"pearlescentColor":7,"modWindows":-1,"modPlateHolder":-1,"wheelColor":156,"modCustomTiresF":false,"modShifterLeavers":-1,"modRoof":-1,"modFender":-1,"wheelSize":1.0,"modKit49":-1,"modEngine":3,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":false,"0":true},"model":-1216765807,"modKit21":-1,"modLivery":-1,"interiorColor":0,"liveryRoof":-1,"modTrimA":-1,"oilLevel":4.76596940834568,"xenonColor":255,"dashboardColor":0,"modAerials":-1,"modSuspension":3,"windowTint":1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modGrille":-1,"modAirFilter":-1,"tyreSmokeColor":[255,255,255],"neonColor":[255,0,255],"tankHealth":1000.0592475178704,"modBackWheels":-1,"modDashboard":-1,"modArmor":4,"modSpoilers":-1,"modSeats":-1,"modAPlate":-1,"modDoorSpeaker":-1,"modFrontWheels":53,"neonEnabled":[false,false,false,false],"modTransmission":2,"wheels":0,"bodyHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHood":-1,"modTrunk":-1,"extras":{"12":false,"1":true,"10":false},"modKit47":-1,"plate":"83KAY452","modTank":-1,"modSteeringWheel":-1,"engineHealth":1000.0592475178704,"color1":1,"modCustomTiresR":false,"modExhaust":-1,"modRearBumper":-1,"modBrakes":2,"modOrnaments":-1,"modFrame":-1,"modEngineBlock":-1,"wheelWidth":1.0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSpeakers":-1,"modDial":-1,"modKit17":-1,"modStruts":-1,"modArchCover":-1,"modRightFender":-1,"modVanityPlate":-1,"modHydrolic":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSideSkirt":-1,"plateIndex":0,"modTrimB":-1,"headlightColor":255,"color2":0,"modXenon":1}', '83KAY452', NULL, NULL, 100, 1000, 1000, 0, 0, 810810, NULL, 0, 0, 0, 0, '678CXU09', 0, NULL, NULL, NULL),
	(15, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'DML97005', 'volatus', '-1845487887', '{"pearlescentColor":2,"modKit21":-1,"modEngine":-1,"model":-1845487887,"tankHealth":1000.0592475178704,"modSpeakers":-1,"plate":"8YZ425EJ","modAirFilter":-1,"modHydrolic":-1,"xenonColor":255,"modDashboard":-1,"modGrille":-1,"modSpoilers":-1,"modRightFender":-1,"modKit49":-1,"modHorns":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresF":false,"liveryRoof":-1,"modVanityPlate":-1,"modTrimA":-1,"modLivery":-1,"windowTint":-1,"modFrontBumper":-1,"modFender":-1,"dashboardColor":0,"neonColor":[255,0,255],"oilLevel":7.94328234724281,"modAPlate":-1,"modTrunk":-1,"modExhaust":-1,"wheelColor":156,"modSmokeEnabled":false,"modShifterLeavers":-1,"modKit17":-1,"modSteeringWheel":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit47":-1,"neonEnabled":[false,false,false,false],"engineHealth":1000.0592475178704,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"interiorColor":0,"modBackWheels":-1,"modTransmission":-1,"modSuspension":-1,"modPlateHolder":-1,"modArchCover":-1,"modSideSkirt":-1,"modStruts":-1,"modTank":-1,"fuelLevel":100.08535757525947,"headlightColor":255,"modDoorSpeaker":-1,"dirtLevel":3.17731293889712,"modFrame":-1,"modArmor":-1,"modFrontWheels":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":0.0,"0":1000.0},"modBrakes":-1,"modOrnaments":-1,"tyreSmokeColor":[255,255,255],"color2":0,"wheelSize":0.0,"color1":26,"modEngineBlock":-1,"modRearBumper":-1,"bodyHealth":1000.0592475178704,"wheels":0,"wheelWidth":0.0,"modHood":-1,"modSeats":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modTurbo":false,"modCustomTiresR":false,"modKit19":-1,"modRoof":-1,"modTrimB":-1,"plateIndex":0,"modAerials":-1,"extras":{"7":true,"1":true,"2":true},"modWindows":-1,"modXenon":false,"modDial":-1}', '8YZ425EJ', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, 635022, NULL, 0, 0, 0, 0, '875OQE93', 0, NULL, NULL, NULL),
	(16, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'DML97005', 'vigero', '-825837129', '{"modKit49":-1,"modRightFender":-1,"modFrame":-1,"modKit19":-1,"modSuspension":-1,"modXenon":false,"modHorns":-1,"wheels":1,"modCustomTiresR":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modTurbo":false,"modBrakes":-1,"modGrille":-1,"modKit47":-1,"modSpeakers":-1,"color1":4,"modDoorSpeaker":-1,"modRearBumper":-1,"modTrunk":-1,"modPlateHolder":-1,"modKit17":-1,"plateIndex":0,"plate":"9QU139CG","tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tyreSmokeColor":[255,255,255],"windowTint":-1,"dashboardColor":0,"modTrimB":-1,"modSpoilers":-1,"fuelLevel":100.08535757525947,"modAirFilter":-1,"engineHealth":1000.0592475178704,"modDashboard":-1,"wheelSize":0.0,"modTrimA":-1,"modStruts":-1,"extras":{"11":false,"10":false},"modHood":-1,"modLivery":-1,"modAPlate":-1,"modExhaust":-1,"liveryRoof":-1,"modCustomTiresF":false,"wheelWidth":0.0,"interiorColor":0,"modWindows":-1,"bodyHealth":1000.0592475178704,"modTransmission":-1,"neonEnabled":[false,false,false,false],"modArchCover":-1,"headlightColor":255,"modTank":-1,"modFrontBumper":-1,"modSmokeEnabled":false,"wheelColor":156,"neonColor":[255,0,255],"modFender":-1,"xenonColor":255,"modVanityPlate":-1,"modHydrolic":-1,"modFrontWheels":-1,"oilLevel":5.56029764306997,"modEngine":-1,"modSteeringWheel":-1,"dirtLevel":10.32626705141565,"modOrnaments":-1,"pearlescentColor":111,"model":-825837129,"modArmor":-1,"modAerials":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngineBlock":-1,"modSideSkirt":-1,"modRoof":-1,"modShifterLeavers":-1,"modSeats":-1,"tankHealth":1000.0592475178704,"modBackWheels":-1,"modKit21":-1,"color2":0,"modDial":-1}', '9QU139CG', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, 557086, NULL, 0, 0, 0, 0, '606VYW21', 0, NULL, NULL, NULL),
	(17, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'AIB23982', 'freecrawler', '-54332285', '{"neonColor":[255,0,255],"color1":5,"modKit19":-1,"modTank":-1,"plate":"42BKH053","tankHealth":1000.0592475178704,"headlightColor":255,"modDashboard":-1,"xenonColor":255,"modFender":-1,"modGrille":-1,"modBackWheels":-1,"modEngineBlock":-1,"modAirFilter":-1,"modKit21":-1,"modFrame":-1,"modWindows":-1,"modFrontBumper":-1,"modSpoilers":-1,"modDoorSpeaker":-1,"interiorColor":111,"modTrimA":-1,"wheelColor":111,"modKit49":-1,"modTrunk":-1,"modRoof":-1,"modLivery":-1,"modBrakes":-1,"modXenon":false,"color2":2,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSideSkirt":-1,"wheels":3,"modAPlate":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modSteeringWheel":-1,"modPlateHolder":-1,"modSpeakers":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modHydrolic":-1,"modArmor":-1,"oilLevel":4.76596940834568,"plateIndex":0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrontWheels":-1,"modTransmission":-1,"modSeats":-1,"modRightFender":-1,"modShifterLeavers":-1,"tyreSmokeColor":[255,255,255],"wheelWidth":0.0,"modTrimB":-1,"modDial":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSuspension":-1,"pearlescentColor":5,"modOrnaments":-1,"wheelSize":0.0,"modHorns":-1,"modKit47":-1,"windowTint":-1,"fuelLevel":40.51073997093835,"modVanityPlate":-1,"liveryRoof":-1,"modKit17":-1,"dashboardColor":0,"modArchCover":-1,"modCustomTiresR":false,"modAerials":-1,"engineHealth":996.8819345789732,"bodyHealth":997.6762628136975,"modStruts":-1,"model":-54332285,"modRearBumper":-1,"modCustomTiresF":false,"dirtLevel":0.0,"neonEnabled":[false,false,false,false],"modHood":-1,"modSmokeEnabled":false,"modTurbo":false,"modExhaust":-1,"modEngine":-1,"extras":[]}', '42BKH053', NULL, NULL, 100, 1000, 1000, 0, 0, 4706, NULL, 0, 0, 0, 0, '388HKQ08', 0, NULL, NULL, NULL),
	(18, 'license:f58e142b5b37be564d2e91b8d406856c51a3612f', 'OGR18462', 'mach1rb', '-374704142', '{"modLivery":-1,"modCustomTiresF":false,"modEngine":3,"modFrontBumper":-1,"modFrontWheels":-1,"modArchCover":-1,"extras":{"2":false,"3":true,"8":true,"1":false,"6":true,"7":false,"4":true,"5":true,"9":true,"12":true,"11":true,"10":false},"modHood":-1,"modTrimA":-1,"modAPlate":-1,"modTransmission":2,"modTrimB":-1,"modKit17":-1,"modCustomTiresR":false,"dirtLevel":0.0,"modShifterLeavers":-1,"modKit47":-1,"modXenon":false,"modTrunk":-1,"bodyHealth":1000.0592475178704,"modFrame":-1,"modTank":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheels":1,"modSideSkirt":-1,"modVanityPlate":-1,"headlightColor":255,"modSuspension":3,"modArmor":4,"modDoorSpeaker":-1,"windowTint":1,"tyreSmokeColor":[255,255,255],"wheelSize":1.0,"modSmokeEnabled":false,"xenonColor":255,"fuelLevel":65.13491524739108,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modBackWheels":-1,"color2":112,"plateIndex":4,"modSpoilers":-1,"model":-374704142,"modSteeringWheel":-1,"modWindows":-1,"liveryRoof":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"neonEnabled":[false,false,false,false],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modStruts":-1,"color1":0,"modSpeakers":-1,"modDashboard":-1,"modKit19":-1,"wheelColor":0,"modRightFender":-1,"modHorns":-1,"modSeats":-1,"modBrakes":2,"modPlateHolder":-1,"engineHealth":1000.0592475178704,"modKit21":-1,"modAirFilter":-1,"modEngineBlock":-1,"modRearBumper":-1,"modDial":-1,"oilLevel":4.76596940834568,"modExhaust":-1,"modAerials":-1,"wheelWidth":1.0,"modFender":-1,"modKit49":-1,"modOrnaments":-1,"modTurbo":1,"interiorColor":0,"pearlescentColor":112,"modHydrolic":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plate":"43CRZ998","dashboardColor":0,"neonColor":[255,0,255],"modRoof":-1,"modGrille":-1,"tankHealth":4000.2369900714818}', '43CRZ998', NULL, NULL, 100, 1000, 1000, 0, 0, 846077, NULL, 0, 0, 0, 0, '289PTF22', 0, NULL, NULL, NULL),
	(19, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'AIB23982', 'le7b', '-1232836011', '{"model":-114291515,"modFrame":-1,"modTurbo":false,"modAerials":-1,"windowsbroken":{"6":true,"7":false,"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"xenonColor":255,"modTank":-1,"modBrakes":-1,"modDashboard":-1,"modBackWheels":-1,"fuelLevel":60.36894583904539,"neonColor":[255,255,255],"modRightFender":-1,"modArmor":-1,"modCustomTiresF":false,"modGrille":-1,"interiorColor":0,"pearlescentColor":0,"modSteeringWheel":-1,"plate":"41YRN484","modEngineBlock":-1,"modTrunk":-1,"dirtLevel":0.0,"modRoof":-1,"modCustomTiresR":false,"modSmokeEnabled":false,"color1":38,"extras":[],"modShifterLeavers":-1,"modHorns":-1,"modWindows":-1,"tankHealth":1000.0592475178704,"bodyHealth":1000.0592475178704,"modHydrolic":-1,"neonEnabled":[false,false,false,false],"tyreSmokeColor":[255,255,255],"modRearBumper":-1,"dashboardColor":0,"modSeats":-1,"health":1000.0592475178704,"color2":0,"modArchCover":-1,"modDial":-1,"modHood":-1,"windowTint":-1,"modSideSkirt":-1,"modFender":-1,"bulletprooftires":false,"modOrnaments":-1,"modPlateHolder":-1,"modTrimA":-1,"wheelColor":27,"modAPlate":-1,"modSpoilers":-1,"modTrimB":-1,"modVanityPlate":-1,"modLivery":-1,"modSuspension":-1,"tiresburst":[],"doorsmissing":{"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"wheels":6,"modFrontBumper":-1,"lockstatus":1,"modEngine":-1,"modFrontWheels":-1,"modStruts":-1,"engineHealth":1000.0592475178704,"plateIndex":3,"modExhaust":-1,"modTransmission":-1,"modAirFilter":-1,"modXenon":false,"modSpeakers":-1,"modDoorSpeaker":-1}', '4EI920VV', NULL, 'motelgarage', 100, 1000, 1000, 0, 0, 10671, NULL, 0, 0, 0, 0, '103EFQ33', 0, NULL, NULL, NULL),
	(20, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'AIB23982', 'mixer', '-784816453', '{"modAerials":-1,"modEngine":-1,"modCustomTiresR":false,"modAPlate":-1,"modAirFilter":-1,"modDoorSpeaker":-1,"modFender":-1,"wheelColor":3,"modSuspension":-1,"modVanityPlate":-1,"modGrille":-1,"modLivery":-1,"modKit47":-1,"xenonColor":255,"modSmokeEnabled":false,"wheelWidth":0.0,"bodyHealth":1000.0592475178704,"modTransmission":-1,"modShifterLeavers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrontWheels":-1,"modKit21":-1,"modSpoilers":-1,"modSpeakers":-1,"modDial":-1,"pearlescentColor":3,"modKit17":-1,"engineHealth":1000.0592475178704,"modEngineBlock":-1,"modXenon":false,"modSteeringWheel":-1,"wheels":0,"oilLevel":4.76596940834568,"modCustomTiresF":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrunk":-1,"modStruts":-1,"interiorColor":0,"color1":126,"modTank":-1,"neonColor":[255,0,255],"fuelLevel":100.08535757525947,"modArchCover":-1,"modBrakes":-1,"modTrimB":-1,"neonEnabled":[false,false,false,false],"liveryRoof":-1,"tankHealth":1000.0592475178704,"modRoof":-1,"modTrimA":-1,"modKit19":-1,"color2":3,"model":-784816453,"extras":{"1":true},"plate":"0AV500NW","modHydrolic":-1,"modDashboard":-1,"dashboardColor":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"dirtLevel":4.76596940834568,"modHood":-1,"modFrontBumper":-1,"modBackWheels":-1,"modHorns":-1,"tyreSmokeColor":[255,255,255],"modSideSkirt":-1,"modArmor":-1,"windowTint":-1,"modRearBumper":-1,"modOrnaments":-1,"modFrame":-1,"modTurbo":false,"modRightFender":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modWindows":-1,"wheelSize":0.0,"plateIndex":3,"modSeats":-1,"headlightColor":255,"modExhaust":-1,"modKit49":-1,"modPlateHolder":-1}', '0AV500NW', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, 16302, NULL, 0, 0, 0, 0, '836WXU89', 0, NULL, NULL, NULL),
	(21, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'AIB23982', 'c7', '874739883', '{"plateIndex":0,"modXenon":false,"modEngine":-1,"modKit17":-1,"extras":{"1":true},"modKit49":-1,"bodyHealth":996.0876063442489,"modHorns":-1,"xenonColor":255,"tyreSmokeColor":[255,255,255],"modSuspension":-1,"neonColor":[255,0,255],"modArmor":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modSpoilers":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"liveryRoof":-1,"modCustomTiresR":false,"model":874739883,"wheelWidth":0.0,"oilLevel":7.14895411251853,"modTransmission":-1,"modFrame":-1,"modSteeringWheel":-1,"modBrakes":-1,"modDoorSpeaker":-1,"modDial":-1,"modTrimA":-1,"headlightColor":255,"modFender":-1,"modHydrolic":-1,"modTrimB":-1,"modTrunk":-1,"modEngineBlock":-1,"modKit19":-1,"modLivery":-1,"modHood":-1,"plate":"03LDX089","modTank":-1,"modArchCover":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modVanityPlate":-1,"modFrontWheels":-1,"modWindows":-1,"modCustomTiresF":false,"modKit21":-1,"fuelLevel":53.21999172652686,"neonEnabled":[false,false,false,false],"modDashboard":-1,"color1":29,"color2":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"modShifterLeavers":-1,"modAPlate":-1,"modTurbo":false,"wheels":0,"modRoof":-1,"pearlescentColor":29,"dirtLevel":0.79432823472428,"wheelColor":1,"modStruts":-1,"modSideSkirt":-1,"dashboardColor":0,"modKit47":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"engineHealth":996.0876063442489,"modFrontBumper":-1,"modBackWheels":-1,"modGrille":-1,"modAirFilter":-1,"modOrnaments":-1,"modSmokeEnabled":false,"modSpeakers":-1,"modSeats":-1,"wheelSize":0.0,"windowTint":-1,"interiorColor":0,"modExhaust":-1,"modPlateHolder":-1,"modRightFender":-1,"tankHealth":999.2649192831461,"modRearBumper":-1}', '03LDX089', NULL, NULL, 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, '288CXK37', 0, NULL, NULL, NULL),
	(22, 'license:1e9bc40fea92669cc93bf80da96305744d09fe44', 'PUL92950', 'moonbeam2', '1896491931', '{"dashboardColor":42,"modRearBumper":-1,"modSpoilers":-1,"modTransmission":-1,"modSideSkirt":-1,"modWindows":-1,"modBrakes":-1,"modCustomTiresR":false,"modRoof":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSpeakers":-1,"tankHealth":1000.0592475178704,"headlightColor":255,"wheelSize":0.0,"color1":34,"modAirFilter":-1,"tyreSmokeColor":[255,255,255],"modSteeringWheel":-1,"plateIndex":0,"plate":"84RQO856","modAPlate":-1,"modKit21":-1,"modArmor":-1,"modFender":-1,"modPlateHolder":-1,"xenonColor":255,"modExhaust":-1,"modFrame":-1,"modVanityPlate":-1,"neonColor":[255,255,255],"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"modHood":-1,"extras":[],"color2":32,"neonEnabled":[false,false,false,false],"modAerials":-1,"modArchCover":-1,"modEngineBlock":-1,"modXenon":false,"oilLevel":4.76596940834568,"modRightFender":-1,"wheelColor":88,"modStruts":-1,"modBackWheels":5,"dirtLevel":0.0,"modKit19":-1,"modFrontBumper":-1,"modLivery":-1,"liveryRoof":-1,"pearlescentColor":29,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit17":-1,"modOrnaments":-1,"modTrimA":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modDashboard":-1,"modCustomTiresF":false,"modFrontWheels":-1,"modSuspension":-1,"modSeats":-1,"modDial":-1,"wheelWidth":0.0,"interiorColor":34,"modGrille":-1,"windowTint":-1,"modTank":-1,"modTrimB":-1,"modDoorSpeaker":-1,"modHydrolic":-1,"modKit47":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit49":-1,"modSmokeEnabled":false,"bodyHealth":1000.0592475178704,"model":1896491931,"engineHealth":1000.0592475178704,"modHorns":-1,"modEngine":-1,"fuelLevel":69.90088465573678,"wheels":1,"modTrunk":-1,"modShifterLeavers":-1}', '84RQO856', NULL, 'motelgarage', 69, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, '161UJC02', 0, NULL, NULL, NULL),
	(23, 'license:846b1a336572db30a38b4287c9553a6c1c44eb97', 'UUP96298', 'g65amg', '104532066', '{"modKit19":-1,"modTank":-1,"color2":1,"modAPlate":-1,"wheelColor":156,"modPlateHolder":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modVanityPlate":-1,"modKit21":-1,"dashboardColor":0,"modTrunk":-1,"liveryRoof":-1,"modFrontBumper":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"plateIndex":0,"modSuspension":3,"modDashboard":-1,"modShifterLeavers":-1,"modOrnaments":-1,"modFrontWheels":-1,"modCustomTiresR":false,"modRearBumper":-1,"interiorColor":0,"modStruts":-1,"bodyHealth":1000.0592475178704,"neonEnabled":[false,false,false,false],"modHydrolic":-1,"wheels":3,"modKit17":-1,"modAirFilter":-1,"modEngineBlock":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":1,"pearlescentColor":4,"modSeats":-1,"tankHealth":1000.0592475178704,"windowTint":-1,"wheelSize":0.0,"modHood":-1,"modRoof":-1,"modFrame":-1,"modDoorSpeaker":-1,"modTransmission":2,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modSmokeEnabled":false,"modKit47":-1,"neonColor":[255,0,255],"oilLevel":4.76596940834568,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"fuelLevel":63.54625877794252,"modArchCover":-1,"modTrimA":-1,"headlightColor":255,"modWindows":-1,"modSideSkirt":-1,"dirtLevel":0.0,"modAerials":-1,"modSpoilers":-1,"modBackWheels":-1,"wheelWidth":0.0,"modKit49":-1,"modGrille":-1,"model":104532066,"modXenon":false,"modExhaust":-1,"modTrimB":-1,"modBrakes":2,"tyreSmokeColor":[255,255,255],"modLivery":-1,"modHorns":-1,"plate":"64TUY234","modRightFender":-1,"xenonColor":255,"modDial":-1,"modTurbo":1,"modSpeakers":-1,"modEngine":3,"modSteeringWheel":-1,"engineHealth":1000.0592475178704,"modArmor":4,"modFender":-1,"modCustomTiresF":false,"extras":{"11":false,"2":true}}', '64TUY234', NULL, NULL, 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL);

-- Dumping structure for table nmsh.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.player_warns: ~6 rows (approximately)
INSERT INTO `player_warns` (`id`, `senderIdentifier`, `targetIdentifier`, `reason`, `warnId`) VALUES
	(1, 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'test', 'WARN-9485'),
	(2, 'license:3138b70881df94afecabff0a254ba609da8d65b3', 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'asdasdsa', 'WARN-9677'),
	(3, 'license:3138b70881df94afecabff0a254ba609da8d65b3', 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'asdasdsa', 'WARN-7089'),
	(4, 'license:3138b70881df94afecabff0a254ba609da8d65b3', 'license:3138b70881df94afecabff0a254ba609da8d65b3', 'sds', 'WARN-6399'),
	(5, 'license:f58e142b5b37be564d2e91b8d406856c51a3612f', 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'hi', 'WARN-6509'),
	(6, 'license:f58e142b5b37be564d2e91b8d406856c51a3612f', 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', 'hi', 'WARN-9443');

-- Dumping structure for table nmsh.polaroid
CREATE TABLE IF NOT EXISTS `polaroid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.polaroid: ~2 rows (approximately)
INSERT INTO `polaroid` (`id`, `identifier`, `img`, `date`, `msg`) VALUES
	(1, 'AIB23982', 'https://media.discordapp.net/attachments/1092195116543914044/1149114464176713840/screenshot.jpg?ex=64fa53bd&is=64f9023d&hm=a1a8c1bb94cfcd19b4bfbbeb16ffe199b6fb06b8cdedac120866116d98c6f5f0&', '2023/09/07', ''),
	(2, 'AIB23982', 'https://media.discordapp.net/attachments/1092195116543914044/1149114665486524477/screenshot.jpg?ex=64fa53ed&is=64f9026d&hm=84c4fd5361860b0dce5c11c9b11a503425a6bd20838f663b4715723aeebb77dd&', '2023/09/07', '');

-- Dumping structure for table nmsh.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`)),
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`),
  CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.properties: ~17 rows (approximately)
INSERT INTO `properties` (`property_id`, `owner_citizenid`, `street`, `region`, `description`, `has_access`, `extra_imgs`, `furnitures`, `for_sale`, `price`, `shell`, `apartment`, `door_data`, `garage_data`) VALUES
	(14, 'HSB79943', NULL, NULL, 'This is بيكا الفلاح\'s apartment in Morningwood Blvd', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Morningwood Blvd', '[]', '[]'),
	(15, 'HMX75285', NULL, NULL, 'This is فاطمة سشي\'s apartment in Tinsel Towers', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Tinsel Towers', '[]', '[]'),
	(16, 'VDN98168', NULL, NULL, 'This is 1 1\'s apartment in Morningwood Blvd', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Morningwood Blvd', '[]', '[]'),
	(17, 'RDF76642', NULL, NULL, 'This is مشاري الحربي\'s apartment in Integrity Way', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Integrity Way', '[]', '[]'),
	(18, 'YCI02041', NULL, NULL, 'This is 112 1112\'s apartment in Integrity Way', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Integrity Way', '[]', '[]'),
	(19, 'ROF34048', NULL, NULL, 'This is kk gh\'s apartment in Tinsel Towers', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Tinsel Towers', '[]', '[]'),
	(20, 'JVY64988', NULL, NULL, 'This is 3 3\'s apartment in Fantastic Plaza', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Fantastic Plaza', '[]', '[]'),
	(21, 'PUL92950', NULL, NULL, 'This is test test\'s apartment in Fantastic Plaza', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Fantastic Plaza', '[]', '[]'),
	(22, 'VIZ97057', NULL, NULL, 'This is eee ee\'s apartment in Tinsel Towers', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Tinsel Towers', '[]', '[]'),
	(23, 'VJV83746', NULL, NULL, 'This is hello hi\'s apartment in Fantastic Plaza', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Fantastic Plaza', '[]', '[]'),
	(24, 'RIR14294', NULL, NULL, 'This is 111 111\'s apartment in Fantastic Plaza', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Fantastic Plaza', '[]', '[]'),
	(25, 'CEF69772', NULL, NULL, 'This is ss ss\'s apartment in Morningwood Blvd', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Morningwood Blvd', '[]', '[]'),
	(26, 'UUP96298', NULL, NULL, 'This is abo ahmed\'s apartment in Fantastic Plaza', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Fantastic Plaza', '[]', '[]'),
	(27, 'JOW98010', NULL, NULL, 'This is Ahmed Khaleel\'s apartment in Tinsel Towers', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Tinsel Towers', '[]', '[]'),
	(28, 'CMD01952', NULL, NULL, 'This is saif aa\'s apartment in South Rockford Drive', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'South Rockford Drive', '[]', '[]'),
	(29, 'NHV10602', NULL, NULL, 'This is DSA ASD\'s apartment in Integrity Way', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Integrity Way', '[]', '[]'),
	(30, 'WUK08631', NULL, NULL, 'This is فيقل ثفيقل\'s apartment in Morningwood Blvd', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Morningwood Blvd', '[]', '[]'),
	(31, 'MEL43722', NULL, NULL, 'This is dev dev\'s apartment in Fantastic Plaza', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Fantastic Plaza', '[]', '[]'),
	(32, 'LQB23255', NULL, NULL, 'This is A A\'s apartment in Morningwood Blvd', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Morningwood Blvd', '[]', '[]'),
	(33, 'EVY21770', NULL, NULL, 'This is M7F a\'s apartment in Tinsel Towers', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Tinsel Towers', '[]', '[]'),
	(34, 'AVE81303', NULL, NULL, 'This is jerry co\'s apartment in Fantastic Plaza', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Fantastic Plaza', '[]', '[]');

-- Dumping structure for table nmsh.racer_names
CREATE TABLE IF NOT EXISTS `racer_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `racername` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lasttouched` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `races` int(11) NOT NULL DEFAULT 0,
  `wins` int(11) NOT NULL DEFAULT 0,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.racer_names: ~0 rows (approximately)

-- Dumping structure for table nmsh.race_tracks
CREATE TABLE IF NOT EXISTS `race_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creatorid` varchar(50) DEFAULT NULL,
  `creatorname` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  `access` text DEFAULT '{}',
  `curated` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `raceid` (`raceid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.race_tracks: ~0 rows (approximately)

-- Dumping structure for table nmsh.renzu_customs
CREATE TABLE IF NOT EXISTS `renzu_customs` (
  `shop` varchar(64) NOT NULL DEFAULT '[]',
  `inventory` longtext DEFAULT '[]',
  PRIMARY KEY (`shop`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.renzu_customs: ~2 rows (approximately)
INSERT INTO `renzu_customs` (`shop`, `inventory`) VALUES
	('Bennys', '[]'),
	('Custom Garage', '[]');

-- Dumping structure for table nmsh.renzu_motels
CREATE TABLE IF NOT EXISTS `renzu_motels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motel` varchar(64) DEFAULT NULL,
  `hour_rate` int(11) DEFAULT 0,
  `revenue` int(11) DEFAULT 0,
  `employees` longtext DEFAULT NULL,
  `rooms` longtext DEFAULT NULL,
  `owned` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.renzu_motels: ~3 rows (approximately)
INSERT INTO `renzu_motels` (`id`, `motel`, `hour_rate`, `revenue`, `employees`, `rooms`, `owned`) VALUES
	(1, 'hotelmodern3', 0, 5000, '[]', '[{"players":{"IIV39976":{"name":"Nmsh","duration":1689865691}},"lock":true}]', '0'),
	(2, 'pinkcage', 0, 0, '[]', '[{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]},{"lock":true,"players":[]}]', 'IIV39976'),
	(3, 'yacht', 0, 0, '[]', '[{"lock":true,"players":[]}]', '0');

-- Dumping structure for table nmsh.renzu_stores
CREATE TABLE IF NOT EXISTS `renzu_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop` varchar(60) DEFAULT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `money` longtext DEFAULT NULL,
  `items` longtext DEFAULT NULL,
  `employee` longtext DEFAULT NULL,
  `cashier` longtext DEFAULT NULL,
  `customitems` longtext DEFAULT NULL,
  `job` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.renzu_stores: ~2 rows (approximately)
INSERT INTO `renzu_stores` (`id`, `shop`, `owner`, `money`, `items`, `employee`, `cashier`, `customitems`, `job`) VALUES
	(1, 'PoliceArmoury 1', 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', '{"money":0,"black_money":0}', '{"custom":[],"normal":{"WEAPON_SPECIALCARBINE":{"stock":100},"WEAPON_PISTOL50":{"stock":100},"WEAPON_FLASHLIGHT":{"stock":100},"ammo-9":{"stock":100},"WEAPON_NIGHTSTICK":{"stock":100},"WEAPON_PISTOL":{"stock":100},"armour":{"stock":100},"vision_helmet":{"stock":100},"WEAPON_BZGAS":{"stock":100},"WEAPON_PUMPSHOTGUN":{"stock":100},"WEAPON_COMBATPDW":{"stock":100},"ammo-50":{"stock":100},"thermal_helmet":{"stock":100},"ammo-rifle":{"stock":100},"energy_drink":{"stock":100},"ammo-rifle2":{"stock":100},"WEAPON_STUNGUN":{"stock":100},"ammo-45":{"stock":100},"ammo-shotgun":{"stock":100},"radio":{"stock":100},"WEAPON_CARBINERIFLE":{"stock":100}}}', '[]', '{"money":0,"black_money":0}', '[]', NULL),
	(2, 'General Store #1', 'license:7e0ee62eeebe08a80906473f741dc2c65bd1821d', '{"money":100000,"black_money":0}', '{"normal":{"carrot_seed":{"stock":100},"garden_pitcher":{"stock":100},"bread":{"stock":100},"water":{"stock":100},"hotdog":{"stock":100},"fish":{"stock":100},"corn_seed":{"stock":100},"burgerpatty":{"stock":100},"donut":{"stock":100},"latte":{"stock":100},"tomatosauce":{"stock":100},"garden_shovel":{"stock":100},"tacoshells":{"stock":100},"mayonaise":{"stock":100},"fishingrod":{"stock":100},"coffee":{"stock":100},"ground_beef":{"stock":100},"potato_seed":{"stock":100},"chicken":{"stock":90},"martini":{"stock":100},"onion":{"stock":100},"radio":{"stock":100},"tomato":{"stock":100},"wheat_seed":{"stock":100},"pickle_seed":{"stock":100},"lighter":{"stock":100},"tacosauce":{"stock":100},"lettuce":{"stock":100},"pasta":{"stock":100},"sandwich":{"stock":94},"redw":{"stock":100},"cola":{"stock":100},"beef":{"stock":100},"marlboro":{"stock":100},"phone":{"stock":100},"cheese":{"stock":100},"burger":{"stock":100},"tomato_seed":{"stock":100},"hotsauce":{"stock":100},"fishbait":{"stock":100}},"custom":{"angelsburger":{"stock":100},"blackmarketbooth":{"stock":100},"cheeseburger":{"stock":100},"marketbooth":{"stock":100}}}', '[]', '{"black_money":0,"money":230}', '[]', NULL);

-- Dumping structure for table nmsh.renzu_tuner
CREATE TABLE IF NOT EXISTS `renzu_tuner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(60) DEFAULT NULL,
  `mileages` int(11) DEFAULT 0,
  `vehiclestats` longtext DEFAULT NULL,
  `defaulthandling` longtext DEFAULT NULL,
  `vehicleupgrades` longtext DEFAULT NULL,
  `vehicletires` longtext DEFAULT NULL,
  `drivetrain` varchar(60) DEFAULT NULL,
  `advancedflags` longtext DEFAULT NULL,
  `ecu` longtext DEFAULT NULL,
  `currentengine` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.renzu_tuner: ~60 rows (approximately)
INSERT INTO `renzu_tuner` (`id`, `plate`, `mileages`, `vehiclestats`, `defaulthandling`, `vehicleupgrades`, `vehicletires`, `drivetrain`, `advancedflags`, `ecu`, `currentengine`) VALUES
	(1, '61LYB624', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"61LYB624","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.20000004768371,"fHandBrakeForce":0.55000001192092}', '[]', NULL, NULL, NULL, NULL, NULL),
	(2, '60SXO369', 0, '{"engine_flywheel":100.03000000000002,"engine_block":100.03000000000002,"oem_brakes":100.03000000000002,"engine_sparkplug":100.03000000000002,"oem_suspension":100.03000000000002,"engine_oil":100.03000000000002,"engine_pistons":100.03000000000002,"engine_fuelinjector":100.03000000000002,"transmition_clutch":100.03000000000002,"engine_gasket":100.03000000000002,"engine_airfilter":100.03000000000002,"engine_valves":100.03000000000002,"engine_camshaft":100.03000000000002,"engine_crankshaft":100.03000000000002,"engine_connectingrods":100.03000000000002,"plate":"60SXO369","oem_gearbox":100.03000000000002}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.20000004768371,"fHandBrakeForce":0.55000001192092}', '[]', NULL, NULL, NULL, NULL, NULL),
	(3, '02EZW184', 17, '{"engine_flywheel":99.90833982899788,"engine_block":99.90833982899788,"oem_brakes":99.90833982899788,"engine_sparkplug":99.90833982899788,"oem_suspension":99.90833982899788,"engine_oil":99.90833982899788,"engine_pistons":99.90833982899788,"engine_fuelinjector":99.90833982899788,"transmition_clutch":99.90833982899788,"engine_gasket":99.90833982899788,"engine_airfilter":99.90833982899788,"engine_valves":99.90833982899788,"engine_camshaft":99.90833982899788,"engine_crankshaft":99.90833982899788,"engine_connectingrods":99.90833982899788,"plate":"02EZW184","oem_gearbox":99.90833982899788}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.20000004768371,"fHandBrakeForce":0.55000001192092}', '[]', NULL, NULL, '{"strAdvancedFlags":{"flags":32768,"installed":{"15":"8000"}}}', NULL, NULL),
	(4, '24CON808', 0, '{"engine_flywheel":100.02,"engine_block":100.02,"oem_brakes":100.02,"engine_sparkplug":100.02,"oem_suspension":100.02,"engine_oil":100.02,"engine_pistons":100.02,"engine_fuelinjector":100.02,"transmition_clutch":100.02,"engine_gasket":100.02,"engine_airfilter":100.02,"engine_valves":100.02,"engine_camshaft":100.02,"engine_crankshaft":100.02,"engine_connectingrods":100.02,"plate":"24CON808","oem_gearbox":100.02}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.20000004768371,"fHandBrakeForce":0.55000001192092}', '[]', NULL, NULL, NULL, NULL, NULL),
	(5, '85PTW563', 0, '{"engine_flywheel":99.94484251634822,"engine_block":99.94484251634822,"oem_brakes":99.94484251634822,"engine_sparkplug":100.02152503029048,"oem_suspension":99.94484251634822,"engine_oil":99.99152503029048,"engine_pistons":99.99152503029048,"engine_fuelinjector":99.99152503029048,"transmition_clutch":99.94484251634822,"engine_gasket":99.99152503029048,"engine_airfilter":99.99152503029048,"engine_valves":99.94484251634822,"engine_camshaft":99.94484251634822,"engine_crankshaft":99.94484251634822,"engine_connectingrods":99.94484251634822,"plate":"85PTW563","oem_gearbox":99.94484251634822}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.20000004768371,"fHandBrakeForce":0.55000001192092}', '{"elite_pistons":true,"elite_airfilter":true,"elite_oil":true,"elite_gasket":true,"elite_fuelinjector":true,"elite_sparkplug":true}', NULL, NULL, NULL, '{"Default":{"boostpergear":[1.0,1.0,1.0,1.0,1.0],"profile":"Default","acceleration":1.0,"engineresponse":1.0,"gear_response":1.0,"topspeed":1.0},"active":{"boostpergear":[1.0,1.0,1.0,1.0,1.0],"profile":"Default","acceleration":1.0,"engineresponse":1.0,"gear_response":1.0,"topspeed":1.0}}', NULL),
	(6, '03LDX089', 110, '{"engine_flywheel":99.36541320048278,"engine_block":99.36541320048278,"oem_brakes":99.36541320048278,"engine_sparkplug":99.36541320048278,"oem_suspension":99.36541320048278,"engine_oil":99.36541320048278,"engine_pistons":99.36541320048278,"engine_fuelinjector":99.36541320048278,"transmition_clutch":99.36541320048278,"engine_gasket":99.36541320048278,"engine_airfilter":99.36541320048278,"engine_valves":99.36541320048278,"engine_camshaft":99.36541320048278,"engine_crankshaft":99.36541320048278,"engine_connectingrods":99.36541320048278,"plate":"03LDX089","oem_gearbox":99.36541320048278}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fTractionCurveLateral":22.5,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.20000004768371,"fHandBrakeForce":0.55000001192092}', '[]', NULL, NULL, NULL, NULL, NULL),
	(7, '82ZVF236', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"82ZVF236","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":300.0,"fInitialDriveForce":0.30099999904632,"fSuspensionReboundDamp":3.20000028610229,"fAntiRollBarBiasFront":0.5,"fAntiRollBarForce":1.0,"fSuspensionCompDamp":1.29999995231628,"fTractionCurveMax":3.79999995231628,"fClutchChangeRateScaleDownShift":2.0,"fSuspensionForce":1.60000002384185,"fRollCentreHeightRear":0.26499998569488,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.34999999403953,"fDriveInertia":1.0,"fBrakeForce":1.20000004768371,"fLowSpeedTractionLossMult":0.0,"fSuspensionLowerLimit":-0.07999999821186,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.05000000074505,"fTractionLossMult":0.0,"nInitialDriveGears":7,"fTractionCurveMin":3.59999990463256,"fClutchChangeRateScaleUpShift":2.0,"fHandBrakeForce":1.45000004768371}', '[]', NULL, NULL, NULL, NULL, NULL),
	(8, '61CLT792', 11, '{"engine_flywheel":99.9082015760988,"engine_block":99.9082015760988,"oem_brakes":99.9082015760988,"engine_sparkplug":99.9082015760988,"oem_suspension":99.9082015760988,"engine_oil":99.9082015760988,"engine_pistons":99.9082015760988,"engine_fuelinjector":99.9082015760988,"transmition_clutch":99.9082015760988,"engine_gasket":99.9082015760988,"engine_airfilter":99.9082015760988,"engine_valves":99.9082015760988,"engine_camshaft":99.9082015760988,"engine_crankshaft":99.9082015760988,"engine_connectingrods":99.9082015760988,"plate":"61CLT792","oem_gearbox":99.9082015760988}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.20000004768371,"fHandBrakeForce":0.55000001192092}', '[]', NULL, NULL, NULL, NULL, NULL),
	(9, '64IKF581', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"64IKF581","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":145.0,"fInitialDriveForce":0.28000000119209,"fSuspensionReboundDamp":1.29999995231628,"fAntiRollBarBiasFront":0.56999999284744,"fAntiRollBarForce":0.30000001192092,"fSuspensionCompDamp":0.80000007152557,"fTractionCurveMax":2.20000004768371,"fClutchChangeRateScaleDownShift":1.79999995231628,"fSuspensionForce":1.89999997615814,"fRollCentreHeightRear":0.5,"fTractionCurveLateral":20.5,"fRollCentreHeightFront":0.5,"fDriveInertia":1.0,"fBrakeForce":0.80000001192092,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.10000000149011,"fSuspensionBiasFront":0.49000000953674,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":1.79999995231628,"fClutchChangeRateScaleUpShift":1.79999995231628,"fHandBrakeForce":0.80000001192092}', '[]', NULL, NULL, NULL, NULL, NULL),
	(10, '42DFZ104', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"42DFZ104","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":133.0,"fInitialDriveForce":0.23000000417232,"fSuspensionReboundDamp":2.40000009536743,"fAntiRollBarBiasFront":0.43999999761581,"fAntiRollBarForce":1.20000004768371,"fSuspensionCompDamp":1.29999995231628,"fTractionCurveMax":2.04999995231628,"fClutchChangeRateScaleDownShift":1.79999995231628,"fSuspensionForce":2.20000004768371,"fRollCentreHeightRear":0.43999999761581,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.43000000715255,"fDriveInertia":1.0,"fBrakeForce":0.60000002384185,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.10000000149011,"fSuspensionBiasFront":0.51999998092651,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":1.72000002861022,"fClutchChangeRateScaleUpShift":1.79999995231628,"fHandBrakeForce":0.44999998807907}', '[]', NULL, NULL, NULL, NULL, NULL),
	(11, '02PHX831', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"02PHX831","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":132.0,"fInitialDriveForce":0.23000000417232,"fSuspensionReboundDamp":2.40000009536743,"fAntiRollBarBiasFront":0.34999999403953,"fAntiRollBarForce":1.0,"fSuspensionCompDamp":1.29999995231628,"fTractionCurveMax":2.09999990463256,"fClutchChangeRateScaleDownShift":1.70000004768371,"fSuspensionForce":2.20000004768371,"fRollCentreHeightRear":0.14000000059604,"fTractionCurveLateral":21.5,"fRollCentreHeightFront":0.15999999642372,"fDriveInertia":1.0,"fBrakeForce":0.55000001192092,"fLowSpeedTractionLossMult":0.69999998807907,"fSuspensionLowerLimit":-0.10000000149011,"fSuspensionBiasFront":0.51999998092651,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":1.75,"fClutchChangeRateScaleUpShift":1.70000004768371,"fHandBrakeForce":0.40000000596046}', '[]', NULL, NULL, NULL, NULL, NULL),
	(12, '84LGE829', 22, '{"engine_flywheel":99.7696369946748,"engine_block":99.7696369946748,"oem_brakes":99.7696369946748,"engine_sparkplug":99.7696369946748,"oem_suspension":99.7696369946748,"engine_oil":99.7696369946748,"engine_pistons":99.7696369946748,"engine_fuelinjector":99.7696369946748,"transmition_clutch":99.7696369946748,"engine_gasket":99.7696369946748,"engine_airfilter":99.7696369946748,"engine_valves":99.7696369946748,"engine_camshaft":99.7696369946748,"engine_crankshaft":99.7696369946748,"engine_connectingrods":99.7696369946748,"plate":"84LGE829","oem_gearbox":99.7696369946748}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.29999995231628,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fHandBrakeForce":0.55000001192092,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.10000000149011,"fClutchChangeRateScaleUpShift":2.20000004768371,"fSuspensionLowerLimit":-0.11999999731779}', '[]', NULL, NULL, NULL, NULL, NULL),
	(13, '20VRJ408', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"20VRJ408","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.29999995231628,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fHandBrakeForce":0.55000001192092,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.10000000149011,"fClutchChangeRateScaleUpShift":2.20000004768371,"fSuspensionLowerLimit":-0.11999999731779}', '[]', NULL, NULL, NULL, NULL, NULL),
	(14, '26LXN727', 0, '{"engine_flywheel":99.99026581011714,"engine_block":99.99026581011714,"oem_brakes":99.99026581011714,"engine_sparkplug":99.99026581011714,"oem_suspension":99.99026581011714,"engine_oil":99.99026581011714,"engine_pistons":99.99026581011714,"engine_fuelinjector":99.99026581011714,"transmition_clutch":99.99026581011714,"engine_gasket":99.99026581011714,"engine_airfilter":99.99026581011714,"engine_valves":99.99026581011714,"engine_camshaft":99.99026581011714,"engine_crankshaft":99.99026581011714,"engine_connectingrods":99.99026581011714,"plate":"26LXN727","oem_gearbox":99.99026581011714}', '{"fInitialDriveMaxFlatVel":147.0,"fInitialDriveForce":0.23499999940395,"fSuspensionReboundDamp":2.70000004768371,"fAntiRollBarBiasFront":0.62999999523162,"fAntiRollBarForce":0.60000002384185,"fSuspensionCompDamp":1.5,"fTractionCurveMax":2.04999995231628,"fClutchChangeRateScaleDownShift":1.60000002384185,"fSuspensionForce":2.84999990463256,"fRollCentreHeightRear":0.40000000596046,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.34999999403953,"fDriveInertia":1.0,"fBrakeForce":0.64999997615814,"fTractionCurveLateral":20.0,"fTractionCurveMin":1.70000004768371,"fSuspensionBiasFront":0.44999998807907,"fSuspensionRaise":0.0,"fHandBrakeForce":1.20000004768371,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.18000000715255,"fClutchChangeRateScaleUpShift":1.60000002384185,"fSuspensionLowerLimit":-0.15000000596046}', '[]', NULL, NULL, NULL, NULL, NULL),
	(15, '05PRP125', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"05PRP125","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":127.0,"fInitialDriveForce":0.20000000298023,"fSuspensionReboundDamp":2.59999990463256,"fAntiRollBarBiasFront":0.62000000476837,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.39999997615814,"fTractionCurveMax":1.89999997615814,"fClutchChangeRateScaleDownShift":1.89999997615814,"fSuspensionForce":2.0,"fRollCentreHeightRear":0.43999999761581,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.47999998927116,"fDriveInertia":1.0,"fBrakeForce":0.60000002384185,"fTractionCurveLateral":20.0,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionLowerLimit":-0.18000000715255,"fSuspensionBiasFront":0.51999998092651,"fSuspensionRaise":0.0,"fTractionLossMult":0.89999997615814,"nInitialDriveGears":4,"fTractionCurveMin":1.60000002384185,"fClutchChangeRateScaleUpShift":1.89999997615814,"fHandBrakeForce":0.40000000596046}', '[]', NULL, NULL, NULL, NULL, NULL),
	(16, '68UUW814', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"68UUW814","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":300.0,"fInitialDriveForce":0.30099999904632,"fSuspensionReboundDamp":3.20000028610229,"fAntiRollBarBiasFront":0.5,"fAntiRollBarForce":1.0,"fSuspensionCompDamp":1.29999995231628,"fTractionCurveMax":3.79999995231628,"fClutchChangeRateScaleDownShift":2.0,"fSuspensionForce":1.60000002384185,"fRollCentreHeightRear":0.26499998569488,"fLowSpeedTractionLossMult":0.0,"fRollCentreHeightFront":0.34999999403953,"fDriveInertia":1.0,"fBrakeForce":1.20000004768371,"fTractionCurveLateral":22.5,"fSuspensionUpperLimit":0.05000000074505,"fSuspensionLowerLimit":-0.07999999821186,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fTractionLossMult":0.0,"nInitialDriveGears":7,"fTractionCurveMin":3.59999990463256,"fClutchChangeRateScaleUpShift":2.0,"fHandBrakeForce":1.45000004768371}', '[]', NULL, NULL, NULL, NULL, NULL),
	(17, '26ROZ750', 28, '{"engine_flywheel":99.91996089234952,"engine_block":99.91996089234952,"oem_brakes":99.91996089234952,"engine_sparkplug":99.91996089234952,"oem_suspension":99.91996089234952,"engine_oil":99.91996089234952,"engine_pistons":99.91996089234952,"engine_fuelinjector":99.91996089234952,"transmition_clutch":99.91996089234952,"engine_gasket":99.91996089234952,"engine_airfilter":99.91996089234952,"engine_valves":99.91996089234952,"engine_camshaft":99.91996089234952,"engine_crankshaft":99.91996089234952,"engine_connectingrods":99.91996089234952,"plate":"26ROZ750","oem_gearbox":99.91996089234952}', '{"fInitialDriveMaxFlatVel":148.0000152587891,"fInitialDriveForce":0.40500000119209,"fSuspensionReboundDamp":5.0,"fAntiRollBarBiasFront":0.0,"fAntiRollBarForce":0.0,"fSuspensionCompDamp":2.5,"fTractionCurveMax":2.15000009536743,"fClutchChangeRateScaleDownShift":2.0,"fSuspensionForce":7.5,"fRollCentreHeightRear":0.25,"fLowSpeedTractionLossMult":0.80000001192092,"fRollCentreHeightFront":0.25,"fDriveInertia":1.0,"fBrakeForce":1.20000004768371,"fTractionCurveLateral":22.5,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionLowerLimit":-0.15999999642372,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.13000011444091,"fClutchChangeRateScaleUpShift":2.0,"fHandBrakeForce":1.29999995231628}', '[]', NULL, NULL, NULL, NULL, NULL),
	(18, '81TVD896', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"81TVD896","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fBrakeForce":0.85000002384185,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fSuspensionReboundDamp":2.20000004768371,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fTractionCurveLateral":22.5,"fSuspensionRaise":0.0,"fHandBrakeForce":0.55000001192092,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.10000000149011,"fClutchChangeRateScaleUpShift":2.20000004768371,"fTractionCurveMin":2.29999995231628}', '[]', NULL, NULL, NULL, NULL, NULL),
	(19, '49ZOK797', 11, '{"engine_flywheel":99.98736199364066,"engine_block":99.98736199364066,"oem_brakes":99.98736199364066,"engine_sparkplug":99.98736199364066,"oem_suspension":99.98736199364066,"engine_oil":99.98736199364066,"engine_pistons":99.98736199364066,"engine_fuelinjector":99.98736199364066,"transmition_clutch":99.98736199364066,"engine_gasket":99.98736199364066,"engine_airfilter":99.98736199364066,"engine_valves":99.98736199364066,"engine_camshaft":99.98736199364066,"engine_crankshaft":99.98736199364066,"engine_connectingrods":99.98736199364066,"plate":"49ZOK797","oem_gearbox":99.98736199364066}', '{"fInitialDriveMaxFlatVel":145.0,"fInitialDriveForce":0.28999999165534,"fSuspensionReboundDamp":2.09999990463256,"fAntiRollBarBiasFront":0.52999997138977,"fAntiRollBarForce":1.10000002384185,"fSuspensionCompDamp":1.20000004768371,"fTractionCurveMax":2.5,"fClutchChangeRateScaleDownShift":2.0,"fSuspensionForce":2.29999995231628,"fRollCentreHeightRear":0.36000001430511,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.34999999403953,"fDriveInertia":1.0,"fBrakeForce":0.89999997615814,"fTractionCurveLateral":22.0,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fTractionLossMult":1.0,"nInitialDriveGears":6,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.0,"fHandBrakeForce":0.60000002384185}', '[]', NULL, NULL, NULL, NULL, NULL),
	(20, '49HPH622', 33, '{"engine_flywheel":99.93006262227894,"engine_block":99.93006262227894,"oem_brakes":99.93006262227894,"engine_sparkplug":99.93006262227894,"oem_suspension":99.93006262227894,"engine_oil":99.93006262227894,"engine_pistons":99.93006262227894,"engine_fuelinjector":99.93006262227894,"transmition_clutch":99.93006262227894,"engine_gasket":99.93006262227894,"engine_airfilter":99.93006262227894,"engine_valves":99.93006262227894,"engine_camshaft":99.93006262227894,"engine_crankshaft":99.93006262227894,"engine_connectingrods":99.93006262227894,"plate":"49HPH622","oem_gearbox":99.93006262227894}', '{"fInitialDriveMaxFlatVel":130.0000152587891,"fInitialDriveForce":0.20000000298023,"fSuspensionReboundDamp":3.30000019073486,"fAntiRollBarBiasFront":0.64999997615814,"fAntiRollBarForce":0.32499998807907,"fSuspensionCompDamp":1.10000002384185,"fTractionCurveMax":2.13000011444091,"fClutchChangeRateScaleDownShift":1.60000002384185,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.25999999046325,"fLowSpeedTractionLossMult":1.60000002384185,"fRollCentreHeightFront":0.25999999046325,"fDriveInertia":1.0,"fBrakeForce":0.69999998807907,"fTractionCurveLateral":22.5,"fSuspensionUpperLimit":0.17000000178813,"fSuspensionLowerLimit":-0.20000000298023,"fSuspensionBiasFront":0.43999999761581,"fSuspensionRaise":0.0,"fTractionLossMult":0.0,"nInitialDriveGears":5,"fTractionCurveMin":1.95000004768371,"fClutchChangeRateScaleUpShift":1.60000002384185,"fHandBrakeForce":0.44999998807907}', '[]', NULL, NULL, NULL, NULL, NULL),
	(21, '82BTX917', 22, '{"engine_flywheel":99.84265668720006,"engine_block":99.84265668720006,"oem_brakes":99.84265668720006,"engine_sparkplug":99.84265668720006,"oem_suspension":99.84265668720006,"engine_oil":99.84265668720006,"engine_pistons":99.84265668720006,"engine_fuelinjector":99.84265668720006,"transmition_clutch":99.84265668720006,"engine_gasket":99.84265668720006,"engine_airfilter":99.84265668720006,"engine_valves":99.84265668720006,"engine_camshaft":99.84265668720006,"engine_crankshaft":99.84265668720006,"engine_connectingrods":99.84265668720006,"plate":"82BTX917","oem_gearbox":99.84265668720006}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fTractionCurveLateral":22.5,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.20000004768371,"fHandBrakeForce":0.55000001192092}', '[]', NULL, NULL, NULL, NULL, NULL),
	(22, '42ATI236', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"42ATI236","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":139.0000152587891,"fInitialDriveForce":0.18999999761581,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.52999997138977,"fAntiRollBarForce":1.0,"fSuspensionCompDamp":1.20000004768371,"fTractionCurveMax":2.09999990463256,"fClutchChangeRateScaleDownShift":1.79999995231628,"fSuspensionForce":2.09999990463256,"fRollCentreHeightRear":0.55000001192092,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.55000001192092,"fDriveInertia":1.0,"fBrakeForce":0.25,"fTractionCurveLateral":21.0,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionLowerLimit":-0.18000000715255,"fSuspensionBiasFront":0.52999997138977,"fSuspensionRaise":0.0,"fTractionLossMult":0.94999998807907,"nInitialDriveGears":5,"fTractionCurveMin":1.89999997615814,"fClutchChangeRateScaleUpShift":1.79999995231628,"fHandBrakeForce":0.44999998807907}', '[]', NULL, NULL, NULL, NULL, NULL),
	(23, '23XFI383', 0, '{"engine_flywheel":99.98601491987708,"engine_block":99.98601491987708,"oem_brakes":99.98601491987708,"engine_sparkplug":99.98601491987708,"oem_suspension":99.98601491987708,"engine_oil":99.98601491987708,"engine_pistons":99.98601491987708,"engine_fuelinjector":99.98601491987708,"transmition_clutch":99.98601491987708,"engine_gasket":99.98601491987708,"engine_airfilter":99.98601491987708,"engine_valves":99.98601491987708,"engine_camshaft":99.98601491987708,"engine_crankshaft":99.98601491987708,"engine_connectingrods":99.98601491987708,"plate":"23XFI383","oem_gearbox":99.98601491987708}', '{"fInitialDriveMaxFlatVel":168.0,"fInitialDriveForce":0.33500000834465,"fSuspensionReboundDamp":2.29999995231628,"fAntiRollBarBiasFront":0.52999997138977,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.5,"fTractionCurveMax":2.65000009536743,"fClutchChangeRateScaleDownShift":4.0,"fSuspensionForce":2.59999990463256,"fRollCentreHeightRear":0.18000000715255,"fLowSpeedTractionLossMult":1.29999995231628,"fRollCentreHeightFront":0.18000000715255,"fDriveInertia":1.0,"fBrakeForce":0.80000001192092,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.54999995231628,"fSuspensionBiasFront":0.49000000953674,"fSuspensionRaise":0.0,"fHandBrakeForce":0.51999998092651,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.03999999910593,"fClutchChangeRateScaleUpShift":4.0,"fSuspensionLowerLimit":-0.09000000357627}', '[]', NULL, NULL, NULL, NULL, NULL),
	(24, '40RBZ435', 0, '{"engine_flywheel":100.02,"engine_block":100.02,"oem_brakes":100.02,"engine_sparkplug":100.02,"oem_suspension":100.02,"engine_oil":100.02,"engine_pistons":100.02,"engine_fuelinjector":100.02,"transmition_clutch":100.02,"engine_gasket":100.02,"engine_airfilter":100.02,"engine_valves":100.02,"engine_camshaft":100.02,"engine_crankshaft":100.02,"engine_connectingrods":100.02,"plate":"40RBZ435","oem_gearbox":100.02}', '{"fInitialDriveMaxFlatVel":120.00000762939452,"fInitialDriveForce":0.11999999731779,"fSuspensionReboundDamp":0.80000007152557,"fAntiRollBarBiasFront":0.5,"fAntiRollBarForce":0.0,"fSuspensionCompDamp":1.20000004768371,"fTractionCurveMax":1.25,"fClutchChangeRateScaleDownShift":1.0,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.0,"fLowSpeedTractionLossMult":0.0,"fRollCentreHeightFront":0.0,"fDriveInertia":0.80000001192092,"fBrakeForce":0.23999999463558,"fTractionCurveLateral":15.29999923706054,"fTractionCurveMin":1.0,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.00999999977648,"fHandBrakeForce":0.69999998807907,"fTractionLossMult":1.5,"nInitialDriveGears":4,"fSuspensionUpperLimit":0.05000000074505,"fClutchChangeRateScaleUpShift":1.20000004768371,"fSuspensionLowerLimit":-0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(25, '29JIX193', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"29JIX193","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.29999995231628,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fHandBrakeForce":0.55000001192092,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.10000000149011,"fClutchChangeRateScaleUpShift":2.20000004768371,"fSuspensionLowerLimit":-0.11999999731779}', '[]', NULL, NULL, NULL, NULL, NULL),
	(26, '23VCH323', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"23VCH323","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":148.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.25,"fAntiRollBarForce":0.55000001192092,"fSuspensionCompDamp":1.39999997615814,"fTractionCurveMax":2.5,"fClutchChangeRateScaleDownShift":6.0,"fSuspensionForce":2.79999995231628,"fRollCentreHeightRear":0.25,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.23999999463558,"fDriveInertia":1.0,"fBrakeForce":1.0,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.15000009536743,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":0.69999998807907,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.05999999865889,"fClutchChangeRateScaleUpShift":6.0,"fSuspensionLowerLimit":-0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(27, '27QVY170', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"27QVY170","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":305.29998779296877,"fInitialDriveForce":0.46500000357627,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.60000002384185,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.5,"fTractionCurveMax":2.6800000667572,"fClutchChangeRateScaleDownShift":6.0,"fSuspensionForce":2.65000009536743,"fRollCentreHeightRear":0.34000000357627,"fLowSpeedTractionLossMult":1.29999995231628,"fRollCentreHeightFront":0.34000000357627,"fDriveInertia":1.0,"fBrakeForce":3.09999990463256,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.54999995231628,"fSuspensionBiasFront":0.51999998092651,"fSuspensionRaise":0.0,"fHandBrakeForce":0.5,"fTractionLossMult":1.0,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.05000000074505,"fClutchChangeRateScaleUpShift":7.0,"fSuspensionLowerLimit":-0.10999999940395}', '[]', NULL, NULL, NULL, NULL, NULL),
	(28, '08CQL391', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"08CQL391","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":168.0,"fInitialDriveForce":0.33500000834465,"fSuspensionReboundDamp":2.29999995231628,"fAntiRollBarBiasFront":0.52999997138977,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.5,"fTractionCurveMax":2.65000009536743,"fClutchChangeRateScaleDownShift":4.0,"fSuspensionForce":2.59999990463256,"fRollCentreHeightRear":0.18000000715255,"fLowSpeedTractionLossMult":1.29999995231628,"fRollCentreHeightFront":0.18000000715255,"fDriveInertia":1.0,"fBrakeForce":0.80000001192092,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.54999995231628,"fSuspensionBiasFront":0.49000000953674,"fSuspensionRaise":0.0,"fHandBrakeForce":0.51999998092651,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.03999999910593,"fClutchChangeRateScaleUpShift":4.0,"fSuspensionLowerLimit":-0.09000000357627}', '[]', NULL, NULL, NULL, NULL, NULL),
	(29, '62SXZ762', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"62SXZ762","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":191.0,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.40000009536743,"fAntiRollBarBiasFront":0.44999998807907,"fAntiRollBarForce":1.20000004768371,"fSuspensionCompDamp":1.39999997615814,"fTractionCurveMax":2.29999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.20000004768371,"fRollCentreHeightRear":0.10000000149011,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.10000000149011,"fDriveInertia":1.0,"fBrakeForce":1.39999997615814,"fTractionCurveLateral":20.5,"fTractionCurveMin":2.04999995231628,"fSuspensionBiasFront":0.44999998807907,"fSuspensionRaise":0.0,"fHandBrakeForce":1.45000004768371,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.09000000357627,"fClutchChangeRateScaleUpShift":2.20000004768371,"fSuspensionLowerLimit":-0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(30, '66GHF197', 0, '{"engine_flywheel":100.02,"engine_block":100.02,"oem_brakes":100.02,"engine_sparkplug":100.02,"oem_suspension":100.02,"engine_oil":100.02,"engine_pistons":100.02,"engine_fuelinjector":100.02,"transmition_clutch":100.02,"engine_gasket":100.02,"engine_airfilter":100.02,"engine_valves":100.02,"engine_camshaft":100.02,"engine_crankshaft":100.02,"engine_connectingrods":100.02,"plate":"66GHF197","oem_gearbox":100.02}', '{"fInitialDriveMaxFlatVel":147.0,"fInitialDriveForce":0.28999999165534,"fSuspensionReboundDamp":1.79999995231628,"fAntiRollBarBiasFront":0.44999998807907,"fAntiRollBarForce":0.40000000596046,"fSuspensionCompDamp":1.10000002384185,"fTractionCurveMax":2.29999995231628,"fClutchChangeRateScaleDownShift":2.0,"fSuspensionForce":2.0,"fRollCentreHeightRear":0.09000000357627,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.07999999821186,"fDriveInertia":1.0,"fBrakeForce":0.89999997615814,"fTractionCurveLateral":22.5,"fTractionCurveMin":1.95000004768371,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":0.60000002384185,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.05000000074505,"fClutchChangeRateScaleUpShift":2.0,"fSuspensionLowerLimit":-0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(31, '85AEA862', 0, '{"engine_flywheel":100.00148756168784,"engine_block":100.00148756168784,"oem_brakes":100.00148756168784,"engine_sparkplug":100.00148756168784,"oem_suspension":100.00148756168784,"engine_oil":100.00148756168784,"engine_pistons":100.00148756168784,"engine_fuelinjector":100.00148756168784,"transmition_clutch":100.00148756168784,"engine_gasket":100.00148756168784,"engine_airfilter":100.00148756168784,"engine_valves":100.00148756168784,"engine_camshaft":100.00148756168784,"engine_crankshaft":100.00148756168784,"engine_connectingrods":100.00148756168784,"plate":"85AEA862","oem_gearbox":100.00148756168784}', '{"fInitialDriveMaxFlatVel":147.0,"fInitialDriveForce":0.28999999165534,"fSuspensionReboundDamp":1.79999995231628,"fAntiRollBarBiasFront":0.44999998807907,"fAntiRollBarForce":0.40000000596046,"fSuspensionCompDamp":1.10000002384185,"fTractionCurveMax":2.29999995231628,"fClutchChangeRateScaleDownShift":2.0,"fSuspensionForce":2.0,"fRollCentreHeightRear":0.09000000357627,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.07999999821186,"fDriveInertia":1.0,"fBrakeForce":0.89999997615814,"fTractionCurveLateral":22.5,"fTractionCurveMin":1.95000004768371,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":0.60000002384185,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.05000000074505,"fClutchChangeRateScaleUpShift":2.0,"fSuspensionLowerLimit":-0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(32, '42HRF546', 0, '{"engine_flywheel":100.02,"engine_block":100.02,"oem_brakes":100.02,"engine_sparkplug":100.02,"oem_suspension":100.02,"engine_oil":100.02,"engine_pistons":100.02,"engine_fuelinjector":100.02,"transmition_clutch":100.02,"engine_gasket":100.02,"engine_airfilter":100.02,"engine_valves":100.02,"engine_camshaft":100.02,"engine_crankshaft":100.02,"engine_connectingrods":100.02,"plate":"42HRF546","oem_gearbox":100.02}', '{"fInitialDriveMaxFlatVel":189.0000152587891,"fInitialDriveForce":0.25,"fSuspensionReboundDamp":3.20000028610229,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.80000001192092,"fSuspensionCompDamp":1.39999997615814,"fTractionCurveMax":2.20000004768371,"fClutchChangeRateScaleDownShift":2.90000009536743,"fSuspensionForce":2.59999990463256,"fRollCentreHeightRear":-0.15000000596046,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.18000000715255,"fDriveInertia":1.0,"fBrakeForce":1.29999995231628,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.20000004768371,"fSuspensionBiasFront":0.49000000953674,"fSuspensionRaise":0.0,"fHandBrakeForce":0.60000002384185,"fTractionLossMult":1.0,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.07999999821186,"fClutchChangeRateScaleUpShift":3.90000009536743,"fSuspensionLowerLimit":-0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(33, '03CAB228', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"03CAB228","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":170.0,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.40000009536743,"fAntiRollBarBiasFront":0.30000001192092,"fAntiRollBarForce":0.0,"fSuspensionCompDamp":2.5,"fTractionCurveMax":1.39999997615814,"fClutchChangeRateScaleDownShift":3.0,"fSuspensionForce":6.5,"fRollCentreHeightRear":0.0,"fLowSpeedTractionLossMult":0.0,"fRollCentreHeightFront":0.0,"fDriveInertia":0.89999997615814,"fBrakeForce":0.34999999403953,"fTractionCurveLateral":16.0,"fTractionCurveMin":1.32000005245208,"fSuspensionBiasFront":0.51999998092651,"fSuspensionRaise":0.01999999955296,"fHandBrakeForce":0.80000001192092,"fTractionLossMult":0.0,"nInitialDriveGears":4,"fSuspensionUpperLimit":0.11999999731779,"fClutchChangeRateScaleUpShift":2.59999990463256,"fSuspensionLowerLimit":-0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(34, '40RYQ848', 0, '{"engine_flywheel":100.02,"engine_block":100.02,"oem_brakes":100.02,"engine_sparkplug":100.02,"oem_suspension":100.02,"engine_oil":100.02,"engine_pistons":100.02,"engine_fuelinjector":100.02,"transmition_clutch":100.02,"engine_gasket":100.02,"engine_airfilter":100.02,"engine_valves":100.02,"engine_camshaft":100.02,"engine_crankshaft":100.02,"engine_connectingrods":100.02,"plate":"40RYQ848","oem_gearbox":100.02}', '{"fInitialDriveMaxFlatVel":168.80001831054688,"fInitialDriveForce":0.25,"fSuspensionReboundDamp":1.60000014305114,"fAntiRollBarBiasFront":0.64999997615814,"fAntiRollBarForce":0.60000002384185,"fSuspensionCompDamp":1.0,"fTractionCurveMax":2.69000005722045,"fClutchChangeRateScaleDownShift":2.5,"fSuspensionForce":1.60000002384185,"fRollCentreHeightRear":0.40000000596046,"fLowSpeedTractionLossMult":0.80000001192092,"fRollCentreHeightFront":0.40000000596046,"fDriveInertia":1.0,"fBrakeForce":1.0,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.55999994277954,"fSuspensionBiasFront":0.51999998092651,"fSuspensionRaise":0.0,"fHandBrakeForce":0.44999998807907,"fTractionLossMult":1.0,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.10000000149011,"fClutchChangeRateScaleUpShift":2.5,"fSuspensionLowerLimit":-0.23999999463558}', '[]', NULL, NULL, NULL, NULL, NULL),
	(35, '42KEQ561', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"42KEQ561","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":180.0000152587891,"fInitialDriveForce":0.33750000596046,"fSuspensionReboundDamp":2.09999990463256,"fAntiRollBarBiasFront":0.60000002384185,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.39999997615814,"fTractionCurveMax":2.65000009536743,"fClutchChangeRateScaleDownShift":3.5,"fSuspensionForce":2.40000009536743,"fRollCentreHeightRear":0.40999999642372,"fLowSpeedTractionLossMult":1.5,"fRollCentreHeightFront":0.40999999642372,"fDriveInertia":1.0,"fBrakeForce":1.0,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.48000001907348,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":0.69999998807907,"fTractionLossMult":1.0,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.07999999821186,"fClutchChangeRateScaleUpShift":3.5,"fSuspensionLowerLimit":-0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(36, '80ELY993', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"80ELY993","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":380.0,"fInitialDriveForce":0.36500000953674,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.60000002384185,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.5,"fTractionCurveMax":2.6800000667572,"fClutchChangeRateScaleDownShift":6.0,"fSuspensionForce":2.65000009536743,"fRollCentreHeightRear":0.34000000357627,"fLowSpeedTractionLossMult":1.29999995231628,"fRollCentreHeightFront":0.34000000357627,"fDriveInertia":1.0,"fBrakeForce":1.10000002384185,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.54999995231628,"fSuspensionBiasFront":0.51999998092651,"fSuspensionRaise":0.0,"fHandBrakeForce":0.5,"fTractionLossMult":1.0,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.05000000074505,"fClutchChangeRateScaleUpShift":7.0,"fSuspensionLowerLimit":-0.10999999940395}', '[]', NULL, NULL, NULL, NULL, NULL),
	(37, '03JDK550', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"03JDK550","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":220.0,"fInitialDriveForce":0.40000000596046,"fSuspensionReboundDamp":2.40000009536743,"fAntiRollBarBiasFront":0.64999997615814,"fAntiRollBarForce":0.80000001192092,"fSuspensionCompDamp":1.20000004768371,"fTractionCurveMax":2.90000009536743,"fClutchChangeRateScaleDownShift":3.20000004768371,"fSuspensionForce":2.59999990463256,"fRollCentreHeightRear":0.40000000596046,"fLowSpeedTractionLossMult":0.40000000596046,"fRollCentreHeightFront":0.34999999403953,"fDriveInertia":1.22000002861022,"fBrakeForce":1.79999995231628,"fTractionCurveLateral":22.5,"fTractionCurveMin":1.79999995231628,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.00999999977648,"fHandBrakeForce":1.0,"fTractionLossMult":0.5,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.02999999932944,"fClutchChangeRateScaleUpShift":3.20000004768371,"fSuspensionLowerLimit":-0.11999999731779}', '[]', NULL, NULL, NULL, NULL, NULL),
	(38, '45ELA657', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"45ELA657","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":160.0,"fInitialDriveForce":5.42999982833862,"fSuspensionReboundDamp":2.79999995231628,"fAntiRollBarBiasFront":0.64999997615814,"fAntiRollBarForce":0.69999998807907,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":0.89999997615814,"fClutchChangeRateScaleDownShift":7.0,"fSuspensionForce":3.0,"fRollCentreHeightRear":0.18000000715255,"fLowSpeedTractionLossMult":0.10000000149011,"fRollCentreHeightFront":0.23000000417232,"fDriveInertia":1.42999994754791,"fBrakeForce":1.5,"fTractionCurveLateral":22.5,"fTractionCurveMin":1.39999997615814,"fSuspensionBiasFront":0.5,"fSuspensionRaise":-0.03999999910593,"fHandBrakeForce":1.20000004768371,"fTractionLossMult":1.0,"nInitialDriveGears":4,"fSuspensionUpperLimit":0.10000000149011,"fClutchChangeRateScaleUpShift":7.0,"fSuspensionLowerLimit":-0.15999999642372}', '[]', NULL, NULL, NULL, NULL, NULL),
	(39, '48KHG295', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"48KHG295","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":162.0000152587891,"fInitialDriveForce":0.44999998807907,"fSuspensionReboundDamp":2.09999990463256,"fAntiRollBarBiasFront":0.60000002384185,"fAntiRollBarForce":1.29999995231628,"fSuspensionCompDamp":1.39999997615814,"fTractionCurveMax":2.84999990463256,"fClutchChangeRateScaleDownShift":4.5,"fSuspensionForce":2.40000009536743,"fRollCentreHeightRear":0.40999999642372,"fLowSpeedTractionLossMult":1.07000005245208,"fRollCentreHeightFront":0.40999999642372,"fDriveInertia":1.10000002384185,"fBrakeForce":1.29999995231628,"fTractionCurveLateral":20.5,"fTractionCurveMin":2.54999995231628,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":1.29999995231628,"fTractionLossMult":1.5,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.11999999731779,"fClutchChangeRateScaleUpShift":3.20000004768371,"fSuspensionLowerLimit":-0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(40, '63XLO490', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"63XLO490","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":136.0,"fInitialDriveForce":0.26499998569488,"fSuspensionReboundDamp":1.60000014305114,"fAntiRollBarBiasFront":0.62000000476837,"fAntiRollBarForce":0.30000001192092,"fSuspensionCompDamp":0.89999997615814,"fTractionCurveMax":2.09999990463256,"fClutchChangeRateScaleDownShift":2.0,"fSuspensionForce":1.39999997615814,"fRollCentreHeightRear":0.40999999642372,"fLowSpeedTractionLossMult":1.39999997615814,"fRollCentreHeightFront":0.41999998688697,"fDriveInertia":1.0,"fBrakeForce":0.55000001192092,"fTractionCurveLateral":18.70000076293945,"fTractionCurveMin":1.70000004768371,"fSuspensionBiasFront":0.51999998092651,"fSuspensionRaise":0.0,"fHandBrakeForce":0.40000000596046,"fTractionLossMult":0.89999997615814,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.15000000596046,"fClutchChangeRateScaleUpShift":2.0,"fSuspensionLowerLimit":-0.18000000715255}', '[]', NULL, NULL, NULL, NULL, NULL),
	(41, '83KGY487', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"83KGY487","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":325.0,"fInitialDriveForce":0.35400000214576,"fSuspensionReboundDamp":3.09999990463256,"fAntiRollBarBiasFront":0.64999997615814,"fAntiRollBarForce":0.60000002384185,"fSuspensionCompDamp":1.5,"fTractionCurveMax":2.6800000667572,"fClutchChangeRateScaleDownShift":6.0,"fSuspensionForce":2.45000004768371,"fRollCentreHeightRear":0.33000001311302,"fLowSpeedTractionLossMult":1.10000002384185,"fRollCentreHeightFront":0.37999999523162,"fDriveInertia":1.0,"fBrakeForce":1.10000002384185,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.54999995231628,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":0.60000002384185,"fTractionLossMult":1.0,"nInitialDriveGears":7,"fSuspensionUpperLimit":0.10000000149011,"fClutchChangeRateScaleUpShift":7.0,"fSuspensionLowerLimit":-0.07999999821186}', '[]', NULL, NULL, NULL, NULL, NULL),
	(42, '05NXJ042', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"05NXJ042","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":159.10000610351566,"fInitialDriveForce":0.36000001430511,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.60000002384185,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.5,"fTractionCurveMax":2.70000004768371,"fClutchChangeRateScaleDownShift":6.0,"fSuspensionForce":2.65000009536743,"fRollCentreHeightRear":-0.0,"fLowSpeedTractionLossMult":1.29999995231628,"fRollCentreHeightFront":0.0,"fDriveInertia":1.0,"fBrakeForce":1.04999995231628,"fTractionCurveLateral":25.0,"fTractionCurveMin":2.53999996185302,"fSuspensionBiasFront":0.51999998092651,"fSuspensionRaise":0.0,"fHandBrakeForce":0.5,"fTractionLossMult":1.0,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.05000000074505,"fClutchChangeRateScaleUpShift":6.0,"fSuspensionLowerLimit":-0.10999999940395}', '[]', NULL, NULL, NULL, NULL, NULL),
	(43, '89IZS726', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"89IZS726","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":195.60000610351569,"fInitialDriveForce":0.26022800803184,"fSuspensionReboundDamp":1.46000015735626,"fAntiRollBarBiasFront":0.5,"fAntiRollBarForce":0.0,"fSuspensionCompDamp":1.28999996185302,"fTractionCurveMax":1.86000001430511,"fClutchChangeRateScaleDownShift":1.89999997615814,"fSuspensionForce":2.3157000541687,"fRollCentreHeightRear":0.35199999809265,"fLowSpeedTractionLossMult":0.32199999690055,"fRollCentreHeightFront":0.35400000214576,"fDriveInertia":0.99599999189376,"fBrakeForce":0.533999979496,"fTractionCurveLateral":16.60000038146972,"fTractionCurveMin":1.60800004005432,"fSuspensionBiasFront":0.47299998998641,"fSuspensionRaise":0.0,"fHandBrakeForce":0.64999997615814,"fTractionLossMult":1.22000002861022,"nInitialDriveGears":8,"fSuspensionUpperLimit":0.12399999797344,"fClutchChangeRateScaleUpShift":1.89999997615814,"fSuspensionLowerLimit":-0.13099999725818}', '[]', NULL, NULL, NULL, NULL, NULL),
	(44, '27EET499', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"27EET499","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":135.0,"fInitialDriveForce":0.38999998569488,"fSuspensionReboundDamp":10.80000019073486,"fAntiRollBarBiasFront":0.0,"fAntiRollBarForce":0.0,"fSuspensionCompDamp":5.5,"fTractionCurveMax":2.29999995231628,"fClutchChangeRateScaleDownShift":3.0,"fSuspensionForce":7.5,"fRollCentreHeightRear":0.20000000298023,"fLowSpeedTractionLossMult":0.80000001192092,"fRollCentreHeightFront":0.20000000298023,"fDriveInertia":1.0,"fBrakeForce":10.39999961853027,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.28999996185302,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":10.64999961853027,"fTractionLossMult":0.80000001192092,"nInitialDriveGears":6,"fSuspensionUpperLimit":0.18000000715255,"fClutchChangeRateScaleUpShift":2.0,"fSuspensionLowerLimit":-0.15000000596046}', '[]', NULL, NULL, NULL, NULL, NULL),
	(45, '81YSV785', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"81YSV785","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":244.0,"fInitialDriveForce":0.31999999284744,"fSuspensionReboundDamp":1.39999997615814,"fAntiRollBarBiasFront":0.66000002622604,"fAntiRollBarForce":0.40000000596046,"fSuspensionCompDamp":0.80000007152557,"fTractionCurveMax":2.25,"fClutchChangeRateScaleDownShift":1.89999997615814,"fSuspensionForce":2.0,"fRollCentreHeightRear":0.28999999165534,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.30000001192092,"fDriveInertia":1.0,"fBrakeForce":1.5,"fTractionCurveLateral":22.5,"fTractionCurveMin":1.79999995231628,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":0.80000001192092,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.11999999731779,"fClutchChangeRateScaleUpShift":1.89999997615814,"fSuspensionLowerLimit":-0.14000000059604}', '[]', NULL, NULL, NULL, NULL, NULL),
	(46, '80QVA854', 0, '{"engine_flywheel":100.02,"engine_block":100.02,"oem_brakes":100.02,"engine_sparkplug":100.02,"oem_suspension":100.02,"engine_oil":100.02,"engine_pistons":100.02,"engine_fuelinjector":100.02,"transmition_clutch":100.02,"engine_gasket":100.02,"engine_airfilter":100.02,"engine_valves":100.02,"engine_camshaft":100.02,"engine_crankshaft":100.02,"engine_connectingrods":100.02,"plate":"80QVA854","oem_gearbox":100.02}', '{"fInitialDriveMaxFlatVel":140.0,"fInitialDriveForce":0.10000000149011,"fSuspensionReboundDamp":0.40000003576278,"fAntiRollBarBiasFront":0.5,"fAntiRollBarForce":0.0,"fSuspensionCompDamp":1.29999995231628,"fTractionCurveMax":1.35000002384185,"fClutchChangeRateScaleDownShift":1.0,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.30000001192092,"fLowSpeedTractionLossMult":0.0,"fRollCentreHeightFront":0.30000001192092,"fDriveInertia":0.80000001192092,"fBrakeForce":0.2199999988079,"fTractionCurveLateral":15.40000057220459,"fTractionCurveMin":1.0,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":0.75,"fTractionLossMult":1.5,"nInitialDriveGears":3,"fSuspensionUpperLimit":0.09000000357627,"fClutchChangeRateScaleUpShift":1.29999995231628,"fSuspensionLowerLimit":-0.11999999731779}', '[]', NULL, NULL, NULL, NULL, NULL),
	(47, '86SAD005', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"engine_pistons":100.01,"engine_fuelinjector":100.01,"transmition_clutch":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"engine_camshaft":100.01,"engine_crankshaft":100.01,"engine_connectingrods":100.01,"plate":"86SAD005","oem_gearbox":100.01}', '{"fInitialDriveMaxFlatVel":140.0,"fInitialDriveForce":0.20000000298023,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.60000002384185,"fAntiRollBarForce":0.80000001192092,"fSuspensionCompDamp":1.20000004768371,"fTractionCurveMax":2.34999990463256,"fClutchChangeRateScaleDownShift":1.60000002384185,"fSuspensionForce":2.40000009536743,"fRollCentreHeightRear":0.25,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.23999999463558,"fDriveInertia":1.0,"fBrakeForce":0.89999997615814,"fTractionCurveLateral":22.5,"fTractionCurveMin":2.04999995231628,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fHandBrakeForce":0.60000002384185,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionUpperLimit":0.14000000059604,"fClutchChangeRateScaleUpShift":1.60000002384185,"fSuspensionLowerLimit":-0.14000000059604}', '[]', NULL, NULL, NULL, NULL, NULL),
	(48, '24OWL214', 0, '{"engine_flywheel":99.86358128093186,"engine_block":99.86358128093186,"oem_brakes":99.86358128093186,"engine_sparkplug":99.86358128093186,"oem_suspension":99.86358128093186,"engine_oil":99.86358128093186,"engine_pistons":99.86358128093186,"engine_fuelinjector":99.86358128093186,"transmition_clutch":99.86358128093186,"engine_gasket":99.86358128093186,"engine_airfilter":99.86358128093186,"engine_valves":99.86358128093186,"engine_camshaft":99.86358128093186,"engine_crankshaft":99.86358128093186,"engine_connectingrods":99.86358128093186,"plate":"24OWL214","oem_gearbox":99.86358128093186}', '{"fInitialDriveMaxFlatVel":185.0000152587891,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fBrakeForce":0.85000002384185,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.11999999731779,"fSuspensionBiasFront":0.50999999046325,"fSuspensionRaise":0.0,"fSuspensionUpperLimit":0.10000000149011,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fTractionCurveMin":2.29999995231628,"fClutchChangeRateScaleUpShift":2.20000004768371,"fHandBrakeForce":0.55000001192092}', '[]', NULL, NULL, NULL, NULL, NULL),
	(49, '01AHW807', 11, '{"engine_flywheel":99.9597787616402,"engine_block":99.9597787616402,"oem_brakes":99.9597787616402,"engine_sparkplug":99.9597787616402,"oem_suspension":99.9597787616402,"engine_oil":99.9597787616402,"engine_pistons":99.9597787616402,"engine_fuelinjector":99.9597787616402,"transmition_clutch":99.9597787616402,"engine_gasket":99.9597787616402,"engine_airfilter":99.9597787616402,"engine_valves":99.9597787616402,"engine_camshaft":99.9597787616402,"engine_crankshaft":99.9597787616402,"engine_connectingrods":99.9597787616402,"plate":"01AHW807","oem_gearbox":99.9597787616402}', '{"fInitialDriveMaxFlatVel":180.0000152587891,"fInitialDriveForce":0.30000001192092,"fSuspensionReboundDamp":1.0,"fAntiRollBarBiasFront":0.52999997138977,"fAntiRollBarForce":0.30000001192092,"fSuspensionCompDamp":1.39999997615814,"fTractionCurveMax":2.15000009536743,"fClutchChangeRateScaleDownShift":2.79999995231628,"fSuspensionForce":2.40000009536743,"fRollCentreHeightRear":0.25,"fLowSpeedTractionLossMult":1.39999997615814,"fRollCentreHeightFront":0.23999999463558,"fDriveInertia":1.0,"fBrakeForce":1.29999995231628,"fTractionCurveLateral":19.5,"fSuspensionUpperLimit":0.15000000596046,"fSuspensionLowerLimit":-0.14000000059604,"fSuspensionBiasFront":0.5,"fSuspensionRaise":0.0,"fTractionLossMult":1.0,"nInitialDriveGears":6,"fTractionCurveMin":1.95000004768371,"fClutchChangeRateScaleUpShift":2.79999995231628,"fHandBrakeForce":1.39999997615814}', '[]', NULL, NULL, NULL, NULL, NULL),
	(50, '28WZG853', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"28WZG853","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":100.0,"fInitialDriveForce":0.27000001072883,"fSuspensionReboundDamp":2.40000009536743,"fAntiRollBarBiasFront":0.5,"fSuspensionUpperLimit":0.07999999821186,"fSuspensionCompDamp":1.60000014305114,"fTractionCurveMax":2.29999995231628,"fClutchChangeRateScaleDownShift":7.0,"fSuspensionLowerLimit":-0.20000000298023,"fRollCentreHeightRear":0.25,"fLowSpeedTractionLossMult":1.10000002384185,"fRollCentreHeightFront":0.23999999463558,"fDriveInertia":1.0,"fBrakeForce":1.0,"fTractionCurveMin":2.0,"fTractionCurveLateral":22.5,"fClutchChangeRateScaleUpShift":7.0,"fSuspensionForce":2.84999990463256,"nInitialDriveGears":5,"fTractionLossMult":1.0,"fSuspensionRaise":0.0,"fAntiRollBarForce":0.55000001192092,"fSuspensionBiasFront":0.44999998807907,"fHandBrakeForce":0.69999998807907}', '[]', NULL, NULL, NULL, NULL, NULL),
	(51, '61ZGK827', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"61ZGK827","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":260.0000305175781,"fInitialDriveForce":0.36000001430511,"fSuspensionReboundDamp":2.09999990463256,"fAntiRollBarBiasFront":0.30000001192092,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionCompDamp":1.20000004768371,"fTractionCurveMax":1.64999997615814,"fClutchChangeRateScaleDownShift":6.0,"fSuspensionLowerLimit":-0.10000000149011,"fRollCentreHeightRear":0.28000000119209,"fLowSpeedTractionLossMult":0.40000000596046,"fRollCentreHeightFront":0.25,"fDriveInertia":1.0,"fBrakeForce":0.64999997615814,"fTractionCurveMin":1.45000004768371,"fTractionCurveLateral":16.5,"fClutchChangeRateScaleUpShift":6.0,"fSuspensionForce":2.70000004768371,"nInitialDriveGears":5,"fTractionLossMult":0.40000000596046,"fSuspensionRaise":0.0,"fAntiRollBarForce":0.40000000596046,"fSuspensionBiasFront":0.46000000834465,"fHandBrakeForce":0.69999998807907}', '[]', NULL, NULL, NULL, NULL, NULL),
	(52, '46DTT868', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"46DTT868","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":168.0,"fInitialDriveForce":0.25,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.64999997615814,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionCompDamp":1.5,"fTractionCurveMax":2.69000005722045,"fClutchChangeRateScaleDownShift":2.5,"fSuspensionLowerLimit":-0.10000000149011,"fRollCentreHeightRear":0.37999999523162,"fLowSpeedTractionLossMult":0.80000001192092,"fRollCentreHeightFront":0.37999999523162,"fDriveInertia":1.0,"fBrakeForce":1.0,"fTractionCurveMin":2.55999994277954,"fTractionCurveLateral":22.5,"fClutchChangeRateScaleUpShift":2.5,"fSuspensionForce":2.65000009536743,"nInitialDriveGears":6,"fTractionLossMult":1.0,"fSuspensionRaise":0.0,"fAntiRollBarForce":0.69999998807907,"fSuspensionBiasFront":0.47999998927116,"fHandBrakeForce":0.44999998807907}', '[]', NULL, NULL, NULL, NULL, NULL),
	(53, '82BWW391', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"82BWW391","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":200.80001831054688,"fInitialDriveForce":0.2280000001192,"fSuspensionReboundDamp":1.89999997615814,"fAntiRollBarBiasFront":0.57999998331069,"fSuspensionUpperLimit":0.09000000357627,"fSuspensionCompDamp":1.10000002384185,"fTractionCurveMax":2.69000005722045,"fClutchChangeRateScaleDownShift":2.79999995231628,"fSuspensionLowerLimit":-0.14000000059604,"fRollCentreHeightRear":0.57999998331069,"fLowSpeedTractionLossMult":0.80000001192092,"fRollCentreHeightFront":0.57999998331069,"fDriveInertia":1.0,"fBrakeForce":1.0,"fTractionCurveMin":2.27999997138977,"fTractionCurveLateral":22.5,"fClutchChangeRateScaleUpShift":2.79999995231628,"fSuspensionForce":2.59999990463256,"nInitialDriveGears":6,"fTractionLossMult":1.0,"fSuspensionRaise":0.0,"fAntiRollBarForce":0.89999997615814,"fSuspensionBiasFront":0.43000000715255,"fHandBrakeForce":0.44999998807907}', '[]', NULL, NULL, NULL, NULL, NULL),
	(54, '00WMY559', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"00WMY559","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":145.0,"fInitialDriveForce":0.20000000298023,"fSuspensionReboundDamp":1.79999995231628,"fAntiRollBarBiasFront":0.62999999523162,"fSuspensionUpperLimit":0.09000000357627,"fSuspensionCompDamp":1.20000004768371,"fTractionCurveMax":2.5,"fClutchChangeRateScaleDownShift":2.0,"fSuspensionLowerLimit":-0.14000000059604,"fRollCentreHeightRear":0.30000001192092,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.28999999165534,"fDriveInertia":1.0,"fBrakeForce":0.89999997615814,"fTractionCurveMin":2.20000004768371,"fTractionCurveLateral":22.5,"fClutchChangeRateScaleUpShift":2.0,"fSuspensionForce":2.79999995231628,"nInitialDriveGears":5,"fTractionLossMult":1.0,"fSuspensionRaise":0.0,"fAntiRollBarForce":0.80000001192092,"fSuspensionBiasFront":0.52999997138977,"fHandBrakeForce":0.60000002384185}', '[]', NULL, NULL, NULL, NULL, NULL),
	(55, '05LIA528', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"05LIA528","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":135.0,"fInitialDriveForce":0.27000001072883,"fSuspensionReboundDamp":1.39999997615814,"fAntiRollBarBiasFront":0.56000000238418,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionCompDamp":0.89999997615814,"fTractionCurveMax":2.0,"fClutchChangeRateScaleDownShift":1.79999995231628,"fSuspensionLowerLimit":-0.18000000715255,"fRollCentreHeightRear":0.60000002384185,"fLowSpeedTractionLossMult":1.5,"fRollCentreHeightFront":0.6700000166893,"fDriveInertia":1.0,"fBrakeForce":0.60000002384185,"fTractionCurveMin":1.64999997615814,"fTractionCurveLateral":19.0,"fClutchChangeRateScaleUpShift":1.79999995231628,"fSuspensionForce":1.39999997615814,"nInitialDriveGears":5,"fTractionLossMult":0.20000000298023,"fSuspensionRaise":0.0,"fAntiRollBarForce":0.89999997615814,"fSuspensionBiasFront":0.51999998092651,"fHandBrakeForce":0.31999999284744}', '[]', NULL, NULL, NULL, NULL, NULL),
	(56, '84VQX165', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"84VQX165","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":230.00001525878907,"fInitialDriveForce":5.30499982833862,"fSuspensionReboundDamp":2.70000004768371,"fAntiRollBarBiasFront":0.47999998927116,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionCompDamp":1.89999997615814,"fTractionCurveMax":2.5,"fClutchChangeRateScaleDownShift":2.5,"fSuspensionLowerLimit":-0.10000000149011,"fRollCentreHeightRear":0.00999999977648,"fLowSpeedTractionLossMult":0.89999997615814,"fRollCentreHeightFront":0.0,"fDriveInertia":3.0,"fBrakeForce":0.40000000596046,"fTractionCurveMin":1.62999999523162,"fTractionCurveLateral":27.5,"fClutchChangeRateScaleUpShift":1.5,"fSuspensionForce":3.79999995231628,"nInitialDriveGears":5,"fTractionLossMult":1.10000002384185,"fSuspensionRaise":0.0,"fAntiRollBarForce":1.0,"fSuspensionBiasFront":0.51999998092651,"fHandBrakeForce":1.5}', '[]', NULL, NULL, NULL, NULL, NULL),
	(57, '64TUY234', 18, '{"engine_flywheel":99.97246419668199,"engine_block":99.97246419668199,"oem_brakes":99.97246419668199,"engine_sparkplug":99.97246419668199,"oem_suspension":99.97246419668199,"engine_oil":99.97246419668199,"plate":"64TUY234","engine_fuelinjector":99.97246419668199,"engine_gasket":99.97246419668199,"engine_airfilter":99.97246419668199,"engine_valves":99.97246419668199,"oem_gearbox":99.97246419668199,"engine_camshaft":99.97246419668199,"engine_pistons":99.97246419668199,"engine_connectingrods":99.97246419668199,"engine_crankshaft":99.97246419668199,"transmition_clutch":99.97246419668199}', '{"fInitialDriveMaxFlatVel":168.80001831054688,"fInitialDriveForce":0.25,"fSuspensionReboundDamp":1.60000014305114,"fAntiRollBarBiasFront":0.64999997615814,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionCompDamp":1.0,"fTractionCurveMax":2.69000005722045,"fClutchChangeRateScaleDownShift":2.5,"fSuspensionLowerLimit":-0.23999999463558,"fRollCentreHeightRear":0.40000000596046,"fLowSpeedTractionLossMult":0.80000001192092,"fRollCentreHeightFront":0.40000000596046,"fDriveInertia":1.0,"fBrakeForce":1.0,"fTractionCurveMin":2.55999994277954,"fTractionCurveLateral":22.5,"fClutchChangeRateScaleUpShift":2.5,"fSuspensionForce":1.60000002384185,"nInitialDriveGears":6,"fTractionLossMult":1.0,"fSuspensionRaise":0.0,"fAntiRollBarForce":0.60000002384185,"fSuspensionBiasFront":0.51999998092651,"fHandBrakeForce":0.44999998807907}', '[]', NULL, NULL, NULL, NULL, NULL),
	(58, '64BOE084', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"64BOE084","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":120.00000762939453,"fInitialDriveForce":0.23000000417232,"fSuspensionReboundDamp":2.59999990463256,"fAntiRollBarBiasFront":0.52999997138977,"fSuspensionUpperLimit":0.03999999910593,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.75,"fClutchChangeRateScaleDownShift":4.0,"fSuspensionLowerLimit":-0.09000000357627,"fRollCentreHeightRear":0.18000000715255,"fLowSpeedTractionLossMult":1.29999995231628,"fRollCentreHeightFront":0.18000000715255,"fDriveInertia":1.0,"fBrakeForce":9.80000019073486,"fTractionCurveMin":2.54999995231628,"fTractionCurveLateral":22.5,"fClutchChangeRateScaleUpShift":4.0,"fSuspensionForce":2.5,"nInitialDriveGears":5,"fTractionLossMult":1.0,"fSuspensionRaise":-0.03999999910593,"fAntiRollBarForce":1.39999997615814,"fSuspensionBiasFront":0.49000000953674,"fHandBrakeForce":9.52000045776367}', '[]', NULL, NULL, NULL, NULL, NULL),
	(59, '08LVW733', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"08LVW733","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":130.00001525878907,"fInitialDriveForce":12.5,"fSuspensionReboundDamp":0.0,"fAntiRollBarBiasFront":0.0,"fSuspensionUpperLimit":0.10000000149011,"fSuspensionCompDamp":0.0,"fTractionCurveMax":0.0,"fClutchChangeRateScaleDownShift":1.29999995231628,"fSuspensionLowerLimit":0.10000000149011,"fRollCentreHeightRear":0.0,"fLowSpeedTractionLossMult":0.0,"fRollCentreHeightFront":0.0,"fDriveInertia":1.5,"fBrakeForce":0.40000000596046,"fTractionCurveMin":0.0,"fTractionCurveLateral":120.00000762939453,"fClutchChangeRateScaleUpShift":1.29999995231628,"fSuspensionForce":0.0,"nInitialDriveGears":1,"fTractionLossMult":1.0,"fSuspensionRaise":0.0,"fAntiRollBarForce":0.0,"fSuspensionBiasFront":0.0,"fHandBrakeForce":0.69999998807907}', '[]', NULL, NULL, NULL, NULL, NULL),
	(60, '02SIM462', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"02SIM462","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":145.0,"fInitialDriveForce":0.20000000298023,"fSuspensionReboundDamp":1.5,"fAntiRollBarBiasFront":0.60000002384185,"fSuspensionUpperLimit":0.09000000357627,"fSuspensionCompDamp":0.80000007152557,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":1.79999995231628,"fSuspensionLowerLimit":-0.14000000059604,"fRollCentreHeightRear":0.34999999403953,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.34000000357627,"fDriveInertia":1.0,"fBrakeForce":0.89999997615814,"fTractionCurveMin":2.45000004768371,"fTractionCurveLateral":22.5,"fClutchChangeRateScaleUpShift":1.79999995231628,"fSuspensionForce":1.79999995231628,"nInitialDriveGears":5,"fTractionLossMult":1.0,"fSuspensionRaise":0.0,"fAntiRollBarForce":0.80000001192092,"fSuspensionBiasFront":0.50999999046325,"fHandBrakeForce":0.60000002384185}', '[]', NULL, NULL, NULL, NULL, NULL),
	(61, '01NFM398', 0, '{"engine_flywheel":100.02045893311504,"engine_block":100.02045893311504,"oem_brakes":100.02045893311504,"engine_sparkplug":100.02045893311504,"oem_suspension":100.02045893311504,"engine_oil":100.02045893311504,"plate":"01NFM398","engine_fuelinjector":100.02045893311504,"engine_gasket":100.02045893311504,"engine_airfilter":100.02045893311504,"engine_valves":100.02045893311504,"oem_gearbox":100.02045893311504,"engine_camshaft":100.02045893311504,"engine_pistons":100.02045893311504,"engine_connectingrods":100.02045893311504,"engine_crankshaft":100.02045893311504,"transmition_clutch":100.02045893311504}', '{"fInitialDriveMaxFlatVel":240.00001525878907,"fInitialDriveForce":0.33000001311302,"fBrakeForce":1.0,"fAntiRollBarBiasFront":0.60000002384185,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.5,"fTractionCurveMax":2.65000009536743,"fClutchChangeRateScaleDownShift":5.0,"fSuspensionForce":2.65000009536743,"fRollCentreHeightRear":0.34000000357627,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.34000000357627,"fDriveInertia":1.0,"fTractionCurveMin":2.54999995231628,"fSuspensionReboundDamp":2.20000004768371,"fHandBrakeForce":0.5,"fLowSpeedTractionLossMult":1.29999995231628,"fSuspensionLowerLimit":-0.09000000357627,"fClutchChangeRateScaleUpShift":5.0,"fTractionLossMult":1.0,"nInitialDriveGears":6,"fSuspensionRaise":-0.03500000014901,"fSuspensionBiasFront":0.51999998092651,"fSuspensionUpperLimit":0.00999999977648}', '[]', NULL, NULL, NULL, NULL, NULL),
	(62, '65OKG996', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"65OKG996","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":170.0,"fInitialDriveForce":0.15000000596046,"fBrakeForce":0.23999999463558,"fAntiRollBarBiasFront":0.5,"fAntiRollBarForce":0.69999998807907,"fSuspensionCompDamp":1.0,"fTractionCurveMax":1.70000004768371,"fClutchChangeRateScaleDownShift":1.0,"fSuspensionForce":2.59999990463256,"fRollCentreHeightRear":0.10000000149011,"fTractionCurveLateral":15.80000019073486,"fRollCentreHeightFront":0.10000000149011,"fDriveInertia":0.89999997615814,"fTractionCurveMin":1.39999997615814,"fSuspensionReboundDamp":1.0,"fHandBrakeForce":0.44999998807907,"fLowSpeedTractionLossMult":0.0,"fSuspensionLowerLimit":-0.10000000149011,"fClutchChangeRateScaleUpShift":1.29999995231628,"fTractionLossMult":1.0,"nInitialDriveGears":4,"fSuspensionRaise":0.0,"fSuspensionBiasFront":0.5,"fSuspensionUpperLimit":0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL),
	(63, '80MWF056', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"80MWF056","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":195.60000610351563,"fInitialDriveForce":0.26022800803184,"fBrakeForce":0.533999979496,"fAntiRollBarBiasFront":0.5,"fAntiRollBarForce":0.0,"fSuspensionCompDamp":1.28999996185302,"fTractionCurveMax":1.86000001430511,"fClutchChangeRateScaleDownShift":1.89999997615814,"fSuspensionForce":2.3157000541687,"fRollCentreHeightRear":0.35199999809265,"fTractionCurveLateral":16.60000038146972,"fRollCentreHeightFront":0.35400000214576,"fDriveInertia":0.99599999189376,"fTractionCurveMin":1.60800004005432,"fSuspensionReboundDamp":1.46000015735626,"fHandBrakeForce":0.64999997615814,"fLowSpeedTractionLossMult":0.32199999690055,"fSuspensionLowerLimit":-0.13099999725818,"fClutchChangeRateScaleUpShift":1.89999997615814,"fTractionLossMult":1.22000002861022,"nInitialDriveGears":8,"fSuspensionRaise":0.0,"fSuspensionBiasFront":0.47299998998641,"fSuspensionUpperLimit":0.12399999797344}', '[]', NULL, NULL, NULL, NULL, NULL),
	(64, '68TIE199', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"68TIE199","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":160.0,"fInitialDriveForce":0.30000001192092,"fBrakeForce":0.40000000596046,"fAntiRollBarBiasFront":0.0,"fAntiRollBarForce":0.0,"fSuspensionCompDamp":2.5,"fTractionCurveMax":1.29999995231628,"fClutchChangeRateScaleDownShift":1.29999995231628,"fSuspensionForce":3.5,"fRollCentreHeightRear":0.0,"fTractionCurveLateral":12.0,"fRollCentreHeightFront":0.0,"fDriveInertia":1.0,"fTractionCurveMin":1.20000004768371,"fSuspensionReboundDamp":3.0,"fHandBrakeForce":0.69999998807907,"fLowSpeedTractionLossMult":0.0,"fSuspensionLowerLimit":-0.05000000074505,"fClutchChangeRateScaleUpShift":1.29999995231628,"fTractionLossMult":1.0,"nInitialDriveGears":1,"fSuspensionRaise":0.0,"fSuspensionBiasFront":0.15000000596046,"fSuspensionUpperLimit":0.60000002384185}', '[]', NULL, NULL, NULL, NULL, NULL),
	(65, '24RHE196', 0, '{"engine_flywheel":100.01,"engine_block":100.01,"oem_brakes":100.01,"engine_sparkplug":100.01,"oem_suspension":100.01,"engine_oil":100.01,"plate":"24RHE196","engine_fuelinjector":100.01,"engine_gasket":100.01,"engine_airfilter":100.01,"engine_valves":100.01,"oem_gearbox":100.01,"engine_camshaft":100.01,"engine_pistons":100.01,"engine_connectingrods":100.01,"engine_crankshaft":100.01,"transmition_clutch":100.01}', '{"fInitialDriveMaxFlatVel":190.0,"fInitialDriveForce":0.20000000298023,"fBrakeForce":0.89999997615814,"fAntiRollBarBiasFront":0.60000002384185,"fAntiRollBarForce":0.80000001192092,"fSuspensionCompDamp":0.80000007152557,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":1.79999995231628,"fSuspensionForce":1.79999995231628,"fRollCentreHeightRear":0.34999999403953,"fTractionCurveLateral":22.5,"fRollCentreHeightFront":0.34000000357627,"fDriveInertia":1.99899995326995,"fTractionCurveMin":2.45000004768371,"fSuspensionReboundDamp":1.5,"fHandBrakeForce":0.60000002384185,"fLowSpeedTractionLossMult":1.0,"fSuspensionLowerLimit":-0.14000000059604,"fClutchChangeRateScaleUpShift":1.79999995231628,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fSuspensionRaise":0.0,"fSuspensionBiasFront":0.50999999046325,"fSuspensionUpperLimit":0.09000000357627}', '[]', NULL, NULL, NULL, NULL, NULL),
	(66, '67NSN129', 0, '{"engine_flywheel":99.94339413702491,"engine_block":99.94339413702491,"oem_brakes":99.94339413702491,"engine_sparkplug":99.94339413702491,"oem_suspension":99.94339413702491,"engine_oil":99.94339413702491,"plate":"67NSN129","engine_fuelinjector":99.94339413702491,"active":true,"engine_gasket":99.94339413702491,"engine_airfilter":99.94339413702491,"engine_valves":99.94339413702491,"oem_gearbox":99.94339413702491,"engine_camshaft":99.94339413702491,"engine_pistons":99.94339413702491,"engine_connectingrods":99.94339413702491,"engine_crankshaft":99.94339413702491,"transmition_clutch":99.94339413702491}', '{"fInitialDriveMaxFlatVel":145.0,"fInitialDriveForce":0.25999999046325,"fBrakeForce":0.40000000596046,"fAntiRollBarBiasFront":0.52999997138977,"fAntiRollBarForce":0.30000001192092,"fSuspensionCompDamp":1.20000004768371,"fTractionCurveMax":2.34999990463256,"fClutchChangeRateScaleDownShift":1.79999995231628,"fSuspensionForce":2.79999995231628,"fRollCentreHeightRear":0.25,"fLowSpeedTractionLossMult":1.39999997615814,"fRollCentreHeightFront":0.23999999463558,"fDriveInertia":1.0,"fSuspensionReboundDamp":2.09999990463256,"fSuspensionLowerLimit":-0.14000000059604,"fSuspensionUpperLimit":0.15000000596046,"fSuspensionRaise":0.0,"fSuspensionBiasFront":0.5,"fTractionCurveMin":1.95000004768371,"fTractionLossMult":1.0,"nInitialDriveGears":5,"fHandBrakeForce":0.69999998807907,"fClutchChangeRateScaleUpShift":1.79999995231628,"fTractionCurveLateral":22.5}', '[]', NULL, NULL, NULL, NULL, NULL),
	(67, '60OVN099', 11, '{"engine_flywheel":99.95264361828566,"engine_block":99.95264361828566,"oem_brakes":99.95264361828566,"engine_sparkplug":99.95264361828566,"oem_suspension":99.95264361828566,"engine_oil":99.95264361828566,"plate":"60OVN099","engine_fuelinjector":99.95264361828566,"engine_gasket":99.95264361828566,"engine_airfilter":99.95264361828566,"engine_valves":99.95264361828566,"oem_gearbox":99.95264361828566,"engine_camshaft":99.95264361828566,"engine_pistons":99.95264361828566,"engine_connectingrods":99.95264361828566,"engine_crankshaft":99.95264361828566,"transmition_clutch":99.95264361828566}', '{"fInitialDriveMaxFlatVel":152.0,"fInitialDriveForce":0.33000001311302,"fSuspensionReboundDamp":2.20000004768371,"fAntiRollBarBiasFront":0.55000001192092,"fAntiRollBarForce":0.89999997615814,"fSuspensionCompDamp":1.79999995231628,"fTractionCurveMax":2.54999995231628,"fClutchChangeRateScaleDownShift":2.20000004768371,"fSuspensionForce":2.5,"fRollCentreHeightRear":0.20000000298023,"fLowSpeedTractionLossMult":1.0,"fRollCentreHeightFront":0.18999999761581,"fDriveInertia":1.0,"fTractionCurveMin":2.29999995231628,"fTractionCurveLateral":22.5,"fSuspensionLowerLimit":-0.11999999731779,"fBrakeForce":0.80000001192092,"nInitialDriveGears":5,"fClutchChangeRateScaleUpShift":2.20000004768371,"fTractionLossMult":1.0,"fSuspensionRaise":0.0,"fHandBrakeForce":0.55000001192092,"fSuspensionBiasFront":0.50999999046325,"fSuspensionUpperLimit":0.10000000149011}', '[]', NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table nmsh.scenes
CREATE TABLE IF NOT EXISTS `scenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `color` mediumtext DEFAULT NULL,
  `viewdistance` int(11) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `fontsize` decimal(10,1) DEFAULT NULL,
  `fontstyle` int(11) DEFAULT NULL,
  `coords` mediumtext DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_deletion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table nmsh.scenes: ~0 rows (approximately)

-- Dumping structure for table nmsh.shop_shops
CREATE TABLE IF NOT EXISTS `shop_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL,
  `isOwned` int(1) NOT NULL DEFAULT 0,
  `price` varchar(50) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT 'normal',
  `identifier` varchar(50) NOT NULL DEFAULT '0',
  `identifier2` varchar(50) NOT NULL DEFAULT '0',
  `stock` longtext NOT NULL DEFAULT '[]',
  `money` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.shop_shops: ~19 rows (approximately)
INSERT INTO `shop_shops` (`id`, `data`, `isOwned`, `price`, `type`, `identifier`, `identifier2`, `stock`, `money`) VALUES
	(1, '{"info":{"taxrate":18,"redcolor":"#db0000","stcolor":"#212830","textcolor":"#e7e7e7","thcolor":"#2a3f57","redhovercolor":"#b31818","defaultCategory":1,"ndcolor":"#31475e","title":"Nmsh"},"category":[{"id":1,"shortName":"الكترونيات","name":"الكترونيات"}],"items":[{"id":1,"category":"1","image":"img/radio.png","item":"radio","description":"تست","price":2500,"title":"راديو"}]}', 1, '25000', 'normal', '', '0', '{"aaaa":{"count":0},"weapon_flashlight":{"count":0},"chicken_knife":{"count":0},"drill":{"count":0},"stickynote":{"count":0},"fries":{"count":0},"softdrink":{"count":0},"beer":{"count":0},"yukoncigs":{"count":0},"fishingrod":{"count":0},"burger-heartstopper":{"count":0},"powerbank":{"count":0},"tosti":{"count":0},"firework4":{"count":0},"weapon_hammer":{"count":0},"axe":{"count":0},"handdrill":{"count":0},"whiskey":{"count":0},"monster":{"count":0},"sandwich":{"count":0},"firework1":{"count":0},"phone":{"count":0},"lockpick":{"count":0},"drillbit":{"count":0},"snikkel_candy":{"count":0},"firework2":{"count":0},"screwdriverset":{"count":0},"fishbait":{"count":0},"phone_module":{"count":0},"kurkakola":{"count":0},"sharkbait":{"count":0},"firework3":{"count":0},"advancedrepairkit":{"count":0},"tools":{"count":0},"binoculars":{"count":0},"lighter":{"count":0},"umbrella":{"count":0},"cleaningkit":{"count":0},"radio":{"count":99},"gatseeds":{"count":0},"repairkit":{"count":0},"twerks_candy":{"count":0},"parachute":{"count":0},"tailortool":{"count":0},"water_bottle":{"count":0},"bodyrepairkit":{"count":0},"fitbit":{"count":0},"cardiaquecigs":{"count":0},"vodka":{"count":0},"redwoodcigs":{"count":0},"headbag":{"count":0}}', 2500),
	(2, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(3, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(4, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(5, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(6, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(7, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(8, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(9, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(10, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(11, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(12, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(13, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(14, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(15, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(16, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(17, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(18, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0),
	(19, '{"items":[],"category":[],"info":{"redcolor":"#db0000","defaultCategory":1,"textcolor":"#e7e7e7","redhovercolor":"#b31818","thcolor":"#2a3f57","title":"Mustafa\'s Market","stcolor":"#212830","ndcolor":"#31475e","taxrate":25}}', 0, '25000', '0', '0', '0', '[]', 0);

-- Dumping structure for table nmsh.sprays
CREATE TABLE IF NOT EXISTS `sprays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(8,4) NOT NULL,
  `y` float(8,4) NOT NULL,
  `z` float(8,4) NOT NULL,
  `rx` float(8,4) NOT NULL,
  `ry` float(8,4) NOT NULL,
  `rz` float(8,4) NOT NULL,
  `scale` float(8,4) NOT NULL,
  `text` varchar(32) NOT NULL,
  `font` varchar(32) NOT NULL,
  `color` int(3) NOT NULL,
  `interior` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.sprays: ~1 rows (approximately)
INSERT INTO `sprays` (`id`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `scale`, `text`, `font`, `color`, `interior`, `created_at`) VALUES
	(1, -560.4777, -1804.1112, 23.1578, -1.7184, 0.0000, 154.9790, 7.0000, 'M3ATHT', 'graffiti1', 18, 0, '2023-08-23 21:00:50');

-- Dumping structure for table nmsh.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.stashitems: ~66 rows (approximately)
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(134, 'Ballas Stash', '[]'),
	(125, 'BennyShop_AIB23982', '[]'),
	(1, 'BennyShop_IIV39976', '[]'),
	(176, 'BennyShop_VIZ97057', '[]'),
	(167, 'burgerstorage', '[]'),
	(166, 'burgerstorage2', '[]'),
	(164, 'burgertray2', '[]'),
	(120, 'CityServices_PickupCounter', '[]'),
	(110, 'collectiontray', '[]'),
	(121, 'Container | 4828 | 3541 |', '[{"unique":false,"amount":1,"label":"Drift chip","type":"item","created":[1694006034],"slot":1,"weight":300,"info":{"quality":[100]},"useable":true,"image":"driftchip.png","name":"driftchip"}]'),
	(30, 'Container | 4878 | 5216 |', '[]'),
	(113, 'Container | 4978 | 3430 |', '[]'),
	(131, 'Container_3Z497enMU', '[]'),
	(156, 'Cx62zw', '[]'),
	(37, 'DarkWebCrate_1', '[{"slot":1,"info":[],"name":"laptop","weight":4000,"type":"item","image":"laptop.png","useable":false,"unique":false,"description":"Expensive laptop","label":"Laptop","amount":1}]'),
	(197, 'Jewelry_AVE81303', '[]'),
	(103, 'Jewelry_DML97005', '[]'),
	(193, 'Jewelry_EVY21770', '[]'),
	(4, 'Jewelry_IIV39976', '[]'),
	(180, 'Jewelry_RIR14294', '[]'),
	(184, 'Jewelry_UUP96298', '[]'),
	(178, 'Jewelry_VIZ97057', '[]'),
	(174, 'Jewelry_VJV83746', '[]'),
	(155, 'Jewelry_XUM18441', '[]'),
	(143, 'KY02Rv', '[]'),
	(133, 'Lost MC Stash', '[]'),
	(141, 'lZ01XA', '[]'),
	(33, 'mayor_stash', '[]'),
	(2, 'policestash_IIV39976', '[{"type":"item","amount":1,"slot":1,"info":{"quality":[100]},"unique":false,"label":"Pistol ammo","weight":200,"useable":true,"image":"pistol_ammo.png","created":[1689625118],"name":"pistol_ammo"}]'),
	(100, 'property_1', '[]'),
	(160, 'property_14', '[]'),
	(161, 'property_15', '[]'),
	(162, 'property_16', '[]'),
	(163, 'property_17', '[]'),
	(165, 'property_18', '[]'),
	(169, 'property_19', '[]'),
	(104, 'property_2', '[]'),
	(170, 'property_20', '[]'),
	(171, 'property_21', '[]'),
	(172, 'property_22', '[]'),
	(173, 'property_23', '[]'),
	(179, 'property_24', '[]'),
	(181, 'property_25', '[]'),
	(182, 'property_26', '[]'),
	(185, 'property_27', '[]'),
	(186, 'property_28', '[]'),
	(187, 'property_29', '[]'),
	(109, 'property_3', '[]'),
	(188, 'property_30', '[]'),
	(189, 'property_31', '[]'),
	(190, 'property_32', '[]'),
	(192, 'property_33', '[]'),
	(195, 'property_34', '[]'),
	(116, 'property_4', '[]'),
	(14, 'protectable_IIV39976', '[]'),
	(196, 'Protected_AVE81303', '[]'),
	(108, 'Protected_DML97005', '[]'),
	(194, 'Protected_EVY21770', '[]'),
	(11, 'Protected_IIV39976', '[{"type":"item","name":"phone","label":"Phone","amount":1,"image":"phone.png","unique":true,"useable":false,"slot":1,"created":[1689265431],"info":{"quality":[100]},"weight":700},{"type":"item","name":"keepcompanionwesty","label":"Westy","amount":1,"image":"A_C_Westy.png","unique":true,"useable":true,"slot":2,"created":[1689273913],"info":{"health":150.0,"name":"Nmsh","owner":{"account":"US08QBCore5047490896","nationality":"Kuwait","birthdate":"2023-07-07","lastname":"Dev","backstory":"placeholder backstory","phone":"2461922149","cid":1,"firstname":"Nmsh","gender":0},"thirst":1.8,"food":82.0,"age":90,"level":3,"hash":"47Hnt5Jz207QqXC","variation":"dark","XP":101,"quality":[100],"gender":true},"weight":500},{"type":"item","name":"beer","label":"Beer","amount":1,"image":"beer.png","unique":false,"useable":true,"slot":3,"created":[1689338023],"info":{"quality":[100]},"weight":500},{"type":"item","name":"whiskey","label":"Whiskey","amount":1,"image":"whiskey.png","unique":false,"useable":true,"slot":4,"created":[1689338025],"info":{"quality":[100]},"weight":500},{"type":"item","name":"tosti","label":"Grilled Cheese Sandwich","amount":1,"image":"tosti.png","unique":false,"useable":true,"slot":5,"created":[1689337534],"info":{"quality":[100]},"weight":200}]'),
	(183, 'Protected_UUP96298', '[]'),
	(177, 'Protected_VIZ97057', '[]'),
	(175, 'Protected_VJV83746', '[]'),
	(112, 'tacofoodtray1', '[]'),
	(137, 'tD33YA', '[{"info":[],"image":"markedbills.png","type":"item","slot":1,"useable":false,"unique":true,"description":"Money?","name":"markedbills","weight":1000,"label":"Marked Money","amount":9463}]'),
	(101, 'uwuTray1', '[]'),
	(102, 'uwuTray2', '[]'),
	(136, 'Vagos Stash', '[]'),
	(123, 'vapeshop1', '[]'),
	(124, 'vapeshop2', '[]'),
	(151, 'VG12jy', '[]'),
	(39, 'Yacht1', '[{"amount":1,"label":"Bat","unique":true,"slot":1,"useable":false,"type":"weapon","created":[1689625113],"info":{"serie":"90MAX8Sv263FQyt","ammo":0,"quality":100},"name":"weapon_bat","weight":1000,"image":"weapon_bat.png"},{"amount":1,"label":"Bandage","unique":false,"slot":2,"useable":true,"type":"item","created":[1689688307],"info":{"quality":[100]},"name":"bandage","weight":0,"image":"bandage.png"}]'),
	(42, 'Yacht2', '[{"name":"pistol_ammo","useable":true,"type":"item","label":"Pistol ammo","weight":200,"amount":1,"info":{"quality":[100]},"slot":1,"created":[1689625120],"image":"pistol_ammo.png","unique":false}]'),
	(89, 'Yacht3', '[{"created":[1690330685],"weight":500,"info":{"quality":[100]},"useable":true,"slot":1,"amount":1,"image":"beer.png","type":"item","unique":false,"name":"beer","label":"Beer"},{"created":[1690325853],"weight":500,"info":{"quality":[100]},"useable":true,"slot":2,"amount":1,"image":"beer.png","type":"item","unique":false,"name":"beer","label":"Beer"},{"created":[1689688315],"weight":200,"info":{"quality":[100]},"useable":true,"slot":3,"amount":1,"image":"sandwich.png","type":"item","unique":false,"name":"sandwich","label":"Sandwich"}]'),
	(138, 'YT07NY', '[{"name":"markedbills","info":{"quality":[100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100]},"slot":1,"useable":false,"label":"Marked Money","type":"item","amount":5641,"image":"markedbills.png","weight":1000,"created":[],"unique":true},{"name":"moneybag","info":{"quality":[100]},"slot":2,"useable":true,"label":"Money Bag","type":"item","amount":1,"image":"moneybag.png","weight":0,"created":[],"unique":true}]');

-- Dumping structure for table nmsh.tp_user_statistics
CREATE TABLE IF NOT EXISTS `tp_user_statistics` (
  `identifier` varchar(46) NOT NULL,
  `name` longtext DEFAULT NULL,
  `deaths` int(11) DEFAULT 0,
  `zombie_kills` int(11) DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table nmsh.tp_user_statistics: ~1 rows (approximately)
INSERT INTO `tp_user_statistics` (`identifier`, `name`, `deaths`, `zombie_kills`) VALUES
	('DML97005', 'R3D', 0, 12);

-- Dumping structure for table nmsh.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.trunkitems: ~1 rows (approximately)
INSERT INTO `trunkitems` (`id`, `plate`, `items`) VALUES
	(1, '27LOF483', '[]');

-- Dumping structure for table nmsh.users_current
CREATE TABLE IF NOT EXISTS `users_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `model` longtext NOT NULL,
  `drawables` longtext NOT NULL,
  `props` longtext NOT NULL,
  `drawtextures` longtext NOT NULL,
  `proptextures` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nmsh.users_current: ~2 rows (approximately)
INSERT INTO `users_current` (`id`, `citizenid`, `cid`, `model`, `drawables`, `props`, `drawtextures`, `proptextures`) VALUES
	(16, 'OUF80230', 236, '-1686040670', '{"1":["masks",0],"2":["hair",0],"3":["torsos",0],"4":["legs",0],"5":["bags",0],"6":["shoes",0],"7":["neck",0],"8":["undershirts",0],"9":["vest",0],"10":["decals",0],"11":["jackets",0],"0":["face",0]}', '{"1":["glasses",-1],"2":["earrings",-1],"3":["mouth",-1],"4":["lhand",-1],"5":["rhand",-1],"6":["watches",-1],"7":["braclets",-1],"0":["hats",-1]}', '[["face",0],["masks",0],["hair",0],["torsos",0],["legs",0],["bags",0],["shoes",0],["neck",0],["undershirts",0],["vest",0],["decals",0],["jackets",0]]', '[["hats",-1],["glasses",-1],["earrings",-1],["mouth",-1],["lhand",-1],["rhand",-1],["watches",-1],["braclets",-1]]'),
	(17, 'IIV39976', 1, '1885233650', '{"1":["masks",0],"2":["hair",0],"3":["torsos",0],"4":["legs",0],"5":["bags",0],"6":["shoes",1],"7":["neck",0],"8":["undershirts",0],"9":["vest",0],"10":["decals",0],"11":["jackets",4],"0":["face",0]}', '{"1":["glasses",-1],"2":["earrings",-1],"3":["mouth",-1],"4":["lhand",-1],"5":["rhand",-1],"6":["watches",-1],"7":["braclets",-1],"0":["hats",-1]}', '[["face",0],["masks",0],["hair",0],["torsos",0],["legs",0],["bags",0],["shoes",2],["neck",0],["undershirts",1],["vest",0],["decals",0],["jackets",0]]', '[["hats",-1],["glasses",-1],["earrings",-1],["mouth",-1],["lhand",-1],["rhand",-1],["watches",-1],["braclets",-1]]');

-- Dumping structure for table nmsh.users_face
CREATE TABLE IF NOT EXISTS `users_face` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `hairColor` longtext NOT NULL,
  `headBlend` longtext NOT NULL,
  `headOverlay` longtext NOT NULL,
  `headStructure` longtext NOT NULL,
  `headFade` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nmsh.users_face: ~2 rows (approximately)
INSERT INTO `users_face` (`id`, `citizenid`, `cid`, `hairColor`, `headBlend`, `headOverlay`, `headStructure`, `headFade`) VALUES
	(24, 'OUF80230', 236, '[-1,-1]', '[]', '{"14":{"name":"eyecolor","val":-1}}', '[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]', '"0"'),
	(25, 'IIV39976', 1, '[1,1]', '{"skinThird":0,"skinMix":1.0,"skinFirst":15,"skinSecond":0,"thirdMix":0.0,"hasParent":false,"shapeThird":0,"shapeFirst":2,"shapeMix":0.0,"shapeSecond":4}', '[{"overlayValue":255,"name":"Blemishes","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":0},{"overlayValue":255,"name":"FacialHair","overlayOpacity":0.0,"secondColour":0,"firstColour":0,"colourType":1},{"overlayValue":255,"name":"Eyebrows","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":1},{"overlayValue":255,"name":"Ageing","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":0},{"overlayValue":255,"name":"Makeup","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":2},{"overlayValue":255,"name":"Blush","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":2},{"overlayValue":255,"name":"Complexion","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":0},{"overlayValue":255,"name":"SunDamage","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":0},{"overlayValue":255,"name":"Lipstick","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":2},{"overlayValue":255,"name":"MolesFreckles","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":0},{"overlayValue":255,"name":"ChestHair","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":1},{"overlayValue":255,"name":"BodyBlemishes","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":0},{"overlayValue":255,"name":"AddBodyBlemishes","overlayOpacity":1.0,"secondColour":0,"firstColour":0,"colourType":0},{"val":65535,"name":"eyecolor"}]', '[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]', '"0"');

-- Dumping structure for table nmsh.users_hospital_patients
CREATE TABLE IF NOT EXISTS `users_hospital_patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `illness` varchar(50) NOT NULL DEFAULT 'none',
  `level` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.users_hospital_patients: ~1 rows (approximately)
INSERT INTO `users_hospital_patients` (`id`, `cid`, `illness`, `level`, `time`) VALUES
	(13, 0, 'none', 0, 0);

-- Dumping structure for table nmsh.users_housing
CREATE TABLE IF NOT EXISTS `users_housing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `housing_id` int(11) NOT NULL,
  `Street` text NOT NULL,
  `assigned` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.users_housing: ~0 rows (approximately)

-- Dumping structure for table nmsh.users_housing_keys
CREATE TABLE IF NOT EXISTS `users_housing_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `housing_id` int(11) NOT NULL,
  `giver` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.users_housing_keys: ~0 rows (approximately)

-- Dumping structure for table nmsh.users_motel
CREATE TABLE IF NOT EXISTS `users_motel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `building_type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.users_motel: ~1 rows (approximately)
INSERT INTO `users_motel` (`id`, `cid`, `building_type`) VALUES
	(13, 0, 1);

-- Dumping structure for table nmsh.users_outfits
CREATE TABLE IF NOT EXISTS `users_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `model` longtext NOT NULL,
  `name` longtext NOT NULL,
  `slot` longtext NOT NULL,
  `drawables` longtext NOT NULL,
  `props` longtext NOT NULL,
  `drawtextures` longtext NOT NULL,
  `proptextures` longtext NOT NULL,
  `hairColor` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nmsh.users_outfits: ~0 rows (approximately)

-- Dumping structure for table nmsh.users_tattoos
CREATE TABLE IF NOT EXISTS `users_tattoos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `tattoos` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table nmsh.users_tattoos: ~2 rows (approximately)
INSERT INTO `users_tattoos` (`id`, `citizenid`, `cid`, `tattoos`) VALUES
	(9, 'OUF80230', 236, '[]'),
	(10, 'IIV39976', 1, '{}');

-- Dumping structure for table nmsh.user_documents
CREATE TABLE IF NOT EXISTS `user_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(45) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.user_documents: ~0 rows (approximately)

-- Dumping structure for table nmsh.vehicle_shops
CREATE TABLE IF NOT EXISTS `vehicle_shops` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `locations` longtext NOT NULL,
  `employees` longtext NOT NULL,
  `stock` longtext NOT NULL,
  `displays` longtext NOT NULL,
  `funds` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table nmsh.vehicle_shops: ~2 rows (approximately)
INSERT INTO `vehicle_shops` (`owner`, `name`, `locations`, `employees`, `stock`, `displays`, `funds`, `price`) VALUES
	('AIB23982', 'Luxury Shop', '{"entry":{"z":54.80014038085937,"y":-144.36460876464845,"x":127.1177749633789},"purchased":{"z":54.83887100219726,"y":-117.41659545898438,"x":128.2079315185547,"heading":72.31663513183594},"blip":{"z":54.80014038085937,"y":-144.36460876464845,"x":127.1177749633789},"spawn":{"z":55.05012893676758,"y":-149.4374237060547,"x":137.95790100097657,"heading":157.2220458984375},"deposit":{"z":54.8352165222168,"y":-130.25851440429688,"x":119.86526489257813},"management":{"z":54.800045013428,"y":-141.5391998291,"x":147.64498901367}}', '{}', '{}', '{}', 999818000, 1000000000),
	('none', 'Benefactor Shop', '{"spawn":{"heading":67.81303405761719,"z":71.91197967529297,"y":74.92072296142578,"x":-75.62608337402344},"blip":{"z":71.80429077148438,"y":69.50860595703125,"x":-64.7255630493164},"management":{"z":71.8879165649414,"y":73.87248229980469,"x":-53.91244125366211},"deposit":{"z":71.59716033935547,"y":80.54047393798828,"x":-63.74249649047851},"entry":{"z":71.94767761230469,"y":67.98313903808594,"x":-55.82210540771484},"purchased":{"heading":144.78883361816407,"z":71.51176452636719,"y":80.93245697021485,"x":-82.80818939208985}}', '{}', '{}', '{}', 1000000000, 1000000000);

-- Dumping structure for table nmsh.weedplants
CREATE TABLE IF NOT EXISTS `weedplants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `time` int(255) NOT NULL,
  `fertilizer` longtext NOT NULL CHECK (json_valid(`fertilizer`)),
  `water` longtext NOT NULL CHECK (json_valid(`water`)),
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table nmsh.weedplants: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
