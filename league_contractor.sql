-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: league_contractor
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
INSERT INTO `cache` VALUES ('leaguecontractor-cache-05a3af0d12445100b0699fb54fc6e179','i:1;',1767998147),('leaguecontractor-cache-05a3af0d12445100b0699fb54fc6e179:timer','i:1767998147;',1767998147),('leaguecontractor-cache-0c0723c213e54fdf863ac13e40a0b702','i:2;',1767997182),('leaguecontractor-cache-0c0723c213e54fdf863ac13e40a0b702:timer','i:1767997182;',1767997182),('leaguecontractor-cache-2b7438ecc865f95206103123b4a67897','i:1;',1767986744),('leaguecontractor-cache-2b7438ecc865f95206103123b4a67897:timer','i:1767986744;',1767986744),('leaguecontractor-cache-5399397e8d181dc749eca20f2f8da406','i:1;',1768515368),('leaguecontractor-cache-5399397e8d181dc749eca20f2f8da406:timer','i:1768515368;',1768515368),('leaguecontractor-cache-6883a4a45970e6ff84c24cec04de277b','i:1;',1767997874),('leaguecontractor-cache-6883a4a45970e6ff84c24cec04de277b:timer','i:1767997874;',1767997874),('leaguecontractor-cache-6989ec266d21a41ebaaa2743f9b1c8d4','i:1;',1768509260),('leaguecontractor-cache-6989ec266d21a41ebaaa2743f9b1c8d4:timer','i:1768509259;',1768509260),('leaguecontractor-cache-d64800efd4be974a29f3159b97dd7e6f','i:1;',1768510012),('leaguecontractor-cache-d64800efd4be974a29f3159b97dd7e6f:timer','i:1768510012;',1768510012),('leaguecontractor-cache-e0fe5d581ca042b705705a08e406e238','i:1;',1768510090),('leaguecontractor-cache-e0fe5d581ca042b705705a08e406e238:timer','i:1768510090;',1768510090),('leaguecontractor-cache-f2fa9b63f0e44c32b9ffd388d8c78185','i:1;',1768348138),('leaguecontractor-cache-f2fa9b63f0e44c32b9ffd388d8c78185:timer','i:1768348138;',1768348138);
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
-- Table structure for table `cms_module`
--

DROP TABLE IF EXISTS `cms_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_module` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_module`
--

LOCK TABLES `cms_module` WRITE;
/*!40000 ALTER TABLE `cms_module` DISABLE KEYS */;
INSERT INTO `cms_module` VALUES (1,0,'Dashboard','admin.dashboard','fa-regular fa-house',1,'active','2026-01-13 23:39:48','2026-01-13 23:39:48'),(2,0,'Users','users-module','fa-solid fa-users',2,'active','2026-01-13 23:39:48','2026-01-13 23:39:48'),(3,0,'Memberships','memberships-module','fa-solid fa-users-gear',3,'active','2026-01-13 23:39:48','2026-01-13 23:39:48'),(4,0,'Payments','payments','fa-solid fa-credit-card',4,'active','2026-01-13 23:39:48','2026-01-13 23:39:48'),(5,0,'Referrals','referrals-module','fa-solid fa-share-nodes',5,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(6,0,'Contractors','contractors-module','fa-solid fa-user-tie',6,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(7,0,'Services','services-module','fa-solid fa-screwdriver-wrench',7,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(8,0,'Products','products-module','fa-solid fa-boxes-packing',8,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(9,0,'Orders','orders-module','fa-solid fa-list-ul',9,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(10,2,'All Users','users.index','fa-solid fa-list-ul',1,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(11,2,'Add User','users.create','fa-solid fa-circle-plus',2,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(12,3,'All Memberships','memberships.index','fa-solid fa-list-ul',2,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(13,5,'All Referrals','referrals.index','fa-solid fa-list-ul',1,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(14,5,'Add Referral','referrals.create','fa-solid fa-share-nodes',2,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(15,6,'All Contractors','contractors.index','fa-solid fa-list-ul',1,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(16,6,'Add Contractor','contractors.create','fa-solid fa-user-tie',2,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(17,7,'All Services','services.index','fa-solid fa-list-ul',1,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(18,7,'Add Service','services.create','fa-solid fa-screwdriver-wrench',2,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(19,7,'Create Category','services-categories.create','fa-solid fa-list-ul',3,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(20,7,'All Categories','services-categories.index','fa-solid fa-list-ul',4,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(21,8,'All Products','products.index','fa-solid fa-boxes-packing',1,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(22,8,'Add Product','products.create','fa-solid fa-boxes-packing',2,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(23,9,'All Orders','orders.index','fa-solid fa-list-ul',1,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(24,6,'Pending Contractors','contractor-approval.index','fa-solid fa-user-check',1,'active','2026-01-13 23:39:49','2026-01-13 23:39:49');
/*!40000 ALTER TABLE `cms_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_module_permission`
--

DROP TABLE IF EXISTS `cms_module_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_module_permission` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `module_id` int NOT NULL,
  `is_add` tinyint(1) NOT NULL DEFAULT '1',
  `is_view` tinyint(1) NOT NULL DEFAULT '1',
  `is_update` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_module_permission`
--

LOCK TABLES `cms_module_permission` WRITE;
/*!40000 ALTER TABLE `cms_module_permission` DISABLE KEYS */;
INSERT INTO `cms_module_permission` VALUES (1,1,1,0,1,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(2,1,2,1,1,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(3,1,3,1,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(4,1,4,0,0,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(5,1,5,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(6,1,6,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(7,1,7,1,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(8,1,8,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(9,1,9,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(10,1,10,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(11,1,11,0,0,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(12,1,12,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(13,1,13,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(14,1,14,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(15,1,15,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(16,1,16,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(17,1,17,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(18,1,18,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(19,1,19,1,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(20,1,20,1,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(21,1,21,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(22,1,22,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(23,1,23,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(24,1,24,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(25,2,1,0,1,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(26,2,2,0,0,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(27,2,3,0,0,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(28,2,4,0,0,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(29,2,5,0,0,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(30,2,7,1,0,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(31,2,8,0,0,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(32,2,9,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(33,2,10,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(34,2,11,0,0,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(35,2,12,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(36,2,13,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(37,2,14,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(38,2,17,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(39,2,18,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(40,2,19,1,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(41,2,20,1,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(42,2,21,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(43,2,22,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(44,2,23,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(45,2,24,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(46,4,1,0,1,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(47,4,2,0,0,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(48,4,3,0,0,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(49,4,4,0,1,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(50,4,5,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(51,4,7,1,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(52,4,8,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(53,4,9,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(54,4,10,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(55,4,11,0,0,0,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(56,4,12,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(57,4,13,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(58,4,14,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(59,4,17,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(60,4,18,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(61,4,19,1,0,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(62,4,20,1,0,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(63,4,21,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(64,4,22,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(65,4,23,0,1,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49'),(66,4,24,0,0,1,0,'active','2026-01-13 23:39:49','2026-01-13 23:39:49');
/*!40000 ALTER TABLE `cms_module_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insurance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contractor_limit` int NOT NULL DEFAULT '0',
  `is_profile_completed` tinyint(1) NOT NULL DEFAULT '0',
  `is_profile_approved` tinyint(1) NOT NULL DEFAULT '0',
  `approval_notified` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,6,'company1','diamond-fixers','stores/njd6mKB27JqBdInXDrB4xziUWhYjYZIsmqCcPghP.webp','zdfadf+3','sdfsdf435345','5551234567',NULL,'US','San Francisco','CA','50045','Haight-Ashbury','diamond fixers',0,1,1,0,1,'2026-01-09 19:23:59','2026-01-09 19:25:05'),(2,7,'gfch','v-sdxv',NULL,'12345','3567865f','1234567',NULL,'us','n b','gnt','b gbrh5','v fdvb','v sdxv',0,1,1,0,1,'2026-01-09 20:32:18','2026-01-09 20:35:50'),(3,4,'sfabdvd','sdagf-v','stores/OVXCUE3ymzZa65EfUAMmYP83eEJ1cjcLApxGQepX.jpg','cSBDA VAS','FBASV','DVd',NULL,'asc','dvx','dcz','dscv xc','sdva','sdagf v',0,1,1,0,1,'2026-01-09 22:37:17','2026-01-09 22:42:16'),(4,9,'company1','premium-stone','stores/JdU0OWOshoqnW0D4K9H6jlsRtYJIABS3F57nwy4L.webp','zdfadf+3','sdfsdf435345','7284587308',NULL,'test','test','test','50045','test','premium-stone',0,1,1,1,1,'2026-01-13 23:44:06','2026-01-13 23:49:12'),(5,11,'gfch','ghvmjhvm','stores/lvUCff5qqzUaVkibPCWKKg1wQoFgga9MhCtux3dw.jpg','cSBDA VAS','FBASV','1 (231) 312-312',NULL,'us','dvx','gnt','b gbrh5','v fdvb','ghvmjhvm',0,1,1,1,1,'2026-01-15 22:16:06','2026-01-15 22:16:24'),(6,12,'jvchkdan ds','plumbing','stores/qVv9Gn3icYHQbp1WU8oXAuoLWzhwblocLDS0mem1.png','x1343495','asjnkjfsc','468-168-6092',NULL,'Us','CNSKCS','FLORIDA','VSDFGAS','SSCDC','Plumbing',0,1,1,1,1,'2026-01-15 22:42:46','2026-01-15 22:47:11');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_contractors`
--

DROP TABLE IF EXISTS `company_contractors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_contractors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_contractors_company_id_foreign` (`company_id`),
  KEY `company_contractors_user_id_foreign` (`user_id`),
  CONSTRAINT `company_contractors_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `company_contractors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_contractors`
--

LOCK TABLES `company_contractors` WRITE;
/*!40000 ALTER TABLE `company_contractors` DISABLE KEYS */;
INSERT INTO `company_contractors` VALUES (1,2,8,'2026-01-09 20:36:33','2026-01-09 20:36:33');
/*!40000 ALTER TABLE `company_contractors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractors`
--

DROP TABLE IF EXISTS `contractors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractors`
--

LOCK TABLES `contractors` WRITE;
/*!40000 ALTER TABLE `contractors` DISABLE KEYS */;
/*!40000 ALTER TABLE `contractors` ENABLE KEYS */;
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
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (23,'0001_01_01_000000_create_users_table',1),(24,'0001_01_01_000001_create_cache_table',1),(25,'0001_01_01_000002_create_jobs_table',1),(26,'2025_11_27_222559_create_permission_tables',1),(27,'2025_11_27_222755_create_cms_module_table',1),(28,'2025_11_27_222819_create_cms_module_permission_table',1),(29,'2025_11_27_225707_add_two_factor_columns_to_users_table',1),(30,'2025_12_02_234905_create_memberships_table',1),(31,'2025_12_03_183256_create_contractors_table',1),(32,'2025_12_03_184152_create_companies_table',1),(33,'2025_12_03_201249_create_referrals_table',1),(34,'2025_12_03_224926_create_products_table',1),(35,'2025_12_04_172027_create_orders_table',1),(36,'2025_12_04_185028_add_role_to_users_table',1),(37,'2025_12_04_185240_create_packages_table',1),(38,'2025_12_04_194118_create_subscriptions_table',1),(39,'2025_12_04_194345_create_service_categories_table',1),(40,'2025_12_04_194346_create_services_table',1),(41,'2025_12_10_175834_create_company_contractors_table',1),(42,'2025_12_12_184152_create_service_images_table',1),(43,'2026_01_07_192621_add_profile_image_to_users_table',1),(44,'2026_01_07_231738_add_store_image_column_to_companies_table',1),(45,'2026_01_09_221432_create_service_bookings_table',2),(46,'2026_01_13_153113_add_approval_notified_column_to_companies_table',2),(47,'2026_01_13_165238_create_notifications_table',2);
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
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2),(3,'App\\Models\\User',3),(4,'App\\Models\\User',4),(5,'App\\Models\\User',5),(4,'App\\Models\\User',6),(4,'App\\Models\\User',7),(3,'App\\Models\\User',8),(4,'App\\Models\\User',9),(2,'App\\Models\\User',10),(4,'App\\Models\\User',11),(4,'App\\Models\\User',12);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
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
INSERT INTO `notifications` VALUES ('681e18ee-5faf-4ca6-b1c9-4d6d5df10786','App\\Notifications\\CompanyApprovedNotification','App\\Models\\User',12,'{\"message\":\"Your profile has been approved\"}','2026-01-15 22:53:32','2026-01-15 22:47:11','2026-01-15 22:53:32'),('ca9f536a-6b15-45ea-a3b4-2cc22e9f43ff','App\\Notifications\\CompanyApprovedNotification','App\\Models\\User',11,'{\"message\":\"Your profile has been approved\"}','2026-01-15 22:16:46','2026-01-15 22:16:24','2026-01-15 22:16:46'),('fea2ffc3-be81-40da-b55c-dab7f0a3512d','App\\Notifications\\CompanyApprovedNotification','App\\Models\\User',9,'{\"message\":\"Your profile has been approved\"}',NULL,'2026-01-13 23:49:12','2026-01-13 23:49:12');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contractor_limit` int DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'Basic Member','individual_contractor',NULL,20.00,'2026-01-09 19:16:04','2026-01-09 19:16:04'),(2,'Pro Member','individual_contractor',NULL,49.00,'2026-01-09 19:16:04','2026-01-09 19:16:04'),(3,'Elite Member','league_contractor',10,99.00,'2026-01-09 19:16:04','2026-01-09 19:16:04');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
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
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2026-01-09 19:15:59','2026-01-09 19:15:59'),(2,'user','web','2026-01-09 19:15:59','2026-01-09 19:15:59'),(3,'contractor','web','2026-01-09 19:15:59','2026-01-09 19:15:59'),(4,'league_contractor','web','2026-01-09 19:15:59','2026-01-09 19:15:59'),(5,'individual_contractor','web','2026-01-09 19:15:59','2026-01-09 19:15:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_bookings`
--

DROP TABLE IF EXISTS `service_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_bookings_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_bookings`
--

LOCK TABLES `service_bookings` WRITE;
/*!40000 ALTER TABLE `service_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_categories`
--

DROP TABLE IF EXISTS `service_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_categories`
--

LOCK TABLES `service_categories` WRITE;
/*!40000 ALTER TABLE `service_categories` DISABLE KEYS */;
INSERT INTO `service_categories` VALUES (1,'Plumbing','2026-01-09 19:16:04','2026-01-09 19:16:04'),(2,'Electrical','2026-01-09 19:16:04','2026-01-09 19:16:04'),(3,'Carpentry','2026-01-09 19:16:04','2026-01-09 19:16:04'),(4,'Painting','2026-01-09 19:16:04','2026-01-09 19:16:04'),(5,'Cleaning','2026-01-09 19:16:04','2026-01-09 19:16:04'),(6,'Gardening','2026-01-09 19:16:04','2026-01-09 19:16:04'),(7,'Other','2026-01-09 19:16:04','2026-01-09 19:16:04');
/*!40000 ALTER TABLE `service_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_images`
--

DROP TABLE IF EXISTS `service_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_images_service_id_foreign` (`service_id`),
  CONSTRAINT `service_images_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_images`
--

LOCK TABLES `service_images` WRITE;
/*!40000 ALTER TABLE `service_images` DISABLE KEYS */;
INSERT INTO `service_images` VALUES (1,'services/gallery/MDbj9xRC9hXGILlgj1PDeg0mj7SKHkS33S9faZvK.jpg',1,'2026-01-09 19:27:40','2026-01-09 19:27:40'),(2,'services/gallery/OUud99aGtRayMRwU5ofO4G11yJ5hJ9CNmqoxrwru.jpg',1,'2026-01-09 19:27:40','2026-01-09 19:27:40'),(3,'services/gallery/MCQC1Ebw1r8Z0b3d2LwIYvsZL5izHKAcLsghMke3.jpg',1,'2026-01-09 19:27:40','2026-01-09 19:27:40'),(4,'services/gallery/N3jvCQe2Oph4DFcLug9moPAAbsQzW0lnuhM2teHy.jpg',1,'2026-01-09 19:27:40','2026-01-09 19:27:40'),(5,'services/gallery/DlHQaWfyJRNy1feMFpc1b9QtISemxL2s7m8xGtxi.jpg',2,'2026-01-09 20:39:37','2026-01-09 20:39:37');
/*!40000 ALTER TABLE `service_images` ENABLE KEYS */;
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
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `service_category_id` bigint unsigned NOT NULL,
  `duration` int NOT NULL DEFAULT '5',
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_company_id_slug_unique` (`company_id`,`slug`),
  KEY `services_service_category_id_foreign` (`service_category_id`),
  KEY `services_user_id_foreign` (`user_id`),
  CONSTRAINT `services_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'cleaning service','cleaning-service','best cleaners in Town',6,1,5,5,'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.','services/main/SCPzmWpZGq895fokfLHQyIbhGvMu2xMtLMZR2WtT.jpg',1,'2026-01-09 19:27:40','2026-01-09 19:27:40'),(2,'Roofing','roofing','bfjke',7,2,7,5,'aszswgftjhrgdfs','services/main/yVA7umylnFJK184HwuRyc8CKAujTcCVJPrycXHo8.jpg',1,'2026-01-09 20:39:37','2026-01-09 20:39:37'),(3,'bdfs','bdfs','sVsax',12,6,1,5,'SHdjksabdfwesc','services/main/wUWQQUTiTri8iYUEJLomSFSTBCwRQHkKv5fzslZi.jpg',1,'2026-01-15 22:54:11','2026-01-15 22:54:11');
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
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `expiry_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,6,3,'active','2026-02-09','2026-01-09 19:22:44','2026-01-09 19:22:44'),(2,7,3,'active','2026-02-09','2026-01-09 20:31:26','2026-01-09 20:31:26'),(3,9,3,'active','2026-02-13','2026-01-13 23:41:29','2026-01-13 23:41:29'),(4,11,3,'active','2026-02-15','2026-01-15 22:13:53','2026-01-15 22:13:53'),(5,12,3,'active','2026-02-15','2026-01-15 22:35:10','2026-01-15 22:35:10');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
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
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `profile_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_contractor` tinyint(1) NOT NULL DEFAULT '0',
  `is_individual_contractor` tinyint(1) NOT NULL DEFAULT '0',
  `is_league_contractor` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_created_by_foreign` (`created_by`),
  CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Admin','admin@gmail.com','customer',NULL,0,0,0,NULL,1,NULL,'$2y$12$0fvcNyy1OpfppaBW18XgmuPK3ZFtcjI..G/2tGNDsu8fa2/XIh942',NULL,NULL,NULL,NULL,'2026-01-09 19:16:00','2026-01-09 19:16:00'),(2,'Customer','customer@gmail.com','customer',NULL,0,0,0,NULL,1,NULL,'$2y$12$OttJ1FNRjlDPjjxn8dUNzeqLOgB8Lcm18geKASlGqWEFtmRrPKqxy',NULL,NULL,NULL,NULL,'2026-01-09 19:16:01','2026-01-09 19:16:01'),(3,'Contractor User','contractor@gmail.com','customer',NULL,0,0,0,NULL,1,NULL,'$2y$12$74zRHZDxRujPFtRQQsYYpO3X34Rt20Ss9U8XC3Mdq1sNG5cbU0OZy',NULL,NULL,NULL,'pSumHnn6fTsXUzEBOnhYie6mP766rcyyQw8fDUIAYLHybffABypkrclmnxwH','2026-01-09 19:16:01','2026-01-09 19:16:01'),(4,'League Contractor','leaguecontractor@gmail.com','customer',NULL,0,0,0,NULL,1,NULL,'$2y$12$QoL0utrslerwVpijvbEdOOF9EpmHRONRjTrRxN382vsRwBcSBpG5K',NULL,NULL,NULL,NULL,'2026-01-09 19:16:02','2026-01-09 19:16:02'),(5,'Individual Contractor','individualcontractor@gmail.com','customer',NULL,0,0,0,NULL,1,NULL,'$2y$12$yZGmXV3CrOEdzGkFpXuDGOgEc8qy8z8sXCFCkCDcNWfK9XicZOl1.',NULL,NULL,NULL,NULL,'2026-01-09 19:16:03','2026-01-09 19:16:03'),(6,'League Contractor','dev@yopmail.com','customer','profiles/71jeUjUtduOoqIzw6sB75XsvdqVkUBrrAFC8t1g3.jpg',0,0,1,NULL,1,NULL,'$2y$12$cVznPRORA6/5rSdHVeErJORgEKQjWHA49EcMw.JkamXpDeJ96IJsK',NULL,NULL,NULL,'TMefK1JTUuGXHWhq41OsuMJlEHvB75QNYjBZ0FymPz1u7TBE2WuZpdSqRbwu','2026-01-09 19:22:39','2026-01-15 20:47:30'),(7,'Eric','eric@americandigitalagency.us','customer',NULL,0,0,1,NULL,1,NULL,'$2y$12$pYiv1wIKf4LBh6ox7PBaYuFL1N8zkOipkL0F96K/tjOHZCDz.bmkC',NULL,NULL,NULL,NULL,'2026-01-09 20:31:08','2026-01-09 20:31:26'),(8,'Eric','eric@yopmail.com','customer',NULL,0,0,0,7,1,NULL,'$2y$12$GZOvt6I4H3mygi6i3ZIKyeGJD7L/EsJ6ZKTz8SyBpPxR/3fHzfpG.',NULL,NULL,NULL,NULL,'2026-01-09 20:36:33','2026-01-09 20:36:33'),(9,'john','john@yopmail.com','customer',NULL,0,0,1,NULL,1,NULL,'$2y$12$B8NLyRSQyHBqybHGGfKfsuJgoLQhSA70ezK8qWYyV1NcACcOxGgRy',NULL,NULL,NULL,NULL,'2026-01-13 23:41:25','2026-01-13 23:41:29'),(10,'Terry','terry@yopmail.com','customer',NULL,0,0,0,NULL,1,NULL,'$2y$12$vl9i85wP3OtygkyViMlZIOmkwIs03vicU5578ykAMouFCAZKUMK2S',NULL,NULL,NULL,NULL,'2026-01-15 22:09:43','2026-01-15 22:09:43'),(11,'Jesse','jesse@yopmail.com','customer',NULL,0,0,1,NULL,1,NULL,'$2y$12$/zCGmcAimtOFwjMwR7vbx.Kiox1tFtsTjLo1.UYGwY.Kxb1ptR.Tu',NULL,NULL,NULL,NULL,'2026-01-15 22:13:46','2026-01-15 22:13:53'),(12,'Alex','alex@yopmail.com','customer',NULL,0,0,1,NULL,1,NULL,'$2y$12$cFmSiZ6A5tJUHzSjvaeWxOOk7oHyclkiJpcxVJtr6XBNhnw14nFpm',NULL,NULL,NULL,NULL,'2026-01-15 22:34:07','2026-01-15 22:35:10');
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

-- Dump completed on 2026-01-26 16:34:43
