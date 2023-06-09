-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (arm64)
--
-- Host: localhost    Database: shopwise
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'BiuzUCz19zaClkC2aHxyYQKZJOZ4Aq4L',1,'2022-12-12 17:34:38','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Homepage middle 1','2027-12-13 00:00:00','not_set','IZ6WU8KUALYD','promotion/1.jpg','/product-categories/headphone',0,1,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'Homepage middle 2','2027-12-13 00:00:00','not_set','ILSFJVYFGCPZ','promotion/2.jpg','/product-categories/camera',0,2,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'Homepage middle 3','2027-12-13 00:00:00','not_set','ZDOZUZZIU7FT','promotion/3.jpg','/product-categories/watches',0,3,'published','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ecommerce',0,'Consectetur velit nulla qui molestiae adipisci. Autem voluptate in porro amet in. Aut aut aut ipsam.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(2,'Fashion',0,'Nulla nobis optio architecto rerum vero autem inventore. Voluptatem totam odio fuga quae voluptatem. Et dolore neque ratione mollitia itaque ut soluta in. Sequi magnam sed qui ut qui.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(3,'Electronic',0,'Autem ut ipsa atque sequi modi autem ullam. Quia non sunt est eum. Maxime est nobis veritatis dicta.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(4,'Commercial',0,'Optio tenetur et soluta et nihil. Officiis excepturi sit qui officia eveniet laborum repellendus. Veniam qui neque itaque enim enim corrupti in.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-12-12 17:34:37','2022-12-12 17:34:37');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES ('vi',1,'Thương mại điện tử',NULL),('vi',2,'Thời trang',NULL),('vi',3,'Điện tử',NULL),('vi',4,'Thương mại',NULL);
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int unsigned NOT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` int unsigned NOT NULL,
  `widget_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Fashion live',NULL,NULL,'brands/1.png','published',0,1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(2,'Hand crafted',NULL,NULL,'brands/2.png','published',1,1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(3,'Mestonix',NULL,NULL,'brands/3.png','published',2,1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(4,'Sunshine',NULL,NULL,'brands/4.png','published',3,1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(5,'Pure',NULL,NULL,'brands/5.png','published',4,1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(6,'Anfold',NULL,NULL,'brands/6.png','published',5,1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(7,'Automotive',NULL,NULL,'brands/7.png','published',6,1,'2022-12-12 17:34:31','2022-12-12 17:34:31');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
INSERT INTO `ec_brands_translations` VALUES ('vi',1,'Fashion live',NULL),('vi',2,'Hand crafted',NULL),('vi',3,'Mestonix',NULL),('vi',4,'Sunshine',NULL),('vi',5,'Pure',NULL),('vi',6,'Anfold',NULL),('vi',7,'Automotive',NULL);
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned DEFAULT '0',
  `order` int unsigned DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(2,'EUR','€',0,2,1,0,0.84,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(3,'VND','₫',0,0,2,0,23203,'2022-12-12 17:34:31','2022-12-12 17:34:31');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'John Smith','john.smith@botble.com','+13807579991','AF','Mississippi','Mantestad','840 Leffler Falls',1,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','41469-9183'),(2,'John Smith','john.smith@botble.com','+16068362519','CR','Montana','Lakinburgh','664 Gianni Ferry Apt. 079',1,0,'2022-12-12 17:34:32','2022-12-12 17:34:32','34673'),(3,'Mateo Towne','florida.gerlach@example.net','+13464677779','VE','Virginia','Port Sheaview','1291 Alan Islands',2,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','91405'),(4,'Felicia Emmerich DDS','ardith.smith@example.org','+18725019481','PY','Illinois','North Octaviaton','19932 Vicky Shore',3,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','43536'),(5,'Julia Larkin','witting.roxanne@example.com','+14309279065','CI','Michigan','Grahamfurt','8297 Bret Branch',4,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','79659-4284'),(6,'Caesar Cremin','daniel.otilia@example.com','+19207907294','BO','Pennsylvania','East Reva','5958 Tremblay Rest Apt. 170',5,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','18108-0947'),(7,'Alex Emard Sr.','shoeger@example.net','+12704663998','CM','Oregon','West Terrance','45095 Howe Wells Suite 217',6,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','11038-2736'),(8,'Mr. Miller Schmidt','prince48@example.net','+18303224812','JO','Florida','South Candida','47992 Oswald Light',7,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','61188-9168'),(9,'Miss Meagan Gutkowski Jr.','alize.veum@example.com','+18032029875','KI','Florida','Deondreland','563 Eichmann Mission',8,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','14903'),(10,'Theresa West II','dickens.fabiola@example.net','+14799002011','PF','Missouri','Cormierview','28126 Erika Square',9,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','39997'),(11,'Lawson Ortiz','mateo.fay@example.com','+16699855280','CD','Hawaii','East Freida','492 Jake Light Apt. 652',10,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','36402-8430'),(12,'Mr. Jaron Robel','kuhn.jaylon@example.net','+15075128405','NC','Pennsylvania','South Lesleymouth','83316 Spencer Isle Suite 228',11,1,'2022-12-12 17:34:32','2022-12-12 17:34:32','13685-8172');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

DROP TABLE IF EXISTS `ec_customer_recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_recently_viewed_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_recently_viewed_products`
--

LOCK TABLES `ec_customer_recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'John Smith','john.smith@botble.com','$2y$10$P71zUhdgPmcSPKEczGkOWe6rLJqV9m2X9Gv6lxVUpN0s5q8HKqbEO','customers/1.jpg','1979-11-13','+13644544849',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(2,'Mateo Towne','florida.gerlach@example.net','$2y$10$kcuSpLkiBF5JrVR.ey8jP.ysVqxXDhefHPE84btoR/yTInZc5ZlA6','customers/1.jpg','1990-11-16','+16157487365',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(3,'Felicia Emmerich DDS','ardith.smith@example.org','$2y$10$kOeJ6C7IGXD4xKP4.Jl2nuNvRJimGySs9EcB8CKNBPW96gUJvImSq','customers/2.jpg','1977-11-23','+15393170571',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(4,'Julia Larkin','witting.roxanne@example.com','$2y$10$MWVX8ftcv81mhRYn51BCoOSo7NSdBd7ss1FDJTkNl0Ttj7WnIp386','customers/3.jpg','1984-12-08','+16283120860',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(5,'Caesar Cremin','daniel.otilia@example.com','$2y$10$JGROqabs8qvSKcs1jcPY0uKnkcAkjOXOsmsycFcUXJiCHUxKgAK26','customers/4.jpg','1974-11-22','+14632959753',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(6,'Alex Emard Sr.','shoeger@example.net','$2y$10$nOXnkrkhqGJEJC6T3D9peO5SU7Dx3J9nZxTrLl324kWeIiIzsgdjK','customers/5.jpg','1975-11-21','+18182987353',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(7,'Mr. Miller Schmidt','prince48@example.net','$2y$10$ihNyGF.H1IC0t5BQyxwI4uARd.602BSn.4vOejCdWwC0csV2JQnam','customers/6.jpg','1980-12-06','+17574218082',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(8,'Miss Meagan Gutkowski Jr.','alize.veum@example.com','$2y$10$Xq67t8SktQdVz97nICeLPe1AjzP2WMkrdtEz3rYo/jW7tfs6eTNRq','customers/7.jpg','1978-11-27','+18508722995',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(9,'Theresa West II','dickens.fabiola@example.net','$2y$10$WMfI8uw7eORMqikIXdn3MOWOa5CDsLm1GYg0myFaA15XcX1AuZTjO','customers/8.jpg','1984-11-17','+15802455335',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(10,'Lawson Ortiz','mateo.fay@example.com','$2y$10$aAIXfBSv8g1dG5K.8ezLf.rc6xJMYx3zmgbAhvIipbk5wbrYrIxuu','customers/9.jpg','1978-11-13','+19802147634',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated'),(11,'Mr. Jaron Robel','kuhn.jaylon@example.net','$2y$10$89WpAcVkiO5PFesyTxrvh.gZEeqhuRGm9FL9erldDGc3UjtFhHm72','customers/10.jpg','1973-11-14','+16787192366',NULL,'2022-12-12 17:34:32','2022-12-12 17:34:32','2022-12-13 00:34:32',NULL,'activated');
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` int unsigned NOT NULL,
  `product_collection_id` int unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `sold` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,3,267.6,18,4),(2,24,43.6254,13,3);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'Deal of the Day.','2023-01-16 00:00:00','published','2022-12-12 17:34:36','2022-12-12 17:34:36'),(2,'Gadgets & Accessories','2023-01-02 00:00:00','published','2022-12-12 17:34:36','2022-12-12 17:34:36');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
INSERT INTO `ec_flash_sales_translations` VALUES ('vi',1,'Khuyến mãi trong ngày.'),('vi',2,'Tiện ích & Phụ kiện');
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value`
--

DROP TABLE IF EXISTS `ec_global_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value` (
  `option_id` bigint NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value`
--

LOCK TABLES `ec_global_option_value` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value` DISABLE KEYS */;
INSERT INTO `ec_global_option_value` VALUES (1,'1 Year',0,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(1,'2 Year',10,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(1,'3 Year',20,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'4GB',0,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'8GB',10,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'16GB',20,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'Core i5',0,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'Core i7',10,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'Core i9',20,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,'128GB',0,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,'256GB',10,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,'512GB',20,9999,0,'2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `ec_global_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options`
--

DROP TABLE IF EXISTS `ec_global_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options`
--

LOCK TABLES `ec_global_options` WRITE;
/*!40000 ALTER TABLE `ec_global_options` DISABLE KEYS */;
INSERT INTO `ec_global_options` VALUES (1,'Warranty','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'RAM','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'CPU','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,'HDD','Botble\\Ecommerce\\Option\\OptionType\\Dropdown',0,'2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `ec_global_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `fixed_qty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoice_items`
--

DROP TABLE IF EXISTS `ec_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoice_items`
--

LOCK TABLES `ec_invoice_items` WRITE;
/*!40000 ALTER TABLE `ec_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoices`
--

DROP TABLE IF EXISTS `ec_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_id` int unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_invoices_code_unique` (`code`),
  KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ec_invoices_payment_id_index` (`payment_id`),
  KEY `ec_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoices`
--

LOCK TABLES `ec_invoices` WRITE;
/*!40000 ALTER TABLE `ec_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value`
--

DROP TABLE IF EXISTS `ec_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value` (
  `option_id` bigint NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value`
--

LOCK TABLES `ec_option_value` WRITE;
/*!40000 ALTER TABLE `ec_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options`
--

DROP TABLE IF EXISTS `ec_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'option type',
  `product_id` bigint NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '9999',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options`
--

LOCK TABLES `ec_options` WRITE;
/*!40000 ALTER TABLE `ec_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping_address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
INSERT INTO `ec_order_addresses` VALUES (1,'Theresa West II','+14799002011','dickens.fabiola@example.net','PF','Missouri','Cormierview','28126 Erika Square',1,'39997','shipping_address'),(2,'Miss Meagan Gutkowski Jr.','+18032029875','alize.veum@example.com','KI','Florida','Deondreland','563 Eichmann Mission',2,'14903','shipping_address'),(3,'Miss Meagan Gutkowski Jr.','+18032029875','alize.veum@example.com','KI','Florida','Deondreland','563 Eichmann Mission',3,'14903','shipping_address'),(4,'Julia Larkin','+14309279065','witting.roxanne@example.com','CI','Michigan','Grahamfurt','8297 Bret Branch',4,'79659-4284','shipping_address'),(5,'Lawson Ortiz','+16699855280','mateo.fay@example.com','CD','Hawaii','East Freida','492 Jake Light Apt. 652',5,'36402-8430','shipping_address'),(6,'Felicia Emmerich DDS','+18725019481','ardith.smith@example.org','PY','Illinois','North Octaviaton','19932 Vicky Shore',6,'43536','shipping_address'),(7,'Mr. Jaron Robel','+15075128405','kuhn.jaylon@example.net','NC','Pennsylvania','South Lesleymouth','83316 Spencer Isle Suite 228',7,'13685-8172','shipping_address'),(8,'John Smith','+13807579991','john.smith@botble.com','AF','Mississippi','Mantestad','840 Leffler Falls',8,'41469-9183','shipping_address'),(9,'Caesar Cremin','+19207907294','daniel.otilia@example.com','BO','Pennsylvania','East Reva','5958 Tremblay Rest Apt. 170',9,'18108-0947','shipping_address'),(10,'Julia Larkin','+14309279065','witting.roxanne@example.com','CI','Michigan','Grahamfurt','8297 Bret Branch',10,'79659-4284','shipping_address'),(11,'John Smith','+13807579991','john.smith@botble.com','AF','Mississippi','Mantestad','840 Leffler Falls',11,'41469-9183','shipping_address'),(12,'Lawson Ortiz','+16699855280','mateo.fay@example.com','CD','Hawaii','East Freida','492 Jake Light Apt. 652',12,'36402-8430','shipping_address'),(13,'Felicia Emmerich DDS','+18725019481','ardith.smith@example.org','PY','Illinois','North Octaviaton','19932 Vicky Shore',13,'43536','shipping_address'),(14,'Alex Emard Sr.','+12704663998','shoeger@example.net','CM','Oregon','West Terrance','45095 Howe Wells Suite 217',14,'11038-2736','shipping_address'),(15,'Mateo Towne','+13464677779','florida.gerlach@example.net','VE','Virginia','Port Sheaview','1291 Alan Islands',15,'91405','shipping_address'),(16,'Miss Meagan Gutkowski Jr.','+18032029875','alize.veum@example.com','KI','Florida','Deondreland','563 Eichmann Mission',16,'14903','shipping_address'),(17,'Mr. Miller Schmidt','+18303224812','prince48@example.net','JO','Florida','South Candida','47992 Oswald Light',17,'61188-9168','shipping_address'),(18,'Felicia Emmerich DDS','+18725019481','ardith.smith@example.org','PY','Illinois','North Octaviaton','19932 Vicky Shore',18,'43536','shipping_address'),(19,'Alex Emard Sr.','+12704663998','shoeger@example.net','CM','Oregon','West Terrance','45095 Howe Wells Suite 217',19,'11038-2736','shipping_address'),(20,'Mateo Towne','+13464677779','florida.gerlach@example.net','VE','Virginia','Port Sheaview','1291 Alan Islands',20,'91405','shipping_address');
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
INSERT INTO `ec_order_histories` VALUES (1,'create_order_from_seeder','Order is created from the checkout page',NULL,1,NULL,'2022-12-09 09:34:36','2022-12-09 09:34:36'),(2,'confirm_order','Order was verified by %user_name%',0,1,NULL,'2022-12-09 09:34:36','2022-12-09 09:34:36'),(3,'confirm_payment','Payment was confirmed (amount $1,277.20) by %user_name%',0,1,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(4,'create_shipment','Created shipment for order',0,1,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(5,'create_order_from_seeder','Order is created from the checkout page',NULL,2,NULL,'2022-12-04 19:34:36','2022-12-04 19:34:36'),(6,'confirm_order','Order was verified by %user_name%',0,2,NULL,'2022-12-04 19:34:36','2022-12-04 19:34:36'),(7,'create_shipment','Created shipment for order',0,2,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(8,'create_order_from_seeder','Order is created from the checkout page',NULL,3,NULL,'2022-11-27 17:34:36','2022-11-27 17:34:36'),(9,'confirm_order','Order was verified by %user_name%',0,3,NULL,'2022-11-27 17:34:36','2022-11-27 17:34:36'),(10,'create_shipment','Created shipment for order',0,3,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(11,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,3,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(12,'create_order_from_seeder','Order is created from the checkout page',NULL,4,NULL,'2022-12-09 21:34:36','2022-12-09 21:34:36'),(13,'confirm_order','Order was verified by %user_name%',0,4,NULL,'2022-12-09 21:34:36','2022-12-09 21:34:36'),(14,'confirm_payment','Payment was confirmed (amount $336.90) by %user_name%',0,4,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(15,'create_shipment','Created shipment for order',0,4,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(16,'create_order_from_seeder','Order is created from the checkout page',NULL,5,NULL,'2022-12-02 01:34:36','2022-12-02 01:34:36'),(17,'confirm_order','Order was verified by %user_name%',0,5,NULL,'2022-12-02 01:34:36','2022-12-02 01:34:36'),(18,'create_shipment','Created shipment for order',0,5,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(19,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,5,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(20,'create_order_from_seeder','Order is created from the checkout page',NULL,6,NULL,'2022-12-03 23:34:36','2022-12-03 23:34:36'),(21,'confirm_order','Order was verified by %user_name%',0,6,NULL,'2022-12-03 23:34:36','2022-12-03 23:34:36'),(22,'confirm_payment','Payment was confirmed (amount $694.40) by %user_name%',0,6,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(23,'create_shipment','Created shipment for order',0,6,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(24,'create_order_from_seeder','Order is created from the checkout page',NULL,7,NULL,'2022-12-03 09:34:36','2022-12-03 09:34:36'),(25,'confirm_order','Order was verified by %user_name%',0,7,NULL,'2022-12-03 09:34:36','2022-12-03 09:34:36'),(26,'create_shipment','Created shipment for order',0,7,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(27,'create_order_from_seeder','Order is created from the checkout page',NULL,8,NULL,'2022-12-10 13:34:36','2022-12-10 13:34:36'),(28,'confirm_order','Order was verified by %user_name%',0,8,NULL,'2022-12-10 13:34:36','2022-12-10 13:34:36'),(29,'confirm_payment','Payment was confirmed (amount $1,320.20) by %user_name%',0,8,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(30,'create_shipment','Created shipment for order',0,8,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(31,'create_order_from_seeder','Order is created from the checkout page',NULL,9,NULL,'2022-12-03 17:34:36','2022-12-03 17:34:36'),(32,'confirm_order','Order was verified by %user_name%',0,9,NULL,'2022-12-03 17:34:36','2022-12-03 17:34:36'),(33,'confirm_payment','Payment was confirmed (amount $339.00) by %user_name%',0,9,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(34,'create_shipment','Created shipment for order',0,9,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(35,'create_order_from_seeder','Order is created from the checkout page',NULL,10,NULL,'2022-12-08 03:34:36','2022-12-08 03:34:36'),(36,'confirm_order','Order was verified by %user_name%',0,10,NULL,'2022-12-08 03:34:36','2022-12-08 03:34:36'),(37,'confirm_payment','Payment was confirmed (amount $686.95) by %user_name%',0,10,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(38,'create_shipment','Created shipment for order',0,10,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(39,'create_order_from_seeder','Order is created from the checkout page',NULL,11,NULL,'2022-12-07 17:34:36','2022-12-07 17:34:36'),(40,'confirm_order','Order was verified by %user_name%',0,11,NULL,'2022-12-07 17:34:36','2022-12-07 17:34:36'),(41,'confirm_payment','Payment was confirmed (amount $1,016.60) by %user_name%',0,11,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(42,'create_shipment','Created shipment for order',0,11,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(43,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,11,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(44,'create_order_from_seeder','Order is created from the checkout page',NULL,12,NULL,'2022-12-11 23:34:36','2022-12-11 23:34:36'),(45,'confirm_order','Order was verified by %user_name%',0,12,NULL,'2022-12-11 23:34:36','2022-12-11 23:34:36'),(46,'create_shipment','Created shipment for order',0,12,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(47,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,12,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(48,'create_order_from_seeder','Order is created from the checkout page',NULL,13,NULL,'2022-12-06 01:34:36','2022-12-06 01:34:36'),(49,'confirm_order','Order was verified by %user_name%',0,13,NULL,'2022-12-06 01:34:36','2022-12-06 01:34:36'),(50,'confirm_payment','Payment was confirmed (amount $683.40) by %user_name%',0,13,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(51,'create_shipment','Created shipment for order',0,13,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(52,'create_order_from_seeder','Order is created from the checkout page',NULL,14,NULL,'2022-12-08 15:34:36','2022-12-08 15:34:36'),(53,'confirm_order','Order was verified by %user_name%',0,14,NULL,'2022-12-08 15:34:36','2022-12-08 15:34:36'),(54,'confirm_payment','Payment was confirmed (amount $469.00) by %user_name%',0,14,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(55,'create_shipment','Created shipment for order',0,14,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(56,'create_order_from_seeder','Order is created from the checkout page',NULL,15,NULL,'2022-12-08 05:34:36','2022-12-08 05:34:36'),(57,'confirm_order','Order was verified by %user_name%',0,15,NULL,'2022-12-08 05:34:36','2022-12-08 05:34:36'),(58,'create_shipment','Created shipment for order',0,15,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(59,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,15,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(60,'create_order_from_seeder','Order is created from the checkout page',NULL,16,NULL,'2022-12-08 13:34:36','2022-12-08 13:34:36'),(61,'confirm_order','Order was verified by %user_name%',0,16,NULL,'2022-12-08 13:34:36','2022-12-08 13:34:36'),(62,'confirm_payment','Payment was confirmed (amount $1,010.60) by %user_name%',0,16,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(63,'create_shipment','Created shipment for order',0,16,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(64,'create_order_from_seeder','Order is created from the checkout page',NULL,17,NULL,'2022-12-09 09:34:36','2022-12-09 09:34:36'),(65,'confirm_order','Order was verified by %user_name%',0,17,NULL,'2022-12-09 09:34:36','2022-12-09 09:34:36'),(66,'confirm_payment','Payment was confirmed (amount $857.00) by %user_name%',0,17,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(67,'create_shipment','Created shipment for order',0,17,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(68,'create_order_from_seeder','Order is created from the checkout page',NULL,18,NULL,'2022-12-11 17:34:36','2022-12-11 17:34:36'),(69,'confirm_order','Order was verified by %user_name%',0,18,NULL,'2022-12-11 17:34:36','2022-12-11 17:34:36'),(70,'confirm_payment','Payment was confirmed (amount $740.90) by %user_name%',0,18,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(71,'create_shipment','Created shipment for order',0,18,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(72,'create_order_from_seeder','Order is created from the checkout page',NULL,19,NULL,'2022-12-11 05:34:36','2022-12-11 05:34:36'),(73,'confirm_order','Order was verified by %user_name%',0,19,NULL,'2022-12-11 05:34:36','2022-12-11 05:34:36'),(74,'create_shipment','Created shipment for order',0,19,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(75,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,19,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(76,'create_order_from_seeder','Order is created from the checkout page',NULL,20,NULL,'2022-12-12 13:34:36','2022-12-12 13:34:36'),(77,'confirm_order','Order was verified by %user_name%',0,20,NULL,'2022-12-12 13:34:36','2022-12-12 13:34:36'),(78,'confirm_payment','Payment was confirmed (amount $702.10) by %user_name%',0,20,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(79,'create_shipment','Created shipment for order',0,20,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(80,'update_status','Order confirmed by %user_name%',0,11,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37');
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_options` text COLLATE utf8mb4_unicode_ci COMMENT 'product option data',
  `product_id` int unsigned DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `times_downloaded` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
INSERT INTO `ec_order_product` VALUES (1,1,3,111.00,11.10,'[]',NULL,67,'Hand playstation',NULL,2352.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(2,1,3,122.00,12.20,'[]',NULL,85,'Black Glasses',NULL,2529.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(3,1,3,119.00,11.90,'[]',NULL,91,'Gaming Keyboard',NULL,2694.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(4,1,3,60.00,6.00,'[]',NULL,102,'Audio Equipment (Digital)',NULL,2316.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(5,2,1,120.00,12.00,'[]',NULL,54,'Macbook Pro 2015 (Digital)',NULL,877.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(6,2,1,399.00,39.90,'[]',NULL,56,'Macbook Air 12 inch',NULL,679.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(7,2,3,112.00,11.20,'[]',NULL,70,'Apple Airpods Serial 3',NULL,2361.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(8,2,3,127.00,12.70,'[]',NULL,75,'Black Smart Watches',NULL,2523.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(9,3,2,60.00,6.00,'[]',NULL,47,'Camera Samsung SS-24',NULL,1070.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(10,3,2,124.00,12.40,'[]',NULL,66,'MacSafe 80W',NULL,1560.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(11,3,2,58.00,5.80,'[]',NULL,109,'Samsung Smart TV',NULL,1542.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(12,3,1,58.00,5.80,'[]',NULL,110,'Samsung Smart TV',NULL,771.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(13,4,2,129.00,12.90,'[]',NULL,83,'Historic Alarm Clock (Digital)',NULL,1534.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(14,4,1,60.00,6.00,'[]',NULL,105,'Audio Equipment (Digital)',NULL,772.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(15,5,2,472.00,47.20,'[]',NULL,32,'Smart Home Speaker (Digital)',NULL,1438.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(16,5,1,446.00,44.60,'[]',NULL,40,'Boxed - Bluetooth Headphone',NULL,676.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(17,6,3,112.00,11.20,'[]',NULL,60,'Macbook Pro 13 inch',NULL,1746.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(18,6,3,112.00,11.20,'[]',NULL,69,'Apple Airpods Serial 3',NULL,2361.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(19,7,3,111.00,11.10,'[]',NULL,67,'Hand playstation',NULL,2352.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(20,7,1,122.00,12.20,'[]',NULL,86,'Black Glasses',NULL,843.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(21,7,1,128.00,12.80,'[]',NULL,88,'Phillips Mouse',NULL,566.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(22,7,2,60.00,6.00,'[]',NULL,103,'Audio Equipment (Digital)',NULL,1544.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(23,8,2,446.00,44.60,'[]',NULL,39,'Boxed - Bluetooth Headphone',NULL,1352.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(24,8,2,124.00,12.40,'[]',NULL,63,'MacSafe 80W',NULL,1560.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(25,8,1,112.00,11.20,'[]',NULL,70,'Apple Airpods Serial 3',NULL,787.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(26,9,2,130.00,13.00,'[]',NULL,50,'Apple iPhone 13 Plus',NULL,1084.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(27,9,1,60.00,6.00,'[]',NULL,102,'Audio Equipment (Digital)',NULL,772.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(28,10,3,130.00,13.00,'[]',NULL,50,'Apple iPhone 13 Plus',NULL,1626.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(29,10,2,114.00,11.40,'[]',NULL,78,'Leather Watch Band Serial 3',NULL,1794.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(30,10,1,40.50,4.05,'[]',NULL,97,'Smart Watches',NULL,643.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(31,11,1,60.00,6.00,'[]',NULL,46,'Camera Samsung SS-24',NULL,535.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(32,11,1,399.00,39.90,'[]',NULL,55,'Macbook Air 12 inch',NULL,679.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(33,11,1,127.00,12.70,'[]',NULL,74,'Black Smart Watches',NULL,841.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(34,11,3,120.00,12.00,'[]',NULL,106,'Smart Televisions',NULL,2181.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(35,12,2,112.00,11.20,'[]',NULL,59,'Macbook Pro 13 inch',NULL,1164.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(36,12,3,112.00,11.20,'[]',NULL,60,'Macbook Pro 13 inch',NULL,1746.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(37,13,1,114.00,11.40,'[]',NULL,77,'Leather Watch Band Serial 3',NULL,897.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(38,13,3,122.00,12.20,'[]',NULL,85,'Black Glasses',NULL,2529.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(39,13,3,58.00,5.80,'[]',NULL,109,'Samsung Smart TV',NULL,2313.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(40,14,3,112.00,11.20,'[]',NULL,58,'Macbook Pro 13 inch',NULL,1746.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(41,14,2,58.00,5.80,'[]',NULL,110,'Samsung Smart TV',NULL,1542.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(42,15,2,47.00,4.70,'[]',NULL,45,'Camera Hikvision HK-35VS8 (Digital)',NULL,1004.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(43,15,3,117.00,11.70,'[]',NULL,49,'Leather Watch Band',NULL,2247.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(44,15,2,60.00,6.00,'[]',NULL,104,'Audio Equipment (Digital)',NULL,1544.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(45,16,3,79.00,7.90,'[]',NULL,41,'Chikie - Bluetooth Speaker',NULL,2613.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(46,16,3,128.00,12.80,'[]',NULL,88,'Phillips Mouse',NULL,1698.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(47,16,3,119.00,11.90,'[]',NULL,93,'Gaming Keyboard',NULL,2694.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(48,17,3,112.00,11.20,'[]',NULL,59,'Macbook Pro 13 inch',NULL,1746.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(49,17,3,124.00,12.40,'[]',NULL,66,'MacSafe 80W',NULL,2340.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(50,17,1,114.00,11.40,'[]',NULL,80,'Macbook Pro 2015 13 inch',NULL,832.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(51,18,3,112.00,11.20,'[]',NULL,69,'Apple Airpods Serial 3',NULL,2361.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(52,18,3,127.00,12.70,'[]',NULL,73,'Black Smart Watches',NULL,2523.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(53,19,2,129.00,12.90,'[]',NULL,82,'Historic Alarm Clock (Digital)',NULL,1534.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(54,19,3,40.50,4.05,'[]',NULL,95,'Smart Watches',NULL,1929.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(55,19,3,40.50,4.05,'[]',NULL,96,'Smart Watches',NULL,1929.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(56,19,2,55.00,5.50,'[]',NULL,100,'Red & Black Headphone',NULL,1440.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(57,20,2,47.00,4.70,'[]',NULL,45,'Camera Hikvision HK-35VS8 (Digital)',NULL,1004.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(58,20,2,122.00,12.20,'[]',NULL,61,'Apple Keyboard (Digital)',NULL,1306.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0),(59,20,3,112.00,11.20,'[]',NULL,69,'Apple Airpods Serial 3',NULL,2361.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','physical',0);
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_referrals`
--

DROP TABLE IF EXISTS `ec_order_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_referrals_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_referrals`
--

LOCK TABLES `ec_order_referrals` WRITE;
/*!40000 ALTER TABLE `ec_order_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_items`
--

DROP TABLE IF EXISTS `ec_order_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_return_id` int unsigned NOT NULL COMMENT 'Order return id',
  `order_product_id` int unsigned NOT NULL COMMENT 'Order product id',
  `product_id` int unsigned NOT NULL COMMENT 'Product id',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_items`
--

LOCK TABLES `ec_order_return_items` WRITE;
/*!40000 ALTER TABLE `ec_order_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_returns`
--

DROP TABLE IF EXISTS `ec_order_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `store_id` int unsigned DEFAULT NULL COMMENT 'Store ID',
  `user_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Reason return order',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_returns_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_returns`
--

LOCK TABLES `ec_order_returns` WRITE;
/*!40000 ALTER TABLE `ec_order_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_code_unique` (`code`),
  KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
INSERT INTO `ec_orders` VALUES (1,'#10000001',9,'1','default','pending',1277.20,41.20,0.00,NULL,NULL,0.00,1236.00,1,NULL,1,NULL,'oGsFr7jENeg4aelQEdYcO9cTDN3Q0',1,'2022-12-09 09:34:36','2022-12-12 17:34:36'),(2,'#10000002',8,'1','default','pending',1311.80,75.80,0.00,NULL,NULL,0.00,1236.00,1,NULL,1,NULL,'ng5fKiITT3WY7ES64UyCLnzxAGOg2',2,'2022-12-04 19:34:36','2022-12-12 17:34:36'),(3,'#10000003',8,'1','default','completed',572.00,30.00,0.00,NULL,NULL,0.00,542.00,1,NULL,1,'2022-12-12 17:34:36','9xF7A5oaqwwPfOJbxT54BI4y8kcv1',3,'2022-11-27 17:34:36','2022-12-12 17:34:36'),(4,'#10000004',4,'1','default','pending',336.90,18.90,0.00,NULL,NULL,0.00,318.00,1,NULL,1,NULL,'ouHSOdghGNQaEmbOTYCRKuDRWXKVf',4,'2022-12-09 21:34:36','2022-12-12 17:34:36'),(5,'#10000005',10,'1','default','completed',1481.80,91.80,0.00,NULL,NULL,0.00,1390.00,1,NULL,1,'2022-12-12 17:34:36','vivedhQegkl0wP80ccZS3Ng4Xv0Mx',5,'2022-12-02 01:34:36','2022-12-12 17:34:36'),(6,'#10000006',3,'1','default','pending',694.40,22.40,0.00,NULL,NULL,0.00,672.00,1,NULL,1,NULL,'Qi67yOW0K0t441OETMXRYrySOE68F',6,'2022-12-03 23:34:36','2022-12-12 17:34:36'),(7,'#10000007',11,'1','default','pending',745.10,42.10,0.00,NULL,NULL,0.00,703.00,1,NULL,1,NULL,'8euhpYLGTQDYJZNrgTZcaO9CDcJ9q',7,'2022-12-03 09:34:36','2022-12-12 17:34:36'),(8,'#10000008',1,'1','default','pending',1320.20,68.20,0.00,NULL,NULL,0.00,1252.00,1,NULL,1,NULL,'Y574fbC0NqpcxuGYzSx42E206RDbP',8,'2022-12-10 13:34:36','2022-12-12 17:34:36'),(9,'#10000009',5,'1','default','pending',339.00,19.00,0.00,NULL,NULL,0.00,320.00,1,NULL,1,NULL,'FvXqeVVNvM1VGcs2JFDe0DiZXAoMb',9,'2022-12-03 17:34:36','2022-12-12 17:34:36'),(10,'#10000010',4,'1','default','pending',686.95,28.45,0.00,NULL,NULL,0.00,658.50,1,NULL,1,NULL,'w32wVuhBaGAnXkpIetO9tSW9kMW5J',10,'2022-12-08 03:34:36','2022-12-12 17:34:36'),(11,'#10000011',1,'1','default','completed',1016.60,70.60,0.00,NULL,NULL,0.00,946.00,1,NULL,1,'2022-12-12 17:34:37','23MNs64LrEzQBvZ935OqbvVuOZ6h1',11,'2022-12-07 17:34:36','2022-12-12 17:34:37'),(12,'#10000012',10,'1','default','completed',582.40,22.40,0.00,NULL,NULL,0.00,560.00,1,NULL,1,'2022-12-12 17:34:36','JLpcRai8xedCzURHHv7wW1G9PkcDc',12,'2022-12-11 23:34:36','2022-12-12 17:34:36'),(13,'#10000013',3,'1','default','pending',683.40,29.40,0.00,NULL,NULL,0.00,654.00,1,NULL,1,NULL,'XMVaPoezwVaKYfgTcBjvOsXjQNxpQ',13,'2022-12-06 01:34:36','2022-12-12 17:34:36'),(14,'#10000014',6,'1','default','pending',469.00,17.00,0.00,NULL,NULL,0.00,452.00,1,NULL,1,NULL,'MzjOYhn3woC4dQ9EyZav6iv7TNVNa',14,'2022-12-08 15:34:36','2022-12-12 17:34:36'),(15,'#10000015',2,'1','default','completed',587.40,22.40,0.00,NULL,NULL,0.00,565.00,1,NULL,1,'2022-12-12 17:34:36','8HgBfILKYznxVLscwOxfYsvmtQukP',15,'2022-12-08 05:34:36','2022-12-12 17:34:36'),(16,'#10000016',8,'1','default','pending',1010.60,32.60,0.00,NULL,NULL,0.00,978.00,1,NULL,1,NULL,'rXJgtGXOmJwdXF59amW2ISsPJS78i',16,'2022-12-08 13:34:36','2022-12-12 17:34:36'),(17,'#10000017',7,'1','default','pending',857.00,35.00,0.00,NULL,NULL,0.00,822.00,1,NULL,1,NULL,'uEBeZMmBjcNfz8eRvRrko3mc2XcRa',17,'2022-12-09 09:34:36','2022-12-12 17:34:36'),(18,'#10000018',3,'1','default','pending',740.90,23.90,0.00,NULL,NULL,0.00,717.00,1,NULL,1,NULL,'DGfeAmKf5gSLZf6hFpsC3q03KWlWM',18,'2022-12-11 17:34:36','2022-12-12 17:34:36'),(19,'#10000019',6,'1','default','completed',637.50,26.50,0.00,NULL,NULL,0.00,611.00,1,NULL,1,'2022-12-12 17:34:36','iyO4YGqjfARJ9sh9XX95NTLC6pClB',19,'2022-12-11 05:34:36','2022-12-12 17:34:36'),(20,'#10000020',2,'1','default','pending',702.10,28.10,0.00,NULL,NULL,0.00,674.00,1,NULL,1,NULL,'sNeKzRRYKj7gOqwrvuf1GMVkyC50o',20,'2022-12-12 13:34:36','2022-12-12 17:34:37');
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_comparable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2022-12-12 17:34:31','2022-12-12 17:34:31',1),(2,'Size','size','text',1,1,1,'published',1,'2022-12-12 17:34:31','2022-12-12 17:34:31',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets_translations` VALUES ('vi',1,'Màu sắc'),('vi',2,'Kích thước');
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_attributes_attribute_set_id_status_index` (`attribute_set_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'Green','green','#5FB7D4',NULL,1,1,'published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(2,1,'Blue','blue','#333333',NULL,0,2,'published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(3,1,'Red','red','#DA323F',NULL,0,3,'published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(4,1,'Black','back','#2F366C',NULL,0,4,'published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(5,1,'Brown','brown','#87554B',NULL,0,5,'published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(6,2,'S','s',NULL,NULL,1,1,'published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(7,2,'M','m',NULL,NULL,0,2,'published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(8,2,'L','l',NULL,NULL,0,3,'published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(9,2,'XL','xl',NULL,NULL,0,4,'published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(10,2,'XXL','xxl',NULL,NULL,0,5,'published','2022-12-12 17:34:31','2022-12-12 17:34:31');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attributes_translations` VALUES ('vi',1,'Xanh lá cây'),('vi',2,'Xanh da trời'),('vi',3,'Đỏ'),('vi',4,'Đen'),('vi',5,'Nâu'),('vi',6,'S'),('vi',7,'M'),('vi',8,'L'),('vi',9,'XL'),('vi',10,'XXL');
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Television',0,NULL,'published',0,'product-categories/p-1.png',1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(2,'Home Audio & Theaters',1,NULL,'published',0,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(3,'TV & Videos',1,NULL,'published',1,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(4,'Camera, Photos & Videos',1,NULL,'published',2,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(5,'Cellphones & Accessories',1,NULL,'published',3,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(6,'Headphones',1,NULL,'published',4,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(7,'Videos games',1,NULL,'published',5,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(8,'Wireless Speakers',1,NULL,'published',6,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(9,'Office Electronic',1,NULL,'published',7,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(10,'Mobile',0,NULL,'published',1,'product-categories/p-2.png',1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(11,'Digital Cables',10,NULL,'published',0,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(12,'Audio & Video Cables',10,NULL,'published',1,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(13,'Batteries',10,NULL,'published',2,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(14,'Headphone',0,NULL,'published',2,'product-categories/p-3.png',1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(15,'Computer & Tablets',14,NULL,'published',0,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(16,'Laptop',14,NULL,'published',1,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(17,'Monitors',14,NULL,'published',2,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(18,'Computer Components',14,NULL,'published',3,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(19,'Watches',0,NULL,'published',3,'product-categories/p-4.png',1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(20,'Drive & Storages',19,NULL,'published',0,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(21,'Gaming Laptop',19,NULL,'published',1,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(22,'Security & Protection',19,NULL,'published',2,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(23,'Accessories',19,NULL,'published',3,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(24,'Game',0,NULL,'published',4,'product-categories/p-5.png',1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(25,'Camera',0,NULL,'published',5,'product-categories/p-6.png',1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(26,'Audio',0,NULL,'published',6,'product-categories/p-7.png',1,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(27,'Mobile & Tablet',0,NULL,'published',7,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(28,'Accessories',0,NULL,'published',8,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(29,'Home Audio & Theater',0,NULL,'published',9,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(30,'Tv & Smart Box',0,NULL,'published',10,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(31,'Printer',0,NULL,'published',11,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(32,'Computer',0,NULL,'published',12,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(33,'Fax Machine',0,NULL,'published',13,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31'),(34,'Mouse',0,NULL,'published',14,NULL,0,'2022-12-12 17:34:31','2022-12-12 17:34:31');
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
INSERT INTO `ec_product_categories_translations` VALUES ('vi',1,'Tivi',NULL),('vi',2,'Home Audio & Theaters',NULL),('vi',3,'TV & Videos',NULL),('vi',4,'Camera, Photos & Videos',NULL),('vi',5,'Cellphones & Accessories',NULL),('vi',6,'Headphones',NULL),('vi',7,'Videos games',NULL),('vi',8,'Wireless Speakers',NULL),('vi',9,'Office Electronic',NULL),('vi',10,'Di động',NULL),('vi',11,'Digital Cables',NULL),('vi',12,'Audio & Video Cables',NULL),('vi',13,'Batteries',NULL),('vi',14,'Tai nghe',NULL),('vi',15,'Computer & Tablets',NULL),('vi',16,'Laptop',NULL),('vi',17,'Monitors',NULL),('vi',18,'Computer Components',NULL),('vi',19,'Đồng hồ',NULL),('vi',20,'Drive & Storages',NULL),('vi',21,'Gaming Laptop',NULL),('vi',22,'Security & Protection',NULL),('vi',23,'Accessories',NULL),('vi',24,'Trò chơi',NULL),('vi',25,'Máy ảnh',NULL),('vi',26,'Âm thanh',NULL),('vi',27,'Di động & Máy tính bảng',NULL),('vi',28,'Phụ kiện',NULL),('vi',29,'Âm thanh & hình ảnh',NULL),('vi',30,'Tv & Smart Box',NULL),('vi',31,'Máy in',NULL),('vi',32,'Máy tính',NULL),('vi',33,'Máy Fax',NULL),('vi',34,'Chuột máy tính',NULL);
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_category_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (1,3,1),(2,10,2),(3,10,3),(4,4,4),(5,5,5),(6,14,6),(7,6,7),(8,11,8),(9,2,9),(10,7,10),(11,14,11),(12,11,12),(13,6,13),(14,5,14),(15,7,15),(16,11,16),(17,4,17),(18,7,18),(19,13,19),(20,2,20),(21,6,21),(22,5,22),(23,5,23),(24,14,24),(25,14,25),(26,13,26),(27,11,27),(28,4,28),(29,6,29),(30,13,30),(31,3,31);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collection_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_collection_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,1,1),(2,2,2),(3,3,3),(4,1,4),(5,1,5),(6,3,6),(7,2,7),(8,1,8),(9,1,9),(10,2,10),(11,2,11),(12,3,12),(13,2,13),(14,2,14),(15,1,15),(16,1,16),(17,3,17),(18,2,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,2,23),(24,1,24),(25,2,25),(26,2,26),(27,3,27),(28,2,28),(29,3,29),(30,1,30),(31,3,31);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'New Arrival','new-arrival',NULL,NULL,'published','2022-12-12 17:34:31','2022-12-12 17:34:31',0),(2,'Best Sellers','best-sellers',NULL,NULL,'published','2022-12-12 17:34:31','2022-12-12 17:34:31',0),(3,'Special Offer','special-offer',NULL,NULL,'published','2022-12-12 17:34:31','2022-12-12 17:34:31',0);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
INSERT INTO `ec_product_collections_translations` VALUES ('vi',1,'Hàng mới về',NULL),('vi',2,'Bán chạy nhất',NULL),('vi',3,'Khuyến mãi đặc biệt',NULL);
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int unsigned NOT NULL,
  `to_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,1,30),(2,1,7),(3,1,5),(4,1,21),(5,2,5),(6,2,13),(7,2,26),(8,3,2),(9,3,6),(10,3,17),(11,3,23),(12,4,29),(13,4,28),(14,4,18),(15,4,17),(16,5,4),(17,5,10),(18,5,24),(19,5,17),(20,6,25),(21,6,13),(22,6,7),(23,6,24),(24,7,25),(25,7,5),(26,7,15),(27,7,17),(28,8,24),(29,8,9),(30,8,11),(31,8,22),(32,9,18),(33,9,8),(34,9,21),(35,10,16),(36,10,31),(37,10,30),(38,10,18),(39,11,22),(40,11,13),(41,11,14),(42,12,6),(43,12,21),(44,12,7),(45,12,22),(46,13,14),(47,13,15),(48,13,28),(49,13,26),(50,14,19),(51,14,18),(52,14,22),(53,14,29),(54,15,23),(55,15,26),(56,15,24),(57,15,3),(58,16,28),(59,16,24),(60,16,27),(61,16,19),(62,17,29),(63,17,28),(64,17,11),(65,17,3),(66,18,9),(67,18,23),(68,18,15),(69,18,4),(70,19,7),(71,19,30),(72,19,26),(73,19,10),(74,20,28),(75,20,17),(76,20,27),(77,20,31),(78,21,28),(79,21,24),(80,21,7),(81,21,16),(82,22,6),(83,22,2),(84,22,5),(85,22,31),(86,23,6),(87,23,3),(88,23,19),(89,23,8),(90,24,26),(91,24,19),(92,24,17),(93,24,6),(94,25,28),(95,25,15),(96,25,17),(97,25,27),(98,26,11),(99,26,16),(100,26,20),(101,26,10),(102,27,19),(103,27,2),(104,27,30),(105,27,22),(106,28,2),(107,28,9),(108,28,29),(109,29,1),(110,29,14),(111,29,25),(112,29,12),(113,30,6),(114,30,7),(115,30,1),(116,30,21),(117,31,26),(118,31,18),(119,31,30),(120,31,13);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_files`
--

DROP TABLE IF EXISTS `ec_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_files_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_files`
--

LOCK TABLES `ec_product_files` WRITE;
/*!40000 ALTER TABLE `ec_product_files` DISABLE KEYS */;
INSERT INTO `ec_product_files` VALUES (1,32,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(2,32,'product-files/1-1.jpg','{\"filename\":\"1-1.jpg\",\"url\":\"product-files\\/1-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(3,32,'product-files/1-2.jpg','{\"filename\":\"1-2.jpg\",\"url\":\"product-files\\/1-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1-2\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(4,32,'product-files/1-3.jpg','{\"filename\":\"1-3.jpg\",\"url\":\"product-files\\/1-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1-3\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(5,33,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(6,33,'product-files/1-1.jpg','{\"filename\":\"1-1.jpg\",\"url\":\"product-files\\/1-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(7,33,'product-files/1-2.jpg','{\"filename\":\"1-2.jpg\",\"url\":\"product-files\\/1-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1-2\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(8,33,'product-files/1-3.jpg','{\"filename\":\"1-3.jpg\",\"url\":\"product-files\\/1-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1-3\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(9,34,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(10,34,'product-files/1-1.jpg','{\"filename\":\"1-1.jpg\",\"url\":\"product-files\\/1-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(11,34,'product-files/1-2.jpg','{\"filename\":\"1-2.jpg\",\"url\":\"product-files\\/1-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1-2\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(12,34,'product-files/1-3.jpg','{\"filename\":\"1-3.jpg\",\"url\":\"product-files\\/1-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"1-3\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(13,45,'product-files/5.jpg','{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"5\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(14,45,'product-files/5-1.jpg','{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"5-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(15,45,'product-files/5-2.jpg','{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"5-2\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(16,45,'product-files/5-3.jpg','{\"filename\":\"5-3.jpg\",\"url\":\"product-files\\/5-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"5-3\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(17,52,'product-files/9.jpg','{\"filename\":\"9.jpg\",\"url\":\"product-files\\/9.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"9\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(18,52,'product-files/9-1.jpg','{\"filename\":\"9-1.jpg\",\"url\":\"product-files\\/9-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"9-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(19,53,'product-files/9.jpg','{\"filename\":\"9.jpg\",\"url\":\"product-files\\/9.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"9\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(20,53,'product-files/9-1.jpg','{\"filename\":\"9-1.jpg\",\"url\":\"product-files\\/9-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"9-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(21,54,'product-files/9.jpg','{\"filename\":\"9.jpg\",\"url\":\"product-files\\/9.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"9\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(22,54,'product-files/9-1.jpg','{\"filename\":\"9-1.jpg\",\"url\":\"product-files\\/9-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"9-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(23,61,'product-files/13.jpg','{\"filename\":\"13.jpg\",\"url\":\"product-files\\/13.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"13\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(24,61,'product-files/13-1.jpg','{\"filename\":\"13-1.jpg\",\"url\":\"product-files\\/13-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"13-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(25,71,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"17\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(26,72,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"17\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(27,82,'product-files/21.jpg','{\"filename\":\"21.jpg\",\"url\":\"product-files\\/21.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"21\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(28,82,'product-files/21-1.jpg','{\"filename\":\"21-1.jpg\",\"url\":\"product-files\\/21-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"21-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(29,83,'product-files/21.jpg','{\"filename\":\"21.jpg\",\"url\":\"product-files\\/21.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"21\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(30,83,'product-files/21-1.jpg','{\"filename\":\"21-1.jpg\",\"url\":\"product-files\\/21-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"21-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(31,84,'product-files/21.jpg','{\"filename\":\"21.jpg\",\"url\":\"product-files\\/21.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"21\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(32,84,'product-files/21-1.jpg','{\"filename\":\"21-1.jpg\",\"url\":\"product-files\\/21-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"21-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(33,94,'product-files/25.jpg','{\"filename\":\"25.jpg\",\"url\":\"product-files\\/25.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"25\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(34,94,'product-files/25-1.jpg','{\"filename\":\"25-1.jpg\",\"url\":\"product-files\\/25-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"25-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(35,102,'product-files/29.jpg','{\"filename\":\"29.jpg\",\"url\":\"product-files\\/29.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"29\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(36,102,'product-files/29-1.jpg','{\"filename\":\"29-1.jpg\",\"url\":\"product-files\\/29-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"29-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(37,103,'product-files/29.jpg','{\"filename\":\"29.jpg\",\"url\":\"product-files\\/29.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"29\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(38,103,'product-files/29-1.jpg','{\"filename\":\"29-1.jpg\",\"url\":\"product-files\\/29-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"29-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(39,104,'product-files/29.jpg','{\"filename\":\"29.jpg\",\"url\":\"product-files\\/29.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"29\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(40,104,'product-files/29-1.jpg','{\"filename\":\"29-1.jpg\",\"url\":\"product-files\\/29-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"29-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(41,105,'product-files/29.jpg','{\"filename\":\"29.jpg\",\"url\":\"product-files\\/29.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"29\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36'),(42,105,'product-files/29-1.jpg','{\"filename\":\"29-1.jpg\",\"url\":\"product-files\\/29-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-12-13 00:34:36\",\"name\":\"29-1\",\"extension\":\"jpg\"}','2022-12-12 17:34:36','2022-12-12 17:34:36');
/*!40000 ALTER TABLE `ec_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (1,6),(1,12),(1,18),(1,27),(1,30),(2,3),(2,9),(2,15),(2,21),(3,24);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#ec2434','published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(2,'New','#00c9a7','published','2022-12-12 17:34:31','2022-12-12 17:34:31'),(3,'Sale','#fe9931','published','2022-12-12 17:34:31','2022-12-12 17:34:31');
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
INSERT INTO `ec_product_labels_translations` VALUES ('vi',1,'Nổi bật',NULL),('vi',2,'Mới',NULL),('vi',3,'Giảm giá',NULL);
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_related_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int unsigned NOT NULL,
  `to_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
INSERT INTO `ec_product_tag_product` VALUES (1,1),(1,2),(1,5),(2,3),(2,4),(2,6),(3,2),(3,5),(4,3),(4,4),(4,5),(5,2),(5,5),(6,1),(6,3),(6,4),(7,1),(7,2),(7,6),(8,1),(8,3),(8,5),(9,1),(9,6),(10,1),(10,3),(10,6),(11,2),(11,5),(12,1),(12,4),(13,2),(14,3),(14,5),(14,6),(15,1),(15,3),(16,4),(16,5),(16,6),(17,1),(17,2),(18,1),(18,3),(18,5),(19,4),(19,5),(20,3),(20,6),(21,2),(21,5),(21,6),(22,1),(22,2),(22,6),(23,4),(23,6),(24,1),(24,4),(24,6),(25,1),(25,2),(26,1),(26,2),(26,5),(27,2),(28,1),(28,2),(28,4),(29,1),(29,2),(29,4),(30,1),(30,5),(30,6),(31,2),(31,5);
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Electronic',NULL,'published','2022-12-12 17:34:36','2022-12-12 17:34:36'),(2,'Mobile',NULL,'published','2022-12-12 17:34:36','2022-12-12 17:34:36'),(3,'Iphone',NULL,'published','2022-12-12 17:34:36','2022-12-12 17:34:36'),(4,'Printer',NULL,'published','2022-12-12 17:34:36','2022-12-12 17:34:36'),(5,'Office',NULL,'published','2022-12-12 17:34:36','2022-12-12 17:34:36'),(6,'IT',NULL,'published','2022-12-12 17:34:36','2022-12-12 17:34:36');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int unsigned NOT NULL,
  `to_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `variation_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_variation_items_attribute_id_variation_id_index` (`attribute_id`,`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (1,1,1),(5,1,3),(27,1,14),(31,1,16),(33,1,17),(57,1,29),(63,1,32),(69,1,35),(81,1,41),(83,1,42),(85,1,43),(87,1,44),(123,1,62),(129,1,65),(131,1,66),(143,1,72),(3,2,2),(35,2,18),(37,2,19),(45,2,23),(47,2,24),(49,2,25),(53,2,27),(61,2,31),(73,2,37),(101,2,51),(107,2,54),(109,2,55),(115,2,58),(119,2,60),(127,2,64),(141,2,71),(159,2,80),(7,3,4),(9,3,5),(15,3,8),(21,3,11),(29,3,15),(41,3,21),(51,3,26),(65,3,33),(71,3,36),(89,3,45),(93,3,47),(105,3,53),(113,3,57),(117,3,59),(135,3,68),(137,3,69),(147,3,74),(11,4,6),(13,4,7),(17,4,9),(23,4,12),(25,4,13),(43,4,22),(55,4,28),(67,4,34),(75,4,38),(79,4,40),(97,4,49),(99,4,50),(111,4,56),(121,4,61),(125,4,63),(133,4,67),(151,4,76),(155,4,78),(19,5,10),(39,5,20),(59,5,30),(77,5,39),(91,5,46),(95,5,48),(103,5,52),(139,5,70),(145,5,73),(149,5,75),(153,5,77),(157,5,79),(161,5,81),(2,6,1),(8,6,4),(10,6,5),(24,6,12),(28,6,14),(42,6,21),(56,6,28),(66,6,33),(72,6,36),(78,6,39),(80,6,40),(84,6,42),(108,6,54),(124,6,62),(126,6,63),(130,6,65),(138,6,69),(150,6,75),(6,7,3),(12,7,6),(40,7,20),(50,7,25),(64,7,32),(76,7,38),(82,7,41),(96,7,48),(98,7,49),(102,7,51),(104,7,52),(114,7,57),(116,7,58),(128,7,64),(144,7,72),(18,8,9),(32,8,16),(52,8,26),(54,8,27),(62,8,31),(100,8,50),(110,8,55),(112,8,56),(120,8,60),(132,8,66),(134,8,67),(136,8,68),(148,8,74),(152,8,76),(156,8,78),(160,8,80),(162,8,81),(4,9,2),(14,9,7),(16,9,8),(20,9,10),(22,9,11),(26,9,13),(30,9,15),(34,9,17),(38,9,19),(44,9,22),(46,9,23),(60,9,30),(70,9,35),(74,9,37),(86,9,43),(88,9,44),(92,9,46),(94,9,47),(118,9,59),(140,9,70),(142,9,71),(158,9,79),(36,10,18),(48,10,24),(58,10,29),(68,10,34),(90,10,45),(106,10,53),(122,10,61),(146,10,73),(154,10,77);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `configurable_product_id` int unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_product_variations_product_id_configurable_product_id_index` (`product_id`,`configurable_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,32,1,1),(2,33,1,0),(3,34,1,0),(4,35,2,1),(5,36,2,0),(6,37,2,0),(7,38,3,1),(8,39,3,0),(9,40,3,0),(10,41,4,1),(11,42,4,0),(12,43,4,0),(13,44,4,0),(14,45,5,1),(15,46,6,1),(16,47,6,0),(17,48,6,0),(18,49,7,1),(19,50,8,1),(20,51,8,0),(21,52,9,1),(22,53,9,0),(23,54,9,0),(24,55,10,1),(25,56,10,0),(26,57,11,1),(27,58,12,1),(28,59,12,0),(29,60,12,0),(30,61,13,1),(31,62,14,1),(32,63,14,0),(33,64,14,0),(34,65,14,0),(35,66,14,0),(36,67,15,1),(37,68,15,0),(38,69,16,1),(39,70,16,0),(40,71,17,1),(41,72,17,0),(42,73,18,1),(43,74,18,0),(44,75,18,0),(45,76,18,0),(46,77,19,1),(47,78,19,0),(48,79,20,1),(49,80,20,0),(50,81,20,0),(51,82,21,1),(52,83,21,0),(53,84,21,0),(54,85,22,1),(55,86,22,0),(56,87,22,0),(57,88,23,1),(58,89,23,0),(59,90,23,0),(60,91,24,1),(61,92,24,0),(62,93,24,0),(63,94,25,1),(64,95,26,1),(65,96,26,0),(66,97,26,0),(67,98,27,1),(68,99,28,1),(69,100,28,0),(70,101,28,0),(71,102,29,1),(72,103,29,0),(73,104,29,0),(74,105,29,0),(75,106,30,1),(76,107,30,0),(77,108,30,0),(78,109,31,1),(79,110,31,0),(80,111,31,0),(81,112,31,0);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (1,1,1,0),(2,2,1,0),(3,1,2,0),(4,2,2,0),(5,1,3,0),(6,2,3,0),(7,1,4,0),(8,2,4,0),(9,1,5,0),(10,2,5,0),(11,1,6,0),(12,2,6,0),(13,1,7,0),(14,2,7,0),(15,1,8,0),(16,2,8,0),(17,1,9,0),(18,2,9,0),(19,1,10,0),(20,2,10,0),(21,1,11,0),(22,2,11,0),(23,1,12,0),(24,2,12,0),(25,1,13,0),(26,2,13,0),(27,1,14,0),(28,2,14,0),(29,1,15,0),(30,2,15,0),(31,1,16,0),(32,2,16,0),(33,1,17,0),(34,2,17,0),(35,1,18,0),(36,2,18,0),(37,1,19,0),(38,2,19,0),(39,1,20,0),(40,2,20,0),(41,1,21,0),(42,2,21,0),(43,1,22,0),(44,2,22,0),(45,1,23,0),(46,2,23,0),(47,1,24,0),(48,2,24,0),(49,1,25,0),(50,2,25,0),(51,1,26,0),(52,2,26,0),(53,1,27,0),(54,2,27,0),(55,1,28,0),(56,2,28,0),(57,1,29,0),(58,2,29,0),(59,1,30,0),(60,2,30,0),(61,1,31,0),(62,2,31,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint unsigned NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `brand_id` int unsigned DEFAULT NULL,
  `is_variation` tinyint NOT NULL DEFAULT '0',
  `sale_type` tinyint NOT NULL DEFAULT '0',
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `tax_id` int unsigned DEFAULT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `created_by_id` int DEFAULT '0',
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  PRIMARY KEY (`id`),
  KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  KEY `ec_products_sale_type_index` (`sale_type`),
  KEY `ec_products_start_date_index` (`start_date`),
  KEY `ec_products_end_date_index` (`end_date`),
  KEY `ec_products_sale_price_index` (`sale_price`),
  KEY `ec_products_is_variation_index` (`is_variation`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Smart Home Speaker (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/1.jpg\",\"products\\/1-1.jpg\",\"products\\/1-2.jpg\",\"products\\/1-3.jpg\"]','HS-125-A0',0,19,0,1,1,6,0,0,472,NULL,NULL,NULL,11.00,20.00,15.00,719.00,1,195133,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(2,'Headphone Ultra Bass','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/2.jpg\",\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\"]','HS-100-A0',0,16,0,1,1,7,0,0,307,NULL,NULL,NULL,20.00,14.00,16.00,671.00,1,69769,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(3,'Boxed - Bluetooth Headphone','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/3.jpg\",\"products\\/3-1.jpg\",\"products\\/3-2.jpg\",\"products\\/3-3.jpg\"]','HS-133-A0',0,12,0,1,1,6,0,0,446,NULL,NULL,NULL,16.00,12.00,19.00,676.00,1,100658,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(4,'Chikie - Bluetooth Speaker','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/4.jpg\",\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/4-3.jpg\"]','HS-121-A0',0,19,0,1,1,6,0,0,79,69.52,NULL,NULL,20.00,15.00,13.00,871.00,1,129219,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(5,'Camera Hikvision HK-35VS8 (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/5.jpg\",\"products\\/5-1.jpg\",\"products\\/5-2.jpg\",\"products\\/5-3.jpg\"]','HS-157-A0',0,15,0,1,1,4,0,0,47,NULL,NULL,NULL,17.00,17.00,19.00,502.00,1,44389,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(6,'Camera Samsung SS-24','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/6.jpg\",\"products\\/6-1.jpg\"]','HS-138-A0',0,10,0,1,1,3,0,0,60,NULL,NULL,NULL,11.00,16.00,11.00,535.00,1,179121,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(7,'Leather Watch Band','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/7.jpg\",\"products\\/7-1.jpg\"]','HS-142-A0',0,20,0,1,1,2,0,0,117,NULL,NULL,NULL,15.00,18.00,10.00,749.00,1,69677,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(8,'Apple iPhone 13 Plus','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/8.jpg\",\"products\\/8-1.jpg\"]','HS-184-A0',0,20,0,1,1,2,0,0,130,94.9,NULL,NULL,16.00,12.00,18.00,542.00,1,133244,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(9,'Macbook Pro 2015 (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/9.jpg\",\"products\\/9-1.jpg\"]','HS-164-A0',0,10,0,1,1,6,0,0,120,NULL,NULL,NULL,12.00,15.00,13.00,877.00,1,59604,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(10,'Macbook Air 12 inch','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/10.jpg\",\"products\\/10-1.jpg\"]','HS-104-A0',0,14,0,1,1,3,0,0,399,NULL,NULL,NULL,18.00,12.00,17.00,679.00,1,95878,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(11,'Apple Watch Serial 7','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/11.jpg\",\"products\\/11-1.jpg\"]','HS-147-A0',0,12,0,1,1,4,0,0,129,NULL,NULL,NULL,17.00,18.00,19.00,617.00,1,135169,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(12,'Macbook Pro 13 inch','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/12.jpg\",\"products\\/12-1.jpg\"]','HS-185-A0',0,12,0,1,1,1,0,0,112,85.12,NULL,NULL,11.00,18.00,18.00,582.00,1,22509,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(13,'Apple Keyboard (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/13.jpg\",\"products\\/13-1.jpg\"]','HS-135-A0',0,10,0,1,1,6,0,0,122,NULL,NULL,NULL,13.00,19.00,13.00,653.00,1,25098,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(14,'MacSafe 80W','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/14.jpg\",\"products\\/14-1.jpg\"]','HS-160-A0',0,18,0,1,1,3,0,0,124,NULL,NULL,NULL,16.00,12.00,12.00,780.00,1,50845,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(15,'Hand playstation','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/15.jpg\",\"products\\/15-1.jpg\"]','HS-123-A0',0,19,0,1,1,4,0,0,111,NULL,NULL,NULL,20.00,18.00,16.00,784.00,1,5896,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(16,'Apple Airpods Serial 3','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/16.jpg\"]','HS-101-A0',0,17,0,1,1,3,0,0,112,81.76,NULL,NULL,17.00,16.00,10.00,787.00,1,40602,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(17,'Cool Smart Watches (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/17.jpg\"]','HS-125-A0',0,20,0,1,1,3,0,0,125,NULL,NULL,NULL,11.00,10.00,16.00,736.00,1,179719,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(18,'Black Smart Watches','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/18.jpg\",\"products\\/18-1.jpg\",\"products\\/18-2.jpg\"]','HS-162-A0',0,18,0,1,1,6,0,0,127,NULL,NULL,NULL,13.00,11.00,12.00,841.00,1,56706,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(19,'Leather Watch Band Serial 3','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/19.jpg\",\"products\\/19-1.jpg\"]','HS-178-A0',0,16,0,1,1,4,0,0,114,NULL,NULL,NULL,11.00,12.00,17.00,897.00,1,166580,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(20,'Macbook Pro 2015 13 inch','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/20.jpg\",\"products\\/20-1.jpg\"]','HS-173-A0',0,15,0,1,1,4,0,0,114,92.34,NULL,NULL,12.00,11.00,11.00,832.00,1,23433,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(21,'Historic Alarm Clock (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/21.jpg\",\"products\\/21-1.jpg\"]','HS-182-A0',0,13,0,1,1,7,0,0,129,NULL,NULL,NULL,14.00,10.00,19.00,767.00,1,73268,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(22,'Black Glasses','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/22.jpg\",\"products\\/22-1.jpg\"]','HS-103-A0',0,11,0,1,1,6,0,0,122,NULL,NULL,NULL,11.00,17.00,17.00,843.00,1,94052,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(23,'Phillips Mouse','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/23.jpg\",\"products\\/23-1.jpg\"]','HS-108-A0',0,18,0,1,1,5,0,0,128,NULL,NULL,NULL,20.00,18.00,10.00,566.00,1,74675,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(24,'Gaming Keyboard','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/24.jpg\",\"products\\/24-1.jpg\"]','HS-198-A0',0,20,0,1,1,4,0,0,119,92.82,NULL,NULL,15.00,12.00,20.00,898.00,1,159780,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(25,'Dual Camera 20MP (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/25.jpg\",\"products\\/25-1.jpg\"]','HS-162-A0',0,14,0,1,0,5,0,0,80.25,NULL,NULL,NULL,12.00,13.00,17.00,651.00,1,127579,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(26,'Smart Watches','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/26.jpg\",\"products\\/26-1.jpg\",\"products\\/26-2.jpg\"]','HS-107-A0',0,10,0,1,0,5,0,0,40.5,NULL,NULL,NULL,19.00,10.00,16.00,643.00,1,192061,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(27,'Beat Headphone','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/27.jpg\",\"products\\/27-1.jpg\"]','HS-131-A0',0,16,0,1,0,2,0,0,20,NULL,NULL,NULL,11.00,10.00,20.00,724.00,1,160553,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(28,'Red & Black Headphone','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/28.jpg\",\"products\\/28-1.jpg\"]','HS-178-A0',0,15,0,1,0,6,0,0,55,41.8,NULL,NULL,12.00,18.00,12.00,720.00,1,126276,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(29,'Audio Equipment (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/29.jpg\",\"products\\/29-1.jpg\"]','HS-108-A0',0,20,0,1,0,3,0,0,60,NULL,NULL,NULL,13.00,10.00,15.00,772.00,1,132541,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(30,'Smart Televisions','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/30.jpg\",\"products\\/30-1.jpg\"]','HS-132-A0',0,20,0,1,0,3,0,0,120,NULL,NULL,NULL,13.00,15.00,16.00,727.00,1,129006,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(31,'Samsung Smart TV','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/31.jpg\",\"products\\/31-1.jpg\"]','HS-128-A0',0,16,0,1,0,6,0,0,58,NULL,NULL,NULL,15.00,15.00,17.00,771.00,1,121757,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(32,'Smart Home Speaker (Digital)',NULL,NULL,'published','[\"products\\/1.jpg\"]','HS-125-A0',0,19,0,1,0,6,1,0,472,NULL,NULL,NULL,11.00,20.00,15.00,719.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(33,'Smart Home Speaker (Digital)',NULL,NULL,'published','[\"products\\/1-1.jpg\"]','HS-125-A0-A1',0,19,0,1,0,6,1,0,472,NULL,NULL,NULL,11.00,20.00,15.00,719.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(34,'Smart Home Speaker (Digital)',NULL,NULL,'published','[\"products\\/1-2.jpg\"]','HS-125-A0-A2',0,19,0,1,0,6,1,0,472,NULL,NULL,NULL,11.00,20.00,15.00,719.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(35,'Headphone Ultra Bass',NULL,NULL,'published','[\"products\\/2.jpg\"]','HS-100-A0',0,16,0,1,0,7,1,0,307,NULL,NULL,NULL,20.00,14.00,16.00,671.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(36,'Headphone Ultra Bass',NULL,NULL,'published','[\"products\\/2-1.jpg\"]','HS-100-A0-A1',0,16,0,1,0,7,1,0,307,NULL,NULL,NULL,20.00,14.00,16.00,671.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(37,'Headphone Ultra Bass',NULL,NULL,'published','[\"products\\/2-2.jpg\"]','HS-100-A0-A2',0,16,0,1,0,7,1,0,307,NULL,NULL,NULL,20.00,14.00,16.00,671.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(38,'Boxed - Bluetooth Headphone',NULL,NULL,'published','[\"products\\/3.jpg\"]','HS-133-A0',0,12,0,1,0,6,1,0,446,NULL,NULL,NULL,16.00,12.00,19.00,676.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(39,'Boxed - Bluetooth Headphone',NULL,NULL,'published','[\"products\\/3-1.jpg\"]','HS-133-A0-A1',0,12,0,1,0,6,1,0,446,NULL,NULL,NULL,16.00,12.00,19.00,676.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(40,'Boxed - Bluetooth Headphone',NULL,NULL,'published','[\"products\\/3-2.jpg\"]','HS-133-A0-A2',0,12,0,1,0,6,1,0,446,NULL,NULL,NULL,16.00,12.00,19.00,676.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(41,'Chikie - Bluetooth Speaker',NULL,NULL,'published','[\"products\\/4.jpg\"]','HS-121-A0',0,19,0,1,0,6,1,0,79,69.52,NULL,NULL,20.00,15.00,13.00,871.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(42,'Chikie - Bluetooth Speaker',NULL,NULL,'published','[\"products\\/4-1.jpg\"]','HS-121-A0-A1',0,19,0,1,0,6,1,0,79,66.36,NULL,NULL,20.00,15.00,13.00,871.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(43,'Chikie - Bluetooth Speaker',NULL,NULL,'published','[\"products\\/4-2.jpg\"]','HS-121-A0-A2',0,19,0,1,0,6,1,0,79,68.73,NULL,NULL,20.00,15.00,13.00,871.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(44,'Chikie - Bluetooth Speaker',NULL,NULL,'published','[\"products\\/4-3.jpg\"]','HS-121-A0-A3',0,19,0,1,0,6,1,0,79,71.1,NULL,NULL,20.00,15.00,13.00,871.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(45,'Camera Hikvision HK-35VS8 (Digital)',NULL,NULL,'published','[\"products\\/5.jpg\"]','HS-157-A0',0,15,0,1,0,4,1,0,47,NULL,NULL,NULL,17.00,17.00,19.00,502.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(46,'Camera Samsung SS-24',NULL,NULL,'published','[\"products\\/6.jpg\"]','HS-138-A0',0,10,0,1,0,3,1,0,60,NULL,NULL,NULL,11.00,16.00,11.00,535.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(47,'Camera Samsung SS-24',NULL,NULL,'published','[\"products\\/6-1.jpg\"]','HS-138-A0-A1',0,10,0,1,0,3,1,0,60,NULL,NULL,NULL,11.00,16.00,11.00,535.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(48,'Camera Samsung SS-24',NULL,NULL,'published','[\"products\\/6.jpg\"]','HS-138-A0-A2',0,10,0,1,0,3,1,0,60,NULL,NULL,NULL,11.00,16.00,11.00,535.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(49,'Leather Watch Band',NULL,NULL,'published','[\"products\\/7.jpg\"]','HS-142-A0',0,20,0,1,0,2,1,0,117,NULL,NULL,NULL,15.00,18.00,10.00,749.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(50,'Apple iPhone 13 Plus',NULL,NULL,'published','[\"products\\/8.jpg\"]','HS-184-A0',0,20,0,1,0,2,1,0,130,94.9,NULL,NULL,16.00,12.00,18.00,542.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(51,'Apple iPhone 13 Plus',NULL,NULL,'published','[\"products\\/8-1.jpg\"]','HS-184-A0-A1',0,20,0,1,0,2,1,0,130,107.9,NULL,NULL,16.00,12.00,18.00,542.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(52,'Macbook Pro 2015 (Digital)',NULL,NULL,'published','[\"products\\/9.jpg\"]','HS-164-A0',0,10,0,1,0,6,1,0,120,NULL,NULL,NULL,12.00,15.00,13.00,877.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(53,'Macbook Pro 2015 (Digital)',NULL,NULL,'published','[\"products\\/9-1.jpg\"]','HS-164-A0-A1',0,10,0,1,0,6,1,0,120,NULL,NULL,NULL,12.00,15.00,13.00,877.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(54,'Macbook Pro 2015 (Digital)',NULL,NULL,'published','[\"products\\/9.jpg\"]','HS-164-A0-A2',0,10,0,1,0,6,1,0,120,NULL,NULL,NULL,12.00,15.00,13.00,877.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(55,'Macbook Air 12 inch',NULL,NULL,'published','[\"products\\/10.jpg\"]','HS-104-A0',0,14,0,1,0,3,1,0,399,NULL,NULL,NULL,18.00,12.00,17.00,679.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(56,'Macbook Air 12 inch',NULL,NULL,'published','[\"products\\/10-1.jpg\"]','HS-104-A0-A1',0,14,0,1,0,3,1,0,399,NULL,NULL,NULL,18.00,12.00,17.00,679.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(57,'Apple Watch Serial 7',NULL,NULL,'published','[\"products\\/11.jpg\"]','HS-147-A0',0,12,0,1,0,4,1,0,129,NULL,NULL,NULL,17.00,18.00,19.00,617.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(58,'Macbook Pro 13 inch',NULL,NULL,'published','[\"products\\/12.jpg\"]','HS-185-A0',0,12,0,1,0,1,1,0,112,85.12,NULL,NULL,11.00,18.00,18.00,582.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(59,'Macbook Pro 13 inch',NULL,NULL,'published','[\"products\\/12-1.jpg\"]','HS-185-A0-A1',0,12,0,1,0,1,1,0,112,85.12,NULL,NULL,11.00,18.00,18.00,582.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(60,'Macbook Pro 13 inch',NULL,NULL,'published','[\"products\\/12.jpg\"]','HS-185-A0-A2',0,12,0,1,0,1,1,0,112,94.08,NULL,NULL,11.00,18.00,18.00,582.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(61,'Apple Keyboard (Digital)',NULL,NULL,'published','[\"products\\/13.jpg\"]','HS-135-A0',0,10,0,1,0,6,1,0,122,NULL,NULL,NULL,13.00,19.00,13.00,653.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(62,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14.jpg\"]','HS-160-A0',0,18,0,1,0,3,1,0,124,NULL,NULL,NULL,16.00,12.00,12.00,780.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(63,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14-1.jpg\"]','HS-160-A0-A1',0,18,0,1,0,3,1,0,124,NULL,NULL,NULL,16.00,12.00,12.00,780.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(64,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14.jpg\"]','HS-160-A0-A2',0,18,0,1,0,3,1,0,124,NULL,NULL,NULL,16.00,12.00,12.00,780.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(65,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14.jpg\"]','HS-160-A0-A3',0,18,0,1,0,3,1,0,124,NULL,NULL,NULL,16.00,12.00,12.00,780.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(66,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14.jpg\"]','HS-160-A0-A4',0,18,0,1,0,3,1,0,124,NULL,NULL,NULL,16.00,12.00,12.00,780.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(67,'Hand playstation',NULL,NULL,'published','[\"products\\/15.jpg\"]','HS-123-A0',0,19,0,1,0,4,1,0,111,NULL,NULL,NULL,20.00,18.00,16.00,784.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(68,'Hand playstation',NULL,NULL,'published','[\"products\\/15-1.jpg\"]','HS-123-A0-A1',0,19,0,1,0,4,1,0,111,NULL,NULL,NULL,20.00,18.00,16.00,784.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(69,'Apple Airpods Serial 3',NULL,NULL,'published','[\"products\\/16.jpg\"]','HS-101-A0',0,17,0,1,0,3,1,0,112,81.76,NULL,NULL,17.00,16.00,10.00,787.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(70,'Apple Airpods Serial 3',NULL,NULL,'published','[\"products\\/16.jpg\"]','HS-101-A0-A1',0,17,0,1,0,3,1,0,112,92.96,NULL,NULL,17.00,16.00,10.00,787.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(71,'Cool Smart Watches (Digital)',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-125-A0',0,20,0,1,0,3,1,0,125,NULL,NULL,NULL,11.00,10.00,16.00,736.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(72,'Cool Smart Watches (Digital)',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-125-A0-A1',0,20,0,1,0,3,1,0,125,NULL,NULL,NULL,11.00,10.00,16.00,736.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(73,'Black Smart Watches',NULL,NULL,'published','[\"products\\/18.jpg\"]','HS-162-A0',0,18,0,1,0,6,1,0,127,NULL,NULL,NULL,13.00,11.00,12.00,841.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(74,'Black Smart Watches',NULL,NULL,'published','[\"products\\/18-1.jpg\"]','HS-162-A0-A1',0,18,0,1,0,6,1,0,127,NULL,NULL,NULL,13.00,11.00,12.00,841.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(75,'Black Smart Watches',NULL,NULL,'published','[\"products\\/18-2.jpg\"]','HS-162-A0-A2',0,18,0,1,0,6,1,0,127,NULL,NULL,NULL,13.00,11.00,12.00,841.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(76,'Black Smart Watches',NULL,NULL,'published','[\"products\\/18.jpg\"]','HS-162-A0-A3',0,18,0,1,0,6,1,0,127,NULL,NULL,NULL,13.00,11.00,12.00,841.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(77,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19.jpg\"]','HS-178-A0',0,16,0,1,0,4,1,0,114,NULL,NULL,NULL,11.00,12.00,17.00,897.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(78,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19-1.jpg\"]','HS-178-A0-A1',0,16,0,1,0,4,1,0,114,NULL,NULL,NULL,11.00,12.00,17.00,897.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(79,'Macbook Pro 2015 13 inch',NULL,NULL,'published','[\"products\\/20.jpg\"]','HS-173-A0',0,15,0,1,0,4,1,0,114,92.34,NULL,NULL,12.00,11.00,11.00,832.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(80,'Macbook Pro 2015 13 inch',NULL,NULL,'published','[\"products\\/20-1.jpg\"]','HS-173-A0-A1',0,15,0,1,0,4,1,0,114,99.18,NULL,NULL,12.00,11.00,11.00,832.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(81,'Macbook Pro 2015 13 inch',NULL,NULL,'published','[\"products\\/20.jpg\"]','HS-173-A0-A2',0,15,0,1,0,4,1,0,114,90.06,NULL,NULL,12.00,11.00,11.00,832.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(82,'Historic Alarm Clock (Digital)',NULL,NULL,'published','[\"products\\/21.jpg\"]','HS-182-A0',0,13,0,1,0,7,1,0,129,NULL,NULL,NULL,14.00,10.00,19.00,767.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(83,'Historic Alarm Clock (Digital)',NULL,NULL,'published','[\"products\\/21-1.jpg\"]','HS-182-A0-A1',0,13,0,1,0,7,1,0,129,NULL,NULL,NULL,14.00,10.00,19.00,767.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(84,'Historic Alarm Clock (Digital)',NULL,NULL,'published','[\"products\\/21.jpg\"]','HS-182-A0-A2',0,13,0,1,0,7,1,0,129,NULL,NULL,NULL,14.00,10.00,19.00,767.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(85,'Black Glasses',NULL,NULL,'published','[\"products\\/22.jpg\"]','HS-103-A0',0,11,0,1,0,6,1,0,122,NULL,NULL,NULL,11.00,17.00,17.00,843.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(86,'Black Glasses',NULL,NULL,'published','[\"products\\/22-1.jpg\"]','HS-103-A0-A1',0,11,0,1,0,6,1,0,122,NULL,NULL,NULL,11.00,17.00,17.00,843.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(87,'Black Glasses',NULL,NULL,'published','[\"products\\/22.jpg\"]','HS-103-A0-A2',0,11,0,1,0,6,1,0,122,NULL,NULL,NULL,11.00,17.00,17.00,843.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(88,'Phillips Mouse',NULL,NULL,'published','[\"products\\/23.jpg\"]','HS-108-A0',0,18,0,1,0,5,1,0,128,NULL,NULL,NULL,20.00,18.00,10.00,566.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(89,'Phillips Mouse',NULL,NULL,'published','[\"products\\/23-1.jpg\"]','HS-108-A0-A1',0,18,0,1,0,5,1,0,128,NULL,NULL,NULL,20.00,18.00,10.00,566.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(90,'Phillips Mouse',NULL,NULL,'published','[\"products\\/23.jpg\"]','HS-108-A0-A2',0,18,0,1,0,5,1,0,128,NULL,NULL,NULL,20.00,18.00,10.00,566.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(91,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24.jpg\"]','HS-198-A0',0,20,0,1,0,4,1,0,119,92.82,NULL,NULL,15.00,12.00,20.00,898.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(92,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24-1.jpg\"]','HS-198-A0-A1',0,20,0,1,0,4,1,0,119,90.44,NULL,NULL,15.00,12.00,20.00,898.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(93,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24.jpg\"]','HS-198-A0-A2',0,20,0,1,0,4,1,0,119,97.58,NULL,NULL,15.00,12.00,20.00,898.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(94,'Dual Camera 20MP (Digital)',NULL,NULL,'published','[\"products\\/25.jpg\"]','HS-162-A0',0,14,0,1,0,5,1,0,80.25,NULL,NULL,NULL,12.00,13.00,17.00,651.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(95,'Smart Watches',NULL,NULL,'published','[\"products\\/26.jpg\"]','HS-107-A0',0,10,0,1,0,5,1,0,40.5,NULL,NULL,NULL,19.00,10.00,16.00,643.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(96,'Smart Watches',NULL,NULL,'published','[\"products\\/26-1.jpg\"]','HS-107-A0-A1',0,10,0,1,0,5,1,0,40.5,NULL,NULL,NULL,19.00,10.00,16.00,643.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(97,'Smart Watches',NULL,NULL,'published','[\"products\\/26-2.jpg\"]','HS-107-A0-A2',0,10,0,1,0,5,1,0,40.5,NULL,NULL,NULL,19.00,10.00,16.00,643.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(98,'Beat Headphone',NULL,NULL,'published','[\"products\\/27.jpg\"]','HS-131-A0',0,16,0,1,0,2,1,0,20,NULL,NULL,NULL,11.00,10.00,20.00,724.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(99,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28.jpg\"]','HS-178-A0',0,15,0,1,0,6,1,0,55,41.8,NULL,NULL,12.00,18.00,12.00,720.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(100,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28-1.jpg\"]','HS-178-A0-A1',0,15,0,1,0,6,1,0,55,48.4,NULL,NULL,12.00,18.00,12.00,720.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(101,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28.jpg\"]','HS-178-A0-A2',0,15,0,1,0,6,1,0,55,38.5,NULL,NULL,12.00,18.00,12.00,720.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(102,'Audio Equipment (Digital)',NULL,NULL,'published','[\"products\\/29.jpg\"]','HS-108-A0',0,20,0,1,0,3,1,0,60,NULL,NULL,NULL,13.00,10.00,15.00,772.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(103,'Audio Equipment (Digital)',NULL,NULL,'published','[\"products\\/29-1.jpg\"]','HS-108-A0-A1',0,20,0,1,0,3,1,0,60,NULL,NULL,NULL,13.00,10.00,15.00,772.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(104,'Audio Equipment (Digital)',NULL,NULL,'published','[\"products\\/29.jpg\"]','HS-108-A0-A2',0,20,0,1,0,3,1,0,60,NULL,NULL,NULL,13.00,10.00,15.00,772.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(105,'Audio Equipment (Digital)',NULL,NULL,'published','[\"products\\/29.jpg\"]','HS-108-A0-A3',0,20,0,1,0,3,1,0,60,NULL,NULL,NULL,13.00,10.00,15.00,772.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(106,'Smart Televisions',NULL,NULL,'published','[\"products\\/30.jpg\"]','HS-132-A0',0,20,0,1,0,3,1,0,120,NULL,NULL,NULL,13.00,15.00,16.00,727.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(107,'Smart Televisions',NULL,NULL,'published','[\"products\\/30-1.jpg\"]','HS-132-A0-A1',0,20,0,1,0,3,1,0,120,NULL,NULL,NULL,13.00,15.00,16.00,727.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(108,'Smart Televisions',NULL,NULL,'published','[\"products\\/30.jpg\"]','HS-132-A0-A2',0,20,0,1,0,3,1,0,120,NULL,NULL,NULL,13.00,15.00,16.00,727.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(109,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31.jpg\"]','HS-128-A0',0,16,0,1,0,6,1,0,58,NULL,NULL,NULL,15.00,15.00,17.00,771.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(110,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31-1.jpg\"]','HS-128-A0-A1',0,16,0,1,0,6,1,0,58,NULL,NULL,NULL,15.00,15.00,17.00,771.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(111,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31.jpg\"]','HS-128-A0-A2',0,16,0,1,0,6,1,0,58,NULL,NULL,NULL,15.00,15.00,17.00,771.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(112,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31.jpg\"]','HS-128-A0-A3',0,16,0,1,0,6,1,0,58,NULL,NULL,NULL,15.00,15.00,17.00,771.00,NULL,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical');
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
INSERT INTO `ec_products_translations` VALUES ('vi',1,'Loa thông minh',NULL,NULL),('vi',2,'Tai nghe Ultra Bass',NULL,NULL),('vi',3,'Đóng hộp - Tai nghe Bluetooth',NULL,NULL),('vi',4,'Chikie - Loa Bluetooth',NULL,NULL),('vi',5,'Camera Hikvision HK-35VS8',NULL,NULL),('vi',6,'Camera Samsung SS-24',NULL,NULL),('vi',7,'Dây đeo đồng hồ bằng da',NULL,NULL),('vi',8,'Apple iPhone 13 Plus',NULL,NULL),('vi',9,'Macbook Pro 2015',NULL,NULL),('vi',10,'Macbook Air 12 inch',NULL,NULL),('vi',11,'Apple Watch Serial 7',NULL,NULL),('vi',12,'Macbook Pro 13 inch',NULL,NULL),('vi',13,'Bàn phím Apple',NULL,NULL),('vi',14,'MacSafe 80W',NULL,NULL),('vi',15,'Máy chơi game cầm tay',NULL,NULL),('vi',16,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',17,'Đồng hồ thông minh',NULL,NULL),('vi',18,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',19,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',20,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',21,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',22,'Kính đen',NULL,NULL),('vi',23,'Chuột máy tính Phillips',NULL,NULL),('vi',24,'Bàn phím Trò chơi',NULL,NULL),('vi',25,'Camera kép 20MP',NULL,NULL),('vi',26,'Đồng hồ thông minh',NULL,NULL),('vi',27,'Tai nghe Best',NULL,NULL),('vi',28,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',29,'Thiết bị âm thanh',NULL,NULL),('vi',30,'Tivi thông minh',NULL,NULL),('vi',31,'Tivi thông minh Samsung',NULL,NULL),('vi',32,'Loa thông minh',NULL,NULL),('vi',33,'Loa thông minh',NULL,NULL),('vi',34,'Loa thông minh',NULL,NULL),('vi',35,'Tai nghe Ultra Bass',NULL,NULL),('vi',36,'Tai nghe Ultra Bass',NULL,NULL),('vi',37,'Tai nghe Ultra Bass',NULL,NULL),('vi',38,'Đóng hộp - Tai nghe Bluetooth',NULL,NULL),('vi',39,'Đóng hộp - Tai nghe Bluetooth',NULL,NULL),('vi',40,'Đóng hộp - Tai nghe Bluetooth',NULL,NULL),('vi',41,'Chikie - Loa Bluetooth',NULL,NULL),('vi',42,'Chikie - Loa Bluetooth',NULL,NULL),('vi',43,'Chikie - Loa Bluetooth',NULL,NULL),('vi',44,'Chikie - Loa Bluetooth',NULL,NULL),('vi',45,'Camera Hikvision HK-35VS8',NULL,NULL),('vi',46,'Camera Samsung SS-24',NULL,NULL),('vi',47,'Camera Samsung SS-24',NULL,NULL),('vi',48,'Camera Samsung SS-24',NULL,NULL),('vi',49,'Dây đeo đồng hồ bằng da',NULL,NULL),('vi',50,'Apple iPhone 13 Plus',NULL,NULL),('vi',51,'Apple iPhone 13 Plus',NULL,NULL),('vi',52,'Macbook Pro 2015',NULL,NULL),('vi',53,'Macbook Pro 2015',NULL,NULL),('vi',54,'Macbook Pro 2015',NULL,NULL),('vi',55,'Macbook Air 12 inch',NULL,NULL),('vi',56,'Macbook Air 12 inch',NULL,NULL),('vi',57,'Apple Watch Serial 7',NULL,NULL),('vi',58,'Macbook Pro 13 inch',NULL,NULL),('vi',59,'Macbook Pro 13 inch',NULL,NULL),('vi',60,'Macbook Pro 13 inch',NULL,NULL),('vi',61,'Bàn phím Apple',NULL,NULL),('vi',62,'MacSafe 80W',NULL,NULL),('vi',63,'MacSafe 80W',NULL,NULL),('vi',64,'MacSafe 80W',NULL,NULL),('vi',65,'MacSafe 80W',NULL,NULL),('vi',66,'MacSafe 80W',NULL,NULL),('vi',67,'Máy chơi game cầm tay',NULL,NULL),('vi',68,'Máy chơi game cầm tay',NULL,NULL),('vi',69,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',70,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',71,'Đồng hồ thông minh',NULL,NULL),('vi',72,'Đồng hồ thông minh',NULL,NULL),('vi',73,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',74,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',75,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',76,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',77,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',78,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',79,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',80,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',81,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',82,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',83,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',84,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',85,'Kính đen',NULL,NULL),('vi',86,'Kính đen',NULL,NULL),('vi',87,'Kính đen',NULL,NULL),('vi',88,'Chuột máy tính Phillips',NULL,NULL),('vi',89,'Chuột máy tính Phillips',NULL,NULL),('vi',90,'Chuột máy tính Phillips',NULL,NULL),('vi',91,'Bàn phím Trò chơi',NULL,NULL),('vi',92,'Bàn phím Trò chơi',NULL,NULL),('vi',93,'Bàn phím Trò chơi',NULL,NULL),('vi',94,'Camera kép 20MP',NULL,NULL),('vi',95,'Đồng hồ thông minh',NULL,NULL),('vi',96,'Đồng hồ thông minh',NULL,NULL),('vi',97,'Đồng hồ thông minh',NULL,NULL),('vi',98,'Tai nghe Best',NULL,NULL),('vi',99,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',100,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',101,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',102,'Thiết bị âm thanh',NULL,NULL),('vi',103,'Thiết bị âm thanh',NULL,NULL),('vi',104,'Thiết bị âm thanh',NULL,NULL),('vi',105,'Thiết bị âm thanh',NULL,NULL),('vi',106,'Tivi thông minh',NULL,NULL),('vi',107,'Tivi thông minh',NULL,NULL),('vi',108,'Tivi thông minh',NULL,NULL),('vi',109,'Tivi thông minh Samsung',NULL,NULL),('vi',110,'Tivi thông minh Samsung',NULL,NULL),('vi',111,'Tivi thông minh Samsung',NULL,NULL),('vi',112,'Tivi thông minh Samsung',NULL,NULL);
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  KEY `ec_reviews_product_id_customer_id_status_index` (`product_id`,`customer_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,2,13,3.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(2,4,8,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/5.jpg\",\"products\\/19.jpg\"]'),(3,4,3,3.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\"]'),(4,3,23,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/29.jpg\"}'),(5,4,12,4.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/19.jpg\"]'),(6,5,23,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/2.jpg\",\"2\":\"products\\/11.jpg\"}'),(7,6,8,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(8,9,19,2.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/27.jpg\"]'),(9,10,17,3.00,'Clean & perfect source code','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/30.jpg\"}'),(10,8,13,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(11,5,11,1.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\",\"products\\/22.jpg\"]'),(12,4,24,4.00,'Clean & perfect source code','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(13,7,28,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(14,8,14,4.00,'Clean & perfect source code','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(15,9,14,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/6.jpg\",\"products\\/25.jpg\"]'),(16,7,6,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(17,6,8,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\",\"products\\/20.jpg\"]'),(18,6,29,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(19,11,10,4.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(20,3,17,3.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/22.jpg\"}'),(21,9,8,2.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(22,9,10,4.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(23,3,17,2.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(24,5,5,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(25,5,10,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(26,6,26,4.00,'Good app, good backup service and support. Good documentation.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(27,4,8,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\"]'),(28,9,24,3.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(29,2,22,3.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(30,2,27,1.00,'Clean & perfect source code','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(31,11,2,1.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(32,6,28,3.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(33,2,27,3.00,'Clean & perfect source code','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\"]'),(34,3,1,3.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/11.jpg\"}'),(35,4,15,2.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(36,10,20,5.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(37,5,15,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(38,4,8,5.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/11.jpg\"]'),(39,4,15,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/6.jpg\",\"products\\/21.jpg\"]'),(40,3,17,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/14.jpg\"}'),(41,2,15,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/6.jpg\",\"products\\/10.jpg\"]'),(42,8,12,2.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/7.jpg\",\"products\\/20.jpg\"]'),(43,1,20,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(44,11,28,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(45,10,20,5.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(46,2,8,4.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(47,2,12,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(48,11,17,3.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(49,1,29,4.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(50,5,27,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/18.jpg\"}'),(51,8,12,4.00,'Clean & perfect source code','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/23.jpg\"}'),(52,10,10,4.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\"]'),(53,3,29,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(54,10,28,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/15.jpg\"]'),(55,5,15,5.00,'Good app, good backup service and support. Good documentation.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(56,4,30,1.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(57,11,14,2.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(58,10,4,5.00,'Good app, good backup service and support. Good documentation.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(59,4,13,3.00,'Best ecommerce CMS online store!','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\"]'),(60,4,14,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(61,5,27,4.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/6.jpg\",\"products\\/26.jpg\"]'),(62,5,18,2.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/19.jpg\"}'),(63,10,12,5.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/6.jpg\",\"products\\/22.jpg\"]'),(64,1,28,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(65,10,6,5.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\"]'),(66,10,8,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(67,4,15,2.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/31.jpg\"}'),(68,6,6,5.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(69,7,19,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\"]'),(70,6,1,4.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(71,7,17,1.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(72,4,2,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(73,3,8,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/13.jpg\"]'),(74,1,15,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(75,8,18,5.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\"]'),(76,2,20,4.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\"]'),(77,7,17,3.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(78,5,11,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/25.jpg\"]'),(79,10,14,4.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\"]'),(80,3,15,4.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(81,10,8,1.00,'Clean & perfect source code','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\"]'),(82,11,7,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(83,11,9,5.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(84,10,20,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/13.jpg\"}'),(85,9,3,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(86,9,13,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/9.jpg\"]'),(87,10,18,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/13.jpg\"}'),(88,10,27,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(89,3,20,5.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(90,9,27,5.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(91,3,28,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\"]'),(92,1,24,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(93,11,31,3.00,'Clean & perfect source code','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/3.jpg\"]'),(94,11,6,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(95,10,15,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/18.jpg\"]'),(96,3,2,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/30.jpg\"}'),(97,3,14,1.00,'Best ecommerce CMS online store!','published','2022-12-12 17:34:36','2022-12-12 17:34:36','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/13.jpg\"}'),(98,3,21,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\"]'),(99,9,25,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(100,9,26,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-12-12 17:34:36','2022-12-12 17:34:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]');
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
INSERT INTO `ec_shipment_histories` VALUES (1,'create_from_order','Shipping was created from order %order_id%',0,1,1,'2022-12-09 09:34:36','2022-12-09 09:34:36'),(2,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,1,1,'2022-12-11 01:34:36','2022-12-12 17:34:36'),(3,'create_from_order','Shipping was created from order %order_id%',0,2,2,'2022-12-04 19:34:36','2022-12-04 19:34:36'),(4,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,2,2,'2022-12-11 03:34:36','2022-12-12 17:34:36'),(5,'create_from_order','Shipping was created from order %order_id%',0,3,3,'2022-11-27 17:34:36','2022-11-27 17:34:36'),(6,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,3,3,'2022-12-11 05:34:36','2022-12-12 17:34:36'),(7,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,3,3,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(8,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,3,3,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(9,'create_from_order','Shipping was created from order %order_id%',0,4,4,'2022-12-09 21:34:36','2022-12-09 21:34:36'),(10,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,4,4,'2022-12-11 07:34:36','2022-12-12 17:34:36'),(11,'create_from_order','Shipping was created from order %order_id%',0,5,5,'2022-12-02 01:34:36','2022-12-02 01:34:36'),(12,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,5,5,'2022-12-11 09:34:36','2022-12-12 17:34:36'),(13,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,5,5,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(14,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,5,5,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(15,'create_from_order','Shipping was created from order %order_id%',0,6,6,'2022-12-03 23:34:36','2022-12-03 23:34:36'),(16,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,6,6,'2022-12-11 11:34:36','2022-12-12 17:34:36'),(17,'create_from_order','Shipping was created from order %order_id%',0,7,7,'2022-12-03 09:34:36','2022-12-03 09:34:36'),(18,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,7,7,'2022-12-11 13:34:36','2022-12-12 17:34:36'),(19,'create_from_order','Shipping was created from order %order_id%',0,8,8,'2022-12-10 13:34:36','2022-12-10 13:34:36'),(20,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,8,8,'2022-12-11 15:34:36','2022-12-12 17:34:36'),(21,'create_from_order','Shipping was created from order %order_id%',0,9,9,'2022-12-03 17:34:36','2022-12-03 17:34:36'),(22,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,9,9,'2022-12-11 17:34:36','2022-12-12 17:34:36'),(23,'create_from_order','Shipping was created from order %order_id%',0,10,10,'2022-12-08 03:34:36','2022-12-08 03:34:36'),(24,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,10,10,'2022-12-11 19:34:36','2022-12-12 17:34:36'),(25,'create_from_order','Shipping was created from order %order_id%',0,11,11,'2022-12-07 17:34:36','2022-12-07 17:34:36'),(26,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,11,11,'2022-12-11 21:34:36','2022-12-12 17:34:36'),(27,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,11,11,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(28,'create_from_order','Shipping was created from order %order_id%',0,12,12,'2022-12-11 23:34:36','2022-12-11 23:34:36'),(29,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,12,12,'2022-12-11 23:34:36','2022-12-12 17:34:36'),(30,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,12,12,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(31,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,12,12,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(32,'create_from_order','Shipping was created from order %order_id%',0,13,13,'2022-12-06 01:34:36','2022-12-06 01:34:36'),(33,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,13,13,'2022-12-12 01:34:36','2022-12-12 17:34:36'),(34,'create_from_order','Shipping was created from order %order_id%',0,14,14,'2022-12-08 15:34:36','2022-12-08 15:34:36'),(35,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,14,14,'2022-12-12 03:34:36','2022-12-12 17:34:36'),(36,'create_from_order','Shipping was created from order %order_id%',0,15,15,'2022-12-08 05:34:36','2022-12-08 05:34:36'),(37,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,15,15,'2022-12-12 05:34:36','2022-12-12 17:34:36'),(38,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,15,15,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(39,'create_from_order','Shipping was created from order %order_id%',0,16,16,'2022-12-08 13:34:36','2022-12-08 13:34:36'),(40,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,16,16,'2022-12-12 07:34:36','2022-12-12 17:34:36'),(41,'create_from_order','Shipping was created from order %order_id%',0,17,17,'2022-12-09 09:34:36','2022-12-09 09:34:36'),(42,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,17,17,'2022-12-12 09:34:36','2022-12-12 17:34:36'),(43,'create_from_order','Shipping was created from order %order_id%',0,18,18,'2022-12-11 17:34:36','2022-12-11 17:34:36'),(44,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,18,18,'2022-12-12 11:34:36','2022-12-12 17:34:36'),(45,'create_from_order','Shipping was created from order %order_id%',0,19,19,'2022-12-11 05:34:36','2022-12-11 05:34:36'),(46,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,19,19,'2022-12-12 13:34:36','2022-12-12 17:34:36'),(47,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,19,19,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(48,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,19,19,'2022-12-12 17:34:36','2022-12-12 17:34:36'),(49,'create_from_order','Shipping was created from order %order_id%',0,20,20,'2022-12-12 13:34:36','2022-12-12 13:34:36'),(50,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,20,20,'2022-12-12 15:34:37','2022-12-12 17:34:37');
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `label_url` text COLLATE utf8mb4_unicode_ci,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
INSERT INTO `ec_shipments` VALUES (1,1,NULL,9891.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0081891563','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-17 00:34:36',NULL,NULL,NULL),(2,2,NULL,6440.00,NULL,NULL,'','approved',1311.80,'pending','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0083199408','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-19 00:34:36',NULL,NULL,NULL),(3,3,NULL,4943.00,NULL,NULL,'','delivered',572.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0015923462','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-23 00:34:36','2022-12-13 00:34:36',NULL,NULL),(4,4,NULL,2306.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0029367541','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-20 00:34:36',NULL,NULL,NULL),(5,5,NULL,2114.00,NULL,NULL,'','delivered',1481.80,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0041988287','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-16 00:34:36','2022-12-13 00:34:36',NULL,NULL),(6,6,NULL,4107.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0014304460','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-23 00:34:36',NULL,NULL,NULL),(7,7,NULL,5305.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0064832438','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-19 00:34:36',NULL,NULL,NULL),(8,8,NULL,3699.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0031891897','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-14 00:34:36',NULL,NULL,NULL),(9,9,NULL,1856.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0033825824','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-19 00:34:36',NULL,NULL,NULL),(10,10,NULL,4063.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0050209501','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-15 00:34:36',NULL,NULL,NULL),(11,11,NULL,4236.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0011582480','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-18 00:34:36','2022-12-13 00:34:36',NULL,NULL),(12,12,NULL,2910.00,NULL,NULL,'','delivered',582.40,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0018420542','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-21 00:34:36','2022-12-13 00:34:36',NULL,NULL),(13,13,NULL,5739.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD003270845','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-23 00:34:36',NULL,NULL,NULL),(14,14,NULL,3288.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0044361394','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-16 00:34:36',NULL,NULL,NULL),(15,15,NULL,4795.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD005009558','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-22 00:34:36','2022-12-13 00:34:36',NULL,NULL),(16,16,NULL,7005.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0020801609','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-14 00:34:36',NULL,NULL,NULL),(17,17,NULL,4918.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD002651727','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-15 00:34:36',NULL,NULL,NULL),(18,18,NULL,4884.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0071345020','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-16 00:34:36',NULL,NULL,NULL),(19,19,NULL,6832.00,NULL,NULL,'','delivered',637.50,'completed','pending',0.00,0,'2022-12-12 17:34:36','2022-12-12 17:34:36','JJD0062112418','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-14 00:34:36','2022-12-13 00:34:36',NULL,NULL),(20,20,NULL,4671.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-12-12 17:34:37','2022-12-12 17:34:37','JJD004096677','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-12-17 00:34:37',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'All',NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` int unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` int unsigned NOT NULL,
  `type` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'based_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Free delivery',1,'based_on_price',0.00,NULL,0.00,'2022-12-12 17:34:36','2022-12-12 17:34:36');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
INSERT INTO `ec_store_locators` VALUES (1,'Shopwise','sales@botble.com','123-456-7890','123 Street, Old Trafford','US','New York','New York',1,1,'2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_products`
--

DROP TABLE IF EXISTS `ec_tax_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_tax_products_tax_id_index` (`tax_id`),
  KEY `ec_tax_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_products`
--

LOCK TABLES `ec_tax_products` WRITE;
/*!40000 ALTER TABLE `ec_tax_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
INSERT INTO `ec_taxes` VALUES (1,'VAT',10.000000,1,'published','2022-12-12 17:34:36','2022-12-12 17:34:36'),(2,'None',0.000000,2,'published','2022-12-12 17:34:36','2022-12-12 17:34:36'),(3,'Import Tax',15.000000,3,'published','2022-12-12 17:34:36','2022-12-12 17:34:36');
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_wish_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_wish_lists_product_id_customer_id_index` (`product_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Shipping',0,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'Payment',1,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'Order & Returns',2,'published','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
INSERT INTO `faq_categories_translations` VALUES ('vi',1,'VẬN CHUYỂN'),('vi',2,'THANH TOÁN'),('vi',3,'ĐƠN HÀNG & HOÀN TRẢ');
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What Shipping Methods Are Available?','Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.',1,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'Do You Ship Internationally?','Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.',1,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'How Long Will It Take To Get My Package?','Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.',1,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,'What Payment Methods Are Accepted?','Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.',2,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(5,'Is Buying On-Line Safe?','Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.',2,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(6,'How do I place an Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.',3,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(7,'How Can I Cancel Or Change My Order?','Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.',3,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(8,'Do I need an account to place an order?','Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.',3,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(9,'How Do I Track My Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.',3,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(10,'How Can I Return a Product?','Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.',3,'published','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` int NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
INSERT INTO `faqs_translations` VALUES ('vi',1,'Có những phương thức vận chuyển nào?','Ex Portland Pitchfork irure ria mép. Eutra fap trước khi họ bán hết theo đúng nghĩa đen. Aliquip ugh quyền xe đạp thực sự mlkshk, rượu bia thủ công mực seitan. '),('vi',2,'Bạn có giao hàng quốc tế không?','Áo hoodie túi tote Tofu mixtape. Quần đùi jean đánh chữ Wolf quinoa, túi messenger hữu cơ freegan cray. '),('vi',3,'Mất bao lâu để nhận được gói hàng của tôi?','Bữa nửa buổi ăn sáng bằng bụng heo quay từ máy đánh chữ VHS, cà phê có nguồn gốc đơn Paleo, Wes Anderson. Khoan Pitchfork linh hoạt, theo nghĩa đen là đổ qua fap theo nghĩa đen. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray bền vững slow-carb raw denim Church-key fap chillwave Etsy. +1 bộ dụng cụ đánh máy, đậu phụ Banksy Vice của American Apparel. '),('vi',4,'Phương thức thanh toán nào được chấp nhận?','Fashion Axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Quầy ảnh Voluptate fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur ria mép. Twee chia gian hàng chụp ảnh xe bán đồ ăn sẵn, bữa tiệc trên mái áo hoodie swag keytar PBR DIY. '),('vi',5,'Mua trực tuyến có an toàn không?','Bữa tiệc nghệ thuật đích thực freegan semiotics jean shorts chia credit. Tiệc trên mái nhà Neutra Austin Brooklyn, Thundercats swag synth gian hàng ảnh 8-bit. Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. '),('vi',6,'Làm cách nào để đặt hàng?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Định mức seitan trong tương lai. Master làm sạch American Apparel nhẹ nhàng làm sạch râu linh hoạt chậm carb cấp độ tiếp theo. Vải thô denim polaroid nhạt từ trang trại đến bàn, đặt một con chim trên đó hình xăm lo-fi Wes Anderson Pinterest letterpress. Bậc thầy gian hàng ảnh Schlitz của Fingerstache McSweeney đang làm sạch thẻ bắt đầu bằng hashtag theo yêu cầu riêng, chillwave gentrify. '),('vi',7,'Làm cách nào để tôi có thể hủy hoặc thay đổi đơn hàng của mình?','Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. Bữa tiệc nghệ thuật đích thực freegan semiotics jean shorts chia tín. Tiệc trên mái nhà Neutra Austin ở Brooklyn, synth Thundercats có gian hàng ảnh 8-bit. '),('vi',8,'Tôi có cần tài khoản để đặt hàng không?','Thundercats làm lung lay gian hàng ảnh 8-bit. Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. Twee chia ảnh gian hàng xe bán thức ăn làm sẵn, bữa tiệc trên mái áo hoodie swag keytar PBR DIY. Cray ugh 3 wolf moon fap, rìu thời trang mỉa mai người bán thịt máy đánh chữ chambray VHS banjo nghệ thuật đường phố. '),('vi',9,'Làm cách nào để theo dõi đơn hàng của tôi?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Định mức seitan trong tương lai. Bậc thầy làm sạch American Apparel nhẹ nhàng làm sạch râu linh hoạt theo kiểu chậm carb cấp độ tiếp theo. '),('vi',10,'Làm cách nào để trả lại sản phẩm?','Kale chips Truffaut Williamsburg, fixie hashtag Pinterest raw denim c hambray uống giấm Carles street art Bushwick gastropub. Chìa khóa nhà thờ Wolf Tumblr. Xe tải thực phẩm kẻ sọc Echo Park YOLO cắn hella, giao dịch trực tiếp Thundercats legging quinoa trước khi bán hết. Có thể bạn chưa từng nghe nói về họ những người truyền bá vị umami đích thực uống giấm Pinterest Áo len Cosby, fingerstache fap High Life. ');
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','6c0fdec0ebcdd70871cee4992cbb51e9',1,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(2,'vi','6c0fdec0ebcdd70871cee4992cbb51e9',2,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(3,'en_US','7a3ecb65b3bafa450ff816117f13688a',1,'Botble\\Menu\\Models\\MenuLocation'),(4,'en_US','22b3f3516da558b02ffddb9e5cc912d6',1,'Botble\\Menu\\Models\\Menu'),(5,'en_US','b69cd0c390b1fd9b1a71004a34fffb25',2,'Botble\\Menu\\Models\\Menu'),(6,'en_US','83999f398c576f241625c0bca7ed3d0f',3,'Botble\\Menu\\Models\\Menu'),(7,'en_US','ba33738e2db634fd9be2064062219471',4,'Botble\\Menu\\Models\\Menu'),(8,'vi','baa004b98f6717200006d853592f37c4',2,'Botble\\Menu\\Models\\MenuLocation'),(9,'vi','22b3f3516da558b02ffddb9e5cc912d6',5,'Botble\\Menu\\Models\\Menu'),(10,'vi','b69cd0c390b1fd9b1a71004a34fffb25',6,'Botble\\Menu\\Models\\Menu'),(11,'vi','83999f398c576f241625c0bca7ed3d0f',7,'Botble\\Menu\\Models\\Menu'),(12,'vi','ba33738e2db634fd9be2064062219471',8,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0),(2,'Tiếng Việt','vi','vi','vn',0,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1',1,'image/png',2165,'brands/1.png','[]','2022-12-12 17:34:30','2022-12-12 17:34:30',NULL),(2,0,'2',1,'image/png',2165,'brands/2.png','[]','2022-12-12 17:34:30','2022-12-12 17:34:30',NULL),(3,0,'3',1,'image/png',2165,'brands/3.png','[]','2022-12-12 17:34:30','2022-12-12 17:34:30',NULL),(4,0,'4',1,'image/png',2165,'brands/4.png','[]','2022-12-12 17:34:30','2022-12-12 17:34:30',NULL),(5,0,'5',1,'image/png',2165,'brands/5.png','[]','2022-12-12 17:34:30','2022-12-12 17:34:30',NULL),(6,0,'6',1,'image/png',2165,'brands/6.png','[]','2022-12-12 17:34:30','2022-12-12 17:34:30',NULL),(7,0,'7',1,'image/png',2165,'brands/7.png','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(8,0,'p-1',2,'image/png',2165,'product-categories/p-1.png','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(9,0,'p-2',2,'image/png',2165,'product-categories/p-2.png','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(10,0,'p-3',2,'image/png',2165,'product-categories/p-3.png','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(11,0,'p-4',2,'image/png',2165,'product-categories/p-4.png','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(12,0,'p-5',2,'image/png',2165,'product-categories/p-5.png','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(13,0,'p-6',2,'image/png',2165,'product-categories/p-6.png','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(14,0,'p-7',2,'image/png',2165,'product-categories/p-7.png','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(15,0,'1',3,'image/jpeg',2165,'customers/1.jpg','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(16,0,'10',3,'image/jpeg',2165,'customers/10.jpg','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(17,0,'2',3,'image/jpeg',2165,'customers/2.jpg','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(18,0,'3',3,'image/jpeg',2165,'customers/3.jpg','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(19,0,'4',3,'image/jpeg',2165,'customers/4.jpg','[]','2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(20,0,'5',3,'image/jpeg',2165,'customers/5.jpg','[]','2022-12-12 17:34:32','2022-12-12 17:34:32',NULL),(21,0,'6',3,'image/jpeg',2165,'customers/6.jpg','[]','2022-12-12 17:34:32','2022-12-12 17:34:32',NULL),(22,0,'7',3,'image/jpeg',2165,'customers/7.jpg','[]','2022-12-12 17:34:32','2022-12-12 17:34:32',NULL),(23,0,'8',3,'image/jpeg',2165,'customers/8.jpg','[]','2022-12-12 17:34:32','2022-12-12 17:34:32',NULL),(24,0,'9',3,'image/jpeg',2165,'customers/9.jpg','[]','2022-12-12 17:34:32','2022-12-12 17:34:32',NULL),(25,0,'1-1',4,'image/jpeg',2165,'products/1-1.jpg','[]','2022-12-12 17:34:32','2022-12-12 17:34:32',NULL),(26,0,'1-2',4,'image/jpeg',2165,'products/1-2.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(27,0,'1-3',4,'image/jpeg',2165,'products/1-3.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(28,0,'1',4,'image/jpeg',2165,'products/1.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(29,0,'10-1',4,'image/jpeg',2165,'products/10-1.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(30,0,'10',4,'image/jpeg',2165,'products/10.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(31,0,'11-1',4,'image/jpeg',2165,'products/11-1.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(32,0,'11',4,'image/jpeg',2165,'products/11.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(33,0,'12-1',4,'image/jpeg',2165,'products/12-1.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(34,0,'12',4,'image/jpeg',2165,'products/12.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(35,0,'13-1',4,'image/jpeg',2165,'products/13-1.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(36,0,'13',4,'image/jpeg',2165,'products/13.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(37,0,'14-1',4,'image/jpeg',2165,'products/14-1.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(38,0,'14',4,'image/jpeg',2165,'products/14.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(39,0,'15-1',4,'image/jpeg',2165,'products/15-1.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(40,0,'15',4,'image/jpeg',2165,'products/15.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(41,0,'16',4,'image/jpeg',2165,'products/16.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(42,0,'17',4,'image/jpeg',2165,'products/17.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(43,0,'18-1',4,'image/jpeg',2165,'products/18-1.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(44,0,'18-2',4,'image/jpeg',2165,'products/18-2.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(45,0,'18',4,'image/jpeg',2165,'products/18.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(46,0,'19-1',4,'image/jpeg',2165,'products/19-1.jpg','[]','2022-12-12 17:34:33','2022-12-12 17:34:33',NULL),(47,0,'19',4,'image/jpeg',2165,'products/19.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(48,0,'2-1',4,'image/jpeg',2165,'products/2-1.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(49,0,'2-2',4,'image/jpeg',2165,'products/2-2.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(50,0,'2-3',4,'image/jpeg',2165,'products/2-3.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(51,0,'2',4,'image/jpeg',2165,'products/2.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(52,0,'20-1',4,'image/jpeg',2165,'products/20-1.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(53,0,'20',4,'image/jpeg',2165,'products/20.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(54,0,'21-1',4,'image/jpeg',2165,'products/21-1.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(55,0,'21',4,'image/jpeg',2165,'products/21.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(56,0,'22-1',4,'image/jpeg',2165,'products/22-1.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(57,0,'22',4,'image/jpeg',2165,'products/22.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(58,0,'23-1',4,'image/jpeg',2165,'products/23-1.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(59,0,'23',4,'image/jpeg',2165,'products/23.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(60,0,'24-1',4,'image/jpeg',2165,'products/24-1.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(61,0,'24',4,'image/jpeg',2165,'products/24.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(62,0,'25-1',4,'image/jpeg',2165,'products/25-1.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(63,0,'25',4,'image/jpeg',2165,'products/25.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(64,0,'26-1',4,'image/jpeg',2165,'products/26-1.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(65,0,'26-2',4,'image/jpeg',2165,'products/26-2.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(66,0,'26',4,'image/jpeg',2165,'products/26.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(67,0,'27-1',4,'image/jpeg',2165,'products/27-1.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(68,0,'27',4,'image/jpeg',2165,'products/27.jpg','[]','2022-12-12 17:34:34','2022-12-12 17:34:34',NULL),(69,0,'28-1',4,'image/jpeg',2165,'products/28-1.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(70,0,'28',4,'image/jpeg',2165,'products/28.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(71,0,'29-1',4,'image/jpeg',2165,'products/29-1.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(72,0,'29',4,'image/jpeg',2165,'products/29.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(73,0,'3-1',4,'image/jpeg',2165,'products/3-1.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(74,0,'3-2',4,'image/jpeg',2165,'products/3-2.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(75,0,'3-3',4,'image/jpeg',2165,'products/3-3.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(76,0,'3',4,'image/jpeg',2165,'products/3.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(77,0,'30-1',4,'image/jpeg',2165,'products/30-1.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(78,0,'30',4,'image/jpeg',2165,'products/30.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(79,0,'31-1',4,'image/jpeg',2165,'products/31-1.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(80,0,'31',4,'image/jpeg',2165,'products/31.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(81,0,'4-1',4,'image/jpeg',2165,'products/4-1.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(82,0,'4-2',4,'image/jpeg',2165,'products/4-2.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(83,0,'4-3',4,'image/jpeg',2165,'products/4-3.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(84,0,'4',4,'image/jpeg',2165,'products/4.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(85,0,'5-1',4,'image/jpeg',2165,'products/5-1.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(86,0,'5-2',4,'image/jpeg',2165,'products/5-2.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(87,0,'5-3',4,'image/jpeg',2165,'products/5-3.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(88,0,'5',4,'image/jpeg',2165,'products/5.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(89,0,'6-1',4,'image/jpeg',2165,'products/6-1.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(90,0,'6',4,'image/jpeg',2165,'products/6.jpg','[]','2022-12-12 17:34:35','2022-12-12 17:34:35',NULL),(91,0,'7-1',4,'image/jpeg',2165,'products/7-1.jpg','[]','2022-12-12 17:34:36','2022-12-12 17:34:36',NULL),(92,0,'7',4,'image/jpeg',2165,'products/7.jpg','[]','2022-12-12 17:34:36','2022-12-12 17:34:36',NULL),(93,0,'8-1',4,'image/jpeg',2165,'products/8-1.jpg','[]','2022-12-12 17:34:36','2022-12-12 17:34:36',NULL),(94,0,'8',4,'image/jpeg',2165,'products/8.jpg','[]','2022-12-12 17:34:36','2022-12-12 17:34:36',NULL),(95,0,'9-1',4,'image/jpeg',2165,'products/9-1.jpg','[]','2022-12-12 17:34:36','2022-12-12 17:34:36',NULL),(96,0,'9',4,'image/jpeg',2165,'products/9.jpg','[]','2022-12-12 17:34:36','2022-12-12 17:34:36',NULL),(97,0,'1',5,'image/jpeg',2165,'news/1.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(98,0,'10',5,'image/jpeg',2165,'news/10.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(99,0,'11',5,'image/jpeg',2165,'news/11.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(100,0,'2',5,'image/jpeg',2165,'news/2.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(101,0,'3',5,'image/jpeg',2165,'news/3.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(102,0,'4',5,'image/jpeg',2165,'news/4.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(103,0,'5',5,'image/jpeg',2165,'news/5.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(104,0,'6',5,'image/jpeg',2165,'news/6.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(105,0,'7',5,'image/jpeg',2165,'news/7.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(106,0,'8',5,'image/jpeg',2165,'news/8.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(107,0,'9',5,'image/jpeg',2165,'news/9.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(108,0,'1',6,'image/jpeg',2165,'testimonials/1.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(109,0,'2',6,'image/jpeg',2165,'testimonials/2.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(110,0,'3',6,'image/jpeg',2165,'testimonials/3.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(111,0,'4',6,'image/jpeg',2165,'testimonials/4.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(112,0,'1',7,'image/jpeg',3063,'sliders/1.jpg','[]','2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(113,0,'2',7,'image/jpeg',3063,'sliders/2.jpg','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(114,0,'3',7,'image/jpeg',3063,'sliders/3.jpg','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(115,0,'american-express',8,'image/png',3209,'general/american-express.png','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(116,0,'b-1',8,'image/jpeg',1955,'general/b-1.jpg','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(117,0,'b-2',8,'image/jpeg',1955,'general/b-2.jpg','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(118,0,'b-3',8,'image/jpeg',1955,'general/b-3.jpg','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(119,0,'discover',8,'image/png',2494,'general/discover.png','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(120,0,'favicon',8,'image/png',1803,'general/favicon.png','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(121,0,'logo-light',8,'image/png',3736,'general/logo-light.png','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(122,0,'logo',8,'image/png',3927,'general/logo.png','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(123,0,'master-card',8,'image/png',3407,'general/master-card.png','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(124,0,'newsletter',8,'image/jpeg',1248,'general/newsletter.jpg','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(125,0,'paypal',8,'image/png',2670,'general/paypal.png','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(126,0,'visa',8,'image/png',2841,'general/visa.png','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(127,0,'1',9,'image/jpeg',20539,'promotion/1.jpg','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(128,0,'2',9,'image/jpeg',18320,'promotion/2.jpg','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(129,0,'3',9,'image/jpeg',42872,'promotion/3.jpg','[]','2022-12-12 17:34:38','2022-12-12 17:34:38',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'brands','brands',0,'2022-12-12 17:34:30','2022-12-12 17:34:30',NULL),(2,0,'product-categories','product-categories',0,'2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(3,0,'customers','customers',0,'2022-12-12 17:34:31','2022-12-12 17:34:31',NULL),(4,0,'products','products',0,'2022-12-12 17:34:32','2022-12-12 17:34:32',NULL),(5,0,'news','news',0,'2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(6,0,'testimonials','testimonials',0,'2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(7,0,'sliders','sliders',0,'2022-12-12 17:34:37','2022-12-12 17:34:37',NULL),(8,0,'general','general',0,'2022-12-12 17:34:38','2022-12-12 17:34:38',NULL),(9,0,'promotion','promotion',0,'2022-12-12 17:34:38','2022-12-12 17:34:38',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,5,'main-menu','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `reference_id` int unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,1,0,NULL,NULL,'/products',NULL,0,'Products',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,1,0,NULL,NULL,'#',NULL,0,'Shop',NULL,'_self',1,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,1,3,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Product Category',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(5,1,3,1,'Botble\\Ecommerce\\Models\\Brand','/brands/fashion-live',NULL,0,'Brand',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(6,1,3,1,'Botble\\Ecommerce\\Models\\ProductTag','/product-tags/electronic',NULL,0,'Product Tag',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(7,1,3,NULL,NULL,'products/beat-headphone',NULL,0,'Product Single',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(8,1,0,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',1,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(9,1,8,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog Left Sidebar',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(10,1,8,1,'Botble\\Blog\\Models\\Category','/news/ecommerce',NULL,0,'Blog Category',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(11,1,8,1,'Botble\\Blog\\Models\\Tag','/tags/general',NULL,0,'Blog Tag',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(12,1,8,NULL,NULL,'news/4-expert-tips-on-how-to-choose-the-right-mens-wallet',NULL,0,'Blog Single',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(13,1,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(14,1,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Contact',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(15,2,0,4,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(16,2,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(17,2,0,6,'Botble\\Page\\Models\\Page','/location',NULL,0,'Location',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(18,2,0,7,'Botble\\Page\\Models\\Page','/affiliates',NULL,0,'Affiliates',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(19,2,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Contact',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(20,3,0,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Television',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(21,3,0,2,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/home-audio-theaters',NULL,0,'Mobile',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(22,3,0,3,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/tv-videos',NULL,0,'Headphone',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(23,3,0,4,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/camera-photos-videos',NULL,0,'Watches',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(24,3,0,5,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/cellphones-accessories',NULL,0,'Game',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(25,4,0,NULL,NULL,'/customer/overview',NULL,0,'My profile',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(26,4,0,NULL,NULL,'/wishlist',NULL,0,'Wishlist',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(27,4,0,NULL,NULL,'customer/orders',NULL,0,'Orders',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(28,4,0,NULL,NULL,'/orders/tracking',NULL,0,'Order tracking',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(29,5,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(30,5,0,NULL,NULL,'/products',NULL,0,'Sản phẩm',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(31,5,0,NULL,NULL,'#',NULL,0,'Cửa hàng',NULL,'_self',1,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(32,5,31,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Danh mục sản phẩm',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(33,5,31,1,'Botble\\Ecommerce\\Models\\Brand','/brands/fashion-live',NULL,0,'Thương hiệu',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(34,5,31,1,'Botble\\Ecommerce\\Models\\ProductTag','/product-tags/electronic',NULL,0,'Tag sản phẩm',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(35,5,31,NULL,NULL,'products/beat-headphone',NULL,0,'Sản phẩm chi tiết',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(36,5,0,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Tin tức',NULL,'_self',1,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(37,5,36,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog Left Sidebar',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(38,5,36,5,'Botble\\Blog\\Models\\Category',NULL,NULL,0,'Danh mục',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(39,5,36,6,'Botble\\Blog\\Models\\Tag',NULL,NULL,0,'Tag bài viết',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(40,5,36,NULL,NULL,'news/vi/4-expert-tips-on-how-to-choose-the-right-mens-wallet',NULL,0,'Bài viết chi tiết',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(41,5,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(42,5,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Liên hệ',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(43,6,0,4,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Về chúng tôi',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(44,6,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'Hỏi đáp',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(45,6,0,6,'Botble\\Page\\Models\\Page','/location',NULL,0,'Vị trí',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(46,6,0,7,'Botble\\Page\\Models\\Page','/affiliates',NULL,0,'Chi nhánh',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(47,6,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Liên hệ',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(48,7,0,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Tivi',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(49,7,0,2,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/home-audio-theaters',NULL,0,'Di động',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(50,7,0,3,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/tv-videos',NULL,0,'Tai nghe',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(51,7,0,4,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/camera-photos-videos',NULL,0,'Đồng hồ',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(52,7,0,5,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/cellphones-accessories',NULL,0,'Trò chơi',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(53,8,0,NULL,NULL,'/customer/overview',NULL,0,'Tài khoản của tôi',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(54,8,0,NULL,NULL,'/wishlist',NULL,0,'Danh sách yêu thích',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(55,8,0,NULL,NULL,'customer/orders',NULL,0,'Đơn hàng',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(56,8,0,NULL,NULL,'/orders/tracking',NULL,0,'Theo dõi đơn hàng',NULL,'_self',0,'2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'Useful Links','useful-links','published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'Categories','categories','published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,'My Account','my-account','published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(5,'Menu chính','menu-chinh','published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(6,'Liên kết hữu ích','lien-ket-huu-ich','published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(7,'Danh mục','danh-muc','published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(8,'Tài khoản','tai-khoan','published','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon','[\"flaticon-tv\"]',1,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(2,'icon','[\"flaticon-responsive\"]',10,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(3,'icon','[\"flaticon-headphones\"]',14,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(4,'icon','[\"flaticon-watch\"]',19,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(5,'icon','[\"flaticon-console\"]',24,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(6,'icon','[\"flaticon-camera\"]',25,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(7,'icon','[\"flaticon-music-system\"]',26,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(8,'icon','[\"flaticon-responsive\"]',27,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(9,'icon','[\"flaticon-plugins\"]',28,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(10,'icon','[\"flaticon-music-system\"]',29,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(11,'icon','[\"flaticon-monitor\"]',30,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(12,'icon','[\"flaticon-printer\"]',31,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(13,'icon','[\"flaticon-tv\"]',32,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(14,'icon','[\"flaticon-fax\"]',33,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(15,'icon','[\"flaticon-mouse\"]',34,'Botble\\Ecommerce\\Models\\ProductCategory','2022-12-12 17:34:31','2022-12-12 17:34:31'),(16,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',1,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(17,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',2,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(18,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',3,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(19,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',4,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(20,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',5,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(21,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',6,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(22,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',7,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(23,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',8,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(24,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',9,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(25,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',10,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(26,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',11,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(27,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',12,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(28,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',13,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(29,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',14,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(30,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',15,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(31,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',16,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(32,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',17,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(33,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',18,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(34,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',19,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(35,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',20,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(36,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',21,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(37,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',22,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(38,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',23,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(39,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',24,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(40,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',25,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(41,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',26,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(42,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',27,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(43,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',28,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(44,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',29,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(45,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',30,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(46,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',31,'Botble\\Ecommerce\\Models\\Product','2022-12-12 17:34:36','2022-12-12 17:34:36'),(47,'button_text','[\"Shop now\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-12-12 17:34:38','2022-12-12 17:34:38'),(48,'button_text','[\"Discover now\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-12-12 17:34:38','2022-12-12 17:34:38'),(49,'button_text','[\"Shop now\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-12-12 17:34:38','2022-12-12 17:34:38'),(50,'button_text','[\"Mua ngay\"]',4,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-12-12 17:34:38','2022-12-12 17:34:38'),(51,'button_text','[\"Kh\\u00e1m ph\\u00e1 ngay\"]',5,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-12-12 17:34:38','2022-12-12 17:34:38'),(52,'button_text','[\"Mua ngay\"]',6,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2022_04_20_100851_add_index_to_media_table',1),(17,'2022_04_20_101046_add_index_to_menu_table',1),(18,'2022_07_10_034813_move_lang_folder_to_root',1),(19,'2022_08_04_051940_add_missing_column_expires_at',1),(20,'2022_10_14_024629_drop_column_is_featured',1),(21,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(22,'2022_12_02_093615_update_slug_index_columns',1),(23,'2020_11_18_150916_ads_create_ads_table',2),(24,'2021_12_02_035301_add_ads_translations_table',2),(25,'2015_06_29_025744_create_audit_history',3),(26,'2015_06_18_033822_create_blog_table',4),(27,'2021_02_16_092633_remove_default_value_for_author_type',4),(28,'2021_12_03_030600_create_blog_translations',4),(29,'2022_04_19_113923_add_index_to_table_posts',4),(30,'2016_06_17_091537_create_contacts_table',5),(31,'2020_03_05_041139_create_ecommerce_tables',6),(32,'2021_01_01_044147_ecommerce_create_flash_sale_table',6),(33,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',6),(34,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',6),(35,'2021_02_18_073505_update_table_ec_reviews',6),(36,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',6),(37,'2021_03_10_025153_change_column_tax_amount',6),(38,'2021_03_20_033103_add_column_availability_to_table_ec_products',6),(39,'2021_04_28_074008_ecommerce_create_product_label_table',6),(40,'2021_05_31_173037_ecommerce_create_ec_products_translations',6),(41,'2021_06_28_153141_correct_slugs_data',6),(42,'2021_08_17_105016_remove_column_currency_id_in_some_tables',6),(43,'2021_08_30_142128_add_images_column_to_ec_reviews_table',6),(44,'2021_09_01_115151_remove_unused_fields_in_ec_products',6),(45,'2021_10_04_030050_add_column_created_by_to_table_ec_products',6),(46,'2021_10_05_122616_add_status_column_to_ec_customers_table',6),(47,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',6),(48,'2021_11_23_071403_correct_languages_for_product_variations',6),(49,'2021_11_28_031808_add_product_tags_translations',6),(50,'2021_12_01_031123_add_featured_image_to_ec_products',6),(51,'2022_01_01_033107_update_table_ec_shipments',6),(52,'2022_02_16_042457_improve_product_attribute_sets',6),(53,'2022_03_22_075758_correct_product_name',6),(54,'2022_04_19_113334_add_index_to_ec_products',6),(55,'2022_04_28_144405_remove_unused_table',6),(56,'2022_05_05_115015_create_ec_customer_recently_viewed_products_table',6),(57,'2022_05_18_143720_add_index_to_table_ec_product_categories',6),(58,'2022_06_16_095633_add_index_to_some_tables',6),(59,'2022_06_30_035148_create_order_referrals_table',6),(60,'2022_07_24_153815_add_completed_at_to_ec_orders_table',6),(61,'2022_08_14_032836_create_ec_order_returns_table',6),(62,'2022_08_14_033554_create_ec_order_return_items_table',6),(63,'2022_08_15_040324_add_billing_address',6),(64,'2022_08_30_091114_support_digital_products_table',6),(65,'2022_09_13_095744_create_options_table',6),(66,'2022_09_13_104347_create_option_value_table',6),(67,'2022_10_05_163518_alter_table_ec_order_product',6),(68,'2022_10_12_041517_create_invoices_table',6),(69,'2022_10_12_142226_update_orders_table',6),(70,'2022_10_13_024916_update_table_order_returns',6),(71,'2022_10_21_030830_update_columns_in_ec_shipments_table',6),(72,'2022_10_28_021046_update_columns_in_ec_shipments_table',6),(73,'2022_11_16_034522_update_type_column_in_ec_shipping_rules_table',6),(74,'2022_11_19_041643_add_ec_tax_product_table',6),(75,'2022_12_12_063830_update_tax_defadult_in_ec_tax_products_table',6),(76,'2018_07_09_221238_create_faq_table',7),(77,'2021_12_03_082134_create_faq_translations',7),(78,'2016_10_03_032336_create_languages_table',8),(79,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(80,'2021_12_03_075608_create_page_translations',9),(81,'2019_11_18_061011_create_country_table',10),(82,'2021_12_03_084118_create_location_translations',10),(83,'2021_12_03_094518_migrate_old_location_data',10),(84,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',10),(85,'2022_01_16_085908_improve_plugin_location',10),(86,'2022_08_04_052122_delete_location_backup_tables',10),(87,'2022_10_29_065232_increase_states_abbreviation_column',10),(88,'2022_11_06_061847_increase_state_translations_abbreviation_column',10),(89,'2017_10_24_154832_create_newsletter_table',11),(90,'2017_05_18_080441_create_payment_tables',12),(91,'2021_03_27_144913_add_customer_type_into_table_payments',12),(92,'2021_05_24_034720_make_column_currency_nullable',12),(93,'2021_08_09_161302_add_metadata_column_to_payments_table',12),(94,'2021_10_19_020859_update_metadata_field',12),(95,'2022_06_28_151901_activate_paypal_stripe_plugin',12),(96,'2022_07_07_153354_update_charge_id_in_table_payments',12),(97,'2017_07_11_140018_create_simple_slider_table',13),(98,'2018_07_09_214610_create_testimonial_table',14),(99,'2021_12_03_083642_create_testimonials_translations',14),(100,'2016_10_07_193005_create_translations_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[simple-slider key=\"home-slider\"][/simple-slider]</div><div>[featured-product-categories title=\"Top Categories\" subtitle=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.\"][/featured-product-categories]</div><div>[flash-sale title=\"Best deals for you\"][/flash-sale]</div><div>[product-collections title=\"Exclusive Products\"][/product-collections]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[trending-products title=\"Trending Products\"][/trending-products]</div><div>[product-blocks featured_product_title=\"Featured Products\" top_rated_product_title=\"Top Rated Products\" on_sale_product_title=\"On Sale Products\"][/product-blocks]</div><div>[featured-brands title=\"Our Brands\"][/featured-brands]</div><div>[featured-news title=\"Visit Our Blog\" subtitle=\"Our Blog updated the newest trend of the world regularly\"][/featured-news]</div><div>[testimonials title=\"Our Client Say!\"][/testimonials]</div><div>[our-features icon1=\"flaticon-shipped\" title1=\"Free Delivery\" subtitle1=\"Free shipping on all US order or order above $200\" icon2=\"flaticon-money-back\" title2=\"30 Day Returns Guarantee\" subtitle2=\"Simply return it within 30 days for an exchange\" icon3=\"flaticon-support\" title3=\"27/4 Online Support\" subtitle3=\"Contact us 24 hours a day, 7 days a week\"][/our-features]</div><div>[newsletter-form title=\"Join Our Newsletter Now\" subtitle=\"Register now to get updates on promotions.\"][/newsletter-form]</div>',1,NULL,'homepage',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'Contact us','<p>[contact-form][/contact-form]</p>',1,NULL,'default',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'Blog','<p>---</p>',1,NULL,'blog-sidebar',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,'About us','<p>Bill,\' she gave a sudden leap out of sight, they were mine before. If I or she should chance to be no chance of this, so that altogether, for the next witness was the Rabbit say, \'A barrowful of WHAT?\' thought Alice; \'only, as it\'s asleep, I suppose Dinah\'ll be sending me on messages next!\' And she opened the door as you can--\' \'Swim after them!\' screamed the Gryphon. \'How the creatures wouldn\'t be in a sort of idea that they must needs come wriggling down from the change: and Alice looked.</p>',1,NULL,'default',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(5,'FAQ','<div>[faqs][/faqs]</div>',1,NULL,'default',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(6,'Location','<p>Hatter and the shrill voice of the Shark, But, when the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at it uneasily, shaking it every now and then; such as, that a moment\'s delay would cost them their lives. All the time at the stick, running a very humble tone, going down on one of them.\' In another moment that it was only the pepper that makes them so shiny?\' Alice looked up, and began to tremble. Alice looked very uncomfortable. The first question of course had to.</p>',1,NULL,'default',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(7,'Affiliates','<p>You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was a body to cut it off from: that he had a consultation about this, and after a fashion, and this Alice thought she had wept when she first saw the Mock Turtle, suddenly dropping his voice; and Alice could not stand, and she tried to fancy what the name again!\' \'I won\'t interrupt again. I dare say you\'re wondering why I don\'t put my arm round your waist,\' the Duchess began in a tone of great.</p>',1,NULL,'default',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(8,'Brands','<p>[all-brands][/all-brands]</p>',1,NULL,'default',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
INSERT INTO `pages_translations` VALUES ('vi',1,'Trang chủ',NULL,'<div>[simple-slider key=\"slider-trang-chu\"][/simple-slider]</div><div>[featured-product-categories title=\"Danh mục nổi bật\" subtitle=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.\"][/featured-product-categories]</div><div>[flash-sale title=\"Khuyến mãi tốt nhất cho bạn\"][/flash-sale]</div><div>[product-collections title=\"Sản phẩm độc quyền\"][/product-collections]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[trending-products title=\"Sản phẩm xu hướng\"][/trending-products]</div><div>[product-blocks featured_product_title=\"Nổi bật\" top_rated_product_title=\"Xếp hạng cao nhất\" on_sale_product_title=\"Đang khuyến mãi\"][/product-blocks]</div><div>[featured-brands title=\"Thương hiệu\"][/featured-brands]</div><div>[featured-news title=\"Tin tức\" subtitle=\"Blog của chúng tôi cập nhật các xu hướng mới nhất của thế giới thường xuyên\"][/featured-news]</div><div>[testimonials title=\"Nhận xét từ khách hàng!\"][/testimonials]</div><div>[our-features icon1=\"flaticon-shipped\" title1=\"Miễn phí vận chuyển\" subtitle1=\"Giao hàng miễn phí cho tất cả các đơn đặt hàng tại Hoa Kỳ hoặc đơn hàng trên $200\" icon2=\"flaticon-money-back\" title2=\"Đảm bảo hoàn trả trong 30 ngày\" subtitle2=\"Chỉ cần trả lại nó trong vòng 30 ngày để đổi\" icon3=\"flaticon-support\" title3=\"Hỗ trợ trực tuyến 27/4\" subtitle3=\"Liên hệ với chúng tôi 24 giờ một ngày, 7 ngày một tuần\"][/our-features]</div><div>[newsletter-form title=\"Theo dõi bản tin ngay bây giờ\" subtitle=\"Đăng ký ngay để cập nhật các chương trình khuyến mãi.\"][/newsletter-form]</div>'),('vi',2,'Liên hệ',NULL,'<p>[contact-form][/contact-form]</p>'),('vi',3,'Tin tức',NULL,'<p>---</p>'),('vi',4,'Về chúng tôi',NULL,'<p>I can listen all day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Duchess, as she was to get her head pressing against the door, she walked on in the pool of tears which she found her head to keep back the wandering hair that curled all over their heads. She felt that she let the jury--\' \'If any one of them were animals, and some \'unimportant.\' Alice could hardly hear the rattle of the song. \'What trial is it?\' Alice panted as she could, for the.</p>'),('vi',5,'Câu hỏi thường gặp',NULL,'<div>[faqs][/faqs]</div>'),('vi',6,'Vị trí',NULL,'<p>Alice didn\'t think that very few little girls eat eggs quite as much use in waiting by the pope, was soon submitted to by all three dates on their backs was the Hatter. \'Nor I,\' said the March Hare went \'Sh! sh!\' and the jury eagerly wrote down all three to settle the question, and they walked off together. Alice laughed so much about a foot high: then she had never before seen a good many voices all talking together: she made out that one of them at dinn--\' she checked herself hastily. \'I.</p>'),('vi',7,'Chi nhánh',NULL,'<p>Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have none, Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the Cat, and vanished. Alice was rather glad there WAS no one else seemed inclined to say to itself, half to Alice. \'Only a thimble,\' said Alice hastily; \'but I\'m not Ada,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she thought, \'and hand round the neck of the jury had a little startled when.</p>'),('vi',8,'Thương hiệu',NULL,'<p>[all-brands][/all-brands]</p>'),('vi',9,'Chính sách cookie',NULL,'<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>');
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',0,'JQRHI7QMK8','paystack',NULL,1277.20,1,'completed','confirm',9,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(2,'USD',0,'EN0JTS2HIX','cod',NULL,1311.80,2,'pending','confirm',8,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(3,'USD',0,'XW4QOTCBWR','cod',NULL,572.00,3,'pending','confirm',8,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(4,'USD',0,'JXDO5K0FNX','stripe',NULL,336.90,4,'completed','confirm',4,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(5,'USD',0,'JV2Z6MX2FZ','cod',NULL,1481.80,5,'pending','confirm',10,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(6,'USD',0,'6Z4D8CHCI9','stripe',NULL,694.40,6,'completed','confirm',3,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(7,'USD',0,'W2J3BYODKX','bank_transfer',NULL,745.10,7,'pending','confirm',11,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(8,'USD',0,'RV5YG7KAIG','paystack',NULL,1320.20,8,'completed','confirm',1,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(9,'USD',0,'WTUDJWL1R6','paypal',NULL,339.00,9,'completed','confirm',5,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(10,'USD',0,'1BQML2J76O','paypal',NULL,686.95,10,'completed','confirm',4,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(11,'USD',0,'1ZST9MHEEN','paypal',NULL,1016.60,11,'completed','confirm',1,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(12,'USD',0,'JPMVRBPGLE','cod',NULL,582.40,12,'pending','confirm',10,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(13,'USD',0,'7SENYERKBI','paystack',NULL,683.40,13,'completed','confirm',3,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(14,'USD',0,'8RD7LCKYTR','sslcommerz',NULL,469.00,14,'completed','confirm',6,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(15,'USD',0,'CQGF9QIYW2','bank_transfer',NULL,587.40,15,'pending','confirm',2,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(16,'USD',0,'DSO20KGUZU','paypal',NULL,1010.60,16,'completed','confirm',8,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(17,'USD',0,'4SJ3TRGYF8','mollie',NULL,857.00,17,'completed','confirm',7,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(18,'USD',0,'4RYBUCPKRU','mollie',NULL,740.90,18,'completed','confirm',3,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(19,'USD',0,'MYKVFMG9FE','cod',NULL,637.50,19,'pending','confirm',6,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL),(20,'USD',0,'16PT4PSNEW','stripe',NULL,702.10,20,'completed','confirm',2,NULL,NULL,'2022-12-12 17:34:36','2022-12-12 17:34:36','Botble\\Ecommerce\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,2,1),(2,3,1),(3,1,2),(4,3,2),(5,1,3),(6,3,3),(7,1,4),(8,3,4),(9,1,5),(10,3,5),(11,2,6),(12,3,6),(13,2,7),(14,4,7),(15,1,8),(16,3,8),(17,1,9),(18,3,9),(19,2,10),(20,3,10),(21,2,11),(22,3,11);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,1,2),(7,2,2),(8,3,2),(9,4,2),(10,5,2),(11,1,3),(12,2,3),(13,3,3),(14,4,3),(15,5,3),(16,1,4),(17,2,4),(18,3,4),(19,4,4),(20,5,4),(21,1,5),(22,2,5),(23,3,5),(24,4,5),(25,5,5),(26,1,6),(27,2,6),(28,3,6),(29,4,6),(30,5,6),(31,1,7),(32,2,7),(33,3,7),(34,4,7),(35,5,7),(36,1,8),(37,2,8),(38,3,8),(39,4,8),(40,5,8),(41,1,9),(42,2,9),(43,3,9),(44,4,9),(45,5,9),(46,1,10),(47,2,10),(48,3,10),(49,4,10),(50,5,10),(51,1,11),(52,2,11),(53,3,11),(54,4,11),(55,5,11);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `author_id` (`author_id`),
  KEY `author_type` (`author_type`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'4 Expert Tips On How To Choose The Right Men’s Wallet','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',1174,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(2,'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',1153,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(3,'The Top 2020 Handbag Trends to Know','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',1958,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(4,'How to Match the Color of Your Handbag With an Outfit','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',1161,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(5,'How to Care for Leather Bags','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',965,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(6,'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',1193,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(7,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',1421,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(8,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/8.jpg',1091,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(9,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/9.jpg',577,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(10,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/10.jpg',1171,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37'),(11,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',1627,NULL,'2022-12-12 17:34:37','2022-12-12 17:34:37');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('vi',1,'4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',2,'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',3,'Xu hướng túi xách hàng đầu năm 2020 cần biết','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',4,'Cách Phối Màu Túi Xách Của Bạn Với Trang Phục','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',5,'Cách Chăm sóc Túi Da','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',6,'Chúng tôi đang nghiền ngẫm 10 xu hướng túi lớn nhất của mùa hè','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',7,'Những phẩm chất cần thiết của âm nhạc thành công cao','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',8,'9 điều tôi thích khi cạo đầu','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',9,'Tại sao làm việc theo nhóm thực sự biến giấc mơ thành công','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',10,'Thế giới phục vụ cho những người trung bình','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',11,'Các đương sự trên màn hình không phải là diễn viên','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n');
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
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
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\",\"mollie\"]',NULL,'2022-12-12 17:34:30'),(4,'language_hide_default','1',NULL,NULL),(5,'language_switcher_display','dropdown',NULL,NULL),(6,'language_display','all',NULL,NULL),(7,'language_hide_languages','[]',NULL,NULL),(8,'media_random_hash','a01923bcdffee8875c245c63d075a59f',NULL,NULL),(9,'simple_slider_using_assets','0',NULL,NULL),(10,'permalink-botble-blog-models-post','news',NULL,NULL),(11,'permalink-botble-blog-models-category','news',NULL,NULL),(12,'permalink-botble-blog-models-tag','tags',NULL,NULL),(13,'payment_cod_status','1',NULL,NULL),(14,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(15,'payment_bank_transfer_status','1',NULL,NULL),(16,'payment_bank_transfer_description','Please send money to our bank account: ACB - 8210 4345 19.',NULL,NULL),(17,'plugins_ecommerce_customer_new_order_status','0',NULL,NULL),(18,'plugins_ecommerce_admin_new_order_status','0',NULL,NULL),(19,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,NULL),(20,'payment_stripe_payment_type','stripe_checkout',NULL,NULL),(24,'New York','Singapore',NULL,NULL),(26,'ecommerce_is_enabled_support_digital_products','1',NULL,NULL),(28,'ecommerce_store_name','Shopwise',NULL,NULL),(29,'ecommerce_store_phone','123-456-7890',NULL,NULL),(30,'ecommerce_store_address','123 Street, Old Trafford',NULL,NULL),(31,'ecommerce_store_state','New York',NULL,NULL),(32,'ecommerce_store_city','New York',NULL,NULL),(33,'ecommerce_store_country','US',NULL,NULL),(34,'admin_logo','general/logo-light.png',NULL,NULL),(35,'admin_favicon','general/favicon.png',NULL,NULL),(36,'theme','shopwise',NULL,NULL),(37,'theme-shopwise-site_title','Shopwise - Laravel Ecommerce system',NULL,NULL),(38,'theme-shopwise-copyright','© 2022 Botble Technologies. All Rights Reserved.',NULL,NULL),(39,'theme-shopwise-favicon','general/favicon.png',NULL,NULL),(40,'theme-shopwise-logo','general/logo.png',NULL,NULL),(41,'theme-shopwise-logo_footer','general/logo-light.png',NULL,NULL),(42,'theme-shopwise-address','123 Street, Old Trafford, NewYork, USA',NULL,NULL),(43,'theme-shopwise-hotline','123-456-7890',NULL,NULL),(44,'theme-shopwise-email','info@sitename.com',NULL,NULL),(45,'theme-shopwise-payment_methods','[\"general\\/visa.png\",\"general\\/paypal.png\",\"general\\/master-card.png\",\"general\\/discover.png\",\"general\\/american-express.png\"]',NULL,NULL),(46,'theme-shopwise-newsletter_image','general/newsletter.jpg',NULL,NULL),(47,'theme-shopwise-homepage_id','1',NULL,NULL),(48,'theme-shopwise-blog_page_id','3',NULL,NULL),(49,'theme-shopwise-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(50,'theme-shopwise-cookie_consent_learn_more_url','https://shopwise.test/cookie-policy',NULL,NULL),(51,'theme-shopwise-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(52,'theme-shopwise-about-us','If you are going to use of Lorem Ipsum need to be sure there isn\'t hidden of text',NULL,NULL),(53,'theme-shopwise-vi-primary_font','Roboto Condensed',NULL,NULL),(54,'theme-shopwise-vi-copyright','© 2021 Botble Technologies. Tất cả quyền đã được bảo hộ.',NULL,NULL),(55,'theme-shopwise-vi-cookie_consent_message','Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ',NULL,NULL),(56,'theme-shopwise-vi-cookie_consent_learn_more_url','https://shopwise.test/cookie-policy',NULL,NULL),(57,'theme-shopwise-vi-cookie_consent_learn_more_text','Chính sách cookie',NULL,NULL),(58,'theme-shopwise-vi-homepage_id','1',NULL,NULL),(59,'theme-shopwise-vi-blog_page_id','3',NULL,NULL),(60,'theme-shopwise-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"ion-social-facebook\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#3b5998\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"ion-social-twitter\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#00acee\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"ion-social-youtube\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#c4302b\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"ion-social-instagram\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#3f729b\"}]]',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Woman Fashion','sliders/1.jpg',NULL,'Get up to 50% off Today Only!',1,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,1,'Man Fashion','sliders/2.jpg',NULL,'50% off in all products',2,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,1,'Summer Sale','sliders/3.jpg',NULL,'Taking your Viewing Experience to Next Level',3,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,2,'Thời trang Nam','sliders/1.jpg',NULL,'Được giảm giá tới 50% Chỉ hôm nay!',1,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(5,2,'Thời trang Nữ','sliders/2.jpg',NULL,'Khuyến mãi 50% tất cả sản phẩm',2,'2022-12-12 17:34:38','2022-12-12 17:34:38'),(6,2,'Khuyến mãi hè','sliders/3.jpg',NULL,'Nâng trải nghiệm xem của bạn lên cấp độ tiếp theo',3,'2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'Slider trang chủ','slider-trang-chu',NULL,'published','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'fashion-live',1,'Botble\\Ecommerce\\Models\\Brand','brands','2022-12-12 17:34:31','2022-12-12 17:34:31'),(2,'hand-crafted',2,'Botble\\Ecommerce\\Models\\Brand','brands','2022-12-12 17:34:31','2022-12-12 17:34:31'),(3,'mestonix',3,'Botble\\Ecommerce\\Models\\Brand','brands','2022-12-12 17:34:31','2022-12-12 17:34:31'),(4,'sunshine',4,'Botble\\Ecommerce\\Models\\Brand','brands','2022-12-12 17:34:31','2022-12-12 17:34:31'),(5,'pure',5,'Botble\\Ecommerce\\Models\\Brand','brands','2022-12-12 17:34:31','2022-12-12 17:34:31'),(6,'anfold',6,'Botble\\Ecommerce\\Models\\Brand','brands','2022-12-12 17:34:31','2022-12-12 17:34:31'),(7,'automotive',7,'Botble\\Ecommerce\\Models\\Brand','brands','2022-12-12 17:34:31','2022-12-12 17:34:31'),(8,'television',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(9,'home-audio-theaters',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(10,'tv-videos',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(11,'camera-photos-videos',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(12,'cellphones-accessories',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(13,'headphones',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(14,'videos-games',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(15,'wireless-speakers',8,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(16,'office-electronic',9,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(17,'mobile',10,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(18,'digital-cables',11,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(19,'audio-video-cables',12,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(20,'batteries',13,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(21,'headphone',14,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(22,'computer-tablets',15,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(23,'laptop',16,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(24,'monitors',17,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(25,'computer-components',18,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(26,'watches',19,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(27,'drive-storages',20,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(28,'gaming-laptop',21,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(29,'security-protection',22,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(30,'accessories',23,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(31,'game',24,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(32,'camera',25,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(33,'audio',26,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(34,'mobile-tablet',27,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(35,'accessories',28,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(36,'home-audio-theater',29,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(37,'tv-smart-box',30,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(38,'printer',31,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(39,'computer',32,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(40,'fax-machine',33,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(41,'mouse',34,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-12-12 17:34:31','2022-12-12 17:34:31'),(42,'smart-home-speaker',1,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(43,'headphone-ultra-bass',2,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(44,'boxed-bluetooth-headphone',3,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(45,'chikie-bluetooth-speaker',4,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(46,'camera-hikvision-hk-35vs8',5,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(47,'camera-samsung-ss-24',6,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(48,'leather-watch-band',7,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(49,'apple-iphone-13-plus',8,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(50,'macbook-pro-2015',9,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(51,'macbook-air-12-inch',10,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(52,'apple-watch-serial-7',11,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(53,'macbook-pro-13-inch',12,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(54,'apple-keyboard',13,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(55,'macsafe-80w',14,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(56,'hand-playstation',15,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(57,'apple-airpods-serial-3',16,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(58,'cool-smart-watches',17,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(59,'black-smart-watches',18,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(60,'leather-watch-band-serial-3',19,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(61,'macbook-pro-2015-13-inch',20,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(62,'historic-alarm-clock',21,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(63,'black-glasses',22,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(64,'phillips-mouse',23,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(65,'gaming-keyboard',24,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(66,'dual-camera-20mp',25,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(67,'smart-watches',26,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(68,'beat-headphone',27,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(69,'red-black-headphone',28,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(70,'audio-equipment',29,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(71,'smart-televisions',30,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(72,'samsung-smart-tv',31,'Botble\\Ecommerce\\Models\\Product','products','2022-12-12 17:34:36','2022-12-12 17:34:36'),(73,'electronic',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-12-12 17:34:36','2022-12-12 17:34:36'),(74,'mobile',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-12-12 17:34:36','2022-12-12 17:34:36'),(75,'iphone',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-12-12 17:34:36','2022-12-12 17:34:36'),(76,'printer',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-12-12 17:34:36','2022-12-12 17:34:36'),(77,'office',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-12-12 17:34:36','2022-12-12 17:34:36'),(78,'it',6,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-12-12 17:34:36','2022-12-12 17:34:36'),(79,'ecommerce',1,'Botble\\Blog\\Models\\Category','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(80,'fashion',2,'Botble\\Blog\\Models\\Category','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(81,'electronic',3,'Botble\\Blog\\Models\\Category','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(82,'commercial',4,'Botble\\Blog\\Models\\Category','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(83,'general',1,'Botble\\Blog\\Models\\Tag','tags','2022-12-12 17:34:37','2022-12-12 17:34:38'),(84,'design',2,'Botble\\Blog\\Models\\Tag','tags','2022-12-12 17:34:37','2022-12-12 17:34:38'),(85,'fashion',3,'Botble\\Blog\\Models\\Tag','tags','2022-12-12 17:34:37','2022-12-12 17:34:38'),(86,'branding',4,'Botble\\Blog\\Models\\Tag','tags','2022-12-12 17:34:37','2022-12-12 17:34:38'),(87,'modern',5,'Botble\\Blog\\Models\\Tag','tags','2022-12-12 17:34:37','2022-12-12 17:34:38'),(88,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(89,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',2,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(90,'the-top-2020-handbag-trends-to-know',3,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(91,'how-to-match-the-color-of-your-handbag-with-an-outfit',4,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(92,'how-to-care-for-leather-bags',5,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(93,'were-crushing-hard-on-summers-10-biggest-bag-trends',6,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(94,'essential-qualities-of-highly-successful-music',7,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(95,'9-things-i-love-about-shaving-my-head',8,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(96,'why-teamwork-really-makes-the-dream-work',9,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(97,'the-world-caters-to-average-people',10,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(98,'the-litigants-on-the-screen-are-not-actors',11,'Botble\\Blog\\Models\\Post','news','2022-12-12 17:34:37','2022-12-12 17:34:38'),(99,'homepage',1,'Botble\\Page\\Models\\Page','','2022-12-12 17:34:38','2022-12-12 17:34:38'),(100,'contact-us',2,'Botble\\Page\\Models\\Page','','2022-12-12 17:34:38','2022-12-12 17:34:38'),(101,'blog',3,'Botble\\Page\\Models\\Page','','2022-12-12 17:34:38','2022-12-12 17:34:38'),(102,'about-us',4,'Botble\\Page\\Models\\Page','','2022-12-12 17:34:38','2022-12-12 17:34:38'),(103,'faq',5,'Botble\\Page\\Models\\Page','','2022-12-12 17:34:38','2022-12-12 17:34:38'),(104,'location',6,'Botble\\Page\\Models\\Page','','2022-12-12 17:34:38','2022-12-12 17:34:38'),(105,'affiliates',7,'Botble\\Page\\Models\\Page','','2022-12-12 17:34:38','2022-12-12 17:34:38'),(106,'brands',8,'Botble\\Page\\Models\\Page','','2022-12-12 17:34:38','2022-12-12 17:34:38'),(107,'cookie-policy',9,'Botble\\Page\\Models\\Page','','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User','','published','2022-12-12 17:34:37','2022-12-12 17:34:37'),(2,'Design',1,'Botble\\ACL\\Models\\User','','published','2022-12-12 17:34:37','2022-12-12 17:34:37'),(3,'Fashion',1,'Botble\\ACL\\Models\\User','','published','2022-12-12 17:34:37','2022-12-12 17:34:37'),(4,'Branding',1,'Botble\\ACL\\Models\\User','','published','2022-12-12 17:34:37','2022-12-12 17:34:37'),(5,'Modern',1,'Botble\\ACL\\Models\\User','','published','2022-12-12 17:34:37','2022-12-12 17:34:37');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
INSERT INTO `tags_translations` VALUES ('vi',1,'Chung',NULL),('vi',2,'Thiết kế',NULL),('vi',3,'Thời trang',NULL),('vi',4,'Thương hiệu',NULL),('vi',5,'Hiện đại',NULL);
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Adam Williams','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/1.jpg','CEO Of Microsoft','published','2022-12-12 17:34:37','2022-12-12 17:34:37'),(2,'Retha Deowalim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/2.jpg','CEO Of Apple','published','2022-12-12 17:34:37','2022-12-12 17:34:37'),(3,'Sam J. Wasim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/3.jpg','Pio Founder','published','2022-12-12 17:34:37','2022-12-12 17:34:37'),(4,'Usan Gulwarm','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/4.jpg','CEO Of Facewarm','published','2022-12-12 17:34:37','2022-12-12 17:34:37');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
INSERT INTO `testimonials_translations` VALUES ('vi',1,'Adam Williams',NULL,'Giám đốc Microsoft'),('vi',2,'Retha Deowalim',NULL,'Giám đốc Apple'),('vi',3,'Sam J. Wasim',NULL,'Nhà sáng lập Pio'),('vi',4,'Usan Gulwarm',NULL,'Giám đốc Facewarm');
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4925 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@botble.com',NULL,'$2y$10$h7jxzRwaxsSae4.HDyH3C.bzvJgQpHLaV2ChgxFtVOAS0LRYXaoau',NULL,'2022-12-12 17:34:38','2022-12-12 17:34:38','System','Admin','botble',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','shopwise',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Useful Links\",\"menu_id\":\"useful-links\"}','2022-12-12 17:34:38','2022-12-12 17:34:38'),(2,'CustomMenuWidget','footer_sidebar','shopwise',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Categories\",\"menu_id\":\"categories\"}','2022-12-12 17:34:38','2022-12-12 17:34:38'),(3,'CustomMenuWidget','footer_sidebar','shopwise',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"My Account\",\"menu_id\":\"my-account\"}','2022-12-12 17:34:38','2022-12-12 17:34:38'),(4,'CustomMenuWidget','footer_sidebar','shopwise-vi',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Li\\u00ean k\\u1ebft h\\u1eefu \\u00edch\",\"menu_id\":\"lien-ket-huu-ich\"}','2022-12-12 17:34:38','2022-12-12 17:34:38'),(5,'CustomMenuWidget','footer_sidebar','shopwise-vi',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Danh m\\u1ee5c\",\"menu_id\":\"danh-muc\"}','2022-12-12 17:34:38','2022-12-12 17:34:38'),(6,'CustomMenuWidget','footer_sidebar','shopwise-vi',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"T\\u00e0i kho\\u1ea3n\",\"menu_id\":\"tai-khoan\"}','2022-12-12 17:34:38','2022-12-12 17:34:38');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-13  7:34:57