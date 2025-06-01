-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: new_schema
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `utilisateurs_customuser`
--

DROP TABLE IF EXISTS `utilisateurs_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `est_admin` tinyint(1) NOT NULL,
  `est_tresorier` tinyint(1) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs_customuser`
--

LOCK TABLES `utilisateurs_customuser` WRITE;
/*!40000 ALTER TABLE `utilisateurs_customuser` DISABLE KEYS */;
INSERT INTO `utilisateurs_customuser` VALUES (1,'pbkdf2_sha256$870000$sfkdZ1KIBC5akJhUHGJ9aE$XDh7wtlPa7QTHgmzCJAFoZY0jqeAgq3WQ4LnRtbUhP8=','2025-05-28 12:40:57.007176',1,'dorcas','','','danielledorcaskoumtoudji@gmail.com',1,1,'2025-05-08 03:14:48.046017',NULL,NULL,0,0,'user'),(31,'akam0000','2025-04-26 04:04:37.000000',0,'patrick','Akam','Patrick','patrickclaudeakam10@gmail.com',0,1,'2025-05-22 10:22:35.000000','677777777','parickclaudeakam10@gmail.com',0,0,'user'),(32,'bengo0000','2025-04-26 04:04:37.000000',0,'bengo','bengono','ibrahim','geovanybengono29@gmail.com',0,1,'2025-05-22 10:24:42.000000','677777777','geovanybengono29@gmail.com',0,0,'user'),(33,'bikelle0000','2025-04-26 04:04:37.000000',0,'fritz','BIkelle','fritz','fbikelle5@gmail.com',0,1,'2025-05-22 10:27:05.000000','677777777','fbikelle5@gmail.com',0,0,'user'),(34,'daze0000','2025-04-26 04:04:37.000000',0,'ingride','daze','ingride','ingridedaze.com@gmail.com',0,1,'2025-05-22 10:30:14.000000','677777777','ingridedaze.com@gmail.com',0,0,'user'),(35,'djomguem0000','2025-04-26 04:04:37.000000',0,'christophe','djomguem','christophe','jchristophe723@gmail.com',0,1,'2025-05-22 10:31:47.000000','677777777','jchristophe723@gmail.com',0,0,'user'),(36,'dogmo0000','2025-04-26 04:04:37.000000',0,'romarth','dogmo','romarth','romarthdogmo@gmail.com',0,1,'2025-05-22 10:33:17.000000','677777777','romarthdogmo@gmail.com',0,0,'user'),(37,'effoua0000','2025-04-26 04:04:37.000000',0,'effoua','effoua','junior','',0,1,'2025-05-22 10:34:59.000000','677777777','effouaj1@gmail.com',0,0,'user'),(38,'efoo0000','2025-04-26 04:04:37.000000',0,'yvan','efo\'o','yvan','efooyvan18@gmail.com',0,1,'2025-05-22 10:37:31.000000',NULL,NULL,0,0,'user'),(39,'emmanuelle0000','2025-04-26 04:04:37.000000',0,'cindy','emmanuelle','cindy','emmaneullecindy@gmail.com',0,1,'2025-05-22 10:39:24.000000',NULL,NULL,0,0,'user'),(40,'maatsing0000','2025-04-26 04:04:37.000000',0,'armanda','maatsing','armanda','armanda@gmail.com',0,1,'2025-05-22 10:41:11.000000',NULL,NULL,0,0,'user'),(41,'mbangah0000','2025-04-26 04:04:37.000000',0,'micheal','mbangah','michael','mbangahndoh@gmail.com',0,1,'2025-05-22 10:42:53.000000','677777777','mbangahndoh@gmail.com',0,0,'user'),(42,'mewali0000','2025-04-26 04:04:37.000000',0,'tatiana','mbangah','tatiana','mewalitatiana3@gmail.com',0,1,'2025-05-22 10:44:51.000000','677777777','mewalitatiana3@gmail.com',0,0,'user'),(43,'missoal0000','2025-04-26 04:04:37.000000',0,'yvano','missoal','yvan','missoalyvan241@gmail.com',0,1,'2025-05-22 10:46:41.000000','677777777','missoalyvan241@gmail.com',0,0,'user'),(44,'ibrahim0000','2025-04-26 04:04:37.000000',0,'ibrahim','mohamadou','ibrahim','ibrahimmessa93@gmail.com',0,1,'2025-05-22 11:08:48.000000','6777777777','ibrahimmessa93@gmail.com',0,0,'user'),(45,'david0000','2025-04-26 04:04:37.000000',0,'david','mahoro','david','davidmahoro2004@gmail.com',0,1,'2025-05-22 11:11:35.000000','6777777777','davidmahoro@gmail.com',0,0,'user'),(46,'madilia0000','2025-04-26 04:04:37.000000',0,'madilia','nguimsi','madilia','madilianguimsi@gmail.coml',0,1,'2025-05-22 11:14:21.000000','6777777777','madilianguimsi@gmail.coml',0,0,'user'),(47,'ismene0000','2025-04-26 04:04:37.000000',0,'ismene','nlemenyeme','ismene','ismeri3134@gmail.com',0,1,'2025-05-22 11:30:34.000000','6777777777','ismeri3134@gmail.com',0,0,'user'),(48,'shekinah0000','2025-04-26 04:04:37.000000',0,'shekinah','soboth','shekinah','shekinahsoboth@gmail.com',0,1,'2025-05-22 11:32:51.000000','6777777777','shekinahsoboth@gmail.com',0,0,'user'),(49,'jethro0000','2025-04-26 04:04:37.000000',0,'JETHRO','tejioni','jethro','Tejionijethro@gmail.com',0,1,'2025-05-22 11:34:19.000000','6777777777','Tejionijethro@gmail.com',0,0,'user'),(50,'isnel0000','2025-04-26 04:04:37.000000',0,'isnel','tendjang','isnel','tendjangisnel@gmail.com',0,1,'2025-05-22 11:35:59.000000','6777777777','Tejionijethro@gmail.com',0,0,'user'),(51,'lamna0000','2025-04-26 04:04:37.000000',0,'lamna','youwe','lamna','syouwe01lamna@gmail.com',0,1,'2025-05-22 11:37:22.000000','6777777777','syouwe01lamna@gmail.com',0,0,'user');
/*!40000 ALTER TABLE `utilisateurs_customuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01  9:55:43
