-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: PSYCHIATRIC_SCREENING
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.10.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `answer` text,
  PRIMARY KEY (`id`),
  KEY `fkIdx_26` (`set_id`),
  CONSTRAINT `FK_26` FOREIGN KEY (`set_id`) REFERENCES `question_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,0,'Not At All'),(2,1,1,'Very Little'),(3,1,2,'Little'),(4,1,3,'A Little More'),(5,1,4,'A Lot'),(6,2,0,'Not True'),(7,2,1,'True'),(8,3,1,'Not Applicable At All'),(9,3,2,'Not Applicable'),(10,3,3,'Neutral'),(11,3,4,'Somewhat Applicable'),(12,3,5,'Completely Applicable'),(13,4,0,'Not Applicable At All'),(14,4,1,'Not Applicable'),(15,4,2,'Neutral'),(16,4,3,'Somewhat Applicable'),(17,4,4,'Completely Applicable'),(18,5,0,'Does Not Happen At All'),(19,5,1,'Happens A Little'),(20,5,2,'Happens Somewhat'),(21,5,3,'Happens More'),(22,5,4,'Happens A Lot'),(23,6,0,'Does Not Happen At All'),(24,6,1,'Happens A Little'),(25,6,2,'Happens Somewhat'),(26,6,3,'Happens More'),(27,6,4,'Happens A Lot');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `areas_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Mirpur',1),(2,'Mohammadpur',1),(3,'GEC CIrcle',2),(4,'',NULL);
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_log`
--

DROP TABLE IF EXISTS `auth_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_log`
--

LOCK TABLES `auth_log` WRITE;
/*!40000 ALTER TABLE `auth_log` DISABLE KEYS */;
INSERT INTO `auth_log` VALUES (3,1,'yGHhuO8bDgMq1uyl'),(4,1,'FPzPJ2IX2c9rzFpv'),(5,1,'YCoPNv4pPzOqJDzI'),(6,1,'DnCpSNZB0xJ5ROXx'),(7,1,'IwMV7C2vtIi1rmP7'),(8,1,'PyCMRNm4C916IAaS'),(9,1,'xyKGNi9jq8hdbYVt'),(10,1,'tFOJCjtiL1rnk7rd'),(11,1,'hIIeYgnPZVYoSA9f'),(12,1,'iW2W5pO8ydAKvdDx'),(13,1,'LfE3ioT9lKMAdcGC'),(14,1,'1On8blS0FIU2c7SG'),(15,1,'tsydjZhxDpVIUfc5'),(16,1,'SyaizsjWZOQaBQkR'),(17,1,'ztg7bLgBJurDWsmq'),(18,1,'ROsKUBMEqMwWd9b4'),(19,1,'1E3i3ggj6aq8VQX4'),(20,1,'OUlsFEuNGYEgAiMb'),(21,1,'GAOPpfr2sXz3CURG'),(22,1,'Ya6VvvlzdyFp4LT4'),(23,1,'Ec5So3wMidhCwfxH'),(24,1,'XOch0rJYNzsNxzkG'),(25,1,'mjMRYaeQZQBTO04N'),(26,1,'4ZlfcYmNhYBLAAzg'),(27,1,'6l0XQXXudbtb5kJ6'),(28,1,'AYwiG3ZMq8qroo1i'),(29,1,'Zwr6bJov1Qpt3qsX'),(30,1,'ZebznlAKzsBXZ1dg'),(31,1,'Gj3O1jvGlMg37TvP'),(32,1,'MbmXPWv3Rr7wA64C');
/*!40000 ALTER TABLE `auth_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Dhaka'),(2,'Chittagong');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_set`
--

DROP TABLE IF EXISTS `question_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_set`
--

LOCK TABLES `question_set` WRITE;
/*!40000 ALTER TABLE `question_set` DISABLE KEYS */;
INSERT INTO `question_set` VALUES (1,'OCD-Scale'),(2,'Social-Avoidance '),(3,'Depression-Scale'),(4,'Social-Interaction-Scale'),(5,'Anxiety-Scale'),(6,'Child_depression_Scale');
/*!40000 ALTER TABLE `question_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) NOT NULL,
  `question` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkIdx_15` (`set_id`),
  CONSTRAINT `FK_15` FOREIGN KEY (`set_id`) REFERENCES `question_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'1.  I have various strange and nasty thoughts on religion that I cannot stop even if I want to.'),(2,1,'2. The image or image that is defiling the sacred place comes to mind, I cannot remove it even if I want to.'),(3,1,'3. Atheistic thoughts keep popping up in my mind so often that I don\'t have faith or believe in the Creator'),(4,1,'4.  All the while, I doubt I have become unclean, dirty, or unclean'),(5,1,'5. All the time I feel like I have dirt or germs in my hands.'),(6,1,'6. Washing several times or many times while cleaning some things, though I do not need to wash so many times, but wash them.'),(7,1,'7. For cleaning I have to use a lot of soap or detergent powder.'),(8,1,'8. I was extra aware of those places where there might be mess and almost avoided it.'),(9,1,'9. When someone touches me, I suffer from panic until I take a bath or clean.	'),(10,1,'10. It takes a lot of my bath time, even a few hours.'),(11,1,'11.If in the midst of doing something, I think I have become unclean, then I immediately take a bath or clean.'),(12,1,'12. I check different things again and again '),(13,1,'13. When it comes to praying / worshiping, it may be doubtful that the sura / verse is not read correctly, then I read again, thus it takes a long time.'),(14,1,'14.I have a lot of difficulty in calculating things because I think I was wrong.'),(15,1,'15. I kept doing the same thing over and over again until it was like my mind.'),(16,1,'16. Different things I do a certain number of times.'),(17,1,'17. It takes me a lot of time to do my daily work or almost no work time'),(18,1,'18. If there is an interruption or disruption to my scheduled work while doing a task, then I have to start the job again from the beginning.'),(19,1,'19.I understand that I behave in ways that are excessive and unnecessary, but I still cannot avoid it.'),(20,1,'20. I cringe about some things over and over when others get annoyed by it.'),(21,2,'1. I also feel comfortable in unfamiliar social environments'),(22,2,'2. I try to avoid situations that force me to socialize'),(23,2,'3. I feel relaxed even among strangers'),(24,2,'4. I have no special purpose in avoiding people'),(25,2,'5. I often see social events chaotic'),(26,2,'6. I usually relax at social events'),(27,2,'7. It\'s usually easier when I\'m having conversations with someone of the opposite sex'),(28,2,'8. I avoided conversations with them until I knew someone well'),(29,2,'9. I often take it well when it comes to meeting someone new'),(30,2,'10. I feel nervous to attend a family get-together in the presence of both men and women.'),(31,2,'11. I usually get nervous about meeting people without knowing anyone well'),(32,2,'12. I usually feel comfortable with many people'),(33,2,'13. I often want to be away from people'),(34,2,'14. I often want to be away from people'),(35,2,'15. I feel at ease with someone at first'),(36,2,'16. When I get to know someone, I get excited and nervous'),(37,2,'17. Anyway I can enter in a house full of strangers'),(38,2,'18. I do not attend any major gathering by my own will'),(39,2,'19. When seniors want to talk to me, I talk to them with interest'),(40,2,'20. When I\'m in the middle of a group of people, I often feel like I\'m standing on the edge'),(41,3,'1. I feel uneasy.'),(42,3,'2. Lately I\'ve been sad.'),(43,3,'3.My future is dark.'),(44,3,'4. In the future my condition will get worse day by day.'),(45,3,'5. I\'m all done.'),(46,3,'6. I think that life is very difficult now.'),(47,3,'7.  At present I feel that as a human being I am completely unsuccessful.'),(48,3,'8. I can\'t find joy anywhere.'),(49,3,'9. I feel soo small '),(50,3,'10. I lost my confidence in everything.'),(51,3,'11. I think people have compassion on me.'),(52,3,'12. Life is meaningless.'),(53,3,'13. Often I get tears.'),(54,3,'14. I often feel annoyed.'),(55,3,'15. I\'m not interested in anything.'),(56,3,'16.  I can\'t think and decide lately.'),(57,3,'17. I can\'t focus on many things nowadays.'),(58,3,'18. I can\'t remember things like before.'),(59,3,'19.I feel weak and a little tired.'),(60,3,'20. I sleep less now.'),(61,3,'21. I sleep more now.'),(62,3,'22. My mood is cranky.'),(63,3,'23. I lost my appetite.'),(64,3,'24.  The hunger has increased.'),(65,3,'25.I lost weight (not as a result of deliberately trying to control weight).'),(66,3,'26. I think my pace of work has slowed down.'),(67,3,'27. No matter what happens , I can\'t laugh anymore.'),(68,3,'28. My interest in sex has diminished.'),(69,3,'29. I cannot participate in social activities like before.'),(70,3,'30. I cannot do education or professional activities like before.'),(71,4,'1. I feel awkward when I have to talk to someone at the authority level (teacher or boss).'),(72,4,'2. I have a hard time looking straight into the eyes of others.'),(73,4,'3. If I have anything to say about myself or my feelings, I feel very anxious.'),(74,4,'4. I find it difficult to be comfortable with the people I work with.'),(75,4,'5. I can make friends with peers very easily.'),(76,4,'6. I was uncomfortable when I met someone I met while walking down the street.'),(77,4,'7. I am uncomfortable with socializing'),(78,4,'8. If I am alone with one person then I feel very anxious.'),(79,4,'9. I enjoy meeting people at a party.'),(80,4,'10. I have difficulty communicating with others.'),(81,4,'11. It\'s easy for me to think about what to say.'),(82,4,'12. I feel embarrassed to express myself thinking that I feel weird.'),(83,4,'13. I find it difficult to contradict the views of others.'),(84,4,'14. I find it difficult to talk to someone who is attractive to the opposite sex'),(85,4,'15. I worry about not knowing what to say at a social event.'),(86,4,'16. It takes my nervousness to mix with people I don\'t know well.'),(87,4,'17. I feel I can say something embarrassing while talking.'),(88,4,'18. When I meet with a team, I am always afraid to be neglected.'),(89,4,'19. I feel anxious to join the team.'),(90,4,'20. I do not know exactly whether to greet a little acquaintance.'),(91,5,'1.I breathe frequently'),(92,5,'2.I feel overwhelmed'),(93,5,'3. My heart feels very heavy '),(94,5,'4. My heart beats really fast'),(95,5,'5.I feel heartache '),(96,5,'6. My body shivers a lot'),(97,5,'7. My hands or legs shivers frequently '),(98,5,'8. My hands or legs feel totally numb'),(99,5,'9. My hands or legs burn a lot'),(100,5,'10. I feel dizzy '),(101,5,'11. My head spins a lot'),(102,5,'12. I feel headache frequently '),(103,5,'13. I feel like hot steam is rising from my head'),(104,5,'14. My throat gets dry and thirsty'),(105,5,'15.I feel like getting sick '),(106,5,'16. I\'m worried about my health'),(107,5,'17. I feel weak'),(108,5,'18. I have difficulty digesting'),(109,5,'19. I feel discomfort in my stomach'),(110,5,'20. I feel nauseous'),(111,5,'21. I sweat a lot (not for the heat)'),(112,5,'22. I can\'t relax'),(113,5,'23. I have difficulty speaking in the social environment'),(114,5,'24. I think repeatedly about the same thing'),(115,5,'25. I\'m afraid something bad will happen'),(116,5,'26. I am often worried'),(117,5,'27. I am often surprised'),(118,5,'28. I feel awkward and terrified'),(119,5,'29. I\'m afraid of losing my self-control'),(120,5,'30. I feel so nervous or excited that I feel like everything is going random'),(121,5,'1. Behaviors / Behaviors tend to be unhappy and compassionate (such behavior is frequent and lasts for a long time).'),(122,5,'2. Significant changes in diet and sleep'),(132,6,'1. Has a sad demeanor(symptom is persistent)'),(133,6,'2. Significant Change in diet and sleep pattern'),(134,6,'3. Helpless and lost hope'),(135,6,'4. Can\'t concentrate and focus on yourself'),(136,6,'5. Everything (even talking and getting dressed) seems cumbersome'),(137,6,'6. Annoying and aggressive behaviour '),(138,6,'7. Sudden change in daily functioning (at school and homework)'),(139,6,'8. Be constantly unfocused / frustrated and looking for work'),(140,6,'9. Dangerous risk taking (taking drugs, driving, etc.)'),(141,6,'10. The number of friends is declining or being neglected'),(142,6,'11. Dislike yourself with feelings of self-satisfaction'),(143,6,'12. Do most of the above symptoms occur in your child?'),(144,6,'13. Symptoms are seen frequently ?'),(145,6,'14. Symptoms last longer?'),(146,6,'15. Symptoms cause the child a lot of trouble?'),(147,6,'16. Do the symptoms (baby and adolescent baby) hinder normal maturity?'),(148,6,'17. Are such behaviors preventing others from interacting?'),(149,6,'18. Are the problems causing the suffering of others?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_set_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkIdx_53` (`user_id`),
  KEY `fkIdx_56` (`question_set_id`),
  CONSTRAINT `FK_53` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_56` FOREIGN KEY (`question_set_id`) REFERENCES `question_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (19,1,1,80),(20,1,1,80),(21,1,1,80),(22,1,1,80),(23,1,1,80),(24,1,1,80),(25,1,1,80),(26,1,1,80),(27,1,1,80),(28,1,2,20),(29,1,2,20),(30,1,2,20),(31,1,2,20),(32,1,2,20),(33,1,2,2),(34,1,2,2),(35,1,2,2),(36,1,2,2),(37,1,2,20),(38,1,2,20),(39,1,2,20),(40,1,2,0),(41,1,2,0),(42,1,2,20),(43,1,2,1),(44,1,2,0),(45,1,2,0),(46,1,2,0),(47,1,2,0),(48,1,2,0),(49,1,2,0),(50,1,2,0),(51,1,2,0),(52,1,2,20),(53,1,2,0),(54,1,2,0),(55,1,2,0),(56,1,2,0),(57,1,2,0),(58,1,2,0),(59,1,2,0),(60,1,2,0),(61,1,2,0);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_breakdown`
--

DROP TABLE IF EXISTS `report_breakdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_breakdown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_set_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkIdx_40` (`user_id`),
  KEY `fkIdx_43` (`question_set_id`),
  KEY `fkIdx_46` (`question_id`),
  KEY `fkIdx_60` (`answer_id`),
  CONSTRAINT `FK_40` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_43` FOREIGN KEY (`question_set_id`) REFERENCES `question_set` (`id`),
  CONSTRAINT `FK_46` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `FK_60` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=940 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_breakdown`
--

LOCK TABLES `report_breakdown` WRITE;
/*!40000 ALTER TABLE `report_breakdown` DISABLE KEYS */;
INSERT INTO `report_breakdown` VALUES (80,1,1,1,5),(81,1,1,2,5),(82,1,1,3,5),(83,1,1,4,5),(84,1,1,5,5),(85,1,1,6,5),(86,1,1,7,5),(87,1,1,8,5),(88,1,1,9,5),(89,1,1,10,5),(90,1,1,11,5),(91,1,1,12,5),(92,1,1,13,5),(93,1,1,14,5),(94,1,1,15,5),(95,1,1,16,5),(96,1,1,17,5),(97,1,1,18,5),(98,1,1,19,5),(99,1,1,20,5),(100,1,1,1,5),(101,1,1,2,5),(102,1,1,3,5),(103,1,1,4,5),(104,1,1,5,5),(105,1,1,6,5),(106,1,1,7,5),(107,1,1,8,5),(108,1,1,9,5),(109,1,1,10,5),(110,1,1,11,5),(111,1,1,12,5),(112,1,1,13,5),(113,1,1,14,5),(114,1,1,15,5),(115,1,1,16,5),(116,1,1,17,5),(117,1,1,18,5),(118,1,1,19,5),(119,1,1,20,5),(120,1,1,1,5),(121,1,1,2,5),(122,1,1,3,5),(123,1,1,4,5),(124,1,1,5,5),(125,1,1,6,5),(126,1,1,7,5),(127,1,1,8,5),(128,1,1,9,5),(129,1,1,10,5),(130,1,1,11,5),(131,1,1,12,5),(132,1,1,13,5),(133,1,1,14,5),(134,1,1,15,5),(135,1,1,16,5),(136,1,1,17,5),(137,1,1,18,5),(138,1,1,19,5),(139,1,1,20,5),(140,1,1,1,5),(141,1,1,2,5),(142,1,1,3,5),(143,1,1,4,5),(144,1,1,5,5),(145,1,1,6,5),(146,1,1,7,5),(147,1,1,8,5),(148,1,1,9,5),(149,1,1,10,5),(150,1,1,11,5),(151,1,1,12,5),(152,1,1,13,5),(153,1,1,14,5),(154,1,1,15,5),(155,1,1,16,5),(156,1,1,17,5),(157,1,1,18,5),(158,1,1,19,5),(159,1,1,20,5),(160,1,1,1,5),(161,1,1,2,5),(162,1,1,3,5),(163,1,1,4,5),(164,1,1,5,5),(165,1,1,6,5),(166,1,1,7,5),(167,1,1,8,5),(168,1,1,9,5),(169,1,1,10,5),(170,1,1,11,5),(171,1,1,12,5),(172,1,1,13,5),(173,1,1,14,5),(174,1,1,15,5),(175,1,1,16,5),(176,1,1,17,5),(177,1,1,18,5),(178,1,1,19,5),(179,1,1,20,5),(180,1,1,1,5),(181,1,1,2,5),(182,1,1,3,5),(183,1,1,4,5),(184,1,1,5,5),(185,1,1,6,5),(186,1,1,7,5),(187,1,1,8,5),(188,1,1,9,5),(189,1,1,10,5),(190,1,1,11,5),(191,1,1,12,5),(192,1,1,13,5),(193,1,1,14,5),(194,1,1,15,5),(195,1,1,16,5),(196,1,1,17,5),(197,1,1,18,5),(198,1,1,19,5),(199,1,1,20,5),(200,1,1,1,5),(201,1,1,2,5),(202,1,1,3,5),(203,1,1,4,5),(204,1,1,5,5),(205,1,1,6,5),(206,1,1,7,5),(207,1,1,8,5),(208,1,1,9,5),(209,1,1,10,5),(210,1,1,11,5),(211,1,1,12,5),(212,1,1,13,5),(213,1,1,14,5),(214,1,1,15,5),(215,1,1,16,5),(216,1,1,17,5),(217,1,1,18,5),(218,1,1,19,5),(219,1,1,20,5),(220,1,1,1,5),(221,1,1,2,5),(222,1,1,3,5),(223,1,1,4,5),(224,1,1,5,5),(225,1,1,6,5),(226,1,1,7,5),(227,1,1,8,5),(228,1,1,9,5),(229,1,1,10,5),(230,1,1,11,5),(231,1,1,12,5),(232,1,1,13,5),(233,1,1,14,5),(234,1,1,15,5),(235,1,1,16,5),(236,1,1,17,5),(237,1,1,18,5),(238,1,1,19,5),(239,1,1,20,5),(240,1,1,1,5),(241,1,1,2,5),(242,1,1,3,5),(243,1,1,4,5),(244,1,1,5,5),(245,1,1,6,5),(246,1,1,7,5),(247,1,1,8,5),(248,1,1,9,5),(249,1,1,10,5),(250,1,1,11,5),(251,1,1,12,5),(252,1,1,13,5),(253,1,1,14,5),(254,1,1,15,5),(255,1,1,16,5),(256,1,1,17,5),(257,1,1,18,5),(258,1,1,19,5),(259,1,1,20,5),(260,1,2,21,7),(261,1,2,22,7),(262,1,2,23,7),(263,1,2,24,7),(264,1,2,25,7),(265,1,2,26,7),(266,1,2,27,7),(267,1,2,28,7),(268,1,2,29,7),(269,1,2,30,7),(270,1,2,31,7),(271,1,2,32,7),(272,1,2,33,7),(273,1,2,34,7),(274,1,2,35,7),(275,1,2,36,7),(276,1,2,37,7),(277,1,2,38,7),(278,1,2,39,7),(279,1,2,40,7),(280,1,2,21,7),(281,1,2,22,7),(282,1,2,23,7),(283,1,2,24,7),(284,1,2,25,7),(285,1,2,26,7),(286,1,2,27,7),(287,1,2,28,7),(288,1,2,29,7),(289,1,2,30,7),(290,1,2,31,7),(291,1,2,32,7),(292,1,2,33,7),(293,1,2,34,7),(294,1,2,35,7),(295,1,2,36,7),(296,1,2,37,7),(297,1,2,38,7),(298,1,2,39,7),(299,1,2,40,7),(300,1,2,21,7),(301,1,2,22,7),(302,1,2,23,7),(303,1,2,24,7),(304,1,2,25,7),(305,1,2,26,7),(306,1,2,27,7),(307,1,2,28,7),(308,1,2,29,7),(309,1,2,30,7),(310,1,2,31,7),(311,1,2,32,7),(312,1,2,33,7),(313,1,2,34,7),(314,1,2,35,7),(315,1,2,36,7),(316,1,2,37,7),(317,1,2,38,7),(318,1,2,39,7),(319,1,2,40,7),(320,1,2,21,7),(321,1,2,22,7),(322,1,2,23,7),(323,1,2,24,7),(324,1,2,25,7),(325,1,2,26,7),(326,1,2,27,7),(327,1,2,28,7),(328,1,2,29,7),(329,1,2,30,7),(330,1,2,31,7),(331,1,2,32,7),(332,1,2,33,7),(333,1,2,34,7),(334,1,2,35,7),(335,1,2,36,7),(336,1,2,37,7),(337,1,2,38,7),(338,1,2,39,7),(339,1,2,40,7),(340,1,2,21,7),(341,1,2,22,7),(342,1,2,23,7),(343,1,2,24,7),(344,1,2,25,7),(345,1,2,26,7),(346,1,2,27,7),(347,1,2,28,7),(348,1,2,29,7),(349,1,2,30,7),(350,1,2,31,7),(351,1,2,32,7),(352,1,2,33,7),(353,1,2,34,7),(354,1,2,35,7),(355,1,2,36,7),(356,1,2,37,7),(357,1,2,38,7),(358,1,2,39,7),(359,1,2,40,7),(360,1,2,21,7),(361,1,2,22,6),(362,1,2,23,6),(363,1,2,24,6),(364,1,2,25,6),(365,1,2,26,7),(366,1,2,27,6),(367,1,2,28,6),(368,1,2,29,6),(369,1,2,30,6),(370,1,2,31,6),(371,1,2,32,6),(372,1,2,33,6),(373,1,2,34,6),(374,1,2,35,6),(375,1,2,36,6),(376,1,2,37,6),(377,1,2,38,6),(378,1,2,39,6),(379,1,2,40,6),(380,1,2,21,7),(381,1,2,22,6),(382,1,2,23,6),(383,1,2,24,6),(384,1,2,25,6),(385,1,2,26,7),(386,1,2,27,6),(387,1,2,28,6),(388,1,2,29,6),(389,1,2,30,6),(390,1,2,31,6),(391,1,2,32,6),(392,1,2,33,6),(393,1,2,34,6),(394,1,2,35,6),(395,1,2,36,6),(396,1,2,37,6),(397,1,2,38,6),(398,1,2,39,6),(399,1,2,40,6),(400,1,2,21,7),(401,1,2,22,6),(402,1,2,23,6),(403,1,2,24,6),(404,1,2,25,6),(405,1,2,26,7),(406,1,2,27,6),(407,1,2,28,6),(408,1,2,29,6),(409,1,2,30,6),(410,1,2,31,6),(411,1,2,32,6),(412,1,2,33,6),(413,1,2,34,6),(414,1,2,35,6),(415,1,2,36,6),(416,1,2,37,6),(417,1,2,38,6),(418,1,2,39,6),(419,1,2,40,6),(420,1,2,21,7),(421,1,2,22,6),(422,1,2,23,6),(423,1,2,24,6),(424,1,2,25,6),(425,1,2,26,7),(426,1,2,27,6),(427,1,2,28,6),(428,1,2,29,6),(429,1,2,30,6),(430,1,2,31,6),(431,1,2,32,6),(432,1,2,33,6),(433,1,2,34,6),(434,1,2,35,6),(435,1,2,36,6),(436,1,2,37,6),(437,1,2,38,6),(438,1,2,39,6),(439,1,2,40,6),(440,1,2,21,7),(441,1,2,22,7),(442,1,2,23,7),(443,1,2,24,7),(444,1,2,25,7),(445,1,2,26,7),(446,1,2,27,7),(447,1,2,28,7),(448,1,2,29,7),(449,1,2,30,7),(450,1,2,31,7),(451,1,2,32,7),(452,1,2,33,7),(453,1,2,34,7),(454,1,2,35,7),(455,1,2,36,7),(456,1,2,37,7),(457,1,2,38,7),(458,1,2,39,7),(459,1,2,40,7),(460,1,2,21,7),(461,1,2,22,7),(462,1,2,23,7),(463,1,2,24,7),(464,1,2,25,7),(465,1,2,26,7),(466,1,2,27,7),(467,1,2,28,7),(468,1,2,29,7),(469,1,2,30,7),(470,1,2,31,7),(471,1,2,32,7),(472,1,2,33,7),(473,1,2,34,7),(474,1,2,35,7),(475,1,2,36,7),(476,1,2,37,7),(477,1,2,38,7),(478,1,2,39,7),(479,1,2,40,7),(480,1,2,21,7),(481,1,2,22,7),(482,1,2,23,7),(483,1,2,24,7),(484,1,2,25,7),(485,1,2,26,7),(486,1,2,27,7),(487,1,2,28,7),(488,1,2,29,7),(489,1,2,30,7),(490,1,2,31,7),(491,1,2,32,7),(492,1,2,33,7),(493,1,2,34,7),(494,1,2,35,7),(495,1,2,36,7),(496,1,2,37,7),(497,1,2,38,7),(498,1,2,39,7),(499,1,2,40,7),(500,1,2,21,6),(501,1,2,21,6),(502,1,2,22,6),(503,1,2,22,6),(504,1,2,23,6),(505,1,2,23,6),(506,1,2,24,6),(507,1,2,24,6),(508,1,2,25,6),(509,1,2,25,6),(510,1,2,26,6),(511,1,2,27,6),(512,1,2,26,6),(513,1,2,27,6),(514,1,2,28,6),(515,1,2,29,6),(516,1,2,28,6),(517,1,2,29,6),(518,1,2,30,6),(519,1,2,30,6),(520,1,2,31,6),(521,1,2,32,6),(522,1,2,31,6),(523,1,2,33,6),(524,1,2,32,6),(525,1,2,34,6),(526,1,2,33,6),(527,1,2,35,6),(528,1,2,34,6),(529,1,2,36,6),(530,1,2,35,6),(531,1,2,37,6),(532,1,2,36,6),(533,1,2,38,6),(534,1,2,37,6),(535,1,2,39,6),(536,1,2,38,6),(537,1,2,40,6),(538,1,2,39,6),(539,1,2,40,6),(540,1,2,21,7),(541,1,2,22,7),(542,1,2,23,7),(543,1,2,24,7),(544,1,2,25,7),(545,1,2,26,7),(546,1,2,27,7),(547,1,2,28,7),(548,1,2,29,7),(549,1,2,30,7),(550,1,2,31,7),(551,1,2,32,7),(552,1,2,33,7),(553,1,2,34,7),(554,1,2,35,7),(555,1,2,36,7),(556,1,2,37,7),(557,1,2,38,7),(558,1,2,39,7),(559,1,2,40,7),(560,1,2,21,7),(561,1,2,22,6),(562,1,2,23,6),(563,1,2,24,6),(564,1,2,25,6),(565,1,2,26,6),(566,1,2,27,6),(567,1,2,28,6),(568,1,2,29,6),(569,1,2,30,6),(570,1,2,31,6),(571,1,2,32,6),(572,1,2,33,6),(573,1,2,34,6),(574,1,2,35,6),(575,1,2,36,6),(576,1,2,37,6),(577,1,2,38,6),(578,1,2,39,6),(579,1,2,40,6),(580,1,2,21,6),(581,1,2,22,6),(582,1,2,23,6),(583,1,2,24,6),(584,1,2,25,6),(585,1,2,26,6),(586,1,2,27,6),(587,1,2,28,6),(588,1,2,29,6),(589,1,2,30,6),(590,1,2,31,6),(591,1,2,32,6),(592,1,2,33,6),(593,1,2,34,6),(594,1,2,35,6),(595,1,2,36,6),(596,1,2,37,6),(597,1,2,38,6),(598,1,2,39,6),(599,1,2,40,6),(600,1,2,21,6),(601,1,2,22,6),(602,1,2,23,6),(603,1,2,24,6),(604,1,2,25,6),(605,1,2,26,6),(606,1,2,27,6),(607,1,2,28,6),(608,1,2,29,6),(609,1,2,30,6),(610,1,2,31,6),(611,1,2,32,6),(612,1,2,33,6),(613,1,2,34,6),(614,1,2,35,6),(615,1,2,36,6),(616,1,2,37,6),(617,1,2,38,6),(618,1,2,39,6),(619,1,2,40,6),(620,1,2,21,6),(621,1,2,22,6),(622,1,2,23,6),(623,1,2,24,6),(624,1,2,25,6),(625,1,2,26,6),(626,1,2,27,6),(627,1,2,28,6),(628,1,2,29,6),(629,1,2,30,6),(630,1,2,31,6),(631,1,2,32,6),(632,1,2,33,6),(633,1,2,34,6),(634,1,2,35,6),(635,1,2,36,6),(636,1,2,37,6),(637,1,2,38,6),(638,1,2,39,6),(639,1,2,40,6),(640,1,2,21,6),(641,1,2,22,6),(642,1,2,23,6),(643,1,2,24,6),(644,1,2,25,6),(645,1,2,26,6),(646,1,2,27,6),(647,1,2,28,6),(648,1,2,29,6),(649,1,2,30,6),(650,1,2,31,6),(651,1,2,32,6),(652,1,2,33,6),(653,1,2,34,6),(654,1,2,35,6),(655,1,2,36,6),(656,1,2,37,6),(657,1,2,38,6),(658,1,2,39,6),(659,1,2,40,6),(660,1,2,21,6),(661,1,2,22,6),(662,1,2,23,6),(663,1,2,24,6),(664,1,2,25,6),(665,1,2,26,6),(666,1,2,27,6),(667,1,2,28,6),(668,1,2,29,6),(669,1,2,30,6),(670,1,2,31,6),(671,1,2,32,6),(672,1,2,33,6),(673,1,2,34,6),(674,1,2,35,6),(675,1,2,36,6),(676,1,2,37,6),(677,1,2,38,6),(678,1,2,39,6),(679,1,2,40,6),(680,1,2,21,6),(681,1,2,22,6),(682,1,2,23,6),(683,1,2,24,6),(684,1,2,25,6),(685,1,2,26,6),(686,1,2,27,6),(687,1,2,28,6),(688,1,2,29,6),(689,1,2,30,6),(690,1,2,31,6),(691,1,2,32,6),(692,1,2,33,6),(693,1,2,34,6),(694,1,2,35,6),(695,1,2,36,6),(696,1,2,37,6),(697,1,2,38,6),(698,1,2,39,6),(699,1,2,40,6),(700,1,2,21,6),(701,1,2,22,6),(702,1,2,23,6),(703,1,2,24,6),(704,1,2,25,6),(705,1,2,26,6),(706,1,2,27,6),(707,1,2,28,6),(708,1,2,29,6),(709,1,2,30,6),(710,1,2,31,6),(711,1,2,32,6),(712,1,2,33,6),(713,1,2,34,6),(714,1,2,35,6),(715,1,2,36,6),(716,1,2,37,6),(717,1,2,38,6),(718,1,2,39,6),(719,1,2,40,6),(720,1,2,21,6),(721,1,2,22,6),(722,1,2,23,6),(723,1,2,24,6),(724,1,2,25,6),(725,1,2,26,6),(726,1,2,27,6),(727,1,2,28,6),(728,1,2,29,6),(729,1,2,30,6),(730,1,2,31,6),(731,1,2,32,6),(732,1,2,33,6),(733,1,2,34,6),(734,1,2,35,6),(735,1,2,36,6),(736,1,2,37,6),(737,1,2,38,6),(738,1,2,39,6),(739,1,2,40,6),(740,1,2,21,7),(741,1,2,22,7),(742,1,2,23,7),(743,1,2,24,7),(744,1,2,25,7),(745,1,2,26,7),(746,1,2,27,7),(747,1,2,28,7),(748,1,2,29,7),(749,1,2,30,7),(750,1,2,31,7),(751,1,2,32,7),(752,1,2,33,7),(753,1,2,34,7),(754,1,2,35,7),(755,1,2,36,7),(756,1,2,37,7),(757,1,2,38,7),(758,1,2,39,7),(759,1,2,40,7),(760,1,2,21,6),(761,1,2,22,6),(762,1,2,23,6),(763,1,2,24,6),(764,1,2,25,6),(765,1,2,26,6),(766,1,2,27,6),(767,1,2,28,6),(768,1,2,29,6),(769,1,2,30,6),(770,1,2,31,6),(771,1,2,32,6),(772,1,2,33,6),(773,1,2,34,6),(774,1,2,35,6),(775,1,2,36,6),(776,1,2,37,6),(777,1,2,38,6),(778,1,2,39,6),(779,1,2,40,6),(780,1,2,21,6),(781,1,2,22,6),(782,1,2,23,6),(783,1,2,24,6),(784,1,2,25,6),(785,1,2,26,6),(786,1,2,27,6),(787,1,2,28,6),(788,1,2,29,6),(789,1,2,30,6),(790,1,2,31,6),(791,1,2,32,6),(792,1,2,33,6),(793,1,2,34,6),(794,1,2,35,6),(795,1,2,36,6),(796,1,2,37,6),(797,1,2,38,6),(798,1,2,39,6),(799,1,2,40,6),(800,1,2,21,6),(801,1,2,22,6),(802,1,2,23,6),(803,1,2,24,6),(804,1,2,25,6),(805,1,2,26,6),(806,1,2,27,6),(807,1,2,28,6),(808,1,2,29,6),(809,1,2,30,6),(810,1,2,31,6),(811,1,2,32,6),(812,1,2,33,6),(813,1,2,34,6),(814,1,2,35,6),(815,1,2,36,6),(816,1,2,37,6),(817,1,2,38,6),(818,1,2,39,6),(819,1,2,40,6),(820,1,2,21,6),(821,1,2,22,6),(822,1,2,23,6),(823,1,2,24,6),(824,1,2,25,6),(825,1,2,26,6),(826,1,2,27,6),(827,1,2,28,6),(828,1,2,29,6),(829,1,2,30,6),(830,1,2,31,6),(831,1,2,32,6),(832,1,2,33,6),(833,1,2,34,6),(834,1,2,35,6),(835,1,2,36,6),(836,1,2,37,6),(837,1,2,38,6),(838,1,2,39,6),(839,1,2,40,6),(840,1,2,21,6),(841,1,2,22,6),(842,1,2,23,6),(843,1,2,24,6),(844,1,2,25,6),(845,1,2,26,6),(846,1,2,27,6),(847,1,2,28,6),(848,1,2,29,6),(849,1,2,30,6),(850,1,2,31,6),(851,1,2,32,6),(852,1,2,33,6),(853,1,2,34,6),(854,1,2,35,6),(855,1,2,36,6),(856,1,2,37,6),(857,1,2,38,6),(858,1,2,39,6),(859,1,2,40,6),(860,1,2,21,6),(861,1,2,22,6),(862,1,2,23,6),(863,1,2,24,6),(864,1,2,25,6),(865,1,2,26,6),(866,1,2,27,6),(867,1,2,28,6),(868,1,2,29,6),(869,1,2,30,6),(870,1,2,31,6),(871,1,2,32,6),(872,1,2,33,6),(873,1,2,34,6),(874,1,2,35,6),(875,1,2,36,6),(876,1,2,37,6),(877,1,2,38,6),(878,1,2,39,6),(879,1,2,40,6),(880,1,2,21,6),(881,1,2,22,6),(882,1,2,23,6),(883,1,2,24,6),(884,1,2,25,6),(885,1,2,26,6),(886,1,2,27,6),(887,1,2,28,6),(888,1,2,29,6),(889,1,2,30,6),(890,1,2,31,6),(891,1,2,32,6),(892,1,2,33,6),(893,1,2,34,6),(894,1,2,35,6),(895,1,2,36,6),(896,1,2,37,6),(897,1,2,38,6),(898,1,2,39,6),(899,1,2,40,6),(900,1,2,21,6),(901,1,2,22,6),(902,1,2,23,6),(903,1,2,24,6),(904,1,2,25,6),(905,1,2,26,6),(906,1,2,27,6),(907,1,2,28,6),(908,1,2,29,6),(909,1,2,30,6),(910,1,2,31,6),(911,1,2,32,6),(912,1,2,33,6),(913,1,2,34,6),(914,1,2,35,6),(915,1,2,36,6),(916,1,2,37,6),(917,1,2,38,6),(918,1,2,39,6),(919,1,2,40,6),(920,1,2,21,6),(921,1,2,22,6),(922,1,2,23,6),(923,1,2,24,6),(924,1,2,25,6),(925,1,2,26,6),(926,1,2,27,6),(927,1,2,28,6),(928,1,2,29,6),(929,1,2,30,6),(930,1,2,31,6),(931,1,2,32,6),(932,1,2,33,6),(933,1,2,34,6),(934,1,2,35,6),(935,1,2,36,6),(936,1,2,37,6),(937,1,2,38,6),(938,1,2,39,6),(939,1,2,40,6);
/*!40000 ALTER TABLE `report_breakdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_set_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `maximum` int(11) DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  `is_appointment_required` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_set_id` (`question_set_id`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`question_set_id`) REFERENCES `question_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (5,1,'Mild',23,0,0),(6,1,'Moderate',40,24,0),(7,1,'Severe',49,41,1),(8,1,'Profound',80,50,1),(9,2,'Low',5,0,1),(10,2,'Medium',15,6,1),(11,2,'High',28,16,0),(12,3,'Minimal',100,30,0),(13,3,'Mild',114,101,0),(14,3,'Moderate',123,115,1),(15,3,'Severe',150,124,1),(16,4,'Slight',20,0,0),(17,4,'Moderate',40,21,0),(18,4,'Very Much',60,41,1),(19,4,'Extremely',80,61,1),(20,5,'Mild',54,0,0),(21,5,'Moderate',66,55,0),(22,5,'Severe',77,67,1),(23,5,'Profound',144,78,1);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'riasat','riasatsakif@gmail.com','123456'),(4,'{}','{}','{}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-04  3:15:26
