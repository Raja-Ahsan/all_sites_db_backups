-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2025 at 12:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cake_it`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`files`)),
  `item_id` varchar(255) NOT NULL,
  `license_code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `analytics`
--

CREATE TABLE `analytics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `analytic_sections`
--

CREATE TABLE `analytic_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `analytic_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  `section` tinyint(4) NOT NULL DEFAULT 5,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `email`, `phone`, `latitude`, `longitude`, `city`, `state`, `zip_code`, `address`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Main Branch', 'info@cakeit.us', '+15037465614', '45.4962717', '-122.8424043', 'Beaverton', 'Oregon', '97005', 'Shop :3205 SW Cedar Hills Blvd, Beaverton, OR 97005', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:10', '2025-07-03 00:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `capture_payment_notifications`
--

CREATE TABLE `capture_payment_notifications` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_cryptocurrency` tinyint(3) UNSIGNED NOT NULL,
  `exchange_rate` decimal(19,2) DEFAULT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `is_cryptocurrency`, `exchange_rate`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Dollars', '$', 'USD', 10, 1.00, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_access`
--

CREATE TABLE `default_access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `default_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `default_access`
--

INSERT INTO `default_access` (`id`, `name`, `user_id`, `default_id`, `created_at`, `updated_at`) VALUES
(1, 'branch_id', 1, 1, '2025-07-02 23:51:50', '2025-07-02 23:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `dining_tables`
--

CREATE TABLE `dining_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateway_options`
--

CREATE TABLE `gateway_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `option` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `activities` longtext DEFAULT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_options`
--

INSERT INTO `gateway_options` (`id`, `model_id`, `model_type`, `option`, `value`, `type`, `activities`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'App\\Models\\PaymentGateway', 'paypal_app_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(2, 3, 'App\\Models\\PaymentGateway', 'paypal_client_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(3, 3, 'App\\Models\\PaymentGateway', 'paypal_client_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(4, 3, 'App\\Models\\PaymentGateway', 'paypal_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(5, 3, 'App\\Models\\PaymentGateway', 'paypal_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(6, 4, 'App\\Models\\PaymentGateway', 'stripe_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(7, 4, 'App\\Models\\PaymentGateway', 'stripe_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(8, 4, 'App\\Models\\PaymentGateway', 'stripe_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(9, 4, 'App\\Models\\PaymentGateway', 'stripe_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(10, 5, 'App\\Models\\PaymentGateway', 'flutterwave_public_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(11, 5, 'App\\Models\\PaymentGateway', 'flutterwave_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(12, 5, 'App\\Models\\PaymentGateway', 'flutterwave_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(13, 5, 'App\\Models\\PaymentGateway', 'flutterwave_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(14, 6, 'App\\Models\\PaymentGateway', 'paystack_public_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(15, 6, 'App\\Models\\PaymentGateway', 'paystack_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(16, 6, 'App\\Models\\PaymentGateway', 'paystack_payment_url', 'https://api.paystack.co', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(17, 6, 'App\\Models\\PaymentGateway', 'paystack_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(18, 6, 'App\\Models\\PaymentGateway', 'paystack_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(19, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_name', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(20, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(21, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(22, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(23, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(24, 8, 'App\\Models\\PaymentGateway', 'mollie_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(25, 8, 'App\\Models\\PaymentGateway', 'mollie_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(26, 8, 'App\\Models\\PaymentGateway', 'mollie_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(27, 9, 'App\\Models\\PaymentGateway', 'senangpay_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(28, 9, 'App\\Models\\PaymentGateway', 'senangpay_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(29, 9, 'App\\Models\\PaymentGateway', 'senangpay_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(30, 9, 'App\\Models\\PaymentGateway', 'senangpay_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(31, 10, 'App\\Models\\PaymentGateway', 'bkash_app_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(32, 10, 'App\\Models\\PaymentGateway', 'bkash_app_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(33, 10, 'App\\Models\\PaymentGateway', 'bkash_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(34, 10, 'App\\Models\\PaymentGateway', 'bkash_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(35, 10, 'App\\Models\\PaymentGateway', 'bkash_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(36, 10, 'App\\Models\\PaymentGateway', 'bkash_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(37, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(38, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(39, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_website', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(40, 11, 'App\\Models\\PaymentGateway', 'paytm_channel', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(41, 11, 'App\\Models\\PaymentGateway', 'paytm_industry_type', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(42, 11, 'App\\Models\\PaymentGateway', 'paytm_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(43, 11, 'App\\Models\\PaymentGateway', 'paytm_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(44, 12, 'App\\Models\\PaymentGateway', 'razorpay_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(45, 12, 'App\\Models\\PaymentGateway', 'razorpay_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(46, 12, 'App\\Models\\PaymentGateway', 'razorpay_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(47, 12, 'App\\Models\\PaymentGateway', 'razorpay_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(48, 13, 'App\\Models\\PaymentGateway', 'mercadopago_client_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(49, 13, 'App\\Models\\PaymentGateway', 'mercadopago_client_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(50, 13, 'App\\Models\\PaymentGateway', 'mercadopago_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(51, 13, 'App\\Models\\PaymentGateway', 'mercadopago_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(52, 14, 'App\\Models\\PaymentGateway', 'cashfree_app_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(53, 14, 'App\\Models\\PaymentGateway', 'cashfree_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(54, 14, 'App\\Models\\PaymentGateway', 'cashfree_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(55, 14, 'App\\Models\\PaymentGateway', 'cashfree_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(56, 15, 'App\\Models\\PaymentGateway', 'payfast_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(57, 15, 'App\\Models\\PaymentGateway', 'payfast_merchant_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(58, 15, 'App\\Models\\PaymentGateway', 'payfast_passphrase', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(59, 15, 'App\\Models\\PaymentGateway', 'payfast_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(60, 15, 'App\\Models\\PaymentGateway', 'payfast_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(61, 16, 'App\\Models\\PaymentGateway', 'skrill_merchant_email', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(62, 16, 'App\\Models\\PaymentGateway', 'skrill_merchant_api_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(63, 16, 'App\\Models\\PaymentGateway', 'skrill_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(64, 16, 'App\\Models\\PaymentGateway', 'skrill_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(65, 17, 'App\\Models\\PaymentGateway', 'phonepe_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(66, 17, 'App\\Models\\PaymentGateway', 'phonepe_merchant_user_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(67, 17, 'App\\Models\\PaymentGateway', 'phonepe_key_index', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(68, 17, 'App\\Models\\PaymentGateway', 'phonepe_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(69, 17, 'App\\Models\\PaymentGateway', 'phonepe_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(70, 17, 'App\\Models\\PaymentGateway', 'phonepe_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(71, 18, 'App\\Models\\PaymentGateway', 'telr_store_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(72, 18, 'App\\Models\\PaymentGateway', 'telr_store_auth_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(73, 18, 'App\\Models\\PaymentGateway', 'telr_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(74, 18, 'App\\Models\\PaymentGateway', 'telr_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(75, 19, 'App\\Models\\PaymentGateway', 'iyzico_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(76, 19, 'App\\Models\\PaymentGateway', 'iyzico_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(77, 19, 'App\\Models\\PaymentGateway', 'iyzico_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(78, 19, 'App\\Models\\PaymentGateway', 'iyzico_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(79, 20, 'App\\Models\\PaymentGateway', 'pesapal_consumer_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(80, 20, 'App\\Models\\PaymentGateway', 'pesapal_consumer_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(81, 20, 'App\\Models\\PaymentGateway', 'pesapal_ipn_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(82, 20, 'App\\Models\\PaymentGateway', 'pesapal_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(83, 20, 'App\\Models\\PaymentGateway', 'pesapal_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(84, 21, 'App\\Models\\PaymentGateway', 'midtrans_server_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(85, 21, 'App\\Models\\PaymentGateway', 'midtrans_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(86, 21, 'App\\Models\\PaymentGateway', 'midtrans_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(87, 1, 'App\\Models\\SmsGateway', 'twilio_account_sid', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(88, 1, 'App\\Models\\SmsGateway', 'twilio_auth_token', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(89, 1, 'App\\Models\\SmsGateway', 'twilio_from', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(90, 1, 'App\\Models\\SmsGateway', 'twilio_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(91, 2, 'App\\Models\\SmsGateway', 'clickatell_apikey', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(92, 2, 'App\\Models\\SmsGateway', 'clickatell_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(93, 3, 'App\\Models\\SmsGateway', 'nexmo_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(94, 3, 'App\\Models\\SmsGateway', 'nexmo_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(95, 3, 'App\\Models\\SmsGateway', 'nexmo_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(96, 4, 'App\\Models\\SmsGateway', 'msg91_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(97, 4, 'App\\Models\\SmsGateway', 'msg91_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(98, 4, 'App\\Models\\SmsGateway', 'msg91_template_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(99, 4, 'App\\Models\\SmsGateway', 'msg91_template_variable', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(100, 4, 'App\\Models\\SmsGateway', 'msg91_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(101, 5, 'App\\Models\\SmsGateway', 'twofactor_module', 'PROMO_SMS', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(102, 5, 'App\\Models\\SmsGateway', 'twofactor_from', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(103, 5, 'App\\Models\\SmsGateway', 'twofactor_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(104, 5, 'App\\Models\\SmsGateway', 'twofactor_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(105, 6, 'App\\Models\\SmsGateway', 'bulksms_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(106, 6, 'App\\Models\\SmsGateway', 'bulksms_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(107, 6, 'App\\Models\\SmsGateway', 'bulksms_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(108, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(109, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(110, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(111, 8, 'App\\Models\\SmsGateway', 'telesign_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(112, 8, 'App\\Models\\SmsGateway', 'telesign_customer_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:09', '2025-07-02 23:48:09'),
(113, 8, 'App\\Models\\SmsGateway', 'telesign_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2025-07-02 23:48:09', '2025-07-02 23:48:09'),
(114, 8, 'App\\Models\\SmsGateway', 'telesign_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2025-07-02 23:48:09', '2025-07-02 23:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_category_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `caution` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `item_type` tinyint(4) NOT NULL DEFAULT 5,
  `order` bigint(20) NOT NULL DEFAULT 1,
  `is_featured` tinyint(4) NOT NULL DEFAULT 5,
  `is_variable` tinyint(4) NOT NULL DEFAULT 0,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_category_id`, `tax_id`, `name`, `slug`, `caution`, `description`, `price`, `status`, `item_type`, `order`, `is_featured`, `is_variable`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Test', 'test', 'dasd', 'asd', 10.000000, 5, 5, 1, 5, 10, NULL, NULL, NULL, NULL, NULL, '2025-07-02 13:05:22', '2025-07-02 13:05:22'),
(2, 1, NULL, 'Testss', 'testss', 'asd', NULL, 0.000000, 5, 5, 1, 5, 5, NULL, NULL, NULL, NULL, NULL, '2025-07-02 13:10:47', '2025-07-02 13:10:47');

-- --------------------------------------------------------

--
-- Table structure for table `item_addons`
--

CREATE TABLE `item_addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `addon_item_id` bigint(20) UNSIGNED NOT NULL,
  `addon_item_variation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`addon_item_variation`)),
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_attributes`
--

CREATE TABLE `item_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_attributes`
--

INSERT INTO `item_attributes` (`id`, `name`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Cake Size', 5, NULL, NULL, NULL, NULL, '2025-07-02 12:34:33', '2025-07-02 12:34:59'),
(2, 'Cake Flavour', 5, NULL, NULL, NULL, NULL, '2025-07-02 12:34:50', '2025-07-02 12:34:50'),
(3, 'Cake Filling', 5, NULL, NULL, NULL, NULL, '2025-07-02 12:35:14', '2025-07-02 12:35:14'),
(4, 'Cupcake Flavor', 5, NULL, NULL, NULL, NULL, '2025-07-02 12:36:29', '2025-07-02 12:36:29'),
(5, 'Number of cupcakes', 5, NULL, NULL, NULL, NULL, '2025-07-02 12:36:57', '2025-07-02 12:36:57'),
(6, 'Color', 5, NULL, NULL, NULL, NULL, '2025-07-02 12:37:10', '2025-07-02 12:37:10');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `sort` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `name`, `slug`, `description`, `status`, `sort`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Cakes', 'cakes', NULL, 5, 1, NULL, NULL, NULL, NULL, '2025-07-02 12:33:40', '2025-07-04 06:03:14'),
(2, 'Cupcakes', 'cupcakes', NULL, 5, 2, NULL, NULL, NULL, NULL, '2025-07-02 12:34:03', '2025-07-04 06:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `item_extras`
--

CREATE TABLE `item_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(19,6) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_variations`
--

CREATE TABLE `item_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `item_attribute_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `caution` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_variations`
--

INSERT INTO `item_variations` (`id`, `item_id`, `item_attribute_id`, `name`, `price`, `caution`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 5, 'asdas', 0.000000, 'asd', 5, NULL, NULL, NULL, NULL, NULL, '2025-07-02 13:11:09', '2025-07-02 13:11:09');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `display_mode` tinyint(3) UNSIGNED NOT NULL DEFAULT 5,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `display_mode`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 5, 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:09', '2025-07-02 23:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\PaymentGateway', 1, '9f5f3f63-c4db-4043-88ab-61ae4c283fdc', 'payment-gateway', 'cash-on-delivery', 'cash-on-delivery.png', 'image/png', 'public', 'public', 3437, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:47:56', '2025-07-02 23:47:56'),
(2, 'App\\Models\\PaymentGateway', 2, '342c92f2-bf7d-4bbe-a87a-bbabeeb29c53', 'payment-gateway', 'credit', 'credit.png', 'image/png', 'public', 'public', 3885, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(3, 'App\\Models\\PaymentGateway', 3, 'c1f194ea-a7ca-484e-9f73-98b90c8ea2e2', 'payment-gateway', 'paypal', 'paypal.png', 'image/png', 'public', 'public', 3809, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(4, 'App\\Models\\PaymentGateway', 4, '0c11b41e-1a1d-4941-bdc6-7e4b36903a12', 'payment-gateway', 'stripe', 'stripe.png', 'image/png', 'public', 'public', 3635, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(5, 'App\\Models\\PaymentGateway', 5, 'aa39fdb6-e1c2-4456-98e6-e01761c43fe8', 'payment-gateway', 'flutterwave', 'flutterwave.png', 'image/png', 'public', 'public', 5191, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(6, 'App\\Models\\PaymentGateway', 6, '569e8528-377e-4036-b124-a3248449c113', 'payment-gateway', 'paystack', 'paystack.png', 'image/png', 'public', 'public', 4195, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(7, 'App\\Models\\PaymentGateway', 7, 'ce99627c-07b7-44ff-a08a-b3914e00be6a', 'payment-gateway', 'sslcommerz', 'sslcommerz.png', 'image/png', 'public', 'public', 4546, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(8, 'App\\Models\\PaymentGateway', 8, '375e25ff-50d7-4bc9-8293-dc9aa6d99229', 'payment-gateway', 'mollie', 'mollie.png', 'image/png', 'public', 'public', 8116, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(9, 'App\\Models\\PaymentGateway', 9, '2873253d-c4e3-4bbd-8c30-be6240a40b65', 'payment-gateway', 'senangpay', 'senangpay.png', 'image/png', 'public', 'public', 6541, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(10, 'App\\Models\\PaymentGateway', 10, '704748d4-bb3e-496f-865f-3b95df13e02e', 'payment-gateway', 'bkash', 'bkash.png', 'image/png', 'public', 'public', 5282, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(11, 'App\\Models\\PaymentGateway', 11, '71662818-5a8c-482d-a668-f661ade0582a', 'payment-gateway', 'paytm', 'paytm.png', 'image/png', 'public', 'public', 3285, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(12, 'App\\Models\\PaymentGateway', 12, 'f8e45eff-ad7c-4012-8d3a-20b4dda3dd0c', 'payment-gateway', 'razorpay', 'razorpay.png', 'image/png', 'public', 'public', 4847, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(13, 'App\\Models\\PaymentGateway', 13, 'e58457fb-ac4d-41d0-8891-b6da7064a071', 'payment-gateway', 'mercadopago', 'mercadopago.png', 'image/png', 'public', 'public', 11423, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(14, 'App\\Models\\PaymentGateway', 14, '395feccd-86c6-4cd7-810b-569f7f56b5ea', 'payment-gateway', 'cashfree', 'cashfree.png', 'image/png', 'public', 'public', 4940, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(15, 'App\\Models\\PaymentGateway', 15, '5d02ac09-0c73-4813-aaa4-2cb6e83fcd75', 'payment-gateway', 'payfast', 'payfast.png', 'image/png', 'public', 'public', 2173, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(16, 'App\\Models\\PaymentGateway', 16, 'b58fab1e-4b2b-4281-bc76-daba98c1dfae', 'payment-gateway', 'skrill', 'skrill.png', 'image/png', 'public', 'public', 7074, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(17, 'App\\Models\\PaymentGateway', 17, 'c199d342-02c7-4780-8751-997d99b76deb', 'payment-gateway', 'phonepe', 'phonepe.png', 'image/png', 'public', 'public', 4417, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(18, 'App\\Models\\PaymentGateway', 18, 'bc94469f-343e-4f43-9dd5-e4c2de513742', 'payment-gateway', 'telr', 'telr.png', 'image/png', 'public', 'public', 7594, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(19, 'App\\Models\\PaymentGateway', 19, '86d1f9de-bd48-47e9-b424-317cdefd94fd', 'payment-gateway', 'iyzico', 'iyzico.png', 'image/png', 'public', 'public', 7652, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(20, 'App\\Models\\PaymentGateway', 20, '78d3b9f4-0cc7-46e6-b2c1-332bac76aeec', 'payment-gateway', 'pesapal', 'pesapal.png', 'image/png', 'public', 'public', 9373, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(21, 'App\\Models\\PaymentGateway', 21, '32a6c522-fcc3-4258-a1c3-a674509dda42', 'payment-gateway', 'midtrans', 'midtrans.png', 'image/png', 'public', 'public', 5877, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(22, 'App\\Models\\Language', 1, 'e14f01cd-8703-4c44-8c5e-44db7fb277c1', 'language', 'english', 'english.png', 'image/png', 'public', 'public', 1149, '[]', '[]', '[]', '[]', 1, '2025-07-02 23:48:09', '2025-07-02 23:48:09'),
(26, 'App\\Models\\ThemeSetting', 56, '80a9acca-f243-476f-8443-df3179b10932', 'theme-logo', 'cakeit-logo', 'cakeit-logo.jpg', 'image/jpeg', 'public', 'public', 4408, '[]', '[]', '[]', '[]', 1, '2025-07-03 00:11:03', '2025-07-03 00:11:03'),
(27, 'App\\Models\\ThemeSetting', 57, '90075647-9eb5-4149-aa0a-912958973aa9', 'theme-favicon-logo', 'cropped-cakeit-logo-removebg-preview', 'cropped-cakeit-logo-removebg-preview.png', 'image/png', 'public', 'public', 161172, '[]', '[]', '[]', '[]', 1, '2025-07-03 00:11:03', '2025-07-03 00:11:03'),
(28, 'App\\Models\\ThemeSetting', 58, '7350839c-5670-434e-b253-859bea6ede05', 'theme-footer-logo', 'cakeit-logo', 'cakeit-logo.jpg', 'image/jpeg', 'public', 'public', 4408, '[]', '[]', '[]', '[]', 1, '2025-07-03 00:11:04', '2025-07-03 00:11:04'),
(29, 'App\\Models\\ItemCategory', 1, '61597651-b1fd-4cb1-b3be-039fbc6a504e', 'item-category', 'Best-Birthday-cakes-2-500x500', 'Best-Birthday-cakes-2-500x500.jpg', 'image/jpeg', 'public', 'public', 39058, '[]', '[]', '{\"thumb\":true,\"cover\":true}', '[]', 1, '2025-07-02 12:33:40', '2025-07-02 12:33:44'),
(30, 'App\\Models\\ItemCategory', 2, 'c92438ce-0009-4016-abe5-c13ef3bb443f', 'item-category', 'Best-Birthday-cakes-2-500x500', 'Best-Birthday-cakes-2-500x500.jpg', 'image/jpeg', 'public', 'public', 39058, '[]', '[]', '{\"thumb\":true,\"cover\":true}', '[]', 1, '2025-07-02 12:34:04', '2025-07-02 12:34:05'),
(31, 'App\\Models\\Item', 1, '8570bdb4-5d7b-4df1-a5af-cf175a3ca842', 'item', 'IMG_9944-600x618', 'IMG_9944-600x618.jpg', 'image/jpeg', 'public', 'public', 50933, '[]', '[]', '{\"thumb\":true,\"cover\":true,\"preview\":true}', '[]', 1, '2025-07-02 13:05:22', '2025-07-02 13:05:23'),
(32, 'App\\Models\\Item', 2, 'ab63ba51-0b01-4c70-ad9e-dba03fac8d75', 'item', 'IMG_4077_1-667x1000', 'IMG_4077_1-667x1000.jpg', 'image/jpeg', 'public', 'public', 75941, '[]', '[]', '{\"thumb\":true,\"cover\":true,\"preview\":true}', '[]', 1, '2025-07-02 13:10:47', '2025-07-02 13:10:49'),
(33, 'App\\Models\\OrderItem', 9, '468b6730-6ab7-4d4c-aadf-b9a92d524de5', 'attachment', 'GO4TRADES_CARD_GRAY', 'GO4TRADES_CARD_GRAY.png', 'image/png', 'public', 'public', 73789, '[]', '[]', '{\"thumb\":true,\"preview\":true}', '[]', 1, '2025-07-04 05:54:12', '2025-07-04 05:54:19'),
(34, 'App\\Models\\OrderItem', 10, '0d675b59-ca29-456c-91d2-ef6a84d7fdf2', 'attachment', 'Chocolate-mini-cake', 'Chocolate-mini-cake.webp', 'image/webp', 'public', 'public', 137550, '[]', '[]', '{\"thumb\":true,\"preview\":true}', '[]', 1, '2025-07-04 06:23:08', '2025-07-04 06:23:09'),
(35, 'App\\Models\\OrderItem', 11, 'e10598d0-7f45-4f79-bbd7-3acc3feeff67', 'attachment', 'Mary_Grace_Lolly_Cake', 'Mary_Grace_Lolly_Cake.jpg', 'image/jpeg', 'public', 'public', 145717, '[]', '[]', '{\"thumb\":true,\"preview\":true}', '[]', 1, '2025-07-04 07:06:26', '2025-07-04 07:06:27');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `priority` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `language`, `url`, `icon`, `status`, `parent`, `type`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'dashboard', 'lab lab-dashboard', 1, 0, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(2, 'Items', 'items', 'items', 'lab lab-items', 1, 0, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(3, 'Dining Tables', 'dining_tables', 'dining-tables', 'lab lab-dining-table', 1, 0, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(4, 'Pos & Orders', 'pos_and_orders', '#', 'lab lab-pos', 1, 0, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(5, 'POS', 'pos', 'pos', 'lab lab-pos', 1, 4, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(6, 'POS Orders', 'pos_orders', 'pos-orders', 'lab lab-pos-orders', 1, 4, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(7, 'Table Orders', 'table_orders', 'table-orders', 'lab lab-reserve-line', 1, 4, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(8, 'K.D.S', 'k_d_s', 'kitchen-display-system', 'lab lab-kds', 1, 4, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(9, 'O.S.S', 'o_s_s', 'order-status-screen', 'lab lab-cds', 1, 4, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(10, 'Promo', 'promo', '#', 'lab ', 1, 0, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(11, 'Offers', 'offers', 'offers', 'lab lab-offers', 1, 10, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(12, 'Users', 'users', '#', 'lab ', 1, 0, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(13, 'Administrators', 'administrators', 'administrators', 'lab lab-administrators', 1, 12, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(14, 'Customers', 'customers', 'customers', 'lab lab-customers', 1, 12, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(15, 'Employees', 'employees', 'employees', 'lab lab-employee', 1, 12, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(16, 'Waiters', 'waiters', 'waiters', 'lab lab-waiter', 1, 12, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(17, 'Chef', 'chefs', 'chefs', 'lab lab-chef', 1, 12, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(18, 'Accounts', 'accounts', '#', 'lab ', 1, 0, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(19, 'Transactions', 'transactions', 'transactions', 'lab lab-transactions', 1, 18, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(20, 'Reports', 'reports', '#', 'lab ', 1, 0, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(21, 'Sales Report', 'sales_report', 'sales-report', 'lab lab-sales-report', 1, 20, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(22, 'Items Report', 'items_report', 'items-report', 'lab lab-items-report', 1, 20, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(23, 'Credit Balance Report', 'credit_balance_report', 'credit-balance-report', 'lab lab-credit-balance-report', 1, 20, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(24, 'Setup', 'setup', '#', 'lab ', 1, 0, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48'),
(25, 'Settings', 'settings', 'settings', 'lab lab-settings', 1, 24, 1, 100, '2025-07-02 23:47:48', '2025-07-02 23:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `menu_sections`
--

CREATE TABLE `menu_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_sections`
--

INSERT INTO `menu_sections` (`id`, `name`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Header Section', NULL, NULL, NULL, NULL, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(2, 'Footer Section', NULL, NULL, NULL, NULL, '2025-07-02 23:47:49', '2025-07-02 23:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `menu_templates`
--

CREATE TABLE `menu_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_templates`
--

INSERT INTO `menu_templates` (`id`, `name`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Contact Us', NULL, NULL, NULL, NULL, '2025-07-02 23:47:49', '2025-07-02 23:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_histories`
--

CREATE TABLE `message_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `text` longtext DEFAULT NULL,
  `is_read` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_09_10_080029_create_menus_table', 1),
(6, '2022_05_01_142407_create_permission_tables', 1),
(7, '2022_05_24_204620_create_settings_table', 1),
(8, '2022_05_25_124629_create_currencies_table', 1),
(9, '2022_06_26_055545_create_default_access_table', 1),
(10, '2022_08_10_143500_create_media_table', 1),
(11, '2022_10_31_015126_create_pesapals_table', 1),
(12, '2022_11_17_110125_create_branches_table', 1),
(13, '2022_11_17_110157_create_languages_table', 1),
(14, '2022_11_17_110300_create_addresses_table', 1),
(15, '2022_11_17_110428_create_item_categories_table', 1),
(16, '2022_11_17_110455_create_offers_table', 1),
(17, '2022_11_17_110459_create_taxes_table', 1),
(18, '2022_11_17_110514_create_items_table', 1),
(19, '2022_11_17_110541_create_item_attributes_table', 1),
(20, '2022_11_17_110621_create_item_variations_table', 1),
(21, '2022_11_17_110650_create_item_extras_table', 1),
(22, '2022_11_17_110810_create_orders_table', 1),
(23, '2022_11_17_110832_create_order_items_table', 1),
(24, '2022_11_17_111737_create_offer_items_table', 1),
(25, '2022_11_17_113842_create_menu_sections_table', 1),
(26, '2022_11_17_114040_create_menu_templates_table', 1),
(27, '2022_11_17_114144_create_analytics_table', 1),
(28, '2022_11_17_114516_create_analytics_sections_table', 1),
(29, '2022_11_17_114835_create_payment_gateways_table', 1),
(30, '2022_11_17_115136_create_sms_gateways_table', 1),
(31, '2022_11_17_115341_create_gateway_options_table', 1),
(32, '2022_11_17_115716_create_addons_table', 1),
(33, '2022_11_17_120130_create_notifications_table', 1),
(34, '2022_11_17_120408_create_messages_table', 1),
(35, '2022_11_17_120624_create_message_histories_table', 1),
(36, '2022_11_17_120626_create_pages_table', 1),
(37, '2022_11_17_120627_create_item_addons_table', 1),
(38, '2022_11_23_125038_create_push_notifications_table', 1),
(39, '2023_01_09_111734_create_time_slots_table', 1),
(40, '2023_02_20_180253_create_order_addresses_table', 1),
(41, '2023_03_06_154954_create_otps_table', 1),
(42, '2023_03_23_143747_create_transactions_table', 1),
(43, '2023_03_23_170303_create_capture_payment_notifications_table', 1),
(44, '2023_03_27_140107_create_notification_alerts_table', 1),
(45, '2023_07_19_135307_add_soft_delete_column_to_users_table', 1),
(46, '2023_07_20_095727_add_total_tax_to_orders_table', 1),
(47, '2023_07_20_095843_add_tax_to_order_items_table', 1),
(48, '2023_09_05_133748_create_dining_tables_table', 1),
(49, '2023_11_18_154743_add_dining_table_id_to_order_table', 1),
(50, '2024_01_22_172712_add_display_mode_to_languages_table', 1),
(51, '2024_03_07_095727_add_sort_to_item_categories_table', 1),
(52, '2024_10_28_000000_add_pos_payment_method_and_note_to_orders_table', 1),
(53, '2025_02_09_000000_add_pos_received_amount_to_orders_table', 1),
(54, '2025_07_02_174459_add_is_variable_to_items_table', 2),
(55, '2025_01_27_000000_add_attachment_to_order_items_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) NOT NULL,
  `data` longtext DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_alerts`
--

CREATE TABLE `notification_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `mail_message` varchar(255) DEFAULT NULL,
  `sms_message` varchar(255) DEFAULT NULL,
  `push_notification_message` varchar(255) DEFAULT NULL,
  `mail` tinyint(4) DEFAULT NULL,
  `sms` tinyint(4) DEFAULT NULL,
  `push_notification` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_alerts`
--

INSERT INTO `notification_alerts` (`id`, `name`, `language`, `mail_message`, `sms_message`, `push_notification_message`, `mail`, `sms`, `push_notification`, `created_at`, `updated_at`) VALUES
(1, 'Admin And Branch Manager New Order Message', 'admin_and_branch_manager_new_order_message', 'You have a new order.', 'You have a new order.', 'You have a new order.', 10, 10, 10, '2025-07-02 23:47:53', '2025-07-02 23:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_items`
--

CREATE TABLE `offer_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_serial_no` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(19,6) NOT NULL,
  `discount` decimal(19,6) DEFAULT 0.000000,
  `delivery_charge` decimal(19,6) DEFAULT 0.000000,
  `total_tax` decimal(19,6) DEFAULT NULL,
  `total` decimal(19,6) NOT NULL,
  `order_type` tinyint(4) NOT NULL DEFAULT 5,
  `order_datetime` timestamp NOT NULL DEFAULT '2025-07-02 23:07:10',
  `delivery_time` varchar(255) DEFAULT NULL,
  `preparation_time` int(11) NOT NULL DEFAULT 0,
  `is_advance_order` tinyint(4) NOT NULL DEFAULT 5,
  `payment_method` bigint(20) NOT NULL DEFAULT 1,
  `pos_payment_method` tinyint(4) DEFAULT NULL,
  `pos_received_amount` decimal(19,6) DEFAULT 0.000000,
  `pos_payment_note` varchar(200) DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 10,
  `status` tinyint(4) NOT NULL,
  `dining_table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_boy_id` bigint(20) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_serial_no`, `token`, `user_id`, `branch_id`, `subtotal`, `discount`, `delivery_charge`, `total_tax`, `total`, `order_type`, `order_datetime`, `delivery_time`, `preparation_time`, `is_advance_order`, `payment_method`, `pos_payment_method`, `pos_received_amount`, `pos_payment_note`, `payment_status`, `status`, `dining_table_id`, `delivery_boy_id`, `reason`, `source`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, '0407251', '001', 2, 1, 20.000000, 0.000000, 0.000000, 0.000000, 20.000000, 10, '2025-07-04 04:41:06', '09:41 - 10:11', 30, 10, 1, 1, 20.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 04:41:06', '2025-07-04 04:41:06'),
(2, '0407252', '2222', 2, 1, 10.000000, 0.000000, 0.000000, 0.000000, 10.000000, 10, '2025-07-04 04:46:45', '09:46 - 10:16', 30, 10, 1, 1, 10.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 04:46:45', '2025-07-04 04:46:45'),
(3, '0407253', '0013', 2, 1, 10.000000, 0.000000, 0.000000, 0.000000, 10.000000, 10, '2025-07-04 05:00:15', '10:00 - 10:30', 30, 10, 1, 1, 10.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 05:00:15', '2025-07-04 05:00:16'),
(4, '0407254', '23423', 2, 1, 10.000000, 0.000000, 0.000000, 0.000000, 10.000000, 10, '2025-07-04 05:04:22', '10:04 - 10:34', 30, 10, 1, 1, 10.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 05:04:22', '2025-07-04 05:04:23'),
(5, '0407255', '324', 2, 1, 10.000000, 0.000000, 0.000000, 0.000000, 10.000000, 10, '2025-07-04 05:23:50', '10:23 - 10:53', 30, 10, 1, 1, 10.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 05:23:50', '2025-07-04 05:23:51'),
(6, '0407256', '2323', 2, 1, 10.000000, 0.000000, 0.000000, 0.000000, 10.000000, 10, '2025-07-04 05:41:00', '10:41 - 11:11', 30, 10, 1, 1, 10.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 05:41:00', '2025-07-04 05:41:01'),
(7, '0407257', '232', 2, 1, 10.000000, 0.000000, 0.000000, 0.000000, 10.000000, 10, '2025-07-04 05:42:57', '10:42 - 11:12', 30, 10, 1, 1, 10.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 05:42:57', '2025-07-04 05:42:57'),
(8, '0407258', '00122', 2, 1, 10.000000, 0.000000, 0.000000, 0.000000, 10.000000, 10, '2025-07-04 05:46:34', '10:46 - 11:16', 30, 10, 1, 1, 10.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 05:46:34', '2025-07-04 05:46:35'),
(9, '0407259', '11100', 2, 1, 10.000000, 0.000000, 0.000000, 0.000000, 10.000000, 10, '2025-07-04 05:54:10', '10:54 - 11:24', 30, 10, 1, 1, 10.000000, NULL, 5, 7, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 05:54:10', '2025-07-04 05:55:21'),
(10, '04072510', '11102', 2, 1, 20.000000, 0.000000, 0.000000, 0.000000, 20.000000, 10, '2025-07-04 06:23:08', '11:23 - 11:53', 30, 10, 1, 1, 20.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 06:23:08', '2025-07-04 06:23:09'),
(11, '04072511', '98168', 2, 1, 40.000000, 0.000000, 0.000000, 0.000000, 40.000000, 10, '2025-07-04 07:06:26', '12:06 - 12:36', 30, 10, 1, 1, 40.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 07:06:26', '2025-07-04 07:06:27'),
(12, '04072512', '1111', 2, 1, 10.000000, 0.000000, 0.000000, 0.000000, 10.000000, 10, '2025-07-04 07:07:13', '12:07 - 12:37', 30, 10, 1, 1, 10.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2025-07-04 07:07:13', '2025-07-04 07:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE `order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `discount` decimal(19,6) NOT NULL,
  `tax_name` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(19,6) DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL,
  `tax_amount` decimal(19,6) DEFAULT NULL,
  `price` decimal(19,6) NOT NULL,
  `item_variations` longtext DEFAULT NULL,
  `item_extras` longtext DEFAULT NULL,
  `item_variation_total` decimal(19,6) DEFAULT 0.000000,
  `item_extra_total` decimal(19,6) DEFAULT 0.000000,
  `total_price` decimal(19,6) DEFAULT 0.000000,
  `instruction` text DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `branch_id`, `item_id`, `quantity`, `discount`, `tax_name`, `tax_rate`, `tax_type`, `tax_amount`, `price`, `item_variations`, `item_extras`, `item_variation_total`, `item_extra_total`, `total_price`, `instruction`, `attachment`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 20.000000, '', NULL, NULL, NULL, NULL, NULL, '2025-07-04 04:41:06', '2025-07-04 04:41:06'),
(2, 2, 1, 1, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 10.000000, 'asdas', NULL, NULL, NULL, NULL, NULL, '2025-07-04 04:46:45', '2025-07-04 04:46:45'),
(3, 3, 1, 1, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 10.000000, 'dasd', NULL, NULL, NULL, NULL, NULL, '2025-07-04 05:00:16', '2025-07-04 05:00:16'),
(4, 4, 1, 1, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 10.000000, 'fgdf', NULL, NULL, NULL, NULL, NULL, '2025-07-04 05:04:23', '2025-07-04 05:04:23'),
(5, 5, 1, 1, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 10.000000, 'fgdgdfg', NULL, NULL, NULL, NULL, NULL, '2025-07-04 05:23:50', '2025-07-04 05:23:50'),
(6, 6, 1, 1, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 10.000000, 'sdfsdf', NULL, NULL, NULL, NULL, NULL, '2025-07-04 05:41:00', '2025-07-04 05:41:00'),
(7, 7, 1, 1, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 10.000000, 'sdasd', NULL, NULL, NULL, NULL, NULL, '2025-07-04 05:42:57', '2025-07-04 05:42:57'),
(8, 8, 1, 1, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 10.000000, 'sadasd', NULL, NULL, NULL, NULL, NULL, '2025-07-04 05:46:35', '2025-07-04 05:46:35'),
(9, 9, 1, 1, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 10.000000, 'asasas', NULL, NULL, NULL, NULL, NULL, '2025-07-04 05:54:10', '2025-07-04 05:54:10'),
(10, 10, 1, 1, 2, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 20.000000, 'dasd', NULL, NULL, NULL, NULL, NULL, '2025-07-04 06:23:08', '2025-07-04 06:23:08'),
(11, 11, 1, 1, 4, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 40.000000, '', NULL, NULL, NULL, NULL, NULL, '2025-07-04 07:06:26', '2025-07-04 07:06:26'),
(12, 12, 1, 1, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 10.000000, '[]', '[]', 0.000000, 0.000000, 10.000000, 'hjh', NULL, NULL, NULL, NULL, NULL, '2025-07-04 07:07:13', '2025-07-04 07:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `phone` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `menu_section_id` bigint(20) UNSIGNED NOT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `misc` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `slug`, `misc`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Cash On Delivery', 'cash-on-delivery', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:47:53', '2025-07-02 23:47:53'),
(2, 'Credit', 'credit', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:47:57', '2025-07-02 23:47:57'),
(3, 'Paypal', 'paypal', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(4, 'Stripe', 'stripe', '{\"input\":[\"stripe.stripeInput.blade.php\"],\"js\":[\"stripe.stripeJs.blade.php\"],\"submit\":true}', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:47:58', '2025-07-02 23:47:58'),
(5, 'Flutterwave', 'flutterwave', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(6, 'Paystack', 'paystack', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:47:59', '2025-07-02 23:47:59'),
(7, 'SslCommerz', 'sslcommerz', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(8, 'Mollie', 'mollie', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:00', '2025-07-02 23:48:00'),
(9, 'Senangpay', 'senangpay', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(10, 'Bkash', 'bkash', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(11, 'Paytm', 'paytm', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:01', '2025-07-02 23:48:01'),
(12, 'Razorpay', 'razorpay', '{\"input\":[],\"js\":[\"razorpay.razorpayJs.blade.php\"],\"submit\":false}', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(13, 'Mercadopago', 'mercadopago', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:02', '2025-07-02 23:48:02'),
(14, 'Cashfree', 'cashfree', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(15, 'Payfast', 'payfast', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:03', '2025-07-02 23:48:03'),
(16, 'Skrill', 'skrill', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(17, 'PhonePe', 'phonepe', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:04', '2025-07-02 23:48:04'),
(18, 'Telr', 'telr', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(19, 'Iyzico', 'iyzico', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:05', '2025-07-02 23:48:05'),
(20, 'Pesapal', 'pesapal', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(21, 'Midtrans', 'midtrans', 'null', 10, NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent` bigint(20) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `name`, `guard_name`, `url`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'sanctum', 'dashboard', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(2, 'Items', 'items', 'sanctum', 'items', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(3, 'Items Create', 'items_create', 'sanctum', 'items/create', 2, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(4, 'Items Edit', 'items_edit', 'sanctum', 'items/edit', 2, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(5, 'Items Delete', 'items_delete', 'sanctum', 'items/delete', 2, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(6, 'Items Show', 'items_show', 'sanctum', 'items/show', 2, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(7, 'Dining Tables', 'dining-tables', 'sanctum', 'dining-tables', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(8, 'Dining Tables Create', 'dining_tables_create', 'sanctum', 'dining-table/create', 7, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(9, 'Dining Tables Edit', 'dining_tables_edit', 'sanctum', 'dining-table/edit', 7, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(10, 'Dining Tables Delete', 'dining_tables_delete', 'sanctum', 'dining-tables/delete', 7, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(11, 'Dining Tables Show', 'dining_tables_show', 'sanctum', 'dining-tables/show', 7, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(12, 'POS', 'pos', 'sanctum', 'pos', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(13, 'POS Orders', 'pos-orders', 'sanctum', 'pos-orders', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(14, 'Table Orders', 'table-orders', 'sanctum', 'table-orders', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(15, 'K.D.S', 'kitchen-display-system', 'sanctum', 'kitchen-display-system', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(16, 'O.S.S', 'order-status-screen', 'sanctum', 'order-status-screen', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(17, 'Offers', 'offers', 'sanctum', 'offers', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(18, 'Offers Create', 'offers_create', 'sanctum', 'offers/create', 17, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(19, 'Offers Edit', 'offers_edit', 'sanctum', 'offers/edit', 17, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(20, 'Offers Delete', 'offers_delete', 'sanctum', 'offers/delete', 17, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(21, 'Offers Show', 'offers_show', 'sanctum', 'offers/show', 17, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(22, 'Administrators', 'administrators', 'sanctum', 'administrators', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(23, 'Administrators Create', 'administrators_create', 'sanctum', 'administrators/create', 22, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(24, 'Administrators Edit', 'administrators_edit', 'sanctum', 'administrators/edit', 22, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(25, 'Administrators Delete', 'administrators_delete', 'sanctum', 'administrators/delete', 22, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(26, 'Administrators Show', 'administrators_show', 'sanctum', 'administrators/show', 22, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(27, 'Delivery Boys', 'delivery-boys', 'sanctum', 'delivery-boys', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(28, 'Delivery Boys Create', 'delivery-boys_create', 'sanctum', 'delivery-boys/create', 27, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(29, 'Delivery Boys Edit', 'delivery-boys_edit', 'sanctum', 'delivery-boys/edit', 27, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(30, 'Delivery Boys Delete', 'delivery-boys_delete', 'sanctum', 'delivery-boys/delete', 27, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(31, 'Delivery Boys Show', 'delivery-boys_show', 'sanctum', 'delivery-boys/show', 27, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(32, 'Customers', 'customers', 'sanctum', 'customers', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(33, 'Customers Create', 'customers_create', 'sanctum', 'customers/create', 32, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(34, 'Customers Edit', 'customers_edit', 'sanctum', 'customers/edit', 32, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(35, 'Customers Delete', 'customers_delete', 'sanctum', 'customers/delete', 32, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(36, 'Customers Show', 'customers_show', 'sanctum', 'customers/show', 32, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(37, 'Employees', 'employees', 'sanctum', 'employees', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(38, 'Employees Create', 'employees_create', 'sanctum', 'employees/create', 37, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(39, 'Employees Edit', 'employees_edit', 'sanctum', 'employees/edit', 37, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(40, 'Employees Delete', 'employees_delete', 'sanctum', 'employees/delete', 37, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(41, 'Employees Show', 'employees_show', 'sanctum', 'employees/show', 37, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(42, 'Waiters', 'waiters', 'sanctum', 'waiters', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(43, 'Waiters Create', 'waiters_create', 'sanctum', 'waiters/create', 42, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(44, 'Waiters Edit', 'waiters_edit', 'sanctum', 'waiters/edit', 42, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(45, 'Waiters Delete', 'waiters_delete', 'sanctum', 'waiters/delete', 42, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(46, 'Waiters Show', 'waiters_show', 'sanctum', 'waiters/show', 42, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(47, 'Chefs', 'chefs', 'sanctum', 'chefs', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(48, 'Chefs Create', 'chefs_create', 'sanctum', 'chefs/create', 47, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(49, 'Chefs Edit', 'chefs_edit', 'sanctum', 'chefs/edit', 47, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(50, 'Chefs Delete', 'chefs_delete', 'sanctum', 'chefs/delete', 47, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(51, 'Chefs Show', 'chefs_show', 'sanctum', 'chefs/show', 47, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(52, 'Transactions', 'transactions', 'sanctum', 'transactions', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(53, 'Sales Report', 'sales-report', 'sanctum', 'sales-report', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(54, 'Items Report', 'items-report', 'sanctum', 'items-report', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(55, 'Credit Balance Report', 'credit-balance-report', 'sanctum', 'credit-balance-report', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(56, 'Settings', 'settings', 'sanctum', 'settings', 0, '2025-07-02 23:47:49', '2025-07-02 23:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 1, 'auth_token', 'ed64401781f0de73cb001f86cc55ffc5404bb5e71ff33ee187e44fcf361bb6dd', '[\"*\"]', '2025-07-03 05:20:53', NULL, '2025-07-03 00:13:46', '2025-07-03 05:20:53'),
(4, 'App\\Models\\User', 1, 'auth_token', '3ef562d2d43d77be55186f668f5a68ca7f9f38a4f22fb2cbf181452b6faa3262', '[\"*\"]', '2025-07-03 05:22:48', NULL, '2025-07-03 05:21:16', '2025-07-03 05:22:48'),
(5, 'App\\Models\\User', 1, 'auth_token', '443d665d7eebb7642b661b28856c5bae342c1c926fd3c24442288937dab77f93', '[\"*\"]', '2025-07-04 11:02:21', NULL, '2025-07-03 05:23:03', '2025-07-04 11:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `pesapals`
--

CREATE TABLE `pesapals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_line_1` varchar(255) DEFAULT NULL,
  `billing_address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `amount` text NOT NULL,
  `currency` varchar(255) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `merchant_reference` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` text DEFAULT NULL,
  `tracking_id` text DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'sanctum', '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(2, 'Customer', 'sanctum', '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(3, 'Waiter', 'sanctum', '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(4, 'Chef', 'sanctum', '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(5, 'Branch Manager', 'sanctum', '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(6, 'POS Operator', 'sanctum', '2025-07-02 23:47:49', '2025-07-02 23:47:49'),
(7, 'Stuff', 'sanctum', '2025-07-02 23:47:49', '2025-07-02 23:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 5),
(12, 1),
(12, 5),
(12, 6),
(13, 1),
(13, 5),
(13, 6),
(14, 5),
(15, 1),
(15, 4),
(15, 5),
(16, 1),
(16, 4),
(16, 5),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 5),
(28, 1),
(28, 5),
(29, 1),
(29, 5),
(30, 1),
(30, 5),
(31, 1),
(31, 5),
(32, 1),
(32, 5),
(33, 1),
(33, 5),
(34, 1),
(34, 5),
(35, 1),
(35, 5),
(36, 1),
(36, 5),
(37, 1),
(37, 5),
(38, 1),
(38, 5),
(39, 1),
(39, 5),
(40, 1),
(40, 5),
(41, 1),
(41, 5),
(42, 1),
(42, 5),
(43, 1),
(43, 5),
(44, 1),
(44, 5),
(45, 1),
(45, 5),
(46, 1),
(46, 5),
(47, 1),
(47, 5),
(48, 1),
(48, 5),
(49, 1),
(49, 5),
(50, 1),
(50, 5),
(51, 1),
(51, 5),
(52, 1),
(52, 5),
(53, 1),
(53, 5),
(54, 1),
(55, 1),
(56, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `settingable_type` varchar(255) DEFAULT NULL,
  `settingable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `key`, `payload`, `settingable_type`, `settingable_id`, `created_at`, `updated_at`) VALUES
(1, 'company', 'company_name', '{\"$value\":\"Cakeit\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:07:01', '2025-07-03 00:07:01'),
(2, 'company', 'company_email', '{\"$value\":\"info@cakeit.us\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:07:01', '2025-07-03 00:07:01'),
(3, 'company', 'company_phone', '{\"$value\":\"+15037465614\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:07:02', '2025-07-03 00:07:02'),
(4, 'company', 'company_website', '{\"$value\":\"https:\\/\\/cakeit.us\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:07:02', '2025-07-03 00:07:02'),
(5, 'company', 'company_city', '{\"$value\":\"Beaverton\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:07:02', '2025-07-03 00:07:02'),
(6, 'company', 'company_state', '{\"$value\":\"Oregon\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:07:02', '2025-07-03 00:07:02'),
(7, 'company', 'company_country_code', '{\"$value\":\"USA\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:07:02', '2025-07-03 00:07:02'),
(8, 'company', 'company_zip_code', '{\"$value\":\"97005\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:07:02', '2025-07-03 00:07:02'),
(9, 'company', 'company_address', '{\"$value\":\"Shop: 3205 SW Cedar Hills Blvd, Beaverton, OR 97005\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:07:02', '2025-07-03 00:07:02'),
(10, 'site', 'site_date_format', '{\"$value\":\"d-m-Y\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:40', '2025-07-03 00:31:40'),
(11, 'site', 'site_time_format', '{\"$value\":\"h:i A\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:40', '2025-07-03 00:31:40'),
(12, 'site', 'site_default_timezone', '{\"$value\":\"Pacific\\/Easter\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:40', '2025-07-03 00:31:40'),
(13, 'site', 'site_default_branch', '{\"$value\":1,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:40', '2025-07-03 00:31:40'),
(14, 'site', 'site_default_currency', '{\"$value\":1,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:40', '2025-07-03 00:31:40'),
(15, 'site', 'site_default_currency_symbol', '{\"$value\":\"$\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:41', '2025-07-03 00:31:41'),
(16, 'site', 'site_currency_position', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:40', '2025-07-03 00:31:40'),
(17, 'site', 'site_digit_after_decimal_point', '{\"$value\":\"2\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:40', '2025-07-03 00:31:40'),
(18, 'site', 'site_email_verification', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:40', '2025-07-03 00:31:40'),
(19, 'site', 'site_phone_verification', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:40', '2025-07-03 00:31:40'),
(20, 'site', 'site_default_language', '{\"$value\":1,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:41', '2025-07-03 00:31:41'),
(21, 'site', 'site_google_map_key', '{\"$value\":\"test\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:41', '2025-07-03 00:31:41'),
(22, 'site', 'site_copyright', '{\"$value\":\"Cakeit\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:41', '2025-07-03 00:31:41'),
(23, 'site', 'site_language_switch', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:41', '2025-07-03 00:31:41'),
(24, 'site', 'site_app_debug', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:41', '2025-07-03 00:31:41'),
(25, 'site', 'site_auto_update', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:52', '2025-07-02 23:47:52'),
(26, 'site', 'site_online_payment_gateway', '{\"$value\":10,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:41', '2025-07-03 00:31:41'),
(27, 'site', 'site_default_sms_gateway', '{\"$value\":null,\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:41', '2025-07-03 00:31:41'),
(28, 'site', 'site_food_preparation_time', '{\"$value\":\"30\",\"$cast\":null}', NULL, NULL, '2025-07-03 00:31:41', '2025-07-03 00:31:41'),
(29, 'notification', 'notification_fcm_public_vapid_key', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:52', '2025-07-02 23:47:52'),
(30, 'notification', 'notification_fcm_api_key', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:52', '2025-07-02 23:47:52'),
(31, 'notification', 'notification_fcm_auth_domain', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:53', '2025-07-02 23:47:53'),
(32, 'notification', 'notification_fcm_project_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:53', '2025-07-02 23:47:53'),
(33, 'notification', 'notification_fcm_storage_bucket', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:53', '2025-07-02 23:47:53'),
(34, 'notification', 'notification_fcm_messaging_sender_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:53', '2025-07-02 23:47:53'),
(35, 'notification', 'notification_fcm_app_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:53', '2025-07-02 23:47:53'),
(36, 'notification', 'notification_fcm_measurement_id', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:53', '2025-07-02 23:47:53'),
(37, 'notification', 'notification_fcm_json_file', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:47:53', '2025-07-02 23:47:53'),
(38, 'mail', 'mail_mailer', '{\"$value\":\"smtp\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:18', '2025-07-02 23:48:18'),
(39, 'mail', 'mail_host', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:18', '2025-07-02 23:48:18'),
(40, 'mail', 'mail_port', '{\"$value\":\"0\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:18', '2025-07-02 23:48:18'),
(41, 'mail', 'mail_username', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:18', '2025-07-02 23:48:18'),
(42, 'mail', 'mail_password', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:18', '2025-07-02 23:48:18'),
(43, 'mail', 'mail_encryption', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(44, 'mail', 'mail_from_name', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(45, 'mail', 'mail_from_email', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(46, 'order_setup', 'order_setup_food_preparation_time', '{\"$value\":\"30\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(47, 'order_setup', 'order_setup_schedule_order_slot_duration', '{\"$value\":\"30\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(48, 'order_setup', 'order_setup_takeaway', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(49, 'order_setup', 'order_setup_delivery', '{\"$value\":5,\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(50, 'order_setup', 'order_setup_free_delivery_kilometer', '{\"$value\":\"2\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(51, 'order_setup', 'order_setup_basic_delivery_charge', '{\"$value\":\"1\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(52, 'order_setup', 'order_setup_charge_per_kilo', '{\"$value\":\"1\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(53, 'otp', 'otp_type', '{\"$value\":\"5\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(54, 'otp', 'otp_digit_limit', '{\"$value\":\"4\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:19', '2025-07-02 23:48:19'),
(55, 'otp', 'otp_expire_time', '{\"$value\":\"10\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:20', '2025-07-02 23:48:20'),
(56, 'theme', 'theme_logo', '{\"$value\":{},\"$cast\":null}', NULL, NULL, '2025-07-03 00:11:03', '2025-07-03 00:11:03'),
(57, 'theme', 'theme_favicon_logo', '{\"$value\":{},\"$cast\":null}', NULL, NULL, '2025-07-03 00:11:03', '2025-07-03 00:11:03'),
(58, 'theme', 'theme_footer_logo', '{\"$value\":{},\"$cast\":null}', NULL, NULL, '2025-07-03 00:11:03', '2025-07-03 00:11:03'),
(59, 'license', 'license_key', '{\"$value\":\"test\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:20', '2025-07-02 23:48:20'),
(60, 'social_media', 'social_media_facebook', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:20', '2025-07-02 23:48:20'),
(61, 'social_media', 'social_media_youtube', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:20', '2025-07-02 23:48:20'),
(62, 'social_media', 'social_media_instagram', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:20', '2025-07-02 23:48:20'),
(63, 'social_media', 'social_media_twitter', '{\"$value\":\"\",\"$cast\":null}', NULL, NULL, '2025-07-02 23:48:20', '2025-07-02 23:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `misc` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `name`, `slug`, `misc`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Twilio', 'twilio', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:06', '2025-07-02 23:48:06'),
(2, 'Clickatell', 'clickatell', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(3, 'Nexmo', 'nexmo', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(4, 'Msg91', 'msg91', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:07', '2025-07-02 23:48:07'),
(5, '2Factor', 'twofactor', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(6, 'Bulksms', 'bulksms', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(7, 'Bulksmsbd', 'bulksmsbd', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08'),
(8, 'Telesign', 'telesign', 'null', 5, NULL, NULL, NULL, NULL, '2025-07-02 23:48:08', '2025-07-02 23:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `tax_rate` decimal(19,6) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opening_time` varchar(255) NOT NULL,
  `closing_time` varchar(255) NOT NULL,
  `day` tinyint(4) NOT NULL,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sign` varchar(255) NOT NULL DEFAULT '+',
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_no` varchar(255) NOT NULL,
  `amount` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `payment_method` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'payment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `device_token` varchar(255) DEFAULT NULL,
  `web_token` varchar(255) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT 0,
  `country_code` varchar(255) DEFAULT NULL,
  `is_guest` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '5=Active, 10=Inactive',
  `balance` decimal(19,6) NOT NULL DEFAULT 0.000000,
  `creator_type` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `editor_type` varchar(255) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `username`, `email_verified_at`, `password`, `device_token`, `web_token`, `branch_id`, `country_code`, `is_guest`, `status`, `balance`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'admin@admin.com', '5037465614', 'admin', '2025-07-02 23:48:10', '$2y$10$G1OFo/M8IWStt1aX9afIOuiK2rpT8utjI1msRiMOSABiDIwUyPY9a', NULL, NULL, 0, '+1', 10, 5, 0.000000, NULL, NULL, NULL, NULL, NULL, '2025-07-02 23:48:10', '2025-07-03 00:13:30', NULL),
(2, 'Walking Customer', 'walkingcustomer@example.com', '1254444555', 'default-customer', '2025-07-02 23:48:11', '$2y$10$a/e/T3Lr.KxSsiS4FERlT.ZoCihhQ6UrCHXDUC/IMoa3kEG9Z6V02', NULL, NULL, 0, '+880', 10, 5, 0.000000, NULL, NULL, NULL, NULL, NULL, '2025-07-02 23:48:11', '2025-07-02 23:48:11', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `analytics`
--
ALTER TABLE `analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `analytic_sections`
--
ALTER TABLE `analytic_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytic_sections_analytic_id_foreign` (`analytic_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_access`
--
ALTER TABLE `default_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dining_tables`
--
ALTER TABLE `dining_tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dining_tables_slug_unique` (`slug`),
  ADD KEY `dining_tables_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gateway_options`
--
ALTER TABLE `gateway_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_item_category_id_foreign` (`item_category_id`),
  ADD KEY `items_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `item_addons`
--
ALTER TABLE `item_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_addons_item_id_foreign` (`item_id`),
  ADD KEY `item_addons_addon_item_id_foreign` (`addon_item_id`);

--
-- Indexes for table `item_attributes`
--
ALTER TABLE `item_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_extras`
--
ALTER TABLE `item_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_extras_item_id_foreign` (`item_id`);

--
-- Indexes for table `item_variations`
--
ALTER TABLE `item_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_variations_item_id_foreign` (`item_id`),
  ADD KEY `item_variations_item_attribute_id_foreign` (`item_attribute_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_sections`
--
ALTER TABLE `menu_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_templates`
--
ALTER TABLE `menu_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `message_histories`
--
ALTER TABLE `message_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_histories_message_id_foreign` (`message_id`),
  ADD KEY `message_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_alerts`
--
ALTER TABLE `notification_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_items`
--
ALTER TABLE `offer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_items_offer_id_foreign` (`offer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_addresses_order_id_foreign` (`order_id`),
  ADD KEY `order_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_branch_id_foreign` (`branch_id`),
  ADD KEY `order_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD KEY `otps_phone_index` (`phone`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_menu_section_id_foreign` (`menu_section_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pesapals`
--
ALTER TABLE `pesapals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_settingable_type_settingable_id_index` (`settingable_type`,`settingable_id`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `analytics`
--
ALTER TABLE `analytics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `analytic_sections`
--
ALTER TABLE `analytic_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `default_access`
--
ALTER TABLE `default_access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dining_tables`
--
ALTER TABLE `dining_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateway_options`
--
ALTER TABLE `gateway_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_addons`
--
ALTER TABLE `item_addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_attributes`
--
ALTER TABLE `item_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_extras`
--
ALTER TABLE `item_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_variations`
--
ALTER TABLE `item_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `menu_sections`
--
ALTER TABLE `menu_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_templates`
--
ALTER TABLE `menu_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_histories`
--
ALTER TABLE `message_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_alerts`
--
ALTER TABLE `notification_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_items`
--
ALTER TABLE `offer_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_addresses`
--
ALTER TABLE `order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesapals`
--
ALTER TABLE `pesapals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `analytic_sections`
--
ALTER TABLE `analytic_sections`
  ADD CONSTRAINT `analytic_sections_analytic_id_foreign` FOREIGN KEY (`analytic_id`) REFERENCES `analytics` (`id`);

--
-- Constraints for table `dining_tables`
--
ALTER TABLE `dining_tables`
  ADD CONSTRAINT `dining_tables_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`),
  ADD CONSTRAINT `items_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`);

--
-- Constraints for table `item_addons`
--
ALTER TABLE `item_addons`
  ADD CONSTRAINT `item_addons_addon_item_id_foreign` FOREIGN KEY (`addon_item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_addons_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `item_extras`
--
ALTER TABLE `item_extras`
  ADD CONSTRAINT `item_extras_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `item_variations`
--
ALTER TABLE `item_variations`
  ADD CONSTRAINT `item_variations_item_attribute_id_foreign` FOREIGN KEY (`item_attribute_id`) REFERENCES `item_attributes` (`id`),
  ADD CONSTRAINT `item_variations_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `message_histories`
--
ALTER TABLE `message_histories`
  ADD CONSTRAINT `message_histories_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`),
  ADD CONSTRAINT `message_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offer_items`
--
ALTER TABLE `offer_items`
  ADD CONSTRAINT `offer_items_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD CONSTRAINT `order_addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `order_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_menu_section_id_foreign` FOREIGN KEY (`menu_section_id`) REFERENCES `menu_sections` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
