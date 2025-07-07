-- UNCOMMENT THE FOLLOWING TWO LINES IF RUNNING ON A LOCAL SERVER
-- CREATE DATABASE  IF NOT EXISTS `ev_xyz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
-- USE `ev_xyz`;

-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: ev_xyz
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `charging_event`
--

DROP TABLE IF EXISTS `charging_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_event` (
  `charge_event_id` int NOT NULL AUTO_INCREMENT,
  `requested_at` datetime NOT NULL,
  `vin` varchar(25) NOT NULL,
  `license_num` varchar(10) NOT NULL,
  `station_id` int NOT NULL,
  `outlet_number` int DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `kwh` float DEFAULT NULL,
  `charge_started_at` datetime DEFAULT NULL,
  PRIMARY KEY (`charge_event_id`),
  KEY `fk_electric_vehicle_has_charging_outlet_charging_outlet1_idx` (`outlet_number`,`station_id`),
  KEY `fk_electric_vehicle_has_charging_outlet_electric_vehicle1_idx` (`vin`),
  KEY `fk_electric_vehicle_has_charging_outlet_coupon1_idx` (`coupon_id`),
  KEY `fk_charging_event_person1_idx` (`license_num`),
  KEY `fk_charging_event_charging_station1_idx` (`station_id`),
  CONSTRAINT `fk_charging_event_charging_station1` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`station_id`),
  CONSTRAINT `fk_charging_event_person1` FOREIGN KEY (`license_num`) REFERENCES `person` (`license_num`),
  CONSTRAINT `fk_electric_vehicle_has_charging_outlet_charging_outlet1` FOREIGN KEY (`outlet_number`, `station_id`) REFERENCES `outlet` (`outlet_number`, `station_id`),
  CONSTRAINT `fk_electric_vehicle_has_charging_outlet_coupon1` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`),
  CONSTRAINT `fk_electric_vehicle_has_charging_outlet_electric_vehicle1` FOREIGN KEY (`vin`) REFERENCES `electric_vehicle` (`vin`)
) ENGINE=InnoDB AUTO_INCREMENT=532 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_event`
--

LOCK TABLES `charging_event` WRITE;
/*!40000 ALTER TABLE `charging_event` DISABLE KEYS */;
INSERT INTO `charging_event` VALUES (1,'2025-01-03 14:22:15','7','14',5,2,8,72.5,'2025-01-03 14:45:32'),(2,'2025-01-07 09:18:43','14','14',22,1,3,35.2,'2025-01-07 09:29:12'),(3,'2025-01-12 18:45:22','22','10',4,3,5,71,'2025-01-12 19:12:45'),(4,'2025-01-15 07:32:18','5','5',8,2,NULL,45.3,'2025-01-15 08:12:34'),(5,'2025-01-19 22:14:53','18','13',29,1,11,NULL,NULL),(6,'2025-01-22 11:36:29','3','3',7,3,19,62,'2025-01-22 12:15:48'),(7,'2025-01-25 16:28:42','29','12',4,2,24,67.2,'2025-01-25 17:09:15'),(8,'2025-01-29 20:53:17','11','11',18,1,1,51.8,'2025-01-29 21:23:45'),(9,'2025-02-02 13:41:36','26','24',1,3,13,98,'2025-02-02 14:32:12'),(10,'2025-02-05 08:17:24','9','9',11,2,28,82.3,'2025-02-05 09:05:47'),(11,'2025-02-08 19:33:51','17','23',27,1,4,43.9,'2025-02-08 20:22:18'),(12,'2025-02-12 10:46:32','1','1',4,3,26,80,'2025-02-12 11:35:56'),(13,'2025-02-16 15:22:47','20','1',14,2,17,62,'2025-02-16 16:07:32'),(14,'2025-02-19 23:04:58','4','4',9,1,22,NULL,NULL),(15,'2025-02-23 12:19:33','15','16',7,3,15,59.7,'2025-02-23 13:05:41'),(16,'2025-02-26 07:38:21','28','28',3,2,9,44,'2025-02-26 08:23:15'),(17,'2025-03-01 14:52:46','8','28',19,1,7,48.4,'2025-03-01 15:34:27'),(18,'2025-03-04 21:16:33','24','24',1,3,2,62,'2025-03-04 22:01:18'),(19,'2025-03-08 11:35:27','13','2',7,2,21,73.8,'2025-03-08 12:25:36'),(20,'2025-03-11 16:48:12','2','2',17,1,10,55.1,'2025-03-11 17:38:42'),(21,'2025-03-15 09:27:38','21','18',4,3,16,62,'2025-03-15 10:15:21'),(22,'2025-03-19 19:53:25','6','6',10,2,30,71,'2025-03-19 20:32:47'),(23,'2025-03-22 12:14:54','27','6',28,1,14,NULL,NULL),(24,'2025-03-26 08:39:17','16','16',1,3,29,63.5,'2025-03-26 09:24:38'),(25,'2025-03-30 22:05:46','10','30',16,2,6,80,'2025-03-30 22:48:13'),(26,'2025-04-03 15:21:32','25','25',24,1,12,98,'2025-04-03 16:08:54'),(27,'2025-04-06 10:48:19','12','19',1,3,25,51.3,'2025-04-06 11:34:27'),(28,'2025-04-10 21:37:42','30','30',6,2,18,77.6,'2025-04-10 22:15:36'),(29,'2025-04-13 13:55:28','19','29',20,1,23,26,'2025-04-13 14:42:15'),(30,'2025-04-17 08:12:54','23','23',2,3,27,62,'2025-04-17 09:05:32'),(31,'2025-01-05 16:33:22','11','8',14,1,20,65.3,'2025-01-05 17:22:45'),(32,'2025-01-09 11:47:36','25','15',5,2,NULL,42.8,'2025-01-09 12:33:18'),(33,'2025-01-14 20:29:51','3','26',7,3,NULL,62,'2025-01-14 21:15:42'),(34,'2025-01-17 09:54:27','16','8',9,1,NULL,79.2,'2025-01-17 10:48:36'),(35,'2025-01-21 14:17:38','29','12',17,2,NULL,NULL,NULL),(36,'2025-01-24 22:41:15','8','30',1,3,NULL,56.5,'2025-01-24 23:15:28'),(37,'2025-01-27 13:09:42','22','10',3,1,NULL,71,'2025-01-27 14:03:21'),(38,'2025-01-31 18:35:26','5','24',1,2,NULL,71,'2025-01-31 19:24:53'),(39,'2025-02-03 10:48:59','14','25',4,3,NULL,45.9,'2025-02-03 11:42:17'),(40,'2025-02-06 15:22:37','27','23',7,1,NULL,53,'2025-02-06 16:15:28'),(41,'2025-02-10 08:56:14','19','29',4,2,NULL,26,'2025-02-10 09:45:32'),(42,'2025-02-14 21:13:45','2','29',7,3,NULL,53,'2025-02-14 22:09:54'),(43,'2025-02-17 12:37:22','28','27',4,1,NULL,44,'2025-02-17 13:21:45'),(44,'2025-02-21 19:52:48','10','3',19,2,NULL,NULL,NULL),(45,'2025-02-25 11:14:36','21','18',10,3,NULL,62,'2025-02-25 11:58:27'),(46,'2025-02-28 16:43:59','4','16',27,1,NULL,89,'2025-02-28 17:31:12'),(47,'2025-03-03 09:27:21','17','23',12,2,NULL,54.3,'2025-03-03 10:19:43'),(48,'2025-03-06 22:48:36','30','28',4,3,NULL,82.6,'2025-03-06 23:34:58'),(49,'2025-03-10 14:19:43','13','2',1,1,NULL,89,'2025-03-10 15:12:19'),(50,'2025-03-13 07:53:27','26','21',18,2,NULL,73.5,'2025-03-13 08:35:42'),(51,'2025-03-17 17:34:18','9','11',7,3,NULL,47.8,'2025-03-17 18:29:36'),(52,'2025-03-20 10:47:52','18','1',8,1,NULL,71,'2025-03-20 11:32:15'),(53,'2025-03-24 21:26:13','1','17',16,2,NULL,NULL,NULL),(54,'2025-03-28 13:55:39','23','10',1,3,NULL,68.1,'2025-03-28 14:41:22'),(55,'2025-04-01 08:22:45','12','19',5,1,NULL,71,'2025-04-01 09:18:32'),(56,'2025-04-04 19:46:31','6','2',16,2,NULL,71,'2025-04-04 20:36:45'),(57,'2025-04-08 11:39:18','24','3',4,3,NULL,59.4,'2025-04-08 12:29:38'),(58,'2025-04-12 16:14:36','15','14',11,1,NULL,115.3,'2025-04-12 17:08:45'),(59,'2025-04-15 09:32:47','7','14',3,2,NULL,77.2,'2025-04-15 10:19:36'),(60,'2025-04-19 22:58:31','20','5',2,3,NULL,62,'2025-04-19 23:42:18'),(61,'2025-01-02 08:45:26','17','23',19,1,NULL,54.9,'2025-01-02 09:32:18'),(62,'2025-01-06 17:32:48','4','13',7,2,NULL,89,'2025-01-06 18:27:36'),(63,'2025-01-11 12:19:33','26','24',1,3,NULL,69.8,'2025-01-11 13:05:42'),(64,'2025-01-16 23:47:12','9','19',15,1,NULL,92.4,'2025-01-17 00:34:27'),(65,'2025-01-20 15:28:46','22','10',9,2,NULL,NULL,NULL),(66,'2025-01-23 10:59:33','12','29',8,3,NULL,71,'2025-01-23 11:47:15'),(67,'2025-01-28 19:15:24','30','20',21,1,NULL,48.2,'2025-01-28 20:05:36'),(68,'2025-02-01 11:42:58','15','1',11,2,NULL,85.7,'2025-02-01 12:38:14'),(69,'2025-02-04 21:07:39','27','6',7,3,NULL,53,'2025-02-04 22:01:25'),(70,'2025-02-07 14:23:45','8','10',14,1,NULL,63.5,'2025-02-07 15:16:29'),(71,'2025-02-11 07:56:29','19','29',3,2,NULL,26,'2025-02-11 08:49:37'),(72,'2025-02-15 17:38:13','2','8',1,3,NULL,53,'2025-02-15 18:25:46'),(73,'2025-02-18 09:14:27','25','15',28,1,NULL,NULL,NULL),(74,'2025-02-22 22:39:52','13','27',9,2,NULL,56.8,'2025-02-22 23:29:18'),(75,'2025-02-27 13:25:36','5','22',4,3,NULL,71,'2025-02-27 14:12:45'),(76,'2025-03-02 08:51:19','16','6',2,1,NULL,89,'2025-03-02 09:46:32'),(77,'2025-03-05 18:17:43','29','12',13,2,NULL,51.9,'2025-03-05 19:08:27'),(78,'2025-03-09 11:42:28','10','12',7,3,NULL,80,'2025-03-09 12:36:18'),(79,'2025-03-12 23:19:57','24','3',16,1,NULL,62,'2025-03-13 00:14:43'),(80,'2025-03-16 16:54:32','7','3',4,2,NULL,76.5,'2025-03-16 17:45:19'),(81,'2025-03-21 10:33:17','20','1',1,3,NULL,39.8,'2025-03-21 11:28:36'),(82,'2025-03-25 19:58:42','1','9',12,1,NULL,NULL,NULL),(83,'2025-03-29 12:26:15','23','21',8,2,NULL,62,'2025-03-29 13:19:27'),(84,'2025-04-02 07:45:39','11','18',6,3,NULL,84.9,'2025-04-02 08:37:42'),(85,'2025-04-06 21:08:26','28','27',18,1,NULL,44,'2025-04-06 22:01:38'),(86,'2025-04-09 14:37:52','14','23',10,2,NULL,67.4,'2025-04-09 15:29:18'),(87,'2025-04-14 09:14:38','3','26',7,3,NULL,62,'2025-04-14 10:06:25'),(88,'2025-04-16 16:49:23','18','2',1,1,NULL,51.6,'2025-04-16 17:32:48'),(89,'2025-04-20 11:25:37','21','18',14,2,NULL,62,'2025-04-20 12:18:52'),(90,'2025-04-25 08:36:14','6','10',5,3,NULL,NULL,NULL),(500,'2025-01-01 12:00:00','1','2',3,1,500,30,'2025-01-01 12:05:00'),(501,'2025-05-01 12:00:00','1','1',18,2,NULL,1,'2025-05-01 12:01:00'),(502,'2025-05-01 12:00:00','1','1',18,1,NULL,1,'2025-05-01 12:01:00'),(503,'2025-05-01 12:00:00','1','1',7,3,NULL,1,'2025-05-01 12:01:00'),(504,'2025-05-01 12:00:00','1','1',7,2,NULL,1,'2025-05-01 12:01:00'),(505,'2025-05-01 12:00:00','1','1',7,1,NULL,1,'2025-05-01 12:01:00'),(506,'2025-05-01 12:00:00','1','1',3,3,NULL,1,'2025-05-01 12:01:00'),(507,'2025-05-01 12:00:00','1','1',3,2,NULL,1,'2025-05-01 12:01:00'),(508,'2025-05-01 12:00:00','1','1',3,1,NULL,1,'2025-05-01 12:01:00'),(509,'2025-05-01 12:00:00','1','2',18,2,NULL,1,'2025-05-01 12:01:00'),(510,'2025-05-01 12:00:00','1','2',18,1,NULL,1,'2025-05-01 12:01:00'),(511,'2025-05-01 12:00:00','1','2',7,3,NULL,1,'2025-05-01 12:01:00'),(512,'2025-05-01 12:00:00','1','2',7,2,NULL,1,'2025-05-01 12:01:00'),(513,'2025-05-01 12:00:00','1','2',7,1,NULL,1,'2025-05-01 12:01:00'),(514,'2025-05-01 12:00:00','1','2',3,3,NULL,1,'2025-05-01 12:01:00'),(515,'2025-05-01 12:00:00','1','2',3,2,NULL,1,'2025-05-01 12:01:00'),(516,'2025-05-01 12:00:00','1','2',3,1,NULL,1,'2025-05-01 12:01:00');
/*!40000 ALTER TABLE `charging_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station`
--

DROP TABLE IF EXISTS `charging_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_station` (
  `station_id` int NOT NULL,
  `street` varchar(50) NOT NULL,
  `suburb` varchar(20) NOT NULL,
  `state` varchar(3) NOT NULL,
  `postcode` varchar(4) NOT NULL,
  `establishment_date` date NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station`
--

LOCK TABLES `charging_station` WRITE;
/*!40000 ALTER TABLE `charging_station` DISABLE KEYS */;
INSERT INTO `charging_station` VALUES (1,'125 Collins Street','Melbourne','VIC','3000','2020-03-15'),(2,'47 George Street','Sydney','NSW','2000','2020-07-22'),(3,'89 Queen Street','Brisbane','QLD','4000','2021-01-10'),(4,'23 Flinders Street','Adelaide','SA','5000','2021-04-05'),(5,'56 Murray Street','Perth','WA','6000','2021-09-18'),(6,'31 Elizabeth Street','Hobart','TAS','7000','2022-02-14'),(7,'12 Northbourne Avenue','Canberra','ACT','2601','2022-06-30'),(8,'85 Mitchell Street','Darwin','NT','0800','2022-11-25'),(9,'104 Sturt Street','Ballarat','VIC','3350','2023-03-08'),(10,'27 Brunswick Street','Fitzroy','VIC','3065','2023-07-19'),(11,'63 Macquarie Street','Parramatta','NSW','2150','2020-05-11'),(12,'39 Oxley Drive','Robina','QLD','4226','2020-10-04'),(13,'76 Jetty Road','Glenelg','SA','5045','2021-02-28'),(14,'51 Hay Street','Subiaco','WA','6008','2021-08-17'),(15,'18 Salamanca Place','Battery Point','TAS','7004','2022-01-09'),(16,'94 Lonsdale Street','Braddon','ACT','2612','2022-05-21'),(17,'42 Cavenagh Street','Darwin City','NT','0800','2022-09-30'),(18,'67 Smith Street','Warrnambool','VIC','3280','2023-02-12'),(19,'83 Campbell Parade','Bondi Beach','NSW','2026','2023-06-05'),(20,'29 James Street','Fortitude Valley','QLD','4006','2023-11-18'),(21,'112 Rundle Street','Adelaide','SA','5000','2024-01-07'),(22,'45 Beaufort Street','Mount Lawley','WA','6050','2020-11-13'),(23,'77 Liverpool Street','Hobart','TAS','7000','2021-05-25'),(24,'33 Bunda Street','Canberra','ACT','2601','2021-10-08'),(25,'61 Knuckey Street','Darwin','NT','0800','2022-03-19'),(26,'95 High Street','Bendigo','VIC','3550','2022-08-02'),(27,'58 Darling Street','Balmain','NSW','2041','2023-01-14'),(28,'19 Hastings Street','Noosa Heads','QLD','4567','2023-04-27'),(29,'71 The Parade','Norwood','SA','5067','2023-09-09'),(30,'84 Oxford Street','Leederville','WA','6007','2024-02-22');
/*!40000 ALTER TABLE `charging_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `abn` char(11) NOT NULL,
  `company_name` varchar(250) NOT NULL,
  `ceo_name` varchar(100) NOT NULL,
  `parent_abn` char(11) DEFAULT NULL,
  PRIMARY KEY (`abn`),
  KEY `fk_manufacturer_company_manufacturer_company1_idx` (`parent_abn`),
  CONSTRAINT `fk_manufacturer_company_manufacturer_company1` FOREIGN KEY (`parent_abn`) REFERENCES `company` (`abn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('1','Tesla','Elon Musk',NULL),('10','Xpeng','He Xiaopeng',NULL),('11','Tesla Energy','Rebecca Tinucci','1'),('12','Rivian Commercial','Jiten Behl','2'),('13','Lucid Air','Eric Bach','3'),('14','NIO Power','Shen Fei','4'),('15','BYD Electronics','Chen Ke','5'),('2','Rivian','RJ Scaringe',NULL),('3','Lucid Motors','Peter Rawlinson',NULL),('4','NIO','William Li',NULL),('5','BYD','Wang Chuanfu',NULL),('6','Polestar','Thomas Ingenlath',NULL),('7','Fisker','Henrik Fisker',NULL),('700','grandbaby electric','big_c','11'),('8','Canoo','Tony Aquila',NULL),('9','Nikola Corporation','Michael Lohscheller',NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_owns_station`
--

DROP TABLE IF EXISTS `company_owns_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_owns_station` (
  `abn` char(11) NOT NULL,
  `station_id` int NOT NULL,
  PRIMARY KEY (`abn`,`station_id`),
  KEY `fk_manufacturer_company_has_charging_station_charging_stati_idx` (`station_id`),
  KEY `fk_manufacturer_company_has_charging_station_manufacturer_c_idx` (`abn`),
  CONSTRAINT `fk_manufacturer_company_has_charging_station_charging_station1` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`station_id`),
  CONSTRAINT `fk_manufacturer_company_has_charging_station_manufacturer_com1` FOREIGN KEY (`abn`) REFERENCES `company` (`abn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_owns_station`
--

LOCK TABLES `company_owns_station` WRITE;
/*!40000 ALTER TABLE `company_owns_station` DISABLE KEYS */;
INSERT INTO `company_owns_station` VALUES ('1',1),('14',2),('2',2),('3',3),('5',3),('4',4),('9',4),('10',5),('5',5),('6',6),('3',7),('7',7),('6',8),('8',8),('12',9),('9',9),('10',10),('11',11),('7',11),('12',12),('8',12),('13',13),('14',14),('1',15),('15',15),('1',16),('2',17),('3',18),('4',19),('5',20),('6',21),('7',22),('8',23),('9',24),('10',25),('11',26),('12',27),('13',28),('14',29),('15',30);
/*!40000 ALTER TABLE `company_owns_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `coupon_id` int NOT NULL,
  `facility_id` int NOT NULL,
  `discount` float NOT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `fk_coupon_facility1_idx` (`facility_id`),
  CONSTRAINT `fk_coupon_facility1` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,17,0.25),(2,5,0.1),(3,29,0.15),(4,12,0.3),(5,8,0.2),(6,24,0.05),(7,3,0.4),(8,19,0.35),(9,11,0.15),(10,26,0.25),(11,7,0.45),(12,22,0.1),(13,14,0.3),(14,1,0.2),(15,27,0.4),(16,10,0.05),(17,18,0.25),(18,6,0.35),(19,23,0.15),(20,4,0.5),(21,16,0.2),(22,30,0.1),(23,13,0.45),(24,2,0.3),(25,25,0.15),(26,9,0.25),(27,20,0.05),(28,15,0.4),(29,28,0.2),(30,21,0.35),(500,1,0.15);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electric_vehicle`
--

DROP TABLE IF EXISTS `electric_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electric_vehicle` (
  `vin` varchar(25) NOT NULL,
  `abn` char(11) NOT NULL,
  `license_num` varchar(10) NOT NULL,
  `model_name` varchar(250) NOT NULL,
  `model_year` year NOT NULL,
  `battery_capacity` int unsigned NOT NULL,
  PRIMARY KEY (`vin`),
  KEY `fk_electric_vehicle_manufacturer_company1_idx` (`abn`),
  KEY `fk_electric_vehicle_person1_idx` (`license_num`),
  CONSTRAINT `fk_electric_vehicle_manufacturer_company1` FOREIGN KEY (`abn`) REFERENCES `company` (`abn`),
  CONSTRAINT `fk_electric_vehicle_person1` FOREIGN KEY (`license_num`) REFERENCES `person` (`license_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electric_vehicle`
--

LOCK TABLES `electric_vehicle` WRITE;
/*!40000 ALTER TABLE `electric_vehicle` DISABLE KEYS */;
INSERT INTO `electric_vehicle` VALUES ('1','3','17','Tesla Model 3',2023,82),('10','11','30','BMW i4',2022,83),('11','2','8','Mercedes EQS',2022,108),('12','10','19','Tesla Model Y',2023,78),('13','13','2','Porsche Taycan',2021,93),('14','4','25','Rivian R1T',2022,135),('15','14','16','Lucid Air',2023,118),('16','8','7','Jaguar I-PACE',2020,90),('17','3','23','Volvo XC40 Recharge',2021,78),('18','5','13','Genesis GV60',2023,77),('19','11','29','Mini Cooper SE',2022,32),('2','8','5','Nissan Leaf',2020,62),('20','6','1','Hyundai Kona Electric',2021,64),('21','9','18','Kia Niro EV',2020,64),('22','12','10','Subaru Solterra',2023,72),('23','4','21','Toyota bZ4X',2023,71),('24','7','3','Lexus RZ 450e',2024,71),('25','2','15','Tesla Model X',2022,100),('26','10','24','Tesla Model S',2021,100),('27','13','6','BYD Atto 3',2023,60),('28','1','27','MG ZS EV',2022,51),('29','15','12','Cadillac Lyriq',2024,102),('3','12','26','Chevrolet Bolt',2021,65),('30','14','20','GMC Hummer EV',2025,140),('4','7','9','Ford Mustang Mach-E',2022,140),('400','3','1','Tesla Model 3_NEW_LEAKED_e',2026,82),('5','1','22','Hyundai Ioniq 5',2023,77),('6','15','4','Kia EV6',2022,77),('7','6','14','Volkswagen ID.4',2021,82),('700','700','1','baby\'s first',2025,101),('8','9','28','Polestar 2',2022,78),('9','5','11','Audi e-tron',2020,95);
/*!40000 ALTER TABLE `electric_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `facility_id` int NOT NULL,
  `station_id` int NOT NULL,
  `facility_name` varchar(50) NOT NULL,
  PRIMARY KEY (`facility_id`),
  KEY `fk_facility_charging_station1_idx` (`station_id`),
  CONSTRAINT `fk_facility_charging_station1` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,1,'Electron Cafe'),(2,2,'7-Eleven'),(3,3,'Voltage Bistro'),(4,4,'Quick Stop'),(5,5,'Circuit Coffee'),(6,6,'Wawa'),(7,7,'Charge & Chew'),(8,8,'Ampere Market'),(9,9,'PowerUp Deli'),(10,10,'Circle K'),(11,11,'Spark Snacks'),(12,12,'Fuel & Food'),(13,13,'Watts Brewing'),(14,14,'Current Convenience'),(15,15,'Joule Juice Bar'),(16,16,'Plug & Pantry'),(17,17,'GridStop Grocery'),(18,18,'Battery Bakery'),(19,19,'Volt Mart'),(20,20,'Energize Eatery'),(21,1,'Ohms Organic Market'),(22,2,'Recharge Restaurant'),(23,3,'Speedy Snacks'),(24,4,'EVolution Diner'),(25,5,'FastLane Foods'),(26,6,'Charged Up Cafe'),(27,7,'Power Pit Stop'),(28,8,'Amp & Appetite'),(29,9,'Electra Express'),(30,10,'Terminal Treats');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outlet`
--

DROP TABLE IF EXISTS `outlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outlet` (
  `outlet_number` int NOT NULL,
  `station_id` int NOT NULL,
  `charging_rate` int NOT NULL,
  `price_kwh` float NOT NULL,
  PRIMARY KEY (`outlet_number`,`station_id`),
  KEY `fk_charging_outlet_charging_station1_idx` (`station_id`),
  CONSTRAINT `fk_charging_outlet_charging_station1` FOREIGN KEY (`station_id`) REFERENCES `charging_station` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outlet`
--

LOCK TABLES `outlet` WRITE;
/*!40000 ALTER TABLE `outlet` DISABLE KEYS */;
INSERT INTO `outlet` VALUES (1,1,50,0.31),(1,2,100,0.35),(1,3,150,0.29),(1,4,200,0.33),(1,5,250,0.36),(1,6,300,0.3),(1,7,50,0.34),(1,8,100,0.32),(1,9,150,0.37),(1,10,200,0.31),(1,11,250,0.35),(1,12,300,0.29),(1,13,50,0.33),(1,14,100,0.36),(1,15,150,0.3),(1,16,200,0.34),(1,17,250,0.32),(1,18,300,0.37),(1,19,50,0.31),(1,20,100,0.35),(1,21,150,0.29),(1,22,200,0.33),(1,23,250,0.36),(1,24,300,0.3),(1,25,50,0.34),(1,26,100,0.32),(1,27,150,0.37),(1,28,200,0.31),(1,29,250,0.35),(1,30,300,0.29),(2,1,150,0.33),(2,2,200,0.36),(2,3,250,0.3),(2,4,300,0.34),(2,5,50,0.32),(2,6,100,0.37),(2,7,150,0.31),(2,8,200,0.35),(2,9,250,0.29),(2,10,300,0.33),(2,11,50,0.36),(2,12,100,0.3),(2,13,150,0.34),(2,14,200,0.32),(2,15,250,0.37),(2,16,300,0.31),(2,17,50,0.35),(2,18,100,0.29),(2,19,150,0.33),(2,20,200,0.36),(3,1,250,0.3),(3,2,300,0.34),(3,3,50,0.32),(3,4,100,0.37),(3,5,150,0.31),(3,6,200,0.35),(3,7,250,0.29),(3,8,300,0.33),(3,9,50,0.36),(3,10,100,0.3);
/*!40000 ALTER TABLE `outlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `license_num` varchar(10) NOT NULL,
  `person_name` varchar(100) NOT NULL,
  PRIMARY KEY (`license_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('1','Thomas Edison'),('10','Benjamin Franklin'),('11','George Washington Carver'),('12','Grace Hopper'),('13','Wright Brothers'),('14','Steve Jobs'),('15','Hedy Lamarr'),('16','Alan Turing'),('17','Archimedes'),('18','Tim Berners-Lee'),('19','Rosalind Franklin'),('2','Nikola Tesla'),('20','Galileo Galilei'),('21','Charles Babbage'),('22','Enrico Fermi'),('23','Albert Einstein'),('24','Margaret Hamilton'),('25','Louis Pasteur'),('26','Michael Faraday'),('27','Stephanie Kwolek'),('28','Eli Whitney'),('29','Katherine Johnson'),('3','Alexander Graham Bell'),('30','Buckminster Fuller'),('4','Marie Curie'),('5','Leonardo da Vinci'),('6','Johannes Gutenberg'),('7','James Watt'),('8','Ada Lovelace'),('9','Guglielmo Marconi');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-10  0:06:59
