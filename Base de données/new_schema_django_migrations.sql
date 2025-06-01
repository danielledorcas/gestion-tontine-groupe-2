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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-05-08 03:13:23.949561'),(2,'contenttypes','0002_remove_content_type_name','2025-05-08 03:13:24.029432'),(3,'auth','0001_initial','2025-05-08 03:13:24.331210'),(4,'auth','0002_alter_permission_name_max_length','2025-05-08 03:13:24.401803'),(5,'auth','0003_alter_user_email_max_length','2025-05-08 03:13:24.409416'),(6,'auth','0004_alter_user_username_opts','2025-05-08 03:13:24.418820'),(7,'auth','0005_alter_user_last_login_null','2025-05-08 03:13:24.426694'),(8,'auth','0006_require_contenttypes_0002','2025-05-08 03:13:24.429893'),(9,'auth','0007_alter_validators_add_error_messages','2025-05-08 03:13:24.438367'),(10,'auth','0008_alter_user_username_max_length','2025-05-08 03:13:24.446113'),(11,'auth','0009_alter_user_last_name_max_length','2025-05-08 03:13:24.453141'),(12,'auth','0010_alter_group_name_max_length','2025-05-08 03:13:24.473965'),(13,'auth','0011_update_proxy_permissions','2025-05-08 03:13:24.484346'),(14,'auth','0012_alter_user_first_name_max_length','2025-05-08 03:13:24.493491'),(15,'utilisateurs','0001_initial','2025-05-08 03:13:24.906989'),(16,'admin','0001_initial','2025-05-08 03:13:25.063066'),(17,'admin','0002_logentry_remove_auto_add','2025-05-08 03:13:25.076043'),(18,'admin','0003_logentry_add_action_flag_choices','2025-05-08 03:13:25.089063'),(19,'membres','0001_initial','2025-05-08 03:13:25.145303'),(20,'tontines','0001_initial','2025-05-08 03:13:25.421176'),(21,'cotisations','0001_initial','2025-05-08 03:13:25.446293'),(22,'cotisations','0002_initial','2025-05-08 03:13:25.523390'),(23,'cotisations','0003_initial','2025-05-08 03:13:25.604407'),(24,'dons','0001_initial','2025-05-08 03:13:25.632327'),(25,'dons','0002_initial','2025-05-08 03:13:25.711598'),(26,'membres','0002_initial','2025-05-08 03:13:25.993467'),(27,'operations','0001_initial','2025-05-08 03:13:26.087334'),(28,'operations','0002_initial','2025-05-08 03:13:26.167195'),(29,'operations','0003_initial','2025-05-08 03:13:27.165499'),(30,'prets','0001_initial','2025-05-08 03:13:27.277371'),(31,'remboursements','0001_initial','2025-05-08 03:13:27.613149'),(32,'sessions','0001_initial','2025-05-08 03:13:27.660363'),(33,'tontines','0002_initial','2025-05-08 03:13:27.990363'),(34,'membres','0003_alter_membre_tontines','2025-05-08 11:29:11.252710'),(35,'tontines','0003_tontine_date_creation','2025-05-08 11:29:11.383309'),(36,'membres','0004_remove_membre_tontines_alter_membre_utilisateur','2025-05-08 15:20:44.827281'),(37,'tontines','0004_remove_tontine_membres_tontine_createur_and_more','2025-05-08 15:20:45.366977'),(38,'operations','0004_alter_cotisation_cycle_and_more','2025-05-08 15:20:45.821582'),(39,'prets','0002_alter_pret_options_remove_pret_date_creation_and_more','2025-05-08 15:20:47.171944'),(40,'utilisateurs','0002_customuser_tontines_cotisation_don_pret_and_more','2025-05-08 15:20:49.089173'),(41,'membres','0005_membre_photo_cni','2025-05-12 10:59:14.984512'),(42,'operations','0005_pret_cni_justificatif','2025-05-14 10:28:36.265781'),(43,'utilisateurs','0003_pret_membre','2025-05-14 13:08:08.873594'),(44,'utilisateurs','0004_alter_pret_membre','2025-05-14 13:32:41.838231'),(45,'membres','0006_cotisation_don_pret_remboursement','2025-05-22 00:06:58.768651'),(46,'tontines','0005_alter_tontine_tresorier','2025-05-22 00:36:29.384908'),(47,'tontines','0006_remove_tontine_createur','2025-05-22 00:48:21.421334'),(48,'membres','0007_cotisationdemande','2025-05-22 02:52:41.642751'),(49,'operations','0006_adhesiontontinedemande_demandecotisation_demandedon_and_more','2025-05-22 02:52:42.550921'),(50,'operations','0007_remove_demandecotisation_membre_and_more','2025-05-25 23:24:09.905595'),(51,'demandes','0001_initial','2025-05-25 23:24:10.682382'),(52,'demandes','0002_testdemande','2025-05-25 23:50:36.089164');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
