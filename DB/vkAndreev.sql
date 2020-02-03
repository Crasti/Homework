-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (4,'aut'),(9,'dolor'),(7,'doloremque'),(5,'et'),(1,'expedita'),(3,'modi'),(6,'nisi'),(10,'nulla'),(2,'tenetur'),(8,'voluptatem');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities_users` (
  `community_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `communities_users_user_id_fk` (`user_id`),
  CONSTRAINT `communities_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_id_fk` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (7,1),(3,2),(1,3),(6,4),(1,5),(10,6),(3,7),(1,8),(7,9),(7,10),(4,11),(7,12),(3,13),(6,14),(4,15),(10,16),(10,17),(7,18),(10,19),(5,20),(9,21),(7,22),(4,23),(8,24),(9,25),(10,26),(9,27),(9,28),(10,29),(4,30),(10,31),(2,32),(8,33),(4,34),(4,35),(10,36),(6,37),(5,38),(10,39),(5,40),(2,41),(8,42),(6,43),(4,44),(1,45),(1,46),(1,47),(6,48),(10,49),(1,50),(2,51),(3,52),(8,53),(7,54),(2,55),(3,56),(6,57),(5,58),(8,59),(9,60),(3,61),(10,62),(9,63),(2,64),(8,65),(3,66),(7,67),(6,68),(1,69),(4,70),(10,71),(1,72),(3,73),(10,74),(5,75),(5,76),(7,77),(5,78),(8,79),(2,80),(10,81),(6,82),(5,83),(2,84),(7,85),(6,86),(4,87),(4,88),(7,89),(8,90),(9,91),(4,92),(9,93),(9,94),(2,95),(2,96),(7,97),(8,98),(9,99),(4,100);
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_statuses`
--

DROP TABLE IF EXISTS `family_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_statuses`
--

LOCK TABLES `family_statuses` WRITE;
/*!40000 ALTER TABLE `family_statuses` DISABLE KEYS */;
INSERT INTO `family_statuses` VALUES (2,'Married'),(1,'Single');
/*!40000 ALTER TABLE `family_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (1,63,1,'2009-11-05 13:00:00','2009-11-05 13:00:00'),(6,30,1,'1977-12-12 17:46:52','1986-06-12 01:46:23'),(12,54,2,'2002-07-10 22:35:01','2017-12-29 01:13:34'),(12,79,1,'1997-11-06 14:16:05','2004-03-01 02:01:33'),(13,37,2,'1974-04-27 10:43:57','1974-04-27 10:43:57'),(13,51,2,'1980-08-13 00:02:07','1980-08-13 00:02:07'),(13,75,2,'2005-02-22 05:54:40','2019-01-31 16:15:02'),(14,80,3,'1971-11-01 04:57:11','1986-02-22 17:01:44'),(15,8,2,'1990-01-20 17:50:59','1990-01-20 17:50:59'),(17,30,3,'1973-10-12 10:52:06','2012-03-29 08:41:00'),(20,4,2,'1976-11-01 07:43:13','1976-11-01 07:43:13'),(21,67,3,'1976-11-18 14:16:16','1976-11-18 14:16:16'),(23,27,3,'1980-06-07 05:17:01','1988-11-09 07:35:56'),(31,15,2,'2015-08-25 01:04:34','2015-08-25 01:04:34'),(32,33,2,'1981-09-28 07:14:20','2000-03-24 16:26:36'),(33,63,3,'1987-03-30 21:16:09','2005-12-01 12:27:57'),(34,78,2,'1992-01-01 19:51:18','1992-01-01 19:51:18'),(35,11,1,'1989-08-18 23:52:43','1991-04-06 03:51:37'),(35,52,2,'1973-09-28 02:53:53','1973-09-28 02:53:53'),(37,41,3,'1987-11-30 14:50:25','1987-11-30 14:50:25'),(44,46,1,'1990-10-15 09:25:49','2006-05-09 12:02:55'),(45,60,2,'1988-01-09 07:13:50','1988-01-09 07:13:50'),(46,32,1,'1982-08-06 02:42:35','1982-08-06 02:42:35'),(51,1,2,'1991-04-15 08:06:49','1991-04-15 08:06:49'),(52,25,3,'2016-03-29 17:20:12','2019-07-20 11:32:38'),(52,54,2,'2000-08-28 07:22:40','2011-03-04 11:59:07'),(54,56,2,'2008-06-16 00:13:07','2008-06-16 00:13:07'),(57,47,1,'1982-03-14 02:57:01','1982-03-14 02:57:01'),(57,49,2,'1973-05-13 01:57:43','1973-05-13 01:57:43'),(59,38,1,'1971-02-19 06:57:40','1999-01-31 18:34:05'),(61,66,3,'1974-12-23 17:58:17','1974-12-23 17:58:17'),(61,92,1,'1992-11-24 04:55:13','2002-11-09 07:24:24'),(64,87,2,'2010-03-12 14:13:02','2010-03-12 14:13:02'),(66,47,1,'1973-02-25 06:00:17','1984-06-06 07:23:23'),(67,52,3,'1997-12-05 06:08:33','2003-01-22 15:09:14'),(69,46,1,'1993-02-15 13:27:00','1993-02-15 13:27:00'),(69,68,1,'1974-11-02 13:24:52','1974-11-02 13:24:52'),(71,9,3,'1972-08-24 13:04:23','1972-08-24 13:04:23'),(73,61,1,'1978-12-17 15:05:23','1984-03-23 05:43:04'),(75,66,3,'1979-06-19 04:45:08','1987-07-16 01:48:38'),(78,13,2,'2001-05-21 03:38:37','2003-02-14 02:53:09'),(79,34,2,'1975-11-23 16:04:44','1975-11-23 16:04:44'),(80,57,1,'1980-08-25 12:01:08','1980-08-25 12:01:08'),(82,46,3,'2000-07-13 18:07:00','2014-03-15 13:26:42'),(85,44,2,'1974-10-04 04:21:17','1974-10-04 04:21:17'),(85,87,3,'1973-01-04 12:30:50','1973-01-04 12:30:50'),(86,96,2,'1980-10-18 21:28:37','2013-09-04 23:37:17'),(96,54,2,'1971-09-14 05:37:02','1971-09-14 05:37:02'),(97,61,2,'1996-03-13 16:02:52','1996-03-13 16:02:52'),(98,1,3,'1988-02-26 21:56:38','1988-02-26 21:56:38');
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship_statuses`
--

DROP TABLE IF EXISTS `friendship_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendship_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship_statuses`
--

LOCK TABLES `friendship_statuses` WRITE;
/*!40000 ALTER TABLE `friendship_statuses` DISABLE KEYS */;
INSERT INTO `friendship_statuses` VALUES (2,'Confirmed'),(3,'Rejected'),(1,'Requested');
/*!40000 ALTER TABLE `friendship_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `target_id` int(10) unsigned NOT NULL,
  `target_type_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_fk` (`user_id`),
  KEY `likes_target_id_fk` (`target_id`),
  KEY `likes_target_type_id_fk` (`target_type_id`),
  CONSTRAINT `likes_target_id_fk` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_target_type_id_fk` FOREIGN KEY (`target_type_id`) REFERENCES `target_types` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `likes_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,10,89,1,'2020-01-27 12:51:09'),(2,3,72,3,'2020-01-27 12:51:09'),(3,39,39,4,'2020-01-27 12:51:09'),(4,79,58,2,'2020-01-27 12:51:09'),(5,75,25,1,'2020-01-27 12:51:09'),(6,32,56,4,'2020-01-27 12:51:09'),(7,39,48,1,'2020-01-27 12:51:09'),(8,82,32,1,'2020-01-27 12:51:09'),(9,77,41,3,'2020-01-27 12:51:09'),(10,37,68,2,'2020-01-27 12:51:09'),(11,32,80,1,'2020-01-27 12:51:09'),(12,65,22,1,'2020-01-27 12:51:09'),(13,12,11,1,'2020-01-27 12:51:09'),(14,60,44,2,'2020-01-27 12:51:09'),(15,73,39,3,'2020-01-27 12:51:09'),(16,60,73,4,'2020-01-27 12:51:09'),(17,13,3,3,'2020-01-27 12:51:09'),(18,65,98,4,'2020-01-27 12:51:09'),(19,96,83,2,'2020-01-27 12:51:09'),(20,95,85,2,'2020-01-27 12:51:09'),(21,48,19,2,'2020-01-27 12:51:09'),(22,88,93,4,'2020-01-27 12:51:09'),(23,13,68,1,'2020-01-27 12:51:09'),(24,9,35,2,'2020-01-27 12:51:09'),(25,37,39,4,'2020-01-27 12:51:09'),(26,93,18,1,'2020-01-27 12:51:09'),(27,8,3,4,'2020-01-27 12:51:09'),(28,36,11,2,'2020-01-27 12:51:09'),(29,8,93,2,'2020-01-27 12:51:09'),(30,28,16,4,'2020-01-27 12:51:09'),(31,26,44,2,'2020-01-27 12:51:09'),(32,79,66,4,'2020-01-27 12:51:09'),(33,60,25,2,'2020-01-27 12:51:09'),(34,41,77,3,'2020-01-27 12:51:09'),(35,72,79,4,'2020-01-27 12:51:09'),(36,52,24,3,'2020-01-27 12:51:09'),(37,55,76,1,'2020-01-27 12:51:09'),(38,54,21,2,'2020-01-27 12:51:09'),(39,38,70,2,'2020-01-27 12:51:09'),(40,72,48,1,'2020-01-27 12:51:09'),(41,76,8,1,'2020-01-27 12:51:09'),(42,25,97,1,'2020-01-27 12:51:09'),(43,57,56,1,'2020-01-27 12:51:09'),(44,71,31,2,'2020-01-27 12:51:09'),(45,16,53,1,'2020-01-27 12:51:09'),(46,19,48,4,'2020-01-27 12:51:09'),(47,65,80,1,'2020-01-27 12:51:09'),(48,85,9,4,'2020-01-27 12:51:09'),(49,11,91,1,'2020-01-27 12:51:09'),(50,33,100,1,'2020-01-27 12:51:09'),(51,14,59,3,'2020-01-27 12:51:09'),(52,87,77,1,'2020-01-27 12:51:09'),(53,88,69,4,'2020-01-27 12:51:09'),(54,90,9,4,'2020-01-27 12:51:09'),(55,60,66,2,'2020-01-27 12:51:09'),(56,53,14,1,'2020-01-27 12:51:09'),(57,100,77,4,'2020-01-27 12:51:09'),(58,74,28,1,'2020-01-27 12:51:09'),(59,95,26,2,'2020-01-27 12:51:09'),(60,48,5,4,'2020-01-27 12:51:09'),(61,81,66,4,'2020-01-27 12:51:09'),(62,28,85,2,'2020-01-27 12:51:09'),(63,43,94,2,'2020-01-27 12:51:09'),(64,22,87,3,'2020-01-27 12:51:09'),(65,85,15,1,'2020-01-27 12:51:09'),(66,59,32,4,'2020-01-27 12:51:09'),(67,8,96,3,'2020-01-27 12:51:09'),(68,85,61,3,'2020-01-27 12:51:09'),(69,70,98,4,'2020-01-27 12:51:09'),(70,3,74,3,'2020-01-27 12:51:09'),(71,80,20,3,'2020-01-27 12:51:09'),(72,34,93,3,'2020-01-27 12:51:09'),(73,28,57,4,'2020-01-27 12:51:09'),(74,24,21,2,'2020-01-27 12:51:09'),(75,8,35,3,'2020-01-27 12:51:09'),(76,56,23,2,'2020-01-27 12:51:09'),(77,68,97,4,'2020-01-27 12:51:09'),(78,5,89,2,'2020-01-27 12:51:09'),(79,64,42,1,'2020-01-27 12:51:09'),(80,53,16,1,'2020-01-27 12:51:09'),(81,67,65,1,'2020-01-27 12:51:09'),(82,22,38,1,'2020-01-27 12:51:09'),(83,9,71,2,'2020-01-27 12:51:09'),(84,20,21,2,'2020-01-27 12:51:09'),(85,62,74,4,'2020-01-27 12:51:09'),(86,91,6,3,'2020-01-27 12:51:09'),(87,61,38,1,'2020-01-27 12:51:09'),(88,10,35,2,'2020-01-27 12:51:09'),(89,19,58,2,'2020-01-27 12:51:09'),(90,86,36,1,'2020-01-27 12:51:09'),(91,87,79,2,'2020-01-27 12:51:09'),(92,31,51,3,'2020-01-27 12:51:09'),(93,57,97,1,'2020-01-27 12:51:09'),(94,76,40,3,'2020-01-27 12:51:09'),(95,34,56,4,'2020-01-27 12:51:09'),(96,27,95,4,'2020-01-27 12:51:09'),(97,86,49,4,'2020-01-27 12:51:09'),(98,69,95,3,'2020-01-27 12:51:09'),(99,50,49,4,'2020-01-27 12:51:09'),(100,29,59,1,'2020-01-27 12:51:09');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,61,'https://dropbox/vk/file_54209',54209,'{\"owner\":\"Duane Nicolas\"}','1978-12-10 02:55:11','2020-01-20 20:43:59'),(2,2,98,'https://dropbox/vk/file_21',21,'{\"owner\":\"Ray Frami\"}','1991-01-31 06:28:46','2020-01-20 20:43:59'),(3,3,7,'https://dropbox/vk/file_322969',322969,'{\"owner\":\"Xavier Runte\"}','2008-02-21 12:33:13','2020-01-20 20:43:59'),(4,1,41,'https://dropbox/vk/file_754038',754038,'{\"owner\":\"Maxwell Collier\"}','1970-11-07 22:55:22','2020-01-20 20:43:59'),(5,1,85,'https://dropbox/vk/file_629986',629986,'{\"owner\":\"Jared Ward\"}','1975-06-26 01:28:49','2020-01-20 20:43:59'),(6,1,100,'https://dropbox/vk/file_227',227,'{\"owner\":\"Gerhard Pouros\"}','1990-04-30 05:21:43','2020-01-20 20:43:59'),(7,3,44,'https://dropbox/vk/file_461407',461407,'{\"owner\":\"Kendrick Nienow\"}','1979-12-26 22:27:58','2020-01-20 20:43:59'),(8,3,20,'https://dropbox/vk/file_3',3,'{\"owner\":\"Maxwell Gleichner\"}','1984-04-02 18:28:52','2020-01-20 20:43:59'),(9,3,66,'https://dropbox/vk/file_1',1,'{\"owner\":\"Kayley Donnelly\"}','1976-05-16 03:00:11','2020-01-20 20:43:59'),(10,1,71,'https://dropbox/vk/file_79208039',79208039,'{\"owner\":\"Camille Stokes\"}','1999-11-02 07:14:35','2020-01-20 20:43:59'),(11,1,56,'https://dropbox/vk/file_602057',602057,'{\"owner\":\"Darrick Grant\"}','1987-09-21 16:59:00','2020-01-20 20:43:59'),(12,2,67,'https://dropbox/vk/file_879',879,'{\"owner\":\"Jermain Kuvalis\"}','1972-07-10 07:11:43','2020-01-20 20:43:59'),(13,2,65,'https://dropbox/vk/file_7',7,'{\"owner\":\"Violet Treutel\"}','2005-06-16 20:20:53','2020-01-20 20:43:59'),(14,3,26,'https://dropbox/vk/file_5151',5151,'{\"owner\":\"Jeanie Bartell\"}','1980-04-17 17:16:37','2020-01-20 20:43:59'),(15,1,33,'https://dropbox/vk/file_2',2,'{\"owner\":\"Evalyn Blick\"}','1972-02-11 20:36:51','2020-01-20 20:43:59'),(16,2,88,'https://dropbox/vk/file_671603',671603,'{\"owner\":\"Evan Nitzsche\"}','2009-11-17 19:09:32','2020-01-20 20:43:59'),(17,1,38,'https://dropbox/vk/file_190464586',190464586,'{\"owner\":\"Abel Brakus\"}','1989-11-19 05:45:26','2020-01-20 20:43:59'),(18,1,26,'https://dropbox/vk/file_14812',14812,'{\"owner\":\"Jeanie Bartell\"}','2016-02-16 11:24:39','2020-01-20 20:43:59'),(19,1,15,'https://dropbox/vk/file_0',0,'{\"owner\":\"Dayne Franecki\"}','1970-03-30 21:20:43','2020-01-20 20:43:59'),(20,3,96,'https://dropbox/vk/file_3',3,'{\"owner\":\"Vernie Nitzsche\"}','1994-08-20 02:01:28','2020-01-20 20:43:59'),(21,3,37,'https://dropbox/vk/file_0',0,'{\"owner\":\"Cleveland Kautzer\"}','2009-04-15 14:04:28','2020-01-20 20:43:59'),(22,2,94,'https://dropbox/vk/file_0',0,'{\"owner\":\"Else Bernier\"}','1989-05-10 08:06:21','2020-01-20 20:43:59'),(23,2,60,'https://dropbox/vk/file_0',0,'{\"owner\":\"Everette Bergnaum\"}','1992-12-03 21:21:10','2020-01-20 20:43:59'),(24,1,15,'https://dropbox/vk/file_333',333,'{\"owner\":\"Dayne Franecki\"}','1978-07-04 21:21:54','2020-01-20 20:43:59'),(25,1,98,'https://dropbox/vk/file_6648624',6648624,'{\"owner\":\"Ray Frami\"}','2011-03-16 17:34:46','2020-01-20 20:43:59'),(26,2,42,'https://dropbox/vk/file_88325619',88325619,'{\"owner\":\"Connor Romaguera\"}','1975-11-09 22:13:50','2020-01-20 20:43:59'),(27,3,15,'https://dropbox/vk/file_636',636,'{\"owner\":\"Dayne Franecki\"}','1987-11-28 07:21:46','2020-01-20 20:43:59'),(28,2,51,'https://dropbox/vk/file_0',0,'{\"owner\":\"Freida Langworth\"}','1988-11-25 21:30:59','2020-01-20 20:43:59'),(29,3,8,'https://dropbox/vk/file_4',4,'{\"owner\":\"Estelle Hammes\"}','1977-06-30 06:18:49','2020-01-20 20:43:59'),(30,2,86,'https://dropbox/vk/file_80083068',80083068,'{\"owner\":\"Wilburn Tromp\"}','2005-12-12 08:48:37','2020-01-20 20:43:59'),(31,1,7,'https://dropbox/vk/file_4171',4171,'{\"owner\":\"Xavier Runte\"}','2010-01-24 18:42:34','2020-01-20 20:43:59'),(32,3,74,'https://dropbox/vk/file_9',9,'{\"owner\":\"Hollis Zieme\"}','1976-12-26 13:36:16','2020-01-20 20:43:59'),(33,1,50,'https://dropbox/vk/file_424',424,'{\"owner\":\"Cordell Goyette\"}','1978-09-19 20:21:10','2020-01-20 20:43:59'),(34,1,27,'https://dropbox/vk/file_39',39,'{\"owner\":\"Orlo Christiansen\"}','1989-04-18 20:04:33','2020-01-20 20:43:59'),(35,1,86,'https://dropbox/vk/file_23458330',23458330,'{\"owner\":\"Wilburn Tromp\"}','2012-07-29 05:58:20','2020-01-20 20:43:59'),(36,1,49,'https://dropbox/vk/file_21',21,'{\"owner\":\"Stuart Koelpin\"}','2015-05-11 07:00:03','2020-01-20 20:43:59'),(37,1,83,'https://dropbox/vk/file_36',36,'{\"owner\":\"Mallory Turner\"}','2001-09-11 01:57:13','2020-01-20 20:43:59'),(38,3,71,'https://dropbox/vk/file_38647553',38647553,'{\"owner\":\"Camille Stokes\"}','2004-09-06 21:05:19','2020-01-20 20:43:59'),(39,2,6,'https://dropbox/vk/file_9233',9233,'{\"owner\":\"Cassandre Boyer\"}','1979-10-16 09:57:37','2020-01-20 20:43:59'),(40,1,15,'https://dropbox/vk/file_98',98,'{\"owner\":\"Dayne Franecki\"}','2018-06-23 09:06:32','2020-01-20 20:43:59'),(41,2,57,'https://dropbox/vk/file_678370621',678370621,'{\"owner\":\"Leilani Larkin\"}','2003-03-12 01:31:42','2020-01-20 20:43:59'),(42,3,40,'https://dropbox/vk/file_746954',746954,'{\"owner\":\"Lew Schinner\"}','2017-08-02 19:54:30','2020-01-20 20:43:59'),(43,1,29,'https://dropbox/vk/file_640589',640589,'{\"owner\":\"Ignacio Wuckert\"}','1989-03-01 12:05:29','2020-01-20 20:43:59'),(44,1,22,'https://dropbox/vk/file_669975043',669975043,'{\"owner\":\"Maritza Boyle\"}','1981-07-18 04:54:44','2020-01-20 20:43:59'),(45,2,23,'https://dropbox/vk/file_932815',932815,'{\"owner\":\"Cooper Keebler\"}','2019-11-21 15:57:15','2020-01-20 20:43:59'),(46,1,47,'https://dropbox/vk/file_0',0,'{\"owner\":\"Gabriella Hackett\"}','1999-11-06 08:37:02','2020-01-20 20:43:59'),(47,1,67,'https://dropbox/vk/file_3358',3358,'{\"owner\":\"Jermain Kuvalis\"}','1991-09-02 18:45:58','2020-01-20 20:43:59'),(48,2,95,'https://dropbox/vk/file_73185753',73185753,'{\"owner\":\"Rosa Pouros\"}','1983-06-11 19:34:12','2020-01-20 20:43:59'),(49,2,73,'https://dropbox/vk/file_99309612',99309612,'{\"owner\":\"Brandon Conn\"}','1984-09-20 23:05:22','2020-01-20 20:43:59'),(50,2,79,'https://dropbox/vk/file_359514',359514,'{\"owner\":\"Demetris Renner\"}','1970-10-08 19:12:30','2020-01-20 20:43:59'),(51,3,77,'https://dropbox/vk/file_58435',58435,'{\"owner\":\"Katharina Hane\"}','1996-10-16 22:21:11','2020-01-20 20:43:59'),(52,1,49,'https://dropbox/vk/file_2',2,'{\"owner\":\"Stuart Koelpin\"}','2006-05-23 13:24:08','2020-01-20 20:43:59'),(53,1,10,'https://dropbox/vk/file_79',79,'{\"owner\":\"Maiya Berge\"}','2007-11-20 04:01:17','2020-01-20 20:43:59'),(54,1,3,'https://dropbox/vk/file_6510125',6510125,'{\"owner\":\"Daryl Kuhlman\"}','2006-01-09 07:30:30','2020-01-20 20:43:59'),(55,2,87,'https://dropbox/vk/file_45307053',45307053,'{\"owner\":\"Duncan Rolfson\"}','2004-08-20 23:20:30','2020-01-20 20:43:59'),(56,1,24,'https://dropbox/vk/file_0',0,'{\"owner\":\"Alba Nader\"}','1988-05-15 00:32:11','2020-01-20 20:43:59'),(57,1,57,'https://dropbox/vk/file_29094',29094,'{\"owner\":\"Leilani Larkin\"}','2000-02-22 21:34:20','2020-01-20 20:43:59'),(58,1,14,'https://dropbox/vk/file_9',9,'{\"owner\":\"Hilbert Quitzon\"}','1977-05-29 15:42:54','2020-01-20 20:43:59'),(59,1,100,'https://dropbox/vk/file_16267',16267,'{\"owner\":\"Gerhard Pouros\"}','1970-08-28 19:21:16','2020-01-20 20:43:59'),(60,3,57,'https://dropbox/vk/file_785276861',785276861,'{\"owner\":\"Leilani Larkin\"}','1988-07-10 03:33:19','2020-01-20 20:43:59'),(61,3,83,'https://dropbox/vk/file_48411',48411,'{\"owner\":\"Mallory Turner\"}','2008-07-31 16:15:43','2020-01-20 20:43:59'),(62,3,42,'https://dropbox/vk/file_863998',863998,'{\"owner\":\"Connor Romaguera\"}','1970-10-07 08:52:47','2020-01-20 20:43:59'),(63,3,64,'https://dropbox/vk/file_186',186,'{\"owner\":\"Shanon Aufderhar\"}','1983-08-08 23:58:59','2020-01-20 20:43:59'),(64,1,91,'https://dropbox/vk/file_536851574',536851574,'{\"owner\":\"Arianna Metz\"}','2018-07-16 12:52:13','2020-01-20 20:43:59'),(65,3,62,'https://dropbox/vk/file_151834304',151834304,'{\"owner\":\"Kristian Kerluke\"}','1972-05-13 00:51:05','2020-01-20 20:43:59'),(66,3,39,'https://dropbox/vk/file_917',917,'{\"owner\":\"Cory Lakin\"}','1970-09-04 14:40:55','2020-01-20 20:43:59'),(67,1,9,'https://dropbox/vk/file_7',7,'{\"owner\":\"Daisy Brown\"}','1991-07-14 04:11:07','2020-01-20 20:43:59'),(68,1,27,'https://dropbox/vk/file_20',20,'{\"owner\":\"Orlo Christiansen\"}','1979-01-29 23:30:55','2020-01-20 20:43:59'),(69,1,7,'https://dropbox/vk/file_228',228,'{\"owner\":\"Xavier Runte\"}','1988-05-28 15:54:06','2020-01-20 20:43:59'),(70,2,53,'https://dropbox/vk/file_58079',58079,'{\"owner\":\"Herminia Bahringer\"}','1993-04-26 22:12:12','2020-01-20 20:43:59'),(71,2,43,'https://dropbox/vk/file_2',2,'{\"owner\":\"Jerrod Beier\"}','2009-11-01 15:10:32','2020-01-20 20:43:59'),(72,1,57,'https://dropbox/vk/file_3702771',3702771,'{\"owner\":\"Leilani Larkin\"}','2012-08-12 20:52:29','2020-01-20 20:43:59'),(73,1,53,'https://dropbox/vk/file_105',105,'{\"owner\":\"Herminia Bahringer\"}','2000-06-06 10:30:47','2020-01-20 20:43:59'),(74,1,96,'https://dropbox/vk/file_8356',8356,'{\"owner\":\"Vernie Nitzsche\"}','1990-05-29 17:09:09','2020-01-20 20:43:59'),(75,1,19,'https://dropbox/vk/file_727',727,'{\"owner\":\"Destin Murphy\"}','1998-05-07 07:34:08','2020-01-20 20:43:59'),(76,2,8,'https://dropbox/vk/file_2',2,'{\"owner\":\"Estelle Hammes\"}','1990-04-04 06:45:22','2020-01-20 20:43:59'),(77,1,80,'https://dropbox/vk/file_476',476,'{\"owner\":\"Trent Rolfson\"}','1988-12-24 23:24:42','2020-01-20 20:43:59'),(78,1,78,'https://dropbox/vk/file_549828',549828,'{\"owner\":\"Montana Boehm\"}','2014-10-09 12:49:41','2020-01-20 20:43:59'),(79,1,47,'https://dropbox/vk/file_22629412',22629412,'{\"owner\":\"Gabriella Hackett\"}','2016-04-23 12:16:59','2020-01-20 20:43:59'),(80,1,2,'https://dropbox/vk/file_8626324',8626324,'{\"owner\":\"Tyson Wuckert\"}','2019-05-11 17:23:51','2020-01-20 20:43:59'),(81,3,69,'https://dropbox/vk/file_3145',3145,'{\"owner\":\"Ali Olson\"}','2014-11-09 21:56:52','2020-01-20 20:43:59'),(82,2,36,'https://dropbox/vk/file_272427909',272427909,'{\"owner\":\"Kelly Ziemann\"}','2016-10-23 22:10:29','2020-01-20 20:43:59'),(83,1,73,'https://dropbox/vk/file_91083',91083,'{\"owner\":\"Brandon Conn\"}','1999-01-30 23:42:21','2020-01-20 20:43:59'),(84,2,58,'https://dropbox/vk/file_0',0,'{\"owner\":\"Rebeca Cormier\"}','2015-05-13 05:16:14','2020-01-20 20:43:59'),(85,3,70,'https://dropbox/vk/file_6941704',6941704,'{\"owner\":\"Gilda Macejkovic\"}','2013-05-31 04:45:24','2020-01-20 20:43:59'),(86,3,77,'https://dropbox/vk/file_705008',705008,'{\"owner\":\"Katharina Hane\"}','1984-11-30 20:49:45','2020-01-20 20:43:59'),(87,3,73,'https://dropbox/vk/file_6425482',6425482,'{\"owner\":\"Brandon Conn\"}','1974-02-17 16:33:36','2020-01-20 20:43:59'),(88,1,34,'https://dropbox/vk/file_474',474,'{\"owner\":\"Laverne Mann\"}','1995-07-06 10:37:38','2020-01-20 20:43:59'),(89,3,51,'https://dropbox/vk/file_14028',14028,'{\"owner\":\"Freida Langworth\"}','1982-09-02 13:43:42','2020-01-20 20:43:59'),(90,1,51,'https://dropbox/vk/file_0',0,'{\"owner\":\"Freida Langworth\"}','1992-06-18 07:56:34','2020-01-20 20:43:59'),(91,3,100,'https://dropbox/vk/file_507',507,'{\"owner\":\"Gerhard Pouros\"}','2017-10-31 15:11:40','2020-01-20 20:43:59'),(92,3,49,'https://dropbox/vk/file_683',683,'{\"owner\":\"Stuart Koelpin\"}','1982-06-30 09:40:29','2020-01-20 20:43:59'),(93,3,44,'https://dropbox/vk/file_3',3,'{\"owner\":\"Kendrick Nienow\"}','2008-05-17 11:17:50','2020-01-20 20:43:59'),(94,2,74,'https://dropbox/vk/file_79598',79598,'{\"owner\":\"Hollis Zieme\"}','2011-07-01 08:26:31','2020-01-20 20:43:59'),(95,2,36,'https://dropbox/vk/file_980',980,'{\"owner\":\"Kelly Ziemann\"}','1995-06-18 20:41:22','2020-01-20 20:43:59'),(96,2,57,'https://dropbox/vk/file_454470',454470,'{\"owner\":\"Leilani Larkin\"}','1994-04-23 08:17:13','2020-01-20 20:43:59'),(97,1,76,'https://dropbox/vk/file_30',30,'{\"owner\":\"Earnest Considine\"}','2007-06-07 09:21:55','2020-01-20 20:43:59'),(98,3,8,'https://dropbox/vk/file_37819605',37819605,'{\"owner\":\"Estelle Hammes\"}','1970-03-27 22:04:31','2020-01-20 20:43:59'),(99,3,13,'https://dropbox/vk/file_1160',1160,'{\"owner\":\"Furman Wyman\"}','2012-02-12 01:40:41','2020-01-20 20:43:59'),(100,3,39,'https://dropbox/vk/file_23277775',23277775,'{\"owner\":\"Cory Lakin\"}','1988-04-09 10:51:25','2020-01-20 20:43:59');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'misic'),(3,'photo'),(2,'video');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `is_important` tinyint(1) DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id_fk` (`from_user_id`),
  KEY `messages_to_user_id_fk` (`to_user_id`),
  CONSTRAINT `messages_from_user_id_fk` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_to_user_id_fk` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,56,60,'Rem corrupti officia repellat doloremque asperiores ex exercitationem occaecati. Autem molestiae sed incidunt recusandae molestias. Quam sit eveniet delectus ipsum dolorem aut corporis deserunt. Laudantium et qui enim minima doloremque ea.',0,1,'1983-05-09 04:13:51'),(2,31,75,'Maxime qui eum quam aspernatur molestiae. Optio quo illum dolores blanditiis ducimus dolorem. Perferendis soluta inventore consectetur aut odit tempore aliquam.',0,0,'1981-11-21 00:31:03'),(3,82,86,'Laborum dolore enim rem eaque. Eum iure cupiditate et ullam voluptas. Aut et voluptas repellendus nostrum dolor ipsa vel.',1,0,'2017-11-07 01:48:02'),(4,83,58,'Accusamus hic aut voluptatem nulla sequi. Facilis magni dolorem eveniet laboriosam fuga.',1,1,'1998-08-13 05:48:11'),(5,38,15,'Iure alias labore qui aut officiis. Aliquam qui sapiente sed quas mollitia ex vel. Natus laborum pariatur soluta sit quae.',1,1,'1986-09-11 08:42:34'),(6,13,37,'Voluptatum non alias non iste illo et. Sapiente laudantium reprehenderit aliquam voluptate asperiores dolore. Facilis magnam quibusdam veniam harum accusantium vero quibusdam. Cum consequuntur id porro cum explicabo ratione.',1,1,'1995-03-17 14:53:58'),(7,98,23,'Praesentium ratione nobis dolorem numquam aliquam. Consequuntur nobis ratione sit quia fugit et.',1,1,'1995-02-03 22:57:47'),(8,19,28,'Aut est accusantium facilis et incidunt ut. Quidem voluptas consectetur provident qui non. Dolor laudantium voluptatem sint rerum veritatis.',0,0,'1978-05-01 23:03:08'),(9,75,13,'At tenetur voluptatem cumque itaque ea eos. Quasi consequatur et dolor enim magnam nihil veniam. Itaque dolores maxime minima. Quasi et quia non reiciendis.',1,1,'2003-02-03 21:36:53'),(10,27,94,'Vel voluptatem repellendus eum est id fugit culpa. Et consequuntur molestiae quia distinctio dolores non non. Quas nemo qui non tempore. Sit minima odit voluptate ipsum.',0,0,'2009-04-19 18:36:14'),(11,87,56,'Blanditiis autem quis delectus doloremque quis. Quos perferendis temporibus voluptas optio. Dignissimos et dignissimos magni iusto sed.',0,1,'1986-12-11 14:24:02'),(12,18,23,'Sequi et dolore commodi id. Odio totam pariatur omnis modi voluptas. Dolorem non qui doloribus vitae laboriosam numquam. Aperiam rerum culpa doloribus quia minima consequatur eum.',0,1,'1998-09-23 02:50:13'),(13,60,28,'Non quia magnam et asperiores libero. Quaerat non eaque quia dicta. Et laboriosam accusantium libero sunt repudiandae. Ab earum qui qui eius voluptatum beatae.',1,1,'2008-02-25 00:11:53'),(14,63,28,'Tenetur esse nostrum aut pariatur est quos minima ut. Vel eveniet et ea et dolor occaecati et. Sed expedita quas veniam omnis tempora nostrum neque. Quisquam expedita magni sit esse velit blanditiis minima.',0,1,'2009-10-28 08:33:28'),(15,52,77,'Corporis commodi dolores dolor quod minima. Adipisci corporis labore vitae rem quo earum et. Officia aspernatur doloremque suscipit at totam. Nam reprehenderit ratione ullam pariatur quas officia sit.',1,1,'2012-11-14 21:24:20'),(16,26,1,'Soluta modi autem minima labore id. Occaecati fugit enim voluptatem voluptatem ipsam exercitationem esse. Ipsam et explicabo incidunt dolorem sed et qui. Autem tempore voluptatem error et.',0,0,'2015-04-20 02:22:28'),(17,98,23,'Sunt facilis voluptatibus illum ut atque ducimus. Eos facilis officiis suscipit dolorum omnis. Impedit sunt quo optio magni minima id voluptatibus vitae. Itaque aperiam dolorem quibusdam odio.',0,1,'2000-02-14 18:25:17'),(18,37,17,'Maiores quas repudiandae quisquam velit iure et. Aperiam deserunt atque blanditiis architecto voluptas recusandae vero.',0,0,'1991-07-01 06:43:44'),(19,75,21,'Laborum rerum officia labore ut et. Error eos temporibus iste rerum omnis et qui maxime. Iusto dolorem numquam qui fugit. Magni dolores iste vero.',1,1,'1996-01-13 00:22:18'),(20,81,42,'Harum ut dolores non optio neque ipsam architecto labore. Expedita molestiae similique maxime. Amet facilis distinctio earum provident quia voluptates. Sequi ipsum voluptatem aut iure animi.',1,1,'2019-03-22 10:19:01'),(21,65,100,'Eos in odit voluptas eveniet beatae consequuntur cupiditate. Ab totam quasi eaque possimus. Quidem quia distinctio et ea aut voluptas error.',1,1,'1995-12-18 12:00:46'),(22,5,23,'Fugit necessitatibus ipsam perferendis veritatis non in. Laborum blanditiis nihil saepe doloribus non ullam eligendi.',1,1,'1997-04-10 23:41:40'),(23,1,36,'Natus inventore aut ut dolorem itaque quia. Voluptatibus nostrum vel nisi repudiandae rerum nemo. Veritatis fugit quas illum maxime doloremque qui.',1,1,'1981-03-14 10:50:58'),(24,76,71,'Unde dignissimos corrupti est officiis modi voluptatum unde consectetur. Enim occaecati et sed architecto aut. Molestias et incidunt enim vitae aut eos.',1,0,'1991-06-08 08:31:58'),(25,25,11,'Sunt rerum nam quam. Eos officiis non fuga accusamus quae sit. Ratione enim quibusdam impedit expedita aut.',1,0,'1983-10-05 11:44:19'),(26,80,66,'Consequuntur aut nemo sed perferendis occaecati harum. Odit eveniet vel accusamus itaque at. Labore omnis ab eum cumque.',0,1,'2013-08-15 00:51:48'),(27,91,56,'Voluptatem voluptatem quisquam quis ut voluptatem. Aliquid nulla incidunt et quod. A ut quos ullam deleniti labore consequatur. Placeat facilis qui hic.',1,1,'1978-08-13 23:46:51'),(28,7,64,'Tempora deleniti et non quia eius voluptas beatae est. Rerum sint aut illo dolorum est. Voluptate vitae vel ut ex.',0,1,'2018-01-02 21:28:15'),(29,1,10,'Sit dolores rerum ut. Corrupti incidunt exercitationem itaque et ab ratione. Repellendus consequatur porro eaque. Eum aut tempora voluptas odit recusandae autem qui. Nostrum occaecati et expedita eaque.',0,1,'1970-04-29 13:41:24'),(30,48,11,'Occaecati neque sapiente modi quia molestiae. Amet aut quidem sit eos quia. Dignissimos id accusantium impedit quas et iste nesciunt. Qui debitis repellat ullam cum.',1,0,'2000-04-03 12:00:29'),(31,10,14,'Quis aut a ducimus distinctio qui. Ullam nihil nihil dolor eaque dolorem necessitatibus dolore dolor. Aut odit dolores facere quis et explicabo voluptas.',1,0,'2017-12-01 19:35:59'),(32,41,61,'Aut facere explicabo est assumenda. Maxime delectus praesentium quasi eveniet corporis ea.',1,1,'2011-08-27 22:01:22'),(33,82,28,'Et eos eum sunt aut qui. Deserunt omnis autem saepe consequatur. Facere non voluptate nihil adipisci qui eius.',1,0,'2005-07-06 13:12:34'),(34,93,82,'Impedit labore doloremque earum modi. Quam provident dolor veritatis nesciunt ab. Nesciunt ut et accusamus vel sed expedita praesentium. Excepturi architecto odio similique at enim voluptatum.',1,1,'2008-02-27 15:41:57'),(35,31,6,'Consequuntur voluptatem atque doloribus numquam ea. Quia sint velit sunt. Soluta eos est mollitia ut tempore autem est quae. Quas libero ut autem sit sed qui.',0,0,'1988-06-19 09:43:37'),(36,39,76,'Nam earum sed nulla odit consectetur. Nostrum maxime quod velit aut. Expedita numquam aut vitae ea est provident officia.',0,1,'2009-01-12 17:52:13'),(37,63,84,'Molestiae nihil nostrum voluptas molestiae consectetur rerum libero. Velit minus iste id nisi earum praesentium. Rem dicta provident itaque labore quo. Totam enim harum sed iure asperiores non. Voluptatem corporis autem odit quasi quod.',0,1,'1996-11-13 12:53:11'),(38,31,4,'Facere necessitatibus maiores illo voluptas. Consequatur sapiente cupiditate quia dolorem nesciunt placeat. Labore perspiciatis quia voluptatem molestiae.',0,1,'1995-06-20 16:58:24'),(39,24,9,'Tenetur sit aspernatur maiores magni unde. Blanditiis consequatur pariatur voluptatibus repellat minus amet et. Adipisci dolores occaecati fuga velit unde possimus. Saepe voluptates pariatur autem id sed tempore.',1,0,'2019-01-02 19:52:22'),(40,71,30,'Omnis officiis aliquam eius iusto. Eligendi nihil tempore dolorem consequuntur veritatis aspernatur veritatis. Soluta commodi quo vero quod quis. Eum impedit quae et nihil tempora omnis velit.',1,1,'1989-01-31 20:30:39'),(41,36,91,'Aperiam a consectetur esse similique. Amet quidem sit corporis mollitia. Dolor fuga voluptas similique tenetur quam vel debitis. In rem sint laudantium et dolorum.',0,1,'2013-02-01 02:34:41'),(42,44,49,'Assumenda dolorem qui repellendus non dolor rerum. Aut consequatur doloribus voluptates saepe quia enim. Ullam consectetur et voluptatem quo.',1,1,'1980-10-09 05:22:08'),(43,10,5,'Odit est debitis qui. Voluptas alias voluptatibus sed molestiae vitae minus. A possimus ut soluta nemo iusto. Magni facilis et ullam occaecati.',0,0,'1998-05-11 15:02:42'),(44,94,55,'Sed soluta sed autem deleniti. Reiciendis voluptatem reprehenderit est accusamus. Et ducimus itaque ut ut voluptatem et.',0,1,'1975-03-09 21:38:32'),(45,92,96,'Sint nulla illum eum consequuntur repellendus. Reiciendis quia quas aliquid sapiente quia recusandae. Magnam quasi quod vero doloremque.',1,1,'1990-05-25 23:02:44'),(46,4,30,'Libero eos ut dolorum. Est itaque aut pariatur rerum necessitatibus. Quo ipsam odio dolorem deleniti vel veritatis.',0,0,'1981-06-08 12:01:11'),(47,13,37,'Ab non in error doloremque libero. Tenetur cum porro voluptatem sunt aut non voluptatum qui. Facilis est porro harum dicta laudantium eum. Non voluptatem reiciendis excepturi iusto dolorum.',1,0,'2011-09-10 04:19:29'),(48,97,78,'Incidunt porro quia et et. Enim et maiores qui doloremque totam. Vitae omnis sed aut et totam beatae. Nobis perspiciatis veniam rerum maiores eius.',1,0,'2006-10-28 23:23:12'),(49,95,43,'Recusandae quis qui minima ut. Autem possimus sequi ipsam numquam quis repudiandae. Et qui suscipit aut sint dolor. Doloribus quidem molestiae libero quam voluptates.',0,1,'1975-12-21 04:35:43'),(50,29,16,'Ipsum maiores voluptas qui voluptatem. Sequi et facere cumque dolorum odit. Quasi voluptas nisi soluta voluptatibus ut perferendis.',0,0,'2013-04-28 07:41:21'),(51,90,3,'Ipsam explicabo enim voluptatem laboriosam. Eum mollitia et aut inventore cupiditate ipsam ratione. Provident ut ut quisquam maiores. Quibusdam natus corporis beatae rerum laboriosam quis assumenda.',1,1,'1998-10-29 06:20:36'),(52,13,37,'Ea dicta aut quaerat illum. Reprehenderit recusandae id accusamus adipisci autem voluptatem. Culpa quis dolorem dolorum alias delectus voluptas neque in.',1,1,'1978-03-24 19:43:45'),(53,17,54,'Eligendi eveniet voluptatibus necessitatibus quasi est voluptatem. Ipsum atque et et aut sequi blanditiis. Quibusdam optio quo reprehenderit accusamus ut vel ipsum.',1,0,'1997-04-26 20:36:45'),(54,20,35,'Aut nam et libero nemo eum dicta qui. Accusamus quo et autem ab molestiae perferendis delectus. Facilis eum nisi in dolorem molestiae vel nam.',1,0,'2015-06-27 09:30:46'),(55,18,82,'Qui et iusto cumque. Nam dolores quasi et accusantium officia enim. Delectus unde a odio omnis itaque. Quis sequi tempora aut ut aliquam.',0,1,'2006-09-24 05:10:59'),(56,13,37,'Consequatur ut id ipsam asperiores quod. Esse voluptatibus qui commodi alias. Rerum inventore quod magni harum vel. Dolores ratione impedit praesentium accusamus velit impedit velit.',1,1,'1989-11-16 15:02:37'),(57,37,54,'Nostrum facilis libero cumque aliquam nihil qui. Cum voluptatem tenetur eligendi est. Illum necessitatibus incidunt quisquam est voluptas et.',0,0,'1973-11-25 16:26:32'),(58,32,95,'Eaque et magnam et distinctio. In magni culpa vero quas sed ut. Eaque maxime laborum impedit magnam tenetur nemo incidunt. Ea distinctio rerum qui rerum dolor itaque.',0,0,'1980-12-27 03:44:26'),(59,13,16,'Tempore quia eveniet iure delectus fuga alias accusamus. Veritatis ut vero veritatis eos. Quia rerum sed odit. Eum aut odio exercitationem incidunt facilis suscipit. Doloribus vel iste rem veniam.',1,0,'2005-12-18 20:39:22'),(60,37,13,'Iusto placeat qui nihil ea. Recusandae consequatur incidunt rerum corporis fugit laborum. Beatae dolor debitis voluptatibus impedit. Rem et nesciunt atque harum velit omnis ullam quisquam.',1,1,'1976-08-14 22:03:46'),(61,75,61,'Aut sit dolor dolores molestiae excepturi. Numquam tempore dolor qui blanditiis necessitatibus assumenda harum. Animi dicta qui quidem corrupti velit similique. Molestiae et et aut voluptatem aut deserunt repellat ut.',1,0,'2018-08-21 14:30:37'),(62,51,13,'Fugit alias atque atque ad sit quae. Voluptas provident et non fuga ut. Tenetur et et et aspernatur eligendi eius.',0,1,'1982-04-25 10:00:21'),(63,37,85,'In quaerat vitae sit in explicabo. Eum voluptatem earum atque. Id similique qui quis ut et.',1,0,'1984-04-13 01:52:53'),(64,52,5,'Omnis sint facere assumenda dolorem illum rerum ducimus. Molestiae numquam soluta voluptatibus iure est velit. Odit facere laudantium explicabo sint enim exercitationem aut.',1,0,'1990-08-21 00:58:18'),(65,67,20,'Eligendi eius ea laborum qui earum. Unde quidem vel quos architecto iusto.',0,0,'2018-03-30 13:35:55'),(66,13,37,'Minima minus tempora dolore odio illo modi sint. Aut pariatur facere molestiae dolorem ex et a.',1,1,'1972-05-15 13:02:14'),(67,37,22,'Fugit quam ratione et non reprehenderit aut nihil. Sit laudantium sequi rerum necessitatibus delectus. Est distinctio quo asperiores ut sunt commodi laborum. Quam veritatis possimus eos repellat.',1,0,'1998-12-14 02:26:00'),(68,49,78,'Et dolor beatae beatae deserunt quae consequatur. Ea quae minima aspernatur dolorum. Ducimus et sit ab corrupti porro sit rerum.',0,0,'1990-03-03 05:48:59'),(69,43,81,'Doloribus asperiores quia vero omnis nihil eum nihil ab. Consequatur numquam quae nobis velit aliquam necessitatibus dolorum facilis. Quasi voluptatem voluptatem aliquam soluta nisi reiciendis. Incidunt veritatis voluptatem nihil omnis corporis iusto. Eos et illo quo est.',0,0,'1983-03-12 20:43:31'),(70,76,34,'Fuga qui ipsa asperiores quas qui consequatur sed reprehenderit. Molestias et blanditiis corrupti dolore. Et voluptas ut qui placeat quas nesciunt dolore.',1,1,'1997-09-02 19:36:28'),(71,45,20,'Voluptatibus magnam minima voluptas deleniti. Non corporis nihil non. Consequatur sunt praesentium voluptatem et sit sed. Minus dignissimos repudiandae ullam odit velit.',1,0,'1986-07-25 15:02:36'),(72,13,63,'Labore labore qui corporis expedita molestiae. Voluptas quos tempora perferendis debitis ut. Molestiae quidem nihil velit.',1,1,'1974-06-03 14:52:23'),(73,21,15,'Vel molestiae impedit quia blanditiis dolorem deserunt et. Consequatur consequatur veritatis sunt iusto non dolore ut magnam. Corrupti fugit commodi necessitatibus quis. Consequatur dolorem id nostrum saepe fuga.',0,1,'1990-04-24 02:08:18'),(74,10,7,'Ab quasi minima non explicabo dicta. Voluptatem aspernatur qui earum illo. Ut debitis at vel et harum. Corporis corporis facilis dignissimos.',1,1,'1994-03-14 05:28:49'),(75,5,2,'Et et quo dignissimos est quis deleniti. Consectetur sed et nostrum velit voluptatem. Velit molestiae omnis aspernatur.',0,0,'2002-07-10 04:17:19'),(76,95,66,'Omnis facere ex quis omnis est quia distinctio voluptate. Numquam consequatur accusantium quia autem. Aut dolore aut ratione.',1,1,'1996-05-18 21:21:54'),(77,48,40,'Libero alias necessitatibus itaque dolore quae qui id. Et nesciunt sunt dolorem fugit. Id voluptates doloribus iste et cupiditate. Optio nam sit nisi soluta labore est atque.',1,0,'2004-10-12 07:30:12'),(78,56,57,'Ducimus voluptatem cum nihil. Laborum sit fugiat quae tenetur. Qui voluptas numquam possimus perferendis placeat. Odio dolorum ducimus ut quidem perspiciatis aut.',0,0,'1996-08-09 19:08:08'),(79,20,27,'Enim sint deleniti natus reprehenderit voluptate. Maiores a nesciunt fugit est temporibus eligendi id. Nulla quasi dolor exercitationem et modi blanditiis aut ipsum. Doloremque sed aut voluptates corporis est hic optio.',1,1,'1979-09-17 00:55:07'),(80,73,85,'Nostrum soluta qui quasi similique et consectetur. Tenetur iure dolores nam vel alias ut. Aut dignissimos laudantium facilis et minima consequatur. Magnam ut atque reiciendis molestias illo reprehenderit nihil.',0,1,'2011-09-10 18:55:14'),(81,4,64,'Dolores sed aut minima omnis eos est accusantium. Rerum consequatur et qui asperiores quisquam et.',1,0,'1992-06-19 18:23:24'),(82,6,41,'Consequatur vel ratione dignissimos sapiente voluptas. Molestias laudantium qui qui aperiam temporibus. Fuga et inventore veritatis non accusamus enim. Deserunt accusantium alias incidunt minima quisquam suscipit. Accusamus consequatur ab enim culpa non amet.',1,0,'1986-05-01 12:12:30'),(83,86,8,'Quo voluptatem qui esse id voluptatem possimus. Ut ipsam qui minima facere ea. Blanditiis ea pariatur iste et aut quis. Suscipit dolores accusamus dolores quod nostrum quo ea.',0,1,'2013-06-30 12:47:19'),(84,78,67,'Sed nihil aut sequi itaque. Fuga totam fugit ratione autem. Voluptas maiores quod incidunt distinctio ratione.',0,1,'2012-09-29 02:20:18'),(85,2,8,'Nemo et placeat sequi repellat non qui non. Perspiciatis et provident architecto exercitationem qui. Voluptatem quia aut dolorem placeat voluptas. Quos laudantium aut qui repudiandae nihil et labore.',1,1,'1973-01-01 01:21:25'),(86,34,47,'Sequi sint voluptatum soluta vitae. Sed voluptas unde fugiat vero. Sunt sit dolorum quisquam modi. Consectetur vel tenetur omnis est nihil atque tempore.',1,1,'1980-08-18 16:17:08'),(87,75,13,'Maiores et voluptatem voluptate culpa. Voluptatibus aut nostrum corrupti nobis sit omnis ut vero. Natus nostrum non vitae autem sequi necessitatibus dolor.',0,1,'1973-07-20 17:49:00'),(88,71,18,'Facere beatae iste numquam dignissimos nostrum. Atque repellendus fuga ut qui alias repellat ab. Dolorem dolorem quia ut rerum. Asperiores veritatis consequatur est dignissimos aliquam quisquam.',0,0,'1997-02-09 11:58:25'),(89,13,88,'Id fugiat facilis illum dolor beatae. Non numquam aut mollitia quod aliquid. Asperiores est necessitatibus facilis quis totam quia autem. Et quibusdam et minus et aut.',1,0,'2014-02-10 05:00:33'),(90,95,2,'Ea fugit cum consequatur aut totam. Sed dolorum cupiditate ut porro deleniti. Error est quis magnam.',0,0,'1981-01-03 14:52:09'),(91,24,11,'Accusantium itaque dolore occaecati consequatur. Non at minus et aliquid. Dolorem est dolorum quae veritatis id nam explicabo. Et quae officiis asperiores nesciunt laborum nemo.',1,1,'2008-04-24 01:50:31'),(92,84,88,'Odio qui asperiores eligendi earum consequatur laboriosam natus exercitationem. Beatae non eos modi eveniet aut. Quasi qui incidunt sequi maiores a voluptatum.',1,1,'1985-06-02 02:19:27'),(93,87,72,'Delectus iure labore tempora fugiat blanditiis accusamus tenetur velit. Architecto consequuntur quasi optio tempore nesciunt nobis eum. Sint perferendis corrupti saepe perferendis tempora quo fugiat.',1,0,'2016-04-22 21:13:10'),(94,97,69,'Nulla error labore corporis id. Iure quibusdam dolores facilis optio consequatur iusto minima. Nostrum eos et doloremque aut ullam. Fugit eius vel sapiente repudiandae perspiciatis iure.',0,1,'1988-10-13 05:44:06'),(95,51,50,'Cum velit aspernatur aut qui. Laudantium non quia nihil dolores. Dolores id sint qui sit amet autem ut quaerat.',0,1,'2019-11-18 05:57:58'),(96,95,27,'Consequatur ut aut rem consequatur fugiat neque ut in. Optio et laboriosam quia voluptatem. Laboriosam nam ut distinctio distinctio. Et vero qui dolore modi cum fugiat aspernatur nihil.',1,1,'2010-10-08 20:21:33'),(97,48,58,'Accusantium quam hic voluptatibus temporibus occaecati explicabo earum. Et ad et sequi dolores ut voluptate. Reprehenderit aut sint sapiente hic voluptatem sapiente ipsam.',1,0,'1980-11-21 12:52:13'),(98,47,58,'Quia enim voluptatibus facere quisquam quisquam quis. Occaecati atque dolores dolores facilis. Repellendus incidunt sapiente quibusdam placeat voluptatem.',1,1,'2008-12-19 01:12:26'),(99,49,71,'Laudantium ut quo minima. Dignissimos voluptatem aliquam veniam tempora non. Ut illo maxime eum accusantium qui eum rem. Nesciunt officiis a quis earum tenetur ad soluta. Corporis ab sint dignissimos.',1,0,'2018-02-19 19:01:09'),(100,8,27,'Ducimus quibusdam magnam voluptatem qui omnis magnam. Commodi eaque esse laborum et recusandae. Voluptate sit similique sed maxime nihil et. Quasi nam doloremque unde excepturi illum quia.',0,0,'1978-10-31 14:23:07');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `autor_id` int(10) unsigned NOT NULL,
  `body` text NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  `likes_count` int(10) unsigned DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL,
  `birthdate` date DEFAULT NULL,
  `sex` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_status_id` int(10) unsigned DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `profiles_photo_id_fk` (`photo_id`),
  KEY `family_status_id_fk` (`family_status_id`),
  CONSTRAINT `family_status_id_fk` FOREIGN KEY (`family_status_id`) REFERENCES `family_statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `profiles_photo_id_fk` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `profiles_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'2015-05-24','f','Corwinshire',2,'Puerto Rico',1,'2007-11-24 06:16:56','2020-01-20 20:15:32'),(2,'2001-04-29','f','East Hettieville',2,'Trinidad and Tobago',2,'2005-12-23 06:29:52','2020-01-20 20:15:32'),(3,'2010-08-16','m','Lake Amirashire',2,'Jersey',3,'2014-03-26 11:32:08','2020-01-20 20:15:32'),(4,'1998-05-30','f','Lake Rod',1,'Gabon',4,'2010-08-27 17:38:59','2020-01-20 20:15:32'),(5,'1982-03-08','f','West Dario',2,'Costa Rica',5,'1988-03-20 02:31:58','2020-01-20 20:15:32'),(6,'1995-06-26','m','Port Kiannabury',2,'Austria',6,'1976-05-26 09:26:19','2020-01-20 20:15:32'),(7,'1996-05-12','m','Hipolitomouth',2,'Brunei Darussalam',7,'2000-02-25 21:06:54','2020-01-20 20:15:32'),(8,'1986-11-24','m','Delphiaburgh',1,'Saint Helena',8,'1989-04-10 03:53:33','2020-01-20 20:15:32'),(9,'2006-05-01','f','Port Orvalport',1,'Bulgaria',9,'1987-11-15 11:21:46','2020-01-20 20:15:32'),(10,'1997-12-09','m','East Allison',2,'Gibraltar',10,'2019-08-20 19:27:21','2020-01-20 20:15:32'),(11,'1974-06-12','m','Landenland',2,'Saudi Arabia',11,'1999-02-12 17:45:10','2020-01-20 20:15:32'),(12,'1989-10-05','f','Ricemouth',1,'Chad',12,'1992-10-21 03:12:19','2020-01-20 20:15:32'),(13,'1999-10-20','m','Mozelleborough',1,'Pakistan',13,'1977-05-30 05:44:01','2020-01-20 20:15:32'),(14,'1987-03-03','m','Wilkinsonborough',2,'Benin',14,'1979-05-11 01:03:19','2020-01-20 20:15:32'),(15,'2006-10-26','m','West Fannyborough',2,'Mongolia',15,'1974-02-18 09:06:07','2020-01-20 20:15:32'),(16,'1987-11-06','m','Lessietown',1,'Finland',16,'2009-05-14 08:17:45','2020-01-20 20:15:32'),(17,'1978-03-13','f','New Altheastad',2,'Niue',17,'1980-03-11 08:17:09','2020-01-20 20:15:32'),(18,'1993-08-13','m','Port Marastad',1,'Pakistan',18,'1991-07-22 09:31:39','2020-01-20 20:15:32'),(19,'2014-02-02','m','Cristobalport',1,'Timor-Leste',19,'2019-03-13 02:35:32','2020-01-20 20:15:32'),(20,'1979-08-12','f','New Orieburgh',1,'Saint Helena',20,'1976-10-23 11:08:45','2020-01-20 20:15:32'),(21,'2015-12-19','m','Izabellachester',2,'Norfolk Island',21,'2003-05-23 05:24:33','2020-01-20 20:15:32'),(22,'1994-11-05','f','Abelardofort',2,'Vietnam',22,'2010-04-15 07:10:00','2020-01-20 20:15:32'),(23,'1986-03-21','m','Parisianstad',1,'Belize',23,'1985-12-05 15:44:38','2020-01-20 20:15:32'),(24,'2011-06-28','f','Oraside',2,'Taiwan',24,'1997-04-08 11:34:24','2020-01-20 20:15:32'),(25,'1985-05-30','f','Lake Juston',2,'Samoa',25,'1989-10-23 23:18:29','2020-01-20 20:15:32'),(26,'1992-04-03','f','New Cecilborough',1,'Iraq',26,'1991-08-16 09:34:09','2020-01-20 20:15:32'),(27,'2011-09-01','f','Priceburgh',2,'Hungary',27,'2018-04-29 04:29:16','2020-01-20 20:15:32'),(28,'2005-09-27','m','New Micaelaside',1,'Latvia',28,'2010-02-22 02:24:11','2020-01-20 20:15:32'),(29,'2005-06-13','f','New Rosalindmouth',2,'Tokelau',29,'2014-10-18 16:32:46','2020-01-20 20:15:32'),(30,'2019-03-06','f','Walshstad',2,'Saudi Arabia',30,'1976-11-15 11:24:23','2020-01-20 20:15:32'),(31,'2019-08-17','m','South Caesar',1,'Philippines',31,'2017-09-26 08:56:44','2020-01-20 20:15:32'),(32,'2015-10-06','m','Adeliaville',2,'Anguilla',32,'2000-10-17 15:41:22','2020-01-20 20:15:32'),(33,'2001-07-18','m','Coleburgh',1,'Estonia',33,'1983-09-15 14:30:09','2020-01-20 20:15:32'),(34,'1978-08-17','f','New Patience',1,'Kazakhstan',34,'2019-07-23 06:16:47','2020-01-20 20:15:32'),(35,'2007-11-26','m','Ceceliaport',1,'Israel',35,'2006-01-19 17:16:49','2020-01-20 20:15:32'),(36,'2009-09-26','f','South Winfieldport',1,'Uruguay',36,'1973-12-16 22:28:33','2020-01-20 20:15:32'),(37,'1979-10-02','f','Mossiemouth',1,'Belarus',37,'1975-05-31 16:58:41','2020-01-20 20:15:32'),(38,'2017-05-17','m','Lake Dusty',2,'Japan',38,'1982-02-18 14:58:53','2020-01-20 20:15:32'),(39,'2000-05-22','f','North Julian',2,'Turkmenistan',39,'2005-09-24 13:17:46','2020-01-20 20:15:32'),(40,'2009-03-13','m','Quitzonberg',1,'Bosnia and Herzegovina',40,'1977-05-11 23:28:50','2020-01-20 20:15:32'),(41,'2001-02-01','m','Isaacside',2,'Northern Mariana Islands',41,'1970-06-13 14:18:52','2020-01-20 20:15:32'),(42,'1985-02-12','f','East Christian',2,'Nigeria',42,'1981-02-28 02:55:03','2020-01-20 20:15:32'),(43,'1992-07-04','m','Lonland',1,'Honduras',43,'2001-04-12 03:34:09','2020-01-20 20:15:32'),(44,'1970-09-16','m','South Terrenceside',1,'United States Minor Outlying Islands',44,'1973-02-13 21:03:47','2020-01-20 20:15:32'),(45,'2002-04-10','f','Starkport',2,'Panama',45,'1981-10-15 00:25:03','2020-01-20 20:15:32'),(46,'2004-03-13','f','West Nevamouth',2,'South Africa',46,'1970-05-29 08:48:46','2020-01-20 20:15:32'),(47,'2003-11-22','m','East Reynoldchester',1,'Mayotte',47,'1980-07-07 02:49:10','2020-01-20 20:15:32'),(48,'2018-09-16','f','Schowalterberg',1,'France',48,'2012-02-27 18:00:05','2020-01-20 20:15:32'),(49,'1978-11-23','f','North Dejah',2,'Myanmar',49,'1978-05-22 07:57:07','2020-01-20 20:15:32'),(50,'1972-08-29','m','New Adrielmouth',1,'Christmas Island',50,'2017-03-16 10:52:41','2020-01-20 20:15:32'),(51,'2016-11-08','m','Port Jasperfurt',1,'Kazakhstan',51,'1996-02-14 12:56:16','2020-01-20 20:15:32'),(52,'2004-10-12','f','South Blakeport',1,'Algeria',52,'2008-12-31 01:05:27','2020-01-20 20:15:32'),(53,'2017-11-28','m','North Thaddeusburgh',1,'Argentina',53,'2013-03-18 00:20:48','2020-01-20 20:15:32'),(54,'2013-08-20','f','South Eribertofort',2,'Belize',54,'1987-10-01 18:06:55','2020-01-20 20:15:32'),(55,'1986-03-17','f','New Sonya',1,'Rwanda',55,'2016-09-05 01:30:02','2020-01-20 20:15:32'),(56,'1994-12-26','m','Paigeborough',1,'British Virgin Islands',56,'1991-12-17 19:50:45','2020-01-20 20:15:32'),(57,'1972-05-19','f','Lake Annie',1,'Bermuda',57,'2007-04-19 21:01:45','2020-01-20 20:15:32'),(58,'2007-02-17','m','South Virginia',1,'Uzbekistan',58,'2013-10-06 12:20:55','2020-01-20 20:15:32'),(59,'1994-01-21','m','New Grahamville',2,'Cook Islands',59,'2004-10-01 05:49:12','2020-01-20 20:15:32'),(60,'2017-01-27','m','North Jerome',2,'Bosnia and Herzegovina',60,'2012-06-12 23:02:03','2020-01-20 20:15:32'),(61,'2016-01-17','f','Corkeryton',2,'Mayotte',61,'1972-12-01 09:13:59','2020-01-20 20:15:32'),(62,'1982-08-13','m','Stiedemannberg',2,'Saint Helena',62,'2011-11-19 08:05:30','2020-01-20 20:15:32'),(63,'1981-07-18','f','Jadeberg',1,'Djibouti',63,'2012-12-22 04:38:51','2020-01-20 20:15:32'),(64,'1976-02-24','f','Theodoramouth',1,'Guatemala',64,'1993-09-24 10:30:40','2020-01-20 20:15:32'),(65,'1976-03-11','f','Beahanborough',1,'Holy See (Vatican City State)',65,'2002-08-23 08:14:57','2020-01-20 20:15:32'),(66,'2012-01-21','m','Mullerfurt',1,'Haiti',66,'2018-07-16 21:11:19','2020-01-20 20:15:32'),(67,'1997-02-24','m','North Yessenia',1,'Estonia',67,'1970-07-20 10:36:06','2020-01-20 20:15:32'),(68,'1989-08-23','m','Isabellafort',2,'Northern Mariana Islands',68,'2001-10-04 05:34:53','2020-01-20 20:15:32'),(69,'1973-07-05','f','Hermistonstad',2,'Guatemala',69,'2004-09-16 17:49:51','2020-01-20 20:15:32'),(70,'1982-07-01','f','New Lina',2,'Iraq',70,'2000-02-27 22:36:24','2020-01-20 20:15:32'),(71,'2005-04-11','m','Bernardmouth',1,'Iraq',71,'2018-07-18 13:12:52','2020-01-20 20:15:32'),(72,'1988-06-29','m','Krisbury',1,'Cuba',72,'1998-07-27 03:17:08','2020-01-20 20:15:32'),(73,'1993-06-17','f','New Narcisochester',2,'French Guiana',73,'1978-01-26 06:14:32','2020-01-20 20:15:32'),(74,'1971-08-07','m','Gunnerland',1,'Benin',74,'1979-01-13 04:23:35','2020-01-20 20:15:32'),(75,'1976-09-04','f','Schmelerbury',1,'Macedonia',75,'1974-07-19 03:38:10','2020-01-20 20:15:32'),(76,'1974-04-17','m','Austenside',2,'Swaziland',76,'1970-07-26 10:25:04','2020-01-20 20:15:32'),(77,'2000-10-09','f','Robertschester',1,'Bhutan',77,'1974-07-02 08:16:41','2020-01-20 20:15:32'),(78,'1999-11-16','f','Millsberg',2,'Kazakhstan',78,'1995-04-05 16:48:13','2020-01-20 20:15:32'),(79,'1971-12-02','m','Jerrodshire',1,'Brazil',79,'1974-08-19 20:37:19','2020-01-20 20:15:32'),(80,'1985-01-01','m','Hammeston',1,'Bolivia',80,'2016-02-21 13:52:52','2020-01-20 20:15:32'),(81,'1995-05-24','f','New Elenachester',1,'Nigeria',81,'2002-10-28 23:02:40','2020-01-20 20:15:32'),(82,'1981-08-02','f','Pricehaven',1,'Bouvet Island (Bouvetoya)',82,'1979-02-04 11:53:28','2020-01-20 20:15:32'),(83,'2015-07-22','f','New Noemiehaven',1,'Cyprus',83,'2018-05-21 19:16:37','2020-01-20 20:15:32'),(84,'1977-10-11','m','Emilytown',1,'Saint Lucia',84,'1982-03-16 13:16:08','2020-01-20 20:15:32'),(85,'1973-07-27','m','Imanichester',2,'Guatemala',85,'2016-06-25 11:21:21','2020-01-20 20:15:32'),(86,'2000-10-05','m','East Mckaylaberg',1,'Australia',86,'2018-04-13 01:39:52','2020-01-20 20:15:32'),(87,'1979-10-18','m','East Lilamouth',2,'Bulgaria',87,'1974-09-01 16:09:55','2020-01-20 20:15:32'),(88,'1993-03-09','m','Wintheiserhaven',1,'Germany',88,'2019-12-28 18:32:32','2020-01-20 20:15:32'),(89,'1980-12-10','m','South Lilyan',1,'Cape Verde',89,'2015-12-06 07:17:05','2020-01-20 20:15:32'),(90,'1984-05-16','m','Lewisborough',2,'Falkland Islands (Malvinas)',90,'1977-06-26 10:42:38','2020-01-20 20:15:32'),(91,'1999-06-27','f','West Georgette',1,'Christmas Island',91,'1988-03-06 14:13:59','2020-01-20 20:15:32'),(92,'1983-06-29','f','Wyattville',1,'Tonga',92,'1979-11-04 05:17:27','2020-01-20 20:15:32'),(93,'1983-03-13','f','Port Daytonhaven',1,'Suriname',93,'1978-12-12 08:19:53','2020-01-20 20:15:32'),(94,'1999-08-17','m','South Brainburgh',1,'Gambia',94,'1983-08-23 10:49:41','2020-01-20 20:15:32'),(95,'1991-05-15','f','Olafborough',2,'Mauritius',95,'2017-07-01 05:19:16','2020-01-20 20:15:32'),(96,'1993-12-09','m','New Novellastad',1,'Nigeria',96,'1978-05-28 22:26:43','2020-01-20 20:15:32'),(97,'2018-12-04','m','South Braxton',2,'United States of America',97,'1987-12-30 01:49:08','2020-01-20 20:15:32'),(98,'1973-08-22','f','Croninhaven',2,'British Virgin Islands',98,'1981-12-03 01:58:29','2020-01-20 20:15:32'),(99,'1975-04-13','f','North Colby',2,'Israel',99,'2001-05-18 12:09:11','2020-01-20 20:15:32'),(100,'1975-04-30','f','West Oliverchester',1,'Mexico',100,'1992-11-19 11:11:55','2020-01-20 20:15:32');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_types`
--

DROP TABLE IF EXISTS `target_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_types`
--

LOCK TABLES `target_types` WRITE;
/*!40000 ALTER TABLE `target_types` DISABLE KEYS */;
INSERT INTO `target_types` VALUES (1,'messages','2020-01-27 12:51:02'),(2,'users','2020-01-27 12:51:02'),(3,'media','2020-01-27 12:51:02'),(4,'posts','2020-01-27 12:51:02');
/*!40000 ALTER TABLE `target_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cindy','Krajcik','julien67@example.com','(670)526-6790x2','12313326440bbdf','1980-04-06 22:08:10','1981-05-31 09:38:54'),(2,'Tyson','Wuckert','alfredo.jones@example.org','(907)878-6967','732cd56494bdb74','1986-10-13 04:30:37','2015-04-11 06:21:42'),(3,'Daryl','Kuhlman','loren.stamm@example.net','189-520-6623','f5dd1f74865b07b','1986-01-10 03:50:52','1990-08-10 09:40:21'),(4,'Elvera','Kihn','ehoppe@example.net','1-281-052-2995x','39cf8a4259fd300','2004-08-10 11:51:35','1972-04-26 19:03:31'),(5,'Emerald','Lang','darron36@example.com','02603927255','1a79d58270b5f94','2006-11-25 03:26:15','1980-02-11 10:56:23'),(6,'Cassandre','Boyer','goldner.ahmad@example.net','(727)048-9675x9','2ad4cbb8c90d6f7','1992-12-04 10:42:38','1971-12-12 12:07:12'),(7,'Xavier','Runte','qpowlowski@example.org','619.791.9212','b2764d629732e80','1980-04-17 09:29:52','1972-01-14 23:38:28'),(8,'Estelle','Hammes','ike08@example.com','(086)551-5203x9','15506c7877b2827','1991-09-05 06:33:49','2002-09-02 11:00:13'),(9,'Daisy','Brown','crist.rudolph@example.com','(961)906-3690','0552cd1286b0ab1','2013-10-17 17:14:01','2011-12-11 04:01:50'),(10,'Maiya','Berge','whitney48@example.net','703.409.0485x74','36a0e8f762583bb','1996-05-12 13:50:02','2001-04-27 14:58:08'),(11,'Xavier','Weissnat','gussie71@example.org','1-568-730-8282x','e94eab244b0121f','1985-06-27 02:31:14','1994-07-12 05:18:50'),(12,'Tillman','Will','schimmel.garnett@example.org','299.892.3924x31','be369881f7f634f','2008-12-19 05:47:54','1996-10-29 21:53:08'),(13,'Furman','Wyman','georgianna.lubowitz@example.com','07936643639','2aa54e96a6cc294','2005-08-03 09:20:30','2015-02-14 21:59:58'),(14,'Hilbert','Quitzon','habshire@example.org','488.254.7713x53','f09123c8f20f845','2016-10-10 21:21:27','2010-12-31 02:37:49'),(15,'Dayne','Franecki','mosciski.jaida@example.net','1-071-159-9475x','11f8f956f06593b','2007-07-17 14:40:57','2018-12-11 17:42:52'),(16,'June','Roob','rafael.hessel@example.com','895-308-2753','b06c41e7d53181e','2003-03-16 17:12:26','1999-05-02 01:51:30'),(17,'Bella','Blanda','guido.greenholt@example.net','772-951-8334','a6ed757ddfe5746','2008-06-27 16:02:23','2018-12-01 09:42:00'),(18,'Casandra','Rolfson','alisa.hickle@example.net','694.934.1190x75','dfc27788a6db18c','1997-05-03 03:33:09','1989-01-31 23:09:29'),(19,'Destin','Murphy','wolff.tyrell@example.net','1-175-397-5718x','8c7e6bbbcdcca91','2009-08-17 00:44:48','1972-09-21 13:52:42'),(20,'Maxwell','Gleichner','zmckenzie@example.org','(801)842-9894x5','73826e1ce29e48c','1998-08-08 15:00:48','1974-01-27 12:17:57'),(21,'Gillian','Rice','wilhelm57@example.net','376.260.4984x68','551535ec7c44890','1995-02-02 04:14:57','2008-08-22 08:09:47'),(22,'Maritza','Boyle','josianne.miller@example.com','485-826-9544','5db6eac450d06ef','2008-08-03 17:08:29','2011-04-05 02:39:03'),(23,'Cooper','Keebler','stacey27@example.net','(484)848-2296x6','b97468e86090a33','1989-12-11 08:31:07','1975-01-08 19:05:46'),(24,'Alba','Nader','junius56@example.net','135-134-0701','70742914e67125f','1990-09-07 15:08:36','1997-05-03 06:23:18'),(25,'Marisa','Jaskolski','iframi@example.org','484.237.1648x54','06f662100e4c946','1971-08-14 12:57:53','2018-10-03 20:31:41'),(26,'Jeanie','Bartell','huel.lilliana@example.com','04889408645','af000a94597b08f','1996-03-02 23:14:41','2003-01-15 00:51:37'),(27,'Orlo','Christiansen','crempel@example.net','151.701.8006','97f0b283bd6be9c','2007-05-08 10:54:17','1979-10-18 01:47:00'),(28,'Lyda','Emmerich','robel.danyka@example.com','+39(0)937355569','af3e0c78250aa4c','1987-05-06 13:33:21','1996-08-05 02:45:28'),(29,'Ignacio','Wuckert','ebreitenberg@example.com','684-021-3183x73','7cdfd0775e6bce2','1983-03-30 01:11:52','1990-01-07 13:39:38'),(30,'Monserrat','Sawayn','champlin.lavern@example.net','+86(2)849405527','d217441e06fe2d1','2002-11-11 14:10:10','2011-08-29 08:39:26'),(31,'Janice','O\'Conner','krystina64@example.com','+83(3)126268935','29c07dd55e3ded1','2005-04-03 02:11:52','2016-07-15 09:45:26'),(32,'Al','Renner','enicolas@example.com','153.148.1798x34','949b26144968695','1988-12-28 17:29:02','1988-06-15 09:14:33'),(33,'Evalyn','Blick','rubie29@example.com','(572)523-7857x7','041d913a9f53bde','1984-11-07 15:45:26','1984-11-06 09:30:57'),(34,'Laverne','Mann','iconsidine@example.org','(884)996-9863x7','56264fc5a8560e8','1993-05-08 02:57:29','2000-06-14 15:36:10'),(35,'Allie','O\'Keefe','oroberts@example.com','(818)200-4166x4','e862174a5ad0955','2014-07-11 13:12:54','1983-03-31 04:08:56'),(36,'Kelly','Ziemann','eparisian@example.org','877.143.7324x84','f2df52dc98e0bc6','1997-09-19 11:58:51','1986-02-27 05:32:00'),(37,'Cleveland','Kautzer','qspencer@example.org','931.199.3421x04','c83fe431ff1e4be','2015-02-04 13:10:43','1984-04-25 04:37:03'),(38,'Abel','Brakus','abbie82@example.net','(147)613-2861','c6dddb1bc445ba3','2009-01-28 02:18:00','1989-10-26 09:44:54'),(39,'Cory','Lakin','itzel.bahringer@example.net','1-086-545-2025','3a74f1ecbf64bc8','1978-09-11 08:42:21','1997-12-07 02:59:57'),(40,'Lew','Schinner','demond.king@example.com','793.502.6746x39','03c65320a9e88da','2013-12-13 18:59:28','1987-02-09 09:08:05'),(41,'Maxwell','Collier','icummings@example.org','396-537-6362x89','b4f2c601b1c2f48','1971-09-05 21:22:55','1982-05-24 11:59:20'),(42,'Connor','Romaguera','aniyah.shanahan@example.com','01070528110','d9884e7645da5e5','1983-11-16 18:09:13','1988-01-08 18:22:52'),(43,'Jerrod','Beier','damian.bauch@example.org','(745)898-8892x4','eb12e6d8321cffe','2012-11-29 02:35:01','1990-04-11 20:13:15'),(44,'Kendrick','Nienow','wsteuber@example.net','319-532-8686x45','a7ec98268f7a1cc','2009-12-02 22:38:24','2005-02-17 17:05:47'),(45,'Emmie','Kuhn','naomi21@example.net','1-622-988-3416x','b310ae50385d607','1996-09-06 08:53:40','2002-03-19 13:09:10'),(46,'Kamren','Runte','rbeahan@example.com','(501)819-9467x1','2dee60c93392f7b','2017-07-28 17:59:07','2008-07-28 08:49:03'),(47,'Gabriella','Hackett','deborah85@example.org','981-183-7194','0336f131347e082','1981-07-02 23:16:56','1984-12-13 12:32:51'),(48,'Isidro','Schultz','mhamill@example.org','03643774258','5ae61bef4c1d15d','1987-09-01 23:24:06','2000-05-26 14:12:38'),(49,'Stuart','Koelpin','emertz@example.net','067-656-7994','b9e248173a06967','1989-05-31 11:54:29','2003-03-04 17:51:29'),(50,'Cordell','Goyette','lind.juanita@example.org','1-164-659-8150x','eb9853e724a7d47','1973-08-04 04:13:14','1999-01-02 08:18:46'),(51,'Freida','Langworth','nicola32@example.net','+85(5)591472176','9b45b62fdc7d4dc','1981-06-23 13:57:03','1986-01-24 06:13:44'),(52,'Connor','Schmidt','dillan11@example.com','(246)425-0726','a54ebeccba323ef','2012-05-25 14:14:38','2010-05-11 02:23:37'),(53,'Herminia','Bahringer','fzemlak@example.com','01638317279','da9c0b4d2d56699','1986-11-19 20:23:47','1992-06-02 10:50:40'),(54,'Mitchell','Simonis','eva.gleason@example.net','(963)179-0155','d87b9908c3b3171','1973-08-23 02:33:55','1980-01-04 04:21:47'),(55,'Kaley','Gislason','xbraun@example.com','(296)550-5011x7','e670609a12258e5','1987-05-06 18:50:13','1977-01-11 07:51:04'),(56,'Darrick','Grant','gleichner.isac@example.com','483-815-6533x48','febcc02f6abf028','2005-12-12 02:38:35','1973-04-08 02:17:13'),(57,'Leilani','Larkin','presley.flatley@example.com','07553552111','bfaf1dba65eac13','1976-02-02 00:46:19','1985-09-19 19:32:36'),(58,'Rebeca','Cormier','elliot.ortiz@example.org','(986)893-3730','f7dbc2d757dfda7','2005-02-02 03:04:36','1973-09-05 17:37:08'),(59,'Roy','Auer','collin.bode@example.org','(019)563-9338x8','03663f8e82f004f','2008-02-23 20:51:38','1981-02-17 09:30:44'),(60,'Everette','Bergnaum','runte.jamey@example.com','1-223-896-2422','828f8a55704df20','1999-12-01 09:45:25','1980-06-14 08:47:27'),(61,'Duane','Nicolas','fadel.gregoria@example.com','224.942.4239x98','438eaf86bd158eb','1987-09-25 09:10:03','1980-01-04 14:32:45'),(62,'Kristian','Kerluke','lowe.kevon@example.net','1-180-892-9614','cc77ff3e5894948','1981-05-28 00:51:25','1976-11-19 19:11:56'),(63,'Heaven','Rowe','ajacobson@example.net','+88(2)407965741','6c12a82a497326a','2019-08-30 14:38:16','2002-05-21 18:42:10'),(64,'Shanon','Aufderhar','albertha96@example.net','274.369.2084','3d11e37486f2113','1993-08-18 18:48:35','1989-08-15 19:12:34'),(65,'Violet','Treutel','penelope.schoen@example.net','1-102-469-8432x','13f1821b27e3913','1989-11-14 03:07:16','1991-10-22 04:16:00'),(66,'Kayley','Donnelly','bartoletti.stephanie@example.com','136.832.9087','d199335b8509c1f','2003-11-27 19:52:43','1982-03-06 18:58:34'),(67,'Jermain','Kuvalis','herzog.sonya@example.com','(304)995-4073','37ddb8e138c6acc','1989-05-21 14:27:32','1971-03-15 00:04:58'),(68,'Connie','Abbott','beahan.vivian@example.com','013-364-7131x84','d42b92fdbc0d5a7','1992-08-30 19:59:47','2012-01-20 22:17:38'),(69,'Ali','Olson','xthiel@example.com','+37(5)084865371','92d428ca1dbde54','1985-01-09 01:09:09','1972-08-29 11:57:13'),(70,'Gilda','Macejkovic','xtrantow@example.net','(556)621-5603x7','4051edef88501df','2005-07-30 11:15:53','1988-07-04 10:38:55'),(71,'Camille','Stokes','angelina54@example.net','(008)877-1488x5','576ac94c19ebe6c','1984-02-21 16:31:59','2018-08-22 12:53:53'),(72,'Rosanna','Zieme','harold00@example.org','321-852-3251x18','eba018a04c2d672','2001-07-17 08:23:09','1992-09-23 10:30:37'),(73,'Brandon','Conn','spinka.landen@example.com','017-245-4656x82','8e7fa76aed75043','2002-11-22 01:35:58','1981-01-17 09:19:26'),(74,'Hollis','Zieme','dustin.rowe@example.org','+81(4)668948666','d3b69db7d76db30','1998-04-11 22:28:09','1977-08-28 21:05:10'),(75,'Haley','Farrell','fleta41@example.com','150-304-1553','9bcc22402889400','2010-05-28 22:55:56','2003-11-27 01:12:13'),(76,'Earnest','Considine','ptowne@example.com','1-422-419-4934x','a88805737f99cdd','1975-10-01 08:03:29','1970-06-09 22:56:56'),(77,'Katharina','Hane','viviane.beahan@example.com','(296)971-7870x2','ae5c44f2ce89232','1984-10-29 22:17:16','2000-04-09 20:57:53'),(78,'Montana','Boehm','ferry.alvera@example.org','377-327-9876x63','ed5dc5542a564b7','1994-12-07 22:54:30','2005-08-10 07:30:07'),(79,'Demetris','Renner','patience72@example.net','1-488-074-1527','436fafc99c85636','2016-10-30 21:37:01','1975-01-05 13:01:17'),(80,'Trent','Rolfson','arnold40@example.net','934.315.3443x33','829355ce7da53ff','2006-07-19 19:37:00','1991-12-08 09:13:36'),(81,'Reese','Lindgren','savannah.goodwin@example.org','193-741-1579','fd3e69f8682d8ef','2011-09-24 05:55:30','1987-10-31 04:07:24'),(82,'Camylle','Ratke','white.valentina@example.com','475.810.9567x84','96370d11413a878','2017-03-11 20:16:05','2006-07-24 04:18:25'),(83,'Mallory','Turner','jayden.durgan@example.org','+96(5)399171725','4ac800611001fad','2009-09-02 07:51:15','2017-06-15 10:28:10'),(84,'Blake','Wyman','o\'reilly.everette@example.org','664-349-6598x63','11ab1c79a609d68','2000-04-07 23:02:03','2018-08-19 12:17:30'),(85,'Jared','Ward','aufderhar.deondre@example.com','1-178-163-2169x','a4eff894d86ca4c','1994-03-30 14:35:07','2015-12-30 00:21:25'),(86,'Wilburn','Tromp','fadel.curt@example.net','650-240-6889x95','ea8e30b4e903447','1980-12-23 13:49:55','1996-09-15 10:20:57'),(87,'Duncan','Rolfson','einar.willms@example.org','(293)768-0159x9','8c85b438541eb34','1995-12-18 12:50:59','1998-02-03 06:29:20'),(88,'Evan','Nitzsche','demetris.leffler@example.org','764-806-7233x38','d31e630003552d8','1998-09-05 19:05:13','1990-06-12 12:25:53'),(89,'Antwan','Windler','guillermo.dubuque@example.net','372-557-7449x47','9493ec717f79d76','1973-05-06 00:30:43','2008-10-20 12:08:00'),(90,'Brannon','Connelly','suzanne.parker@example.com','1-721-933-8439x','67da597c0cb9c8c','2017-07-12 14:52:41','1974-07-05 11:09:48'),(91,'Arianna','Metz','brandt.kemmer@example.com','037.630.6878','889fe0c64e8b95d','1981-10-21 20:55:07','1986-05-03 10:44:36'),(92,'Carroll','Frami','schmitt.francis@example.net','644.480.2201x68','b16499f448b5797','2002-12-20 07:02:00','1981-07-07 09:26:58'),(93,'Murphy','Hagenes','edward83@example.org','1-074-853-8786x','2ab19587b00d7a1','2017-04-11 17:23:42','2012-08-30 03:04:04'),(94,'Else','Bernier','samson36@example.net','717-628-2457x04','97d3aeeeb729a93','1971-02-07 19:23:41','1981-03-30 16:02:57'),(95,'Rosa','Pouros','germaine.deckow@example.net','314-242-6459x54','3e90dcd9bd1b3e4','1976-02-08 14:24:05','2015-08-06 01:51:19'),(96,'Vernie','Nitzsche','alexandra42@example.com','1-349-015-2086x','085a70cdd16020e','2004-04-17 15:46:22','1991-11-09 05:55:21'),(97,'Evelyn','Hirthe','herman.audreanne@example.net','(304)902-9408x2','84ecf6790d62157','2008-02-11 04:41:32','2003-05-12 07:00:46'),(98,'Ray','Frami','cornell84@example.com','654.568.6891','3c9a39e1a036912','1998-02-03 14:37:17','1974-06-03 23:24:59'),(99,'Athena','Rodriguez','dominic.herman@example.org','+41(9)629693164','161c7a5875b2899','2013-03-04 15:05:48','2007-03-11 03:44:27'),(100,'Gerhard','Pouros','jerrell.veum@example.com','525-003-6080x43','880ad76d9fbd97d','2003-12-04 21:41:49','2019-06-15 10:57:36');
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

-- Dump completed on 2020-02-03 21:30:26
