-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: lana_amawi_new
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (7,44,'Hello testing 1, 2, 3',NULL,NULL,NULL,NULL,'admin',0,'2025-12-19 11:23:10','2025-12-19 11:23:10');
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
INSERT INTO `password_reset_tokens` VALUES ('admin@lana-amawi.com','$2y$12$OjKN.FnrI5LeOiMS86zOx..z7DAL6UGzKsrun.rgYjcQHVavFTEku','2025-12-15 18:43:20'),('production8421@gmail.com','$2y$12$ofi274XanmlhjbhebWktmO7mkZpDueeitXGmnlxBlqHk7ySK2O/UC','2025-12-29 19:52:05');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('03d3cfCYbFewu1qsqsJZjRotfbeHbNCKtuj2AGOj',NULL,'146.70.119.7','Mozilla/5.0 (Windows NT 10.0; Win64; x64)','YTozOntzOjY6Il90b2tlbiI7czo0MDoicjB2UkpUTU1wT01oTVh4RmxCMTRiTkNvbGRrZGpoVnBUbEFLbmVYUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768776448),('16WzGIKOaZRqiwwLL3dH918KaBylA9SPK2uLKUAn',NULL,'149.57.180.159','Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3V0dERUbDIwWEhzaXZhMkZQNDk1cXBKZ0ZHY3BMdmh0TmpTM0J6TyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768186053),('1Ly4GfFuylH5boP9242tkmcimhkQutwo8GzMHLps',NULL,'74.7.227.56','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoidlhnN1BLbWxwYmxYYXNTcEZBTk5CUmxwMXA3STZ2bXpDR3ZFTElKdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767523920),('2gkPBTkbu6PtAHUAfRiCHYNVncHbYAw9tOYQejmA',NULL,'18.143.151.190','Apache/2.4.34 (Ubuntu) OpenSSL/1.1.1 (internal dummy connection)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUWVzRGpRVzNvclY5OERNUTdPSDQ1ckdIc0dxb3V3MVNuQ3pjSVkyNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769068483),('2OBFFEyqOfmuKlpveTwksS6FwSu7LWUukWDJXzLj',NULL,'159.89.170.11','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUdpVXVRZ0VSQ0g5Y250ZVQ3T1hEcGlVVWhGUDBVVEJzRnFsc1NKUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767247364),('2OWlrMDJdTo09lP7cVoxmyQVHDRyC2K78ZGxzuuV',NULL,'74.7.241.33','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWF3eVhMTm16dXlHMDQ1YjZqU1RxRzhjM2ZmeWI3NUNGQzNBNXBwZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767534024),('3NIFkilNokJKQIe5KbjjStlIE12y6O0RW8XWH8I4',NULL,'159.65.157.36','Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoibjh4c0hSTmlTZjRDSGV4SkY4U2d2M0E3TXpMb09VcmxhREhkeFFQZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768526332),('3qWW11ORzSSxwgTn9uAAsmMudVN82W2SL8ZYRHnO',NULL,'149.57.180.160','Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3JDUVpDN2ZWT0VSS1Rlc3E1R1F1Mm83RklVS3p4c3FEYW1TODR5ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768193325),('5SYp0dO36a9ro42geEEBajXluhLOt6ot8ad0vREP',NULL,'23.180.120.132','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 Chrome/122.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVJvRXlnSGpacVVtcXFEZ3F6Y3RlanF2cDNLMU5iU2QyYWM3S2JOZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768848141),('65IXKOVOu0D3gaYW3A77JDoIr8qC3bYEv0HNHhyg',NULL,'119.73.104.45','WhatsApp/2.23.20.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGhPUmxDSDh0ZlczYVN6dmpYcWdFcXFkamJDN0RDRFpDdmlRbG1neSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767714344),('8HydMJZsLaTzxd1k700hu6ps2p0KSEws8vlVPcTz',NULL,'172.121.218.104','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWxldVF3eUpHOU9oT0xsUUlxS3dFNElraTA0SlQ2ZVRyZnF3cDAzZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767717147),('9bjmHT7s1HCUuDm5wtqjkTU3e6sCgkcTEmroUkbW',NULL,'74.7.242.1','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2Q0NDRLNHoxajFmcXduNFVFUGZEdmxWbHpxN0VReTFVcldRWnNrYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767934887),('BhKKeeEovc01phcNDPHe5nbqhFWoLfv8fW8zAWc5',NULL,'84.254.106.197','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0Vmam5kSzFKRTNJeFBKb1AzNVNaazJnZkUxVWViTk5CQXlQMlZNeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767389571),('bxjPrAmRLdpCzVC8mvnkbXAoTgBIKXSmXmgkre5U',NULL,'18.143.151.190','Apache/2.4.34 (Ubuntu) OpenSSL/1.1.1 (internal dummy connection)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSXZ2N3ZHaUVNeEprSjVWb2txak9BVWhWQkV0RGxBMVJsTktGc2NzWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1768497415),('d058aIfKhvVX8KnbxJ6zoji9YSgS5a2yVtGU5dX0',NULL,'52.221.222.154','Apache/2.4.34 (Ubuntu) OpenSSL/1.1.1 (internal dummy connection)','YToyOntzOjY6Il90b2tlbiI7czo0MDoidFhJREFCbGZXem9PWmJIb2F4TjRqNERhWmVLSlBDdnZ6YlN3MTZXcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769119278),('D2EK5x5zxJ5esX0h8ERmsSkGKD6NnpNSxn9CjsYB',NULL,'44.220.192.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjVoR05lZjBvYWp2T05Jc0hDOGJOd0ttbXAwMzlDVlc2bWU1WWZPRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1769208866),('du8HHRDHg6pKxADNBsIEVwGv2D92nKSYPTP3Bmi0',NULL,'162.142.125.193','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkVvUEtlUkdJb1dnU003NXR5YU93S2htTFhsWUJoeDhOaXMyZjc2WCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1769184498),('EhWV1hYDuuxg4hljQxMhba9EOGQtSJxZ0mgMfce0',NULL,'174.129.9.123','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoicmdsZVNjZ29kOGt2OTVwZHBrNFJ2UUtWQmNBZXFVTGZZSFNNbTl1dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767161996),('EhyYwYu32QQztw7hhd9zbyIiSbfekJzrH7EaddY6',NULL,'146.70.119.7','Mozilla/5.0 (Windows NT 10.0; Win64; x64)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU5yWktnaG1PTnBqdHlLU1JqVndaNHR3c0k2enFCek8yTkcxZjBIRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768776448),('f70QJALWfIVmWKMWMVjwf8bgCULPVs1inUAnIrLm',NULL,'104.232.39.64','Mozilla/5.0 (Macintosh; Intel Mac OS X 14_2_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoid3NLTFhKVFF1S1RRQURxOVV5VXlFOTh3SjFKZG84YVN5RHdsU3hQMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tL2ZvcmdvdC1wYXNzd29yZCI7czo1OiJyb3V0ZSI7czoxNjoicGFzc3dvcmQucmVxdWVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1769004677),('fkicDqu2qszcELm78fmwfPLoNVdsgquhtXKyKj50',14,'185.187.243.81','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSFA0eXlaWkQ3a0ppMGRtSGRhd1lxejJUMEt6anFnTjFOc2swOHcydiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tL2NsaWVudC9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMjoiY2xpZW50LmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTQ7czoxODoicmVnaXN0cmF0aW9uX2VtYWlsIjtzOjI0OiJwcm9kdWN0aW9uODQyNEBnbWFpbC5jb20iO30=',1767038326),('gs6U5xhG2BmvdOPbrnHIRPrwvpL4eEnxj38xIJYc',NULL,'185.177.72.70','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmkyQVJIUVlHTUJmdnFUd29FajlFNFlOTDZGQkQ3QkpINGRlMjNGZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768315109),('h0K4tdMfyAVDAfXj5FE1OEXAheaa9EoBkkzATUra',NULL,'157.245.174.16','python-requests/2.32.5','YToyOntzOjY6Il90b2tlbiI7czo0MDoiaVdmaW56M3FjZnVKa3lmd1c5d2NBbHhDRTdaSVIyb3hiY1NtbThOTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1768726101),('HmzzArkVWQi1dJZSU0arL9LJUYvZ6euHq1RuwYaT',NULL,'174.138.24.103','Apache/2.4.34 (Ubuntu) OpenSSL/1.1.1 (internal dummy connection)','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQkViblBQUVF1QmdTdGZ3YWFPM2dHRWswaDdsSERQWUlnVTlQSXRlMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1768399170),('hzJRpBkAL38kIFTrISziC8VBqDUgx1v4VwXjmdMP',NULL,'34.118.122.191','Mozilla/5.0 (iPhone13,2; U; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Mobile/15E148 Safari/602.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoidXBxZDBXVlpaNVl3bHdSQm5GT1VySTNSQmJmaU50Q09HazZWaGJDViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768019910),('IgiWvZRd2k78EW3r4G6dROYhcfiYZtnMhglrKqHN',NULL,'44.220.192.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTFEVFA5Zk4wZnVQa1NCT1pHREhTZmFkOFRVazVYNWFQTEtsUWtMciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1769208852),('IinDKJ0Ao3sUJq14MVNP1aEvgJCdFasxGW6hPco1',NULL,'157.245.124.171','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3BxNUpManV2aGVQcTNUZWJmVFE1WWFQYmlEMmdsQmhNWXpFVXpnaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768479666),('IK7eXBQM1T1ygvzLJIqxkUBTK2pE7SMJg1czfFZn',NULL,'64.225.24.120','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUFTU0ljTlVZZ0Z5NDBOeUFicURibTROd1RSWm40TnlHd0h2b21XbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767394644),('IoUOmzPPNLUpOMp50R5YPtf78kb5L4PFq34jTQuP',NULL,'199.45.155.81','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmlpRVBSdml4TTVjMkp1RjlUdXhLc3pqMGlBTnZ4ck9sT2U5NWNTUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767292728),('ip9lXvQVhVQQRryZfhLsu58m6xZjr9soVen8kBqQ',NULL,'205.210.31.162','','YTozOntzOjY6Il90b2tlbiI7czo0MDoieXJQSWFkRFpvcUxnOEN4a054SnNqa3ZFNWhvQmJZMGJEdHpwYkhCdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767405857),('iwTw0zdo2xEnEy6vbXMxnbUzdtUA2BoKLfjPB0m7',NULL,'124.29.253.147','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmFMeGk3N2ZOSE9na3NNUlM5Y1dSUWZCMW9QYkJVRmUyTUdzNDdGUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768660992),('ixVsZd6MYYx7aZnditGEDQsMwh9nuex5Hh8lepgl',NULL,'205.169.39.15','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiakt6ZE5kYmVQQkh4UWd3ZWRrUXpsRzNYdXBoaWNkREVKalUxMnRydCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768019855),('j8mM3v6z41WW9rjBxHZq4FAGp8DB9IHLSzehUNAl',NULL,'162.142.125.126','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3ZFV3d4aFF0V1FLREU5bW11aEdrTDJYNlhHRDh1aFA5YndmQjhZUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767924779),('jzdE7yLBY4wEm86KHFIsBhIidAGBBvymP4qfQcY5',NULL,'54.74.7.89','Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGZBZnJra2E3T1pVZzZ1TDhzdEt6d3YzMWtCZWxNRTJ6RXl4ZnQ2bSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767931011),('kuX2LhD44cX2A8VlprWV8TXzw94ilHpvUPcTnSvU',NULL,'34.90.118.162','Scrapy/2.13.4 (+https://scrapy.org)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3NZak5hSzQ3UW5IbDBWcm1zbGpqSVgxTnZibUpnU0NrZ2FndGc0RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768890533),('l6PRqRqMJtWCnXjwtInrKrs8vikZULHHM9bvkZNw',NULL,'172.121.218.104','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0','YToyOntzOjY6Il90b2tlbiI7czo0MDoicVN2SDNCZVNNcUZpYjRXRWtiVlViMktMMldIaVVlWkFwdEtjc0dzcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1767717145),('Lq3QQpL9ehDG7SjqKjA81Ze4U64wDKkNb9a92nRW',NULL,'74.7.243.197','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoibW1XSjcyWEhxbEdvWWRCN0M5TnNRUjlGbkdMMzNURzhWM09yRlJ5SyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767757461),('mYzxiAuKuHDFYQcSgg5MzueaysetC5eQanRjiTbe',NULL,'74.7.227.169','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0dRZDV5RDVLNEdoNWZQZlE0NHA5QXZNeVVqWGdkVEZadXJtb1BsdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768919684),('nzIznE0Vxixs6PKp7KIPelMODcz3Eaqo23Xj8CD4',NULL,'66.132.159.243','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmJPdlB1QlRoR3RxRXRSbFU1RWNYOWZvd05Vd2FJU2FPNGxMUUd1MiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767096429),('OCPeIXJWHix8LGO5dQPZMwJa5JHhjLQJzeRUwspY',NULL,'172.121.220.41','Mozilla/5.0 (Macintosh; Intel Mac OS X 14_2_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3pRUnptT1JieWk3UldHcEk1cGc4NHhDeE5KcEhRZzl5T3FhTnRVRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tL2ZvcmdvdC1wYXNzd29yZCI7czo1OiJyb3V0ZSI7czoxNjoicGFzc3dvcmQucmVxdWVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1767717167),('oeWD5z3jYBNMvwKLRFi4iigB6RNL47PhJ20so2ev',NULL,'3.143.239.75','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibWg3QzhpeUZyQzNWTk55VDZjYmxDT29IS0Q1cFV0WEczblVZQURwSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768867176),('OU6lKEM8Y7LjjGcXbpbU8zP5MluURaL4sdzivs1I',NULL,'3.143.239.75','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk1rT3Y5N3MyQ3BOZWQ3aXFOTnJBaXg0UU5XbVlsZ29BbVFwMnJ6YiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768867159),('pVCvJfescCLDdcuf68JVh1KBMdR4IOZeGFZPfaPt',NULL,'162.142.125.34','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnJkdDc1MTFpMkxoNDQ3M1dwM2QyRUk3ckZhWlhwS1lkMUQyeW1JaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1769049435),('qbSjDbRsMDHK3EdIyTAEvOuDlhsXmNhZdqM3sRFn',NULL,'165.227.120.122','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTG9GNVVicjVubG1NR0pkb3gxS2Y4a1BvVXVRSWJENzVlUHRqVkNLRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767375724),('qBSNIQdqoXxiYlLDVf2IWoZObLG7fMEIggCYkOWU',NULL,'162.142.125.43','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGFtbTVLdnBQUzJhc1R3UFN4R1c2cjc5U1pUNGZXeUpSSndqdVZqYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768402304),('Qj2P5RCQrILnj9IgFDd1QrFTRzEoO3Ef8XZ6edON',NULL,'18.220.246.167','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEZPeGJoc2J5a0JxWjV0cW9iVUFzeXpseDZFVUdaeXc0MmNOcDV5SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1769064712),('qnSdQz2qgfdoR7cYDl4vTfiR3z3vKSUGlCtWCOaz',NULL,'74.7.243.241','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDNGZjlPbnlOSkMwMmtqbTVwT2x3RmxuZ3VHSzZyNUhiRTcxZWt1VyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767260441),('qTgM9olAjshVpHMaazGlGqzonNVGZiKHN58VlzmV',NULL,'119.73.104.45','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoickUzcU5Yd1J0N2pJaDlBOXZTY2NXZ0JuMllVbGhRUzUzTnI1VllnbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767714217),('rGTRGpZYbiMY8va82PVRO581NXRWwH7n02uBLf3W',NULL,'3.231.70.17','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicGRhdkhyMk1udk11aEVzc0dtcGp4SGpOSmYxSFFDY01rdXVORTlBWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767193264),('Tat37Vvg3Q2rnKPYi3S9yLsWi1GAjOrpaFhzorlf',NULL,'198.235.24.171','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3ExWllBd1FnSzg1VFlJQ1Q2RE1rZFd6d3BiQk80RE1OUlFqY1ZNaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767451228),('uzwCPjOH8LYb2lroWfIYMSr1rruPZlo7aqb14Vrq',NULL,'34.132.203.215','Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEtEVWRGamg1aXZHQk9oSE5oUjBqa05GZzZJeFg2UlJObVd0VjVwRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767976362),('V31BGZNUYqXb608nI4Yo2R090ImKHryo0PoitJoE',NULL,'167.94.138.123','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlpGMld3Tk9FenJsRVFScTBxSXlmWXB6SEpiYkRsSGdmamRaM0pGTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767744668),('vEkrFpnJM9efA8He2rQFeW3SUgrBob7GmxArC87A',NULL,'35.196.251.43','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR21uSmxvQlJGTFdSQlpDOEhkVW9LVDBzamtBaVhtSW9MejZHWm8yWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767958839),('VYLVdDeEhlZ4LbQkxPlYwL8EibQk7w0jRk94mSiO',NULL,'74.7.242.17','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXRxTkI1WDNMZ0FPTzN1Z21VRkUyQ0ZLOXVBMU8wUG95a3MxYjAweCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767959970),('WG0adNjCocWCTdgNGfy3dHQCdHvpi6xEccnqRjHO',NULL,'205.169.39.159','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkxlNVNnd2JBTFBIY3NnSTg3ZXBWenBMQklCSkRtZVNyYWtyckRubyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768019839),('WRMU41fur1bIEkoMJR9pIbt5q86iqr4XNcuZLz0P',NULL,'52.44.83.142','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieHpSNlFoVm9XTjNBUVpxWjdsVFJXaW4wdFR1aUNYd2hVcm9jalF3TiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767201740),('wxY8RKADFkIzNWnaBckKgIM8AYDiZZwgtX36YBMC',NULL,'3.250.73.194','Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2Y1TThTb3RMNGhBS0k2SkJGc0xwRGY2enJCQ0JSNlRyMVRGZW84byI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767394811),('XEasJDow7lWJQmc00CvmVsLE6TEkYjH1Xg9afHUK',NULL,'18.220.246.167','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidmk1Vmg3UUhsVXpxYmdzOTZMVWRLWndNbW1SZ2xwR0poSnU1V2tGcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1769064725),('xiZEG7TqhLMwYTMdtydGTE5qknTAIak97j5rIpcD',NULL,'100.29.119.42','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/109.0.5414.119 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic1VqMzBvNUhhN2F1ZzQ2Z0RrRTZKbkJscmthRFRRYVpTWUg4djhETCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767151007),('xnO31AKQP3tSeYXEInBzSVNWrM8zwQEer4JUi11O',NULL,'205.169.39.159','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUtUR1BFRENId3RPVmViamdrMnU0TnN5NGl0VGtNc0NqQU1EU2pLMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768019843),('Yyut2UXZ7nzqWh1aUFImEtcMNMLMJ4jE6sBSyqf7',NULL,'54.78.7.151','Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXJVYTFIYUI4dWQ0NVpkeGNiNkVMOTlMemRHV1k2SG1rUkQ0WkJNeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vbGFuYS1hbWF3aS5zaXRlc3RhZ2luZ2xpbmsuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767396311),('z1SifGSNegJHL3vJXEbHaiPVqrYU63AUo5xtkN6u',NULL,'104.248.12.26','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTlkcnZjRHEyWjNJY1VLRkUySW9PVE5VOGpRNkVNajlESDdrMmVXVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767386696),('Zr5ZKgBw7CTvaCaEKSTquFqzZNQuPx1tg17cOTrx',NULL,'74.7.241.0','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFRET2t0R3RCaDlUYllqdk9MdlBRZ1BIYXp0M2RJSUhydWJLcFA3OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767273466),('ZsJ6VmroAc3lq51vqgToqOLEGogkS7naBgM7sIli',NULL,'162.142.125.126','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzV6cElqU2FKNzVIcWRqb3c1eldpTXFUY1N6WTFPQXpMVktjTTZjaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHBzOi8vcG9ydGFsLmxhbmEtYW1hd2kuY29tIjtzOjU6InJvdXRlIjtzOjc6ImJvb2tpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1768548028);
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
INSERT INTO `settings` VALUES (1,'stripe_key','YOUR_STRIPE_PUBLISHABLE_KEY_HERE','stripe','2025-11-19 12:03:38','2025-11-19 12:03:38'),(2,'stripe_secret','YOUR_STRIPE_SECRET_KEY_HERE','stripe','2025-11-19 12:03:38','2025-11-19 12:03:38'),(3,'stripe_webhook_secret','YOUR_STRIPE_WEBHOOK_SECRET_HERE','stripe','2025-11-19 12:03:38','2025-11-19 12:03:38'),(4,'mail_mailer','smtp','smtp','2025-12-19 11:41:50','2025-12-19 11:41:50'),(5,'mail_host','smtp.office365.com','smtp','2025-12-19 11:41:50','2025-12-29 19:51:40'),(6,'mail_port','587','smtp','2025-12-19 11:41:50','2025-12-29 19:51:40'),(7,'mail_username','info@homefrontfacilityservices.com','smtp','2025-12-19 11:41:50','2025-12-29 19:51:40'),(8,'mail_password','HomeFront1$1','smtp','2025-12-19 11:41:50','2025-12-29 19:51:40'),(9,'mail_encryption','tls','smtp','2025-12-19 11:41:50','2025-12-29 19:51:40'),(10,'mail_from_address','noreply@lana-amawi.com','smtp','2025-12-19 11:41:50','2025-12-19 11:41:50'),(11,'mail_from_name','Lana Amawi On-Call Medical Coaching','smtp','2025-12-19 11:41:50','2025-12-19 11:41:50');
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
INSERT INTO `slot_schedules` VALUES (1,'Default Schedule','monday','virtual','06:00:00','20:00:00',60,0,1,6,'Default availability schedule','2025-09-26 13:56:05','2025-12-19 11:30:35'),(2,'Default Schedule','monday','in-office','18:00:00','21:00:00',60,0,1,3,'Default availability schedule','2025-09-26 13:56:05','2025-12-19 11:32:44'),(3,'Default Schedule','tuesday','in-office','08:30:00','20:00:00',60,0,1,1,'Default availability schedule','2025-09-26 13:56:05','2025-12-19 11:31:31'),(4,'Default Schedule','wednesday','virtual','06:00:00','20:00:00',60,0,1,7,'Default availability schedule','2025-09-26 13:56:05','2025-12-19 11:30:58'),(6,'Default Schedule','thursday','in-office','09:00:00','12:00:00',60,0,1,3,'Default availability schedule','2025-09-26 13:56:05','2025-12-19 11:32:35'),(7,'Default Schedule','thursday','virtual','08:00:00','17:00:00',60,0,1,6,'Default availability schedule','2025-09-26 13:56:05','2025-12-19 11:32:20'),(8,'Default Schedule','friday','virtual','06:00:00','16:00:00',60,0,1,5,'Default availability schedule','2025-09-26 13:56:05','2025-12-19 11:33:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_programs`
--

LOCK TABLES `user_programs` WRITE;
/*!40000 ALTER TABLE `user_programs` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14,'Admin User','lana@lana-amawi.com','+1 (555) 000-0000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-08-07 15:03:40','$2y$12$4NOvhn6kqJm/3frH6D181ud0c1WEDLzLuoLHoFiJkFQFT5upBOKbW',1,NULL,NULL,NULL,'KFtV5IwDk1XwzxsOU4zCDWKputvvCCqxYU7iLcMCNARpOz62r6Kn9WPnyAY3','2025-08-07 15:03:40','2025-11-18 16:18:38'),(44,'Lana Amawi','lanacle17@icloud.com','2165987593','29744 Center Ridge Road','1972-04-24','female',53,'[\"English\",\"Arabic\"]','Westlake Hospital','Social work','2023-05-01','medical','Case Western Reserve University','1999-08-25',NULL,'$2y$12$LksjNAo8Rmhhev5I98.NpeTqpMNbdFTa7gy7XXTjzcwyCX0wlTWKO',0,NULL,NULL,NULL,NULL,'2025-12-19 11:14:20','2025-12-19 11:14:20'),(45,'Velma Clark','baxova@yopmail.com','+1 (527) 118-4287','Voluptatibus ipsum s','2014-02-07','female',68,'[\"Arabic\",\"French\",\"Spanish\",\"Japanese\",\"Other\"]','Labore aliqua Dolor','Nisi alias adipisci','2017-09-23','Ab libero ipsum ea N','Rerum unde quis cupi','1973-04-25',NULL,'$2y$12$XukyW8ar3U57kLmtAeepFuNrkPYA8MUSn9PmWZkHpzfnCwAMVRp8K',0,NULL,NULL,NULL,NULL,'2025-12-24 18:01:27','2025-12-24 18:01:27'),(46,'testUser','production8421@gmail.com','+1234567890','abcd','1999-01-01','male',26,'[\"English\"]','abc','abc','2025-12-01','abc','abc',NULL,NULL,'$2y$12$gqhUOWP8/3iJIYT9KnMHPuYgfyhSvgZkPxBnbJlYQLPGYlG1X8pIa',0,NULL,NULL,NULL,NULL,'2025-12-29 19:31:44','2025-12-29 19:31:44'),(47,'testUser','production8413@gmail.com','+1234567890','abcd','1990-01-01','male',35,'[\"English\"]','abc','abc','2025-12-01','abc','abc',NULL,NULL,'$2y$12$Q9J283mRPkCRWNr2B4ErOuhWYY.XuMRTTzuxeAUOo6z0kFmVKcNSe',0,NULL,NULL,NULL,NULL,'2025-12-29 19:53:32','2025-12-29 19:53:32'),(48,'testUser12','production8424@gmail.com','+1234567890','abcd','1990-01-01','male',35,'[\"English\"]','abc','abc','2025-12-01','abc','abc',NULL,NULL,'$2y$12$gAfWvaRQS11IOVqlPknpAuTkyXCb2NHgPNQv.UyRb9GryQCj2bCOC',0,NULL,NULL,NULL,NULL,'2025-12-29 19:58:25','2025-12-29 19:58:25');
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

-- Dump completed on 2026-01-26 16:31:59
