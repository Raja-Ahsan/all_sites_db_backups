-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: tn_veterans
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
-- Table structure for table `class_schedules`
--

DROP TABLE IF EXISTS `class_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint unsigned NOT NULL,
  `class_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `duration_hours` int NOT NULL,
  `max_students` int NOT NULL DEFAULT '10',
  `min_students` int NOT NULL DEFAULT '2',
  `current_students` int NOT NULL DEFAULT '0',
  `room` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_overlap` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('scheduled','full','cancelled','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'scheduled',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_schedules_class_date_start_time_index` (`class_date`,`start_time`),
  KEY `class_schedules_service_id_class_date_index` (`service_id`,`class_date`),
  CONSTRAINT `class_schedules_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_schedules`
--

LOCK TABLES `class_schedules` WRITE;
/*!40000 ALTER TABLE `class_schedules` DISABLE KEYS */;
INSERT INTO `class_schedules` VALUES (4,7,'2026-01-22','12:12:00','20:12:00',8,10,2,0,'Class A 03','Jayson Wheat',1,'scheduled','Testing','2026-01-20 17:38:22','2026-01-20 17:38:22'),(5,7,'2026-01-23','15:21:00','23:21:00',8,10,2,2,'Class A 03','Jayson Wheat',1,'scheduled','Testing','2026-01-20 17:38:22','2026-01-21 10:55:00'),(6,7,'2026-01-27','08:42:00','16:42:00',8,10,2,0,'Class A 03','Jayson Wheat',1,'scheduled','Testing','2026-01-20 17:38:22','2026-01-20 17:38:22'),(7,1,'2026-01-22','11:11:00','16:11:00',5,8,4,0,'Class A 7','Jayson',1,'scheduled','test','2026-01-20 17:45:12','2026-01-21 14:42:14'),(8,1,'2026-01-24','07:50:00','15:50:00',8,10,2,0,'class A 09','Jayson ww',1,'scheduled','testing','2026-01-20 17:45:50','2026-01-20 17:45:50'),(9,3,'2026-01-23','16:00:00','08:00:00',16,10,1,0,'32123','Jack',1,'scheduled',NULL,'2026-01-21 13:34:30','2026-01-21 13:34:30'),(10,2,'2026-01-30','17:00:00','01:00:00',8,10,2,0,'Class A17','Jack son',1,'scheduled',NULL,'2026-01-21 13:36:22','2026-01-21 13:36:22'),(11,2,'2026-01-31','18:00:00','02:00:00',8,10,2,0,'Class A17','Jack son',1,'scheduled',NULL,'2026-01-21 13:36:22','2026-01-21 13:36:22'),(12,4,'2026-01-28','23:00:00','07:00:00',8,10,1,3,'111112','Oscar',1,'scheduled','Check if multiple classes can run simultaneously in the same room','2026-01-21 21:03:44','2026-01-23 21:18:57'),(13,4,'2026-01-30','12:00:00','20:00:00',8,10,1,0,'111112','Oscar',1,'scheduled','Check if multiple classes can run simultaneously in the same room','2026-01-21 21:03:44','2026-01-21 21:05:50');
/*!40000 ALTER TABLE `class_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Json','customer@customer.com','$2y$12$8DaIhkSdBoi8p.qXc7Vx2e6vLsM7EoqFMg5jEXHp9my/ezenSegyK','1231231231','44075 Pipeline Plaza Ste. 125','customer-profiles/ypHnHGAPwms3tWX1LKRFVVoRsdJauW0s2fhODHqd.jpg',NULL,NULL,'2026-01-12 17:14:44','2026-01-12 17:23:51'),(2,'Production Head','student@gmail.com','$2y$12$UUuPm.bnIhlqLJxz.CaNoucS8AXcrpeLKj6pxybDRUXFc7OU5RpkG','1231231231','44075 Pipeline Plaza Ste. 125','customer-profiles/wkdK2E1C1UA412Lf2KWEfXg6GXbWUYGl5vnsaJ6k.jpg',NULL,NULL,'2026-01-20 18:19:20','2026-01-20 18:21:46'),(3,'Jack','jack@gemail.com','$2y$12$qd5xtI0IzfwvE5CUrR2hNeObl5hHF1zY1LkjVodoi/wZ3H/EX/Qzi','1231231231','44075 Pipeline Plaza Ste. 132',NULL,NULL,NULL,'2026-01-21 10:35:40','2026-01-21 10:35:40'),(4,'Ryan','ryan@americandigitalagency.us','$2y$12$8N0/stsHlv5.Ug675C5/U.CjUCY0yO/N7peMorLFAojU0dkjxJlvy',NULL,NULL,NULL,NULL,NULL,'2026-01-21 21:37:14','2026-01-21 21:37:14');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_01_12_174338_create_services_table',2),(5,'2026_01_12_175606_add_short_description_to_services_table',3),(6,'2026_01_12_182335_create_site_settings_table',4),(7,'2026_01_12_183941_add_profile_picture_to_users_table',5),(8,'2026_01_12_221013_create_customers_table',6),(9,'2026_01_12_221017_create_service_bookings_table',6),(10,'2026_01_20_220728_add_class_fields_to_services_table',7),(11,'2026_01_20_220737_create_class_schedules_table',7),(12,'2026_01_20_220740_add_payment_fields_to_service_bookings_table',7),(13,'2026_01_20_220744_create_payments_table',7),(14,'2026_01_21_184933_add_api_keys_to_site_settings_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` enum('deposit','full_payment','remaining_balance','refund') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deposit',
  `payment_method` enum('credit_card','debit_card','bank_transfer','cash','check','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'credit_card',
  `status` enum('pending','completed','failed','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_response` text COLLATE utf8mb4_unicode_ci,
  `synced_to_quickbooks` tinyint(1) NOT NULL DEFAULT '0',
  `quickbooks_invoice_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quickbooks_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quickbooks_synced_at` timestamp NULL DEFAULT NULL,
  `synced_to_bank` tinyint(1) NOT NULL DEFAULT '0',
  `bank_synced_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `payment_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_transaction_id_unique` (`transaction_id`),
  KEY `payments_booking_id_status_index` (`booking_id`,`status`),
  KEY `payments_customer_id_payment_date_index` (`customer_id`,`payment_date`),
  KEY `payments_transaction_id_index` (`transaction_id`),
  CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `service_bookings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,2,40.00,'deposit','cash','pending',NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,'2026-01-20','2026-01-20 18:21:08','2026-01-20 18:21:08'),(2,2,3,100.00,'deposit','credit_card','completed','1231231231111111',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,'2026-01-21','2026-01-21 10:55:21','2026-01-21 10:55:21'),(3,3,3,50.00,'deposit','credit_card','completed','1112321312312123121',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,'2026-01-21','2026-01-21 21:13:53','2026-01-21 21:13:53'),(4,4,4,50.00,'deposit','bank_transfer','completed',NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,'2026-01-21','2026-01-21 21:38:24','2026-01-21 21:38:24'),(5,5,4,50.00,'deposit','credit_card','completed',NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,'2026-01-23','2026-01-23 21:19:13','2026-01-23 21:19:13');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_bookings`
--

DROP TABLE IF EXISTS `service_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time DEFAULT NULL,
  `status` enum('pending','confirmed','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `class_schedule_id` bigint unsigned DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `remaining_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('pending','deposit_paid','fully_paid','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `booking_type` enum('group','one-on-one') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'group',
  `number_of_students` int NOT NULL DEFAULT '1',
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_bookings_customer_id_foreign` (`customer_id`),
  KEY `service_bookings_service_id_foreign` (`service_id`),
  KEY `service_bookings_class_schedule_id_foreign` (`class_schedule_id`),
  CONSTRAINT `service_bookings_class_schedule_id_foreign` FOREIGN KEY (`class_schedule_id`) REFERENCES `class_schedules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `service_bookings_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `service_bookings_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_bookings`
--

LOCK TABLES `service_bookings` WRITE;
/*!40000 ALTER TABLE `service_bookings` DISABLE KEYS */;
INSERT INTO `service_bookings` VALUES (1,2,1,'2026-01-22','11:11:00','completed','Testing','2026-01-20 18:20:37','2026-01-21 14:42:13',7,380.00,40.00,340.00,'deposit_paid','group',4,'Team 2'),(2,3,7,'2026-01-23','15:21:00','confirmed',NULL,'2026-01-21 10:55:00','2026-01-21 10:55:21',5,400.00,100.00,300.00,'deposit_paid','group',2,NULL),(3,3,4,'2026-01-28','23:00:00','confirmed',NULL,'2026-01-21 21:13:11','2026-01-21 21:13:53',12,150.00,50.00,100.00,'deposit_paid','group',1,NULL),(4,4,4,'2026-01-28','23:00:00','confirmed',NULL,'2026-01-21 21:38:05','2026-01-21 21:38:24',12,150.00,50.00,100.00,'deposit_paid','group',1,NULL),(5,4,4,'2026-01-28','23:00:00','confirmed',NULL,'2026-01-23 21:18:57','2026-01-23 21:19:13',12,150.00,50.00,100.00,'deposit_paid','group',1,NULL);
/*!40000 ALTER TABLE `service_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `duration_hours` int DEFAULT NULL,
  `max_students` int NOT NULL DEFAULT '10',
  `min_students` int NOT NULL DEFAULT '2',
  `class_type` enum('group','one-on-one') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'group',
  `has_online_parts` tinyint(1) NOT NULL DEFAULT '0',
  `testing_in_person` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Armed Security Certification','Armed Security Certification provides advanced training in firearm safety, legal use of force, and tactical response for professional armed security roles.','<p>Armed Security Certification is an advanced training program designed for individuals pursuing or currently working in armed security positions. This certification equips participants with the knowledge, skills, and discipline required to carry and use firearms responsibly while performing protective duties.</p><p><br></p><p>The program covers firearm safety, weapons handling, marksmanship fundamentals, and safe storage, along with critical instruction on use-of-force laws, legal responsibilities, and ethical decision-making. Participants receive scenario-based training to develop judgment, threat assessment, and controlled response under high-stress conditions.</p><p><br></p><p>Additional focus areas include defensive tactics, situational awareness, communication, and coordination with law enforcement and emergency responders. Emphasis is placed on professionalism, accountability, and compliance with state and employer regulations.</p><p><br></p><p>Armed Security Certification is ideal for security professionals seeking armed assignments in corporate, residential, event, or high-risk environments. Completion of this training demonstrates readiness, competence, and commitment to maintaining the highest standards of safety and professionalism in armed protective services.</p>',95.00,10.00,NULL,10,2,'group',1,0,'services/MilcDEuSaoS2oPgKFlUp7yoiC1dI61GBA1gOvbPi.jpg',1,1,'2026-01-12 12:52:47','2026-01-21 20:49:07'),(2,'Force Science (De-escalation)','Force Science (De-escalation) training teaches evidence-based techniques to reduce conflict, manage behavior, and safely resolve high-stress encounters.','<p>Force Science (De-escalation) training is a research-driven program focused on understanding human behavior, stress responses, and decision-making during high-risk or emotionally charged situations. This training equips participants with proven de-escalation strategies to prevent situations from escalating into physical force.</p><p><br></p><p>The course emphasizes verbal communication skills, body language awareness, distance management, and emotional regulation to influence behavior and maintain control. Participants learn how stress, perception, and cognitive limitations affect both responders and subjects, enabling safer and more effective interactions.</p><p><br></p><p>Scenario-based training reinforces practical application, teaching participants how to recognize warning signs, apply tactical patience, and choose appropriate responses while remaining legally and ethically compliant. The program also addresses use-of-force decision-making, accountability, and post-incident considerations.</p><p><br></p><p>Force Science (De-escalation) training is ideal for security officers, guards, supervisors, and individuals preparing for future security careers. It promotes professionalism, safety, and confidence while reducing risk, liability, and unnecessary use of force in protective service environments.</p>',200.00,100.00,NULL,10,2,'group',1,0,'services/xs3vEHVDP3jbeBYuUuctSDNO1mrHl87I33JXxwLE.jpg',3,1,'2026-01-12 13:00:45','2026-01-21 20:49:44'),(3,'ASP (Batons and Restraints)','ASP (Batons and Restraints) training teaches proper baton use and restraint techniques for safely controlling and managing resistant or aggressive individuals.','<p>ASP (Batons and Restraints) training provides essential instruction in the safe, legal, and effective use of expandable batons and restraint devices for security and protective service professionals. This program emphasizes control, officer safety, and minimizing injury while managing confrontational or non-compliant situations.</p><p><br></p><p>Participants learn correct baton handling, striking zones, defensive techniques, and retention methods, along with proper application of restraints such as handcuffs and control devices. The training includes use-of-force guidelines, legal considerations, and decision-making to ensure actions are justified, proportional, and compliant with industry standards.</p><p><br></p><p>Scenario-based exercises help develop practical skills in de-escalation, subject control, team coordination, and situational awareness. Strong emphasis is placed on professionalism, accountability, and post-incident procedures, including reporting and subject care.</p><p><br></p><p>This training is ideal for security officers, guards, and individuals preparing for future security roles who require intermediate force options to maintain safety and control in dynamic environments.</p>',100.00,50.00,NULL,10,2,'group',0,0,'services/HYcfH5F6NRukzu6emCtIhuWKw3iCkNc3GgnbBdLu.jpg',2,1,'2026-01-12 13:13:46','2026-01-21 20:49:21'),(4,'NRA (Advanced Handgun Carry)','NRA Advanced Handgun Carry training develops advanced handgun skills, defensive carry techniques, and responsible decision-making for armed professionals and qualified civilians.','<p>NRA Advanced Handgun Carry is an advanced-level firearms training program designed to enhance defensive handgun proficiency for individuals who carry a firearm for personal protection or professional duties. This course builds on fundamental handgun skills and focuses on real-world defensive carry scenarios.</p><p><br></p><p>Training includes advanced marksmanship, drawing from concealment, movement, use of cover, threat assessment, and defensive shooting techniques. Strong emphasis is placed on firearm safety, legal considerations, and responsible use of force in accordance with applicable laws.</p><p><br></p><p>Participants also learn mindset development, situational awareness, and decision-making under stress through scenario-based instruction. The course reinforces safe gun handling, accountability, and ethical responsibilities associated with carrying a handgun in public or professional environments.</p><p><br></p><p>NRA Advanced Handgun Carry is ideal for armed security personnel, protective service professionals, and experienced civilian carriers seeking to elevate their skills, confidence, and readiness while maintaining the highest standards of safety and professionalism.</p>',150.00,50.00,NULL,10,2,'group',0,0,'services/gyjlutbu9LVmCubgEqPxNSOksh4hxmZY9yAvvzAF.jpg',4,1,'2026-01-12 13:14:51','2026-01-21 20:49:58'),(5,'Standard Handgun Carry','Standard Handgun Carry training teaches safe handgun handling, basic defensive shooting skills, and responsible concealed or open carry practices.','<p>Standard Handgun Carry training is designed to provide participants with a solid foundation in carrying and using a handgun safely and responsibly. This course focuses on essential firearm safety rules, proper handling, and basic marksmanship skills required for defensive handgun carry.</p><p><br></p><p>Participants learn correct grip, stance, sight alignment, trigger control, and safe drawing and holstering techniques. The training also covers carry methods, situational awareness, and fundamental defensive concepts to help individuals respond appropriately to potential threats.</p><p><br></p><p>Legal responsibilities, use-of-force principles, and ethical considerations are emphasized to ensure participants understand when and how a handgun may be used in self-defense or professional contexts. Practical exercises reinforce confidence, accuracy, and safe decision-making.</p><p><br></p><p>Standard Handgun Carry is ideal for new or developing armed security professionals and responsible civilians seeking foundational training before advancing to higher-level handgun carry or tactical courses.</p>',120.00,120.00,NULL,10,2,'group',1,0,'services/TfcZsZ4QNuoxf7dqOYPMVc9tRi36h4QTLksBKj5b.jpg',5,1,'2026-01-12 13:15:47','2026-01-21 20:50:12'),(6,'Red Cross (First Aid, CPR, and AED)','Red Cross First Aid, CPR, and AED training equips individuals with lifesaving skills to respond confidently to medical emergencies.','<p>Red Cross First Aid, CPR, and AED training provides comprehensive, nationally recognized instruction in emergency medical response for adults, children, and infants. This course prepares participants to act quickly and effectively during medical emergencies until professional help arrives.</p><p><br></p><p>Training covers essential first aid skills, including bleeding control, wound care, shock management, and response to common injuries and illnesses. Participants also receive hands-on instruction in cardiopulmonary resuscitation (CPR) and the safe, effective use of Automated External Defibrillators (AEDs).</p><p><br></p><p>Emphasis is placed on scene safety, emergency assessment, teamwork, and legal considerations such as Good Samaritan protections. Practical scenarios build confidence, coordination, and readiness in high-stress situations.</p><p><br></p><p>This training is ideal for security officers, guards, workplace teams, educators, and individuals preparing for future security or protective service roles. Certification demonstrates preparedness, responsibility, and commitment to safety in any environment.</p>',300.00,100.00,NULL,10,2,'group',0,0,'services/pQswUh5sBO6QPd0GS0KzVzYfigNtQC59O2Q3RlSy.jpg',6,1,'2026-01-12 13:18:51','2026-01-21 20:50:24'),(7,'ALERRT (Active Shooter)','ALERRT (Active Shooter) training prepares individuals to recognize, respond to, and survive active shooter and hostile threat incidents.','<p>ALERRT (Advanced Law Enforcement Rapid Response Training) – Active Shooter training is a nationally recognized, research-based program designed to prepare individuals and organizations for rapid and effective response to active shooter and hostile threat events.</p><p><br></p><p>The training focuses on threat recognition, situational awareness, and immediate response strategies to reduce harm and save lives. Participants learn proven concepts such as movement during high-risk incidents, decision-making under stress, communication, coordination with first responders, and lifesaving medical response including bleeding control.</p><p><br></p><p>Scenario-based instruction reinforces practical application, helping participants understand attacker behavior, response priorities, and survival principles. The program emphasizes prevention, preparedness, and recovery while maintaining legal and ethical responsibilities.</p><p><br></p><p>ALERRT Active Shooter training is ideal for security officers, guards, school staff, healthcare workers, corporate teams, and individuals preparing for future security roles. Completion of this training increases confidence, readiness, and the ability to act decisively during critical incidents.</p>',200.00,50.00,NULL,10,2,'group',1,0,'services/wEoCS6o2Lmm37VBMPkhsnaCut0S1WA423xFL5Nw4.jpg',7,1,'2026-01-20 16:43:51','2026-01-21 20:50:46'),(8,'Private Protective Services (for future security jobs)','Private Protective Services training prepares individuals for future security careers through professional protection skills and real-world readiness.','<p>Private Protective Services training is designed for individuals seeking future employment in the security and protective services industry. This program provides foundational and practical training required to pursue careers in private security, executive protection, event security, and facility protection.</p><p><br></p><p>The course covers essential security topics including access control, patrol procedures, threat assessment, report writing, communication skills, and emergency response. Participants also develop situational awareness, professionalism, and conflict management skills critical to effective protective operations.</p><p><br></p><p>Strong emphasis is placed on legal responsibilities, ethical conduct, and industry standards to ensure participants understand their role in safeguarding people, property, and assets. Scenario-based instruction reinforces decision-making, teamwork, and confidence in real-world environments.</p><p><br></p><p>This training is ideal for individuals preparing for future security roles and provides a strong pathway toward professional certification, employment readiness, and career advancement in the private protective services field.</p>',200.00,100.00,NULL,10,2,'group',0,0,'services/djBL54vuQtHZa3TTE2lzrdZAXPsajJvBapQFSKSS.jpg',8,1,'2026-01-20 16:45:12','2026-01-21 20:50:58');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
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
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `header_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `facebook_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quickbooks_client_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quickbooks_client_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quickbooks_company_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quickbooks_environment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'sandbox',
  `quickbooks_access_token` text COLLATE utf8mb4_unicode_ci,
  `quickbooks_refresh_token` text COLLATE utf8mb4_unicode_ci,
  `quickbooks_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `bank_api_provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_api_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_sync_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'settings/Qnc5Xc2z8WgFKoSv5KPX4tvzP3uAig2f6VXtY0y3.png','settings/F9BTXoab6HpL671DdkRkzGm9fhRGXzJlZlaECcoL.png','settings/M0DGOgjQNOUA9XyQskcXQIKJ0vtmtXRM2cfe3Wcc.png','615-554-1131','tnvetsecsvctrng@gmail.com','123 Security Way,\r\nNashville, TN 37201',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sandbox',NULL,NULL,0,NULL,NULL,NULL,NULL,0,'2026-01-12 13:30:50','2026-01-21 20:52:26');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Admin','admin@admin.com','profiles/qIPQW6F3JktPGpqMa1d9lbbuWD0KEsrc9734pl7P.jpg',NULL,'$2y$12$T9.zhU.ZeaSdCwIQi2RaWO78E.qibh7giBZyXVvcQ8jSwuWmXWAZa','NyOFj7hBC9v0dpR9d483A7bwggmhMYmQylGwgFATZoyikCRJlbxR6k3PCPZX','2026-01-12 12:47:43','2026-01-21 20:52:42');
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

-- Dump completed on 2026-01-26 16:52:34
