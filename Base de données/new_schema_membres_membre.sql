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
-- Table structure for table `membres_membre`
--

DROP TABLE IF EXISTS `membres_membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membres_membre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `profession` varchar(100) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `adresse` longtext NOT NULL,
  `date_adhesion` date NOT NULL,
  `statut` varchar(10) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `utilisateur_id` bigint NOT NULL,
  `photo_cni` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `membres_membre_utilisateur_id_b91e183d_fk_utilisate` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membres_membre`
--

LOCK TABLES `membres_membre` WRITE;
/*!40000 ALTER TABLE `membres_membre` DISABLE KEYS */;
INSERT INTO `membres_membre` VALUES (27,'KOUMTOUDJI','DANIELLE DORCAS','2005-04-14','ETUDIANTE','6777777777','danielledorcaskoumtoudji@gmail.com','POLYTECH','2025-05-22','ACTIF','',1,''),(28,'Akam','patrick','2025-02-11','ETUDIANT','677777777','patrickclaudeakam10@gmail.com','melen','2025-05-22','ACTIF','',31,''),(29,'bengono','ibrahim','2005-04-14','ETUDIANT','677777777','geovanybengono29@gmail.com','melen','2025-05-22','ACTIF','',32,''),(30,'bikelle','fritz','2005-04-14','ETUDIANT','677777777','fbikelle5@gmail.com','melen','2025-05-22','ACTIF','',33,''),(31,'Daze','ingride','2025-05-05','ETUDIANTE','677777777','ingridedaze.com@gmail.com','melen','2025-05-22','ACTIF','',34,''),(32,'djomguem','christophe','2005-04-14','ETUDIANT','677777777','jchristophe723@gmail.com','melen','2025-05-22','ACTIF','',35,''),(33,'dogmo','romarth','2005-04-14','ETUDIANT','677777777','romarthdogmo@gmail.com','melen','2025-05-22','ACTIF','',36,''),(34,'effoua','junior','2005-04-14','ETUDIANT','677777777','effouaj1@gmail.com','melen','2025-05-22','ACTIF','',37,''),(35,'efo\'o','yvan','2005-04-14','ETUDIANT','677777777','efooyvan18@gmail.com','melen','2025-05-22','ACTIF','',38,''),(36,'emmanuelle','cindy','2005-04-14','ETUDIANTE','677777777','emmaneullecindy@gmail.com','melen','2025-05-22','ACTIF','',39,''),(37,'maatsing','armanda','2005-04-14','ETUDIANTE','677777777','armanda@gmail.com','melen','2025-05-22','ACTIF','',40,''),(38,'mbangah','micheal','2005-04-14','ETUDIANT','677777777','mbangahndoh@gmail.com','melen','2025-05-22','ACTIF','',41,''),(39,'mewali','tatiana','2005-04-14','ETUDIANTE','677777777','mewalitatiana3@gmail.com','melen','2025-05-22','ACTIF','',42,''),(40,'missoal','yvan','2005-04-14','ETUDIANT','677777777','missoalyvan241@gmail.com','melen','2025-05-22','ACTIF','',43,''),(41,'ibrahim','mohamadou','2025-02-11','ETUDIANT','6777777777','ibrahimmessa93@gmail.com','melen','2025-05-22','ACTIF','',44,''),(42,'mahoro','david','2025-02-11','ETUDIANT','6777777777','davidmahoro@gmail.com','melen','2025-05-22','ACTIF','',45,''),(43,'nguimsi','madilia','2025-02-11','ETUDIANTE','6777777777','madilianguimsi@gmail.coml','melen','2025-05-22','ACTIF','',46,''),(44,'nlemenyeme','ismene','2025-02-11','ETUDIANTE','6777777777','ismeri3134@gmail.com','melen','2025-05-22','ACTIF','',47,''),(45,'soboth','shekinah','2005-04-14','ETUDIANTE','6777777777','shekinahsoboth@gmail.com','melen','2025-05-22','ACTIF','',48,''),(46,'tejioni','jethro','2025-02-11','ETUDIANT','6777777777','Tejionijethro@gmail.com','MELEN','2025-05-22','ACTIF','',49,''),(47,'tendjang','ISNEL','2025-02-11','ETUDIANT','6777777777','tendjangisnel@gmail.com','MELEN','2025-05-22','ACTIF','',50,''),(48,'youwe','lamna','2025-02-11','ETUDIANT','6777777777','syouwe01lamna@gmail.com','MELEN','2025-05-22','ACTIF','',51,'');
/*!40000 ALTER TABLE `membres_membre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01  9:55:41
