-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: lana_amawi
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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `program` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_type` enum('in-office','virtual') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in-office',
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointments_user_id_foreign` (`user_id`),
  CONSTRAINT `appointments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (31,38,NULL,'2025-09-18','16:00','in-office',NULL,'cancelled','2025-09-16 14:23:34','2025-11-24 21:24:35'),(32,15,NULL,'2025-09-30','14:30','in-office','testing','completed','2025-09-26 17:33:35','2025-11-24 21:24:24');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `program` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferred_date` date NOT NULL,
  `preferred_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_type` enum('in-office','virtual') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in-office',
  `message` text COLLATE utf8mb4_unicode_ci,
  `admin_suggestion` text COLLATE utf8mb4_unicode_ci,
  `client_response` text COLLATE utf8mb4_unicode_ci,
  `response_date` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `signed_agreement_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signed_agreement_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agreement_uploaded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `client_notes`
--

DROP TABLE IF EXISTS `client_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `admin_id` bigint unsigned NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_notes_admin_id_foreign` (`admin_id`),
  KEY `client_notes_user_id_created_at_index` (`user_id`,`created_at`),
  CONSTRAINT `client_notes_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_notes`
--

LOCK TABLES `client_notes` WRITE;
/*!40000 ALTER TABLE `client_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_notes` ENABLE KEYS */;
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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_size` int DEFAULT NULL,
  `sender_type` enum('client','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_user_id_foreign` (`user_id`),
  CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_08_06_224207_create_bookings_table',1),(5,'2025_08_06_224219_create_appointments_table',1),(6,'2025_08_06_224232_create_messages_table',1),(7,'2025_08_06_224245_add_is_admin_to_users_table',1),(8,'2025_08_07_172645_add_suggested_alternative_to_bookings_status_enum',1),(9,'2025_08_07_201515_add_attachments_to_messages_table',2),(10,'2025_08_07_215137_make_program_nullable_in_bookings_table',3),(11,'2025_08_07_215234_make_program_nullable_in_appointments_table',4),(12,'2025_08_12_191548_add_phone_to_users_table',5),(13,'2025_08_13_175337_add_admin_suggestion_to_bookings_table',6),(14,'2025_08_13_180954_add_client_response_fields_to_bookings_table',7),(15,'2025_08_13_181631_fix_booking_status_column_length',8),(16,'2025_08_13_181657_fix_appointment_status_column_length',9),(17,'2025_08_13_200000_add_agreement_fields_to_bookings_table',10),(18,'2025_08_23_002943_add_agreement_fields_to_users_table',11),(19,'2025_08_26_042306_create_client_notes_table',12),(20,'2025_01_27_120000_add_professional_fields_to_users_table',13),(21,'2025_09_15_231507_create_programs_table',14),(22,'2025_09_15_231511_create_user_programs_table',14),(23,'2025_09_16_182730_create_subscriptions_table',15),(24,'2025_09_16_182808_add_subscription_fields_to_programs_table',15),(25,'2025_09_18_233020_add_education_institution_to_users_table',16),(26,'2025_09_25_235546_add_booking_type_to_bookings_table',17),(27,'2025_09_25_235711_add_booking_type_to_appointments_table',18),(28,'2025_09_26_185416_create_slot_schedules_table',19),(29,'2025_09_26_185420_create_slot_exceptions_table',19),(30,'2025_10_09_184454_rename_duration_weeks_to_duration_months_in_programs_table',20),(31,'2025_11_07_194117_merge_booking_limit_into_monthly_sessions',21),(32,'2025_11_11_200934_add_contract_and_payment_fields_to_user_programs_table',22),(33,'2025_11_11_200937_add_additional_booking_charge_to_programs_table',22),(34,'2025_11_11_200938_create_payments_table',22),(35,'2025_11_11_202001_add_one_time_payment_amount_to_programs_table',23),(36,'2025_11_11_212209_add_agreement_template_path_to_programs_table',24),(37,'2025_11_18_212510_add_stripe_fields_to_payments_table',25),(38,'2025_11_18_212511_add_stripe_fields_to_user_programs_table',25),(39,'2025_11_19_165801_create_settings_table',26);
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
  `user_program_id` bigint unsigned NOT NULL,
  `appointment_id` bigint unsigned DEFAULT NULL,
  `payment_type` enum('contract_monthly','contract_one_time','additional_session') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'contract_monthly',
  `status` enum('pending','completed','failed','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(10,2) NOT NULL,
  `payment_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_payment_intent_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `month_number` int DEFAULT NULL COMMENT 'For monthly payments: 1, 2, or 3',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_appointment_id_foreign` (`appointment_id`),
  KEY `payments_user_program_id_status_index` (`user_program_id`,`status`),
  KEY `payments_payment_type_status_index` (`payment_type`,`status`),
  KEY `payments_stripe_payment_intent_id_index` (`stripe_payment_intent_id`),
  KEY `payments_stripe_customer_id_index` (`stripe_customer_id`),
  CONSTRAINT `payments_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE SET NULL,
  CONSTRAINT `payments_user_program_id_foreign` FOREIGN KEY (`user_program_id`) REFERENCES `user_programs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (3,15,NULL,'contract_one_time','completed',675.00,'PAY-SJIVQ4CI-1763509373','pi_3SUyXuLXqt7gmBJh0609oDiG','ch_3SUyXuLXqt7gmBJh0djl2zNt','cus_TRqCsdWtWaGCwc','Payment completed via Stripe. Payment Intent: pi_3SUyXuLXqt7gmBJh0609oDiG',NULL,'2025-11-18 18:42:53','2025-11-18 18:42:53','2025-11-18 18:42:53'),(4,16,NULL,'contract_monthly','completed',399.00,'PAY-3HIICHRE-1763510194','pi_3SUyl9LXqt7gmBJh0vfi1nfw','ch_3SUyl9LXqt7gmBJh0SCaCpbc','cus_TRsWSIWur6r7qi','Payment completed via Stripe. Payment Intent: pi_3SUyl9LXqt7gmBJh0vfi1nfw',1,'2025-11-18 18:56:34','2025-11-18 18:56:34','2025-11-18 18:56:34'),(5,20,NULL,'contract_monthly','completed',399.00,'PAY-QVEJXIX7-1763681811','pi_3SVhPALXqt7gmBJh1uF37bbR','ch_3SVhPALXqt7gmBJh1xL38AG6','cus_TScexvAgdpsrrX','Payment completed via Stripe. Payment Intent: pi_3SVhPALXqt7gmBJh1uF37bbR',1,'2025-11-20 23:36:51','2025-11-20 23:36:51','2025-11-20 23:36:51'),(6,21,NULL,'contract_one_time','completed',1080.00,'PAY-OTNDAD5U-1763682292','pi_3SVhWw1F3kkgUjOi1WW7TwaY','ch_3SVhWw1F3kkgUjOi1X7ookF3','cus_TScmjPZqzVpkCt','Payment completed via Stripe. Payment Intent: pi_3SVhWw1F3kkgUjOi1WW7TwaY',NULL,'2025-11-20 23:44:52','2025-11-20 23:44:52','2025-11-20 23:44:52');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration_months` int DEFAULT NULL,
  `sessions_included` int DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `features` text COLLATE utf8mb4_unicode_ci,
  `subscription_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_price` decimal(10,2) DEFAULT NULL,
  `monthly_sessions` int DEFAULT NULL,
  `additional_booking_charge` decimal(10,2) DEFAULT NULL COMMENT 'Charge for additional 60-minute sessions beyond monthly limit',
  `one_time_payment_amount` decimal(10,2) DEFAULT NULL COMMENT 'Custom one-time payment amount for 3-month contract',
  `agreement_template_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Path to program-specific agreement PDF template',
  `is_subscription_based` tinyint(1) NOT NULL DEFAULT '0',
  `subscription_features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `programs_chk_1` CHECK (json_valid(`subscription_features`))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (14,'Life Coaching','Supports development of professional and personal goals in the medical and dental community.',0.00,NULL,NULL,1,'[\"2 sessions\\/month\",\"Text-support\"]','life_coaching',399.00,2,165.00,1080.00,'agreement-templates/agreement_life-coaching_1762896325.pdf',1,NULL,'2025-11-11 16:01:20','2025-11-11 16:25:25'),(15,'Student Coaching Program','This coaching program is designed to support high school, college, and graduate school students in achieving their academic, personal, and professional goals. The program provides personalized coaching to enhance study skills, time management, motivation, stress management, and test taking. Students receive guidance on navigating educational challenges, setting clear goals, and building confidence to succeed in their academic journeys. With a focus on holistic development, the program empowers students to thrive academically while maintaining balance and well-being throughout their education.',0.00,NULL,NULL,1,'[\"2 sessions\\/month\",\"Text-support\"]','student',249.00,2,125.00,675.00,'agreement-templates/agreement_student-coaching-program_1762896305.pdf',1,NULL,'2025-11-11 16:03:52','2025-11-11 16:25:05'),(16,'Relationship Program','This coaching program is designed to support multicultural, multi-ethnic, and cross-cultural couples, marriages, and families globally. It offers a culturally sensitive and inclusive approach to strengthen communication, deepen understanding, and resolve conflicts unique to diverse backgrounds. The program empowers participants to navigate cultural differences with respect and empathy, fostering stronger, more resilient bonds within their relationships and families. Through personalized coaching, practical tools, and insightful guidance, couples and families learn to build connection, harmony, and lasting love across similar or different cultural boundaries.',0.00,NULL,NULL,1,'[\"2 sessions\\/month\",\"Text-support\"]','relationship',399.00,2,165.00,1080.00,'agreement-templates/agreement_relationship-program_1762896296.pdf',1,NULL,'2025-11-11 16:05:59','2025-11-11 16:24:56'),(17,'Resident Program','This coaching program supports residents in medicine and dentistry as they navigate the demanding stages of advanced training. The program provides individualized and confidential coaching to address academic development, clinical performance, work-life balance, wellness, and professional identity formation. Through regular sessions, participants gain actionable feedback, set clear goals, and develop personalized strategies for resilience, communication, and career advancement. Coaches serve as allies and advocates throughout the residency and fellowship journey—helping trainees unlock potential, manage stress, and thrive in both their professional and personal lives.',0.00,NULL,NULL,1,'[\"2 sessions\\/month\",\"Text-support\"]','resident',299.00,2,150.00,810.00,'agreement-templates/agreement_resident-program_1762896281.pdf',1,NULL,'2025-11-11 16:07:24','2025-11-11 16:24:41'),(18,'Fellow Program','This coaching program supports fellows in medicine and dentistry as they navigate the demanding stages of advanced training. The program provides individualized and confidential coaching to address academic development, clinical performance, work-life balance, wellness, and professional identity formation. Through regular sessions, participants gain actionable feedback, set clear goals, and develop personalized strategies for resilience, communication, and career advancement. Coaches serve as allies and advocates throughout the residency and fellowship journey—helping trainees unlock potential, manage stress, and thrive in both their professional and personal lives.',0.00,NULL,NULL,1,'[\"2 sessions\\/month\",\"Text-support\"]','fellow',349.00,2,165.00,945.00,'agreement-templates/agreement_fellow-program_1762896269.pdf',1,NULL,'2025-11-11 16:08:54','2025-11-11 16:24:29'),(19,'Professional Program','This exclusive coaching program serves a select group of healthcare providers, offering personalized support through the unique challenges of clinical practice. Addressing issues such as managing difficult patients and families, coping with long shifts, balancing work-life demands, and strengthening family and partner relationships, this program ensures each provider receives tailored guidance and confidential support. As you remain on call for your patients, let this program be on call for you—providing expert help whenever you need it, restoring balance and resilience so you can thrive in your professional and personal life.',0.00,NULL,NULL,1,'[\"2 sessions\\/month\",\"Text-support\"]','professional',379.00,2,165.00,1025.00,'agreement-templates/agreement_professional-program_1762896260.pdf',1,NULL,'2025-11-11 16:10:14','2025-11-11 16:24:20'),(20,'Medical Concierge Program','This exclusive coaching program serves a select group of healthcare providers, offering personalized support through the unique challenges of clinical practice. Addressing issues such as managing difficult patients and families, coping with long shifts, balancing work-life demands, and strengthening family and partner relationships, this program ensures each provider receives tailored guidance and confidential support. Enrollment is limited to preserve an intimate, high-impact experience. As you remain on call for your patients, let this program be on call for you—providing expert help whenever you need it, restoring balance and resilience so you can thrive in your professional and personal life.',0.00,NULL,NULL,1,'[\"3 sessions\\/month\",\"On-call Availability\",\"Text-support\"]','concierge',499.00,3,165.00,1350.00,'agreement-templates/agreement_medical-concierge-program_1762896239.pdf',1,NULL,'2025-11-11 16:12:05','2025-11-11 16:23:59');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('0gG74gDccU8253jLDollxc5rHKWuu0Z1OvdJrgX2',NULL,'3.80.92.244','okhttp/5.3.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWNOcVpCMHVwR2hQeDlCdEVPS09WRUdhNWRvMFRtMXhOeDR5WmFMdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765574146),('3C4xThQdZxoRoAw7AiZDNi4gwGLll5tTNGOgSMtd',NULL,'104.37.46.42','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.35/36 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoidXNCMkJLZHNmVWNkWGhna2xOZzI4cExqbkk1RzY4aVpJN2FqOWdRNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765572780),('3Fs3alg5TYf8eSD5yqe0RszHeeKRGPb4lGSZbCKI',NULL,'68.183.9.16','Mozilla/5.0 (l9scan/2.0.3373e22313e27393e21333; +https://leakix.net)','YTozOntzOjY6Il90b2tlbiI7czo0MDoidTAzcGJ3QVV3UUNqS0ZVenhvZDV2VXpwT3ZoVjcxbTZ2ZnFRVzZtZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765572747),('6d2dMr7ekFvb45eEifpa9w7ve45w5inhTaiz8Hbj',NULL,'65.87.7.112','Mozilla/5.0 (compatible; Let\'s Encrypt validation server; +https://www.letsencrypt.org)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiYzNGZG1iOFBSV1pBRHlveXlvWU1GNXYzMUtkeUZyVExqTWpzOG9pYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765572740),('81pvZkhQFBRUM7rPVfUG6oydMjLFs5lC4naEmcng',NULL,'104.252.110.113','Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/138.0.7204.156 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0NVaGRBTjNDQ1dsU1hJTlpjNDdOTWN0NlhEYk5DZzl3MTJSOFBvZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765572989),('Cd3rn8MY7I21k2abzhK2jrXP3TF4SFDmBzvzhNVJ',NULL,'98.92.248.35','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.7204.23 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicUhuNmlQQ0s1akNYZnR5TjlBSHlUY2t0dVZ3OXVqSDlxVzJGUXFDQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765574163),('cW9TrCmlJC7vFgOzDRBm5Kq9WEG2nfQhQoIofe4c',14,'119.73.97.147','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZFVDanFOQlJpN3ZUUnZHTWhNaTVIaE41VEpDeGVVTWNCNmVDd1hNbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tL2FkbWluL3Byb2dyYW1zL2FwcGxpY2F0aW9ucyI7czo1OiJyb3V0ZSI7czoyNzoiYWRtaW4ucHJvZ3JhbXMuYXBwbGljYXRpb25zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTQ7fQ==',1765575649),('kiCMX1QpzBFEZWJlgc6s6QkL4kc5DluJB5TgtXHj',NULL,'68.183.9.16','Mozilla/5.0 (l9scan/2.0.3373e22313e27393e21333; +https://leakix.net)','YTozOntzOjY6Il90b2tlbiI7czo0MDoieFRGaVZENzRWcHZWYTNFRDNGWkdRbEg2YjA0aERzQldBNmdiVEtueiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tLz9yZXN0X3JvdXRlPSUyRndwJTJGdjIlMkZ1c2VycyUyRiI7czo1OiJyb3V0ZSI7czo3OiJib29raW5nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765572781),('LgSjurEeFZO3Z1pHIa8iqSRoWOmd66Dmy6kxpnDA',NULL,'65.87.7.112','Mozilla/5.0 (compatible; Let\'s Encrypt validation server; +https://www.letsencrypt.org)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXVHT0RzQ3ZRdk9VS1BDV3hISk8zU3prdURVQ2VMNzlsa1ZMc1o1TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765572740),('lhPOP2n9xa1gMNnR6uKhWQljsTXuw7zL3Ct2ewkM',NULL,'38.18.1.203','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.6998.35/36 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQnFLR1h0dVN2aEI0cGk5eXNHTlVvNThqRjNCdHozYVJPcWpmU1E1NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1765572855),('MTeEfoSKOvv65iXzZIVII7I7SGUBcybTMQV5LyXD',NULL,'104.252.110.210','Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/138.0.7204.156 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWVrSjlrdktycDZHT2tMQkZhcndKVnowT1pYc1ptMG01OUIxRXJUdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765572989),('muIInwQdR2TxFDCIonBDNY1CYcmlgCn9EbhXBt5H',NULL,'54.242.209.114','Slackbot-LinkExpanding 1.0 (+https://api.slack.com/robots)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1VtbHZNaXd6T2t1cWM1S2p5eTVzVVhLRnV2bmd5NWlFV1FKcVNaNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765572815),('O1mhfnoZZm8oUS3RBZ4cxjQEPjyTQPXhrKzt3Qmg',NULL,'68.183.9.16','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2tRRXI5UzRDeTFxN0RuVFZIc29DMjBNNVYyZHl2ZmhWY0dReTdoSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765572747),('QGDBNFbU8ZxTVROIyKFKrQMaFgPV27CfAX6OfjNX',NULL,'72.255.58.67','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicTdRTGNYTnhhZ0NaeDI2a2dvQ2ZEYmhDNUU2TjBIWkJxb2plbEZvaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765575175),('Rv7jJHxHzyhouKfiEq0RzkEtTBpouJPJ6FBNBHCE',NULL,'136.114.16.199','Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.2 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibTdTbnhXc1NWWXdVTFFzemRCYUw1V0lya3A3WkFiS1JVa0ZXUHRxSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765574828),('sJBRLJwt8CljeP98uBlQoPQTBVF3oezMF0TfiO9F',NULL,'74.7.241.63','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHNlM1Y4V29pM1FyUHFNVVQ5eGZiVWQ4blZsbTBDbW9Pemo1WnNCZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tL2ZvcmdvdC1wYXNzd29yZCI7czo1OiJyb3V0ZSI7czoxNjoicGFzc3dvcmQucmVxdWVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1765575839),('swKriAyRuZETkCIQMRhRhHPeOAF3erv1CJHlMvgx',NULL,'54.175.35.88','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.7204.23 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUVFNzRlRUd6MWxZNHhrSHhnSEdzWER4enlEeHY1VlZQOVRxZjlLZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765573693),('tdcyA5eZnJS6HAYGTAUoehFP3vvCPkKo74bQEQdi',NULL,'149.102.239.163','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1NXdzRyY0h6MmI0R2hINHJHVnp4MnhxaWx4WlRmM0VFMDJQTFpqQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765572746),('W2q08kxHyOfcNNQWRoiVsd09nAgjCbJDJ8wKqIqz',NULL,'91.196.152.153','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoibzV2TzJnVmZIVERPOVFWelZCSmF3MVNHRGRNVmtYTEoySXliN2gySSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765574732),('WDaZLmJMn5AXoEUVEJrr5muH417aPrSXkxFbBUNk',49,'119.73.97.147','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVm9YbHBxUkFlSUpjSU9IcjlWaDl5T1NrVktaa1A2MUFhVWV4eU5MVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tL2NsaWVudC9wcm9maWxlIjtzOjU6InJvdXRlIjtzOjE0OiJjbGllbnQucHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTg6InJlZ2lzdHJhdGlvbl9lbWFpbCI7czoxNjoiYWxleEB5b3BtYWlsLmNvbSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDk7fQ==',1765575696),('WoGijFgJ0kDtwedtxxldjLo0IEmNytVU9vmUnNmd',NULL,'13.221.207.14','okhttp/5.3.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHMyRFNiRFJ3Z0R1WmtjbXAyc1RzSnl0NUdIbjNXNzhjNzJVMXI5UCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765573659),('xXG97uHn08tqC0KVHUlI3NeodHevI0v71GXvGwoR',NULL,'119.73.97.147','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 AVG/142.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmt4MXpmQWZJV1JjVjJBNk94Sk5EazNvQUk5Q3ppcXdRWHl5VHUyYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765572716),('zKDqbo1hKmL4pGaPh7vshqyJCbSfjqghsXumWhrI',NULL,'119.73.97.147','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 AVG/142.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWt1VnZ1V2x5c1YzNUluWDRwVlJ5YzRFRlFYWTRCWDhZU3kzU3BwMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1765572724);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'stripe_key','pk_live_51ST0g91F3kkgUjOisYZ2UDrYK6PQtxbw4bwZXYpPAftERKkKR10jcwVowC3mhZz2HSvxtoUxKi3XZWutHxb7VVSC009lvYGpiq','stripe','2025-11-19 12:03:38','2025-11-20 23:54:56'),(2,'stripe_secret','STRIPE_KEY_REDACTED_51ST0g91F3kkgUjOii2XpPxA07d4TCtZw7kpvaQYlXuXrBs7pPBYgiziJb6CLzd5oJxQ23Bv7zTE4PNTQM2MgSiYh001bwtTErf','stripe','2025-11-19 12:03:38','2025-11-20 23:54:56'),(3,'stripe_webhook_secret',NULL,'stripe','2025-11-19 12:03:38','2025-11-20 00:03:00'),(4,'mail_mailer','smtp','smtp','2025-11-19 23:10:21','2025-11-19 23:10:21'),(5,'mail_host','mail.lana-amawi.com','smtp','2025-11-19 23:10:21','2025-11-19 23:10:21'),(6,'mail_port','465','smtp','2025-11-19 23:10:21','2025-11-19 23:10:21'),(7,'mail_username','coaching@lana-amawi.com','smtp','2025-11-19 23:10:21','2025-11-19 23:10:21'),(8,'mail_password','P@s$#2026','smtp','2025-11-19 23:10:21','2025-11-19 23:10:21'),(9,'mail_encryption','ssl','smtp','2025-11-19 23:10:21','2025-11-19 23:10:21'),(10,'mail_from_address','coaching@lana-amawi.com','smtp','2025-11-19 23:10:21','2025-11-19 23:10:21'),(11,'mail_from_name','Lana Amawi Coaching','smtp','2025-11-19 23:10:21','2025-11-19 23:10:21');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot_exceptions`
--

DROP TABLE IF EXISTS `slot_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot_exceptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `exception_date` date NOT NULL,
  `booking_type` enum('in-office','virtual','both') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `exception_type` enum('blocked','modified','closed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slot_exceptions_exception_date_booking_type_is_active_index` (`exception_date`,`booking_type`,`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_exceptions`
--

LOCK TABLES `slot_exceptions` WRITE;
/*!40000 ALTER TABLE `slot_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `slot_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot_schedules`
--

DROP TABLE IF EXISTS `slot_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day_of_week` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_type` enum('in-office','virtual') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `slot_duration` int NOT NULL DEFAULT '60',
  `break_duration` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `max_bookings_per_slot` int NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_day_type_time` (`day_of_week`,`booking_type`,`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_schedules`
--

LOCK TABLES `slot_schedules` WRITE;
/*!40000 ALTER TABLE `slot_schedules` DISABLE KEYS */;
INSERT INTO `slot_schedules` VALUES (1,'Default Schedule','monday','virtual','10:00:00','18:00:00',60,0,1,1,'Default availability schedule','2025-09-26 13:56:05','2025-09-26 13:56:05'),(2,'Default Schedule','monday','in-office','18:00:00','21:00:00',60,0,1,1,'Default availability schedule','2025-09-26 13:56:05','2025-09-26 13:56:05'),(3,'Default Schedule','tuesday','in-office','08:30:00','17:00:00',60,0,1,1,'Default availability schedule','2025-09-26 13:56:05','2025-09-26 13:56:05'),(4,'Default Schedule','wednesday','in-office','09:00:00','12:00:00',60,0,1,1,'Default availability schedule','2025-09-26 13:56:05','2025-09-26 13:56:05'),(5,'Default Schedule','wednesday','virtual','12:00:00','17:00:00',60,0,1,1,'Default availability schedule','2025-09-26 13:56:05','2025-09-26 13:56:05'),(6,'Default Schedule','thursday','in-office','09:00:00','12:00:00',60,0,1,1,'Default availability schedule','2025-09-26 13:56:05','2025-09-26 13:56:05'),(7,'Default Schedule','thursday','virtual','12:00:00','17:00:00',60,0,1,1,'Default availability schedule','2025-09-26 13:56:05','2025-09-26 13:56:05'),(8,'Default Schedule','friday','virtual','10:00:00','16:00:00',60,0,1,1,'Default availability schedule','2025-09-26 13:56:05','2025-09-26 13:56:05');
/*!40000 ALTER TABLE `slot_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `program_id` bigint unsigned NOT NULL,
  `subscription_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_price` decimal(10,2) NOT NULL,
  `monthly_sessions` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `starts_at` datetime NOT NULL,
  `ends_at` datetime DEFAULT NULL,
  `next_billing_date` datetime DEFAULT NULL,
  `last_billing_date` datetime DEFAULT NULL,
  `total_bookings_this_month` int NOT NULL DEFAULT '0',
  `subscription_features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_user_id_is_active_index` (`user_id`,`is_active`),
  KEY `subscriptions_program_id_is_active_index` (`program_id`,`is_active`),
  KEY `subscriptions_next_billing_date_index` (`next_billing_date`),
  CONSTRAINT `subscriptions_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_chk_1` CHECK (json_valid(`subscription_features`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_programs`
--

DROP TABLE IF EXISTS `user_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_programs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `program_id` bigint unsigned NOT NULL,
  `status` enum('pending','agreement_sent','agreement_uploaded','approved','payment_requested','payment_completed','active','rejected','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `contract_duration_months` int NOT NULL DEFAULT '3',
  `payment_type` enum('monthly','one_time') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_start_date` date DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `next_payment_date` date DEFAULT NULL,
  `total_payments_due` int NOT NULL DEFAULT '3',
  `payments_completed` int NOT NULL DEFAULT '0',
  `one_time_payment_amount` decimal(10,2) DEFAULT NULL,
  `stripe_customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_subscription_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_price_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_notes` text COLLATE utf8mb4_unicode_ci,
  `agreement_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signed_agreement_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signed_agreement_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agreement_sent_at` timestamp NULL DEFAULT NULL,
  `agreement_uploaded_at` timestamp NULL DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `payment_requested_at` timestamp NULL DEFAULT NULL,
  `payment_completed_at` timestamp NULL DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_programs_user_id_foreign` (`user_id`),
  KEY `user_programs_program_id_foreign` (`program_id`),
  KEY `user_programs_stripe_customer_id_index` (`stripe_customer_id`),
  KEY `user_programs_stripe_subscription_id_index` (`stripe_subscription_id`),
  CONSTRAINT `user_programs_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_programs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_programs`
--

LOCK TABLES `user_programs` WRITE;
/*!40000 ALTER TABLE `user_programs` DISABLE KEYS */;
INSERT INTO `user_programs` VALUES (15,15,15,'cancelled',3,'one_time','2025-11-18','2026-02-18',NULL,3,1,675.00,'cus_TRqCsdWtWaGCwc','sub_1SUyUjLXqt7gmBJh78BszdiA','price_1SUyUiLXqt7gmBJhVXTMijiG','\n\n[PAYMENT COMPLETED & PROGRAM ACTIVATED]\nPayment Type: One-Time\nPayment Method: Stripe (Credit Card)\nAmount: $675.00\nPayment Reference: PAY-SJIVQ4CI-1763509373\nStripe Payment Intent: pi_3SUyXuLXqt7gmBJh0609oDiG\nStripe Charge: ch_3SUyXuLXqt7gmBJh0djl2zNt\nBilling Address: 123 Medical Center Dr, Suite 200, New York, NY 10001, San Antonio, Texas 78222, US\nCompleted: 2025-11-18 23:42:53\n\n[CANCELLED BY CLIENT]\nReason: Testing\nCancelled at: 2025-11-18 23:49:49\nStripe Subscription ID: sub_1SUyUjLXqt7gmBJh78BszdiA','agreements/agreement_15_1763500590.pdf','signed-agreements/signed_agreement_15_1763500619.pdf','student-coaching-program_agreement.pdf','2025-11-18 16:16:31','2025-11-18 16:16:59','2025-11-18 16:18:50',NULL,'2025-11-18 18:42:53',675.00,'PAY-SJIVQ4CI-1763509373','2025-11-18 16:16:30','2025-11-18 18:49:49'),(16,15,16,'active',3,'monthly','2025-11-18','2026-02-18','2025-12-18',3,1,NULL,'cus_TRsWSIWur6r7qi','sub_1SUyl7LXqt7gmBJh050FeTRP','price_1SUyl6LXqt7gmBJhRtBg101n','\n\n[PAYMENT COMPLETED & PROGRAM ACTIVATED]\nPayment Type: Monthly\nPayment Method: Stripe (Credit Card)\nAmount: $399.00\nPayment Reference: PAY-3HIICHRE-1763510194\nStripe Payment Intent: pi_3SUyl9LXqt7gmBJh0vfi1nfw\nStripe Charge: ch_3SUyl9LXqt7gmBJh0SCaCpbc\nStripe Subscription: sub_1SUyl7LXqt7gmBJh050FeTRP\nBilling Address: 123 Medical Center Dr, Suite 200, New York, NY 10001, San Antonio, Texas 78222, US\nCompleted: 2025-11-18 23:56:34','agreements/agreement_16_1763510126.pdf','signed-agreements/signed_agreement_16_1763510145.pdf','student-coaching-program_agreement.pdf','2025-11-18 18:55:26','2025-11-18 18:55:45','2025-11-18 18:55:55',NULL,'2025-11-18 18:56:34',399.00,'PAY-3HIICHRE-1763510194','2025-11-18 18:55:26','2025-11-18 18:56:34'),(17,15,14,'approved',3,NULL,NULL,NULL,NULL,3,0,NULL,NULL,NULL,NULL,NULL,'agreements/agreement_17_1763510301.pdf','signed-agreements/signed_agreement_17_1764019161.pdf','life-coaching_agreement.pdf','2025-11-18 18:58:21','2025-11-24 21:19:21','2025-11-24 21:19:41',NULL,NULL,NULL,NULL,'2025-11-18 18:58:21','2025-11-24 21:19:41'),(18,45,15,'approved',3,NULL,NULL,NULL,NULL,3,0,NULL,NULL,NULL,NULL,NULL,'agreements/agreement_18_1763597166.pdf','signed-agreements/signed_agreement_18_1763597199.pdf','student-coaching-program_agreement.pdf','2025-11-20 00:06:06','2025-11-20 00:06:39','2025-11-20 00:07:04',NULL,NULL,NULL,NULL,'2025-11-20 00:06:06','2025-11-20 00:07:04'),(19,46,14,'approved',3,NULL,NULL,NULL,NULL,3,0,NULL,NULL,NULL,NULL,NULL,'agreements/agreement_19_1763671047.pdf','signed-agreements/signed_agreement_19_1763671058.pdf','life-coaching_agreement.pdf','2025-11-20 20:37:27','2025-11-20 20:37:38','2025-11-20 20:38:12',NULL,NULL,NULL,NULL,'2025-11-20 20:37:27','2025-11-20 20:38:12'),(20,47,16,'active',3,'monthly','2025-11-20','2026-02-20','2025-12-20',3,1,NULL,'cus_TScexvAgdpsrrX','sub_1SVhP8LXqt7gmBJhqtCefahB','price_1SVhP8LXqt7gmBJhrtBmTsfP','\n\n[PAYMENT COMPLETED & PROGRAM ACTIVATED]\nPayment Type: Monthly\nPayment Method: Stripe (Credit Card)\nAmount: $399.00\nPayment Reference: PAY-QVEJXIX7-1763681811\nStripe Payment Intent: pi_3SVhPALXqt7gmBJh1uF37bbR\nStripe Charge: ch_3SVhPALXqt7gmBJh1xL38AG6\nStripe Subscription: sub_1SVhP8LXqt7gmBJhqtCefahB\nBilling Address: Animi officia sequi, Ashburn, VA 20147, US\nCompleted: 2025-11-20 23:36:51','agreements/agreement_20_1763681293.pdf','signed-agreements/signed_agreement_20_1763681310.pdf','relationship-program_agreement.pdf','2025-11-20 23:28:13','2025-11-20 23:28:30','2025-11-20 23:28:50',NULL,'2025-11-20 23:36:51',399.00,'PAY-QVEJXIX7-1763681811','2025-11-20 23:28:13','2025-11-20 23:36:51'),(21,47,14,'active',3,'one_time','2025-11-20','2026-02-20',NULL,3,1,1080.00,'cus_TScmjPZqzVpkCt',NULL,NULL,'\n\n[PAYMENT COMPLETED & PROGRAM ACTIVATED]\nPayment Type: One-Time\nPayment Method: Stripe (Credit Card)\nAmount: $1,080.00\nPayment Reference: PAY-OTNDAD5U-1763682292\nStripe Payment Intent: pi_3SVhWw1F3kkgUjOi1WW7TwaY\nStripe Charge: ch_3SVhWw1F3kkgUjOi1X7ookF3\nBilling Address: Similique consequunt, Ashburn, VA 20147, US\nCompleted: 2025-11-20 23:44:52','agreements/agreement_21_1763682162.pdf','signed-agreements/signed_agreement_21_1763682201.pdf','life-coaching_agreement.pdf','2025-11-20 23:42:42','2025-11-20 23:43:21','2025-11-20 23:43:32',NULL,'2025-11-20 23:44:52',1080.00,'PAY-OTNDAD5U-1763682292','2025-11-20 23:42:42','2025-11-20 23:44:52');
/*!40000 ALTER TABLE `user_programs` ENABLE KEYS */;
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
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female','other','prefer_not_to_say') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `languages_spoken` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `institution_hospital` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_as_of_date` date DEFAULT NULL,
  `specialty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education_institution` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `graduation_date` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `signed_agreement_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signed_agreement_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agreement_uploaded_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  CONSTRAINT `users_chk_1` CHECK (json_valid(`languages_spoken`))
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14,'Admin User','admin@example.com','+1 (555) 000-0000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-08-07 15:03:40','$2y$12$4NOvhn6kqJm/3frH6D181ud0c1WEDLzLuoLHoFiJkFQFT5upBOKbW',1,NULL,NULL,NULL,'1MuOMq04xZMD2IwkyEtl66rnUx8egizjtFohg8NgvDDC5o75pWjhRciPJh39','2025-08-07 15:03:40','2025-11-18 16:18:38'),(15,'Demo User','demo@example.com','+1 (555) 000-0000','123 Medical Center Dr, Suite 200, New York, NY 10001','1985-03-15','female',39,'[\"English\",\"Spanish\"]','New York General Hospital','Cardiologist','2020-01-15','Interventional Cardiology',NULL,'2010-06-15','2025-08-07 15:03:40','$2y$12$yZnjSViyCK3VBS4uC8Ti7..7zm.Shcgr7mxX/vYG6cLQaNMDp/lLW',0,NULL,NULL,NULL,NULL,'2025-08-07 15:03:40','2025-11-18 16:15:06'),(16,'Test User','test@example.com','+1 (555) 000-0000','456 Healthcare Ave, Floor 5, Los Angeles, CA 90210','1982-07-22','male',42,'[\"English\",\"Chinese\",\"French\"]','Cedars-Sinai Medical Center','Emergency Medicine Physician','2018-09-01','Emergency Medicine',NULL,'2008-05-20','2025-08-07 15:03:41','$2y$12$YCLznGXTvzWku2zqROdwFexXTqztB83EioioIm9DqxVzekFRePLly',0,NULL,NULL,NULL,NULL,'2025-08-07 15:03:41','2025-09-13 21:38:56'),(38,'Lareina Love','hiqos@mailinator.com','+1 (414) 201-6348','Nemo qui commodi pos','2001-12-30','female',42,'[\"English\",\"French\",\"Other\"]','Qui sed et sunt occa','Fugit distinctio F','1991-07-18','Fugiat eligendi qui',NULL,'1970-01-17',NULL,'$2y$12$Hs//s07LotAOyZqr88rZNelVr3hNw1mxI0k8rZXuCNMDiu1s1JrQu',0,NULL,NULL,NULL,NULL,'2025-09-16 13:22:07','2025-09-16 13:22:07'),(39,'Brittany Sparks','wytebypora@mailinator.com','+1 (868) 576-5411','Sit vel at voluptate','2016-02-05','other',73,'[\"English\",\"French\",\"Mandarin Chinese\",\"Japanese\",\"Other\"]','Eveniet ad molestia','In doloremque commod','1982-03-12','Natus suscipit nulla',NULL,'1993-12-12',NULL,'$2y$12$20uHo5NVPytw0Mgkzfs5DOriGlIdjZlYLkuDBjpWGJf/oXzqysaUe',0,NULL,NULL,NULL,NULL,'2025-09-18 18:24:41','2025-09-18 18:24:41'),(40,'Megan Weeks','decute@mailinator.com','+1 (161) 675-3869','Dolor ex voluptate m','1978-12-14','male',60,'[\"English\",\"French\",\"Spanish\",\"Mandarin Chinese\",\"Japanese\",\"Vietnamese\",\"Other\"]','Velit ea commodo su','Molestiae accusantiu','1973-08-10','Exercitation alias e','Accusantium ut nostr','2012-07-17',NULL,'$2y$12$e25lvl9wrkFoHszfdyauOexwrGV40aUqwXOHifMLS9CNtV9TTQ5/W',0,NULL,NULL,NULL,NULL,'2025-09-18 18:36:02','2025-09-18 18:36:02'),(41,'Cadman Beard','pykyfapu@mailinator.com','+1 (861) 822-7781','Eos pariatur Ut la','2005-05-05','male',42,'[\"English\",\"Arabic\",\"French\",\"Spanish\",\"Mandarin Chinese\",\"German\",\"Japanese\",\"Vietnamese\",\"Other\"]','Eius ea reiciendis t','Sint necessitatibus','1978-05-02','Do quo impedit sunt','Eaque consequat Inv','2020-09-28',NULL,'$2y$12$.7MiNwidN9XcQtihdVzjj.a6wX.RVf8OPkeqwpRurTzxJfqM4A2qy',0,NULL,NULL,NULL,NULL,'2025-09-29 15:26:35','2025-09-29 15:26:35'),(42,'Oleg Wyatt','gowowady@mailinator.com','+1 (997) 522-3529','Tempore beatae cill','2013-03-12','prefer_not_to_say',30,'[\"German\",\"Vietnamese\"]','Tempora quia volupta','Sit quia beatae rep','1973-05-05','Atque ex rerum et cu','Do est commodi asper','2004-10-01',NULL,'$2y$12$aSFXXeffv82YlNwSdlBTfOgbi7i8gyQhY.CAUzkP0oWclAFyG6uQW',0,NULL,NULL,NULL,NULL,'2025-10-09 13:06:57','2025-10-09 13:06:57'),(43,'Mercedes Wilcox','sesy@mailinator.com','+1 (243) 953-8292','Sunt modi veniam in','1991-12-21','female',91,'[\"English\",\"German\"]','Aute autem delectus','Dolor id ea ipsum p','1980-12-28','Nihil maxime vel atq','Quis et et proident','2018-03-20',NULL,'$2y$12$pPHrNCXsts0Ql3hDz6Pef.i1EeiMbGQeNEnQM6CgS4F36oeEsU0Dq',0,NULL,NULL,NULL,NULL,'2025-10-09 13:29:00','2025-10-09 13:29:00'),(44,'Xandra Hess','lexari4926@delaeb.com','+1 (318) 872-2087','Temporibus dignissim','1999-02-21','other',26,'[\"English\",\"Arabic\",\"Mandarin Chinese\",\"German\",\"Japanese\",\"Other\"]','Occaecat itaque labo','Accusamus perferendi','1983-11-25','Culpa assumenda lab','Rerum cupidatat rem','1981-12-22',NULL,'$2y$12$ozqh9aq9aZnNQxuM.kO4q.VMgTKXbOo02eyGbple3nbyKtUqg18p.',0,NULL,NULL,NULL,NULL,'2025-11-19 23:12:17','2025-11-19 23:12:17'),(45,'Dai Cantu','production8430@gmail.com','+1 (903) 449-1587','Qui cupidatat magni','2013-01-23','female',99,'[\"Arabic\",\"Japanese\",\"Vietnamese\",\"Other\"]','Vel sapiente quia do','Tempore et nulla hi','2014-05-07','Optio cillum natus','Aliquid enim deserun','1981-04-06',NULL,'$2y$12$cHtZ.Cf6mZxkmt4DnuT6Ie.lnR4kvzGxg0x8QMvWA4DDv0bSAEteu',0,NULL,NULL,NULL,NULL,'2025-11-20 00:04:09','2025-11-20 00:04:09'),(46,'Neville Schroeder','willauxefrije-8765@yopmail.com','+1 (644) 371-7633','Aspernatur unde sed','1999-01-16','female',49,'[\"Arabic\",\"Mandarin Chinese\",\"German\"]','Tempor doloremque el','Molestiae animi eos','1981-03-14','Atque ducimus corpo','Deserunt aut soluta','2012-11-24',NULL,'$2y$12$LauPwSzlmTjMsGGGR5jlwuYM40cNuJxdzBnJ5rWykbNNaOdZO42Q6',0,NULL,NULL,NULL,NULL,'2025-11-20 20:36:40','2025-11-20 20:36:40'),(47,'Debra Nunez','john@yopmail.com','+1 (333) 914-4086','Similique consequunt','1992-05-30','other',51,'[\"Arabic\",\"French\",\"Spanish\",\"Japanese\"]','Accusantium pariatur','Quis quia corrupti','1971-05-13','Est velit impedit','Natus consectetur la','2014-06-23',NULL,'$2y$12$DlGaWsnPPPHU7Yrdewh9q.EZR7JgT/qEv9O.nRKNcOW8loTLImRQq',0,NULL,NULL,NULL,'oioxGPSYf1cEdbYaaMRO0EEhd8BYq6kYrDf0ozJY4aeTOQZ3grahmWfbIb3o','2025-11-20 23:26:58','2025-11-20 23:40:49'),(48,'Xavier Finley','meqavete@mailinator.com','+1 (633) 635-4304','Sunt tempora quisqu','1990-10-28','other',55,'[\"English\",\"Arabic\",\"French\",\"German\",\"Japanese\",\"Vietnamese\"]','Ad commodi adipisci','Quasi natus quis nos','1982-09-13','Nisi velit qui nostr','Sit officia saepe ve','1985-05-14',NULL,'$2y$12$57S1lACAJ3iz4jdK8chRH.fMDZDiiVmSZXmSBwmRTJbfTcT6Ef/P2',0,NULL,NULL,NULL,NULL,'2025-12-12 20:53:12','2025-12-12 20:53:12'),(49,'Oprah Rogers','alex@yopmail.com','+1 (758) 516-1768','Quibusdam eum except','1985-11-10','prefer_not_to_say',97,'[\"Arabic\",\"German\"]','Unde illo voluptas d','Voluptas pariatur C','2013-03-11','Commodi aut officiis','Laborum commodo cons','1986-12-22',NULL,'$2y$12$pj12vk8wFs/jlVbkIgyR8OI2bKlspgnMyV12/xesDspRsAOSSjhSS',0,NULL,NULL,NULL,NULL,'2025-12-12 21:37:49','2025-12-12 21:37:49');
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

-- Dump completed on 2026-01-26 16:31:12
