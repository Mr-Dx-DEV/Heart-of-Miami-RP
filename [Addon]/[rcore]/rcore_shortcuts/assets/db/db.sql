DROP TABLE IF EXISTS `rcore_shortcuts`;
CREATE TABLE `rcore_shortcuts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `player_name` varchar(50) DEFAULT NULL,
  `shortcut` varchar(15) DEFAULT NULL,
  `action` text,
  `category` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `native` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `rcore_shortcuts_categories`;
CREATE TABLE `rcore_shortcuts_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `rcore_shortcuts_logger`;
CREATE TABLE `rcore_shortcuts_logger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `shortcut` varchar(15) DEFAULT NULL,
  `action` text,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `rcore_shortcuts_premade`;
CREATE TABLE `rcore_shortcuts_premade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(60) DEFAULT NULL,
  `shortcut` varchar(15) DEFAULT NULL,
  `action` text,
  `jobs` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;