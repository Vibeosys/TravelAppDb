-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 192.168.1.6    Database: TravelDB
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `AdminId` int(11) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(45) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`AdminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Admin123','Admin123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `AnswerId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(45) NOT NULL,
  `DestId` int(11) NOT NULL,
  `OptionId` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`AnswerId`,`UserId`,`DestId`,`OptionId`),
  KEY `FkAnswerUserId_idx` (`UserId`),
  KEY `FkAnswerDestinationId_idx` (`DestId`),
  KEY `FkAnswerOptionId_idx` (`OptionId`),
  CONSTRAINT `FkAnswerUserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkAnswerDestId` FOREIGN KEY (`DestId`) REFERENCES `destination` (`DestId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkAnswerOptionId` FOREIGN KEY (`OptionId`) REFERENCES `options` (`OptionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_and_like`
--

DROP TABLE IF EXISTS `comment_and_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_and_like` (
  `UserId` varchar(45) NOT NULL,
  `DestId` int(11) NOT NULL,
  `LikeCount` int(11) NOT NULL,
  `CommentText` varchar(100) DEFAULT NULL,
  `LikeUpdatedDate` datetime NOT NULL,
  `CommentUpdatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`,`DestId`),
  KEY `FnLikeDestId_idx` (`DestId`),
  KEY `DestId` (`DestId`),
  CONSTRAINT `FkLikeUserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FnLikeDestId` FOREIGN KEY (`DestId`) REFERENCES `destination` (`DestId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_and_like`
--

LOCK TABLES `comment_and_like` WRITE;
/*!40000 ALTER TABLE `comment_and_like` DISABLE KEYS */;
INSERT INTO `comment_and_like` VALUES ('1',2,2,'verry nice','2015-10-13 09:45:29','2015-10-17 12:46:06'),('1',4,2,'very good place','2015-10-13 09:45:29','2015-10-17 08:45:53'),('1',5,2,'very good place','2015-10-13 09:45:29','2015-10-17 08:45:53'),('2',1,8,'very good place','2015-10-13 10:01:02','2015-10-17 08:45:53'),('2',2,2,'very good place','2015-10-13 09:45:29','2015-10-17 08:45:53'),('4',2,0,'It was good','0000-00-00 00:00:00','2015-10-21 16:23:19'),('4',5,0,'is was not fine','0000-00-00 00:00:00','2015-10-21 16:23:18'),('5',6,2,NULL,'2015-10-21 16:23:19',NULL),('7',1,1,'very bad place','2015-10-17 08:43:34','2015-10-17 08:48:33'),('7',3,4,'No comment','2015-10-17 10:36:52','2015-10-17 08:49:40');
/*!40000 ALTER TABLE `comment_and_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination` (
  `DestId` int(11) NOT NULL AUTO_INCREMENT,
  `DestName` varchar(50) NOT NULL,
  `Lat` double NOT NULL,
  `Long` double NOT NULL,
  `Active` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`DestId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (1,'Pune',18.52043,73.856744,1,'2015-10-09 11:30:00','2015-10-09 11:30:00'),(2,'Mumbai',19.075984,72.877656,1,'2015-10-09 11:30:10','2015-10-09 11:30:10'),(3,'Delhi',28.613939,77.209021,1,'2015-10-09 11:30:20','2015-10-09 11:30:20'),(4,'Chennai',13.08268,80.27,1,'2015-10-09 11:30:30','2015-10-09 11:30:30'),(5,'Baglore',12.971599,77.594563,1,'2015-10-09 11:30:40','2015-10-09 11:30:40'),(6,'Shimla',31.104814,77.173403,1,'2015-10-09 11:30:42','2015-10-09 11:30:42'),(7,'Ahmednagar',19.095208,74.749592,1,'2015-10-09 11:30:55','2015-10-09 11:30:55'),(8,'Aurangabad',19.876165,75.343314,1,'2015-10-09 11:40:40','2015-10-09 11:40:40'),(9,'Hyderabad',17.385044,78.486671,1,'2015-10-09 11:40:43','2015-10-09 11:40:43'),(10,'Manali',32.239632,77.188715,1,'2015-10-09 12:30:40','2015-10-09 12:30:40');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `ImageId` varchar(45) NOT NULL,
  `ImagePath` varchar(100) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UserId` varchar(45) NOT NULL,
  `DestId` int(11) NOT NULL,
  `Visibility` tinyint(1) NOT NULL,
  PRIMARY KEY (`ImageId`),
  KEY `FkImageDestId_idx` (`DestId`),
  KEY `FkImageUserId_idx` (`UserId`),
  CONSTRAINT `FkImageDestId` FOREIGN KEY (`DestId`) REFERENCES `destination` (`DestId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FkImageUserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('1','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/Beach-Img.jpg','2015-10-19 14:40:34','1',3,1),('10','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/Europe-Img.jpg','2015-10-19 14:54:34','2',4,1),('2','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/Bridge-Image.jpg','2015-10-19 14:40:55','2',2,1),('3','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/Dubai-Image.jpg','2015-10-19 14:43:34','3',1,1),('4','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/Eiffel-tower.jpg','2015-10-19 14:44:34','4',3,1),('5','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/Europe-Img.jpg','2015-10-19 14:45:34','5',2,1),('6','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/Taj-Img.jpg','2015-10-19 14:46:34','3',3,1),('7','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/UK-Img.jpg','2015-10-19 14:47:34','3',7,1),('8','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/Beach-Img.jpg','2015-10-19 14:48:34','2',1,1),('9','https://s3-ap-southeast-1.amazonaws.com/dev.vibeosys.com/TempDir/Dubai-Image.jpg','2015-10-19 14:49:34','8',9,1);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `OptionId` int(11) NOT NULL AUTO_INCREMENT,
  `OptionText` varchar(45) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  PRIMARY KEY (`OptionId`),
  KEY `FkOptionQuestionId_idx` (`QuestionId`),
  CONSTRAINT `FkOptionQuestionId` FOREIGN KEY (`QuestionId`) REFERENCES `question` (`QuestionId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'YES',1),(2,'NO',1),(3,'BAD',2),(4,'GOOD',2),(5,'GOODEST',2),(6,'bad',3),(7,'Good',3),(8,'VeryGood',3);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `QuestionId` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionText` varchar(100) NOT NULL,
  `Active` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`QuestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'do you like place?',1,'2015-10-10 09:27:17','2015-10-10 09:27:17'),(2,'How is your experience?',1,'2015-10-10 12:34:12','2015-10-10 12:34:11'),(3,'How was the food?',1,'2015-10-10 12:34:54','2015-10-10 12:34:54');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_conf`
--

DROP TABLE IF EXISTS `stat_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_conf` (
  `Key` varchar(45) NOT NULL,
  `Value` varchar(45) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_conf`
--

LOCK TABLES `stat_conf` WRITE;
/*!40000 ALTER TABLE `stat_conf` DISABLE KEYS */;
INSERT INTO `stat_conf` VALUES ('SyncTime','30','2015-10-10 13:26:43');
/*!40000 ALTER TABLE `stat_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync`
--

DROP TABLE IF EXISTS `sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync` (
  `SyncAutoNo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) NOT NULL,
  `JsonSync` mediumtext NOT NULL,
  `TableName` varchar(45) NOT NULL,
  `Opration` varchar(45) NOT NULL,
  `UpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`SyncAutoNo`),
  UNIQUE KEY `SyncAutoNo` (`SyncAutoNo`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync`
--

LOCK TABLES `sync` WRITE;
/*!40000 ALTER TABLE `sync` DISABLE KEYS */;
INSERT INTO `sync` VALUES (89,'1','{\"UserId\":\"4\",\"DestId\":\"5\",\"CommentText\":\"is was not fine\",\"CreatedDate\":\"2015-10-21 16:23:18pm\"}','comment','update','2015-10-21 16:23:19'),(90,'2','{\"UserId\":\"4\",\"DestId\":\"5\",\"CommentText\":\"is was not fine\",\"CreatedDate\":\"2015-10-21 16:23:18pm\"}','comment','update','2015-10-21 16:23:19'),(91,'3','{\"UserId\":\"4\",\"DestId\":\"5\",\"CommentText\":\"is was not fine\",\"CreatedDate\":\"2015-10-21 16:23:18pm\"}','comment','update','2015-10-21 16:23:19'),(93,'6','{\"UserId\":\"4\",\"DestId\":\"5\",\"CommentText\":\"is was not fine\",\"CreatedDate\":\"2015-10-21 16:23:18pm\"}','comment','update','2015-10-21 16:23:19'),(94,'7','{\"UserId\":\"4\",\"DestId\":\"5\",\"CommentText\":\"is was not fine\",\"CreatedDate\":\"2015-10-21 16:23:18pm\"}','comment','update','2015-10-21 16:23:19'),(95,'8','{\"UserId\":\"4\",\"DestId\":\"5\",\"CommentText\":\"is was not fine\",\"CreatedDate\":\"2015-10-21 16:23:18pm\"}','comment','update','2015-10-21 16:23:19'),(96,'9','{\"UserId\":\"4\",\"DestId\":\"5\",\"CommentText\":\"is was not fine\",\"CreatedDate\":\"2015-10-21 16:23:18pm\"}','comment','update','2015-10-21 16:23:19'),(97,'1','{\"UserId\":\"4\",\"DestId\":\"2\",\"CommentText\":\"It was good\",\"CreatedDate\":\"2015-10-21 16:23:19pm\"}','comment','update','2015-10-21 16:23:19'),(98,'2','{\"UserId\":\"4\",\"DestId\":\"2\",\"CommentText\":\"It was good\",\"CreatedDate\":\"2015-10-21 16:23:19pm\"}','comment','update','2015-10-21 16:23:19'),(99,'3','{\"UserId\":\"4\",\"DestId\":\"2\",\"CommentText\":\"It was good\",\"CreatedDate\":\"2015-10-21 16:23:19pm\"}','comment','update','2015-10-21 16:23:19'),(101,'6','{\"UserId\":\"4\",\"DestId\":\"2\",\"CommentText\":\"It was good\",\"CreatedDate\":\"2015-10-21 16:23:19pm\"}','comment','update','2015-10-21 16:23:19'),(102,'7','{\"UserId\":\"4\",\"DestId\":\"2\",\"CommentText\":\"It was good\",\"CreatedDate\":\"2015-10-21 16:23:19pm\"}','comment','update','2015-10-21 16:23:19'),(103,'8','{\"UserId\":\"4\",\"DestId\":\"2\",\"CommentText\":\"It was good\",\"CreatedDate\":\"2015-10-21 16:23:19pm\"}','comment','update','2015-10-21 16:23:19'),(104,'9','{\"UserId\":\"4\",\"DestId\":\"2\",\"CommentText\":\"It was good\",\"CreatedDate\":\"2015-10-21 16:23:19pm\"}','comment','update','2015-10-21 16:23:19');
/*!40000 ALTER TABLE `sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` varchar(45) NOT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `EmailId` varchar(45) DEFAULT NULL,
  `PhotoUrl` varchar(45) DEFAULT NULL,
  `Active` bit(1) DEFAULT b'0',
  `CreatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','Niteen','Nite123','veerniteen@gmail.com','https://encrypted-tbn1.gstatic.com/images?q=t','','2015-10-10 08:12:29'),('10c0a40c-8823-493a-b1cb-7a7a73a22f40',NULL,NULL,NULL,NULL,'\0',NULL),('12',NULL,NULL,NULL,NULL,'\0',NULL),('188d5a67-23e3-41f0-b86e-97e055a62d72',NULL,NULL,NULL,NULL,'\0',NULL),('18a5f959-7ad8-4eb2-baa8-0f86003bf7cf',NULL,NULL,NULL,NULL,'\0',NULL),('2','Mahesh','mahi546','mahesh@gmail.com','','','2015-10-10 11:46:05'),('297133ee-5705-4a3c-b3e2-17d38402aa7d',NULL,NULL,NULL,NULL,'\0',NULL),('3','Dany','dany@facebook.com','1195','','','2015-10-10 11:51:31'),('34f9a3d1-a2b3-40da-9087-4c0e277dfe42',NULL,NULL,NULL,NULL,'\0',NULL),('4','Anand','Andy123','Anand@gmail.com','','','2015-10-14 07:39:08'),('43',NULL,NULL,NULL,NULL,'\0',NULL),('431c1c31c1c31113c11311c31c13c11c1c1c1cc1c1c31',NULL,NULL,NULL,NULL,'\0',NULL),('45',NULL,NULL,NULL,NULL,'\0',NULL),('455',NULL,NULL,NULL,NULL,'\0',NULL),('45770-yy',NULL,NULL,NULL,NULL,'\0',NULL),('5','Bhupendra','Bhupi007','Bhupi@hotmail.com','','','2015-10-14 07:40:16'),('543233',NULL,NULL,NULL,NULL,'\0',NULL),('581d3a4e-edf3-491f-a867-b48e893bb826',NULL,NULL,NULL,NULL,'\0',NULL),('6','Manish','994637','manish@xyz.com','','','2015-10-10 11:44:54'),('62effe63-d29c-4319-9415-748479013785',NULL,NULL,NULL,NULL,'\0',NULL),('6ac56d36-86fa-4305-bef4-65fa89037334',NULL,NULL,NULL,NULL,'\0',NULL),('6uiwq93o',NULL,NULL,NULL,NULL,'\0',NULL),('7','Priya','piyu345','piyu@gmail.com','','','2015-10-10 11:55:34'),('7695ec70-92de-426d-879d-0396f03b2938',NULL,NULL,NULL,NULL,'\0',NULL),('7ba96891-2580-4e8d-9482-05f97833f058',NULL,NULL,NULL,NULL,'\0',NULL),('7c1bd2a4-26ea-4d9d-b31e-41b1fa9f3eb4',NULL,NULL,NULL,NULL,'\0',NULL),('8','Arya','AR34YA','arya@gmail.com','','','2015-10-10 11:55:34'),('81f20d9d-61a6-4555-8325-facd411225e5',NULL,NULL,NULL,NULL,'\0',NULL),('8748534uriwewfds',NULL,NULL,NULL,NULL,'\0',NULL),('9','kamini','Kamu88','kaminis@gmail.com','','','2015-10-10 12:23:45'),('94cab480-ad13-4053-ac47-a8b0e3e65a45',NULL,NULL,NULL,NULL,'\0',NULL),('94cab480-ad13-4053-ac47-a8b0e3e65a54',NULL,NULL,NULL,NULL,'\0',NULL),('94cab480-ad13-4053-ac47-a8b0e3e65a78',NULL,NULL,NULL,NULL,'\0',NULL),('94cab480-ad13-4053-ac47-a8b0e3e65a92',NULL,NULL,NULL,NULL,'\0',NULL),('94cab480-ad13-4053-ac47-a8b0e3iurhtie7',NULL,NULL,NULL,NULL,'\0',NULL),('94cab480-ad13-4053-ac47-a8b0ihefowedf',NULL,NULL,NULL,NULL,'\0',NULL),('98899',NULL,NULL,NULL,NULL,'\0',NULL),('abc',NULL,NULL,NULL,NULL,'\0',NULL),('anand',NULL,NULL,NULL,NULL,'\0',NULL),('c0e0f2ee-0e0c-4359-800f-280577441700',NULL,NULL,NULL,NULL,'\0',NULL),('cda73b03-344b-4b58-a4b8-e0676d6e5504',NULL,NULL,NULL,NULL,'\0',NULL),('fe271e1a-ea28-486c-99b5-7f0e48c42560',NULL,NULL,NULL,NULL,'\0',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-23 16:37:53
