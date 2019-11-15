-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ce_org
-- ------------------------------------------------------
-- Server version	5.6.45-log

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) DEFAULT NULL,
  `activity_start_date` datetime DEFAULT NULL,
  `activity_end_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `created_by` (`created_by`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `organizations` (`org_id`),
  CONSTRAINT `activities_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Event','2019-10-08 08:00:00','2019-10-09 08:00:00','hehehe','2019-10-08 01:37:24',1,NULL,1),(2,'dd','2019-10-14 08:00:00','2019-10-13 08:00:00','.*/123','2019-10-08 02:52:32',1,NULL,1),(3,'',NULL,NULL,'','2019-10-08 14:56:21',1,NULL,2),(4,'wews2','2019-10-18 08:00:00','2019-10-24 08:00:00','nothing. just saying','2019-10-11 16:19:18',1,NULL,1),(5,'',NULL,NULL,'','2019-10-11 16:26:49',1,NULL,2),(6,'',NULL,NULL,'','2019-10-11 16:28:17',1,NULL,2),(7,'',NULL,NULL,'','2019-10-11 16:28:46',1,NULL,2),(8,'',NULL,NULL,'','2019-10-11 16:29:09',1,NULL,2),(9,'',NULL,NULL,'d','2019-10-11 16:29:16',1,NULL,2),(10,'',NULL,NULL,'d','2019-10-11 16:31:41',1,NULL,2),(11,'',NULL,NULL,'','2019-10-11 16:33:45',1,NULL,2),(12,'',NULL,NULL,'','2019-10-11 16:33:47',1,NULL,2),(13,'Birthday','2019-10-16 08:00:00','2019-10-23 08:00:00','ghghg','2019-10-12 16:40:28',1,NULL,2);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-16  6:32:44
