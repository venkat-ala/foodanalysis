CREATE DATABASE  IF NOT EXISTS `food_analysis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `food_analysis`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: food_analysis
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `food_items`
--

DROP TABLE IF EXISTS `food_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fats` varchar(45) DEFAULT NULL,
  `proteins` varchar(45) DEFAULT NULL,
  `carbohydrates` varchar(45) DEFAULT NULL,
  `vitamins` varchar(45) DEFAULT NULL,
  `sugar` varchar(45) DEFAULT NULL,
  `calorie` varchar(45) DEFAULT NULL,
  `benefits` varchar(250) DEFAULT NULL,
  `disadvantages` varchar(150) DEFAULT NULL,
  `bmi_start` int(11) DEFAULT NULL,
  `bmi_end` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name_UNIQUE` (`name`),
  KEY `User_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_items`
--

LOCK TABLES `food_items` WRITE;
/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
INSERT INTO `food_items` VALUES (1,'Apple','0.2g','0.3g','14g','1%','10g','52','Apples are extremely rich in important antioxidants, flavanoids, and dietary fiber. ','High in Sugar, so Sugar patients avoid Apples',10,20),(2,'Banana','0.3g','1.1g','23g','10%','12g','89','High in Fiber, viitamins and calcium and carbohydrates, considered as rich source of Energy','Bananas contain sugar  not recommended for diabetics or the sugar-addicted',1,10),(3,'orance','0.3g','1.1g','23g','10%','12g','89','High in Fiber, viitamins and calcium and carbohydrates, considered as rich source of Energy','Bananas contain sugar  not recommended for diabetics or the sugar-addicted',20,30);
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seed_contact_us_infos`
--

DROP TABLE IF EXISTS `seed_contact_us_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seed_contact_us_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seed_contact_us_infos`
--

LOCK TABLES `seed_contact_us_infos` WRITE;
/*!40000 ALTER TABLE `seed_contact_us_infos` DISABLE KEYS */;
INSERT INTO `seed_contact_us_infos` VALUES (1,'Abhishek Kesanapalli','name@yopmail.com','203-685-7473');
/*!40000 ALTER TABLE `seed_contact_us_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `age` varchar(55) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `weight` smallint(6) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `alergies` varchar(400) DEFAULT NULL,
  `health_issues` varchar(400) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  `fav_friend` varchar(255) DEFAULT NULL,
  `fav_movie` varchar(255) DEFAULT NULL,
  `bmi` float(100,3) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `dba_password` varchar(200) DEFAULT NULL,
  `password` varchar(205) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'un del','b@yopmail.com','Between 18 to 30','MALE',NULL,NULL,'','','1111111111','n','2017-03-07 16:44:26','2017-03-15 12:10:49','aa','aa',NULL,'user',NULL,'aaaaa'),(12,'bb','bb@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-15 11:29:34','aa','aa',NULL,'user',NULL,'aaaaa'),(14,'bb','bbc@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-14 19:02:00','','',NULL,'user',NULL,'aaaaa'),(15,'bb','bbcc@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-14 19:02:18','','',NULL,'user',NULL,'aaaaa'),(16,'a','a@yopmail1.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-14 19:02:32','','',NULL,'user',NULL,'aaaaa'),(17,'b','bb1@g.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-14 19:08:21','','',NULL,'user',NULL,'aaaaa'),(18,'c','c@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-14 17:26:42','','',NULL,'user',NULL,'aaaaa'),(19,'c','ca@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(20,'a','aa@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(21,'a','aaa@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(24,'a','aaaaa@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(25,'a','aa1@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(26,'a','aa21@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(27,'a','aac@g.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(28,'abc','aaccc@g.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(29,'a','1@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(30,'v','v@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n','2017-03-07 17:06:21','2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(34,'dd','d@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'a','a','','n','2017-03-08 19:06:50','2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(36,'a','cac@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(38,'a','cacd@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n',NULL,'2017-03-16 09:33:51',NULL,NULL,NULL,'user',NULL,'aaaaa'),(39,'ac','axc@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'','','','n','2017-03-09 17:43:56','2017-03-09 17:44:05',NULL,NULL,NULL,'user',NULL,'aaaaa'),(40,'t1update1','t1@yopmail.com','Between 18 to 30','MALE',50,163,'3',NULL,'3333333333','n','2017-03-16 11:36:48','2017-03-16 09:36:43','aaa','aaa',18.820,'user','aaaaa','aaaaa'),(41,'adc','t2@yopmail.com','Between 18 to 30','MALE',NULL,NULL,'',NULL,'','n','2017-03-16 12:01:47','2017-03-14 15:54:59','a','a',NULL,'admin','aaaaa','aaaaa'),(42,'ut1','ut1@yopmail.com','Between 18 to 30','MALE',NULL,NULL,'',NULL,'','n',NULL,'2017-03-16 09:33:51','a','a',NULL,'user',NULL,'aaaaa'),(43,'ut2','ut2@yopmail.com','Between 18 to 30','MALE',NULL,NULL,'',NULL,'','n',NULL,'2017-03-16 09:33:51','a','a',NULL,'admin','aaaaa','aaaaa'),(44,'test','test@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'',NULL,'','n',NULL,'2017-03-16 09:33:51','a','a',NULL,'user',NULL,'aaaaa'),(45,'xs','cd@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'',NULL,'','n',NULL,'2017-03-16 09:45:24','aa','aa',NULL,'admin','aaaaa','cdaaaa'),(46,'cdcdcdcdcdcd','cd1@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'',NULL,'','n',NULL,'2017-03-16 09:38:10','aa','aa',NULL,'admin','aaaaa','aaaaa'),(47,'cd','acccc@yopmail.com','Between 18 to 30','NONE',NULL,NULL,'',NULL,'','n',NULL,'2017-03-16 09:33:51','aa','aa',NULL,'admin','aaaaa','aaaaa');
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

-- Dump completed on 2017-03-16 12:03:29
