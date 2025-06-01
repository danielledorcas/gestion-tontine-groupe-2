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
-- Table structure for table `utilisateurs_customuser_tontines`
--

DROP TABLE IF EXISTS `utilisateurs_customuser_tontines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs_customuser_tontines` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `tontine_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `utilisateurs_customuser__customuser_id_tontine_id_d30ee7ea_uniq` (`customuser_id`,`tontine_id`),
  KEY `utilisateurs_customu_tontine_id_f4f45f77_fk_tontines_` (`tontine_id`),
  CONSTRAINT `utilisateurs_customu_customuser_id_cfd2544a_fk_utilisate` FOREIGN KEY (`customuser_id`) REFERENCES `utilisateurs_customuser` (`id`),
  CONSTRAINT `utilisateurs_customu_tontine_id_f4f45f77_fk_tontines_` FOREIGN KEY (`tontine_id`) REFERENCES `tontines_tontine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs_customuser_tontines`
--

LOCK TABLES `utilisateurs_customuser_tontines` WRITE;
/*!40000 ALTER TABLE `utilisateurs_customuser_tontines` DISABLE KEYS */;
INSERT INTO `utilisateurs_customuser_tontines` VALUES (26,31,3),(27,32,3),(28,33,3),(29,34,3),(30,35,3),(31,36,3),(32,37,3),(33,38,3),(34,39,3),(35,40,3),(36,41,3),(37,42,3),(38,43,3),(39,44,3),(40,45,3),(41,46,3),(42,47,3),(43,48,3);
/*!40000 ALTER TABLE `utilisateurs_customuser_tontines` ENABLE KEYS */;
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
