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
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `announcement_name` varchar(255) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `announcement` varchar(255) DEFAULT NULL,
  `announced_to` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `author` (`author`),
  KEY `announced_to` (`announced_to`),
  KEY `created_by` (`created_by`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`author`) REFERENCES `organizations` (`org_id`),
  CONSTRAINT `announcement_ibfk_2` FOREIGN KEY (`announced_to`) REFERENCES `organizations` (`org_id`),
  CONSTRAINT `announcement_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `organizations` (`org_id`),
  CONSTRAINT `announcement_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (1,'ds',1,'dasda',NULL,'2019-09-07 09:45:30',1,'Sample Remarks',1),(2,NULL,1,NULL,NULL,'2019-09-07 09:45:30',1,'Sample Remarks',1),(3,'ds',1,'dasda',NULL,'2019-09-07 09:45:46',1,'Sample Remarks',1),(4,NULL,1,NULL,NULL,'2019-09-07 09:45:46',1,'Sample Remarks',1),(5,'kdhjkdf',1,'fsdkfjdsk',NULL,'2019-09-07 13:01:23',1,'Sample Remarks',1),(6,NULL,1,NULL,NULL,'2019-09-07 13:01:23',1,'Sample Remarks',1),(7,'kdhjkdf',1,'fsdkfjdsk',NULL,'2019-09-07 13:01:40',1,'Sample Remarks',1),(8,NULL,1,NULL,NULL,'2019-09-07 13:01:40',1,'Sample Remarks',1),(9,'fjsdlk',1,'fjsdklfjasdl',NULL,'2019-09-07 14:10:23',1,'Sample Remarks',1),(10,'Sample Announcement',1,'ahha',NULL,'2019-09-07 14:13:14',1,'Sample Remarks',1),(11,'haha',1,'dasdas',NULL,'2019-09-07 14:25:36',1,'Sample Remarks',1),(12,'efsfds',1,'sadad',NULL,'2019-09-07 14:28:27',1,'Sample Remarks',1),(13,'fdd',1,'dfsfd',NULL,'2019-09-07 14:30:05',1,'Sample Remarks',1),(14,'sfdsf',1,'fdsfs',NULL,'2019-09-07 14:31:49',1,'Sample Remarks',1),(15,'fsfs',1,'fdsfs',NULL,'2019-09-07 14:34:25',1,'Sample Remarks',1),(16,'gh',1,'gj',NULL,'2019-09-07 14:35:23',1,'Sample Remarks',1),(17,'ff',1,'dd',NULL,'2019-02-02 00:00:00',1,'d',1),(18,'fsdfs',1,'fsfsd',NULL,'2019-09-07 14:40:46',1,'Sample Remarks',1),(19,'fsdfs',1,'fsdfsd',NULL,'2019-09-07 14:45:35',1,'Sample Remarks',1),(20,'dasdsa',1,'asdas',NULL,'2019-09-07 15:04:49',1,'Sample Remarks',1),(21,'fdsf',1,'fsd',NULL,'2019-09-07 15:12:00',1,'Sample Remarks',1),(22,'sdf',1,'fsfs',NULL,'2019-09-07 15:13:21',1,'Sample Remarks',1),(23,'fjskdl',1,'hjka',NULL,'2019-09-07 15:16:04',1,'Sample Remarks',1),(24,'ads',1,'dasd',NULL,'2019-09-07 15:22:50',1,'Sample Remarks',1),(25,'dfs',1,'fsd',NULL,'2019-09-07 15:23:59',1,'Sample Remarks',1),(26,'sdf',1,'sff',NULL,'2019-09-07 15:27:02',1,'Sample Remarks',1),(27,'',1,'jggf',NULL,'2019-09-09 18:45:14',1,'Sample Remarks',1),(28,'tyu',1,'jkkhkh',NULL,'2019-09-11 22:02:38',1,'Sample Remarks',2),(29,'sdads',1,'dasdsa',NULL,'2019-10-08 03:12:52',1,'Sample Remarks',6),(30,'thesis',1,'defense',NULL,'2019-10-11 16:57:45',1,'Sample Remarks',6),(31,'',1,'',NULL,'2019-10-12 07:52:43',1,'Sample Remarks',2),(32,'',1,'',NULL,'2019-10-12 08:10:25',1,'Sample Remarks',2),(33,'Title',1,'announcement',NULL,'2019-10-12 16:16:36',1,'Sample Remarks',6);
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-16  6:32:46
