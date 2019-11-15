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
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL,
  `org_adviser` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `code_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  KEY `dept_id` (`dept_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `organizations_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`),
  CONSTRAINT `organizations_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'Association of Concerned  Computer Engineering Students for Services','Engr. Florinda Oquindo & Engr. Orlando Pajabera','2019-08-23 13:51:29',NULL,1,1,'ACCESS'),(2,'PUP Aggregates',NULL,'2019-08-23 13:51:32',1,4,1,''),(3,'Philippine Institute of Civil Engineering - PUP Student Chapter',NULL,NULL,NULL,4,1,'PICES PUPSC'),(4,'Electronics Engineering Student Society ',NULL,NULL,NULL,5,1,'ECESS'),(5,'PUP - RAILSS',NULL,NULL,NULL,7,1,NULL),(6,'Electrical Engineering Network',NULL,NULL,NULL,3,1,'EEN'),(7,'Philippine Institute of Industrial Engineers',NULL,NULL,NULL,6,1,'PIIE PUPSC'),(8,'Philippine Society of Mechanical Engineers PUP Student Unit',NULL,NULL,NULL,2,1,'PSME PUPSU'),(9,'College of Engineering Students Honors\' Society',NULL,NULL,NULL,8,1,NULL),(10,'College of Engineering Student Council',NULL,NULL,NULL,8,1,'CE-SC');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
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
