CREATE TABLE IF NOT EXISTS `electus_pets` (
  `identifier` varchar(46) DEFAULT NULL,
  `model` varchar(25) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `abilities` varchar(255) DEFAULT NULL,
  `variation` varchar(50) DEFAULT NULL,
  `accessories` varchar(255) DEFAULT NULL,
  `sniffedItems` varchar(255) DEFAULT NULL,
  `bagLock` varchar(100) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `breedingSeed` int(11) DEFAULT NULL,
  `numOfBreedings` int(2) DEFAULT 0,
  `deadAt` int(11) DEFAULT 0,
  `stored` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`, `name`)
);

CREATE TABLE IF NOT EXISTS `electus_pets_daily_data` (
  `lastReset` int(11) unsigned DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `electus_pets_daily_tasks` (
  `identifier` varchar(46) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dailyTasks` longtext DEFAULT NULL,
  PRIMARY KEY (`identifier`, `name`)
);

CREATE TABLE IF NOT EXISTS `electus_pets_friends` (
  `identifier` varchar(46) DEFAULT NULL,
  `friends` longtext DEFAULT NULL,
  `jobs` longtext DEFAULT NULL,
  PRIMARY KEY (`identifier`)
);

CREATE TABLE IF NOT EXISTS `electus_pets_houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `houseType` varchar(50) DEFAULT NULL,
  `coords` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);