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
-- Table structure for table `operations_remboursement`
--

DROP TABLE IF EXISTS `operations_remboursement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations_remboursement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `montant` decimal(10,2) NOT NULL,
  `date_paiement` date NOT NULL,
  `commentaire` longtext NOT NULL,
  `enregistre_par_id` bigint NOT NULL,
  `pret_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_rembourse_enregistre_par_id_fc49f10f_fk_utilisate` (`enregistre_par_id`),
  KEY `operations_remboursement_pret_id_fff4f162_fk_operations_pret_id` (`pret_id`),
  CONSTRAINT `operations_rembourse_enregistre_par_id_fc49f10f_fk_utilisate` FOREIGN KEY (`enregistre_par_id`) REFERENCES `utilisateurs_customuser` (`id`),
  CONSTRAINT `operations_remboursement_pret_id_fff4f162_fk_operations_pret_id` FOREIGN KEY (`pret_id`) REFERENCES `operations_pret` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations_remboursement`
--

LOCK TABLES `operations_remboursement` WRITE;
/*!40000 ALTER TABLE `operations_remboursement` DISABLE KEYS */;
INSERT INTO `operations_remboursement` VALUES (3,20000.00,'2025-05-28','RAS',1,3);
/*!40000 ALTER TABLE `operations_remboursement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01  9:55:46
