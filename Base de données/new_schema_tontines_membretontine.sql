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
-- Table structure for table `tontines_membretontine`
--

DROP TABLE IF EXISTS `tontines_membretontine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tontines_membretontine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_adhesion` date DEFAULT NULL,
  `est_actif` tinyint(1) NOT NULL,
  `membre_id` bigint NOT NULL,
  `tontine_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tontines_membretontine_membre_id_a0b1dca2_fk_membres_membre_id` (`membre_id`),
  KEY `tontines_membretonti_tontine_id_c79e654a_fk_tontines_` (`tontine_id`),
  CONSTRAINT `tontines_membretonti_tontine_id_c79e654a_fk_tontines_` FOREIGN KEY (`tontine_id`) REFERENCES `tontines_tontine` (`id`),
  CONSTRAINT `tontines_membretontine_membre_id_a0b1dca2_fk_membres_membre_id` FOREIGN KEY (`membre_id`) REFERENCES `membres_membre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tontines_membretontine`
--

LOCK TABLES `tontines_membretontine` WRITE;
/*!40000 ALTER TABLE `tontines_membretontine` DISABLE KEYS */;
INSERT INTO `tontines_membretontine` VALUES (1,NULL,1,27,3),(2,NULL,1,28,3),(3,NULL,1,29,3),(4,NULL,1,30,3),(5,NULL,1,31,3),(6,NULL,1,32,3),(7,NULL,1,33,3),(8,NULL,1,34,3),(9,NULL,1,35,3),(10,NULL,1,36,3),(11,NULL,1,37,3),(12,NULL,1,38,3),(13,NULL,1,39,3),(14,NULL,1,40,3),(15,NULL,1,41,3),(16,NULL,1,42,3),(17,NULL,1,43,3),(18,NULL,1,44,3),(19,NULL,1,45,3),(20,NULL,1,46,3),(21,NULL,1,47,3),(22,NULL,1,48,3);
/*!40000 ALTER TABLE `tontines_membretontine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01  9:55:51
