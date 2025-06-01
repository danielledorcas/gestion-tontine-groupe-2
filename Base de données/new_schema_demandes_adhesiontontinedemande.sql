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
-- Table structure for table `demandes_adhesiontontinedemande`
--

DROP TABLE IF EXISTS `demandes_adhesiontontinedemande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demandes_adhesiontontinedemande` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_demande` datetime(6) NOT NULL,
  `approuve` tinyint(1) NOT NULL,
  `traite` tinyint(1) NOT NULL,
  `notification_envoyee` tinyint(1) NOT NULL,
  `membre_id` bigint NOT NULL,
  `tontine_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `demandes_adhesionton_membre_id_860b483c_fk_utilisate` (`membre_id`),
  KEY `demandes_adhesionton_tontine_id_495b0ffd_fk_tontines_` (`tontine_id`),
  CONSTRAINT `demandes_adhesionton_membre_id_860b483c_fk_utilisate` FOREIGN KEY (`membre_id`) REFERENCES `utilisateurs_customuser` (`id`),
  CONSTRAINT `demandes_adhesionton_tontine_id_495b0ffd_fk_tontines_` FOREIGN KEY (`tontine_id`) REFERENCES `tontines_tontine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_adhesiontontinedemande`
--

LOCK TABLES `demandes_adhesiontontinedemande` WRITE;
/*!40000 ALTER TABLE `demandes_adhesiontontinedemande` DISABLE KEYS */;
INSERT INTO `demandes_adhesiontontinedemande` VALUES (1,'2025-05-28 11:23:43.037382',1,0,0,32,4);
/*!40000 ALTER TABLE `demandes_adhesiontontinedemande` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01  9:55:42
