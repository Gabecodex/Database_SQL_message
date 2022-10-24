CREATE DATABASE  IF NOT EXISTS `trebas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trebas`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trebas
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group` (
  `id_group` int NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
INSERT INTO `Group` VALUES (49767,'group test 332','2007-02-20 00:00:00','2007-02-20 00:00:00'),(64715,'group test 944','2011-03-07 00:00:00','2011-03-07 00:00:00'),(87500,'group test 850','2014-06-17 00:00:00','2014-06-17 00:00:00');
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_users`
--

DROP TABLE IF EXISTS `Group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group_users` (
  `id_user` int NOT NULL,
  `id_group` int NOT NULL,
  `date_user_joined` datetime DEFAULT NULL,
  `date_user_left` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_group`),
  KEY `fk_User_has_Group_chat\_Group_chat\1_idx` (`id_group`),
  KEY `fk_User_has_Group_chat\_User1_idx` (`id_user`),
  CONSTRAINT `fk_User_has_Group_chat\_Group_chat\1` FOREIGN KEY (`id_group`) REFERENCES `Group` (`id_group`),
  CONSTRAINT `fk_User_has_Group_chat\_User1` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_users`
--

LOCK TABLES `Group_users` WRITE;
/*!40000 ALTER TABLE `Group_users` DISABLE KEYS */;
INSERT INTO `Group_users` VALUES (23214,87500,'2003-01-10 00:00:00','2003-01-10 00:00:00');
/*!40000 ALTER TABLE `Group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
  `id_message` int NOT NULL,
  `message` longtext,
  `date_sent` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `is_delivered` int DEFAULT '0',
  `id_user` int NOT NULL,
  `id_group` int DEFAULT NULL,
  PRIMARY KEY (`id_message`),
  KEY `fk_Messages_user_idx` (`id_user`),
  KEY `fk_Messages_Group1_idx` (`id_group`),
  CONSTRAINT `fk_Messages_Group1` FOREIGN KEY (`id_group`) REFERENCES `Group` (`id_group`),
  CONSTRAINT `fk_Messages_user` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES (53172,'message test 956 from group','2022-10-19 18:55:39',NULL,0,23214,64715),(62697,'message test 851','2000-02-06 00:00:00','2000-02-06 00:00:00',0,23214,NULL),(79917,'message test 551','2022-10-19 18:52:24',NULL,0,23214,NULL);
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telephone`
--

DROP TABLE IF EXISTS `Telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Telephone` (
  `id_telephone` int NOT NULL,
  `telephone_number` bigint NOT NULL,
  `date_added` date DEFAULT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_telephone`),
  UNIQUE KEY `telephone_number_UNIQUE` (`telephone_number`),
  KEY `fk_Telephone_user1_idx` (`id_user`),
  CONSTRAINT `fk_Telephone_user1` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telephone`
--

LOCK TABLES `Telephone` WRITE;
/*!40000 ALTER TABLE `Telephone` DISABLE KEYS */;
INSERT INTO `Telephone` VALUES (16926,100211630,'2006-05-27',23214),(38041,848760742,'2005-05-09',69747);
/*!40000 ALTER TABLE `Telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id_user` int NOT NULL,
  `date_created` date DEFAULT NULL,
  `is_confirmed` int DEFAULT '0',
  `is_active` int DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  UNIQUE KEY `password_UNIQUE` (`password`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (23214,'2003-02-16',0,0,'usertest660@email.com','user test 660','6d559209'),(69747,'2000-04-13',0,0,'342b4298@email.com','user test 580','342b42b6');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'trebas'
--

--
-- Dumping routines for database 'trebas'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_messages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_messages`()
BEGIN

SELECT Messages.id_user as 'User ID'
, user_name as 'Username'
, id_message as 'Message ID'
, message as 'Message'
, date_sent as 'Date sent'
, date_read as 'Date read'
, Messages.id_group  as 'Group ID'
, group_name  as 'Group name'
FROM Messages

JOIN User ON Messages.id_user = User.id_user
LEFT JOIN trebas.Group ON Messages.id_group = trebas.Group.id_group

;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_users_and groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_users_and groups`()
BEGIN

SELECT *
FROM Group_users
JOIN trebas.Group ON Group_users.id_group = trebas.Group.id_group
JOIN User ON Group_users.id_user = User.id_user

;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_users_and_groups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_users_and_groups`()
BEGIN

SELECT User.id_user as 'User ID'
, user_name as 'Username'
, email as 'Email'
, is_confirmed as 'Confirmed'
, is_active as 'Active'
, Group_users.id_group  as 'Group ID'
, group_name  as 'Group name'


FROM Group_users
JOIN trebas.Group ON Group_users.id_group = trebas.Group.id_group
JOIN User ON Group_users.id_user = User.id_user

;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_users_and_telephones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_users_and_telephones`()
BEGIN

SELECT *
FROM User
JOIN Telephone ON Telephone.id_user = User.id_user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_random_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insert_random_group`()
BEGIN

DECLARE min_random INT;
DECLARE max_random INT;
DECLARE id_random INT;
DECLARE day_random INT;
DECLARE month_random INT;
DECLARE year_random INT;
DECLARE i_random INT;

SET min_random = 1000;
SET max_random = 99999;
SET id_random = FLOOR(min_random + RAND()*(max_random-min_random));
SET day_random = FLOOR(1 + RAND()*(28-1));
SET month_random = FLOOR(1 + RAND()*(12-1));
SET year_random = FLOOR(2000 + RAND()*(2022-2000));
SET i_random = FLOOR(1 + RAND()*(999-1));

INSERT INTO trebas.Group
(id_group, group_name, date_created, date_updated)
VALUES
(id_random
, CONCAT("group test ", i_random)
, DATE(CONCAT(year_random, CONCAT("-", CONCAT(month_random, CONCAT("-", day_random)))))
, DATE(CONCAT(year_random, CONCAT("-", CONCAT(month_random, CONCAT("-", day_random)))))
)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_random_group_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insert_random_group_users`()
BEGIN

DECLARE day_random INT;
DECLARE month_random INT;
DECLARE year_random INT;

SET day_random = FLOOR(1 + RAND()*(28-1));
SET month_random = FLOOR(1 + RAND()*(12-1));
SET year_random = FLOOR(2000 + RAND()*(2022-2000));

INSERT INTO Group_users
(id_user, id_group, date_user_joined, date_user_left)
VALUES
( (SELECT id_user FROM User ORDER BY RAND() LIMIT 1)
, (SELECT id_group FROM trebas.Group ORDER BY RAND() LIMIT 1)
, DATE(CONCAT(year_random, CONCAT("-", CONCAT(month_random, CONCAT("-", day_random)))))
, DATE(CONCAT(year_random, CONCAT("-", CONCAT(month_random, CONCAT("-", day_random)))))
)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_random_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insert_random_message`()
BEGIN

DECLARE min_random INT;
DECLARE max_random INT;
DECLARE id_random INT;
DECLARE flag_random INT;
DECLARE i_random INT;

SET min_random = 1000;
SET max_random = 99999;
SET id_random = FLOOR(min_random + RAND()*(max_random-min_random));
SET flag_random = FLOOR(0 + RAND()*(1-0));
SET i_random = FLOOR(1 + RAND()*(999-1));

INSERT INTO Messages
(id_message, message, date_sent, date_read, is_delivered, id_user, id_group)
VALUES
(id_random
, CONCAT("message test ", i_random)
, current_timestamp()
, null
, flag_random
, (SELECT id_user FROM User ORDER BY RAND() LIMIT 1)
, null
)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_random_message_from_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insert_random_message_from_group`()
BEGIN

DECLARE min_random INT;
DECLARE max_random INT;
DECLARE id_random INT;
DECLARE flag_random INT;
DECLARE i_random INT;

SET min_random = 1000;
SET max_random = 99999;
SET id_random = FLOOR(min_random + RAND()*(max_random-min_random));
SET flag_random = FLOOR(0 + RAND()*(1-0));
SET i_random = FLOOR(1 + RAND()*(999-1));

INSERT INTO Messages
(id_message, message, date_sent, date_read, is_delivered, id_user, id_group)
VALUES
(id_random
, CONCAT("message test ", CONCAT(i_random, " from group"))
, current_timestamp()
, null
, flag_random
, (SELECT id_user FROM User ORDER BY RAND() LIMIT 1)
, (SELECT id_group FROM trebas.Group ORDER BY RAND() LIMIT 1)
)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_random_telephone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insert_random_telephone`()
BEGIN

DECLARE min_random INT;
DECLARE max_random INT;
DECLARE id_random INT;
DECLARE day_random INT;
DECLARE month_random INT;
DECLARE year_random INT;
DECLARE telephone_random INT;

SET min_random = 1000;
SET max_random = 99999;
SET id_random = FLOOR(min_random + RAND()*(max_random-min_random));
SET day_random = FLOOR(1 + RAND()*(28-1));
SET month_random = FLOOR(1 + RAND()*(12-1));
SET year_random = FLOOR(2000 + RAND()*(2022-2000));
SET telephone_random = FLOOR(max_random + RAND()*(999999999-max_random));

INSERT INTO Telephone
(id_telephone, telephone_number, date_added, id_user)
VALUES
(id_random
, telephone_random
, DATE(CONCAT(year_random, CONCAT("-", CONCAT(month_random, CONCAT("-", day_random)))))
, (SELECT id_user FROM User ORDER BY RAND() LIMIT 1)
)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_random_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `insert_random_user`()
BEGIN

DECLARE min_random INT;
DECLARE max_random INT;
DECLARE id_random INT;
DECLARE day_random INT;
DECLARE month_random INT;
DECLARE year_random INT;
DECLARE flag_random INT;
DECLARE i_random INT;

SET min_random = 1000;
SET max_random = 99999;
SET id_random = FLOOR(min_random + RAND()*(max_random-min_random));
SET day_random = FLOOR(1 + RAND()*(28-1));
SET month_random = FLOOR(1 + RAND()*(12-1));
SET year_random = FLOOR(2000 + RAND()*(2022-2000));
SET flag_random = FLOOR(0 + RAND()*(1-0));
SET i_random = FLOOR(1 + RAND()*(999-1));

INSERT INTO User
(id_user, date_created, is_confirmed, is_active, email, user_name, password)
VALUES
(id_random
, DATE(CONCAT(year_random, CONCAT("-", CONCAT(month_random, CONCAT("-", day_random)))))
, flag_random
, flag_random
, CONCAT("usertest", CONCAT(i_random, "@email.com"))
, CONCAT("user test ", i_random)
, LEFT(UUID(), 8)
)
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `new_procedure`()
BEGIN

SELECT *
FROM User
JOIN Telephone ON Telephone.id_user = User.id_user;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-21 18:36:35
