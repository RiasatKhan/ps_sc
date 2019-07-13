-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;


-- ************************************** `users`

CREATE TABLE `users`
(
 `id`       int NOT NULL AUTO_INCREMENT ,
 `name`     text NOT NULL ,
 `email`    text NOT NULL ,
 `password` text NOT NULL ,

PRIMARY KEY (`id`)
);






-- ************************************** `question_set`

CREATE TABLE `question_set`
(
 `id`   int NOT NULL AUTO_INCREMENT ,
 `name` varchar(45) NOT NULL ,

PRIMARY KEY (`id`)
);



-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;


-- ************************************** `questions`

CREATE TABLE `questions`
(
 `id`              int NOT NULL AUTO_INCREMENT ,
 `question_set_id` int NOT NULL ,
 `question`        text NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_15` (`question_set_id`),
CONSTRAINT `FK_15` FOREIGN KEY `fkIdx_15` (`question_set_id`) REFERENCES `question_set` (`id`)
);






-- ************************************** `answers`

CREATE TABLE `answers`
(
 `id`              int NOT NULL AUTO_INCREMENT ,
 `question_set_id` int NOT NULL ,
 `value`           int NOT NULL ,
 `answer`          text NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_26` (`question_set_id`),
CONSTRAINT `FK_26` FOREIGN KEY `fkIdx_26` (`question_set_id`) REFERENCES `question_set` (`id`)
);





-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;


-- ************************************** `report`

CREATE TABLE `report`
(
 `id`              int NOT NULL AUTO_INCREMENT ,
 `user_id`         int NOT NULL ,
 `question_set_id` int NOT NULL ,
 `score`           int NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_53` (`user_id`),
CONSTRAINT `FK_53` FOREIGN KEY `fkIdx_53` (`user_id`) REFERENCES `users` (`id`),
KEY `fkIdx_56` (`question_set_id`),
CONSTRAINT `FK_56` FOREIGN KEY `fkIdx_56` (`question_set_id`) REFERENCES `question_set` (`id`)
);






-- ************************************** `report_breakdown`

CREATE TABLE `report_breakdown`
(
 `id`              int NOT NULL AUTO_INCREMENT ,
 `user_id`         int NOT NULL ,
 `question_set_id` int NOT NULL ,
 `question_id`     int NOT NULL ,
 `answer_id`       int NOT NULL ,

PRIMARY KEY (`id`),
KEY `fkIdx_40` (`user_id`),
CONSTRAINT `FK_40` FOREIGN KEY `fkIdx_40` (`user_id`) REFERENCES `users` (`id`),
KEY `fkIdx_43` (`question_set_id`),
CONSTRAINT `FK_43` FOREIGN KEY `fkIdx_43` (`question_set_id`) REFERENCES `question_set` (`id`),
KEY `fkIdx_46` (`question_id`),
CONSTRAINT `FK_46` FOREIGN KEY `fkIdx_46` (`question_id`) REFERENCES `questions` (`id`),
KEY `fkIdx_60` (`answer_id`),
CONSTRAINT `FK_60` FOREIGN KEY `fkIdx_60` (`answer_id`) REFERENCES `answers` (`id`)
);







