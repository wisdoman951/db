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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `R_ID` int DEFAULT NULL,
  `Comment_info` text,
  `Comment_time` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `User_ID` (`User_ID`),
  KEY `R_ID` (`R_ID`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`R_ID`) REFERENCES `restaurant` (`Restaurant_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'這家義大利麵餐館真是太棒了！他們的麵食口感完美，用料新鮮，味道濃郁。我點了他們的招牌義大利海鮮麵，海鮮的鮮甜與麵條的彈性結合得恰到好處，服務也非常好，餐廳的環境也很舒適，氛圍很浪漫，適合和家人或者情侶一起享受美食。','2023-06-14 04:42:00'),(2,2,1,'剛剛在這家義大利麵餐館度過了一頓美好的晚餐，真是讓我驚艷不已！他們的麵食真的是頂級水準，每一口都讓我感受到獨特的口感和豐富的風味。我這家餐廳絕對是一個值得再次光顧的好地方！','2023-06-14 04:42:00'),(3,3,1,'我最近去了這家義大利麵餐館，但對於他們的表現並不滿意。雖然環境還算舒適，但餐點的品質並沒有達到我期待的水準。我點了他們的招牌義大利番茄麵，但是麵條太軟了，而且醬汁的味道也相當平淡。我感到有點失望。服務方面也有些問題，服務員的態度冷淡，沒有給我足夠的關注。我覺得這個餐廳需要改進他們的服務態度！！','2023-06-14 04:42:00'),(4,4,1,'Comment sth Larry','2023-06-14 04:56:04'),(5,4,1,'say awtoihaqwiot','2023-06-14 04:57:53'),(6,4,1,'qdqwd','2023-06-14 04:58:38'),(7,4,1,'qweqwe','2023-06-14 04:59:40'),(8,4,1,'qwe qwe ','2023-06-14 05:00:13'),(9,4,1,'qweqwe','2023-06-14 05:01:40'),(10,4,1,'demo update','2023-06-14 15:03:13'),(11,4,1,'0604 demo for helen','2023-06-14 18:05:02'),(12,4,1,'ytyt','2023-06-14 19:58:55'),(13,4,1,'ydydydydydy','2023-06-14 20:31:30'),(14,4,1,'tyty','2023-06-14 20:40:57'),(15,4,NULL,'ＮＩＨＡＯ','2023-06-15 17:19:01'),(16,4,NULL,'ｈｉｈｉ','2023-06-15 17:22:48'),(17,4,NULL,'hihii','2023-06-15 17:26:55'),(18,4,NULL,'hii','2023-06-15 17:27:24');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-19 13:04:37
