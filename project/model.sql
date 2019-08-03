-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema PSYCHIATRIC_SCREENING
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PSYCHIATRIC_SCREENING
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PSYCHIATRIC_SCREENING` DEFAULT CHARACTER SET utf8 ;
USE `PSYCHIATRIC_SCREENING` ;

-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`question_set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`question_set` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`answers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`answers` (
  `id` INT(11) NOT NULL,
  `set_id` INT(11) NOT NULL,
  `value` INT(11) NOT NULL,
  `answer` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkIdx_26` (`set_id` ASC),
  CONSTRAINT `FK_26`
    FOREIGN KEY (`set_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`question_set` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`city` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`areas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `city_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `city_id` (`city_id` ASC),
  CONSTRAINT `areas_ibfk_1`
    FOREIGN KEY (`city_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`city` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  `email` VARCHAR(200) NULL DEFAULT NULL,
  `password` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`auth_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`auth_log` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `token` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `auth_log_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`questions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `set_id` INT(11) NOT NULL,
  `question` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkIdx_15` (`set_id` ASC),
  CONSTRAINT `FK_15`
    FOREIGN KEY (`set_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`question_set` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 154
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`report` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `question_set_id` INT(11) NOT NULL,
  `score` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkIdx_53` (`user_id` ASC),
  INDEX `fkIdx_56` (`question_set_id` ASC),
  CONSTRAINT `FK_53`
    FOREIGN KEY (`user_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`users` (`id`),
  CONSTRAINT `FK_56`
    FOREIGN KEY (`question_set_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`question_set` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 62
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`report_breakdown`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`report_breakdown` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `question_set_id` INT(11) NOT NULL,
  `question_id` INT(11) NOT NULL,
  `answer_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkIdx_40` (`user_id` ASC),
  INDEX `fkIdx_43` (`question_set_id` ASC),
  INDEX `fkIdx_46` (`question_id` ASC),
  INDEX `fkIdx_60` (`answer_id` ASC),
  CONSTRAINT `FK_40`
    FOREIGN KEY (`user_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`users` (`id`),
  CONSTRAINT `FK_43`
    FOREIGN KEY (`question_set_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`question_set` (`id`),
  CONSTRAINT `FK_46`
    FOREIGN KEY (`question_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`questions` (`id`),
  CONSTRAINT `FK_60`
    FOREIGN KEY (`answer_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`answers` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 940
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PSYCHIATRIC_SCREENING`.`score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PSYCHIATRIC_SCREENING`.`score` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `question_set_id` INT(11) NULL DEFAULT NULL,
  `name` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `maximum` INT(11) NULL DEFAULT NULL,
  `minimum` INT(11) NULL DEFAULT NULL,
  `is_appointment_required` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `question_set_id` (`question_set_id` ASC),
  CONSTRAINT `score_ibfk_1`
    FOREIGN KEY (`question_set_id`)
    REFERENCES `PSYCHIATRIC_SCREENING`.`question_set` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
