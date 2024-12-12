-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: truck_order_app
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (81,'0001_01_01_000000_create_users_table',1),(82,'0001_01_01_000001_create_cache_table',1),(83,'0001_01_01_000002_create_jobs_table',1),(84,'2024_12_09_050128_create_truck_orders_table',1),(85,'2024_12_09_181757_create_personal_access_tokens_table',1),(86,'2024_12_12_105114_create_notifications_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck_orders`
--

DROP TABLE IF EXISTS `truck_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','in_progress','delivered') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_datetime` datetime NOT NULL,
  `destination_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_datetime` datetime NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_orders`
--

LOCK TABLES `truck_orders` WRITE;
/*!40000 ALTER TABLE `truck_orders` DISABLE KEYS */;
INSERT INTO `truck_orders` VALUES (1,'Kathryn Waelchi','+18722781608','Zoie Schowalter','Doloribus et vitae ab ex ab voluptas.','height: 8ft, width: 5ft, length: 10ft','728 Kg','delivered','Dr. Benton Schaden DVM','741 Grace Port Suite 109','Wintheiserport','28576','+19036218893','2001-03-30 03:50:15','Terence Upton','6616 Ashtyn Fall Suite 548','Sedrickborough','93313','+16602884399','2025-09-24 09:55:48',2,'2024-12-12 08:51:57','2024-12-12 08:51:57'),(2,'Prof. Dolly Herman','+14708104878','Dr. Jaylen O\'Kon','Repellat consequatur sed iure facilis nostrum nihil et.','height: 8ft, width: 5ft, length: 10ft','531 Kg','pending','Sandra Spinka','51235 Runolfsdottir Court','Barbaraport','57688','+13145627234','2023-08-22 22:56:03','Audie Kovacek','66779 Reinger Valley Suite 463','West Howardborough','71663-6479','+15163789962','2025-05-23 09:59:17',10,'2024-12-12 08:51:57','2024-12-12 08:51:57'),(3,'Lori Haag','+19736781215','Iliana Goyette','Dolores corporis et rem excepturi aut dolore.','height: 8ft, width: 5ft, length: 10ft','524 Kg','delivered','Aglae Predovic','399 Antwon Cove Suite 762','South Heidi','43059','+13367634531','2016-08-30 07:48:04','Liam Schmidt V','465 Turcotte Villages Apt. 654','New Rashawnview','60522','+19178531077','2025-06-09 07:43:26',8,'2024-12-12 08:51:57','2024-12-12 08:51:57'),(4,'Bessie O\'Keefe','+14128794743','Raina Runolfsson Jr.','Dolor quam et labore minima quis.','height: 8ft, width: 5ft, length: 10ft','286 Kg','delivered','Callie Sawayn','26768 Lucio Turnpike','Hackettside','92225-5783','+15203753355','2014-09-24 02:43:58','Mr. Juwan Wilderman II','7599 Mayra Fall Suite 290','Thelmachester','19541-7145','+13236543129','2025-01-13 07:21:43',2,'2024-12-12 08:51:57','2024-12-12 08:51:57'),(5,'Ms. Kenyatta Harber','+12814926628','Palma Blick','Dolorum reiciendis nostrum dolorum.','height: 8ft, width: 5ft, length: 10ft','907 Kg','delivered','Carmel Cummerata','16061 White Mountain','East Noeview','79457-7105','+16362105030','2006-12-07 13:00:21','Kyra Howe I','1348 Terry Road','New Junius','92340','+14423166449','2025-02-26 14:07:20',7,'2024-12-12 08:51:57','2024-12-12 08:51:57'),(6,'Sid Conn I','+15209752015','Jessie Nikolaus','Nisi natus qui tenetur ratione.','height: 8ft, width: 5ft, length: 10ft','529 Kg','pending','Francisco Ward','46377 Margaretta Crossroad','Carterburgh','60996-9091','+18208057645','2015-07-22 02:07:02','Wellington Lesch','989 Clementina Trail','Thorashire','61030','+18086381224','2025-06-25 19:35:24',3,'2024-12-12 08:51:57','2024-12-12 08:51:57'),(7,'Kaya VonRueden','+19158430883','Marcia Predovic','Distinctio accusantium incidunt qui sed et.','height: 8ft, width: 5ft, length: 10ft','933 Kg','delivered','Geraldine Schaden','5394 Turcotte Pass','Harveyfort','39445','+16198086779','1991-07-12 07:58:42','Austen D\'Amore MD','56433 Billy Point Apt. 217','Port Jaylen','55309-0140','+18127960118','2025-11-16 16:53:01',8,'2024-12-12 08:51:57','2024-12-12 08:51:57'),(8,'Kaitlyn O\'Hara','+12128906252','Prof. Shemar Hahn','Corporis aut et et eveniet ducimus atque.','height: 8ft, width: 5ft, length: 10ft','415 Kg','delivered','Prof. Ola Klocko','654 Einar Club','Elissaburgh','91315-7217','+16038321606','1996-01-15 03:25:44','Herta Denesik','65861 Imani Crest','Stammhaven','52014-0274','+12347663892','2025-11-01 18:40:55',6,'2024-12-12 08:51:57','2024-12-12 08:51:57'),(9,'Dr. Sim Dare DVM','+13078081340','Dr. Jack Welch','Illo quam sed non sunt aperiam dolore dicta.','height: 8ft, width: 5ft, length: 10ft','312 Kg','pending','Dr. Ricardo Bosco','6612 Bryon Pass','East Nadiaville','78147-5639','+12313986583','1996-11-29 15:23:33','Magdalen Cormier','4782 Ethyl Expressway','New Taniahaven','36840-4555','+12489152742','2025-08-15 10:32:35',8,'2024-12-12 08:51:57','2024-12-12 08:51:57'),(10,'Amie Mann','+17193682663','Briana Leffler','Velit iusto reprehenderit qui enim aut quis.','height: 8ft, width: 5ft, length: 10ft','339 Kg','pending','Helena Smith I','9428 Mellie Manor','Gusikowskiburgh','34904-3664','+18312534780','1980-09-03 09:25:02','Mafalda Hermiston','83602 Jett Spring Suite 982','Bernierfurt','61015','+16199188302','2025-11-18 23:48:07',2,'2024-12-12 08:51:57','2024-12-12 08:51:57');
/*!40000 ALTER TABLE `truck_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Velva Wunsch',NULL,NULL,'white.shirley@example.net','2024-12-12 08:51:55','user','$2y$12$CClk2Q/vlX9Ieqys6cuNlOaSHv9IkhWKqKVvnHu4/tg6lsZncj0JG','wAlGDfwPBL','2024-12-12 08:51:57','2024-12-12 08:51:57'),(2,'Candace Lindgren III',NULL,NULL,'rosalia.emard@example.org','2024-12-12 08:51:55','user','$2y$12$1o/YBxb/eLHYzyGccSxMpOmbTX22sZCy5LTBZWYAFiwW46072p12e','tO8r5hNAbb','2024-12-12 08:51:57','2024-12-12 08:51:57'),(3,'Samantha Mueller IV',NULL,NULL,'katrina.bahringer@example.com','2024-12-12 08:51:55','user','$2y$12$7DfBkTZ7NPCyzehSAKdFZukagfV.RYCacF.8yLFYa7IYY5sE7EjOO','IT8vubEb5S','2024-12-12 08:51:57','2024-12-12 08:51:57'),(4,'Savion Gusikowski',NULL,NULL,'charley.kuvalis@example.org','2024-12-12 08:51:55','user','$2y$12$GorpDZDhKt13k7v7BD8tPONjftUcTahkAbUTdC9H0xhEPPUPePQgS','xlTUaoJaMr','2024-12-12 08:51:57','2024-12-12 08:51:57'),(5,'Damaris Corwin',NULL,NULL,'antonette.roberts@example.net','2024-12-12 08:51:55','user','$2y$12$AVs7svwi0b2QqJXFpXsZvehv.noATM6jW3HLvEEco7mLtn7zZqeom','dUxgVvzye5','2024-12-12 08:51:57','2024-12-12 08:51:57'),(6,'Natalie Kuhn',NULL,NULL,'oliver93@example.org','2024-12-12 08:51:56','user','$2y$12$5Tlzezq7wq3nsmcepWcv7eHrJwANhPI4L9M8KWZjEYfkZBgrIifZK','bttr7s5gGp','2024-12-12 08:51:57','2024-12-12 08:51:57'),(7,'Arden Zulauf',NULL,NULL,'obie.goodwin@example.org','2024-12-12 08:51:56','user','$2y$12$pAqOFkEu/4L6zzxNVA62JuSCCD1ksxXhlYnzSlVkLETog8Uakyp4u','ZlzAZi1A8r','2024-12-12 08:51:57','2024-12-12 08:51:57'),(8,'Ted Walter',NULL,NULL,'bergstrom.maximo@example.com','2024-12-12 08:51:56','user','$2y$12$80/Lu55IIghFwUOLlyB3NOfUjXlU6BqCSU8lD/Z4tWt0i45zoWcxi','ckzmWIDiPN','2024-12-12 08:51:57','2024-12-12 08:51:57'),(9,'Magali Upton',NULL,NULL,'jfarrell@example.net','2024-12-12 08:51:56','user','$2y$12$8xAQrBcC8MCmeLxGwU2p0.FvCq3b.OYIT3caDpUCsrzez.SmHMVXa','OGf0WTKlk9','2024-12-12 08:51:57','2024-12-12 08:51:57'),(10,'Dr. Mohammed McClure',NULL,NULL,'eunice.morissette@example.com','2024-12-12 08:51:57','user','$2y$12$nJQElDx15tWVpiXJ0TMRxuw48Ye.JCxPGxR6utGWEwpS7ybmMT1rm','bLlDKibAEG','2024-12-12 08:51:57','2024-12-12 08:51:57'),(11,'Test Admin',NULL,NULL,'admin@example.com','2024-12-12 08:51:57','admin','$2y$12$8U0qVIYq0WSWV1RO9F9THOS7bRBfeGcaRO52zODO0n7TP2CQplXhK','PWL671gXx0','2024-12-12 08:51:57','2024-12-12 08:51:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 19:57:34
