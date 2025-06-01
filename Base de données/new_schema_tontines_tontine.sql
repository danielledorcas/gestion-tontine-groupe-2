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
-- Table structure for table `tontines_tontine`
--

DROP TABLE IF EXISTS `tontines_tontine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tontines_tontine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` longtext,
  `montant_cotisation` decimal(10,2) NOT NULL,
  `frequence_cotisation` varchar(50) NOT NULL,
  `jour_cotisation` varchar(20) DEFAULT NULL,
  `est_active` tinyint(1) NOT NULL,
  `tresorier_id` bigint DEFAULT NULL,
  `date_creation` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tontines_tontine_tresorier_id_e5b22538_fk_utilisate` (`tresorier_id`),
  CONSTRAINT `tontines_tontine_tresorier_id_e5b22538_fk_utilisate` FOREIGN KEY (`tresorier_id`) REFERENCES `utilisateurs_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tontines_tontine`
--

LOCK TABLES `tontines_tontine` WRITE;
/*!40000 ALTER TABLE `tontines_tontine` DISABLE KEYS */;
INSERT INTO `tontines_tontine` VALUES (3,'presence','on est la',1000.00,'hebdomadaire','samedi',1,1,'2025-05-22 00:49:06.353029'),(4,'tontine de 2000','On fait avec nos moyens',2000.00,'mensuelle','Lundi',1,1,'2025-05-22 11:55:04.806424'),(5,'Tontine de 10000','préparons la rentrée',10000.00,'hebdomadaire','mercredi',1,1,'2025-05-23 07:19:27.418523');
/*!40000 ALTER TABLE `tontines_tontine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01  9:55:47
