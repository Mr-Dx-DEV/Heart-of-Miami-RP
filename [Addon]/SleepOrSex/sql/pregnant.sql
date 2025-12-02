CREATE TABLE IF NOT EXISTS `last_pregnant` (
    `identifier` VARCHAR(255),
    `pregnant_time` INT(255),
    `pregnant_estimate` INT(255),
    PRIMARY KEY (`identifier`)
);

ALTER TABLE `last_pregnant`
	ADD `pregnant` TINYINT(1) NULL DEFAULT '0'
;