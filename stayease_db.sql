-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: stayease_db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add room',7,'add_room'),(26,'Can change room',7,'change_room'),(27,'Can delete room',7,'delete_room'),(28,'Can view room',7,'view_room'),(29,'Can add hotel',8,'add_hotel'),(30,'Can change hotel',8,'change_hotel'),(31,'Can delete hotel',8,'delete_hotel'),(32,'Can view hotel',8,'view_hotel'),(33,'Can add booking',9,'add_booking'),(34,'Can change booking',9,'change_booking'),(35,'Can delete booking',9,'delete_booking'),(36,'Can view booking',9,'view_booking'),(37,'Can add room type',10,'add_roomtype'),(38,'Can change room type',10,'change_roomtype'),(39,'Can delete room type',10,'delete_roomtype'),(40,'Can view room type',10,'view_roomtype');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$V1G1Y6cnPeHKwXEH9Tp5eH$BfY6M6ME3Pz9k6dpeOyCIwSd//lcZ97bF9nUGx50PBU=','2026-11-05 18:07:11.612726',1,'admin','','','admin@gmail.com',1,1,'2026-11-05 17:45:51.250298'),(2,'pbkdf2_sha256$1000000$TWT6MzkVpNvWh6uZKmrzYo$v3/McP+u1xNrhgSD4567LK3618Mg8lsvuQs3Yadb7uk=','2026-11-05 18:05:36.302635',0,'SankarapuKavya','','','',0,1,'2026-11-05 18:05:35.590870');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_booking`
--

DROP TABLE IF EXISTS `bookings_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `guests` int unsigned NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `room_type_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_booking_room_type_id_6370cf99_fk_hotels_roomtype_id` (`room_type_id`),
  KEY `bookings_booking_user_id_834dfc23_fk_auth_user_id` (`user_id`),
  CONSTRAINT `bookings_booking_room_type_id_6370cf99_fk_hotels_roomtype_id` FOREIGN KEY (`room_type_id`) REFERENCES `hotels_roomtype` (`id`),
  CONSTRAINT `bookings_booking_user_id_834dfc23_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `bookings_booking_chk_1` CHECK ((`guests` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_booking`
--

LOCK TABLES `bookings_booking` WRITE;
/*!40000 ALTER TABLE `bookings_booking` DISABLE KEYS */;
INSERT INTO `bookings_booking` VALUES (1,'2026-11-05','2026-11-07',2,4000.00,'Confirmed','2026-11-05 18:33:54.199538',1,2),(2,'2026-11-06','2026-11-07',1,4000.00,'Confirmed','2026-11-06 05:13:58.815864',6,1);
/*!40000 ALTER TABLE `bookings_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-11-05 18:12:58.740717','1','Grand Palace Hotel',1,'[{\"added\": {}}]',8,1),(2,'2026-11-05 18:18:26.249069','1','Standard Room - Grand Palace Hotel',1,'[{\"added\": {}}]',10,1),(3,'2026-11-05 18:40:11.400983','2','Ocean View Resort',1,'[{\"added\": {}}]',8,1),(4,'2026-11-05 18:40:59.953189','2','Standard Room - Ocean View Resort',1,'[{\"added\": {}}]',10,1),(5,'2026-11-05 18:43:24.375057','3','Royal Heritage Inn',1,'[{\"added\": {}}]',8,1),(6,'2026-11-05 18:44:11.702747','3','Deluxe room - Royal Heritage Inn',1,'[{\"added\": {}}]',10,1),(7,'2026-11-06 04:51:17.294312','4','Green Valley Residency',1,'[{\"added\": {}}]',8,1),(8,'2026-11-06 04:55:23.699780','4','Lxury - Green Valley Residency',1,'[{\"added\": {}}]',10,1),(9,'2026-11-06 04:56:41.751245','5','Standard Room - Green Valley Residency',1,'[{\"added\": {}}]',10,1),(10,'2026-11-06 05:03:14.476387','6','Luxury - Grand Palace Hotel',1,'[{\"added\": {}}]',10,1),(11,'2026-11-06 05:07:50.876115','7','Luxury - Royal Heritage Inn',1,'[{\"added\": {}}]',10,1),(12,'2026-11-06 05:09:55.267436','2','Ocean View Resort',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(13,'2026-11-06 05:11:54.884362','8','Standard Room - Royal Heritage Inn',1,'[{\"added\": {}}]',10,1),(14,'2026-11-06 05:12:27.821646','7','Luxury - Royal Heritage Inn',2,'[{\"changed\": {\"fields\": [\"Price per night\"]}}]',10,1),(15,'2026-11-06 05:12:48.437125','7','Luxury - Royal Heritage Inn',2,'[]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'bookings','booking'),(5,'contenttypes','contenttype'),(8,'hotels','hotel'),(7,'hotels','room'),(10,'hotels','roomtype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-11-05 17:27:15.579541'),(2,'auth','0001_initial','2026-11-05 17:27:16.606743'),(3,'admin','0001_initial','2026-11-05 17:27:16.831915'),(4,'admin','0002_logentry_remove_auto_add','2026-11-05 17:27:16.840840'),(5,'admin','0003_logentry_add_action_flag_choices','2026-11-05 17:27:16.855781'),(6,'contenttypes','0002_remove_content_type_name','2026-11-05 17:27:17.029927'),(7,'auth','0002_alter_permission_name_max_length','2026-11-05 17:27:17.132276'),(8,'auth','0003_alter_user_email_max_length','2026-11-05 17:27:17.167563'),(9,'auth','0004_alter_user_username_opts','2026-11-05 17:27:17.177564'),(10,'auth','0005_alter_user_last_login_null','2026-11-05 17:27:17.267843'),(11,'auth','0006_require_contenttypes_0002','2026-11-05 17:27:17.273131'),(12,'auth','0007_alter_validators_add_error_messages','2026-11-05 17:27:17.287289'),(13,'auth','0008_alter_user_username_max_length','2026-11-05 17:27:17.391457'),(14,'auth','0009_alter_user_last_name_max_length','2026-11-05 17:27:17.499630'),(15,'auth','0010_alter_group_name_max_length','2026-11-05 17:27:17.523637'),(16,'auth','0011_update_proxy_permissions','2026-11-05 17:27:17.533728'),(17,'auth','0012_alter_user_first_name_max_length','2026-11-05 17:27:17.638256'),(18,'sessions','0001_initial','2026-11-05 17:27:17.692424'),(19,'hotels','0001_initial','2026-11-05 17:36:23.395600'),(21,'bookings','0001_initial','2026-11-05 18:32:41.455026');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('yi8idmlkj05b80rqlfxktkwuthg7omqu','.eJxVjDsOwjAQRO_iGlmOgz-hpOcM1npngwPIkfKpEHcnkVJAOfPezFslWpeS1lmmNEBdlFWn3y4TP6XuAA-q91HzWJdpyHpX9EFnfRshr-vh_h0Umsu2zjhzdN44aeCtI0LfdwFk2uzQUitCCJKtRWO22DBiZG8QOsCAnfp8AQxEOQw:1xP1qC:xD1BQnEN1hDBAY0mw2aOfw91nTZuAFcYZYcedUcEo3A','2026-11-19 18:05:36.314463');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels_hotel`
--

DROP TABLE IF EXISTS `hotels_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels_hotel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `owner_id` int DEFAULT NULL,
  `contact_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hotels_hotel_owner_id_dae0ba86_fk_auth_user_id` (`owner_id`),
  KEY `hotels_hotel_city_1e892dbd` (`city`),
  CONSTRAINT `hotels_hotel_owner_id_dae0ba86_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels_hotel`
--

LOCK TABLES `hotels_hotel` WRITE;
/*!40000 ALTER TABLE `hotels_hotel` DISABLE KEYS */;
INSERT INTO `hotels_hotel` VALUES (1,'Grand Palace Hotel','Bengaluru','MG Road, Bengaluru','Luxury hotel with modern amenities and city views.','hotels/grand-palace-hotel.jpg','2026-11-05 18:12:58.734718',NULL,'9876543210'),(2,'Ocean View Resort','Goa','Calangute Beach Road, Goa','Beachside resort with swimming pool and sea-facing rooms.','hotels/ocean-view-resort.webp','2026-11-05 18:40:11.400983',NULL,'9876543211'),(3,'Royal Heritage Inn','Jaipur','MI Road, Jaipur','Traditional heritage stay with authentic Rajasthani ambiance.','hotels/Royal-heritage-villa.webp','2026-11-05 18:43:24.371779',NULL,'9876543212'),(4,'Green Valley Residency','Hyderabad','Banjara Hills, Hyderabad','Modern business hotel with spacious rooms.','hotels/Green-vally-villa.webp','2026-11-06 04:51:17.291425',NULL,'9876543213');
/*!40000 ALTER TABLE `hotels_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels_room`
--

DROP TABLE IF EXISTS `hotels_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` smallint unsigned NOT NULL,
  `price_per_night` decimal(9,2) NOT NULL,
  `total_rooms` smallint unsigned NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amenities` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotels_room_hotel_id_0ee74c95_fk_hotels_hotel_id` (`hotel_id`),
  CONSTRAINT `hotels_room_hotel_id_0ee74c95_fk_hotels_hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `hotels_hotel` (`id`),
  CONSTRAINT `hotels_room_chk_1` CHECK ((`capacity` >= 0)),
  CONSTRAINT `hotels_room_chk_2` CHECK ((`total_rooms` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels_room`
--

LOCK TABLES `hotels_room` WRITE;
/*!40000 ALTER TABLE `hotels_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotels_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels_roomtype`
--

DROP TABLE IF EXISTS `hotels_roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels_roomtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `total_rooms` int unsigned NOT NULL DEFAULT '1',
  `capacity` int unsigned NOT NULL DEFAULT '2',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotel_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotels_roomtype_hotel_fk` (`hotel_id`),
  CONSTRAINT `hotels_roomtype_hotel_fk` FOREIGN KEY (`hotel_id`) REFERENCES `hotels_hotel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels_roomtype`
--

LOCK TABLES `hotels_roomtype` WRITE;
/*!40000 ALTER TABLE `hotels_roomtype` DISABLE KEYS */;
INSERT INTO `hotels_roomtype` VALUES (1,'Standard Room','Comfortable room with basic amenities and city view.',2000.00,20,2,'rooms/grandhotel-room.webp',1),(2,'Standard Room','Spacious AC room with king-size bed',2000.00,10,2,'rooms/Ocean-Viewroom.jpg',2),(3,'Deluxe room','Spacious room with premium facilities.',3500.00,15,0,'rooms/royal-heritage-room.webp',3),(4,'Lxury','Spacious room with premium facilities.',4500.00,10,2,'rooms/green-valley-luxury.avif',4),(5,'Standard Room','Comfortable room with essential amenities.',2500.00,3,2,'rooms/green-valley-standard.webp',4),(6,'Luxury','Spacious room with premium facilities',4000.00,1,2,'rooms/grand-palace-luxury.jpeg',1),(7,'Luxury','Luxury suite with separate living area.',6500.00,12,2,'rooms/royal-heritage-luxury-room.webp',3),(8,'Standard Room','3500',4500.00,8,2,'rooms/royal-heritage-standard.jpeg',3);
/*!40000 ALTER TABLE `hotels_roomtype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-06 11:01:44
