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
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `scheduled_start_time` time DEFAULT NULL,
  `scheduled_end_time` time DEFAULT NULL,
  `event_room_id` int(11) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `requested_by` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `date_requested` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `event_room_id` (`event_room_id`),
  KEY `created_by` (`created_by`),
  KEY `requested_by` (`requested_by`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`event_room_id`) REFERENCES `event_rooms` (`event_room_id`),
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `organizations` (`org_id`),
  CONSTRAINT `reservations_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (62,'08:30:00','18:00:00',4,'cores','2019-09-11 23:03:31',1,NULL,'good2',5,'2019-09-12 08:00:00'),(63,'08:00:00','16:00:00',2,'sfd','2019-09-11 23:04:19',1,NULL,'better',5,'2019-09-19 08:00:00'),(64,'01:30:00','02:30:00',3,'defense','2019-09-11 23:19:20',1,NULL,'what2',3,'2019-09-20 08:00:00'),(65,'02:30:00','02:30:00',1,'thesis','2019-09-11 23:44:24',1,NULL,'best2',5,'2019-09-26 08:00:00'),(66,'02:00:00','05:30:00',1,'dp2','2019-09-11 23:48:40',1,NULL,'gg2',5,'2019-09-26 08:00:00'),(67,'05:00:00','09:00:00',2,'oop','2019-09-15 10:20:29',1,NULL,'wow',5,'2019-09-27 08:00:00'),(68,'05:00:00','09:00:00',3,'oop','2019-09-15 10:21:25',1,NULL,'wow2',5,'2019-09-27 08:00:00'),(69,'05:00:00','09:00:00',3,'oop','2019-09-15 10:22:44',1,NULL,'wow4',5,'2019-09-27 08:00:00'),(70,'08:00:00','10:00:00',4,'SAD','2019-09-15 10:27:25',1,NULL,'nice',3,'2019-09-18 08:00:00'),(71,'08:00:00','10:00:00',4,'SAD','2019-09-15 10:29:14',1,NULL,'nice2',5,'2019-09-18 08:00:00'),(72,'01:00:00','02:00:00',3,'CPE WEEK2','2019-09-15 10:35:36',1,NULL,'bad2',4,'2019-09-20 08:00:00'),(73,'02:00:00','05:30:00',1,'dp2','2019-09-15 10:36:03',1,NULL,'gg2',5,'2019-09-20 08:00:00'),(74,'08:00:00','16:00:00',2,'sfd','2019-09-15 10:38:44',1,NULL,'better2',4,'2019-09-12 08:00:00'),(75,'07:00:00','11:30:00',2,'try','2019-09-15 11:08:23',1,NULL,'hehe',5,'2019-09-19 08:00:00'),(76,'07:00:00','11:30:00',2,'try','2019-09-15 11:08:44',1,NULL,'hehe2',5,'2019-09-19 08:00:00'),(77,'07:00:00','11:30:00',3,'try','2019-09-15 11:10:14',1,NULL,'hehe2',5,'2019-09-19 08:00:00'),(78,'07:00:00','11:30:00',2,'try','2019-09-15 11:11:24',1,NULL,'hehe',5,'2019-09-20 08:00:00'),(79,'10:00:00','18:00:00',1,'wrjkl','2019-09-16 05:09:42',1,NULL,'good5',4,'2019-09-20 08:00:00'),(80,'07:30:00','16:00:00',4,'try2','2019-09-16 05:14:33',1,NULL,'worst2',4,'2019-09-18 08:00:00'),(81,'04:00:00','16:30:00',1,'thesis','2019-09-16 05:19:42',1,NULL,'psst4',5,'2019-09-20 08:00:00'),(82,'01:00:00','09:30:00',2,'oop','2019-09-16 06:32:09',1,NULL,'wow2',2,'2019-09-12 08:00:00'),(83,'09:30:00','12:30:00',1,'asar','2019-09-16 06:54:50',1,NULL,'yeah',4,'2019-09-20 08:00:00'),(84,'02:30:00','06:00:00',2,'jflkd2','2019-09-17 13:47:57',1,NULL,'good2',5,'2019-09-19 08:00:00'),(85,'09:30:00','11:30:00',3,'123','2019-09-19 13:06:43',2,NULL,'wooooah',3,'2019-09-21 08:00:00'),(86,'01:30:00','11:00:00',2,'ssdd','2019-10-12 15:21:20',1,NULL,'hghg',2,'2019-09-12 08:00:00'),(87,'01:30:00','11:00:00',2,'ssdd','2019-10-12 15:21:53',1,NULL,'hghg',2,'2019-09-12 08:00:00'),(88,'01:30:00','11:00:00',2,'ssdd','2019-10-12 15:23:00',1,NULL,'hghg',2,'2019-09-12 08:00:00'),(89,'01:30:00','16:00:00',2,'trrt','2019-10-12 15:28:45',1,NULL,'ncie',3,'2019-10-17 08:00:00'),(90,'09:30:00','12:00:00',1,'h','2019-10-12 16:08:28',1,NULL,'d',4,'2019-10-16 08:00:00'),(91,'08:30:00','11:00:00',1,'defense','2019-10-12 16:10:58',1,NULL,'h',2,'2019-10-16 08:00:00'),(92,'09:00:00','12:00:00',1,'feersre','2019-10-30 15:43:47',1,NULL,'good',4,'2019-10-31 08:00:00');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
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
