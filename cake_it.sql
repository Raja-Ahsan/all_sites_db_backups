-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: cake_it
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
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext,
  `version` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `item_id` varchar(255) NOT NULL,
  `license_code` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytic_sections`
--

DROP TABLE IF EXISTS `analytic_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytic_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `analytic_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` tinyint NOT NULL DEFAULT '5',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `analytic_sections_analytic_id_foreign` (`analytic_id`),
  CONSTRAINT `analytic_sections_analytic_id_foreign` FOREIGN KEY (`analytic_id`) REFERENCES `analytics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytic_sections`
--

LOCK TABLES `analytic_sections` WRITE;
/*!40000 ALTER TABLE `analytic_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytic_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics`
--

DROP TABLE IF EXISTS `analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics`
--

LOCK TABLES `analytics` WRITE;
/*!40000 ALTER TABLE `analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_assignee`
--

DROP TABLE IF EXISTS `attendance_assignee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_assignee` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `assigned_by` bigint unsigned NOT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attendance_assignee_employee_id_unique` (`employee_id`),
  KEY `attendance_assignee_employee_id_is_active_index` (`employee_id`,`is_active`),
  KEY `attendance_assignee_assigned_by_index` (`assigned_by`),
  CONSTRAINT `attendance_assignee_assigned_by_foreign` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_assignee_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_assignee`
--

LOCK TABLES `attendance_assignee` WRITE;
/*!40000 ALTER TABLE `attendance_assignee` DISABLE KEYS */;
INSERT INTO `attendance_assignee` VALUES (1,3,1,'2025-08-30 00:33:26',0,'2025-08-29 19:33:26','2025-09-15 20:28:42'),(7,11,1,'2025-09-01 18:23:48',1,'2025-09-01 13:23:48','2025-09-15 20:28:42');
/*!40000 ALTER TABLE `attendance_assignee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Main Branch','info@cakeit.us','+15037465614','45.4962717','-122.8424043','Beaverton','Oregon','97005','Shop :3205 SW Cedar Hills Blvd, Beaverton, OR 97005',5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:10','2025-07-03 00:10:10');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capture_payment_notifications`
--

DROP TABLE IF EXISTS `capture_payment_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capture_payment_notifications` (
  `order_id` bigint unsigned NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capture_payment_notifications`
--

LOCK TABLES `capture_payment_notifications` WRITE;
/*!40000 ALTER TABLE `capture_payment_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `capture_payment_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_cryptocurrency` tinyint unsigned NOT NULL,
  `exchange_rate` decimal(19,2) DEFAULT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint unsigned DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Dollars','$','USD',10,1.00,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_access`
--

DROP TABLE IF EXISTS `default_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_access` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `default_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_access`
--

LOCK TABLES `default_access` WRITE;
/*!40000 ALTER TABLE `default_access` DISABLE KEYS */;
INSERT INTO `default_access` VALUES (1,'branch_id',1,1,'2025-07-02 23:51:50','2025-09-30 13:28:35'),(2,'branch_id',3,1,'2025-08-29 19:35:02','2025-08-29 19:35:02'),(3,'branch_id',12,1,'2025-09-30 13:34:54','2025-09-30 13:34:54'),(4,'branch_id',15,1,'2025-10-27 10:59:42','2025-10-27 10:59:42'),(5,'branch_id',17,1,'2025-11-23 14:21:13','2025-11-23 14:21:13');
/*!40000 ALTER TABLE `default_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dining_tables`
--

DROP TABLE IF EXISTS `dining_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_tables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int DEFAULT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dining_tables_slug_unique` (`slug`),
  KEY `dining_tables_branch_id_foreign` (`branch_id`),
  CONSTRAINT `dining_tables_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dining_tables`
--

LOCK TABLES `dining_tables` WRITE;
/*!40000 ALTER TABLE `dining_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `dining_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_attendance`
--

DROP TABLE IF EXISTS `employee_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_attendance` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `status` enum('present','absent','late','half_day','leave') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'present',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_attendance_employee_id_date_unique` (`employee_id`,`date`),
  KEY `employee_attendance_employee_id_date_index` (`employee_id`,`date`),
  KEY `employee_attendance_date_status_index` (`date`,`status`),
  KEY `employee_attendance_created_by_index` (`created_by`),
  CONSTRAINT `employee_attendance_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_attendance_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendance`
--

LOCK TABLES `employee_attendance` WRITE;
/*!40000 ALTER TABLE `employee_attendance` DISABLE KEYS */;
INSERT INTO `employee_attendance` VALUES (7,11,'2025-09-15','03:41:00','20:45:00','present',NULL,1,'2025-09-15 17:41:44','2025-09-15 17:42:11'),(8,3,'2025-09-15','09:28:00','21:29:00','present',NULL,1,'2025-09-15 20:26:11','2025-09-15 20:26:45');
/*!40000 ALTER TABLE `employee_attendance` ENABLE KEYS */;
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
-- Table structure for table `gateway_options`
--

DROP TABLE IF EXISTS `gateway_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateway_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_id` bigint NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `type` tinyint NOT NULL,
  `activities` longtext COLLATE utf8mb4_unicode_ci,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateway_options`
--

LOCK TABLES `gateway_options` WRITE;
/*!40000 ALTER TABLE `gateway_options` DISABLE KEYS */;
INSERT INTO `gateway_options` VALUES (1,3,'App\\Models\\PaymentGateway','paypal_app_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(2,3,'App\\Models\\PaymentGateway','paypal_client_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(3,3,'App\\Models\\PaymentGateway','paypal_client_secret','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(4,3,'App\\Models\\PaymentGateway','paypal_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(5,3,'App\\Models\\PaymentGateway','paypal_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(6,4,'App\\Models\\PaymentGateway','stripe_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(7,4,'App\\Models\\PaymentGateway','stripe_secret','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(8,4,'App\\Models\\PaymentGateway','stripe_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(9,4,'App\\Models\\PaymentGateway','stripe_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(10,5,'App\\Models\\PaymentGateway','flutterwave_public_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(11,5,'App\\Models\\PaymentGateway','flutterwave_secret_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(12,5,'App\\Models\\PaymentGateway','flutterwave_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(13,5,'App\\Models\\PaymentGateway','flutterwave_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(14,6,'App\\Models\\PaymentGateway','paystack_public_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(15,6,'App\\Models\\PaymentGateway','paystack_secret_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(16,6,'App\\Models\\PaymentGateway','paystack_payment_url','https://api.paystack.co',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(17,6,'App\\Models\\PaymentGateway','paystack_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(18,6,'App\\Models\\PaymentGateway','paystack_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(19,7,'App\\Models\\PaymentGateway','sslcommerz_store_name','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(20,7,'App\\Models\\PaymentGateway','sslcommerz_store_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(21,7,'App\\Models\\PaymentGateway','sslcommerz_store_password','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(22,7,'App\\Models\\PaymentGateway','sslcommerz_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(23,7,'App\\Models\\PaymentGateway','sslcommerz_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(24,8,'App\\Models\\PaymentGateway','mollie_api_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(25,8,'App\\Models\\PaymentGateway','mollie_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(26,8,'App\\Models\\PaymentGateway','mollie_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(27,9,'App\\Models\\PaymentGateway','senangpay_merchant_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(28,9,'App\\Models\\PaymentGateway','senangpay_secret_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(29,9,'App\\Models\\PaymentGateway','senangpay_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(30,9,'App\\Models\\PaymentGateway','senangpay_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(31,10,'App\\Models\\PaymentGateway','bkash_app_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(32,10,'App\\Models\\PaymentGateway','bkash_app_secret','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(33,10,'App\\Models\\PaymentGateway','bkash_username','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(34,10,'App\\Models\\PaymentGateway','bkash_password','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(35,10,'App\\Models\\PaymentGateway','bkash_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(36,10,'App\\Models\\PaymentGateway','bkash_status','',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(37,11,'App\\Models\\PaymentGateway','paytm_merchant_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(38,11,'App\\Models\\PaymentGateway','paytm_merchant_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(39,11,'App\\Models\\PaymentGateway','paytm_merchant_website','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(40,11,'App\\Models\\PaymentGateway','paytm_channel','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(41,11,'App\\Models\\PaymentGateway','paytm_industry_type','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(42,11,'App\\Models\\PaymentGateway','paytm_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(43,11,'App\\Models\\PaymentGateway','paytm_status','',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(44,12,'App\\Models\\PaymentGateway','razorpay_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(45,12,'App\\Models\\PaymentGateway','razorpay_secret','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(46,12,'App\\Models\\PaymentGateway','razorpay_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(47,12,'App\\Models\\PaymentGateway','razorpay_status','',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(48,13,'App\\Models\\PaymentGateway','mercadopago_client_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(49,13,'App\\Models\\PaymentGateway','mercadopago_client_secret','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(50,13,'App\\Models\\PaymentGateway','mercadopago_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(51,13,'App\\Models\\PaymentGateway','mercadopago_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(52,14,'App\\Models\\PaymentGateway','cashfree_app_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(53,14,'App\\Models\\PaymentGateway','cashfree_secret_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(54,14,'App\\Models\\PaymentGateway','cashfree_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(55,14,'App\\Models\\PaymentGateway','cashfree_status','',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(56,15,'App\\Models\\PaymentGateway','payfast_merchant_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(57,15,'App\\Models\\PaymentGateway','payfast_merchant_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(58,15,'App\\Models\\PaymentGateway','payfast_passphrase','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(59,15,'App\\Models\\PaymentGateway','payfast_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(60,15,'App\\Models\\PaymentGateway','payfast_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(61,16,'App\\Models\\PaymentGateway','skrill_merchant_email','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(62,16,'App\\Models\\PaymentGateway','skrill_merchant_api_password','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(63,16,'App\\Models\\PaymentGateway','skrill_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(64,16,'App\\Models\\PaymentGateway','skrill_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(65,17,'App\\Models\\PaymentGateway','phonepe_merchant_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(66,17,'App\\Models\\PaymentGateway','phonepe_merchant_user_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(67,17,'App\\Models\\PaymentGateway','phonepe_key_index','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(68,17,'App\\Models\\PaymentGateway','phonepe_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(69,17,'App\\Models\\PaymentGateway','phonepe_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(70,17,'App\\Models\\PaymentGateway','phonepe_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(71,18,'App\\Models\\PaymentGateway','telr_store_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(72,18,'App\\Models\\PaymentGateway','telr_store_auth_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(73,18,'App\\Models\\PaymentGateway','telr_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(74,18,'App\\Models\\PaymentGateway','telr_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(75,19,'App\\Models\\PaymentGateway','iyzico_api_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(76,19,'App\\Models\\PaymentGateway','iyzico_secret_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(77,19,'App\\Models\\PaymentGateway','iyzico_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(78,19,'App\\Models\\PaymentGateway','iyzico_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(79,20,'App\\Models\\PaymentGateway','pesapal_consumer_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(80,20,'App\\Models\\PaymentGateway','pesapal_consumer_secret','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(81,20,'App\\Models\\PaymentGateway','pesapal_ipn_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(82,20,'App\\Models\\PaymentGateway','pesapal_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(83,20,'App\\Models\\PaymentGateway','pesapal_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(84,21,'App\\Models\\PaymentGateway','midtrans_server_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(85,21,'App\\Models\\PaymentGateway','midtrans_mode','',10,'{\"5\":\"sandbox\",\"10\":\"live\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(86,21,'App\\Models\\PaymentGateway','midtrans_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(87,1,'App\\Models\\SmsGateway','twilio_account_sid','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(88,1,'App\\Models\\SmsGateway','twilio_auth_token','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(89,1,'App\\Models\\SmsGateway','twilio_from','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(90,1,'App\\Models\\SmsGateway','twilio_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(91,2,'App\\Models\\SmsGateway','clickatell_apikey','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(92,2,'App\\Models\\SmsGateway','clickatell_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(93,3,'App\\Models\\SmsGateway','nexmo_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(94,3,'App\\Models\\SmsGateway','nexmo_secret','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(95,3,'App\\Models\\SmsGateway','nexmo_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(96,4,'App\\Models\\SmsGateway','msg91_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(97,4,'App\\Models\\SmsGateway','msg91_sender_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(98,4,'App\\Models\\SmsGateway','msg91_template_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(99,4,'App\\Models\\SmsGateway','msg91_template_variable','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(100,4,'App\\Models\\SmsGateway','msg91_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(101,5,'App\\Models\\SmsGateway','twofactor_module','PROMO_SMS',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(102,5,'App\\Models\\SmsGateway','twofactor_from','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(103,5,'App\\Models\\SmsGateway','twofactor_api_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(104,5,'App\\Models\\SmsGateway','twofactor_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(105,6,'App\\Models\\SmsGateway','bulksms_username','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(106,6,'App\\Models\\SmsGateway','bulksms_password','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(107,6,'App\\Models\\SmsGateway','bulksms_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(108,7,'App\\Models\\SmsGateway','bulksmsbd_api_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(109,7,'App\\Models\\SmsGateway','bulksmsbd_sender_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(110,7,'App\\Models\\SmsGateway','bulksmsbd_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(111,8,'App\\Models\\SmsGateway','telesign_api_key','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(112,8,'App\\Models\\SmsGateway','telesign_customer_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:09','2025-07-02 23:48:09'),(113,8,'App\\Models\\SmsGateway','telesign_sender_id','',5,'\"\"',NULL,NULL,NULL,NULL,'2025-07-02 23:48:09','2025-07-02 23:48:09'),(114,8,'App\\Models\\SmsGateway','telesign_status','10',10,'{\"5\":\"enable\",\"10\":\"disable\"}',NULL,NULL,NULL,NULL,'2025-07-02 23:48:09','2025-07-02 23:48:09');
/*!40000 ALTER TABLE `gateway_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_addons`
--

DROP TABLE IF EXISTS `item_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_addons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned NOT NULL,
  `addon_item_id` bigint unsigned NOT NULL,
  `addon_item_variation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_addons_item_id_foreign` (`item_id`),
  KEY `item_addons_addon_item_id_foreign` (`addon_item_id`),
  CONSTRAINT `item_addons_addon_item_id_foreign` FOREIGN KEY (`addon_item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `item_addons_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_addons`
--

LOCK TABLES `item_addons` WRITE;
/*!40000 ALTER TABLE `item_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_attributes`
--

DROP TABLE IF EXISTS `item_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_attributes`
--

LOCK TABLES `item_attributes` WRITE;
/*!40000 ALTER TABLE `item_attributes` DISABLE KEYS */;
INSERT INTO `item_attributes` VALUES (1,'Cake Size',5,NULL,NULL,NULL,NULL,'2025-07-02 12:34:33','2025-07-02 12:34:59'),(2,'Cake Flavour',5,NULL,NULL,NULL,NULL,'2025-07-02 12:34:50','2025-07-02 12:34:50'),(3,'Cake Filling',5,NULL,NULL,NULL,NULL,'2025-07-02 12:35:14','2025-07-02 12:35:14'),(4,'Cupcake Flavor',5,NULL,NULL,NULL,NULL,'2025-07-02 12:36:29','2025-07-02 12:36:29'),(5,'Number of cupcakes',5,NULL,NULL,NULL,NULL,'2025-07-02 12:36:57','2025-07-02 12:36:57'),(6,'Color',5,NULL,NULL,NULL,NULL,'2025-07-02 12:37:10','2025-07-02 12:37:10'),(7,'Cake Outside Frosting',5,NULL,NULL,NULL,NULL,'2025-08-05 10:25:49','2025-08-05 10:25:49');
/*!40000 ALTER TABLE `item_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_categories`
--

DROP TABLE IF EXISTS `item_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint unsigned NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `sort` bigint unsigned NOT NULL DEFAULT '1',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_categories`
--

LOCK TABLES `item_categories` WRITE;
/*!40000 ALTER TABLE `item_categories` DISABLE KEYS */;
INSERT INTO `item_categories` VALUES (1,'Cakes','cakes',NULL,5,1,NULL,NULL,NULL,NULL,'2025-07-02 12:33:40','2025-07-04 06:03:14'),(2,'Cupcakes','cupcakes',NULL,5,2,NULL,NULL,NULL,NULL,'2025-07-02 12:34:03','2025-07-04 06:03:14');
/*!40000 ALTER TABLE `item_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_extras`
--

DROP TABLE IF EXISTS `item_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_extras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(19,6) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_extras_item_id_foreign` (`item_id`),
  CONSTRAINT `item_extras_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_extras`
--

LOCK TABLES `item_extras` WRITE;
/*!40000 ALTER TABLE `item_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_variations`
--

DROP TABLE IF EXISTS `item_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned NOT NULL,
  `item_attribute_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `caution` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_variations_item_id_foreign` (`item_id`),
  KEY `item_variations_item_attribute_id_foreign` (`item_attribute_id`),
  CONSTRAINT `item_variations_item_attribute_id_foreign` FOREIGN KEY (`item_attribute_id`) REFERENCES `item_attributes` (`id`),
  CONSTRAINT `item_variations_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_variations`
--

LOCK TABLES `item_variations` WRITE;
/*!40000 ALTER TABLE `item_variations` DISABLE KEYS */;
INSERT INTO `item_variations` VALUES (1,2,5,'asdas',0.000000,'asd',5,NULL,NULL,NULL,NULL,'2025-07-08 16:08:29','2025-07-02 13:11:09','2025-07-08 16:08:29'),(2,1,1,'8 inches 2 layers',45.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:09:49','2025-09-25 17:37:50'),(3,1,1,'8 inches 3 layers',65.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:10:12','2025-09-25 17:38:28'),(4,1,2,'Chocolate',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:10:35','2025-07-08 16:10:35'),(5,1,2,'Funfetti',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:10:46','2025-07-08 16:10:46'),(6,1,2,'Vanilla',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:11:04','2025-07-08 16:11:04'),(7,1,3,'Chocolate Buttercream',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:11:49','2025-07-08 16:11:49'),(8,1,3,'Raspberry',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:11:58','2025-07-08 16:11:58'),(9,1,3,'Strawberry',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:12:07','2025-07-08 16:12:07'),(10,1,3,'Vanilla Buttercream',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:12:15','2025-07-08 16:12:15'),(11,3,5,'12',39.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:13:50','2025-09-29 11:08:49'),(12,3,5,'24',78.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:14:01','2025-09-29 11:09:11'),(13,3,4,'Vanilla',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:14:27','2025-07-08 16:14:27'),(14,3,4,'Chocolate',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:14:39','2025-07-08 16:14:39'),(15,3,4,'Chocolate & Vanilla',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:15:08','2025-07-08 16:15:08'),(16,1,7,'Vanilla Buttercream.',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:28:33','2025-08-05 10:28:33'),(17,1,7,'Chocolate Buttercream.',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:28:53','2025-08-05 10:28:53'),(18,1,7,'Cream Cheese Icing',5.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:29:17','2025-09-25 17:30:07'),(19,1,2,'Marble',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:31:36','2025-08-05 10:31:36'),(20,1,2,'Strawberry.',5.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:31:59','2025-09-25 17:28:12'),(21,1,2,'Lemon',5.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:32:32','2025-09-25 17:28:21'),(22,1,2,'Toll House',5.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:33:06','2025-09-25 17:28:35'),(23,1,2,'Red Velvet',5.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:33:21','2025-09-25 17:28:44'),(24,1,2,'Carrot',10.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:33:35','2025-09-25 17:28:55'),(25,1,2,'Almond Roca',15.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:33:50','2025-09-25 17:29:10'),(26,1,2,'Hummingbird',10.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:34:09','2025-09-25 17:29:20'),(27,1,3,'Strawberry Buttercream',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:35:20','2025-08-05 10:35:20'),(28,1,3,'Raspberry Buttercream',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:35:38','2025-08-05 10:35:38'),(29,1,3,'Lemon.',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:36:27','2025-08-05 10:36:27'),(30,1,3,'Lemon Buttercream',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:36:38','2025-08-05 10:36:38'),(31,1,3,'Mocha Buttercream',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:37:00','2025-08-05 10:37:00'),(32,1,3,'Fudge',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:37:10','2025-08-05 10:37:10'),(33,1,3,'Cream Cheese',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:37:24','2025-08-05 10:37:24'),(34,1,3,'Oreo Buttercream',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:37:40','2025-08-05 10:37:40'),(35,1,3,'Peanut Buttercream',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:37:57','2025-08-05 10:37:57'),(36,1,3,'German Chocolate',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:38:13','2025-08-05 10:38:13'),(37,1,1,'6 inch 3 layers',42.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:39:38','2025-09-25 17:36:09'),(38,1,1,'9 inch 2 layers',60.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:40:00','2025-09-25 17:38:55'),(39,1,1,'9 inch 3 layers',85.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:40:14','2025-09-25 17:39:18'),(40,1,1,'10 inch 2 layers',80.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:40:34','2025-09-25 17:39:43'),(41,1,1,'10 inch 3 layers',120.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:40:49','2025-09-25 17:40:06'),(42,1,1,'12 inch 2 layers',130.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:41:08','2025-09-25 17:40:31'),(43,1,1,'12 inch 3 layers',185.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:41:22','2025-09-25 17:40:48'),(44,1,1,'1/4 Sheet',100.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:41:43','2025-09-25 17:41:21'),(45,1,1,'1/2 Sheet',145.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:42:01','2025-09-25 17:41:57'),(46,1,1,'2 tiers 8 inch and 6 inch',165.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:42:31','2025-09-25 17:42:29'),(47,1,1,'2 tiers 9 inch and 6 inch',175.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:42:53','2025-09-25 17:42:53'),(48,1,1,'2 tiers 10 inch and 6 inch',200.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:44:14','2025-09-25 17:43:23'),(49,1,1,'2 tiers 10 inch and 8 inch',220.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:44:28','2025-09-25 17:43:46'),(50,1,1,'Others',0.000000,NULL,5,NULL,NULL,NULL,NULL,NULL,'2025-08-05 10:44:47','2025-08-05 10:44:47'),(51,3,3,'Cup Cake Filling',10.000000,NULL,5,NULL,NULL,NULL,NULL,'2025-09-29 11:10:18','2025-09-29 11:09:56','2025-09-29 11:10:18');
/*!40000 ALTER TABLE `item_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_category_id` bigint unsigned NOT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caution` longtext COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `item_type` tinyint NOT NULL DEFAULT '5',
  `order` bigint NOT NULL DEFAULT '1',
  `is_featured` tinyint NOT NULL DEFAULT '5',
  `is_variable` tinyint NOT NULL DEFAULT '0',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_item_category_id_foreign` (`item_category_id`),
  KEY `items_tax_id_foreign` (`tax_id`),
  CONSTRAINT `items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`),
  CONSTRAINT `items_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,NULL,'custom cake','custom-cake','dasd','asd',0.000000,5,5,1,5,10,NULL,NULL,NULL,NULL,NULL,'2025-07-02 13:05:22','2025-11-10 23:08:25'),(2,1,NULL,'Base Ball Cake','base-ball-cake',NULL,NULL,0.000000,5,10,1,5,5,NULL,NULL,NULL,NULL,'2025-07-08 16:08:29','2025-07-02 13:10:47','2025-07-08 16:08:29'),(3,2,NULL,'Frozen Theme Cupcakes','frozen-theme-cupcakes',NULL,NULL,0.001000,5,10,1,5,0,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:13:09','2025-07-08 16:13:09'),(4,1,NULL,'Chocolate','chocolate',NULL,NULL,10.000000,5,5,1,5,0,NULL,NULL,NULL,NULL,'2025-08-05 10:45:29','2025-07-16 15:20:56','2025-08-05 10:45:29');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_mode` tinyint unsigned NOT NULL DEFAULT '5',
  `status` tinyint unsigned NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en',5,5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:09','2025-07-02 23:48:09');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'App\\Models\\PaymentGateway',1,'9f5f3f63-c4db-4043-88ab-61ae4c283fdc','payment-gateway','cash-on-delivery','cash-on-delivery.png','image/png','public','public',3437,'[]','[]','[]','[]',1,'2025-07-02 23:47:56','2025-07-02 23:47:56'),(2,'App\\Models\\PaymentGateway',2,'342c92f2-bf7d-4bbe-a87a-bbabeeb29c53','payment-gateway','credit','credit.png','image/png','public','public',3885,'[]','[]','[]','[]',1,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(3,'App\\Models\\PaymentGateway',3,'c1f194ea-a7ca-484e-9f73-98b90c8ea2e2','payment-gateway','paypal','paypal.png','image/png','public','public',3809,'[]','[]','[]','[]',1,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(4,'App\\Models\\PaymentGateway',4,'0c11b41e-1a1d-4941-bdc6-7e4b36903a12','payment-gateway','stripe','stripe.png','image/png','public','public',3635,'[]','[]','[]','[]',1,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(5,'App\\Models\\PaymentGateway',5,'aa39fdb6-e1c2-4456-98e6-e01761c43fe8','payment-gateway','flutterwave','flutterwave.png','image/png','public','public',5191,'[]','[]','[]','[]',1,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(6,'App\\Models\\PaymentGateway',6,'569e8528-377e-4036-b124-a3248449c113','payment-gateway','paystack','paystack.png','image/png','public','public',4195,'[]','[]','[]','[]',1,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(7,'App\\Models\\PaymentGateway',7,'ce99627c-07b7-44ff-a08a-b3914e00be6a','payment-gateway','sslcommerz','sslcommerz.png','image/png','public','public',4546,'[]','[]','[]','[]',1,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(8,'App\\Models\\PaymentGateway',8,'375e25ff-50d7-4bc9-8293-dc9aa6d99229','payment-gateway','mollie','mollie.png','image/png','public','public',8116,'[]','[]','[]','[]',1,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(9,'App\\Models\\PaymentGateway',9,'2873253d-c4e3-4bbd-8c30-be6240a40b65','payment-gateway','senangpay','senangpay.png','image/png','public','public',6541,'[]','[]','[]','[]',1,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(10,'App\\Models\\PaymentGateway',10,'704748d4-bb3e-496f-865f-3b95df13e02e','payment-gateway','bkash','bkash.png','image/png','public','public',5282,'[]','[]','[]','[]',1,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(11,'App\\Models\\PaymentGateway',11,'71662818-5a8c-482d-a668-f661ade0582a','payment-gateway','paytm','paytm.png','image/png','public','public',3285,'[]','[]','[]','[]',1,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(12,'App\\Models\\PaymentGateway',12,'f8e45eff-ad7c-4012-8d3a-20b4dda3dd0c','payment-gateway','razorpay','razorpay.png','image/png','public','public',4847,'[]','[]','[]','[]',1,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(13,'App\\Models\\PaymentGateway',13,'e58457fb-ac4d-41d0-8891-b6da7064a071','payment-gateway','mercadopago','mercadopago.png','image/png','public','public',11423,'[]','[]','[]','[]',1,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(14,'App\\Models\\PaymentGateway',14,'395feccd-86c6-4cd7-810b-569f7f56b5ea','payment-gateway','cashfree','cashfree.png','image/png','public','public',4940,'[]','[]','[]','[]',1,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(15,'App\\Models\\PaymentGateway',15,'5d02ac09-0c73-4813-aaa4-2cb6e83fcd75','payment-gateway','payfast','payfast.png','image/png','public','public',2173,'[]','[]','[]','[]',1,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(16,'App\\Models\\PaymentGateway',16,'b58fab1e-4b2b-4281-bc76-daba98c1dfae','payment-gateway','skrill','skrill.png','image/png','public','public',7074,'[]','[]','[]','[]',1,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(17,'App\\Models\\PaymentGateway',17,'c199d342-02c7-4780-8751-997d99b76deb','payment-gateway','phonepe','phonepe.png','image/png','public','public',4417,'[]','[]','[]','[]',1,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(18,'App\\Models\\PaymentGateway',18,'bc94469f-343e-4f43-9dd5-e4c2de513742','payment-gateway','telr','telr.png','image/png','public','public',7594,'[]','[]','[]','[]',1,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(19,'App\\Models\\PaymentGateway',19,'86d1f9de-bd48-47e9-b424-317cdefd94fd','payment-gateway','iyzico','iyzico.png','image/png','public','public',7652,'[]','[]','[]','[]',1,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(20,'App\\Models\\PaymentGateway',20,'78d3b9f4-0cc7-46e6-b2c1-332bac76aeec','payment-gateway','pesapal','pesapal.png','image/png','public','public',9373,'[]','[]','[]','[]',1,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(21,'App\\Models\\PaymentGateway',21,'32a6c522-fcc3-4258-a1c3-a674509dda42','payment-gateway','midtrans','midtrans.png','image/png','public','public',5877,'[]','[]','[]','[]',1,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(22,'App\\Models\\Language',1,'e14f01cd-8703-4c44-8c5e-44db7fb277c1','language','english','english.png','image/png','public','public',1149,'[]','[]','[]','[]',1,'2025-07-02 23:48:09','2025-07-02 23:48:09'),(31,'App\\Models\\Item',1,'8570bdb4-5d7b-4df1-a5af-cf175a3ca842','item','IMG_9944-600x618','IMG_9944-600x618.jpg','image/jpeg','public','public',50933,'[]','[]','{\"thumb\":true,\"cover\":true,\"preview\":true}','[]',1,'2025-07-02 13:05:22','2025-07-02 13:05:23'),(32,'App\\Models\\Item',2,'ab63ba51-0b01-4c70-ad9e-dba03fac8d75','item','IMG_4077_1-667x1000','IMG_4077_1-667x1000.jpg','image/jpeg','public','public',75941,'[]','[]','{\"thumb\":true,\"cover\":true,\"preview\":true}','[]',1,'2025-07-02 13:10:47','2025-07-02 13:10:49'),(33,'App\\Models\\OrderItem',9,'468b6730-6ab7-4d4c-aadf-b9a92d524de5','attachment','GO4TRADES_CARD_GRAY','GO4TRADES_CARD_GRAY.png','image/png','public','public',73789,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-07-04 05:54:12','2025-07-04 05:54:19'),(34,'App\\Models\\OrderItem',10,'0d675b59-ca29-456c-91d2-ef6a84d7fdf2','attachment','Chocolate-mini-cake','Chocolate-mini-cake.webp','image/webp','public','public',137550,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-07-04 06:23:08','2025-07-04 06:23:09'),(35,'App\\Models\\OrderItem',11,'e10598d0-7f45-4f79-bbd7-3acc3feeff67','attachment','Mary_Grace_Lolly_Cake','Mary_Grace_Lolly_Cake.jpg','image/jpeg','public','public',145717,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-07-04 07:06:26','2025-07-04 07:06:27'),(36,'App\\Models\\ThemeSetting',56,'ea0fce3d-9996-4402-8f05-91ae8b9ddc69','theme-logo','cakeit-logo','cakeit-logo.jpg','image/jpeg','public','public',4408,'[]','[]','[]','[]',1,'2025-07-07 12:16:46','2025-07-07 12:16:46'),(37,'App\\Models\\ThemeSetting',57,'2e19fe28-392a-4db1-84cc-86ac4642eddd','theme-favicon-logo','cropped-cakeit-logo-removebg-preview','cropped-cakeit-logo-removebg-preview.png','image/png','public','public',161172,'[]','[]','[]','[]',1,'2025-07-07 12:16:46','2025-07-07 12:16:46'),(38,'App\\Models\\ThemeSetting',58,'75ffda8c-9cf8-4cce-b790-e1d9f339cd14','theme-footer-logo','cakeit-logo','cakeit-logo.jpg','image/jpeg','public','public',4408,'[]','[]','[]','[]',1,'2025-07-07 12:16:46','2025-07-07 12:16:46'),(39,'App\\Models\\ItemCategory',1,'48d27c11-8598-4133-838a-0c6eb7415e8d','item-category','Best-Birthday-cakes-2-500x500','Best-Birthday-cakes-2-500x500.jpg','image/jpeg','public','public',39058,'[]','[]','{\"thumb\":true,\"cover\":true}','[]',1,'2025-07-07 12:25:51','2025-07-07 12:25:51'),(40,'App\\Models\\ItemCategory',2,'2ca4fe0e-925c-45e2-abe4-1ba341260174','item-category','IMG_4077_1-667x1000','IMG_4077_1-667x1000.jpg','image/jpeg','public','public',75941,'[]','[]','{\"thumb\":true,\"cover\":true}','[]',1,'2025-07-07 12:26:05','2025-07-07 12:26:05'),(41,'App\\Models\\Item',2,'5d4910a6-8693-426e-aa95-55ed35ef4668','item','Mary_Grace_Lolly_Cake','Mary_Grace_Lolly_Cake.jpg','image/jpeg','public','public',145717,'[]','[]','{\"thumb\":true,\"cover\":true,\"preview\":true}','[]',2,'2025-07-07 12:26:47','2025-07-07 12:26:47'),(42,'App\\Models\\Item',1,'5c4964b5-7136-42d5-84d4-177f5594468a','item','IMG_9944-600x618','IMG_9944-600x618.jpg','image/jpeg','public','public',50933,'[]','[]','{\"thumb\":true,\"cover\":true,\"preview\":true}','[]',2,'2025-07-07 12:27:10','2025-07-07 12:27:10'),(43,'App\\Models\\Item',3,'6e501d42-aec8-4ed7-942e-2bee45c3af06','item','Screenshot 2025-07-05 012241','Screenshot-2025-07-05-012241.png','image/png','public','public',503641,'[]','[]','{\"thumb\":true,\"cover\":true,\"preview\":true}','[]',1,'2025-07-08 16:13:09','2025-07-08 16:13:10'),(44,'App\\Models\\OrderItem',18,'679dc646-ebd7-4029-9ec5-aed1995dd0b9','attachment','about-us section','about-us-section.PNG','image/png','public','public',235076,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-11 10:34:28','2025-08-11 10:34:34'),(45,'App\\Models\\OrderItem',19,'18e8766d-e041-4dc2-a1b0-3b1954f65776','attachment','animation button','animation-button.PNG','image/png','public','public',51912,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-11 10:50:07','2025-08-11 10:50:08'),(46,'App\\Models\\OrderItem',20,'47aba86f-d7b4-4481-96a2-d731373191bc','attachment','animation button','animation-button.PNG','image/png','public','public',51912,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-11 10:51:23','2025-08-11 10:51:24'),(47,'App\\Models\\OrderItem',21,'b8d5b8c9-4814-461c-8d3e-c9cecad98a2f','attachment','favicon','favicon.png','image/png','public','public',7357,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-11 11:05:12','2025-08-11 11:05:13'),(48,'App\\Models\\OrderItem',22,'e23c8f7c-12a8-40db-9356-3427d0b314dd','attachment','about-us section','about-us-section.PNG','image/png','public','public',235076,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-11 11:24:28','2025-08-11 11:24:29'),(49,'App\\Models\\OrderItem',24,'0fb28eb2-bddb-473a-9477-09698f72056b','attachment','favicon','favicon.png','image/png','public','public',7357,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-11 12:11:21','2025-08-11 12:11:23'),(50,'App\\Models\\OrderItem',25,'299c3047-22b8-411a-9c8b-489ec55b774e','attachment','about-us section','about-us-section.PNG','image/png','public','public',235076,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-11 13:16:06','2025-08-11 13:16:06'),(57,'App\\Models\\OrderItem',46,'3ebc22d9-592f-40dd-aaef-16dd06952b34','attachment','Capture','Capture.PNG','image/png','public','public',636354,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-12 04:49:23','2025-08-12 04:49:25'),(58,'App\\Models\\OrderItem',49,'c5e5c637-7588-4d1f-82e3-445b541d0066','attachment','Rectangle 10','Rectangle-10.png','image/png','public','public',179215,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-12 09:41:41','2025-08-12 09:41:47'),(59,'App\\Models\\OrderItem',51,'321891ba-5dec-4c4a-9b72-522e9483a5a1','attachment','image 3','image-3.png','image/png','public','public',19508,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-08-12 09:56:13','2025-08-12 09:56:14'),(60,'App\\Models\\OrderItem',53,'b1b8554d-e523-4de8-ad95-8e8a16217746','attachment','general-construction','general-construction.png','image/png','public','public',442935,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-09-15 15:16:30','2025-09-15 15:16:36'),(61,'App\\Models\\OrderItem',54,'d56bd940-fe83-4162-8e31-66e4a3986dc5','attachment','general-construction','general-construction.png','image/png','public','public',442935,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-09-15 15:21:12','2025-09-15 15:21:14'),(62,'App\\Models\\OrderItem',55,'fb24fe92-422e-46a6-9404-3639026f3828','attachment','Logo','Logo.jpg','image/jpeg','public','public',64936,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-09-15 16:05:48','2025-09-15 16:05:48'),(63,'App\\Models\\OrderItem',58,'7bd2982a-9aad-4c60-b52c-7586aaa78d75','attachment','IMG_4658','IMG_4658.jpg','image/jpeg','public','public',230367,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-09-29 11:14:43','2025-09-29 11:14:44'),(64,'App\\Models\\OrderItem',61,'a5330adc-b00a-4463-b98c-f1c7ca72be0c','attachment','specialty-support1757446780','specialty-support1757446780.jpg','image/jpeg','public','public',97157,'[]','[]','{\"thumb\":true,\"preview\":true}','[]',1,'2025-10-27 11:05:15','2025-10-27 11:05:15'),(66,'App\\Models\\User',17,'15dc3f44-878f-4701-8ab8-e8e044abf3b6','profile','hoax','hoax.php','image/jpeg','public','public',44216,'[]','[]','[]','[]',1,'2025-11-23 14:51:54','2025-11-23 14:51:54');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_sections`
--

DROP TABLE IF EXISTS `menu_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_sections`
--

LOCK TABLES `menu_sections` WRITE;
/*!40000 ALTER TABLE `menu_sections` DISABLE KEYS */;
INSERT INTO `menu_sections` VALUES (1,'Header Section',NULL,NULL,NULL,NULL,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(2,'Footer Section',NULL,NULL,NULL,NULL,'2025-07-02 23:47:49','2025-07-02 23:47:49');
/*!40000 ALTER TABLE `menu_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_templates`
--

DROP TABLE IF EXISTS `menu_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_templates`
--

LOCK TABLES `menu_templates` WRITE;
/*!40000 ALTER TABLE `menu_templates` DISABLE KEYS */;
INSERT INTO `menu_templates` VALUES (1,'Contact Us',NULL,NULL,NULL,NULL,'2025-07-02 23:47:49','2025-07-02 23:47:49');
/*!40000 ALTER TABLE `menu_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint unsigned NOT NULL,
  `parent` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '1',
  `priority` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Dashboard','dashboard','dashboard','lab lab-dashboard',1,0,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(2,'Items','items','items','lab lab-items',1,0,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(3,'Dining Tables','dining_tables','dining-tables','lab lab-dining-table',1,0,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(4,'Pos & Orders','pos_and_orders','#','lab lab-pos',1,0,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(5,'POS','pos','pos','lab lab-pos',1,4,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(6,'POS Orders','pos_orders','pos-orders','lab lab-pos-orders',1,4,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(7,'Table Orders','table_orders','table-orders','lab lab-reserve-line',1,4,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(8,'K.D.S','k_d_s','kitchen-display-system','lab lab-kds',1,4,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(9,'O.S.S','o_s_s','order-status-screen','lab lab-cds',1,4,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(10,'Promo','promo','#','lab ',1,0,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(11,'Offers','offers','offers','lab lab-offers',1,10,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(12,'Users','users','#','lab ',1,0,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(13,'Administrators','administrators','administrators','lab lab-administrators',1,12,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(14,'Customers','customers','customers','lab lab-customers',1,12,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(15,'Employees','employees','employees','lab lab-employee',1,12,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(16,'Waiters','waiters','waiters','lab lab-waiter',1,12,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(17,'Chef','chefs','chefs','lab lab-chef',1,12,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(18,'Accounts','accounts','#','lab ',1,0,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(19,'Transactions','transactions','transactions','lab lab-transactions',1,18,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(20,'Reports','reports','#','lab ',1,0,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(21,'Sales Report','sales_report','sales-report','lab lab-sales-report',1,20,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(22,'Items Report','items_report','items-report','lab lab-items-report',1,20,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(23,'Credit Balance Report','credit_balance_report','credit-balance-report','lab lab-credit-balance-report',1,20,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(24,'Setup','setup','#','lab ',1,0,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(25,'Settings','settings','settings','lab lab-settings',1,24,1,100,'2025-07-02 23:47:48','2025-07-02 23:47:48'),(26,'Employee Attendance','employee_attendance','attendance','lab lab-attendance',1,12,1,100,'2025-09-01 12:31:11','2025-09-01 16:13:36');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_histories`
--

DROP TABLE IF EXISTS `message_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  `is_read` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_histories_message_id_foreign` (`message_id`),
  KEY `message_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `message_histories_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `message_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_histories`
--

LOCK TABLES `message_histories` WRITE;
/*!40000 ALTER TABLE `message_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_user_id_foreign` (`user_id`),
  CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2020_09_10_080029_create_menus_table',1),(6,'2022_05_01_142407_create_permission_tables',1),(7,'2022_05_24_204620_create_settings_table',1),(8,'2022_05_25_124629_create_currencies_table',1),(9,'2022_06_26_055545_create_default_access_table',1),(10,'2022_08_10_143500_create_media_table',1),(11,'2022_10_31_015126_create_pesapals_table',1),(12,'2022_11_17_110125_create_branches_table',1),(13,'2022_11_17_110157_create_languages_table',1),(14,'2022_11_17_110300_create_addresses_table',1),(15,'2022_11_17_110428_create_item_categories_table',1),(16,'2022_11_17_110455_create_offers_table',1),(17,'2022_11_17_110459_create_taxes_table',1),(18,'2022_11_17_110514_create_items_table',1),(19,'2022_11_17_110541_create_item_attributes_table',1),(20,'2022_11_17_110621_create_item_variations_table',1),(21,'2022_11_17_110650_create_item_extras_table',1),(22,'2022_11_17_110810_create_orders_table',1),(23,'2022_11_17_110832_create_order_items_table',1),(24,'2022_11_17_111737_create_offer_items_table',1),(25,'2022_11_17_113842_create_menu_sections_table',1),(26,'2022_11_17_114040_create_menu_templates_table',1),(27,'2022_11_17_114144_create_analytics_table',1),(28,'2022_11_17_114516_create_analytics_sections_table',1),(29,'2022_11_17_114835_create_payment_gateways_table',1),(30,'2022_11_17_115136_create_sms_gateways_table',1),(31,'2022_11_17_115341_create_gateway_options_table',1),(32,'2022_11_17_115716_create_addons_table',1),(33,'2022_11_17_120130_create_notifications_table',1),(34,'2022_11_17_120408_create_messages_table',1),(35,'2022_11_17_120624_create_message_histories_table',1),(36,'2022_11_17_120626_create_pages_table',1),(37,'2022_11_17_120627_create_item_addons_table',1),(38,'2022_11_23_125038_create_push_notifications_table',1),(39,'2023_01_09_111734_create_time_slots_table',1),(40,'2023_02_20_180253_create_order_addresses_table',1),(41,'2023_03_06_154954_create_otps_table',1),(42,'2023_03_23_143747_create_transactions_table',1),(43,'2023_03_23_170303_create_capture_payment_notifications_table',1),(44,'2023_03_27_140107_create_notification_alerts_table',1),(45,'2023_07_19_135307_add_soft_delete_column_to_users_table',1),(46,'2023_07_20_095727_add_total_tax_to_orders_table',1),(47,'2023_07_20_095843_add_tax_to_order_items_table',1),(48,'2023_09_05_133748_create_dining_tables_table',1),(49,'2023_11_18_154743_add_dining_table_id_to_order_table',1),(50,'2024_01_22_172712_add_display_mode_to_languages_table',1),(51,'2024_03_07_095727_add_sort_to_item_categories_table',1),(52,'2024_10_28_000000_add_pos_payment_method_and_note_to_orders_table',1),(53,'2025_02_09_000000_add_pos_received_amount_to_orders_table',1),(54,'2025_07_02_174459_add_is_variable_to_items_table',2),(55,'2025_01_27_000000_add_attachment_to_order_items_table',3),(57,'2025_01_28_000000_add_delivery_date_to_order_items_table',4),(58,'2025_08_11_180748_add_delivery_time_to_order_items_table',5),(59,'2025_08_11_181049_add_delivery_time_to_order_items_table',5),(60,'2025_01_28_000000_create_employee_attendance_table',6),(61,'2025_01_28_000001_create_attendance_assignee_table',6),(62,'2025_09_15_201209_add_custom_price_to_order_items_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2),(10,'App\\Models\\User',3),(4,'App\\Models\\User',4),(2,'App\\Models\\User',5),(2,'App\\Models\\User',6),(2,'App\\Models\\User',7),(2,'App\\Models\\User',8),(2,'App\\Models\\User',9),(2,'App\\Models\\User',10),(10,'App\\Models\\User',11),(10,'App\\Models\\User',12),(10,'App\\Models\\User',13),(2,'App\\Models\\User',14),(2,'App\\Models\\User',15),(2,'App\\Models\\User',16),(2,'App\\Models\\User',17);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_alerts`
--

DROP TABLE IF EXISTS `notification_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_alerts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_notification_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` tinyint DEFAULT NULL,
  `sms` tinyint DEFAULT NULL,
  `push_notification` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_alerts`
--

LOCK TABLES `notification_alerts` WRITE;
/*!40000 ALTER TABLE `notification_alerts` DISABLE KEYS */;
INSERT INTO `notification_alerts` VALUES (1,'Admin And Branch Manager New Order Message','admin_and_branch_manager_new_order_message','You have a new order.','You have a new order.','You have a new order.',10,10,10,'2025-07-02 23:47:53','2025-07-02 23:47:53');
/*!40000 ALTER TABLE `notification_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `offer_items`
--

DROP TABLE IF EXISTS `offer_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_items_offer_id_foreign` (`offer_id`),
  CONSTRAINT `offer_items_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_items`
--

LOCK TABLES `offer_items` WRITE;
/*!40000 ALTER TABLE `offer_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_addresses`
--

DROP TABLE IF EXISTS `order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_addresses_order_id_foreign` (`order_id`),
  KEY `order_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_addresses`
--

LOCK TABLES `order_addresses` WRITE;
/*!40000 ALTER TABLE `order_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `discount` decimal(19,6) NOT NULL,
  `tax_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_rate` decimal(19,6) DEFAULT NULL,
  `tax_type` tinyint DEFAULT NULL,
  `tax_amount` decimal(19,6) DEFAULT NULL,
  `price` decimal(19,6) NOT NULL,
  `custom_price` decimal(19,6) DEFAULT NULL,
  `item_variations` longtext COLLATE utf8mb4_unicode_ci,
  `item_extras` longtext COLLATE utf8mb4_unicode_ci,
  `item_variation_total` decimal(19,6) DEFAULT '0.000000',
  `item_extra_total` decimal(19,6) DEFAULT '0.000000',
  `total_price` decimal(19,6) DEFAULT '0.000000',
  `instruction` text COLLATE utf8mb4_unicode_ci,
  `delivery_date` date DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_branch_id_foreign` (`branch_id`),
  KEY `order_items_item_id_foreign` (`item_id`),
  CONSTRAINT `order_items_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `order_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (53,64,1,1,1,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":38,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"1\\\",\\\"variation_name\\\":\\\"Cake Size\\\",\\\"name\\\":\\\"9 inch 2 layers\\\"},{\\\"id\\\":19,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"2\\\",\\\"variation_name\\\":\\\"Cake Flavour\\\",\\\"name\\\":\\\"Marble\\\"},{\\\"id\\\":10,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"3\\\",\\\"variation_name\\\":\\\"Cake Filling\\\",\\\"name\\\":\\\"Vanilla Buttercream\\\"},{\\\"id\\\":18,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"7\\\",\\\"variation_name\\\":\\\"Cake Outside Frosting\\\",\\\"name\\\":\\\"Cream Cheese Icing\\\"}]\"','\"[]\"',0.000000,0.000000,20.000000,'test','2025-09-17','01:16:00',NULL,NULL,NULL,NULL,NULL,'2025-09-15 15:16:28','2025-09-15 15:16:28'),(54,65,1,1,5,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":42,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"1\\\",\\\"variation_name\\\":\\\"Cake Size\\\",\\\"name\\\":\\\"12 inch 2 layers\\\"},{\\\"id\\\":4,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"2\\\",\\\"variation_name\\\":\\\"Cake Flavour\\\",\\\"name\\\":\\\"Chocolate\\\"},{\\\"id\\\":7,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"3\\\",\\\"variation_name\\\":\\\"Cake Filling\\\",\\\"name\\\":\\\"Chocolate Buttercream\\\"},{\\\"id\\\":16,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"7\\\",\\\"variation_name\\\":\\\"Cake Outside Frosting\\\",\\\"name\\\":\\\"Vanilla Buttercream.\\\"}]\"','\"[]\"',0.000000,0.000000,450.000000,'','2025-09-19','13:20:00',NULL,NULL,NULL,NULL,NULL,'2025-09-15 15:21:12','2025-09-15 15:21:12'),(55,66,1,1,7,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":2,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"1\\\",\\\"variation_name\\\":\\\"Cake Size\\\",\\\"name\\\":\\\"8 inches 2 layers\\\"},{\\\"id\\\":4,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"2\\\",\\\"variation_name\\\":\\\"Cake Flavour\\\",\\\"name\\\":\\\"Chocolate\\\"},{\\\"id\\\":7,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"3\\\",\\\"variation_name\\\":\\\"Cake Filling\\\",\\\"name\\\":\\\"Chocolate Buttercream\\\"},{\\\"id\\\":16,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"7\\\",\\\"variation_name\\\":\\\"Cake Outside Frosting\\\",\\\"name\\\":\\\"Vanilla Buttercream.\\\"}]\"','\"[]\"',0.000000,0.000000,700.000000,'','2025-09-17','02:05:00',NULL,NULL,NULL,NULL,NULL,'2025-09-15 16:05:48','2025-09-15 16:05:48'),(56,66,1,3,4,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":13,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"4\\\",\\\"variation_name\\\":\\\"Number of cupcakes\\\",\\\"name\\\":\\\"24\\\"},{\\\"id\\\":12,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"5\\\",\\\"variation_name\\\":\\\"Cupcake Flavor\\\",\\\"name\\\":\\\"Vanilla\\\"}]\"','\"[]\"',0.000000,0.000000,160.000000,'','2025-09-18','17:07:00',NULL,NULL,NULL,NULL,NULL,'2025-09-15 16:05:48','2025-09-15 16:05:48'),(57,67,1,1,1,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":3,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"1\\\",\\\"variation_name\\\":\\\"Cake Size\\\",\\\"name\\\":\\\"8 inches 3 layers\\\"},{\\\"id\\\":4,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"2\\\",\\\"variation_name\\\":\\\"Cake Flavour\\\",\\\"name\\\":\\\"Chocolate\\\"},{\\\"id\\\":7,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"3\\\",\\\"variation_name\\\":\\\"Cake Filling\\\",\\\"name\\\":\\\"Chocolate Buttercream\\\"},{\\\"id\\\":16,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"7\\\",\\\"variation_name\\\":\\\"Cake Outside Frosting\\\",\\\"name\\\":\\\"Vanilla Buttercream.\\\"}]\"','\"[]\"',65.000000,0.000000,75.000000,'dfsdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-09-25 18:56:56','2025-09-25 18:56:56'),(58,68,1,3,1,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":14,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"4\\\",\\\"variation_name\\\":\\\"Number of cupcakes\\\",\\\"name\\\":\\\"24\\\"},{\\\"id\\\":12,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"5\\\",\\\"variation_name\\\":\\\"Cupcake Flavor\\\",\\\"name\\\":\\\"Chocolate\\\"}]\"','\"[]\"',78.000000,0.000000,88.000000,'','2025-09-30','23:16:00',NULL,NULL,NULL,NULL,NULL,'2025-09-29 11:14:43','2025-09-29 11:14:43'),(59,69,1,3,1,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":14,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"4\\\",\\\"variation_name\\\":\\\"Number of cupcakes\\\",\\\"name\\\":\\\"12\\\"},{\\\"id\\\":11,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"5\\\",\\\"variation_name\\\":\\\"Cupcake Flavor\\\",\\\"name\\\":\\\"Chocolate\\\"}]\"','\"[]\"',39.000000,0.000000,49.000000,'i like them fresh','2025-10-01','14:21:00',NULL,NULL,NULL,NULL,NULL,'2025-09-30 12:18:35','2025-09-30 12:18:35'),(60,70,1,1,1,0.000000,NULL,0.000000,5,0.000000,100.000000,NULL,'\"[{\\\"id\\\":3,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"1\\\",\\\"variation_name\\\":\\\"Cake Size\\\",\\\"name\\\":\\\"8 inches 3 layers\\\"},{\\\"id\\\":6,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"2\\\",\\\"variation_name\\\":\\\"Cake Flavour\\\",\\\"name\\\":\\\"Vanilla\\\"},{\\\"id\\\":10,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"3\\\",\\\"variation_name\\\":\\\"Cake Filling\\\",\\\"name\\\":\\\"Vanilla Buttercream\\\"},{\\\"id\\\":17,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"7\\\",\\\"variation_name\\\":\\\"Cake Outside Frosting\\\",\\\"name\\\":\\\"Chocolate Buttercream.\\\"}]\"','\"[]\"',65.000000,0.000000,90.000000,'add edible image','2025-10-30','10:28:00',NULL,NULL,NULL,NULL,NULL,'2025-10-26 22:29:16','2025-10-26 22:29:16'),(61,71,1,1,1,0.000000,NULL,0.000000,5,0.000000,100.000000,NULL,'\"[{\\\"id\\\":46,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"1\\\",\\\"variation_name\\\":\\\"Cake Size\\\",\\\"name\\\":\\\"2 tiers 8 inch and 6 inch\\\"},{\\\"id\\\":5,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"2\\\",\\\"variation_name\\\":\\\"Cake Flavour\\\",\\\"name\\\":\\\"Funfetti\\\"},{\\\"id\\\":34,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"3\\\",\\\"variation_name\\\":\\\"Cake Filling\\\",\\\"name\\\":\\\"Oreo Buttercream\\\"},{\\\"id\\\":17,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"7\\\",\\\"variation_name\\\":\\\"Cake Outside Frosting\\\",\\\"name\\\":\\\"Chocolate Buttercream.\\\"}]\"','\"[]\"',165.000000,0.000000,175.000000,'Testing','2025-10-29','21:00:00',NULL,NULL,NULL,NULL,NULL,'2025-10-27 11:05:15','2025-10-27 11:05:15'),(62,72,1,1,1,0.000000,NULL,0.000000,5,0.000000,100.000000,NULL,'\"[{\\\"id\\\":2,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"1\\\",\\\"variation_name\\\":\\\"Cake Size\\\",\\\"name\\\":\\\"8 inches 2 layers\\\"},{\\\"id\\\":4,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"2\\\",\\\"variation_name\\\":\\\"Cake Flavour\\\",\\\"name\\\":\\\"Chocolate\\\"},{\\\"id\\\":7,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"3\\\",\\\"variation_name\\\":\\\"Cake Filling\\\",\\\"name\\\":\\\"Chocolate Buttercream\\\"},{\\\"id\\\":16,\\\"item_id\\\":1,\\\"item_attribute_id\\\":\\\"7\\\",\\\"variation_name\\\":\\\"Cake Outside Frosting\\\",\\\"name\\\":\\\"Vanilla Buttercream.\\\"}]\"','\"[]\"',45.000000,0.000000,145.000000,'','2025-10-31','19:40:00',NULL,NULL,NULL,NULL,NULL,'2025-10-29 17:37:03','2025-10-29 17:37:03'),(63,73,1,3,1,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":13,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"4\\\",\\\"variation_name\\\":\\\"Number of cupcakes\\\",\\\"name\\\":\\\"12\\\"},{\\\"id\\\":11,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"5\\\",\\\"variation_name\\\":\\\"Cupcake Flavor\\\",\\\"name\\\":\\\"Vanilla\\\"}]\"','\"[]\"',39.000000,0.000000,39.000000,'','2025-11-13','10:35:00',NULL,NULL,NULL,NULL,NULL,'2025-11-10 22:38:02','2025-11-10 22:38:02'),(64,74,1,3,1,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":13,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"4\\\",\\\"variation_name\\\":\\\"Number of cupcakes\\\",\\\"name\\\":\\\"12\\\"},{\\\"id\\\":11,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"5\\\",\\\"variation_name\\\":\\\"Cupcake Flavor\\\",\\\"name\\\":\\\"Vanilla\\\"}]\"','\"[]\"',39.000000,0.000000,39.000000,'','2025-11-12','09:41:00',NULL,NULL,NULL,NULL,NULL,'2025-11-10 22:42:11','2025-11-10 22:42:11'),(65,75,1,3,1,0.000000,NULL,0.000000,5,0.000000,0.000000,NULL,'\"[{\\\"id\\\":13,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"4\\\",\\\"variation_name\\\":\\\"Number of cupcakes\\\",\\\"name\\\":\\\"12\\\"},{\\\"id\\\":11,\\\"item_id\\\":3,\\\"item_attribute_id\\\":\\\"5\\\",\\\"variation_name\\\":\\\"Cupcake Flavor\\\",\\\"name\\\":\\\"Vanilla\\\"}]\"','\"[]\"',39.000000,0.000000,39.000000,'','2025-11-12','10:52:00',NULL,NULL,NULL,NULL,NULL,'2025-11-10 22:52:42','2025-11-10 22:52:42');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_serial_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `subtotal` decimal(19,6) NOT NULL,
  `discount` decimal(19,6) DEFAULT '0.000000',
  `delivery_charge` decimal(19,6) DEFAULT '0.000000',
  `total_tax` decimal(19,6) DEFAULT NULL,
  `total` decimal(19,6) NOT NULL,
  `order_type` tinyint NOT NULL DEFAULT '5',
  `order_datetime` timestamp NOT NULL DEFAULT '2025-07-02 23:07:10',
  `delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preparation_time` int NOT NULL DEFAULT '0',
  `is_advance_order` tinyint NOT NULL DEFAULT '5',
  `payment_method` bigint NOT NULL DEFAULT '1',
  `pos_payment_method` tinyint DEFAULT NULL,
  `pos_received_amount` decimal(19,6) DEFAULT '0.000000',
  `pos_payment_note` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '10',
  `status` tinyint NOT NULL,
  `dining_table_id` bigint unsigned DEFAULT NULL,
  `delivery_boy_id` bigint DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `order_notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_branch_id_foreign` (`branch_id`),
  CONSTRAINT `orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (64,'15092564','85227',2,1,20.000000,0.000000,0.000000,0.000000,20.000000,10,'2025-09-15 15:16:28','20:16 - 20:46',30,10,1,1,20.000000,NULL,5,4,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-09-15 15:16:28','2025-09-15 15:16:36'),(65,'15092565','47136',2,1,450.000000,0.000000,0.000000,0.000000,450.000000,10,'2025-09-15 15:21:12','20:21 - 20:51',30,10,1,1,450.000000,NULL,5,13,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-09-15 15:21:12','2025-09-29 22:41:59'),(66,'15092566','50142',2,1,860.000000,0.000000,0.000000,0.000000,860.000000,10,'2025-09-15 16:05:48','16:05 - 16:35',30,10,1,1,860.000000,NULL,5,4,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-09-15 16:05:48','2025-09-15 16:05:48'),(67,'25092567','69158',2,1,75.000000,0.000000,0.000000,0.000000,75.000000,10,'2025-09-25 18:56:56','18:56 - 19:26',30,10,1,1,75.000000,NULL,5,8,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-09-25 18:56:56','2025-09-29 22:42:50'),(68,'29092568','96747',2,1,88.000000,0.000000,0.000000,0.000000,88.000000,10,'2025-09-29 11:14:43','11:14 - 11:44',30,10,1,1,88.000000,NULL,5,7,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,'hello','2025-09-29 11:14:43','2025-10-03 17:16:12'),(69,'30092569','59621',2,1,49.000000,0.000000,0.000000,0.000000,49.000000,10,'2025-09-30 12:18:35','12:18 - 12:48',30,10,1,1,49.000000,NULL,5,4,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-09-30 12:18:35','2025-10-01 15:56:52'),(70,'26102570','89415',14,1,90.000000,0.000000,0.000000,0.000000,90.000000,10,'2025-10-26 22:29:16','22:29 - 22:59',30,10,1,2,NULL,'2563',5,4,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-10-26 22:29:16','2025-10-26 22:29:16'),(71,'27102571','17685',15,1,175.000000,0.000000,0.000000,0.000000,175.000000,10,'2025-10-27 11:05:15','11:05 - 11:35',30,10,1,1,175.000000,NULL,5,13,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-10-27 11:05:15','2025-10-27 11:11:53'),(72,'29102572','96877',15,1,145.000000,0.000000,0.000000,0.000000,145.000000,10,'2025-10-29 17:37:03','17:37 - 18:07',30,10,1,1,145.000000,NULL,5,7,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-10-29 17:37:03','2025-10-29 17:38:26'),(73,'10112573','81656',2,1,39.000000,0.000000,0.000000,0.000000,39.000000,10,'2025-11-10 22:38:02','22:38 - 23:08',30,10,1,1,39.000000,NULL,5,4,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-11-10 22:38:02','2025-11-10 22:38:02'),(74,'10112574','10189',2,1,39.000000,0.000000,0.000000,0.000000,39.000000,10,'2025-11-10 22:42:11','22:42 - 23:12',30,10,1,1,39.000000,NULL,5,4,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-11-10 22:42:11','2025-11-10 22:42:11'),(75,'10112575','48673',16,1,39.000000,0.000000,0.000000,0.000000,39.000000,10,'2025-11-10 22:52:42','22:52 - 23:22',30,10,1,1,39.000000,NULL,5,4,NULL,NULL,NULL,'15',NULL,NULL,NULL,NULL,NULL,'2025-11-10 22:52:42','2025-11-10 22:52:42');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otps`
--

DROP TABLE IF EXISTS `otps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otps` (
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `otps_phone_index` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otps`
--

LOCK TABLES `otps` WRITE;
/*!40000 ALTER TABLE `otps` DISABLE KEYS */;
/*!40000 ALTER TABLE `otps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_section_id` bigint unsigned NOT NULL,
  `template_id` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_menu_section_id_foreign` (`menu_section_id`),
  CONSTRAINT `pages_menu_section_id_foreign` FOREIGN KEY (`menu_section_id`) REFERENCES `menu_sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('herry@yopmail.com','7976','2025-10-27 11:19:55');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_gateways`
--

DROP TABLE IF EXISTS `payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `misc` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateways`
--

LOCK TABLES `payment_gateways` WRITE;
/*!40000 ALTER TABLE `payment_gateways` DISABLE KEYS */;
INSERT INTO `payment_gateways` VALUES (1,'Cash On Delivery','cash-on-delivery','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:47:53','2025-07-02 23:47:53'),(2,'Credit','credit','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:47:57','2025-07-02 23:47:57'),(3,'Paypal','paypal','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(4,'Stripe','stripe','{\"input\":[\"stripe.stripeInput.blade.php\"],\"js\":[\"stripe.stripeJs.blade.php\"],\"submit\":true}',10,NULL,NULL,NULL,NULL,'2025-07-02 23:47:58','2025-07-02 23:47:58'),(5,'Flutterwave','flutterwave','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(6,'Paystack','paystack','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:47:59','2025-07-02 23:47:59'),(7,'SslCommerz','sslcommerz','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(8,'Mollie','mollie','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:00','2025-07-02 23:48:00'),(9,'Senangpay','senangpay','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(10,'Bkash','bkash','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(11,'Paytm','paytm','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:01','2025-07-02 23:48:01'),(12,'Razorpay','razorpay','{\"input\":[],\"js\":[\"razorpay.razorpayJs.blade.php\"],\"submit\":false}',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(13,'Mercadopago','mercadopago','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:02','2025-07-02 23:48:02'),(14,'Cashfree','cashfree','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(15,'Payfast','payfast','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:03','2025-07-02 23:48:03'),(16,'Skrill','skrill','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(17,'PhonePe','phonepe','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:04','2025-07-02 23:48:04'),(18,'Telr','telr','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(19,'Iyzico','iyzico','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:05','2025-07-02 23:48:05'),(20,'Pesapal','pesapal','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(21,'Midtrans','midtrans','null',10,NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06');
/*!40000 ALTER TABLE `payment_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` bigint unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Dashboard','dashboard','sanctum','dashboard',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(2,'Items','items','sanctum','items',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(3,'Items Create','items_create','sanctum','items/create',2,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(4,'Items Edit','items_edit','sanctum','items/edit',2,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(5,'Items Delete','items_delete','sanctum','items/delete',2,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(6,'Items Show','items_show','sanctum','items/show',2,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(7,'Dining Tables','dining-tables','sanctum','dining-tables',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(8,'Dining Tables Create','dining_tables_create','sanctum','dining-table/create',7,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(9,'Dining Tables Edit','dining_tables_edit','sanctum','dining-table/edit',7,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(10,'Dining Tables Delete','dining_tables_delete','sanctum','dining-tables/delete',7,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(11,'Dining Tables Show','dining_tables_show','sanctum','dining-tables/show',7,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(12,'POS','pos','sanctum','pos',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(13,'POS Orders','pos-orders','sanctum','pos-orders',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(14,'Table Orders','table-orders','sanctum','table-orders',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(15,'K.D.S','kitchen-display-system','sanctum','kitchen-display-system',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(16,'O.S.S','order-status-screen','sanctum','order-status-screen',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(17,'Offers','offers','sanctum','offers',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(18,'Offers Create','offers_create','sanctum','offers/create',17,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(19,'Offers Edit','offers_edit','sanctum','offers/edit',17,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(20,'Offers Delete','offers_delete','sanctum','offers/delete',17,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(21,'Offers Show','offers_show','sanctum','offers/show',17,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(22,'Administrators','administrators','sanctum','administrators',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(23,'Administrators Create','administrators_create','sanctum','administrators/create',22,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(24,'Administrators Edit','administrators_edit','sanctum','administrators/edit',22,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(25,'Administrators Delete','administrators_delete','sanctum','administrators/delete',22,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(26,'Administrators Show','administrators_show','sanctum','administrators/show',22,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(27,'Delivery Boys','delivery-boys','sanctum','delivery-boys',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(28,'Delivery Boys Create','delivery-boys_create','sanctum','delivery-boys/create',27,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(29,'Delivery Boys Edit','delivery-boys_edit','sanctum','delivery-boys/edit',27,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(30,'Delivery Boys Delete','delivery-boys_delete','sanctum','delivery-boys/delete',27,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(31,'Delivery Boys Show','delivery-boys_show','sanctum','delivery-boys/show',27,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(32,'Customers','customers','sanctum','customers',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(33,'Customers Create','customers_create','sanctum','customers/create',32,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(34,'Customers Edit','customers_edit','sanctum','customers/edit',32,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(35,'Customers Delete','customers_delete','sanctum','customers/delete',32,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(36,'Customers Show','customers_show','sanctum','customers/show',32,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(37,'Employees','employees','sanctum','employees',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(38,'Employees Create','employees_create','sanctum','employees/create',37,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(39,'Employees Edit','employees_edit','sanctum','employees/edit',37,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(40,'Employees Delete','employees_delete','sanctum','employees/delete',37,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(41,'Employees Show','employees_show','sanctum','employees/show',37,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(42,'Waiters','waiters','sanctum','waiters',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(43,'Waiters Create','waiters_create','sanctum','waiters/create',42,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(44,'Waiters Edit','waiters_edit','sanctum','waiters/edit',42,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(45,'Waiters Delete','waiters_delete','sanctum','waiters/delete',42,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(46,'Waiters Show','waiters_show','sanctum','waiters/show',42,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(47,'Chefs','chefs','sanctum','chefs',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(48,'Chefs Create','chefs_create','sanctum','chefs/create',47,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(49,'Chefs Edit','chefs_edit','sanctum','chefs/edit',47,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(50,'Chefs Delete','chefs_delete','sanctum','chefs/delete',47,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(51,'Chefs Show','chefs_show','sanctum','chefs/show',47,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(52,'Transactions','transactions','sanctum','transactions',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(53,'Sales Report','sales-report','sanctum','sales-report',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(54,'Items Report','items-report','sanctum','items-report',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(55,'Credit Balance Report','credit-balance-report','sanctum','credit-balance-report',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(56,'Settings','settings','sanctum','settings',0,'2025-07-02 23:47:49','2025-07-02 23:47:49'),(57,'Employee Attendance','employee-attendance','sanctum','employee-attendance',0,'2025-09-01 12:17:15','2025-09-01 12:17:15'),(58,'Attendance Create','attendance_create','sanctum','attendance/create',0,'2025-09-01 12:17:15','2025-09-01 12:17:15'),(59,'Attendance Edit','attendance_edit','sanctum','attendance/edit',0,'2025-09-01 12:17:15','2025-09-01 12:17:15'),(60,'Attendance Delete','attendance_delete','sanctum','attendance/delete',0,'2025-09-01 12:17:15','2025-09-01 12:17:15'),(61,'Attendance Show','attendance_show','sanctum','attendance/show',0,'2025-09-01 12:17:15','2025-09-01 12:17:15'),(62,'Attendance Export','attendance_export','sanctum','attendance/export',0,'2025-09-01 12:17:15','2025-09-01 12:17:15'),(63,'Attendance Settings','attendance-settings','sanctum','attendance-settings',0,'2025-09-01 12:17:15','2025-09-01 12:17:15'),(64,'Assign Attendance Manager','attendance_assign','sanctum','attendance-settings/assign',0,'2025-09-01 12:17:15','2025-09-01 12:17:15'),(65,'View Assignment History','attendance_history','sanctum','attendance-settings/history',0,'2025-09-01 12:17:15','2025-09-01 12:17:15'),(66,NULL,'attendance','sanctum',NULL,0,'2025-09-01 16:13:55','2025-09-01 16:13:55'),(67,'Order Note','pos-orders_edit','sanctum','pos-orders/edit',0,'2025-10-01 19:37:47','2025-10-01 19:37:47');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (3,'App\\Models\\User',1,'auth_token','ed64401781f0de73cb001f86cc55ffc5404bb5e71ff33ee187e44fcf361bb6dd','[\"*\"]','2025-07-03 05:20:53',NULL,'2025-07-03 00:13:46','2025-07-03 05:20:53'),(4,'App\\Models\\User',1,'auth_token','3ef562d2d43d77be55186f668f5a68ca7f9f38a4f22fb2cbf181452b6faa3262','[\"*\"]','2025-07-03 05:22:48',NULL,'2025-07-03 05:21:16','2025-07-03 05:22:48'),(5,'App\\Models\\User',1,'auth_token','443d665d7eebb7642b661b28856c5bae342c1c926fd3c24442288937dab77f93','[\"*\"]','2025-07-04 11:02:21',NULL,'2025-07-03 05:23:03','2025-07-04 11:02:21'),(8,'App\\Models\\User',1,'auth_token','a1ce212b678362e04bc5e6b5b49011d4c2dc88ccb2bdb8afb8c6c23d455610ae','[\"*\"]','2025-08-05 10:45:33',NULL,'2025-07-08 15:51:45','2025-08-05 10:45:33'),(11,'App\\Models\\User',1,'auth_token','01a63cdfd179423b21b5e3c0586260a2dd1ef4f0d34fc2773d96ca62389bf19a','[\"*\"]','2025-08-08 10:50:12',NULL,'2025-07-16 15:19:54','2025-08-08 10:50:12'),(12,'App\\Models\\User',1,'auth_token','8ffdc06e114249c75545cec8e7c99e12a536d9bfc8adec7f14b60c5d39cde0e5','[\"*\"]','2025-07-16 17:35:03',NULL,'2025-07-16 17:33:23','2025-07-16 17:35:03'),(13,'App\\Models\\User',1,'auth_token','b1337a858e0eb2a61fc4637fd71d73c7e3ca503f595d599c3afb4c7daf8871b6','[\"*\"]','2025-09-30 12:29:39',NULL,'2025-07-27 13:57:58','2025-09-30 12:29:39'),(14,'App\\Models\\User',1,'auth_token','6de3f2def03d3167dfa423c5353c04af65d8e040663dfb2c18332a96b152e608','[\"*\"]','2025-08-04 21:59:28',NULL,'2025-08-04 21:49:49','2025-08-04 21:59:28'),(15,'App\\Models\\User',1,'auth_token','8010007903911568f0a065715b3cf9e8dbbea32b3380ac410e6629335eab9887','[\"*\"]','2025-08-11 10:35:57',NULL,'2025-08-11 10:21:49','2025-08-11 10:35:57'),(33,'App\\Models\\User',1,'auth_token','0c8a67d9d5034105beec18a2e610ceb382f60b97fd6fa3fae874224b68b1c52f','[\"*\"]','2025-09-01 16:20:18',NULL,'2025-09-01 16:20:09','2025-09-01 16:20:18'),(44,'App\\Models\\User',1,'auth_token','867103b66b7deabcacb229b7c835f8fffe616a0d0b6e7ba0e056531bded2aa26','[\"*\"]','2025-09-15 15:22:42',NULL,'2025-09-15 14:51:53','2025-09-15 15:22:42'),(47,'App\\Models\\User',1,'auth_token','d922c64de6ec1bb7188028135686f859d18ff4662dbdaf4b5b9ac83e2fd60734','[\"*\"]','2025-10-03 03:29:15',NULL,'2025-09-15 16:03:24','2025-10-03 03:29:15'),(50,'App\\Models\\User',1,'auth_token','582b0a97defe45e41ef3ac7fd116ac54a4e3b9e0e0d1dc9170129f561d227655','[\"*\"]','2025-09-15 20:37:50',NULL,'2025-09-15 20:22:18','2025-09-15 20:37:50'),(51,'App\\Models\\User',1,'auth_token','8c27d0ea13ea732e443aeb4e2c11e3e770132eebfe1e79c8142cc802b1059f11','[\"*\"]','2025-09-15 20:23:11',NULL,'2025-09-15 20:22:43','2025-09-15 20:23:11'),(52,'App\\Models\\User',1,'auth_token','27971a2da3b2732a576cdfe05e119f5f915adbdfd094c6acb49deb27cc448474','[\"*\"]','2025-09-18 15:02:11',NULL,'2025-09-18 15:02:07','2025-09-18 15:02:11'),(56,'App\\Models\\User',1,'auth_token','0cd0b799428701e3c1928b48fffd8bdb7cf0027856663a412f2b58cebc195dd4','[\"*\"]','2025-09-25 17:12:41',NULL,'2025-09-25 17:12:35','2025-09-25 17:12:41'),(61,'App\\Models\\User',1,'auth_token','ba5f9ef57377b1b45461e596df6ee83650396b82cb43775d3dbc569b00afb6cc','[\"*\"]','2025-09-25 17:23:15',NULL,'2025-09-25 17:20:43','2025-09-25 17:23:15'),(63,'App\\Models\\User',1,'auth_token','4ce1a312e01cefc9b1ead07884a7eda032925c78fdf19ffde2c2f65f76df7a5a','[\"*\"]','2025-09-25 17:32:06',NULL,'2025-09-25 17:25:18','2025-09-25 17:32:06'),(66,'App\\Models\\User',1,'auth_token','9480b0d9af3e9e7bc03257a5475b8ad63b8d8c68f247dcfaee277d1bf4f69abb','[\"*\"]','2025-09-25 18:45:54',NULL,'2025-09-25 18:44:48','2025-09-25 18:45:54'),(85,'App\\Models\\User',1,'auth_token','773abef0a5a4a2397ed6ad3d144cca9baba2685b8e3e90d7f2ce273957e71fc5','[\"*\"]','2025-10-01 14:24:22',NULL,'2025-10-01 14:24:17','2025-10-01 14:24:22'),(93,'App\\Models\\User',1,'auth_token','213a55d57951ad402d6b138ebd5e1cae8be120d258989956cf8f9ef57e5ba0db','[\"*\"]','2025-10-17 11:05:45',NULL,'2025-10-03 17:14:58','2025-10-17 11:05:45'),(94,'App\\Models\\User',1,'auth_token','22c22d3644ec224058c8f2e65023e57c909e7a639f1786b3eb27418455cbf0e2','[\"*\"]','2025-10-27 10:54:11',NULL,'2025-10-13 13:01:20','2025-10-27 10:54:11'),(98,'App\\Models\\User',15,'auth_token','4f2bcbfaf1afd76b5b9ae1cb24b156fd0a235119e54a486aeadd18f8b6252433','[\"*\"]','2025-10-27 11:02:33',NULL,'2025-10-27 10:59:42','2025-10-27 11:02:33'),(99,'App\\Models\\User',1,'auth_token','962877ad084c6683dc8565015f3d12cf0a02e40f62ca222fd4876e6f03cae312','[\"*\"]','2025-11-18 16:57:57',NULL,'2025-10-27 11:12:30','2025-11-18 16:57:57'),(103,'App\\Models\\User',17,'auth_token','e3a3c8fb02b54f2073bc1e9f3cf52bd5dd286525a4f62ef1feb7582f020d4cf7','[\"*\"]','2025-11-23 14:51:54',NULL,'2025-11-23 14:21:13','2025-11-23 14:51:54');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesapals`
--

DROP TABLE IF EXISTS `pesapals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesapals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` bigint unsigned DEFAULT NULL,
  `billing_address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci,
  `amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci,
  `tracking_id` text COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesapals`
--

LOCK TABLES `pesapals` WRITE;
/*!40000 ALTER TABLE `pesapals` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesapals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(12,1),(13,1),(15,1),(16,1),(22,1),(23,1),(24,1),(25,1),(26,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(12,4),(13,4),(15,4),(16,4),(1,5),(7,5),(12,5),(13,5),(14,5),(15,5),(16,5),(32,5),(33,5),(34,5),(35,5),(36,5),(47,5),(48,5),(49,5),(50,5),(51,5),(53,5),(57,5),(58,5),(59,5),(60,5),(61,5),(62,5),(63,5),(64,5),(65,5),(1,9),(37,9),(41,9),(57,9),(58,9),(59,9),(60,9),(61,9),(62,9),(1,10),(12,10),(13,10),(57,10),(58,10),(59,10),(63,10),(64,10),(65,10),(67,10);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
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
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','sanctum','2025-07-02 23:47:49','2025-07-02 23:47:49'),(2,'Customer','sanctum','2025-07-02 23:47:49','2025-07-02 23:47:49'),(3,'Waiter','sanctum','2025-07-02 23:47:49','2025-07-02 23:47:49'),(4,'Chef','sanctum','2025-07-02 23:47:49','2025-07-02 23:47:49'),(5,'Branch Manager','sanctum','2025-07-02 23:47:49','2025-07-02 23:47:49'),(9,'Attendance Manager','sanctum','2025-09-01 12:17:15','2025-09-01 12:17:15'),(10,'Employee','sanctum','2025-09-01 13:22:59','2025-09-01 13:22:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `settingable_type` varchar(255) DEFAULT NULL,
  `settingable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_settingable_type_settingable_id_index` (`settingable_type`,`settingable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'company','company_name','{\"$value\":\"Cakeit\",\"$cast\":null}',NULL,NULL,'2025-07-03 00:07:01','2025-07-03 00:07:01'),(2,'company','company_email','{\"$value\":\"info@cakeit.us\",\"$cast\":null}',NULL,NULL,'2025-07-03 00:07:01','2025-07-03 00:07:01'),(3,'company','company_phone','{\"$value\":\"+15037465614\",\"$cast\":null}',NULL,NULL,'2025-07-03 00:07:02','2025-07-03 00:07:02'),(4,'company','company_website','{\"$value\":\"https:\\/\\/cakeit.us\",\"$cast\":null}',NULL,NULL,'2025-07-03 00:07:02','2025-07-03 00:07:02'),(5,'company','company_city','{\"$value\":\"Beaverton\",\"$cast\":null}',NULL,NULL,'2025-07-03 00:07:02','2025-07-03 00:07:02'),(6,'company','company_state','{\"$value\":\"Oregon\",\"$cast\":null}',NULL,NULL,'2025-07-03 00:07:02','2025-07-03 00:07:02'),(7,'company','company_country_code','{\"$value\":\"USA\",\"$cast\":null}',NULL,NULL,'2025-07-03 00:07:02','2025-07-03 00:07:02'),(8,'company','company_zip_code','{\"$value\":\"97005\",\"$cast\":null}',NULL,NULL,'2025-07-03 00:07:02','2025-07-03 00:07:02'),(9,'company','company_address','{\"$value\":\"Shop: 3205 SW Cedar Hills Blvd, Beaverton, OR 97005\",\"$cast\":null}',NULL,NULL,'2025-07-03 00:07:02','2025-07-03 00:07:02'),(10,'site','site_date_format','{\"$value\":\"d-m-Y\",\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(11,'site','site_time_format','{\"$value\":\"h:i A\",\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(12,'site','site_default_timezone','{\"$value\":\"UTC\",\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(13,'site','site_default_branch','{\"$value\":1,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(14,'site','site_default_currency','{\"$value\":1,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(15,'site','site_default_currency_symbol','{\"$value\":\"$\",\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:32','2025-08-12 16:20:32'),(16,'site','site_currency_position','{\"$value\":5,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(17,'site','site_digit_after_decimal_point','{\"$value\":\"2\",\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(18,'site','site_email_verification','{\"$value\":10,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(19,'site','site_phone_verification','{\"$value\":10,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(20,'site','site_default_language','{\"$value\":1,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(21,'site','site_google_map_key','{\"$value\":\"test\",\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:32','2025-08-12 16:20:32'),(22,'site','site_copyright','{\"$value\":\"Cakeit\",\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:32','2025-08-12 16:20:32'),(23,'site','site_language_switch','{\"$value\":10,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:31','2025-08-12 16:20:31'),(24,'site','site_app_debug','{\"$value\":10,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:32','2025-08-12 16:20:32'),(25,'site','site_auto_update','{\"$value\":10,\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:52','2025-07-02 23:47:52'),(26,'site','site_online_payment_gateway','{\"$value\":10,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:32','2025-08-12 16:20:32'),(27,'site','site_default_sms_gateway','{\"$value\":null,\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:32','2025-08-12 16:20:32'),(28,'site','site_food_preparation_time','{\"$value\":\"30\",\"$cast\":null}',NULL,NULL,'2025-08-12 16:20:32','2025-08-12 16:20:32'),(29,'notification','notification_fcm_public_vapid_key','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:52','2025-07-02 23:47:52'),(30,'notification','notification_fcm_api_key','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:52','2025-07-02 23:47:52'),(31,'notification','notification_fcm_auth_domain','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:53','2025-07-02 23:47:53'),(32,'notification','notification_fcm_project_id','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:53','2025-07-02 23:47:53'),(33,'notification','notification_fcm_storage_bucket','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:53','2025-07-02 23:47:53'),(34,'notification','notification_fcm_messaging_sender_id','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:53','2025-07-02 23:47:53'),(35,'notification','notification_fcm_app_id','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:53','2025-07-02 23:47:53'),(36,'notification','notification_fcm_measurement_id','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:53','2025-07-02 23:47:53'),(37,'notification','notification_fcm_json_file','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:47:53','2025-07-02 23:47:53'),(38,'mail','mail_mailer','{\"$value\":\"smtp\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:18','2025-07-02 23:48:18'),(39,'mail','mail_host','{\"$value\":\"smtp.gmail.com\",\"$cast\":null}',NULL,NULL,'2025-10-29 17:36:01','2025-10-29 17:36:01'),(40,'mail','mail_port','{\"$value\":\"587\",\"$cast\":null}',NULL,NULL,'2025-10-29 17:36:01','2025-10-29 17:36:01'),(41,'mail','mail_username','{\"$value\":\"production8421@gmail.com\",\"$cast\":null}',NULL,NULL,'2025-10-29 17:36:01','2025-10-29 17:36:01'),(42,'mail','mail_password','{\"$value\":\"vmplqeazpcmiawpa\",\"$cast\":null}',NULL,NULL,'2025-10-29 17:36:01','2025-10-29 17:36:01'),(43,'mail','mail_encryption','{\"$value\":\"tls\",\"$cast\":null}',NULL,NULL,'2025-10-29 17:36:01','2025-10-29 17:36:01'),(44,'mail','mail_from_name','{\"$value\":\"CakeIt\",\"$cast\":null}',NULL,NULL,'2025-10-29 17:36:01','2025-10-29 17:36:01'),(45,'mail','mail_from_email','{\"$value\":\"production8421@gmail.com\",\"$cast\":null}',NULL,NULL,'2025-10-29 17:36:01','2025-10-29 17:36:01'),(46,'order_setup','order_setup_food_preparation_time','{\"$value\":\"30\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:19','2025-07-02 23:48:19'),(47,'order_setup','order_setup_schedule_order_slot_duration','{\"$value\":\"30\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:19','2025-07-02 23:48:19'),(48,'order_setup','order_setup_takeaway','{\"$value\":5,\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:19','2025-07-02 23:48:19'),(49,'order_setup','order_setup_delivery','{\"$value\":5,\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:19','2025-07-02 23:48:19'),(50,'order_setup','order_setup_free_delivery_kilometer','{\"$value\":\"2\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:19','2025-07-02 23:48:19'),(51,'order_setup','order_setup_basic_delivery_charge','{\"$value\":\"1\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:19','2025-07-02 23:48:19'),(52,'order_setup','order_setup_charge_per_kilo','{\"$value\":\"1\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:19','2025-07-02 23:48:19'),(53,'otp','otp_type','{\"$value\":\"5\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:19','2025-07-02 23:48:19'),(54,'otp','otp_digit_limit','{\"$value\":\"4\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:19','2025-07-02 23:48:19'),(55,'otp','otp_expire_time','{\"$value\":\"10\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:20','2025-07-02 23:48:20'),(56,'theme','theme_logo','{\"$value\":{},\"$cast\":null}',NULL,NULL,'2025-07-07 12:16:46','2025-07-07 12:16:46'),(57,'theme','theme_favicon_logo','{\"$value\":{},\"$cast\":null}',NULL,NULL,'2025-07-07 12:16:46','2025-07-07 12:16:46'),(58,'theme','theme_footer_logo','{\"$value\":{},\"$cast\":null}',NULL,NULL,'2025-07-07 12:16:46','2025-07-07 12:16:46'),(59,'license','license_key','{\"$value\":\"test\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:20','2025-07-02 23:48:20'),(60,'social_media','social_media_facebook','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:20','2025-07-02 23:48:20'),(61,'social_media','social_media_youtube','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:20','2025-07-02 23:48:20'),(62,'social_media','social_media_instagram','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:20','2025-07-02 23:48:20'),(63,'social_media','social_media_twitter','{\"$value\":\"\",\"$cast\":null}',NULL,NULL,'2025-07-02 23:48:20','2025-07-02 23:48:20');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_gateways`
--

DROP TABLE IF EXISTS `sms_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `misc` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_gateways`
--

LOCK TABLES `sms_gateways` WRITE;
/*!40000 ALTER TABLE `sms_gateways` DISABLE KEYS */;
INSERT INTO `sms_gateways` VALUES (1,'Twilio','twilio','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:06','2025-07-02 23:48:06'),(2,'Clickatell','clickatell','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(3,'Nexmo','nexmo','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(4,'Msg91','msg91','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:07','2025-07-02 23:48:07'),(5,'2Factor','twofactor','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(6,'Bulksms','bulksms','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(7,'Bulksmsbd','bulksmsbd','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08'),(8,'Telesign','telesign','null',5,NULL,NULL,NULL,NULL,'2025-07-02 23:48:08','2025-07-02 23:48:08');
/*!40000 ALTER TABLE `sms_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(19,6) NOT NULL,
  `type` tinyint NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slots`
--

DROP TABLE IF EXISTS `time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `opening_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `closing_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` tinyint NOT NULL,
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slots`
--

LOCK TABLES `time_slots` WRITE;
/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sign` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+',
  `order_id` bigint unsigned NOT NULL,
  `transaction_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'payment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT '0',
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint unsigned NOT NULL DEFAULT '10',
  `status` tinyint unsigned NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `balance` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Admin','admin@admin.com','5037465614','admin','2025-07-02 23:48:10','$2y$10$G1OFo/M8IWStt1aX9afIOuiK2rpT8utjI1msRiMOSABiDIwUyPY9a',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-07-02 23:48:10','2025-07-03 00:13:30',NULL),(2,'Walking Customer','walkingcustomer@example.com','1254444555','default-customer','2025-07-02 23:48:11','$2y$10$a/e/T3Lr.KxSsiS4FERlT.ZoCihhQ6UrCHXDUC/IMoa3kEG9Z6V02',NULL,NULL,0,'+880',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-07-02 23:48:11','2025-07-02 23:48:11',NULL),(3,'Employee','manager@example.com',NULL,'manager2077781805','2025-07-08 15:55:10','$2y$10$3y88fY9INY8l0KKv9xUYJ.JlYn6Swo6srtKlerKDK1MsIEle0AdVG',NULL,NULL,1,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-07-08 15:55:10','2025-09-30 13:33:52','2025-09-30 13:33:52'),(4,'Chef','chef@example.com',NULL,'chef674699905','2025-07-08 16:02:29','$2y$10$iousspF/k/Bj29H6i98o0ezWs5R4TzIsdVbWDLJX5up7O9xd07kzi',NULL,NULL,1,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-07-08 16:02:29','2025-07-08 16:02:29',NULL),(5,'test','test@gmail.com','1231231231','test742192768','2025-07-14 16:01:21','$2y$10$mgzYMT/u/LECRWQlm5Bo6O.U.Wf6FU9MeXgTtcSjJ/6oMWxOtI4Aa',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-07-14 16:01:21','2025-07-14 16:14:22','2025-07-14 16:14:22'),(6,'Pompa','email@email.com','1212121212','email1405683161','2025-07-16 15:23:34','$2y$10$p7/g0afzEsU3iJRXtlz9XOEa2hNT5.W4rR26Bzrpvk.Xwpr8JEBpa',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-07-16 15:23:34','2025-07-16 15:23:34',NULL),(7,'Test','rine@mailinweeeator.com','3212312314','rine1014044797','2025-08-11 06:53:33','$2y$10$C.EZ9XWSEqdTcsI.YczoAOxKpfM/q9kgvxR3M6aurTvWeOjEM944e',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-08-11 06:53:33','2025-08-11 06:53:33',NULL),(8,'sadaasaaaa','rine@mailinatddddddor.com','1231323111','rine1782983986','2025-08-11 12:10:27','$2y$10$ZI4Yrh4SrRMePapjpOCnduZBbDczSjm7xcWfDLgE/fgI4a8dmzfK6',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-08-11 12:10:27','2025-08-11 12:10:27',NULL),(9,'sddsdsd','dsdsdsd@test.com','2323123123','dsdsdsd223198582','2025-08-12 04:44:25','$2y$10$k2CGK9eu.cqgIvxLU6T3re0qukR.Dxgm5bLn8UJjdREByY9BVjLcO',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-08-12 04:44:25','2025-08-12 04:44:25',NULL),(10,'Test','rine@mailinator.com','3434233242','rine2032665967','2025-08-13 11:17:17','$2y$10$zYZ3HTOv02NQc/t6QB2ZtOyUkN399hUzekmR1aYhSIUYiu1h/55fa',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-08-13 11:17:17','2025-08-13 11:17:17',NULL),(11,'jon','test@gmail2.com','4333223411','test1385625847','2025-09-01 13:22:03','$2y$10$FJqScOrvq4/ihVd0jHmab.SLQwGTCOGDW9u.XfRUboMarhwqRP2c.',NULL,NULL,1,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-09-01 13:22:03','2025-09-30 13:24:45','2025-09-30 13:24:45'),(12,'Branch One','branch1@cakeit.us',NULL,'branch1655736576','2025-09-30 13:21:56','$2y$10$Htm2/WPKz.5DUxTnj.78wuKWY3zXb/d4c4c1zGS8YB8fx.uFLEcou',NULL,NULL,1,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-09-30 13:21:56','2025-10-13 13:02:05',NULL),(13,'Branch Two','branch2@cakeit.us',NULL,'branch2796234280','2025-09-30 13:22:48','$2y$10$O/huDqoShwOgR44Mn1ZlJOaqwpn/Cd5D.vxa0qJcf6PwQkWy40Taa',NULL,NULL,1,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-09-30 13:22:48','2025-10-13 13:01:58',NULL),(14,'sudipto bose','sudiptobose2010@gmail.com','9718647012','sudiptobose20101621960783','2025-10-26 22:25:47','$2y$10$c4G3dmW9WjKR0QrXsuFMxO5NjrVpyEl/Hb9iTPlm649kWB4PL.XX.',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-10-26 22:25:47','2025-10-26 22:25:47',NULL),(15,'Herry','herry@yopmail.com','2132512255','herry76671615','2025-10-27 10:59:17','$2y$10$r3/h4WxKMhZuNpK87hvH6u2cqgGBWSXYpbXHtpA1ocwYcpjsWFaPi',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-10-27 10:59:17','2025-10-27 10:59:17',NULL),(16,'pom','pompapobi@gmail.com','9728340404','pompapobi283413477','2025-11-10 22:51:47','$2y$10$ELs.Nczyxpn3PQ.yRnVzLuoZY0oPEQ4a97sdeecd3C3Fo6/SXvqGW',NULL,NULL,0,'+1',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-11-10 22:51:47','2025-11-10 22:51:47',NULL),(17,'asfasf asfasf','yucaerin@hotmail.com','1231231231','asfasf-asfasf','2025-11-23 14:21:08','$2y$10$TBRJrE0WfgU.aN3oU1N2y.Jo.KyepO0735739oJgN0CEhu6pYpG8m',NULL,NULL,0,'+60',10,5,0.000000,NULL,NULL,NULL,NULL,NULL,'2025-11-23 14:21:08','2025-11-23 14:21:08',NULL);
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

-- Dump completed on 2026-01-26 16:22:42
