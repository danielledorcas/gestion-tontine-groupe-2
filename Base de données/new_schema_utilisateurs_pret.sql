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
-- Table structure for table `utilisateurs_pret`
--

DROP TABLE IF EXISTS `utilisateurs_pret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs_pret` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `montant` decimal(10,2) NOT NULL,
  `taux_interet` decimal(5,2) NOT NULL,
  `date_demande` date NOT NULL,
  `date_approbation` date DEFAULT NULL,
  `date_echeance` date NOT NULL,
  `statut` varchar(10) NOT NULL,
  `approuve_par_id` bigint NOT NULL,
  `tontine_id` bigint NOT NULL,
  `membre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateurs_pret_approuve_par_id_2d1112b6_fk_utilisate` (`approuve_par_id`),
  KEY `utilisateurs_pret_tontine_id_e0e968bf_fk_tontines_tontine_id` (`tontine_id`),
  KEY `utilisateurs_pret_membre_id_802f7bfd_fk_membres_membre_id` (`membre_id`),
  CONSTRAINT `utilisateurs_pret_approuve_par_id_2d1112b6_fk_utilisate` FOREIGN KEY (`approuve_par_id`) REFERENCES `utilisateurs_customuser` (`id`),
  CONSTRAINT `utilisateurs_pret_membre_id_802f7bfd_fk_membres_membre_id` FOREIGN KEY (`membre_id`) REFERENCES `membres_membre` (`id`),
  CONSTRAINT `utilisateurs_pret_tontine_id_e0e968bf_fk_tontines_tontine_id` FOREIGN KEY (`tontine_id`) REFERENCES `tontines_tontine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs_pret`
--

LOCK TABLES `utilisateurs_pret` WRITE;
/*!40000 ALTER TABLE `utilisateurs_pret` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateurs_pret` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01  9:55:53
