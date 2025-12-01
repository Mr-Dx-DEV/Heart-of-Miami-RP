CREATE TABLE IF NOT EXISTS `wais_studio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studio` varchar(50) DEFAULT NULL,
  `files` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;