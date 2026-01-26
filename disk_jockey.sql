-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: disk_jockey
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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `dj_id` bigint unsigned NOT NULL,
  `event_id` bigint unsigned DEFAULT NULL,
  `booking_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `venue_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `deposit_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `booking_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `special_requests` text COLLATE utf8mb4_unicode_ci,
  `cancellation_reason` text COLLATE utf8mb4_unicode_ci,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `stripe_payment_intent_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_dj_id_foreign` (`dj_id`),
  KEY `bookings_event_id_foreign` (`event_id`),
  CONSTRAINT `bookings_dj_id_foreign` FOREIGN KEY (`dj_id`) REFERENCES `djs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,6,2,NULL,'2026-01-16','02:58:00','12:58:00','asd sadas d','test','ny','10001',-7500.00,-2250.00,'pending','pending','dwad wda wa aad',NULL,NULL,NULL,NULL,'2026-01-14 14:58:40','2026-01-14 14:58:40'),(2,6,2,NULL,'2026-01-23','02:00:00','15:00:00','sf asfas fas fasf','test','te','90001',-9750.00,-2925.00,'paid','confirmed','dsdfs fsdf sdf sdf sf  fsdf',NULL,NULL,NULL,NULL,'2026-01-14 15:33:36','2026-01-14 16:34:49'),(3,2,1,NULL,'2026-01-15','06:20:00','16:41:00','Eos magna odio elit','Impedit dolor delec','Reprehenderit provi','65315',500.00,150.00,'paid','completed','Aut assumenda ullamc',NULL,'2026-01-14 17:04:33','2026-01-14 17:04:41','pi_3SpcAtLXqt7gmBJh0bXFtWxP','2026-01-14 16:59:10','2026-01-14 17:04:41'),(4,9,2,NULL,'2026-01-17','15:49:00','16:00:00','Aut enim voluptate v','Esse sint ut esse','Excepteur error prae','97777',750.00,225.00,'pending','pending','Explicabo Est adipi',NULL,NULL,NULL,NULL,'2026-01-16 20:45:26','2026-01-16 20:45:26');
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Wedding','wedding','Wedding events',NULL,1,'2026-01-14 13:13:42','2026-01-14 13:13:42'),(2,'Corporate','corporate','Corporate events',NULL,1,'2026-01-14 13:13:42','2026-01-14 13:13:42'),(3,'Nightlife','nightlife','Nightlife and clubs',NULL,1,'2026-01-14 13:13:42','2026-01-14 13:13:42'),(4,'Private Events','private-events','Private parties',NULL,1,'2026-01-14 13:13:42','2026-01-14 13:13:42'),(5,'Conferences','conferences','Conferences and seminars',NULL,1,'2026-01-14 13:13:42','2026-01-14 13:13:42');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_dj`
--

DROP TABLE IF EXISTS `category_dj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_dj` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `dj_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_dj_category_id_foreign` (`category_id`),
  KEY `category_dj_dj_id_foreign` (`dj_id`),
  CONSTRAINT `category_dj_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_dj_dj_id_foreign` FOREIGN KEY (`dj_id`) REFERENCES `djs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_dj`
--

LOCK TABLES `category_dj` WRITE;
/*!40000 ALTER TABLE `category_dj` DISABLE KEYS */;
INSERT INTO `category_dj` VALUES (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,4,1,NULL,NULL),(4,1,2,NULL,NULL),(5,3,2,NULL,NULL),(6,5,3,NULL,NULL),(7,5,1,NULL,NULL);
/*!40000 ALTER TABLE `category_dj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djs`
--

DROP TABLE IF EXISTS `djs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `stage_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hourly_rate` decimal(10,2) NOT NULL,
  `experience_years` int NOT NULL DEFAULT '0',
  `specialties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `genres` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `equipment` text COLLATE utf8mb4_unicode_ci,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `total_reviews` int NOT NULL DEFAULT '0',
  `total_bookings` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `djs_user_id_foreign` (`user_id`),
  CONSTRAINT `djs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `djs_chk_1` CHECK (json_valid(`specialties`)),
  CONSTRAINT `djs_chk_2` CHECK (json_valid(`genres`)),
  CONSTRAINT `djs_chk_3` CHECK (json_valid(`social_links`))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djs`
--

LOCK TABLES `djs` WRITE;
/*!40000 ALTER TABLE `djs` DISABLE KEYS */;
INSERT INTO `djs` VALUES (1,2,'DJ NOVA','Professional DJ with 5+ years of experience in weddings and corporate events.',NULL,'Miami','FL','33101',500.00,5,'[\"Wedding\",\"Corporate\",\"Private Events\"]','[\"Hip Hop\",\"EDM\",\"Pop\"]','1231231231','https://www.google.com',NULL,'werwerwerwercwer',1,1,4.80,25,1,'2026-01-14 13:15:39','2026-01-14 16:59:10'),(2,4,'DJ ALEX VIBE','Experienced DJ specializing in nightlife and corporate events.',NULL,'Los Angeles','CA','90001',750.00,8,'[\"Wedding\",\"Nightlife\",\"Corporate Events\"]','[\"EDM\",\"Hip Hop\",\"Rock\"]',NULL,NULL,NULL,NULL,1,1,4.90,42,3,'2026-01-14 13:15:52','2026-01-16 20:45:26'),(3,5,'MICHAEL CARTER','Professional Event MC with expertise in corporate events and conferences.',NULL,'Chicago','IL','60601',600.00,10,'[\"Corporate Events\",\"Conferences\",\"Live Shows\"]','[\"Pop\",\"R&B\",\"Jazz\"]',NULL,NULL,NULL,NULL,1,1,5.00,38,0,'2026-01-14 13:15:53','2026-01-15 11:17:26');
/*!40000 ALTER TABLE `djs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `event_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `venue_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_count` int DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `budget_min` decimal(10,2) DEFAULT NULL,
  `budget_max` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_user_id_foreign` (`user_id`),
  CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_chk_1` CHECK (json_valid(`requirements`))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,6,'Summer Wedding Celebration','A beautiful outdoor wedding ceremony and reception for 150 guests. Looking for a professional DJ who can play a mix of contemporary hits and classic love songs.','Wedding','2026-03-14','16:00:00','23:00:00','Grand Garden Venue','1234 Park Avenue','Miami','FL','33101',150,'[\"Sound System\",\"Microphone\",\"Lighting\",\"MC Services\"]',2000.00,3500.00,'pending','2026-01-14 16:45:00','2026-01-14 16:45:00'),(2,6,'Corporate Annual Gala','Annual company gala event with 200+ employees. Need professional DJ for dinner and dance portions of the evening.','Corporate','2026-04-14','18:00:00','01:00:00','Downtown Convention Center','5678 Business Blvd','Los Angeles','CA','90001',200,'[\"Professional Sound\",\"Stage Lighting\",\"Wireless Microphones\",\"Background Music\"]',3000.00,5000.00,'confirmed','2026-01-14 16:45:01','2026-01-14 16:45:01'),(3,6,'30th Birthday Bash','Milestone birthday celebration with friends and family. Want a fun, energetic DJ who can keep the party going all night!','Birthday','2026-02-04','19:00:00','02:00:00','The Party Loft','890 Nightlife Street','Chicago','IL','60601',75,'[\"DJ Booth\",\"Lighting Effects\",\"Smoke Machine\"]',1000.00,2000.00,'pending','2026-01-14 16:45:01','2026-01-14 16:45:01'),(4,6,'Tech Conference After Party','Networking event after a tech conference. Need a DJ who can create a modern, upbeat atmosphere for tech professionals.','Corporate','2026-02-14','20:00:00','01:00:00','Innovation Hub','321 Tech Drive','San Francisco','CA','94102',120,'[\"Modern Music Selection\",\"Ambient Lighting\",\"Professional Setup\"]',2500.00,4000.00,'confirmed','2026-01-14 16:45:01','2026-01-14 16:45:01'),(5,6,'Graduation Party','High school graduation celebration with family and friends. Looking for a DJ who can play current hits and handle announcements.','Private Event','2026-02-25','17:00:00','22:00:00','Community Hall','456 Main Street','Miami','FL','33102',100,'[\"Family-Friendly Music\",\"Microphone\",\"Simple Setup\"]',800.00,1500.00,'pending','2026-01-14 16:45:01','2026-01-14 16:45:01');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_01_14_175747_create_categories_table',1),(5,'2026_01_14_175753_create_djs_table',1),(6,'2026_01_14_175756_create_events_table',1),(7,'2026_01_14_175759_create_bookings_table',1),(8,'2026_01_14_175803_create_reviews_table',1),(9,'2026_01_14_175806_add_role_to_users_table',1),(10,'2026_01_14_175846_create_category_dj_table',1),(11,'2026_01_14_225412_create_products_table',2),(12,'2026_01_14_225416_create_orders_table',2),(13,'2026_01_14_225420_create_order_items_table',2),(14,'2026_01_14_232345_add_tracking_number_to_orders_table',3),(15,'2026_01_14_233039_create_product_categories_table',4),(16,'2026_01_14_233106_add_category_id_to_products_table',4),(17,'2026_01_15_151932_add_product_type_to_products_table',5),(18,'2026_01_15_151941_create_product_variations_table',5),(19,'2026_01_15_151946_create_product_variation_attributes_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
  `product_id` bigint unsigned NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,5,6,'DJ Premium Hoodie - Black - Medium - Standard',59.99,2,119.98,'2026-01-15 12:54:00','2026-01-15 12:54:00'),(2,5,8,'DJ Pro Headphones - Wireless - Black',114.99,2,229.98,'2026-01-15 12:54:00','2026-01-15 12:54:00'),(3,5,3,'DJ Pro Headphones',79.99,1,79.99,'2026-01-15 12:54:01','2026-01-15 12:54:01');
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
  `user_id` bigint unsigned NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `tracking_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_payment_intent_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'US',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,6,'ORD-6969243279AAF',429.95,34.40,0.00,464.35,'pending',NULL,NULL,'pending','stripe','pi_3SpuNALXqt7gmBJh01Ij71He','Test User','user@example.com','1231231231','testt',NULL,'test','test','90001','US','Testing Note','2026-01-15 12:30:26','2026-01-15 12:30:26',NULL),(2,6,'ORD-6969286FAAB53',429.95,34.40,0.00,464.35,'pending',NULL,NULL,'pending','stripe','pi_3SpueoLXqt7gmBJh0ktExtgc','Hanna Kent','deviciry@mailinator.com','+1 (982) 833-2544','670 South Green New Freeway','Sit pariatur Quia e','A est eaque dolores','At et porro voluptat','76779','US','Enim atque incididun','2026-01-15 12:48:31','2026-01-15 12:48:31',NULL),(3,6,'ORD-6969288E87A6D',429.95,34.40,0.00,464.35,'pending',NULL,NULL,'pending','stripe','pi_3SpufJLXqt7gmBJh1qFlqcxh','Hanna Kent','deviciry@mailinator.com','+19828332544','670 South Green New Freeway','Sit pariatur Quia e','A est eaque dolores','At et porro voluptat','76779','US','Enim atque incididun','2026-01-15 12:49:02','2026-01-15 12:49:02',NULL),(4,6,'ORD-696928A818552',429.95,34.40,0.00,464.35,'pending',NULL,NULL,'pending','stripe','pi_3SpufiLXqt7gmBJh1VfO38Yt','Hanna Kent','deviciry@mailinator.com','9828332544','670 South Green New Freeway','Sit pariatur Quia e','A est eaque dolores','At et porro voluptat','76779','US','Enim atque incididun','2026-01-15 12:49:28','2026-01-15 12:49:28',NULL),(5,6,'ORD-696929B885662',429.95,34.40,0.00,464.35,'processing',NULL,NULL,'paid','stripe','pi_3Spuk7LXqt7gmBJh0yZN36t7','Odessa Holder','qezuva@mailinator.com','+1 (118) 822-2417','973 West Clarendon Extension','Tempor cupiditate sa','Proident fugiat qu','Dolorum excepturi mo','49077','MX','Sint expedita sint c','2026-01-15 12:54:00','2026-01-15 12:54:03',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_categories_slug_unique` (`slug`),
  KEY `product_categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'Kasper Baker','kasper-baker','Laborum qui veritati','product-categories/Qu1NW6x6d4I7cUXyFe9VYwTKqcNf26SK2zAxXgmZ.png',NULL,1,1,'2026-01-14 18:43:56','2026-01-14 18:43:56',NULL),(2,'Colette Watts','colette-watts','Id irure ut minima','product-categories/nhVZHK8nZRcPfl2TUTS8ZSBZxSRGNtVdkn1bFJ0n.png',1,2,1,'2026-01-14 18:45:00','2026-01-14 18:45:00',NULL),(3,'Apparel','apparel','DJ and MC branded clothing and accessories',NULL,NULL,1,1,'2026-01-15 10:33:25','2026-01-15 10:33:25',NULL),(4,'Accessories','accessories','DJ equipment accessories and branded items',NULL,NULL,2,1,'2026-01-15 10:33:25','2026-01-15 10:33:25',NULL),(5,'Merchandise','merchandise','Official Disk Jockey Global merchandise',NULL,NULL,3,1,'2026-01-15 10:33:25','2026-01-15 10:33:25',NULL),(6,'T-Shirts','t-shirts','Comfortable and stylish DJ t-shirts',NULL,3,1,1,'2026-01-15 10:33:25','2026-01-15 10:33:25',NULL),(7,'Hoodies','hoodies','Warm and cozy DJ hoodies',NULL,3,2,1,'2026-01-15 10:33:25','2026-01-15 10:33:25',NULL),(8,'Caps & Hats','caps','Stylish DJ caps and hats',NULL,3,3,1,'2026-01-15 10:33:25','2026-01-15 10:33:25',NULL),(9,'Headphones','headphones','Professional DJ headphones',NULL,4,1,1,'2026-01-15 10:33:26','2026-01-15 10:33:26',NULL),(10,'Cases & Bags','cases','Protective cases for DJ equipment',NULL,4,2,1,'2026-01-15 10:33:26','2026-01-15 10:33:26',NULL);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variation_attributes`
--

DROP TABLE IF EXISTS `product_variation_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variation_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `variation_id` bigint unsigned NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_display` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variation_attributes_variation_id_foreign` (`variation_id`),
  CONSTRAINT `product_variation_attributes_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=703 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variation_attributes`
--

LOCK TABLES `product_variation_attributes` WRITE;
/*!40000 ALTER TABLE `product_variation_attributes` DISABLE KEYS */;
INSERT INTO `product_variation_attributes` VALUES (421,1,'color','Black','#000000',1,'2026-01-15 10:44:00','2026-01-15 10:44:00'),(422,1,'size','Small',NULL,2,'2026-01-15 10:44:00','2026-01-15 10:44:00'),(423,2,'color','Black','#000000',1,'2026-01-15 10:44:00','2026-01-15 10:44:00'),(424,2,'size','Medium',NULL,2,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(425,3,'color','Black','#000000',1,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(426,3,'size','Large',NULL,2,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(427,4,'color','Black','#000000',1,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(428,4,'size','XL',NULL,2,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(429,5,'color','White','#FFFFFF',1,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(430,5,'size','Small',NULL,2,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(431,6,'color','White','#FFFFFF',1,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(432,6,'size','Medium',NULL,2,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(433,7,'color','White','#FFFFFF',1,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(434,7,'size','Large',NULL,2,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(435,8,'color','White','#FFFFFF',1,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(436,8,'size','XL',NULL,2,'2026-01-15 10:44:01','2026-01-15 10:44:01'),(437,9,'color','Red','#FF0000',1,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(438,9,'size','Small',NULL,2,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(439,10,'color','Red','#FF0000',1,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(440,10,'size','Medium',NULL,2,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(441,11,'color','Red','#FF0000',1,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(442,11,'size','Large',NULL,2,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(443,12,'color','Red','#FF0000',1,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(444,12,'size','XL',NULL,2,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(445,13,'color','Navy Blue','#000080',1,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(446,13,'size','Small',NULL,2,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(447,14,'color','Navy Blue','#000080',1,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(448,14,'size','Medium',NULL,2,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(449,15,'color','Navy Blue','#000080',1,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(450,15,'size','Large',NULL,2,'2026-01-15 10:44:02','2026-01-15 10:44:02'),(451,16,'color','Navy Blue','#000080',1,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(452,16,'size','XL',NULL,2,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(453,17,'color','Black','#000000',1,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(454,17,'size','Medium',NULL,2,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(455,17,'type','Standard',NULL,3,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(456,18,'color','Black','#000000',1,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(457,18,'size','Medium',NULL,2,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(458,18,'type','Premium',NULL,3,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(459,19,'color','Black','#000000',1,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(460,19,'size','Medium',NULL,2,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(461,19,'type','Limited Edition',NULL,3,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(462,20,'color','Black','#000000',1,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(463,20,'size','Large',NULL,2,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(464,20,'type','Standard',NULL,3,'2026-01-15 10:44:03','2026-01-15 10:44:03'),(465,21,'color','Black','#000000',1,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(466,21,'size','Large',NULL,2,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(467,21,'type','Premium',NULL,3,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(468,22,'color','Black','#000000',1,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(469,22,'size','Large',NULL,2,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(470,22,'type','Limited Edition',NULL,3,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(471,23,'color','Black','#000000',1,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(472,23,'size','XL',NULL,2,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(473,23,'type','Standard',NULL,3,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(474,24,'color','Black','#000000',1,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(475,24,'size','XL',NULL,2,'2026-01-15 10:44:04','2026-01-15 10:44:04'),(476,24,'type','Premium',NULL,3,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(477,25,'color','Black','#000000',1,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(478,25,'size','XL',NULL,2,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(479,25,'type','Limited Edition',NULL,3,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(480,26,'color','Black','#000000',1,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(481,26,'size','XXL',NULL,2,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(482,26,'type','Standard',NULL,3,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(483,27,'color','Black','#000000',1,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(484,27,'size','XXL',NULL,2,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(485,27,'type','Premium',NULL,3,'2026-01-15 10:44:05','2026-01-15 10:44:05'),(486,28,'color','Black','#000000',1,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(487,28,'size','XXL',NULL,2,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(488,28,'type','Limited Edition',NULL,3,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(489,29,'color','Gray','#808080',1,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(490,29,'size','Medium',NULL,2,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(491,29,'type','Standard',NULL,3,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(492,30,'color','Gray','#808080',1,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(493,30,'size','Medium',NULL,2,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(494,30,'type','Premium',NULL,3,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(495,31,'color','Gray','#808080',1,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(496,31,'size','Medium',NULL,2,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(497,31,'type','Limited Edition',NULL,3,'2026-01-15 10:44:06','2026-01-15 10:44:06'),(498,32,'color','Gray','#808080',1,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(499,32,'size','Large',NULL,2,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(500,32,'type','Standard',NULL,3,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(501,33,'color','Gray','#808080',1,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(502,33,'size','Large',NULL,2,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(503,33,'type','Premium',NULL,3,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(504,34,'color','Gray','#808080',1,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(505,34,'size','Large',NULL,2,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(506,34,'type','Limited Edition',NULL,3,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(507,35,'color','Gray','#808080',1,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(508,35,'size','XL',NULL,2,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(509,35,'type','Standard',NULL,3,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(510,36,'color','Gray','#808080',1,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(511,36,'size','XL',NULL,2,'2026-01-15 10:44:07','2026-01-15 10:44:07'),(512,36,'type','Premium',NULL,3,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(513,37,'color','Gray','#808080',1,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(514,37,'size','XL',NULL,2,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(515,37,'type','Limited Edition',NULL,3,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(516,38,'color','Gray','#808080',1,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(517,38,'size','XXL',NULL,2,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(518,38,'type','Standard',NULL,3,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(519,39,'color','Gray','#808080',1,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(520,39,'size','XXL',NULL,2,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(521,39,'type','Premium',NULL,3,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(522,40,'color','Gray','#808080',1,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(523,40,'size','XXL',NULL,2,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(524,40,'type','Limited Edition',NULL,3,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(525,41,'color','Navy Blue','#000080',1,'2026-01-15 10:44:08','2026-01-15 10:44:08'),(526,41,'size','Medium',NULL,2,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(527,41,'type','Standard',NULL,3,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(528,42,'color','Navy Blue','#000080',1,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(529,42,'size','Medium',NULL,2,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(530,42,'type','Premium',NULL,3,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(531,43,'color','Navy Blue','#000080',1,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(532,43,'size','Medium',NULL,2,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(533,43,'type','Limited Edition',NULL,3,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(534,44,'color','Navy Blue','#000080',1,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(535,44,'size','Large',NULL,2,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(536,44,'type','Standard',NULL,3,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(537,45,'color','Navy Blue','#000080',1,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(538,45,'size','Large',NULL,2,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(539,45,'type','Premium',NULL,3,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(540,46,'color','Navy Blue','#000080',1,'2026-01-15 10:44:09','2026-01-15 10:44:09'),(541,46,'size','Large',NULL,2,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(542,46,'type','Limited Edition',NULL,3,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(543,47,'color','Navy Blue','#000080',1,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(544,47,'size','XL',NULL,2,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(545,47,'type','Standard',NULL,3,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(546,48,'color','Navy Blue','#000080',1,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(547,48,'size','XL',NULL,2,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(548,48,'type','Premium',NULL,3,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(549,49,'color','Navy Blue','#000080',1,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(550,49,'size','XL',NULL,2,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(551,49,'type','Limited Edition',NULL,3,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(552,50,'color','Navy Blue','#000080',1,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(553,50,'size','XXL',NULL,2,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(554,50,'type','Standard',NULL,3,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(555,51,'color','Navy Blue','#000080',1,'2026-01-15 10:44:10','2026-01-15 10:44:10'),(556,51,'size','XXL',NULL,2,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(557,51,'type','Premium',NULL,3,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(558,52,'color','Navy Blue','#000080',1,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(559,52,'size','XXL',NULL,2,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(560,52,'type','Limited Edition',NULL,3,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(561,54,'color','Black','#000000',1,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(562,54,'size','One Size',NULL,2,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(563,55,'color','Black','#000000',1,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(564,55,'size','Adjustable',NULL,2,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(565,56,'color','White','#FFFFFF',1,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(566,56,'size','One Size',NULL,2,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(567,57,'color','White','#FFFFFF',1,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(568,57,'size','Adjustable',NULL,2,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(569,58,'color','Navy Blue','#000080',1,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(570,58,'size','One Size',NULL,2,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(571,59,'color','Navy Blue','#000080',1,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(572,59,'size','Adjustable',NULL,2,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(573,60,'color','Red','#FF0000',1,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(574,60,'size','One Size',NULL,2,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(575,61,'color','Red','#FF0000',1,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(576,61,'size','Adjustable',NULL,2,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(577,62,'type','Standard',NULL,1,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(578,62,'color','Black','#000000',2,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(579,63,'type','Standard',NULL,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(580,63,'color','White','#FFFFFF',2,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(581,64,'type','Standard',NULL,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(582,64,'color','Silver','#C0C0C0',2,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(583,65,'type','Wireless',NULL,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(584,65,'color','Black','#000000',2,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(585,66,'type','Wireless',NULL,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(586,66,'color','White','#FFFFFF',2,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(587,67,'type','Wireless',NULL,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(588,67,'color','Silver','#C0C0C0',2,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(589,68,'type','Premium',NULL,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(590,68,'color','Black','#000000',2,'2026-01-15 10:44:15','2026-01-15 10:44:15'),(591,69,'type','Premium',NULL,1,'2026-01-15 10:44:15','2026-01-15 10:44:15'),(592,69,'color','White','#FFFFFF',2,'2026-01-15 10:44:15','2026-01-15 10:44:15'),(593,70,'type','Premium',NULL,1,'2026-01-15 10:44:15','2026-01-15 10:44:15'),(594,70,'color','Silver','#C0C0C0',2,'2026-01-15 10:44:15','2026-01-15 10:44:15'),(649,71,'color','Red','#ff0000',0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(650,71,'size','Medium',NULL,0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(651,71,'type','Classic',NULL,0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(652,72,'color','Black','#000000',0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(653,72,'size','Medium',NULL,0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(654,72,'type','Premium',NULL,0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(655,73,'color','Black','#000000',0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(656,73,'size','Large',NULL,0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(657,73,'type','Classic',NULL,0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(658,74,'color','Black','#000000',0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(659,74,'size','Large',NULL,0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(660,74,'type','Premium',NULL,0,'2026-01-15 10:46:24','2026-01-15 10:46:24'),(661,75,'color','Black','#000000',0,'2026-01-15 10:46:25','2026-01-15 10:46:25'),(662,75,'size','XL',NULL,0,'2026-01-15 10:46:25','2026-01-15 10:46:25'),(663,75,'type','Classic',NULL,0,'2026-01-15 10:46:25','2026-01-15 10:46:25'),(664,76,'color','Black','#000000',0,'2026-01-15 10:46:25','2026-01-15 10:46:25'),(665,76,'size','XL',NULL,0,'2026-01-15 10:46:25','2026-01-15 10:46:25'),(666,76,'type','Premium',NULL,0,'2026-01-15 10:46:25','2026-01-15 10:46:25'),(667,77,'color','Gray','#808080',0,'2026-01-15 10:46:25','2026-01-15 10:46:25'),(668,77,'size','Medium',NULL,0,'2026-01-15 10:46:25','2026-01-15 10:46:25'),(669,77,'type','Classic',NULL,0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(670,78,'color','Gray','#808080',0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(671,78,'size','Medium',NULL,0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(672,78,'type','Premium',NULL,0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(673,79,'color','Gray','#808080',0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(674,79,'size','Large',NULL,0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(675,79,'type','Classic',NULL,0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(676,80,'color','Gray','#808080',0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(677,80,'size','Large',NULL,0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(678,80,'type','Premium',NULL,0,'2026-01-15 10:46:26','2026-01-15 10:46:26'),(679,81,'color','Gray','#808080',0,'2026-01-15 10:46:27','2026-01-15 10:46:27'),(680,81,'size','XL',NULL,0,'2026-01-15 10:46:27','2026-01-15 10:46:27'),(681,81,'type','Classic',NULL,0,'2026-01-15 10:46:27','2026-01-15 10:46:27'),(682,82,'color','Gray','#808080',0,'2026-01-15 10:46:27','2026-01-15 10:46:27'),(683,82,'size','XL',NULL,0,'2026-01-15 10:46:27','2026-01-15 10:46:27'),(684,82,'type','Premium',NULL,0,'2026-01-15 10:46:27','2026-01-15 10:46:27'),(685,83,'color','Navy Blue','#000080',0,'2026-01-15 10:46:27','2026-01-15 10:46:27'),(686,83,'size','Medium',NULL,0,'2026-01-15 10:46:27','2026-01-15 10:46:27'),(687,83,'type','Classic',NULL,0,'2026-01-15 10:46:27','2026-01-15 10:46:27'),(688,84,'color','Navy Blue','#000080',0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(689,84,'size','Medium',NULL,0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(690,84,'type','Premium',NULL,0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(691,85,'color','Navy Blue','#000080',0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(692,85,'size','Large',NULL,0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(693,85,'type','Classic',NULL,0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(694,86,'color','Navy Blue','#000080',0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(695,86,'size','Large',NULL,0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(696,86,'type','Premium',NULL,0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(697,87,'color','Navy Blue','#000080',0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(698,87,'size','XL',NULL,0,'2026-01-15 10:46:28','2026-01-15 10:46:28'),(699,87,'type','Classic',NULL,0,'2026-01-15 10:46:29','2026-01-15 10:46:29'),(700,88,'color','Navy Blue','#000080',0,'2026-01-15 10:46:29','2026-01-15 10:46:29'),(701,88,'size','XL',NULL,0,'2026-01-15 10:46:29','2026-01-15 10:46:29'),(702,88,'type','Premium',NULL,0,'2026-01-15 10:46:29','2026-01-15 10:46:29');
/*!40000 ALTER TABLE `product_variation_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variations_sku_unique` (`sku`),
  KEY `product_variations_product_id_foreign` (`product_id`),
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations`
--

LOCK TABLES `product_variations` WRITE;
/*!40000 ALTER TABLE `product_variations` DISABLE KEYS */;
INSERT INTO `product_variations` VALUES (1,5,'TSH-DJ-PREM-BLA-Small',34.99,NULL,27,NULL,1,0,1,'2026-01-15 10:33:26','2026-01-15 10:33:26'),(2,5,'TSH-DJ-PREM-BLA-Medium',34.99,NULL,35,NULL,2,1,1,'2026-01-15 10:33:26','2026-01-15 10:33:26'),(3,5,'TSH-DJ-PREM-BLA-Large',34.99,NULL,40,NULL,3,0,1,'2026-01-15 10:33:27','2026-01-15 10:33:27'),(4,5,'TSH-DJ-PREM-BLA-XL',34.99,29.99,19,NULL,4,0,1,'2026-01-15 10:33:27','2026-01-15 10:33:27'),(5,5,'TSH-DJ-PREM-WHI-Small',34.99,NULL,32,NULL,5,0,1,'2026-01-15 10:33:27','2026-01-15 10:33:27'),(6,5,'TSH-DJ-PREM-WHI-Medium',34.99,NULL,25,NULL,6,0,1,'2026-01-15 10:33:27','2026-01-15 10:33:27'),(7,5,'TSH-DJ-PREM-WHI-Large',34.99,NULL,48,NULL,7,0,1,'2026-01-15 10:33:27','2026-01-15 10:33:27'),(8,5,'TSH-DJ-PREM-WHI-XL',34.99,29.99,34,NULL,8,0,1,'2026-01-15 10:33:28','2026-01-15 10:33:28'),(9,5,'TSH-DJ-PREM-RED-Small',34.99,NULL,18,NULL,9,0,1,'2026-01-15 10:33:28','2026-01-15 10:33:28'),(10,5,'TSH-DJ-PREM-RED-Medium',34.99,NULL,40,NULL,10,0,1,'2026-01-15 10:33:28','2026-01-15 10:33:28'),(11,5,'TSH-DJ-PREM-RED-Large',34.99,NULL,13,NULL,11,0,1,'2026-01-15 10:33:28','2026-01-15 10:33:28'),(12,5,'TSH-DJ-PREM-RED-XL',34.99,29.99,29,NULL,12,0,1,'2026-01-15 10:33:28','2026-01-15 10:33:28'),(13,5,'TSH-DJ-PREM-NAV-Small',34.99,NULL,34,NULL,13,0,1,'2026-01-15 10:33:28','2026-01-15 10:33:28'),(14,5,'TSH-DJ-PREM-NAV-Medium',34.99,NULL,45,NULL,14,0,1,'2026-01-15 10:33:29','2026-01-15 10:33:29'),(15,5,'TSH-DJ-PREM-NAV-Large',34.99,NULL,27,NULL,15,0,1,'2026-01-15 10:33:29','2026-01-15 10:33:29'),(16,5,'TSH-DJ-PREM-NAV-XL',34.99,29.99,28,NULL,16,0,1,'2026-01-15 10:33:29','2026-01-15 10:33:29'),(17,6,'HOD-DJ-PREM-BLA-Medium-STA',59.99,NULL,35,NULL,1,0,1,'2026-01-15 10:33:29','2026-01-15 12:54:00'),(18,6,'HOD-DJ-PREM-BLA-Medium-PRE',69.99,NULL,29,NULL,2,0,1,'2026-01-15 10:33:29','2026-01-15 10:33:29'),(19,6,'HOD-DJ-PREM-BLA-Medium-LIM',79.99,NULL,8,NULL,3,0,1,'2026-01-15 10:33:30','2026-01-15 10:33:30'),(20,6,'HOD-DJ-PREM-BLA-Large-STA',59.99,NULL,37,NULL,4,1,1,'2026-01-15 10:33:30','2026-01-15 10:33:30'),(21,6,'HOD-DJ-PREM-BLA-Large-PRE',69.99,NULL,24,NULL,5,0,1,'2026-01-15 10:33:30','2026-01-15 10:33:30'),(22,6,'HOD-DJ-PREM-BLA-Large-LIM',79.99,69.99,5,NULL,6,0,1,'2026-01-15 10:33:31','2026-01-15 10:33:31'),(23,6,'HOD-DJ-PREM-BLA-XL-STA',59.99,NULL,35,NULL,7,0,1,'2026-01-15 10:33:31','2026-01-15 10:33:31'),(24,6,'HOD-DJ-PREM-BLA-XL-PRE',69.99,NULL,34,NULL,8,0,1,'2026-01-15 10:33:31','2026-01-15 10:33:31'),(25,6,'HOD-DJ-PREM-BLA-XL-LIM',79.99,NULL,8,NULL,9,0,1,'2026-01-15 10:33:31','2026-01-15 10:33:31'),(26,6,'HOD-DJ-PREM-BLA-XXL-STA',59.99,NULL,18,NULL,10,0,1,'2026-01-15 10:33:32','2026-01-15 10:33:32'),(27,6,'HOD-DJ-PREM-BLA-XXL-PRE',69.99,NULL,25,NULL,11,0,1,'2026-01-15 10:33:32','2026-01-15 10:33:32'),(28,6,'HOD-DJ-PREM-BLA-XXL-LIM',79.99,69.99,10,NULL,12,0,1,'2026-01-15 10:33:32','2026-01-15 10:33:32'),(29,6,'HOD-DJ-PREM-GRA-Medium-STA',59.99,NULL,37,NULL,13,0,1,'2026-01-15 10:33:32','2026-01-15 10:33:32'),(30,6,'HOD-DJ-PREM-GRA-Medium-PRE',69.99,NULL,23,NULL,14,0,1,'2026-01-15 10:33:33','2026-01-15 10:33:33'),(31,6,'HOD-DJ-PREM-GRA-Medium-LIM',79.99,NULL,11,NULL,15,0,1,'2026-01-15 10:33:33','2026-01-15 10:33:33'),(32,6,'HOD-DJ-PREM-GRA-Large-STA',59.99,NULL,28,NULL,16,0,1,'2026-01-15 10:33:33','2026-01-15 10:33:33'),(33,6,'HOD-DJ-PREM-GRA-Large-PRE',69.99,NULL,39,NULL,17,0,1,'2026-01-15 10:33:33','2026-01-15 10:33:33'),(34,6,'HOD-DJ-PREM-GRA-Large-LIM',79.99,69.99,11,NULL,18,0,1,'2026-01-15 10:33:33','2026-01-15 10:33:33'),(35,6,'HOD-DJ-PREM-GRA-XL-STA',59.99,NULL,33,NULL,19,0,1,'2026-01-15 10:33:34','2026-01-15 10:33:34'),(36,6,'HOD-DJ-PREM-GRA-XL-PRE',69.99,NULL,16,NULL,20,0,1,'2026-01-15 10:33:34','2026-01-15 10:33:34'),(37,6,'HOD-DJ-PREM-GRA-XL-LIM',79.99,NULL,5,NULL,21,0,1,'2026-01-15 10:33:34','2026-01-15 10:33:34'),(38,6,'HOD-DJ-PREM-GRA-XXL-STA',59.99,NULL,29,NULL,22,0,1,'2026-01-15 10:33:34','2026-01-15 10:33:34'),(39,6,'HOD-DJ-PREM-GRA-XXL-PRE',69.99,NULL,40,NULL,23,0,1,'2026-01-15 10:33:35','2026-01-15 10:33:35'),(40,6,'HOD-DJ-PREM-GRA-XXL-LIM',79.99,69.99,7,NULL,24,0,1,'2026-01-15 10:33:35','2026-01-15 10:33:35'),(41,6,'HOD-DJ-PREM-NAV-Medium-STA',59.99,NULL,30,NULL,25,0,1,'2026-01-15 10:33:35','2026-01-15 10:33:35'),(42,6,'HOD-DJ-PREM-NAV-Medium-PRE',69.99,NULL,30,NULL,26,0,1,'2026-01-15 10:33:35','2026-01-15 10:33:35'),(43,6,'HOD-DJ-PREM-NAV-Medium-LIM',79.99,NULL,13,NULL,27,0,1,'2026-01-15 10:33:36','2026-01-15 10:33:36'),(44,6,'HOD-DJ-PREM-NAV-Large-STA',59.99,NULL,35,NULL,28,0,1,'2026-01-15 10:33:36','2026-01-15 10:33:36'),(45,6,'HOD-DJ-PREM-NAV-Large-PRE',69.99,NULL,32,NULL,29,0,1,'2026-01-15 10:33:36','2026-01-15 10:33:36'),(46,6,'HOD-DJ-PREM-NAV-Large-LIM',79.99,69.99,5,NULL,30,0,1,'2026-01-15 10:33:36','2026-01-15 10:33:36'),(47,6,'HOD-DJ-PREM-NAV-XL-STA',59.99,NULL,30,NULL,31,0,1,'2026-01-15 10:33:36','2026-01-15 10:33:36'),(48,6,'HOD-DJ-PREM-NAV-XL-PRE',69.99,NULL,33,NULL,32,0,1,'2026-01-15 10:33:37','2026-01-15 10:33:37'),(49,6,'HOD-DJ-PREM-NAV-XL-LIM',79.99,NULL,14,NULL,33,0,1,'2026-01-15 10:33:37','2026-01-15 10:33:37'),(50,6,'HOD-DJ-PREM-NAV-XXL-STA',59.99,NULL,29,NULL,34,0,1,'2026-01-15 10:33:37','2026-01-15 10:33:37'),(51,6,'HOD-DJ-PREM-NAV-XXL-PRE',69.99,NULL,35,NULL,35,0,1,'2026-01-15 10:33:37','2026-01-15 10:33:37'),(52,6,'HOD-DJ-PREM-NAV-XXL-LIM',79.99,69.99,6,NULL,36,0,1,'2026-01-15 10:33:38','2026-01-15 10:33:38'),(54,7,'CAP-DJ-PREM-BLA-ON',24.99,NULL,31,NULL,1,1,1,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(55,7,'CAP-DJ-PREM-BLA-AD',24.99,NULL,28,NULL,2,0,1,'2026-01-15 10:44:11','2026-01-15 10:44:11'),(56,7,'CAP-DJ-PREM-WHI-ON',24.99,19.99,40,NULL,3,0,1,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(57,7,'CAP-DJ-PREM-WHI-AD',24.99,NULL,30,NULL,4,0,1,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(58,7,'CAP-DJ-PREM-NAV-ON',24.99,NULL,18,NULL,5,0,1,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(59,7,'CAP-DJ-PREM-NAV-AD',24.99,19.99,40,NULL,6,0,1,'2026-01-15 10:44:12','2026-01-15 10:44:12'),(60,7,'CAP-DJ-PREM-RED-ON',24.99,NULL,24,NULL,7,0,1,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(61,7,'CAP-DJ-PREM-RED-AD',24.99,NULL,27,NULL,8,0,1,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(62,8,'HP-DJ-PRO-STA-BLA',99.99,NULL,27,NULL,1,1,1,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(63,8,'HP-DJ-PRO-STA-WHI',99.99,NULL,25,NULL,2,0,1,'2026-01-15 10:44:13','2026-01-15 10:44:13'),(64,8,'HP-DJ-PRO-STA-SIL',99.99,NULL,13,NULL,3,0,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(65,8,'HP-DJ-PRO-WIR-BLA',129.99,114.99,19,NULL,4,0,1,'2026-01-15 10:44:14','2026-01-15 12:54:00'),(66,8,'HP-DJ-PRO-WIR-WHI',129.99,NULL,25,NULL,5,0,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(67,8,'HP-DJ-PRO-WIR-SIL',129.99,NULL,19,NULL,6,0,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(68,8,'HP-DJ-PRO-PRE-BLA',149.99,NULL,10,NULL,7,0,1,'2026-01-15 10:44:14','2026-01-15 10:44:14'),(69,8,'HP-DJ-PRO-PRE-WHI',149.99,134.99,6,NULL,8,0,1,'2026-01-15 10:44:15','2026-01-15 10:44:15'),(70,8,'HP-DJ-PRO-PRE-SIL',149.99,NULL,8,NULL,9,0,1,'2026-01-15 10:44:15','2026-01-15 10:44:15'),(71,9,'TSH-DJ-LS-BLA-Medium-CLA',39.99,NULL,31,NULL,71,0,1,'2026-01-15 10:44:15','2026-01-15 10:46:23'),(72,9,'TSH-DJ-LS-BLA-Medium-PRE',49.99,NULL,14,NULL,72,0,1,'2026-01-15 10:44:15','2026-01-15 10:46:24'),(73,9,'TSH-DJ-LS-BLA-Large-CLA',39.99,NULL,24,NULL,73,1,1,'2026-01-15 10:44:15','2026-01-15 10:46:24'),(74,9,'TSH-DJ-LS-BLA-Large-PRE',49.99,NULL,13,NULL,74,0,1,'2026-01-15 10:44:16','2026-01-15 10:46:24'),(75,9,'TSH-DJ-LS-BLA-XL-CLA',39.99,29.99,25,NULL,75,0,1,'2026-01-15 10:44:16','2026-01-15 10:46:25'),(76,9,'TSH-DJ-LS-BLA-XL-PRE',49.99,NULL,18,NULL,76,0,1,'2026-01-15 10:44:16','2026-01-15 10:46:25'),(77,9,'TSH-DJ-LS-GRA-Medium-CLA',39.99,NULL,26,NULL,77,0,1,'2026-01-15 10:44:16','2026-01-15 10:46:25'),(78,9,'TSH-DJ-LS-GRA-Medium-PRE',49.99,NULL,24,NULL,78,0,1,'2026-01-15 10:44:16','2026-01-15 10:46:26'),(79,9,'TSH-DJ-LS-GRA-Large-CLA',39.99,NULL,22,NULL,79,0,1,'2026-01-15 10:44:16','2026-01-15 10:46:26'),(80,9,'TSH-DJ-LS-GRA-Large-PRE',49.99,39.99,33,NULL,80,0,1,'2026-01-15 10:44:17','2026-01-15 10:46:26'),(81,9,'TSH-DJ-LS-GRA-XL-CLA',39.99,NULL,34,NULL,81,0,1,'2026-01-15 10:44:17','2026-01-15 10:46:26'),(82,9,'TSH-DJ-LS-GRA-XL-PRE',49.99,NULL,31,NULL,82,0,1,'2026-01-15 10:44:17','2026-01-15 10:46:27'),(83,9,'TSH-DJ-LS-NAV-Medium-CLA',39.99,NULL,19,NULL,83,0,1,'2026-01-15 10:44:17','2026-01-15 10:46:27'),(84,9,'TSH-DJ-LS-NAV-Medium-PRE',49.99,NULL,17,NULL,84,0,1,'2026-01-15 10:44:17','2026-01-15 10:46:27'),(85,9,'TSH-DJ-LS-NAV-Large-CLA',39.99,29.99,26,NULL,85,0,1,'2026-01-15 10:44:18','2026-01-15 10:46:28'),(86,9,'TSH-DJ-LS-NAV-Large-PRE',49.99,NULL,26,NULL,86,0,1,'2026-01-15 10:44:18','2026-01-15 10:46:28'),(87,9,'TSH-DJ-LS-NAV-XL-CLA',39.99,NULL,14,NULL,87,0,1,'2026-01-15 10:44:18','2026-01-15 10:46:28'),(88,9,'TSH-DJ-LS-NAV-XL-PRE',49.99,NULL,24,NULL,88,0,1,'2026-01-15 10:44:19','2026-01-15 10:46:29');
/*!40000 ALTER TABLE `product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `category_id` bigint unsigned DEFAULT NULL,
  `product_type` enum('simple','variable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'simple',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_chk_1` CHECK (json_valid(`gallery`))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'DJ Classic T-Shirt','dj-classic-t-shirt','Premium quality cotton t-shirt with DJ logo. Perfect for casual wear or events.','Classic DJ branded t-shirt',29.99,24.99,'TSH-DJ-001',50,6,'simple',NULL,NULL,NULL,1,1,1,'2026-01-15 10:33:26','2026-01-15 10:33:26',NULL),(2,'DJ Premium Cap','dj-premium-cap','Adjustable premium cap with embroidered DJ logo. One size fits all.','Premium DJ cap with logo',19.99,NULL,'CAP-DJ-001',30,8,'simple',NULL,NULL,NULL,1,0,2,'2026-01-15 10:33:26','2026-01-15 10:33:26',NULL),(3,'DJ Pro Headphones','dj-pro-headphones','Professional DJ headphones with excellent sound quality and noise isolation.','Professional DJ headphones',89.99,79.99,'HP-DJ-001',24,9,'simple',NULL,NULL,NULL,1,1,3,'2026-01-15 10:33:26','2026-01-15 12:54:01',NULL),(4,'DJ Equipment Case','dj-equipment-case','Durable hard case for protecting your DJ equipment during transport.','Protective case for DJ equipment',49.99,NULL,'CASE-DJ-001',15,10,'simple',NULL,NULL,NULL,1,0,4,'2026-01-15 10:33:26','2026-01-15 10:33:26',NULL),(5,'DJ Premium T-Shirt','dj-premium-t-shirt-variable','Premium quality t-shirt available in multiple colors and sizes. Made from 100% organic cotton.','Premium t-shirt with color and size options',34.99,NULL,'TSH-DJ-PREM',0,6,'variable',NULL,NULL,NULL,1,1,5,'2026-01-15 10:33:26','2026-01-15 10:33:26',NULL),(6,'DJ Premium Hoodie','dj-premium-hoodie-variable','Premium quality hoodie available in multiple colors, sizes, and types. Perfect for cold weather events.','Premium hoodie with multiple options',59.99,NULL,'HOD-DJ-PREM',0,7,'variable',NULL,NULL,NULL,1,1,6,'2026-01-15 10:33:29','2026-01-15 10:33:29',NULL),(7,'DJ Premium Cap','dj-premium-cap-variable','Premium adjustable cap available in multiple colors and sizes. Perfect for any DJ or MC.','Premium cap with color and size options',24.99,NULL,'CAP-DJ-PREM',0,8,'variable',NULL,NULL,NULL,1,0,7,'2026-01-15 10:44:11','2026-01-15 10:44:11',NULL),(8,'DJ Pro Headphones','dj-pro-headphones-variable','Professional DJ headphones available in different types and colors. Perfect for any DJ setup.','Professional headphones with type and color options',99.99,NULL,'HP-DJ-PRO',0,9,'variable',NULL,NULL,NULL,1,1,8,'2026-01-15 10:44:13','2026-01-15 10:44:13',NULL),(9,'DJ Long Sleeve T-Shirt','dj-long-sleeve-t-shirt','Premium long sleeve t-shirt available in multiple colors, sizes, and types. Perfect for cooler weather events.','Long sleeve t-shirt with multiple options',39.99,NULL,'TSH-DJ-LS',0,6,'variable',NULL,NULL,NULL,1,0,9,'2026-01-15 10:44:15','2026-01-21 22:19:36','2026-01-21 22:19:36');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `dj_id` bigint unsigned NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `aspects` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_booking_id_foreign` (`booking_id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_dj_id_foreign` (`dj_id`),
  CONSTRAINT `reviews_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_dj_id_foreign` FOREIGN KEY (`dj_id`) REFERENCES `djs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_chk_1` CHECK (json_valid(`aspects`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','dj','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','admin@diskjockey.com','admin',NULL,NULL,NULL,'$2y$12$ZjGzK7fa2/TnF2Pxyy0bdOcgRNtMh56ieXK6Cr3WrtAGTvVzWHM16','0C94lsKqXgbb0yeCZqcwkSMhTGFAzaikCebFMukmfxXl5qLc5TZGvygJ34xm','2026-01-14 13:13:42','2026-01-14 13:13:42'),(2,'DJ Nova','djnova@example.com','dj',NULL,NULL,NULL,'$2y$12$nlkqLY/osanJBcZ6009lDu5EiUBPUbkthzAGu3VlV9fFTjkwm/OzK','oARhJC9nSQ6VEPSHLQcPjAsP2cK5gtLXMHAntGPvh26skjXCm7zF7PxnEzLl','2026-01-14 13:13:43','2026-01-14 13:13:43'),(4,'Alex Vibe','alexvibe@example.com','dj',NULL,NULL,NULL,'$2y$12$8G3YG.r44JtEU6katq9IauybkbTsukD9je.bvTzW8nKXHvAfMUk2W',NULL,'2026-01-14 13:15:52','2026-01-14 13:15:52'),(5,'Michael Carter','mcarter@example.com','dj',NULL,NULL,NULL,'$2y$12$43VQtgnSi22saUCBTZiBf.RLty.KM6kw.N2R03v6a2vGFxhVicRxy',NULL,'2026-01-14 13:15:53','2026-01-14 13:15:53'),(6,'Test User','user@example.com','user','1231231231',NULL,NULL,'$2y$12$wtO6Ow/K9bjeANw0LmG2l.AcIGq8OgJFzA27N5gqyxyqeXDixaDum','mjNIGmGAT2ojxtGK4M5wiWnGb9G1wGGfzGYFXqVyYgumlKl1lHOmyhChT64W','2026-01-14 13:15:53','2026-01-15 12:29:10'),(7,'Cody Walter','tanoxizyta@mailinator.com','user',NULL,NULL,NULL,'$2y$12$2oPLEtUrZkfFi2QnrUHIY.IYaQj88OV8.w/MvNixHjTHvY8SzBtiW',NULL,'2026-01-16 17:33:16','2026-01-16 17:33:16'),(8,'Dana Roach','example@example.com','user',NULL,NULL,NULL,'$2y$12$t4505H10fHY5lhU6XwxxOuZfFPqf5msydeQZyBH8l54/L8H9Ga2oG',NULL,'2026-01-16 18:29:25','2026-01-16 18:29:25'),(9,'testing2','testing2@example.com','user',NULL,NULL,NULL,'$2y$12$u32f55tr1gXYJSzn4MjGpO2lb9c2IW8mzXN5rhjU7jeBEw4gGt9Be',NULL,'2026-01-16 20:11:00','2026-01-16 20:11:00'),(10,'jASBNDAJKL','TEST@TEST.COM','dj',NULL,NULL,NULL,'$2y$12$e6f5yedHw.wWf2tvhqz22O1SQIf2I32P8RWGqwAXCpsfmZA3Jo5km',NULL,'2026-01-19 22:20:16','2026-01-19 22:20:16');
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

-- Dump completed on 2026-01-26 16:25:08
