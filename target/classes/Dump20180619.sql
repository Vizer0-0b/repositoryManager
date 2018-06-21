CREATE DATABASE  IF NOT EXISTS `rm_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rm_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: rm_db
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  `remainnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (67,'香蕉船','777',255),(69,'黄教主','hjz',299),(70,'臭屁龙','wcl',187),(72,'克里斯朵夫李维','klsdvlv',915),(73,'比利海林顿','bili_HLD',990000940),(76,'苹果','appl',1),(77,'香蕉','bana',0),(78,'橘子','oran',0),(79,'梨','pear',0),(80,'啤酒','beer',0),(81,'饮料','drin',0),(82,'矿泉水','water',90),(83,'花生','pean',0),(84,'瓜子','gnut',0),(85,'八宝粥','pori',0),(86,'3434','  ##&&',0),(89,'ioc','123456',0),(94,'zx','zx',0),(96,'c','c',0),(97,'v','v',0),(98,'xx','xx',0),(99,'xxx','xxx',0),(100,'ccc','ccc',0),(101,'zxczxc','xczc',0),(102,'hoholo','xczxc',0),(103,'scsc','xccs',0),(104,'aaa','aaa',0),(105,'sss','sss',0),(106,'ddd','ddd',0),(107,'asd','sdsa',0),(108,'qwe','qwe',0),(109,'qwer','qwer',0),(110,'qwww','qwewww',0),(111,'xcz','xcxv',0),(112,'bfbeb','bgfbe',0),(113,'wrbsd','vasdf',0),(114,'cssebd','sbaewb',0),(115,'vesbxf','evwbsdb',0),(116,'sfsfs','sffsfsfs',0),(117,'wef','sfxvx',0),(118,'dv','gegebfc',0),(119,'y','y',0),(120,'u','u',0),(122,'o','o',0),(124,'pp','pp',0),(125,'j,j,',',j,',20);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syspermission`
--

DROP TABLE IF EXISTS `syspermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syspermission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `parentIds` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `resourceType` enum('menu','button') DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syspermission`
--

LOCK TABLES `syspermission` WRITE;
/*!40000 ALTER TABLE `syspermission` DISABLE KEYS */;
INSERT INTO `syspermission` VALUES (1,'','用户管理',0,'0/','userInfo:view','menu','userInfo/userList'),(2,'','用户添加',1,'0/1','userInfo:add','button','userInfo/userAdd'),(3,'','用户删除',1,'0/1','userInfo:del','button','userInfo/userDel');
/*!40000 ALTER TABLE `syspermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysrole`
--

DROP TABLE IF EXISTS `sysrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysrole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysrole`
--

LOCK TABLES `sysrole` WRITE;
/*!40000 ALTER TABLE `sysrole` DISABLE KEYS */;
INSERT INTO `sysrole` VALUES (1,'','管理员','admin'),(2,'','VIP会员','vip');
/*!40000 ALTER TABLE `sysrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysrolepermission`
--

DROP TABLE IF EXISTS `sysrolepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysrolepermission` (
  `roleId` bigint(20) NOT NULL,
  `permissionId` bigint(20) NOT NULL,
  KEY `FK_pn90qffgw1e6lo1xhw964qadf` (`roleId`),
  KEY `FK_qr3wmwfxapktvdv5g6d4mbtta` (`permissionId`),
  CONSTRAINT `FK_pn90qffgw1e6lo1xhw964qadf` FOREIGN KEY (`roleId`) REFERENCES `sysrole` (`id`),
  CONSTRAINT `FK_qr3wmwfxapktvdv5g6d4mbtta` FOREIGN KEY (`permissionId`) REFERENCES `syspermission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysrolepermission`
--

LOCK TABLES `sysrolepermission` WRITE;
/*!40000 ALTER TABLE `sysrolepermission` DISABLE KEYS */;
INSERT INTO `sysrolepermission` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `sysrolepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysuserrole`
--

DROP TABLE IF EXISTS `sysuserrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysuserrole` (
  `uid` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  KEY `FK_io5ssq2ol6uqcx9nll8gfnm4n` (`uid`),
  KEY `FK_suwqmd7mystg1lwv8o4ffxaag` (`roleId`),
  CONSTRAINT `FK_io5ssq2ol6uqcx9nll8gfnm4n` FOREIGN KEY (`uid`) REFERENCES `userinfo` (`uid`),
  CONSTRAINT `FK_suwqmd7mystg1lwv8o4ffxaag` FOREIGN KEY (`roleId`) REFERENCES `sysrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysuserrole`
--

LOCK TABLES `sysuserrole` WRITE;
/*!40000 ALTER TABLE `sysuserrole` DISABLE KEYS */;
INSERT INTO `sysuserrole` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `sysuserrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UK_45fvrme4q2wy85b1vbf55hm6s` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'管理员','admin','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f',0);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-19 18:51:13
