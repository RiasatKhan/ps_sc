/*
-- Query: select * from users
LIMIT 0, 1000

-- Date: 2019-07-14 03:36
*/
INSERT INTO `users` (`id`,`name`,`email`,`password`) VALUES (1,'riasat','riasatsakif@gmail.com','123456');
/*
-- Query: select * from question_set
LIMIT 0, 1000

-- Date: 2019-07-14 03:37
*/
INSERT INTO `question_set` (`id`,`name_1`) VALUES (1,'Depression Scale');
INSERT INTO `question_set` (`id`,`name_1`) VALUES (7,'Anxiety');
INSERT INTO `question_set` (`id`,`name_1`) VALUES (8,'SAD');
INSERT INTO `question_set` (`id`,`name_1`) VALUES (9,'SAC');
INSERT INTO `question_set` (`id`,`name_1`) VALUES (10,'OCD');
INSERT INTO `question_set` (`id`,`name_1`) VALUES (11,'OCD-Scale');
INSERT INTO `question_set` (`id`,`name_1`) VALUES (12,'Social-Avoidance ');
INSERT INTO `question_set` (`id`,`name_1`) VALUES (13,'Depression-Scale');
INSERT INTO `question_set` (`id`,`name_1`) VALUES (14,'Social-Interaction-Scale');
INSERT INTO `question_set` (`id`,`name_1`) VALUES (15,'Anxiety-Scale');
/*
-- Query: select * from questions
LIMIT 0, 1000

-- Date: 2019-07-14 03:37
*/
INSERT INTO `questions` (`id`,`set_id`,`question`) VALUES (1,7,'who am i');
INSERT INTO `questions` (`id`,`set_id`,`question`) VALUES (2,7,'where are you');
INSERT INTO `questions` (`id`,`set_id`,`question`) VALUES (3,1,'what is my name');
INSERT INTO `questions` (`id`,`set_id`,`question`) VALUES (4,1,'why am i here');
/*
-- Query: select * from answers
LIMIT 0, 1000

-- Date: 2019-07-14 03:38
*/
INSERT INTO `answers` (`id`,`set_id`,`value`,`answer`) VALUES (1,7,1,'yes');
INSERT INTO `answers` (`id`,`set_id`,`value`,`answer`) VALUES (2,7,0,'no');
INSERT INTO `answers` (`id`,`set_id`,`value`,`answer`) VALUES (3,1,24,'sakif');
INSERT INTO `answers` (`id`,`set_id`,`value`,`answer`) VALUES (4,1,10,'riasat');
/*
-- Query: select * from report_breakdown
LIMIT 0, 1000

-- Date: 2019-07-14 03:39
*/
INSERT INTO `report_breakdown` (`id`,`user_id`,`question_set_id`,`question_id`,`answer_id`) VALUES (3,1,7,1,1);
INSERT INTO `report_breakdown` (`id`,`user_id`,`question_set_id`,`question_id`,`answer_id`) VALUES (4,1,7,2,1);
