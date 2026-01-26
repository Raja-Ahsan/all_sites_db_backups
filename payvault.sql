-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: payvault
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
-- Table structure for table `ach_transactions`
--

DROP TABLE IF EXISTS `ach_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ach_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payroll_run_id` bigint unsigned NOT NULL,
  `bank_account_id` bigint unsigned NOT NULL,
  `transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `ach_batch_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','failed','reversed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status_message` text COLLATE utf8mb4_unicode_ci,
  `processed_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `processor_response` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ach_transactions_payroll_run_id_foreign` (`payroll_run_id`),
  KEY `ach_transactions_bank_account_id_foreign` (`bank_account_id`),
  CONSTRAINT `ach_transactions_bank_account_id_foreign` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ach_transactions_payroll_run_id_foreign` FOREIGN KEY (`payroll_run_id`) REFERENCES `payroll_runs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ach_transactions`
--

LOCK TABLES `ach_transactions` WRITE;
/*!40000 ALTER TABLE `ach_transactions` DISABLE KEYS */;
INSERT INTO `ach_transactions` VALUES (1,2,3,'credit',1539.17,NULL,'SIM-6966c67564b17','completed',NULL,'2026-01-13 17:25:57','2026-01-13 17:25:57','{\"status\":\"completed\",\"message\":\"Transaction processed successfully\"}','2026-01-13 17:25:57','2026-01-13 17:25:57'),(2,3,5,'credit',701.86,NULL,'SIM-6967ebca11412','completed',NULL,'2026-01-14 19:17:30','2026-01-14 19:17:30','{\"status\":\"completed\",\"message\":\"Transaction processed successfully\"}','2026-01-14 19:17:30','2026-01-14 19:17:30');
/*!40000 ALTER TABLE `ach_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_logs_user_id_foreign` (`user_id`),
  KEY `audit_logs_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `audit_logs_chk_1` CHECK (json_valid(`old_values`)),
  CONSTRAINT `audit_logs_chk_2` CHECK (json_valid(`new_values`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `accountable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountable_id` bigint unsigned NOT NULL,
  `account_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `routing_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_status` enum('pending','verified','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `verified_at` timestamp NULL DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_accounts_accountable_type_accountable_id_index` (`accountable_type`,`accountable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts`
--

LOCK TABLES `bank_accounts` WRITE;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
INSERT INTO `bank_accounts` VALUES (1,'App\\Models\\Employee',1,'checking','Test Bank','John Doe','123456789','987654321','verified',NULL,1,1,NULL,NULL,NULL),(2,'App\\Models\\Employee',7,'savings','Kasper Booth','Samson Oliver','349123123','123123123123','verified','2026-01-13 17:24:54',0,1,'2026-01-13 17:24:50','2026-01-13 17:24:54',NULL),(3,'App\\Models\\Employee',5,'checking','Xaviera Collins','Russell Cameron','123123123','1231231231','verified','2026-01-13 17:25:41',1,1,'2026-01-13 17:25:39','2026-01-13 17:25:41',NULL),(4,'App\\Models\\Employee',8,'checking','12312312331','1232313123','123123123','12312312312','verified','2026-01-13 17:41:21',0,1,'2026-01-13 17:41:18','2026-01-13 17:41:21',NULL),(5,'App\\Models\\Employee',9,'checking','PNC Bank','Andrew John','021202112','541616416416416','verified','2026-01-14 19:17:16',1,1,'2026-01-14 19:17:10','2026-01-14 19:17:16',NULL);
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;
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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `legal_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ein` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payroll_config` text COLLATE utf8mb4_unicode_ci,
  `ach_enrolled` tinyint(1) NOT NULL DEFAULT '0',
  `ach_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_ein_unique` (`ein`),
  KEY `companies_created_by_foreign` (`created_by`),
  CONSTRAINT `companies_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Isabella Richardson tes','Belle Morton','Minus nulla ut esse','Voluptatem qui dolor','Ut accusantium est e','Qui consequatur nul','78017','+1 (196) 568-5872','lirydyc@mailinator.com',NULL,0,NULL,1,'2026-01-13 16:25:18','2026-01-13 16:25:38',NULL),(2,'Duncan Mccall','Blythe Nolan','Tenetur amet ea et','Veniam sapiente lib','Alias dolore tempori','Obcaecati dolore qui','87760','+1 (299) 204-4296','kugi@mailinator.com',NULL,0,NULL,2,'2026-01-13 17:05:14','2026-01-13 17:05:14',NULL),(3,'Fay Raymond','Hanae Tillman','Alias magnam volupta','Sit in et et aut mi','Laboriosam tempore','Inventore maxime con','46155','+1 (771) 913-1847','noqime@mailinator.com',NULL,0,NULL,2,'2026-01-13 17:05:24','2026-01-13 17:05:24',NULL),(4,'Emma Sosa','Wang Wilder','Reprehenderit consec','Consequat Nisi repu','Occaecat reprehender','Ratione est ipsa de','35735','+1 (927) 489-2183','tadowy@mailinator.com',NULL,0,NULL,2,'2026-01-13 17:05:33','2026-01-13 17:05:33',NULL),(5,'Oscar LLC','Oscar Technologies LLC','0124565685','4600 E US Highway 158, Gardendale, TX 79758, United States','Gardendale','Texas','79758','12524684455','oscar@americandigitalagency.us',NULL,0,NULL,1,'2026-01-14 19:11:18','2026-01-14 19:11:18',NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `employee_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `ssn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employment_type` enum('full_time','part_time','contractor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'full_time',
  `hire_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `pay_type` enum('salary','hourly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hourly',
  `salary` decimal(10,2) DEFAULT NULL,
  `hourly_rate` decimal(8,2) DEFAULT NULL,
  `standard_hours_per_week` int NOT NULL DEFAULT '40',
  `filing_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `federal_allowances` int NOT NULL DEFAULT '0',
  `tax_information` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_company_id_foreign` (`company_id`),
  KEY `employees_user_id_foreign` (`user_id`),
  CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,1,NULL,NULL,'Holmes','Cochran','danyf@mailinator.com','+1 (594) 155-2167',NULL,NULL,NULL,NULL,NULL,NULL,'full_time',NULL,NULL,'hourly',120000.00,25.00,40,NULL,0,NULL,1,'2026-01-13 16:26:54','2026-01-13 16:26:54',NULL),(2,1,NULL,NULL,'Hyatt','Shannon','qobicivi@mailinator.com','+1 (485) 261-6434',NULL,NULL,NULL,NULL,NULL,NULL,'full_time',NULL,NULL,'salary',350000.00,94.00,40,NULL,0,NULL,1,'2026-01-13 16:27:19','2026-01-13 16:27:19',NULL),(3,4,NULL,NULL,'Julian','Prince','cavynid@mailinator.com','+1 (237) 514-9065',NULL,NULL,NULL,NULL,NULL,NULL,'full_time',NULL,NULL,'salary',100000.00,21.00,40,NULL,0,NULL,1,'2026-01-13 17:08:12','2026-01-13 17:08:12',NULL),(4,4,NULL,NULL,'Autumn','Reynolds','dinanoq@mailinator.com','+1 (296) 864-7934',NULL,NULL,NULL,NULL,NULL,NULL,'full_time',NULL,NULL,'hourly',100000.00,51.00,40,NULL,0,NULL,1,'2026-01-13 17:08:41','2026-01-13 17:08:41',NULL),(5,2,NULL,NULL,'Jocelyn','Terry','hexoxowi@mailinator.com','+1 (898) 165-6928',NULL,NULL,NULL,NULL,NULL,NULL,'full_time',NULL,NULL,'salary',20000.00,58.00,40,NULL,0,NULL,1,'2026-01-13 17:09:29','2026-01-13 17:09:29',NULL),(6,2,NULL,NULL,'Mannix','Avila','fidilulyho@mailinator.com','+1 (982) 652-6523',NULL,NULL,NULL,NULL,NULL,NULL,'full_time',NULL,NULL,'hourly',10000.00,19.00,40,NULL,0,NULL,1,'2026-01-13 17:09:47','2026-01-13 17:10:15',NULL),(7,3,NULL,NULL,'Yetta','Randall','dufam@mailinator.com','+1 (303) 961-9424',NULL,NULL,NULL,NULL,NULL,NULL,'full_time',NULL,NULL,'hourly',1000.00,65.00,40,NULL,0,NULL,1,'2026-01-13 17:10:52','2026-01-13 17:10:52',NULL),(8,1,3,'EMP001','John','Doe','employee@payvault.com','555-0100',NULL,NULL,NULL,NULL,NULL,NULL,'full_time',NULL,NULL,'hourly',NULL,25.00,40,NULL,0,NULL,1,'2026-01-13 17:39:14','2026-01-13 17:39:14',NULL),(9,5,NULL,NULL,'Andrew','John','john@americandigitalagency.us','1554596599',NULL,NULL,NULL,NULL,NULL,NULL,'full_time',NULL,NULL,'hourly',50000.00,19.00,40,NULL,0,NULL,1,'2026-01-14 19:12:36','2026-01-14 19:12:50',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_01_13_203359_create_roles_table',1),(5,'2026_01_13_203402_create_companies_table',1),(6,'2026_01_13_203405_create_employees_table',1),(7,'2026_01_13_203409_create_payroll_runs_table',1),(8,'2026_01_13_203412_create_payroll_items_table',1),(9,'2026_01_13_203415_create_payroll_deductions_table',1),(10,'2026_01_13_203419_create_bank_accounts_table',1),(11,'2026_01_13_203423_create_ach_transactions_table',1),(12,'2026_01_13_203427_create_audit_logs_table',1),(13,'2026_01_13_203431_add_role_id_to_users_table',1);
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
-- Table structure for table `payroll_deductions`
--

DROP TABLE IF EXISTS `payroll_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_deductions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payroll_item_id` bigint unsigned NOT NULL,
  `deduction_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calculation_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `percentage` decimal(5,2) DEFAULT NULL,
  `is_pre_tax` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_deductions_payroll_item_id_foreign` (`payroll_item_id`),
  CONSTRAINT `payroll_deductions_payroll_item_id_foreign` FOREIGN KEY (`payroll_item_id`) REFERENCES `payroll_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_deductions`
--

LOCK TABLES `payroll_deductions` WRITE;
/*!40000 ALTER TABLE `payroll_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_items`
--

DROP TABLE IF EXISTS `payroll_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payroll_run_id` bigint unsigned NOT NULL,
  `employee_id` bigint unsigned NOT NULL,
  `hours_worked` decimal(8,2) NOT NULL DEFAULT '0.00',
  `regular_hours` decimal(8,2) NOT NULL DEFAULT '0.00',
  `overtime_hours` decimal(8,2) NOT NULL DEFAULT '0.00',
  `regular_rate` decimal(8,2) NOT NULL DEFAULT '0.00',
  `overtime_rate` decimal(8,2) NOT NULL DEFAULT '0.00',
  `gross_pay` decimal(10,2) NOT NULL DEFAULT '0.00',
  `federal_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `state_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `local_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `social_security` decimal(10,2) NOT NULL DEFAULT '0.00',
  `medicare` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_taxes` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_deductions` decimal(10,2) NOT NULL DEFAULT '0.00',
  `net_pay` decimal(10,2) NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_items_payroll_run_id_foreign` (`payroll_run_id`),
  KEY `payroll_items_employee_id_foreign` (`employee_id`),
  CONSTRAINT `payroll_items_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payroll_items_payroll_run_id_foreign` FOREIGN KEY (`payroll_run_id`) REFERENCES `payroll_runs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_items`
--

LOCK TABLES `payroll_items` WRITE;
/*!40000 ALTER TABLE `payroll_items` DISABLE KEYS */;
INSERT INTO `payroll_items` VALUES (1,1,1,40.00,40.00,0.00,25.00,37.50,1000.00,0.00,0.00,0.00,62.00,14.50,76.50,0.00,923.50,NULL,'2026-01-13 16:28:32','2026-01-13 16:28:32'),(2,1,2,40.00,40.00,0.00,94.00,141.00,6730.77,0.00,0.00,0.00,417.31,97.60,514.90,0.00,6215.87,NULL,'2026-01-13 16:28:32','2026-01-13 16:28:32'),(3,2,5,40.00,40.00,0.00,58.00,87.00,1666.67,0.00,0.00,0.00,103.33,24.17,127.50,0.00,1539.17,NULL,'2026-01-13 17:14:30','2026-01-13 17:14:30'),(4,2,6,40.00,40.00,0.00,19.00,28.50,760.00,0.00,0.00,0.00,47.12,11.02,58.14,0.00,701.86,NULL,'2026-01-13 17:14:30','2026-01-13 17:14:30'),(5,3,9,40.00,40.00,0.00,19.00,28.50,760.00,0.00,0.00,0.00,47.12,11.02,58.14,0.00,701.86,NULL,'2026-01-14 19:13:57','2026-01-14 19:13:57');
/*!40000 ALTER TABLE `payroll_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_runs`
--

DROP TABLE IF EXISTS `payroll_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_runs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `pay_period_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_period_start` date NOT NULL,
  `pay_period_end` date NOT NULL,
  `pay_date` date NOT NULL,
  `status` enum('draft','preview','approved','finalized') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `total_gross` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_deductions` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_net` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_by` bigint unsigned NOT NULL,
  `approved_by` bigint unsigned DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `finalized_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_runs_company_id_foreign` (`company_id`),
  KEY `payroll_runs_created_by_foreign` (`created_by`),
  KEY `payroll_runs_approved_by_foreign` (`approved_by`),
  CONSTRAINT `payroll_runs_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `payroll_runs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payroll_runs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_runs`
--

LOCK TABLES `payroll_runs` WRITE;
/*!40000 ALTER TABLE `payroll_runs` DISABLE KEYS */;
INSERT INTO `payroll_runs` VALUES (1,1,'weekly','2026-01-01','2026-01-14','2026-01-31','finalized',7730.77,0.00,7139.37,1,1,'2026-01-13 16:28:39','2026-01-13 16:28:57',NULL,'2026-01-13 16:28:20','2026-01-13 16:28:57',NULL),(2,2,'monthly','2026-01-01','2026-01-31','2026-02-01','finalized',2426.67,0.00,2241.03,2,2,'2026-01-13 17:14:59','2026-01-13 17:15:02',NULL,'2026-01-13 17:14:17','2026-01-13 17:15:02',NULL),(3,5,'weekly','2026-01-14','2026-01-21','2026-01-22','finalized',760.00,0.00,701.86,1,1,'2026-01-14 19:14:10','2026-01-14 19:14:14',NULL,'2026-01-14 19:13:53','2026-01-14 19:14:14',NULL);
/*!40000 ALTER TABLE `payroll_runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','System administrator with full access','2026-01-13 15:41:51','2026-01-13 15:41:51'),(2,'client','Client/Company owner with company management access','2026-01-13 15:41:52','2026-01-13 15:41:52'),(3,'employee','Employee with limited access to their own payroll information','2026-01-13 15:41:52','2026-01-13 15:41:52');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('ccDe6sFvNyR9nny1WsAU6WIPLTKWaY3b6s4Pxwwh',3,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiemRKZFBkMGtUVDEycnpDZmY3VmJrNm9HdjF2dkNPMWVTR2xhN1I3SSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9lbXBsb3llZS9wYXlyb2xsIjtzOjU6InJvdXRlIjtzOjIyOiJlbXBsb3llZS5wYXlyb2xsLmluZGV4Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9',1768347811),('eK5jsPhN50xsUrpNVdNHhhFS6CQn3yzCSGwWcQ64',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibVoyYjNuTTFRbG8yOW5PbFJwbnk5cDRBTUxpUXEwMzFrTVB5MFlLcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hZG1pbi9jb21wYW5pZXMvY3JlYXRlIjtzOjU6InJvdXRlIjtzOjIyOiJhZG1pbi5jb21wYW5pZXMuY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1768339266),('QAhrcNLnVVdEWMq6JttLhvKD0JX2m8XSSXt6cJbu',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNm44bmFiRHh2WGUxMUE0RnNvYTFQYnJJb2xOaDBuZE5IYURJSmhQVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9jb21wYW5pZXMiO3M6NToicm91dGUiO3M6MjE6ImFkbWluLmNvbXBhbmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==',1768410256);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin User','admin@payvault.com',NULL,'$2y$12$mz4GBQh65JOtIgak/iX.Ju3wD3DWMJXHS8ST0h4OLGyKTNgNpf7H2',NULL,'2026-01-13 16:01:08','2026-01-13 16:01:08'),(2,2,'Client User','client@payvault.com',NULL,'$2y$12$C/7vB2AiRAiE.4Y2aZ0ImOpCzjqE89LXeIwAxZa7PRyd82nrAmsYm',NULL,'2026-01-13 16:01:08','2026-01-13 16:01:08'),(3,3,'Employee User','employee@payvault.com',NULL,'$2y$12$LrU3ru/7OIFtWEOW/a9GPeDZp6sYoMU3v8q29wEhAtI3rzeo1H7LK',NULL,'2026-01-13 16:01:08','2026-01-13 16:01:08');
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

-- Dump completed on 2026-01-26 16:47:54
