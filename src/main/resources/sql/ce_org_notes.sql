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
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `note_title` varchar(255) DEFAULT NULL,
  `note` varchar(50000) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `created_by` (`created_by`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `organizations` (`org_id`),
  CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Title','hhahaha2222222','2019-10-08 01:07:09',1,NULL,2),(2,'Hello','hhahaha','2019-10-08 03:11:56',1,NULL,2),(3,'try','niceeee','2019-10-10 20:33:38',9,NULL,2),(4,'hg','haha','2019-10-10 20:34:02',9,NULL,2),(5,'ano to?','ewan','2019-10-10 20:34:11',9,NULL,1),(6,'thesis','thesis defense. \ndocuments needed\npictures\nexperiments','2019-10-11 16:15:06',1,NULL,1),(7,'nice','djkjdklajdklasjdklajdkl;AJ;KLDJA','2019-10-11 18:18:34',1,NULL,2),(8,'nice','djkjdklajdklasjdklajdkl;AJ;KLDJA','2019-10-11 18:18:36',1,NULL,2),(9,'sad system','deadline tomorrow','2019-10-11 18:19:40',1,NULL,1),(10,'test','adsfdg','2019-10-12 13:04:35',1,NULL,1),(11,'test','julius','2019-10-12 13:04:47',1,NULL,1),(12,'test','julius panget','2019-10-12 13:05:17',1,NULL,2),(13,'test','katepanget','2019-10-12 13:05:25',1,NULL,1),(14,'test2','jopolo panget jopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo pangetjopolo ','2019-10-12 13:05:31',1,NULL,2),(15,'test','wow juliusabfhafliaf brbyvavbfanhfacbaf ba  \n a\na\n\ns\nag\ng\na\nae\n\net\ne\nay\nae\n','2019-10-12 13:05:47',1,NULL,1),(16,'Title','helo','2019-10-12 13:12:27',1,NULL,1),(17,'SAD','DEFENSE','2019-10-12 16:47:26',1,NULL,1),(18,'SAD2','DEFENSE','2019-10-12 16:47:43',1,NULL,1),(19,'Title','notes','2019-10-23 18:21:42',1,NULL,1);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-16  6:32:47
