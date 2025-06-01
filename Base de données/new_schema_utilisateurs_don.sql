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
-- Table structure for table `utilisateurs_don`
--

DROP TABLE IF EXISTS `utilisateurs_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs_don` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `beneficiaire` varchar(255) DEFAULT NULL,
  `montant` decimal(10,2) NOT NULL,
  `date_don` date NOT NULL,
  `sens_don` varchar(10) NOT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `donateur_id` bigint DEFAULT NULL,
  `enregistre_par_id` bigint NOT NULL,
  `tontine_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateurs_don_donateur_id_c5c03e6c_fk_tontines_` (`donateur_id`),
  KEY `utilisateurs_don_enregistre_par_id_a16cad52_fk_utilisate` (`enregistre_par_id`),
  KEY `utilisateurs_don_tontine_id_768a03f1_fk_tontines_tontine_id` (`tontine_id`),
  CONSTRAINT `utilisateurs_don_donateur_id_c5c03e6c_fk_tontines_` FOREIGN KEY (`donateur_id`) REFERENCES `tontines_membretontine` (`id`),
  CONSTRAINT `utilisateurs_don_enregistre_par_id_a16cad52_fk_utilisate` FOREIGN KEY (`enregistre_par_id`) REFERENCES `utilisateurs_customuser` (`id`),
  CONSTRAINT `utilisateurs_don_tontine_id_768a03f1_fk_tontines_tontine_id` FOREIGN KEY (`tontine_id`) REFERENCES `tontines_tontine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs_don`
--

LOCK TABLES `utilisateurs_don` WRITE;
/*!40000 ALTER TABLE `utilisateurs_don` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateurs_don` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01  9:55:52
