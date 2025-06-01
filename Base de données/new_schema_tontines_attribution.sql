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
-- Table structure for table `tontines_attribution`
--

DROP TABLE IF EXISTS `tontines_attribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tontines_attribution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ordre` int unsigned NOT NULL,
  `date_prevue` datetime(6) NOT NULL,
  `date_reelle` datetime(6) DEFAULT NULL,
  `montant` decimal(10,2) NOT NULL,
  `est_effectuee` tinyint(1) NOT NULL,
  `membre_id` bigint NOT NULL,
  `cycle_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tontines_attribution_cycle_id_ordre_6dace5a8_uniq` (`cycle_id`,`ordre`),
  KEY `tontines_attribution_membre_id_4f70d939_fk_membres_membre_id` (`membre_id`),
  CONSTRAINT `tontines_attribution_cycle_id_13fa746b_fk_tontines_cycle_id` FOREIGN KEY (`cycle_id`) REFERENCES `tontines_cycle` (`id`),
  CONSTRAINT `tontines_attribution_membre_id_4f70d939_fk_membres_membre_id` FOREIGN KEY (`membre_id`) REFERENCES `membres_membre` (`id`),
  CONSTRAINT `tontines_attribution_chk_1` CHECK ((`ordre` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tontines_attribution`
--

LOCK TABLES `tontines_attribution` WRITE;
/*!40000 ALTER TABLE `tontines_attribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `tontines_attribution` ENABLE KEYS */;
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
