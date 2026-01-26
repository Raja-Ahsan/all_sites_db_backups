-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: emeraldrx_hr
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
-- Table structure for table `attendance_logs`
--

DROP TABLE IF EXISTS `attendance_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_logs` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shiftAssignmentId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clockIn` datetime NOT NULL,
  `clockOut` datetime DEFAULT NULL,
  `ipAddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceInfo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isLate` tinyint(1) DEFAULT '0',
  `isNoShow` tinyint(1) DEFAULT '0',
  `totalHours` decimal(5,2) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_clockIn` (`clockIn`),
  KEY `idx_shiftAssignmentId` (`shiftAssignmentId`),
  CONSTRAINT `attendance_logs_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_logs_ibfk_2` FOREIGN KEY (`shiftAssignmentId`) REFERENCES `shift_assignments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_logs`
--

LOCK TABLES `attendance_logs` WRITE;
/*!40000 ALTER TABLE `attendance_logs` DISABLE KEYS */;
INSERT INTO `attendance_logs` VALUES ('17782f7a-8318-4b75-9988-a77c2613f96b','57b017b3-7414-4014-b107-3a588834d289',NULL,'2025-11-02 07:10:06','2025-11-02 15:10:06',NULL,NULL,0,0,8.10,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('1a4e91cd-1a4d-4dad-ad02-d576d109053e','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-25 18:48:55','2025-11-26 02:48:55',NULL,NULL,0,0,8.08,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('1cc583a7-7207-4321-936f-269be6592830','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-06 00:19:45','2025-11-06 09:19:45',NULL,NULL,0,0,7.90,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('23b3d7dc-f206-4022-89c6-e3393b3a25f7','57b017b3-7414-4014-b107-3a588834d289',NULL,'2025-11-21 22:37:52','2025-11-22 07:37:52',NULL,NULL,0,0,8.07,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('2b53a6b8-b852-4e29-8867-7a4772528284','cbc4f36f-2455-4c69-aa94-285a03f27802',NULL,'2025-12-18 15:01:15','2025-12-18 15:01:16','::ffff:127.0.0.1','portal',0,0,0.00,NULL,'2025-12-18 15:01:14','2025-12-18 15:01:16'),('2ea4930d-5c67-4af0-952c-f299991aaddc','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-04 23:01:38','2025-11-05 07:01:38',NULL,NULL,0,0,8.23,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('34d5e3cb-0355-4279-9ef8-7731cb0a4023','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-01 18:25:50','2025-11-02 03:25:50',NULL,NULL,1,0,8.11,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('49bd9210-d829-4eb6-add6-5668d32aadbb','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-10 15:57:45','2025-11-10 23:57:45',NULL,NULL,0,0,8.03,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('56d2e2a5-6fbe-42c0-8568-1ac85d4ae554','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-23 01:12:13','2025-11-23 10:12:13',NULL,NULL,0,0,7.99,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('67d4ad59-dbe1-4d65-8c3b-d955dcc4704c','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-08 10:56:59','2025-11-08 18:56:59',NULL,NULL,0,0,8.18,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('6cddffa7-7697-4636-a24e-05248df1b88a','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-21 01:39:52','2025-11-21 09:39:52',NULL,NULL,0,0,8.24,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('7a90ce88-6bba-4a88-b6a2-abe8cccbd72a','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-23 12:07:45','2025-11-23 20:07:45',NULL,NULL,0,0,8.16,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('7b90a9a2-fe47-4661-b2c9-95a209b747c5','57b017b3-7414-4014-b107-3a588834d289',NULL,'2025-11-15 22:08:04','2025-11-16 06:08:04',NULL,NULL,0,0,7.87,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('8706f598-187e-4c99-ab85-e8bffcf0aef4','cbc4f36f-2455-4c69-aa94-285a03f27802',NULL,'2025-12-22 14:02:54','2025-12-22 14:02:55','::ffff:127.0.0.1','portal',0,0,0.00,NULL,'2025-12-22 14:02:53','2025-12-22 14:02:55'),('8f56f6f9-b647-4731-9b44-51d47de5fe32','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-06 03:58:45','2025-11-06 11:58:45',NULL,NULL,1,0,8.18,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('9337c2a4-1dc1-4418-b653-b3a98dba5cbd','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-10-31 23:17:34','2025-11-01 08:17:34',NULL,NULL,0,0,8.19,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('98c33e57-b000-4e60-9b85-2edee481572f','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-25 14:48:00','2025-11-25 22:48:00',NULL,NULL,0,0,7.96,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('a9735e13-5d71-4595-8a7a-9bff0dd9c594','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-27 10:16:33','2025-11-27 19:16:33',NULL,NULL,0,0,8.02,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('ad294c88-8a9f-4f22-8d29-f4821f76a5fa','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-16 18:01:07','2025-11-17 02:01:07',NULL,NULL,0,0,8.13,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('af661fee-fd88-40db-9424-a70b45656db0','57b017b3-7414-4014-b107-3a588834d289',NULL,'2025-11-15 20:20:19','2025-11-16 04:20:19',NULL,NULL,0,0,7.84,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('b9feec82-305f-43a2-95e6-e064f6a31054','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-23 04:51:50','2025-11-23 12:51:50',NULL,NULL,0,0,8.20,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('d177cef0-1f03-4a5a-b7e5-97bab5b4470d','57b017b3-7414-4014-b107-3a588834d289',NULL,'2025-11-13 20:46:19','2025-11-14 05:46:19',NULL,NULL,1,0,8.03,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('d3917211-ad81-4d0d-b289-6a069e854073','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-05 10:00:28','2025-11-05 18:00:28',NULL,NULL,0,0,8.15,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('db9a93f9-cc7d-478d-9397-be4fecfbb433','57b017b3-7414-4014-b107-3a588834d289',NULL,'2025-11-26 18:55:30','2025-11-27 03:55:30',NULL,NULL,0,0,7.93,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('ddb3f93e-8216-4643-801f-d0b9f6af6413','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-24 10:20:11','2025-11-24 18:20:11',NULL,NULL,1,0,8.21,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('deb322ff-e115-4fd4-aadb-d956d00c1429','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-16 04:57:13','2025-11-16 13:57:13',NULL,NULL,0,0,7.98,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('e230e254-07bb-4a1b-b199-21279e0f036f','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-27 04:32:21','2025-11-27 12:32:21',NULL,NULL,0,0,8.16,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('e3e528be-91c0-4032-9a51-82a94decef8d','cbc4f36f-2455-4c69-aa94-285a03f27802',NULL,'2025-12-15 00:11:43','2025-12-15 00:11:46','::ffff:127.0.0.1','portal',0,0,0.00,NULL,'2025-12-15 00:11:43','2025-12-15 00:11:45'),('e9b6d886-2450-4f30-9b70-989988ee391b','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-23 02:42:05','2025-11-23 10:42:05',NULL,NULL,0,0,7.95,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('ebe535a7-08c3-4b7f-ab1f-39c4191182f7','8abcab26-c588-4ca3-be20-a68ea71759e9',NULL,'2025-11-24 15:11:13','2025-11-24 23:11:13',NULL,NULL,0,0,7.85,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('ed1ac7f5-700b-4a2d-b6ed-4b4ef3c08ab4','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-06 00:51:07','2025-11-06 08:51:07',NULL,NULL,0,0,7.86,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('f4c843f5-c1f0-49f4-bfef-ef8175bbf5fa','cbc4f36f-2455-4c69-aa94-285a03f27802',NULL,'2025-12-11 19:20:09','2025-12-11 19:20:13','::ffff:127.0.0.1','portal',0,0,0.00,NULL,'2025-12-11 19:20:09','2025-12-11 19:20:13'),('fb4e3fdf-4db2-4f50-9800-db3638f7884b','38715efa-de7e-47e5-bf9d-fb272bcbe14a',NULL,'2025-11-09 07:51:35','2025-11-09 15:51:35',NULL,NULL,0,0,7.95,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('fd0d24be-76a9-4876-bb55-6663a7ae56a1','57b017b3-7414-4014-b107-3a588834d289',NULL,'2025-11-14 22:13:38','2025-11-15 07:13:38',NULL,NULL,0,0,8.08,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39');
/*!40000 ALTER TABLE `attendance_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clock_in_devices`
--

DROP TABLE IF EXISTS `clock_in_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clock_in_devices` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipAddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ipAddress` (`ipAddress`),
  KEY `idx_deviceId` (`deviceId`),
  KEY `idx_isActive` (`isActive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clock_in_devices`
--

LOCK TABLES `clock_in_devices` WRITE;
/*!40000 ALTER TABLE `clock_in_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `clock_in_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corrective_actions`
--

DROP TABLE IF EXISTS `corrective_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corrective_actions` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `incidentId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dueDate` datetime NOT NULL,
  `completedAt` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_incidentId` (`incidentId`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_status` (`status`),
  KEY `idx_dueDate` (`dueDate`),
  CONSTRAINT `corrective_actions_ibfk_1` FOREIGN KEY (`incidentId`) REFERENCES `incidents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `corrective_actions_ibfk_2` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corrective_actions`
--

LOCK TABLES `corrective_actions` WRITE;
/*!40000 ALTER TABLE `corrective_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `corrective_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('0d981c8f-ca44-11f0-8943-3448ed0ea1e2','Compounding','Compounding department','2025-11-26 02:16:37','2025-11-26 02:16:37'),('0d987e62-ca44-11f0-8943-3448ed0ea1e2','Fulfillment','Fulfillment department','2025-11-26 02:16:37','2025-11-26 02:16:37'),('217552b1-00f0-4a91-8f12-4e6329915199','Pharmacy','Pharmacy operations and compounding','2025-11-19 01:05:32','2025-11-19 01:05:32'),('a1363655-8191-4aac-83d7-4afa3f033529','Administration','Administrative functions','2025-11-19 01:05:32','2025-11-19 01:05:32'),('ef7b5eb2-16ae-46e1-816b-cbe5b09a0047','HR','Human Resources','2025-11-19 01:05:32','2025-11-19 01:05:32');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileUrl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileSize` int NOT NULL,
  `mimeType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploadedBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_type` (`type`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES ('07bb69dc-5595-47d1-b516-ebf53f682ac3','8abcab26-c588-4ca3-be20-a68ea71759e9','Background Check - 2025','Background Check','https://example.com/documents/98a45fb3-4fe9-4776-aa92-5f42996abfcd.pdf',687802,'application/pdf','472950a5-9704-4530-a328-094f8a33ca4c','2025-11-28 00:09:40','2025-11-28 00:09:40'),('55551c02-43d9-44ac-89b5-3d37f5f19a59','8abcab26-c588-4ca3-be20-a68ea71759e9','Certificate - 2025','Certificate','https://example.com/documents/d8eba0c7-afc7-4684-a3fb-69fb36fcbf0c.pdf',1292666,'application/pdf','38715efa-de7e-47e5-bf9d-fb272bcbe14a','2025-11-28 00:09:40','2025-11-28 00:09:40'),('79e08e75-dda4-47d4-a766-3533bb77139b','38715efa-de7e-47e5-bf9d-fb272bcbe14a','ID - 2025','ID','https://example.com/documents/b2b3ca2b-fb81-4e1e-9f1a-cfac0a6c9586.pdf',1207809,'application/pdf','472950a5-9704-4530-a328-094f8a33ca4c','2025-11-28 00:09:40','2025-11-28 00:09:40'),('81cf9533-25d1-4096-903a-c20669f10613','38715efa-de7e-47e5-bf9d-fb272bcbe14a','Certificate - 2025','Certificate','https://example.com/documents/b89ca11b-aab0-4f1f-8b45-334e5f36adec.pdf',1207814,'application/pdf','8abcab26-c588-4ca3-be20-a68ea71759e9','2025-11-28 00:09:40','2025-11-28 00:09:40'),('a88f67db-7edd-4ea3-a5d1-aff00e816914','57b017b3-7414-4014-b107-3a588834d289','Resume - 2025','Resume','https://example.com/documents/8a437de7-a9da-4f45-b86f-65257d0324a6.pdf',1898301,'application/pdf','6c449300-9476-4916-9550-b3760ab9ab1b','2025-11-28 00:09:40','2025-11-28 00:09:40'),('f54b1f78-69d6-4eea-94ce-06fceeaab7be','8abcab26-c588-4ca3-be20-a68ea71759e9','License Copy - 2025','License Copy','https://example.com/documents/4e5c24a6-e6ec-4411-96d4-fce438f7e529.pdf',237339,'application/pdf','6c449300-9476-4916-9550-b3760ab9ab1b','2025-11-28 00:09:40','2025-11-28 00:09:40'),('fb61a9d4-dfe0-4c5f-ab75-a0ca162b65e2','57b017b3-7414-4014-b107-3a588834d289','Certificate - 2025','Certificate','https://example.com/documents/3f4d3bdb-88e7-470c-a656-a94fac8a6501.pdf',187820,'application/pdf','6c449300-9476-4916-9550-b3760ab9ab1b','2025-11-28 00:09:40','2025-11-28 00:09:40');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contacts`
--

DROP TABLE IF EXISTS `emergency_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_contacts` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relationship` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isPrimary` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  CONSTRAINT `emergency_contacts_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contacts`
--

LOCK TABLES `emergency_contacts` WRITE;
/*!40000 ALTER TABLE `emergency_contacts` DISABLE KEYS */;
INSERT INTO `emergency_contacts` VALUES ('988752e0-8d18-4424-8633-4fde1b86e216','38715efa-de7e-47e5-bf9d-fb272bcbe14a','Contact 2 for Employee','Spouse','555-3660','contact2@example.com',0,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('9c132d63-62ee-4ab9-8079-b845ffcac689','8abcab26-c588-4ca3-be20-a68ea71759e9','Contact 1 for Employee','Spouse','555-1770','contact1@example.com',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('c4c03118-d896-41a6-b962-763f89b790e2','57b017b3-7414-4014-b107-3a588834d289','Contact 1 for Employee','Sibling','555-6073','contact1@example.com',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('ddbc901b-4cda-47d4-99fb-cb74dd5d50ef','8abcab26-c588-4ca3-be20-a68ea71759e9','Contact 2 for Employee','Sibling','555-3995','contact2@example.com',0,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('eb37b628-df16-4053-8462-8a69374ca08e','cbc4f36f-2455-4c69-aa94-285a03f27802','JD','Friend','123456789',NULL,1,'2025-12-11 18:02:13','2025-12-11 18:02:13'),('f3ff4174-296b-4f09-a544-803a416c3a98','57b017b3-7414-4014-b107-3a588834d289','Contact 2 for Employee','Spouse','555-9661','contact2@example.com',0,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('f842a606-29f0-46dc-854f-f941cc087b49','38715efa-de7e-47e5-bf9d-fb272bcbe14a','Contact 1 for Employee','Sibling','555-8926','contact1@example.com',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('f9311d52-157b-465e-bb2f-639d4f82afd7','20df7a74-4edc-462b-aac3-5670295bcc73','ABC','Friend','123456789',NULL,1,'2025-12-11 19:30:52','2025-12-11 19:30:52');
/*!40000 ALTER TABLE `emergency_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_document_uploads`
--

DROP TABLE IF EXISTS `employee_document_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_document_uploads` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrDocumentId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documentName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documentType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileUrl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileSize` int NOT NULL,
  `mimeType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvalStatus` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `approvedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvedAt` datetime DEFAULT NULL,
  `rejectionReason` text COLLATE utf8mb4_unicode_ci,
  `uploadedByEmployee` tinyint(1) DEFAULT '1',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_approvalStatus` (`approvalStatus`),
  KEY `idx_hrDocumentId` (`hrDocumentId`),
  CONSTRAINT `employee_document_uploads_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_document_uploads_ibfk_2` FOREIGN KEY (`hrDocumentId`) REFERENCES `hr_documents` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_document_uploads`
--

LOCK TABLES `employee_document_uploads` WRITE;
/*!40000 ALTER TABLE `employee_document_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_document_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_onboarding_tasks`
--

DROP TABLE IF EXISTS `employee_onboarding_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_onboarding_tasks` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `completedAt` datetime DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee_task` (`employeeId`,`taskId`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_taskId` (`taskId`),
  KEY `idx_status` (`status`),
  CONSTRAINT `employee_onboarding_tasks_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_onboarding_tasks_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `onboarding_tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_onboarding_tasks`
--

LOCK TABLES `employee_onboarding_tasks` WRITE;
/*!40000 ALTER TABLE `employee_onboarding_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_onboarding_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_permissions`
--

DROP TABLE IF EXISTS `employee_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_permissions` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee_permissions` (`employeeId`),
  KEY `idx_employeeId` (`employeeId`),
  CONSTRAINT `employee_permissions_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_permissions`
--

LOCK TABLES `employee_permissions` WRITE;
/*!40000 ALTER TABLE `employee_permissions` DISABLE KEYS */;
INSERT INTO `employee_permissions` VALUES ('c524aab5-905d-45f3-b77b-584c01cf4e6c','20df7a74-4edc-462b-aac3-5670295bcc73','{\"employees\":[\"read\"],\"leave\":[\"read\"]}','2025-12-11 19:35:47','2025-12-11 19:35:47');
/*!40000 ALTER TABLE `employee_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_policy_acks`
--

DROP TABLE IF EXISTS `employee_policy_acks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_policy_acks` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `policyId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acknowledgedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `ipAddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee_policy` (`employeeId`,`policyId`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_policyId` (`policyId`),
  CONSTRAINT `employee_policy_acks_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_policy_acks_ibfk_2` FOREIGN KEY (`policyId`) REFERENCES `policies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_policy_acks`
--

LOCK TABLES `employee_policy_acks` WRITE;
/*!40000 ALTER TABLE `employee_policy_acks` DISABLE KEYS */;
INSERT INTO `employee_policy_acks` VALUES ('0da9b047-88f3-421f-9b45-74f06476576b','57b017b3-7414-4014-b107-3a588834d289','92d89746-9460-4021-a6e2-c7460a7f5f7c','2025-11-28 00:09:40','192.168.1.187','2025-11-28 00:09:40'),('14cd9d6a-8143-4513-9d2f-eca0eff6bac0','57b017b3-7414-4014-b107-3a588834d289','6cf9b09b-96be-4cca-902b-8cd07782121a','2025-11-28 00:09:40','192.168.1.243','2025-11-28 00:09:40'),('218ef429-be58-4156-999a-e2ef9d452cc4','38715efa-de7e-47e5-bf9d-fb272bcbe14a','8046bab9-4bd2-4775-b87d-092d7f6e1e83','2025-11-28 00:09:40','192.168.1.199','2025-11-28 00:09:40'),('303cb86f-4ea6-49fd-aaba-4f896374315c','57b017b3-7414-4014-b107-3a588834d289','d8c1190c-f84e-4cf1-8829-25ebae11099e','2025-11-28 00:09:40','192.168.1.168','2025-11-28 00:09:40'),('58a8b669-5cb9-4fb5-80f7-e5de5b2d7d2e','38715efa-de7e-47e5-bf9d-fb272bcbe14a','9cd9ef92-c135-4cfb-8f2e-8a85ce2724e3','2025-11-28 00:09:40','192.168.1.158','2025-11-28 00:09:40'),('67c8a55a-149e-4b0b-b959-5eda0b1e5ddd','38715efa-de7e-47e5-bf9d-fb272bcbe14a','cfad7f6e-14c3-497e-aced-8b3825ca52da','2025-11-28 00:09:40','192.168.1.40','2025-11-28 00:09:40'),('90043247-848c-4bf7-b573-8426f11b781a','38715efa-de7e-47e5-bf9d-fb272bcbe14a','92d89746-9460-4021-a6e2-c7460a7f5f7c','2025-11-28 00:09:40','192.168.1.45','2025-11-28 00:09:40'),('994a4cce-7be5-4c4c-b547-297c718c8b3f','57b017b3-7414-4014-b107-3a588834d289','ff8bfd03-5305-4b2f-80e2-1ddffa2832c9','2025-11-28 00:09:40','192.168.1.30','2025-11-28 00:09:40'),('99ab3764-87ce-4c07-a2cb-c9ebf3adf91a','8abcab26-c588-4ca3-be20-a68ea71759e9','ff8bfd03-5305-4b2f-80e2-1ddffa2832c9','2025-11-28 00:09:40','192.168.1.110','2025-11-28 00:09:40');
/*!40000 ALTER TABLE `employee_policy_acks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_roles`
--

DROP TABLE IF EXISTS `employee_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_roles` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee_role` (`employeeId`,`roleId`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_roleId` (`roleId`),
  CONSTRAINT `employee_roles_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_roles_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_roles`
--

LOCK TABLES `employee_roles` WRITE;
/*!40000 ALTER TABLE `employee_roles` DISABLE KEYS */;
INSERT INTO `employee_roles` VALUES ('1ce3f031-1325-4934-a01e-fdea47dd1b77','cbc4f36f-2455-4c69-aa94-285a03f27802','cca61a07-12eb-4d64-93a8-dbdf69c1eaaa','2025-12-11 18:21:49'),('3a8c0241-790d-44ae-868b-a9249ab30674','57b017b3-7414-4014-b107-3a588834d289','e69990bf-4026-45cc-8b0a-5211e571de10','2025-11-28 00:11:08'),('77eabce5-77ef-42c4-8077-5f277b7402d4','20df7a74-4edc-462b-aac3-5670295bcc73','18e959c9-22af-4b1a-8271-da495c3e8b93','2025-12-11 19:32:16'),('b4153903-ca7a-479c-b336-1543ed783f9f','38715efa-de7e-47e5-bf9d-fb272bcbe14a','cca61a07-12eb-4d64-93a8-dbdf69c1eaaa','2025-11-28 00:09:28'),('bf13a160-5381-42e1-bba5-3af1ad62e2da','8abcab26-c588-4ca3-be20-a68ea71759e9','e206a38b-a514-4c21-8ccd-cc6c70daa891','2025-12-11 19:48:30');
/*!40000 ALTER TABLE `employee_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_training_records`
--

DROP TABLE IF EXISTS `employee_training_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_training_records` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trainingId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `completedDate` datetime DEFAULT NULL,
  `dueDate` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `score` int DEFAULT NULL,
  `certificateUrl` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_trainingId` (`trainingId`),
  KEY `idx_status` (`status`),
  KEY `idx_dueDate` (`dueDate`),
  CONSTRAINT `employee_training_records_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_training_records_ibfk_2` FOREIGN KEY (`trainingId`) REFERENCES `trainings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_training_records`
--

LOCK TABLES `employee_training_records` WRITE;
/*!40000 ALTER TABLE `employee_training_records` DISABLE KEYS */;
INSERT INTO `employee_training_records` VALUES ('4fb08bd3-0c07-4113-805d-3ed78561a5bc','38715efa-de7e-47e5-bf9d-fb272bcbe14a','570dc884-9f3e-4594-a4fb-4a55f8fef134','2025-11-27 01:54:23','2025-11-27 01:54:54','2026-02-27 00:00:00','completed',90,'/uploads/file-1764190486373-698874030.jpg','Testing','2025-11-27 01:54:23','2025-11-27 01:54:54'),('53e7d02e-d00a-4f90-9f3a-02ddf110d22a','38715efa-de7e-47e5-bf9d-fb272bcbe14a','c401d8f6-2327-46be-80e4-3241c7082e20','2025-07-10 06:03:08','2025-11-04 07:08:00','2025-08-09 06:03:08','completed',94,NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('71dfacab-eec4-4141-91ef-96e18490ef4b','38715efa-de7e-47e5-bf9d-fb272bcbe14a','c01cf454-0673-46ca-8906-98d466e98dba','2025-06-06 20:01:18','2025-07-06 15:11:00','2025-07-06 20:01:18','completed',75,NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('b2d91e18-9a4c-42b8-8a0c-a19ac5706c34','cbc4f36f-2455-4c69-aa94-285a03f27802','570dc884-9f3e-4594-a4fb-4a55f8fef134','2025-12-11 18:22:59','2025-12-11 19:51:37','2025-12-15 00:00:00','completed',100,'/uploads/file-1765482692790-873286925.pdf','Good','2025-12-11 18:22:59','2025-12-11 19:51:37'),('eab00d20-62ec-4273-b61f-8810f3854426','57b017b3-7414-4014-b107-3a588834d289','b1d42333-bb0f-4ccc-b646-2105d2b50510','2023-09-26 16:49:39',NULL,'2025-12-26 00:00:00','in_progress',NULL,NULL,NULL,'2025-11-28 00:09:39','2025-11-28 04:11:19');
/*!40000 ALTER TABLE `employee_training_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipCode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hireDate` date NOT NULL,
  `terminationDate` date DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `departmentId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employeeId` (`employeeId`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_email` (`email`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_departmentId` (`departmentId`),
  KEY `idx_isActive` (`isActive`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('20df7a74-4edc-462b-aac3-5670295bcc73','LEAD001','Mr.','Smith','lead.compounding@emeraldsrx.com','+1234567890','2000-01-01','','','','','2025-12-11',NULL,1,'0d981c8f-ca44-11f0-8943-3448ed0ea1e2','Lead','$2a$10$mJJxdFzBesTKLnHjeDrmXep7p/NgQ3N9nL2cwe2AaGU/0I0dtvFay','2025-12-11 19:30:51','2025-12-11 19:31:15'),('38715efa-de7e-47e5-bf9d-fb272bcbe14a','FULF001','Fulfillment','Tech','fulfillment.tech@emeraldsrx.com','555-0006',NULL,NULL,NULL,NULL,NULL,'2021-02-01',NULL,1,'0d987e62-ca44-11f0-8943-3448ed0ea1e2',NULL,'$2a$10$9/i6lC8YU18HQlHgWnqwreqIy6IgqTWkkim.UIwNqUeJwEOLCuzAO','2025-11-26 02:20:52','2025-11-26 02:20:52'),('57b017b3-7414-4014-b107-3a588834d289','HRM001','HR','Manager','hrmanager@emeraldsrx.com','555-0002',NULL,NULL,NULL,NULL,NULL,'2019-03-01',NULL,1,'ef7b5eb2-16ae-46e1-816b-cbe5b09a0047',NULL,'$2a$10$qHFKzUm/IOAIz9kBYITU5.E1NmDd4cu3/I8A3I298VRv/68DdLDI.','2025-11-26 02:20:52','2025-11-28 03:25:03'),('8abcab26-c588-4ca3-be20-a68ea71759e9','ADMIN001','Admin','User','admin@emeraldsrx.com','555-0001',NULL,NULL,NULL,NULL,NULL,'2020-01-01',NULL,1,'ef7b5eb2-16ae-46e1-816b-cbe5b09a0047',NULL,'$2a$10$Gcz5xlHzTXARuIsErmiuuext3Hb3bIIubGEL3HIvTx265uG2sUfju','2025-11-26 02:20:52','2025-11-28 03:25:15'),('cbc4f36f-2455-4c69-aa94-285a03f27802','EMP001','John','Doe','compounding.technician@emeraldrxhr.com','+1234567890','1997-01-11','','','','','2025-12-11',NULL,1,'0d981c8f-ca44-11f0-8943-3448ed0ea1e2','Employee','$2a$10$m433hn1m7O2gk9s3yY9xn.CmXgXI6NZOSus6wf0BkYtkZbwkWWpaS','2025-12-11 18:02:13','2025-12-11 18:21:48');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_documents`
--

DROP TABLE IF EXISTS `hr_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hr_documents` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `documentType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documentUrl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isRequired` tinyint(1) DEFAULT '0',
  `isActive` tinyint(1) DEFAULT '1',
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_documentType` (`documentType`),
  KEY `idx_category` (`category`),
  KEY `idx_isActive` (`isActive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_documents`
--

LOCK TABLES `hr_documents` WRITE;
/*!40000 ALTER TABLE `hr_documents` DISABLE KEYS */;
INSERT INTO `hr_documents` VALUES ('3541c35b-3451-45bf-b69c-528858a69c1a','W4 Form','Official W4 Form template for new employees','W4 Form','https://example.com/hr-docs/w4-form.pdf',1,1,'Onboarding','2025-11-28 00:09:40','2025-11-28 00:09:40'),('50c0c556-98d1-4a5c-90d9-604a020f72b0','I9 Form','Official I9 Form template for new employees','I9 Form','https://example.com/hr-docs/i9-form.pdf',1,1,'Onboarding','2025-11-28 00:09:40','2025-11-28 00:09:40'),('7831ad15-0740-4c0a-b659-edaf95f4b259','Direct Deposit Form','Official Direct Deposit Form template for new employees','Direct Deposit Form','https://example.com/hr-docs/direct-deposit-form.pdf',1,1,'Onboarding','2025-11-28 00:09:40','2025-11-28 00:09:40'),('9e12c42c-a50b-4429-828b-217b02762170','Employee Handbook','Official Employee Handbook template for new employees','Employee Handbook','https://example.com/hr-docs/employee-handbook.pdf',0,1,'Onboarding','2025-11-28 00:09:40','2025-11-28 00:09:40'),('b21d0e47-d9ea-4670-ae61-e20f1136a374','test','abc','Other','/uploads/file-1765480994330-709396906.pdf',0,1,'abc','2025-12-11 19:23:16','2025-12-11 19:23:16'),('ea5393bc-e798-4864-8265-1996f2ce4ed2','Emergency Contact Form','Official Emergency Contact Form template for new employees','Emergency Contact Form','https://example.com/hr-docs/emergency-contact-form.pdf',1,1,'Onboarding','2025-11-28 00:09:40','2025-11-28 00:09:40');
/*!40000 ALTER TABLE `hr_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidents` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reportedBy` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `severity` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'low',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `occurredAt` datetime NOT NULL,
  `reportedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `resolvedAt` datetime DEFAULT NULL,
  `resolutionNotes` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_status` (`status`),
  KEY `idx_type` (`type`),
  KEY `idx_severity` (`severity`),
  CONSTRAINT `incidents_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES ('176776ac-bb02-4403-a08e-16213908e85c','HIPAA','Incident 1: HIPAA Issue','Description of hipaa incident that occurred.',NULL,'f50c3257-7329-4cbb-b21c-beddc84a3455','low','open','2025-11-14 00:00:00','2025-11-15 00:00:00',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('4c8debf2-f432-46a1-91ab-7d68d224d458','Safety','Incident 8: Safety Issue','Description of safety incident that occurred.',NULL,'14da6ba5-e41c-4825-a468-e55144d233f6','medium','in_progress','2025-10-21 00:00:00','2025-10-22 00:00:00',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('62d8bc25-bdf4-4c96-8c80-e7cd2b27e213','Medication Error','Incident 6: Medication Error Issue','Description of medication error incident that occurred.',NULL,'5f94109d-7d2c-461a-991d-c233313ce128','high','closed','2025-09-19 00:00:00','2025-09-20 00:00:00','2025-09-25 00:00:00','Issue resolved with corrective action implemented.','2025-11-19 01:05:32','2025-11-19 01:05:32'),('b4b76805-b6f3-4a75-952c-63980e2fb797','Safety','Incident 2: Safety Issue','Description of safety incident that occurred.',NULL,'87efcad0-6e83-4541-bff2-4c54cda978e3','medium','in_progress','2025-10-15 00:00:00','2025-10-16 00:00:00',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('c727bf0d-29e7-43a4-8c7b-6be032573a45','Medication Error','Incident 3: Medication Error Issue','Description of medication error incident that occurred.',NULL,'d832e4dc-f590-4dc4-9dc0-235afc267ec2','high','closed','2025-09-16 00:00:00','2025-09-17 00:00:00','2025-09-22 00:00:00','Issue resolved with corrective action implemented.','2025-11-19 01:05:32','2025-11-19 01:05:32'),('d8da03ec-88dd-48e9-9a37-593bd86172c1','HIPAA','Incident 7: HIPAA Issue','Description of hipaa incident that occurred.',NULL,'71c6818d-8c95-468a-979c-62ff555ad2c7','low','open','2025-11-20 00:00:00','2025-11-21 00:00:00',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('f18aae78-d060-46ab-b788-54c991b47b6d','Safety','Incident 5: Safety Issue','Description of safety incident that occurred.',NULL,'f4015be8-9d2a-4441-a532-4c58b6b682be','medium','in_progress','2025-10-18 00:00:00','2025-10-19 00:00:00',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('fce17e0e-05eb-46d2-98b7-16303f1acd51','HIPAA','Incident 4: HIPAA Issue','Description of hipaa incident that occurred.',NULL,'3f808a8a-d28b-4170-b749-1c3e5538e952','low','open','2025-11-17 00:00:00','2025-11-18 00:00:00',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32');
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_requests` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `daysRequested` decimal(5,2) DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `approvedBy` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approvedAt` datetime DEFAULT NULL,
  `rejectionReason` text COLLATE utf8mb4_unicode_ci,
  `managerComments` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_status` (`status`),
  KEY `idx_startDate` (`startDate`),
  KEY `idx_type` (`type`),
  CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES ('0f1b9c88-40be-4f7c-909a-44a7b8a7dbfe','cbc4f36f-2455-4c69-aa94-285a03f27802','PTO','2025-12-22','2025-12-22',1.00,NULL,'approved','57b017b3-7414-4014-b107-3a588834d289','2025-12-22 14:03:23',NULL,NULL,'2025-12-22 14:03:01','2025-12-22 14:03:23'),('21c34fec-5951-411a-8c16-5d007330bab3','38715efa-de7e-47e5-bf9d-fb272bcbe14a','Personal','2026-02-08','2026-02-12',5.00,'Request for personal','approved',NULL,NULL,NULL,NULL,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('6779e400-242c-4c70-a87c-b340010c4482','57b017b3-7414-4014-b107-3a588834d289','Bereavement','2025-12-28','2025-12-31',4.00,'Request for bereavement','approved','f50c3257-7329-4cbb-b21c-beddc84a3455','2025-12-11 19:52:47',NULL,NULL,'2025-11-28 00:09:39','2025-12-11 19:52:47'),('bb4d4e68-ee90-42f7-b508-24055c4c1ac5','38715efa-de7e-47e5-bf9d-fb272bcbe14a','Sick Leave','2026-01-18','2026-01-23',6.00,'Request for sick leave','rejected',NULL,NULL,NULL,NULL,'2025-11-28 00:09:40','2025-11-28 00:09:40');
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `licenseNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issueDate` date NOT NULL,
  `expiryDate` date NOT NULL,
  `documentUrl` text COLLATE utf8mb4_unicode_ci,
  `isActive` tinyint(1) DEFAULT '1',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_expiryDate` (`expiryDate`),
  CONSTRAINT `licenses_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES ('03b29b45-84e5-4ad9-9a22-8eb05dbe3781','38715efa-de7e-47e5-bf9d-fb272bcbe14a','State License','CA-65123','CA','2020-06-22','2022-06-22',NULL,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('0c420668-94a1-4c74-864c-e7a80cc0004c','38715efa-de7e-47e5-bf9d-fb272bcbe14a','Pharmacy Technician','TX-3440','TX','2025-08-03','2027-08-03',NULL,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('13fd7ef9-1540-4c13-a968-7e3cd2accda1','38715efa-de7e-47e5-bf9d-fb272bcbe14a','CPR Certification','NY-70160','NY','2022-11-15','2024-11-15',NULL,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('3d4e4bc3-0387-4353-8f4a-9ff62b12d572','8abcab26-c588-4ca3-be20-a68ea71759e9','State License','CA-77391','CA','2023-07-21','2025-07-21',NULL,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('68fb7f83-6d18-41c1-a17b-1a46daaa04d1','8abcab26-c588-4ca3-be20-a68ea71759e9','Pharmacy Intern','CA-53472','CA','2021-06-25','2023-06-25',NULL,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('c71d50ec-8100-454a-8671-d2f7168f6cb5','57b017b3-7414-4014-b107-3a588834d289','CPR Certification','IL-16338','IL','2022-02-02','2024-02-02',NULL,1,'2025-11-28 00:09:39','2025-11-28 00:09:39');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `readAt` datetime DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_isRead` (`isRead`),
  KEY `idx_type` (`type`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('1d469f0c-be15-4dc5-b10b-aef2443106d5','cbc4f36f-2455-4c69-aa94-285a03f27802','training_assigned','New Training Assigned','You have been assigned a new training. Please complete it by the due date.',1,'2025-12-15 00:11:56','/training-compliance',NULL,'2025-12-11 18:22:59'),('26d833e2-8cc7-45e9-af90-671a593e2d03','57b017b3-7414-4014-b107-3a588834d289','leave_approved','Leave Request Approved','Your leave request from 12/28/2025 to 12/31/2025 has been approved.',1,'2025-12-15 14:22:02','/leave-management',NULL,'2025-12-11 19:52:47'),('2bd1d163-04dd-4704-8d81-3e32ec9621f0','38715efa-de7e-47e5-bf9d-fb272bcbe14a','training_assigned','New Training Assigned','You have been assigned a new training. Please complete it by the due date.',0,NULL,'/training-compliance',NULL,'2025-11-27 01:54:23'),('d43ea918-3f6f-4701-91d8-7f7fa2dad24d','cbc4f36f-2455-4c69-aa94-285a03f27802','leave_approved','Leave Request Approved','Your leave request from 12/22/2025 to 12/22/2025 has been approved.',0,NULL,'/leave-management',NULL,'2025-12-22 14:03:23');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onboarding_tasks`
--

DROP TABLE IF EXISTS `onboarding_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onboarding_tasks` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isRequired` tinyint(1) DEFAULT '1',
  `order` int DEFAULT '0',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onboarding_tasks`
--

LOCK TABLES `onboarding_tasks` WRITE;
/*!40000 ALTER TABLE `onboarding_tasks` DISABLE KEYS */;
INSERT INTO `onboarding_tasks` VALUES ('1bffc4e7-0f92-4a98-9a6b-3fb7c304c456','System Access Setup','Configure system access and credentials','Access',1,4,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('3676d95a-76ae-4ef7-bcf6-e1c2bfcef81a','Complete HIPAA Training','Complete mandatory HIPAA compliance training','Training',1,1,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('97a0e67a-8585-403b-9a03-75f4f9692bd4','License Verification','Submit and verify professional licenses','Documentation',1,3,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('d30e4517-e69d-4e22-9a8b-76212279e959','Acknowledge SOPs','Review and acknowledge all Standard Operating Procedures','Documentation',1,2,'2025-11-19 01:05:32','2025-11-19 01:05:32');
/*!40000 ALTER TABLE `onboarding_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_evaluations`
--

DROP TABLE IF EXISTS `performance_evaluations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_evaluations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evaluatorId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ratings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `goals` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `documentUrl` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_period` (`period`),
  CONSTRAINT `performance_evaluations_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_evaluations`
--

LOCK TABLES `performance_evaluations` WRITE;
/*!40000 ALTER TABLE `performance_evaluations` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_evaluations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_licenses`
--

DROP TABLE IF EXISTS `pharmacy_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_licenses` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `licenseName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `licenseNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issueDate` date NOT NULL,
  `expirationDate` date NOT NULL,
  `documentUrl` text COLLATE utf8mb4_unicode_ci,
  `isActive` tinyint(1) DEFAULT '1',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_expirationDate` (`expirationDate`),
  KEY `idx_isActive` (`isActive`),
  KEY `idx_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_licenses`
--

LOCK TABLES `pharmacy_licenses` WRITE;
/*!40000 ALTER TABLE `pharmacy_licenses` DISABLE KEYS */;
INSERT INTO `pharmacy_licenses` VALUES ('0d7fffe9-cce9-4ccf-97db-92467ed82fbd','Compounding License','PH-208982','FL','2022-02-20','2023-02-20','https://example.com/licenses/42ce1d9e-d5d9-4067-bf58-59de332b27ef.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('3bafa329-61cc-4795-8e86-2f8b9fab35f1','Compounding License','PH-470751','NY','2024-08-01','2025-08-01','https://example.com/licenses/d463d081-7744-4477-a515-8cdd042c0cf1.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('4c08045e-72ab-4262-90c7-825e7fc73259','State Pharmacy License','PH-703175','IL','2020-12-30','2021-12-30','https://example.com/licenses/ac52cfa8-cfb1-4339-a001-0e5d2cbc58e1.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('5b1cb429-6158-417b-b34b-e87eb8f31663','Controlled Substance License','PH-467200','NY','2020-05-07','2021-05-07','https://example.com/licenses/dbe5c171-58f3-4829-9b7a-81e7e8170a58.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('757145e1-95eb-4748-adc3-d28ac5df591a','Compounding License','PH-877822','IL','2021-11-29','2022-11-29','https://example.com/licenses/81603bb1-058e-47df-afb8-30fec45fba28.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('ab0af243-9459-4c7b-87af-b1c49f0bab79','Controlled Substance License','PH-88246','NY','2024-08-09','2025-08-09','https://example.com/licenses/492705f9-e68e-4d4d-9d23-fd7b6317f8a7.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('af3534ef-03a6-4eb3-8ca6-a5e4ffc4efc0','DEA Registration','PH-191116','CA','2025-11-12','2026-11-12','https://example.com/licenses/46760976-d1a3-462e-bda0-2eb6362fea2d.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('ef70015f-42b9-42e0-9b67-4e3b917cc7e3','Controlled Substance License','PH-492322','CA','2023-10-14','2024-10-14','https://example.com/licenses/75b19f0f-4685-4ccc-877c-3ffa722c6bdf.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('f66f8d29-4083-4812-96f8-5febcde2f629','Business License','PH-740895','CA','2025-09-06','2026-09-06','https://example.com/licenses/74826599-a9b0-4ad5-bb19-19853d2946d0.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('f879c864-b26a-4a11-b84f-d741fd337ecc','Controlled Substance License','PH-545983','TX','2022-11-22','2023-11-22','https://example.com/licenses/aac64300-47cf-4c84-80a6-4ee4b31b1107.pdf',1,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39');
/*!40000 ALTER TABLE `pharmacy_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policies` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documentUrl` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '1.0',
  `isActive` tinyint(1) DEFAULT '1',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policies`
--

LOCK TABLES `policies` WRITE;
/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
INSERT INTO `policies` VALUES ('38e35135-69ce-46a5-b528-25935f1ece3a','Safety Protocol','Workplace safety and emergency procedures','Safety',NULL,'3.0',1,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('6acbe686-02a5-45e6-ac39-f473a7dde1c0','Data Privacy Policy','Official data privacy policy for all employees','IT','https://example.com/policies/data-privacy-policy.pdf','1.0',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('6cf9b09b-96be-4cca-902b-8cd07782121a','Dress Code Policy','Official dress code policy for all employees','Compliance','https://example.com/policies/dress-code-policy.pdf','1.0',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('8046bab9-4bd2-4775-b87d-092d7f6e1e83','Workplace Safety Policy','Official workplace safety policy for all employees','IT','https://example.com/policies/workplace-safety-policy.pdf','1.0',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('8849d2e3-c292-4439-9694-f11de9f16693','Employee Handbook','Comprehensive employee handbook and guidelines','HR',NULL,'2024.1',1,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('92d89746-9460-4021-a6e2-c7460a7f5f7c','Drug-Free Workplace Policy','Official drug-free workplace policy for all employees','Safety','https://example.com/policies/drug-free-workplace-policy.pdf','1.0',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('9cd9ef92-c135-4cfb-8f2e-8a85ce2724e3','Employee Code of Conduct','Official employee code of conduct for all employees','HR','https://example.com/policies/employee-code-of-conduct.pdf','1.0',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('b9936f44-43dd-4e8a-8f79-e85ab99d9b8a','Compounding SOP','Standard operating procedures for pharmaceutical compounding','SOP',NULL,'1.5',1,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('cfad7f6e-14c3-497e-aced-8b3825ca52da','Remote Work Policy','Official remote work policy for all employees','HR','https://example.com/policies/remote-work-policy.pdf','1.0',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('d0e2eaf6-413d-46cc-b21e-24d3eb26705d','HIPAA Privacy Policy','Patient privacy and HIPAA compliance policy','HIPAA',NULL,'2.1',1,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('d8c1190c-f84e-4cf1-8829-25ebae11099e','Social Media Policy','Official social media policy for all employees','Safety','https://example.com/policies/social-media-policy.pdf','1.0',1,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('ff8bfd03-5305-4b2f-80e2-1ddffa2832c9','Harassment Prevention Policy','Official harassment prevention policy for all employees','Operations','https://example.com/policies/harassment-prevention-policy.pdf','1.0',1,'2025-11-28 00:09:40','2025-11-28 00:09:40');
/*!40000 ALTER TABLE `policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pto_balances`
--

DROP TABLE IF EXISTS `pto_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pto_balances` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `totalPtoBalance` decimal(6,2) DEFAULT '0.00',
  `rolloverHours` decimal(6,2) DEFAULT '0.00',
  `pendingHours` decimal(6,2) DEFAULT '0.00',
  `approvedHours` decimal(6,2) DEFAULT '0.00',
  `usedHours` decimal(6,2) DEFAULT '0.00',
  `remainingBalance` decimal(6,2) DEFAULT '0.00',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee_year` (`employeeId`,`year`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_year` (`year`),
  CONSTRAINT `pto_balances_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pto_balances`
--

LOCK TABLES `pto_balances` WRITE;
/*!40000 ALTER TABLE `pto_balances` DISABLE KEYS */;
INSERT INTO `pto_balances` VALUES ('667d8ee8-12eb-4917-8c94-2ab955abacce','57b017b3-7414-4014-b107-3a588834d289',2025,81.00,0.00,17.00,0.00,44.00,20.00,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('6c638e0f-21ee-4ee9-93f0-86cbca253f6b','cbc4f36f-2455-4c69-aa94-285a03f27802',2025,0.00,0.00,0.00,0.01,0.01,0.00,'2025-12-22 14:03:01','2025-12-22 14:03:23'),('84163da2-2d1a-4160-95c3-8eb22db6cbd9','8abcab26-c588-4ca3-be20-a68ea71759e9',2025,89.00,0.00,5.00,1.00,33.00,50.00,'2025-11-28 00:09:40','2025-11-28 00:09:40'),('c6d1f4d0-dfef-4f5f-99ed-d6c68f43b9b2','38715efa-de7e-47e5-bf9d-fb272bcbe14a',2025,106.00,0.00,6.00,9.00,52.00,39.00,'2025-11-28 00:09:40','2025-11-28 00:09:40');
/*!40000 ALTER TABLE `pto_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('18e959c9-22af-4b1a-8271-da495c3e8b93','Lead Technician','Supervisor/manager for technical departments. Oversees department operations, approves department PTO, manages schedules.','{\"employees\":[\"read\"],\"licenses\":[\"read\"],\"pharmacy_licenses\":[\"read\"],\"training\":[\"read\",\"assign\"],\"scheduling\":[\"create\",\"read\",\"update\"],\"leave\":[\"read\",\"approve\",\"reject\"],\"onboarding\":[\"read\",\"update\"],\"evaluations\":[\"read\",\"update\"],\"incidents\":[\"create\",\"read\",\"update\"],\"attendance\":[\"read\"],\"documents\":[\"read\",\"approve\"],\"policies\":[\"read\"]}','2025-11-26 02:20:52','2025-11-26 02:20:52'),('cca61a07-12eb-4d64-93a8-dbdf69c1eaaa','Employee','Basic employee access. Can view own information, submit requests, and complete training.','{\"employees\":[],\"licenses\":[],\"training\":[],\"scheduling\":[\"read\"],\"leave\":[\"create\",\"read\"],\"attendance\":[\"create\",\"read\"],\"documents\":[\"read\",\"create\"],\"policies\":[\"read\"],\"dashboard\":[],\"my_trainings\":[\"read\"]}','2025-11-27 23:08:57','2025-11-28 04:15:55'),('e206a38b-a514-4c21-8ccd-cc6c70daa891','Admin','Full system access. Can manage all employees, departments, roles, and permissions. Has complete CRUD access to all modules.','{\"employees\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"roles\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"departments\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"reject\",\"approve\"],\"licenses\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"pharmacy_licenses\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"training\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"scheduling\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"leave\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"attendance\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"documents\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"policies\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"settings\":[\"create\",\"read\",\"update\",\"delete\",\"assign\",\"reject\",\"approve\"],\"dashboard\":[\"read\",\"create\",\"update\",\"delete\",\"assign\",\"approve\",\"reject\"],\"my_trainings\":[]}','2025-11-26 02:20:52','2025-11-28 03:41:52'),('e69990bf-4026-45cc-8b0a-5211e571de10','HR','HR operations. Can manage employees, view reports, and assign permissions.','{\"employees\":[\"create\",\"read\",\"update\"],\"roles\":[\"read\"],\"departments\":[\"read\"],\"licenses\":[\"read\",\"update\"],\"pharmacy_licenses\":[\"read\"],\"training\":[\"create\",\"read\",\"update\",\"assign\"],\"scheduling\":[\"read\"],\"leave\":[\"read\",\"approve\",\"reject\"],\"attendance\":[\"read\"],\"documents\":[\"read\",\"approve\",\"reject\"],\"policies\":[\"read\",\"update\"],\"dashboard\":[\"read\"]}','2025-11-27 23:08:57','2025-11-28 00:09:28');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_assignments`
--

DROP TABLE IF EXISTS `shift_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_assignments` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shiftId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'scheduled',
  `clockIn` datetime DEFAULT NULL,
  `clockOut` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_shift_employee` (`shiftId`,`employeeId`),
  KEY `idx_employeeId` (`employeeId`),
  KEY `idx_shiftId` (`shiftId`),
  CONSTRAINT `shift_assignments_ibfk_1` FOREIGN KEY (`shiftId`) REFERENCES `shifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shift_assignments_ibfk_2` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_assignments`
--

LOCK TABLES `shift_assignments` WRITE;
/*!40000 ALTER TABLE `shift_assignments` DISABLE KEYS */;
INSERT INTO `shift_assignments` VALUES ('0561d4b7-565f-474f-ab6a-d4ce03c333d8','6023e62b-576e-4e55-8b43-dfdbf20bf73c','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled','2025-08-26 17:38:01','2025-08-27 01:38:01','2025-11-28 00:09:39','2025-11-28 00:09:39'),('1de5bb7f-b821-432f-853d-52551ea246b7','edf09fe3-e8bc-4e97-b9b6-c47f85fb7d47','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled','2025-05-30 11:44:10','2025-05-30 19:44:10','2025-11-28 00:09:39','2025-11-28 00:09:39'),('28c4b76a-b3eb-4c0f-8c3d-d7f60f1181cc','3aa5e815-b25b-4501-9198-c7dfb1174c60','57b017b3-7414-4014-b107-3a588834d289','scheduled',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('2b0f7bec-d344-4450-b1be-edf80dff5a2f','ec58f991-5f83-4766-9304-c5a515dfed7b','57b017b3-7414-4014-b107-3a588834d289','scheduled','2024-02-20 03:42:28','2024-02-20 11:42:28','2025-11-28 00:09:39','2025-11-28 00:09:39'),('2dd7cc7f-2f63-4209-a4be-6b14feabcce2','56e79d72-d54b-4712-a4aa-80a84aefb0c5','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('43e62c4c-67a7-44fd-9484-2907e031fe51','c838ca8f-9653-4f2e-86cf-372dc6032a97','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled','2025-08-19 06:56:19','2025-08-19 14:56:19','2025-11-28 00:09:39','2025-11-28 00:09:39'),('49ca07e7-da3a-4bab-b73e-bde179aa450e','c8978b14-3a87-4b0a-a352-c0b54e2bc583','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled','2025-08-13 19:59:51','2025-08-14 03:59:51','2025-11-28 00:09:39','2025-11-28 00:09:39'),('4ba2d992-acaf-41e7-8672-0f313e63303d','c2554053-2e53-45cb-bfc8-cadb61289fba','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled','2025-10-22 00:32:20','2025-10-22 08:32:20','2025-11-28 00:09:39','2025-11-28 00:09:39'),('594452fc-06fa-4ed5-aa9b-9ded57009942','1f9e93f3-7fe6-4812-8d5d-bb1674d58a97','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled','2024-10-02 00:12:14','2024-10-02 08:12:14','2025-11-28 00:09:39','2025-11-28 00:09:39'),('59eb4ef7-bf85-4970-9e3d-dd702cd0d418','ff80ccc5-cfd5-460f-b2fd-32ac10af06b2','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('64c8b9c7-b5e2-4967-9d9a-4f44eccd9697','edf09fe3-e8bc-4e97-b9b6-c47f85fb7d47','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled','2024-06-09 19:25:01','2024-06-10 03:25:01','2025-11-28 00:09:39','2025-11-28 00:09:39'),('66e50b2e-8ce6-4818-b873-753ed38ec82d','f38d976e-fa1d-400e-8c77-72272c191498','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled','2024-11-25 22:33:03','2024-11-26 06:33:03','2025-11-28 00:09:39','2025-11-28 00:09:39'),('77ce5bb8-653c-44ba-8c46-a408a13bb85e','7b70dd85-95a2-4d17-a114-672e2c340831','57b017b3-7414-4014-b107-3a588834d289','scheduled','2024-02-03 21:22:19','2024-02-04 05:22:19','2025-11-28 00:09:39','2025-11-28 00:09:39'),('79bac22c-7267-4254-955b-90fe4c476633','d6406a76-7da0-418f-b26a-99f33f00318e','57b017b3-7414-4014-b107-3a588834d289','scheduled','2025-03-27 05:15:56','2025-03-27 13:15:56','2025-11-28 00:09:39','2025-11-28 00:09:39'),('8b0d9686-5b83-4c21-b117-6bcca675b22c','6eed4b0e-84f9-49cf-a083-691127c09bec','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('8d38158a-1be4-45b7-8761-335733106dfd','41b7129b-6af4-4cdf-ac8f-060e18438264','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('91494ba1-81bb-4f99-a538-f43e4721a480','726a80ca-f533-4df4-9191-c3368cd7a25f','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled','2025-11-27 15:50:12','2025-11-27 23:50:12','2025-11-28 00:09:39','2025-11-28 00:09:39'),('96bc5b9a-4cbd-43ab-a597-9855fadbe270','87efc6e9-d667-46f6-a453-dbfb32a5ab90','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('97bf75b9-9bb6-4624-8228-2e66d14dbaf6','c7b862ea-bcc0-41a1-85a5-1fe66ba11cd0','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled','2025-11-25 22:34:28','2025-11-26 06:34:28','2025-11-28 00:09:39','2025-11-28 00:09:39'),('a513455b-bc1c-47a2-bfb3-25a66d9649e1','87efc6e9-d667-46f6-a453-dbfb32a5ab90','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled','2025-05-07 16:19:03','2025-05-08 00:19:03','2025-11-28 00:09:39','2025-11-28 00:09:39'),('a59bf081-0692-46f4-8fc9-49a01172d121','ec58f991-5f83-4766-9304-c5a515dfed7b','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled','2025-10-30 05:07:59','2025-10-30 13:07:59','2025-11-28 00:09:39','2025-11-28 00:09:39'),('bf2da27f-69dc-46bb-b39a-2e367bc946b5','8750bf3c-1563-4d9d-bc21-abe40841b5a2','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled','2025-10-18 09:32:43','2025-10-18 17:32:43','2025-11-28 00:09:39','2025-11-28 00:09:39'),('cb7023ec-607c-442d-b390-c27650d81d3b','f068892c-4e10-4f10-abca-4ed3b5cd0779','cbc4f36f-2455-4c69-aa94-285a03f27802','scheduled',NULL,NULL,'2025-12-11 19:18:47','2025-12-11 19:18:47'),('e072d247-333f-4d11-8a61-ae59520058f7','3aa5e815-b25b-4501-9198-c7dfb1174c60','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled','2025-08-08 01:55:13','2025-08-08 09:55:13','2025-11-28 00:09:39','2025-11-28 00:09:39'),('e9e31050-3824-4f9b-af80-d79409a5ae63','6eed4b0e-84f9-49cf-a083-691127c09bec','57b017b3-7414-4014-b107-3a588834d289','scheduled','2024-06-26 03:07:47','2024-06-26 11:07:47','2025-11-28 00:09:39','2025-11-28 00:09:39'),('f1da96e4-270e-477d-b7f3-f57ad05c3443','2bcae2ec-9374-42b7-988c-01ebe2f977ef','57b017b3-7414-4014-b107-3a588834d289','scheduled','2025-09-14 06:51:31','2025-09-14 14:51:31','2025-11-28 00:09:39','2025-11-28 00:09:39'),('f4def69b-ccff-4204-bf22-81ce8e968cb4','965593ad-eb4e-43c3-a961-bceebc22c1e3','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled','2024-09-14 06:10:53','2024-09-14 14:10:53','2025-11-28 00:09:39','2025-11-28 00:09:39'),('facd961a-145f-44d9-8b6a-b998024b5487','33ef8efe-f29a-4683-8d11-7081d9679c4c','38715efa-de7e-47e5-bf9d-fb272bcbe14a','scheduled','2025-07-13 17:22:56','2025-07-14 01:22:56','2025-11-28 00:09:39','2025-11-28 00:09:39'),('ff15e4d7-e758-4d03-ae66-372d53030f72','f38d976e-fa1d-400e-8c77-72272c191498','8abcab26-c588-4ca3-be20-a68ea71759e9','scheduled','2025-02-04 15:16:35','2025-02-04 23:16:35','2025-11-28 00:09:39','2025-11-28 00:09:39');
/*!40000 ALTER TABLE `shift_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `departmentId` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_date` (`date`),
  KEY `idx_role` (`role`),
  KEY `idx_departmentId` (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES ('0467e6e9-4df4-47e5-9b08-b138c7a62bb1','2025-12-09','2025-12-09 03:00:00','2025-12-09 11:00:00','0d987e62-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('0e24b3dd-615e-4b8f-85a3-188acdcebfc3','2025-11-16','2025-11-17 08:00:00','2025-11-17 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('16ba06d2-5b70-4d72-a6d3-ec30a92ba2bf','2025-11-29','2025-11-29 03:00:00','2025-11-29 11:00:00','0d987e62-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('1f9e93f3-7fe6-4812-8d5d-bb1674d58a97','2025-12-05','2025-12-05 03:00:00','2025-12-05 11:00:00','0d987e62-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('2a5b59b0-b7e9-4f57-9007-428170a5ec68','2025-12-03','2025-12-03 03:00:00','2025-12-03 11:00:00','a1363655-8191-4aac-83d7-4afa3f033529',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('2bcae2ec-9374-42b7-988c-01ebe2f977ef','2025-11-28','2025-11-28 03:00:00','2025-11-28 11:00:00','0d981c8f-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('2d744327-863d-4a79-b173-00e4dc42f7ea','2025-12-12','2025-12-13 08:00:00','2025-12-13 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('2f4f5271-1add-452e-bc15-4b20553ea96b','2025-12-01','2025-12-02 08:00:00','2025-12-02 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('33ef8efe-f29a-4683-8d11-7081d9679c4c','2025-12-10','2025-12-10 03:00:00','2025-12-10 11:00:00','0d981c8f-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('39f597d9-1576-466e-9fd5-bd80f3fbea7e','2025-12-08','2025-12-08 03:00:00','2025-12-08 11:00:00','0d987e62-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('3aa5e815-b25b-4501-9198-c7dfb1174c60','2025-12-16','2025-12-16 01:00:00','2025-12-16 09:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('3dfcf1d9-f347-4f8d-9f16-3587e558ff8b','2025-11-20','2025-11-21 08:00:00','2025-11-21 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('41ab61b5-0b8c-45ca-86de-a15ad4b22e4a','2025-12-09','2025-12-10 08:00:00','2025-12-10 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('41b7129b-6af4-4cdf-ac8f-060e18438264','2025-12-25','2025-12-25 09:00:00','2025-12-25 17:00:00','0d981c8f-ca44-11f0-8943-3448ed0ea1e2',NULL,'Weekend shift - reduced staffing','2025-11-28 00:09:39','2025-11-28 00:09:39'),('45491744-f0c0-435f-9e6c-4af4666ae398','2025-11-28','2025-11-28 08:00:00','2025-11-28 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-28 00:16:13'),('4e1b0bef-d251-4c86-8a0d-d621fd4e35ac','2025-12-06','2025-12-07 08:00:00','2025-12-07 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('56e79d72-d54b-4712-a4aa-80a84aefb0c5','2025-12-01','2025-12-01 11:00:00','2025-12-01 19:00:00','ef7b5eb2-16ae-46e1-816b-cbe5b09a0047',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('598321de-2c77-4a62-9a56-f3f70600eb48','2025-12-08','2025-12-09 08:00:00','2025-12-09 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('6023e62b-576e-4e55-8b43-dfdbf20bf73c','2025-12-14','2025-12-14 11:00:00','2025-12-14 19:00:00','0d981c8f-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('63ffea0e-4be8-44d9-8d13-88f90ac2d81d','2025-11-19','2025-11-19 09:00:00','2025-11-19 17:00:00','pharmacy',NULL,NULL,'2025-11-19 01:17:39','2025-11-19 01:17:39'),('6eed4b0e-84f9-49cf-a083-691127c09bec','2025-12-24','2025-12-24 11:00:00','2025-12-24 19:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('718d6aec-7876-4e36-ba98-a386712e2c32','2025-12-07','2025-12-08 08:00:00','2025-12-08 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('726a80ca-f533-4df4-9191-c3368cd7a25f','2025-12-18','2025-12-18 11:00:00','2025-12-18 19:00:00','ef7b5eb2-16ae-46e1-816b-cbe5b09a0047',NULL,'Weekend shift - reduced staffing','2025-11-28 00:09:39','2025-11-28 00:09:39'),('788d19f6-b601-4b10-a820-d3384b62c16e','2025-11-23','2025-11-24 08:00:00','2025-11-24 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('7b40a86d-c434-4131-9f04-23df5349ea3c','2025-11-17','2025-11-18 08:00:00','2025-11-18 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('7b70dd85-95a2-4d17-a114-672e2c340831','2025-12-21','2025-12-21 01:00:00','2025-12-21 09:00:00','ef7b5eb2-16ae-46e1-816b-cbe5b09a0047',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('8750bf3c-1563-4d9d-bc21-abe40841b5a2','2025-12-07','2025-12-07 01:00:00','2025-12-07 09:00:00','0d987e62-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('87efc6e9-d667-46f6-a453-dbfb32a5ab90','2025-11-30','2025-11-30 03:00:00','2025-11-30 11:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('8daf4005-4c6d-4131-910a-046cb4476e55','2025-11-22','2025-11-23 08:00:00','2025-11-23 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('8ec9f12e-d20c-4650-894a-2622cb7ab486','2025-12-17','2025-12-17 11:00:00','2025-12-17 19:00:00','ef7b5eb2-16ae-46e1-816b-cbe5b09a0047',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('965593ad-eb4e-43c3-a961-bceebc22c1e3','2025-12-06','2025-12-06 01:00:00','2025-12-06 09:00:00','a1363655-8191-4aac-83d7-4afa3f033529',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('a2afd5bb-0583-4259-94d5-811249127187','2025-11-19','2025-11-20 08:00:00','2025-11-20 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('a7236b2a-91c7-4122-937f-7a70fcbcb66c','2025-12-02','2025-12-03 08:00:00','2025-12-03 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('a881c582-ff3c-43c1-98c3-6c90157c5360','2025-12-05','2025-12-06 08:00:00','2025-12-06 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('ae37bb0a-db03-4ccc-b37d-89a233cdfabe','2025-11-25','2025-11-26 08:00:00','2025-11-26 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('aeadb611-b031-49b4-b123-0fdd74e349b4','2025-11-27','2025-11-28 08:00:00','2025-11-28 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('b2d046c0-c6b7-41f2-95a9-347a07f32acf','2025-12-15','2025-12-15 01:00:00','2025-12-15 09:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('c1748871-7302-468a-a15b-f91f6dfb3a59','2025-11-29','2025-11-30 08:00:00','2025-11-30 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('c2554053-2e53-45cb-bfc8-cadb61289fba','2025-12-04','2025-12-04 09:00:00','2025-12-04 17:00:00','0d987e62-ca44-11f0-8943-3448ed0ea1e2',NULL,'Weekend shift - reduced staffing','2025-11-28 00:09:39','2025-11-28 00:09:39'),('c4e4038e-e93a-48f0-ad81-4afa7524fe49','2025-12-11','2025-12-12 08:00:00','2025-12-12 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('c7b0ed9e-109d-4c51-9ea1-bfb133f7c92f','2025-11-24','2025-11-25 08:00:00','2025-11-25 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('c7b862ea-bcc0-41a1-85a5-1fe66ba11cd0','2025-12-20','2025-12-20 09:00:00','2025-12-20 17:00:00','0d981c8f-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('c838ca8f-9653-4f2e-86cf-372dc6032a97','2025-12-13','2025-12-13 01:00:00','2025-12-13 09:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('c8978b14-3a87-4b0a-a352-c0b54e2bc583','2025-11-27','2025-11-27 09:00:00','2025-11-27 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,'Weekend shift - reduced staffing','2025-11-28 00:09:39','2025-11-28 00:09:39'),('ccb95402-2031-4d27-a17d-435fc425e6b8','2025-12-10','2025-12-11 08:00:00','2025-12-11 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('ce9c18a5-921a-4c81-8ba9-2be577aff42e','2025-11-26','2025-11-27 08:00:00','2025-11-27 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('d0e47cd1-4a5d-46bf-a37a-5e2725597ffc','2025-12-04','2025-12-05 08:00:00','2025-12-05 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('d6406a76-7da0-418f-b26a-99f33f00318e','2025-12-23','2025-12-23 03:00:00','2025-12-23 11:00:00','0d987e62-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('dbfccea4-4d86-46df-b172-dd38cdec95a3','2025-11-21','2025-11-22 08:00:00','2025-11-22 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('dcf8dbd6-3225-4cde-bd06-5015f8e24bae','2025-12-19','2025-12-19 11:00:00','2025-12-19 19:00:00','0d987e62-ca44-11f0-8943-3448ed0ea1e2',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('e6091f97-7124-4f70-ba89-ad8ca4391958','2025-12-11','2025-12-11 09:00:00','2025-12-11 17:00:00','ef7b5eb2-16ae-46e1-816b-cbe5b09a0047',NULL,'Weekend shift - reduced staffing','2025-11-28 00:09:39','2025-11-28 00:09:39'),('e780ed1b-498a-4dc8-bf8c-059aaa1d051e','2025-11-18','2025-11-19 08:00:00','2025-11-19 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('ec58f991-5f83-4766-9304-c5a515dfed7b','2025-12-12','2025-12-12 01:00:00','2025-12-12 09:00:00','a1363655-8191-4aac-83d7-4afa3f033529',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('edf09fe3-e8bc-4e97-b9b6-c47f85fb7d47','2025-12-02','2025-12-02 03:00:00','2025-12-02 11:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('f068892c-4e10-4f10-abca-4ed3b5cd0779','2025-12-12','2025-12-12 00:00:00','2025-12-12 06:00:00','0d981c8f-ca44-11f0-8943-3448ed0ea1e2',NULL,'sample text','2025-12-11 19:18:47','2025-12-11 19:18:47'),('f38d976e-fa1d-400e-8c77-72272c191498','2025-12-22','2025-12-22 03:00:00','2025-12-22 11:00:00','ef7b5eb2-16ae-46e1-816b-cbe5b09a0047',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('f7419006-f972-4b0b-b4fe-edfa6a08273c','2025-12-03','2025-12-04 08:00:00','2025-12-04 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('f7b770b4-4e7b-4cc0-8786-c0af7eae0c73','2025-11-30','2025-12-01 08:00:00','2025-12-01 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('facbfe59-6bf2-4783-84ed-949ed2ffc26e','2025-11-15','2025-11-16 08:00:00','2025-11-16 17:00:00','217552b1-00f0-4a91-8f12-4e6329915199',NULL,NULL,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('ff80ccc5-cfd5-460f-b2fd-32ac10af06b2','2025-12-26','2025-12-26 03:00:00','2025-12-26 11:00:00','ef7b5eb2-16ae-46e1-816b-cbe5b09a0047',NULL,NULL,'2025-11-28 00:09:39','2025-11-28 00:09:39');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_settings` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settingValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settingKey` (`settingKey`),
  KEY `idx_settingKey` (`settingKey`),
  CONSTRAINT `system_settings_chk_1` CHECK (json_valid(`settingValue`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES ('7ea903e4-a37f-4dcb-8ec5-1a92878e1a83','sidebar_logo','\"http://localhost:5000/uploads/file-1763509969246-600908526.png\"','Sidebar logo URL','2025-11-19 04:52:49','2025-11-19 04:52:49'),('a184859d-26fc-4abb-9207-5af7a82849b3','sidebar_theme','{\"backgroundColor\":\"#ffffff\",\"textColor\":\"#6b7280\",\"activeColor\":\"#27bcbb\",\"activeTextColor\":\"#ffffff\"}','Sidebar color theme settings','2025-11-19 04:52:16','2025-11-20 01:28:05');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainings`
--

DROP TABLE IF EXISTS `trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainings` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `isRequired` tinyint(1) DEFAULT '0',
  `supportsVideo` tinyint(1) DEFAULT '0',
  `supportsPDF` tinyint(1) DEFAULT '0',
  `supportsQuiz` tinyint(1) DEFAULT '0',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainings`
--

LOCK TABLES `trainings` WRITE;
/*!40000 ALTER TABLE `trainings` DISABLE KEYS */;
INSERT INTO `trainings` VALUES ('0a05264a-3207-40db-a69a-1451e78c4455','Pharmacy Law and Ethics','Comprehensive training on pharmacy law and ethics','Compliance',90,1,1,1,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('2b08eab3-fe9c-44f7-b608-84914c8dbfd4','Compounding Best Practices','Comprehensive training on compounding best practices','Technical',90,0,1,1,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('30cda8d6-730f-448b-bba6-5090317f7be3','OSHA Workplace Safety','Comprehensive training on osha workplace safety','Safety',180,1,1,1,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('570dc884-9f3e-4594-a4fb-4a55f8fef134','Compounding Safety','Safety protocols for pharmaceutical compounding','Safety',45,1,0,0,0,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('77114c70-7bfb-47f9-a487-36b58641228d','Inventory Management','Comprehensive training on inventory management','Operations',60,0,1,1,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('9c1e6ce1-4a72-4771-a6da-aaef545cc136','Pharmaceutical Calculations','Advanced pharmaceutical calculations and measurements','Technical',90,0,0,0,0,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('b1d42333-bb0f-4ccc-b646-2105d2b50510','HIPAA Compliance Training','Comprehensive training on hipaa compliance training','Compliance',60,1,1,1,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('ba31fd19-2665-419b-a095-676613510a2a','Waste Management','Proper handling and disposal of pharmaceutical waste','Safety',30,1,0,0,0,'2025-11-19 01:05:32','2025-11-19 01:05:32'),('c01cf454-0673-46ca-8906-98d466e98dba','Pharmacy Safety Protocols','Comprehensive training on pharmacy safety protocols','Safety',120,1,1,1,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('c401d8f6-2327-46be-80e4-3241c7082e20','Medication Error Prevention','Comprehensive training on medication error prevention','Safety',75,1,1,1,1,'2025-11-28 00:09:39','2025-11-28 00:09:39'),('e1afe686-1867-4f54-a346-803bc2466351','Customer Service Excellence','Comprehensive training on customer service excellence','Soft Skills',45,0,1,1,1,'2025-11-28 00:09:39','2025-11-28 00:09:39');
/*!40000 ALTER TABLE `trainings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-26 16:27:14
