-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: console
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `baseline_differences`
--

DROP TABLE IF EXISTS `baseline_differences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseline_differences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_resource_id` int(11) DEFAULT NULL,
  `baseline_resource_id` int(11) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `resource_status_digest` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_name` varchar(5120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `node_baseline_id` int(11) DEFAULT NULL,
  `decided_at` datetime DEFAULT NULL,
  `baseline_resource_digest` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_baseline_differences_on_baseline_resource_digest` (`baseline_resource_digest`),
  KEY `index_baseline_differences_on_decided_at_and_accepted` (`decided_at`,`accepted`),
  KEY `index_baseline_differences_on_node_baseline_id` (`node_baseline_id`),
  KEY `index_baseline_differences_on_resource_status_digest` (`resource_status_digest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseline_differences`
--

LOCK TABLES `baseline_differences` WRITE;
/*!40000 ALTER TABLE `baseline_differences` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseline_differences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseline_properties`
--

DROP TABLE IF EXISTS `baseline_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseline_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseline_resource_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_baseline_properties_on_baseline_resource_id` (`baseline_resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseline_properties`
--

LOCK TABLES `baseline_properties` WRITE;
/*!40000 ALTER TABLE `baseline_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseline_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseline_resources`
--

DROP TABLE IF EXISTS `baseline_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseline_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseline_id` int(11) DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_on_baseline_id_resource_type_and_title` (`baseline_id`,`resource_type`,`title`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseline_resources`
--

LOCK TABLES `baseline_resources` WRITE;
/*!40000 ALTER TABLE `baseline_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseline_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baselines`
--

DROP TABLE IF EXISTS `baselines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baselines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baselines`
--

LOCK TABLES `baselines` WRITE;
/*!40000 ALTER TABLE `baselines` DISABLE KEYS */;
/*!40000 ALTER TABLE `baselines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_reports`
--

DROP TABLE IF EXISTS `custom_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `node_baseline_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `node_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_reports_on_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_reports`
--

LOCK TABLES `custom_reports` WRITE;
/*!40000 ALTER TABLE `custom_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_reports_node_baselines`
--

DROP TABLE IF EXISTS `custom_reports_node_baselines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_reports_node_baselines` (
  `custom_report_id` int(11) DEFAULT NULL,
  `node_baseline_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_reports_node_baselines`
--

LOCK TABLES `custom_reports_node_baselines` WRITE;
/*!40000 ALTER TABLE `custom_reports_node_baselines` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_reports_node_baselines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_job_failures`
--

DROP TABLE IF EXISTS `delayed_job_failures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_job_failures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `backtrace` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_job_failures`
--

LOCK TABLES `delayed_job_failures` WRITE;
/*!40000 ALTER TABLE `delayed_job_failures` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_job_failures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` longtext COLLATE utf8_unicode_ci,
  `last_error` text COLLATE utf8_unicode_ci,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` decimal(12,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_metrics_on_report_id` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_baselines`
--

DROP TABLE IF EXISTS `node_baselines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_baselines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `baseline_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reference_node_id` int(11) DEFAULT NULL,
  `diffed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_node_baselines_on_node_id_reference_node_id_and_date` (`node_id`,`reference_node_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_baselines`
--

LOCK TABLES `node_baselines` WRITE;
/*!40000 ALTER TABLE `node_baselines` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_baselines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_class_memberships`
--

DROP TABLE IF EXISTS `node_class_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_class_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `node_class_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_class_memberships`
--

LOCK TABLES `node_class_memberships` WRITE;
/*!40000 ALTER TABLE `node_class_memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_class_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_classes`
--

DROP TABLE IF EXISTS `node_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_classes`
--

LOCK TABLES `node_classes` WRITE;
/*!40000 ALTER TABLE `node_classes` DISABLE KEYS */;
INSERT INTO `node_classes` VALUES (1,'pe_compliance','2012-10-31 21:56:04','2012-10-31 21:56:04'),(2,'pe_accounts','2012-10-31 21:56:04','2012-10-31 21:56:04'),(3,'pe_mcollective','2012-10-31 21:56:04','2012-10-31 21:56:04'),(4,'splunk','2012-10-31 22:51:09','2012-10-31 22:51:09'),(5,'tomcat','2012-10-31 22:51:16','2012-10-31 22:51:16'),(6,'tomcat::jenkins','2012-10-31 22:51:22','2012-10-31 22:51:22'),(7,'tomcat::sunjdk','2012-10-31 22:51:28','2012-10-31 22:51:28');
/*!40000 ALTER TABLE `node_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_group_class_memberships`
--

DROP TABLE IF EXISTS `node_group_class_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_group_class_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_group_id` int(11) DEFAULT NULL,
  `node_class_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_group_class_memberships`
--

LOCK TABLES `node_group_class_memberships` WRITE;
/*!40000 ALTER TABLE `node_group_class_memberships` DISABLE KEYS */;
INSERT INTO `node_group_class_memberships` VALUES (1,1,1,'2012-10-31 21:56:04','2012-10-31 21:56:04'),(2,1,2,'2012-10-31 21:56:04','2012-10-31 21:56:04'),(3,1,3,'2012-10-31 21:56:04','2012-10-31 21:56:04'),(4,2,4,'2012-10-31 22:51:40','2012-10-31 22:51:40'),(5,5,5,'2012-10-31 22:51:54','2012-10-31 22:51:54'),(6,5,7,'2012-10-31 22:51:54','2012-10-31 22:51:54'),(7,6,6,'2012-10-31 22:52:25','2012-10-31 22:52:25');
/*!40000 ALTER TABLE `node_group_class_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_group_edges`
--

DROP TABLE IF EXISTS `node_group_edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_group_edges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_group_edges`
--

LOCK TABLES `node_group_edges` WRITE;
/*!40000 ALTER TABLE `node_group_edges` DISABLE KEYS */;
INSERT INTO `node_group_edges` VALUES (1,2,3,'2012-10-31 22:50:03','2012-10-31 22:50:03'),(2,2,4,'2012-10-31 22:50:27','2012-10-31 22:50:27'),(3,5,6,'2012-10-31 22:52:25','2012-10-31 22:52:25');
/*!40000 ALTER TABLE `node_group_edges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_group_memberships`
--

DROP TABLE IF EXISTS `node_group_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_group_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `node_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_group_memberships`
--

LOCK TABLES `node_group_memberships` WRITE;
/*!40000 ALTER TABLE `node_group_memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_group_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_groups`
--

DROP TABLE IF EXISTS `node_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_groups`
--

LOCK TABLES `node_groups` WRITE;
/*!40000 ALTER TABLE `node_groups` DISABLE KEYS */;
INSERT INTO `node_groups` VALUES (1,'default','2012-10-31 21:56:04','2012-10-31 21:56:04'),(2,'Splunk','2012-10-31 22:49:34','2012-10-31 22:49:34'),(3,'Splunk Forwarder','2012-10-31 22:50:03','2012-10-31 22:50:03'),(4,'Splunk Server','2012-10-31 22:50:27','2012-10-31 22:50:27'),(5,'Tomcat','2012-10-31 22:50:55','2012-10-31 22:50:55'),(6,'Tomcat Jenkins','2012-10-31 22:52:25','2012-10-31 22:52:25');
/*!40000 ALTER TABLE `node_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reported_at` datetime DEFAULT NULL,
  `last_apply_report_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `last_inspect_report_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_node_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_reports`
--

DROP TABLE IF EXISTS `old_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `report` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_reports`
--

LOCK TABLES `old_reports` WRITE;
/*!40000 ALTER TABLE `old_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `old_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `parameterable_id` int(11) DEFAULT NULL,
  `parameterable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
INSERT INTO `parameters` VALUES (1,'splunk_logging_server','example.domain',2,'NodeGroup','2012-10-31 22:49:34','2012-10-31 22:49:34'),(2,'splunk_forwarder_port','8003',2,'NodeGroup','2012-10-31 22:49:34','2012-10-31 22:49:34'),(3,'splunk_syslog_port','8004',2,'NodeGroup','2012-10-31 22:49:34','2012-10-31 22:49:34'),(4,'splunk_deploy','forwarder',3,'NodeGroup','2012-10-31 22:50:03','2012-10-31 22:50:03'),(5,'splunk_deploy','server',4,'NodeGroup','2012-10-31 22:50:27','2012-10-31 22:50:27'),(6,'tomcat_version','6.0.35',5,'NodeGroup','2012-10-31 22:50:55','2012-10-31 22:50:55'),(7,'jenkins_version','1.400',6,'NodeGroup','2012-10-31 22:52:25','2012-10-31 22:52:25');
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_logs`
--

DROP TABLE IF EXISTS `report_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `source` text COLLATE utf8_unicode_ci,
  `tags` text COLLATE utf8_unicode_ci,
  `time` datetime DEFAULT NULL,
  `file` text COLLATE utf8_unicode_ci,
  `line` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_report_logs_on_report_id` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_logs`
--

LOCK TABLES `report_logs` WRITE;
/*!40000 ALTER TABLE `report_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kind` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `puppet_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reports_on_node_id` (`node_id`),
  KEY `index_reports_on_time_and_node_id_and_status` (`time`,`node_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_events`
--

DROP TABLE IF EXISTS `resource_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_status_id` int(11) NOT NULL,
  `previous_value` text COLLATE utf8_unicode_ci,
  `desired_value` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `property` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `historical_value` text COLLATE utf8_unicode_ci,
  `audited` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resource_events_on_resource_status_id` (`resource_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_events`
--

LOCK TABLES `resource_events` WRITE;
/*!40000 ALTER TABLE `resource_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_statuses`
--

DROP TABLE IF EXISTS `resource_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `evaluation_time` decimal(12,6) DEFAULT NULL,
  `file` text COLLATE utf8_unicode_ci,
  `line` int(11) DEFAULT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `time` datetime DEFAULT NULL,
  `change_count` int(11) DEFAULT NULL,
  `out_of_sync_count` int(11) DEFAULT NULL,
  `skipped` tinyint(1) DEFAULT NULL,
  `failed` tinyint(1) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resource_statuses_on_report_id` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_statuses`
--

LOCK TABLES `resource_statuses` WRITE;
/*!40000 ALTER TABLE `resource_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20090916215745'),('20090916221313'),('20090917163433'),('20090917163500'),('20090921151631'),('20091025181245'),('20091025182048'),('20091028174517'),('20091028210805'),('20091110002528'),('20091110005353'),('20091116212418'),('20091116235339'),('20091120013227'),('20091130201400'),('20091208225308'),('20091215194836'),('20091217192540'),('20091217212330'),('20100318131825'),('20100726070117'),('20100806181533'),('20100810011613'),('20100811204545'),('20100909191050'),('20100916183948'),('20101109001012'),('20101118222325'),('20101206225510'),('20101229023023'),('20101230054456'),('20110105015322'),('20110105231637'),('20110105231833'),('20110105233543'),('20110105233640'),('20110105234202'),('20110106002514'),('20110107233911'),('20110113012919'),('20110113013807'),('20110113183616'),('20110113195253'),('20110114190814'),('20110129205337'),('20110130010154'),('20110603183820'),('20110608203112'),('20110614234202'),('20110620111500'),('20110621142500'),('20110623175454'),('20110624183142'),('20110624224839'),('20110627204941'),('20110628211230'),('20110629172000'),('20110629194556'),('20110630003336'),('20110630205109'),('20110701222801'),('20110703002239'),('20110707120700'),('20110707132200'),('20110707165000'),('20110714122200'),('20110728195829'),('20110729201310'),('20110818164856'),('20111118204121'),('20120112195235');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline_events`
--

DROP TABLE IF EXISTS `timeline_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeline_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actor_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondary_subject_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `secondary_subject_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline_events`
--

LOCK TABLES `timeline_events` WRITE;
/*!40000 ALTER TABLE `timeline_events` DISABLE KEYS */;
INSERT INTO `timeline_events` VALUES (1,'added_to','Parameter',NULL,NULL,1,NULL,NULL,'2012-10-31 22:49:34','2012-10-31 22:49:34'),(2,'added_to','Parameter',NULL,NULL,2,NULL,NULL,'2012-10-31 22:49:34','2012-10-31 22:49:34'),(3,'added_to','Parameter',NULL,NULL,3,NULL,NULL,'2012-10-31 22:49:34','2012-10-31 22:49:34'),(4,'changed_on','Parameter',NULL,'NodeGroup',1,NULL,2,'2012-10-31 22:49:34','2012-10-31 22:49:34'),(5,'changed_on','Parameter',NULL,'NodeGroup',2,NULL,2,'2012-10-31 22:49:34','2012-10-31 22:49:34'),(6,'changed_on','Parameter',NULL,'NodeGroup',3,NULL,2,'2012-10-31 22:49:34','2012-10-31 22:49:34'),(7,'added_to','Parameter',NULL,NULL,4,NULL,NULL,'2012-10-31 22:50:03','2012-10-31 22:50:03'),(8,'changed_on','Parameter',NULL,'NodeGroup',4,NULL,3,'2012-10-31 22:50:03','2012-10-31 22:50:03'),(9,'added_to','Parameter',NULL,NULL,5,NULL,NULL,'2012-10-31 22:50:27','2012-10-31 22:50:27'),(10,'changed_on','Parameter',NULL,'NodeGroup',5,NULL,4,'2012-10-31 22:50:27','2012-10-31 22:50:27'),(11,'added_to','Parameter',NULL,NULL,6,NULL,NULL,'2012-10-31 22:50:55','2012-10-31 22:50:55'),(12,'changed_on','Parameter',NULL,'NodeGroup',6,NULL,5,'2012-10-31 22:50:55','2012-10-31 22:50:55'),(13,'changed_on','Parameter',NULL,'NodeGroup',1,NULL,2,'2012-10-31 22:51:40','2012-10-31 22:51:40'),(14,'changed_on','Parameter',NULL,'NodeGroup',2,NULL,2,'2012-10-31 22:51:40','2012-10-31 22:51:40'),(15,'changed_on','Parameter',NULL,'NodeGroup',3,NULL,2,'2012-10-31 22:51:40','2012-10-31 22:51:40'),(16,'changed_on','Parameter',NULL,'NodeGroup',6,NULL,5,'2012-10-31 22:51:54','2012-10-31 22:51:54'),(17,'added_to','Parameter',NULL,NULL,7,NULL,NULL,'2012-10-31 22:52:25','2012-10-31 22:52:25'),(18,'changed_on','Parameter',NULL,'NodeGroup',7,NULL,6,'2012-10-31 22:52:25','2012-10-31 22:52:25');
/*!40000 ALTER TABLE `timeline_events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-31 22:53:33
