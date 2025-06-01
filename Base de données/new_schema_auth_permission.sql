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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add membre',6,'add_membre'),(22,'Can change membre',6,'change_membre'),(23,'Can delete membre',6,'delete_membre'),(24,'Can view membre',6,'view_membre'),(25,'Can add tontine',7,'add_tontine'),(26,'Can change tontine',7,'change_tontine'),(27,'Can delete tontine',7,'delete_tontine'),(28,'Can view tontine',7,'view_tontine'),(29,'Can add cycle',8,'add_cycle'),(30,'Can change cycle',8,'change_cycle'),(31,'Can delete cycle',8,'delete_cycle'),(32,'Can view cycle',8,'view_cycle'),(33,'Can add attribution',9,'add_attribution'),(34,'Can change attribution',9,'change_attribution'),(35,'Can delete attribution',9,'delete_attribution'),(36,'Can view attribution',9,'view_attribution'),(37,'Can add membre tontine',10,'add_membretontine'),(38,'Can change membre tontine',10,'change_membretontine'),(39,'Can delete membre tontine',10,'delete_membretontine'),(40,'Can view membre tontine',10,'view_membretontine'),(41,'Can add tontine',11,'add_tontine'),(42,'Can change tontine',11,'change_tontine'),(43,'Can delete tontine',11,'delete_tontine'),(44,'Can view tontine',11,'view_tontine'),(45,'Can add Prêt',12,'add_pret'),(46,'Can change Prêt',12,'change_pret'),(47,'Can delete Prêt',12,'delete_pret'),(48,'Can view Prêt',12,'view_pret'),(49,'Can add Remboursement',13,'add_remboursement'),(50,'Can change Remboursement',13,'change_remboursement'),(51,'Can delete Remboursement',13,'delete_remboursement'),(52,'Can view Remboursement',13,'view_remboursement'),(53,'Can add recu',14,'add_recu'),(54,'Can change recu',14,'change_recu'),(55,'Can delete recu',14,'delete_recu'),(56,'Can view recu',14,'view_recu'),(57,'Can add Cotisation',15,'add_cotisation'),(58,'Can change Cotisation',15,'change_cotisation'),(59,'Can delete Cotisation',15,'delete_cotisation'),(60,'Can view Cotisation',15,'view_cotisation'),(61,'Can add Don',16,'add_don'),(62,'Can change Don',16,'change_don'),(63,'Can delete Don',16,'delete_don'),(64,'Can view Don',16,'view_don'),(65,'Can add user',17,'add_customuser'),(66,'Can change user',17,'change_customuser'),(67,'Can delete user',17,'delete_customuser'),(68,'Can view user',17,'view_customuser'),(69,'Can add cotisation',18,'add_cotisation'),(70,'Can change cotisation',18,'change_cotisation'),(71,'Can delete cotisation',18,'delete_cotisation'),(72,'Can view cotisation',18,'view_cotisation'),(73,'Can add don',19,'add_don'),(74,'Can change don',19,'change_don'),(75,'Can delete don',19,'delete_don'),(76,'Can view don',19,'view_don'),(77,'Can add pret',20,'add_pret'),(78,'Can change pret',20,'change_pret'),(79,'Can delete pret',20,'delete_pret'),(80,'Can view pret',20,'view_pret'),(81,'Can add remboursement',21,'add_remboursement'),(82,'Can change remboursement',21,'change_remboursement'),(83,'Can delete remboursement',21,'delete_remboursement'),(84,'Can view remboursement',21,'view_remboursement'),(85,'Can add remboursement',22,'add_remboursement'),(86,'Can change remboursement',22,'change_remboursement'),(87,'Can delete remboursement',22,'delete_remboursement'),(88,'Can view remboursement',22,'view_remboursement'),(89,'Can add cotisation',23,'add_cotisation'),(90,'Can change cotisation',23,'change_cotisation'),(91,'Can delete cotisation',23,'delete_cotisation'),(92,'Can view cotisation',23,'view_cotisation'),(93,'Can add don',24,'add_don'),(94,'Can change don',24,'change_don'),(95,'Can delete don',24,'delete_don'),(96,'Can view don',24,'view_don'),(97,'Can add pret',25,'add_pret'),(98,'Can change pret',25,'change_pret'),(99,'Can delete pret',25,'delete_pret'),(100,'Can view pret',25,'view_pret'),(101,'Can add remboursement',26,'add_remboursement'),(102,'Can change remboursement',26,'change_remboursement'),(103,'Can delete remboursement',26,'delete_remboursement'),(104,'Can view remboursement',26,'view_remboursement'),(105,'Can add cotisation',27,'add_cotisation'),(106,'Can change cotisation',27,'change_cotisation'),(107,'Can delete cotisation',27,'delete_cotisation'),(108,'Can view cotisation',27,'view_cotisation'),(109,'Can add don',28,'add_don'),(110,'Can change don',28,'change_don'),(111,'Can delete don',28,'delete_don'),(112,'Can view don',28,'view_don'),(113,'Can add pret',29,'add_pret'),(114,'Can change pret',29,'change_pret'),(115,'Can delete pret',29,'delete_pret'),(116,'Can view pret',29,'view_pret'),(117,'Can add remboursement',30,'add_remboursement'),(118,'Can change remboursement',30,'change_remboursement'),(119,'Can delete remboursement',30,'delete_remboursement'),(120,'Can view remboursement',30,'view_remboursement'),(121,'Can add cotisation demande',31,'add_cotisationdemande'),(122,'Can change cotisation demande',31,'change_cotisationdemande'),(123,'Can delete cotisation demande',31,'delete_cotisationdemande'),(124,'Can view cotisation demande',31,'view_cotisationdemande'),(125,'Can add Demande de remboursement',32,'add_demanderemboursement'),(126,'Can change Demande de remboursement',32,'change_demanderemboursement'),(127,'Can delete Demande de remboursement',32,'delete_demanderemboursement'),(128,'Can view Demande de remboursement',32,'view_demanderemboursement'),(129,'Can add adhesion tontine demande',33,'add_adhesiontontinedemande'),(130,'Can change adhesion tontine demande',33,'change_adhesiontontinedemande'),(131,'Can delete adhesion tontine demande',33,'delete_adhesiontontinedemande'),(132,'Can view adhesion tontine demande',33,'view_adhesiontontinedemande'),(133,'Can add demande don',34,'add_demandedon'),(134,'Can change demande don',34,'change_demandedon'),(135,'Can delete demande don',34,'delete_demandedon'),(136,'Can view demande don',34,'view_demandedon'),(137,'Can add demande cotisation',35,'add_demandecotisation'),(138,'Can change demande cotisation',35,'change_demandecotisation'),(139,'Can delete demande cotisation',35,'delete_demandecotisation'),(140,'Can view demande cotisation',35,'view_demandecotisation'),(141,'Can add demande pret',36,'add_demandepret'),(142,'Can change demande pret',36,'change_demandepret'),(143,'Can delete demande pret',36,'delete_demandepret'),(144,'Can view demande pret',36,'view_demandepret'),(145,'Can add demande remboursement',37,'add_demanderemboursement'),(146,'Can change demande remboursement',37,'change_demanderemboursement'),(147,'Can delete demande remboursement',37,'delete_demanderemboursement'),(148,'Can view demande remboursement',37,'view_demanderemboursement'),(149,'Can add demande cotisation',38,'add_demandecotisation'),(150,'Can change demande cotisation',38,'change_demandecotisation'),(151,'Can delete demande cotisation',38,'delete_demandecotisation'),(152,'Can view demande cotisation',38,'view_demandecotisation'),(153,'Can add demande pret',39,'add_demandepret'),(154,'Can change demande pret',39,'change_demandepret'),(155,'Can delete demande pret',39,'delete_demandepret'),(156,'Can view demande pret',39,'view_demandepret'),(157,'Can add demande don',40,'add_demandedon'),(158,'Can change demande don',40,'change_demandedon'),(159,'Can delete demande don',40,'delete_demandedon'),(160,'Can view demande don',40,'view_demandedon'),(161,'Can add adhesion tontine demande',41,'add_adhesiontontinedemande'),(162,'Can change adhesion tontine demande',41,'change_adhesiontontinedemande'),(163,'Can delete adhesion tontine demande',41,'delete_adhesiontontinedemande'),(164,'Can view adhesion tontine demande',41,'view_adhesiontontinedemande'),(165,'Can add test demande',42,'add_testdemande'),(166,'Can change test demande',42,'change_testdemande'),(167,'Can delete test demande',42,'delete_testdemande'),(168,'Can view test demande',42,'view_testdemande');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
