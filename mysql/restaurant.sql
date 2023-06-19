-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `Restaurant_ID` int NOT NULL,
  `Restaurant_name` varchar(255) DEFAULT NULL,
  `Restaurant_phone` varchar(20) DEFAULT NULL,
  `Restaurant_address` varchar(255) DEFAULT NULL,
  `Restaurant_workhour_start` time DEFAULT NULL,
  `Restaurant_info` text,
  `Restaurant_workhour_end` time DEFAULT NULL,
  `Restaurant_type` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Restaurant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'清心福全政大店','(02) 8661-0017','116台北市文山區指南路二段61號1樓','09:30:00','這是清心價目表','22:30:00','手搖飲料店'),(2,'50嵐政大店','(02) 8661-7571','116台北市文山區指南路二段63號1樓','10:00:00',NULL,'22:00:00','手搖飲料店'),(3,'麥當勞台北指南餐廳','(02) 8661-7768','116台北市文山區指南路二段67號1樓','06:00:00',NULL,'00:00:00','速食館'),(4,'隱Bistro','(02) 2936-6326','116台北市文山區指南路二段72號','11:30:00',NULL,'01:00:00','餐酒館'),(5,'摩斯漢堡政大指南店','(02) 8661-7124','116台北市文山區指南路二段71號','06:00:00',NULL,'21:00:00','速食館'),(6,'Juicy Bun Burger 就是棒 美式餐廳 政大店','(02) 2939-0780','116台北市文山區萬壽路19號1樓','11:30:00',NULL,'22:00:00','西式'),(7,'金鮨日式料理','(02) 8661-6436',' 116台北市文山區指南路二段205號','11:30:00',NULL,'20:00:00','日式'),(8,'鬼匠拉麵-政大店','(02) 2939-8028',' 116台北市文山區指南路二段28號','11:30:00',NULL,'21:00:00','日式');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-19 13:04:35
