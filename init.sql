-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: order
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `ID_CATEGORY` int(10) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Fruits'),(2,'Vegetables'),(3,'Dairy'),(4,'Alcohol'),(5,'sweets');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chief`
--

DROP TABLE IF EXISTS `chief`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chief` (
  `id_chief` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_chief`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chief`
--

LOCK TABLES `chief` WRITE;
/*!40000 ALTER TABLE `chief` DISABLE KEYS */;
INSERT INTO `chief` VALUES (1,'Stirm','Anneke'),(2,'Smith','Kate'),(3,'Sour','Ralph'),(4,'Spring','Nick');
/*!40000 ALTER TABLE `chief` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `ID_CITY` int(10) NOT NULL,
  `CITY` varchar(255) NOT NULL,
  `ID_COUNTRY` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID_CITY`),
  KEY `ID_COUNTRY` (`ID_COUNTRY`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`ID_COUNTRY`) REFERENCES `country` (`ID_COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Kyiv',1),(2,'Chernivtsi',1),(3,'Bilbao',2),(4,'Madrid',2),(5,'Kyshyniv',3),(6,'Bendery',3),(7,'Paris',4),(8,'Marsel',4),(9,'Munich',5),(10,'Berlin',5),(11,'Krakiv',6),(12,'London',7);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `ID_COUNTRY` int(10) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Ukraine'),(2,'Spain'),(3,'Moldova'),(4,'France'),(5,'Germany'),(6,'Poland'),(7,'Great Britain');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `ID_CUSTOMER` int(10) NOT NULL,
  `FIRST_NAME` varchar(255) NOT NULL,
  `LAST_NAME` varchar(255) NOT NULL,
  `ID_CITY` int(10) NOT NULL,
  `ID_COUNTRY` int(10) NOT NULL,
  PRIMARY KEY (`ID_CUSTOMER`),
  KEY `ID_CITY` (`ID_CITY`),
  KEY `ID_COUNTRY` (`ID_COUNTRY`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ID_CITY`) REFERENCES `city` (`ID_CITY`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`ID_COUNTRY`) REFERENCES `country` (`ID_COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Tania','Burshtein',2,1),(2,'Yuriy','Malyk',1,1),(3,'Zina','Aksonova',2,1),(4,'Olia','Nikitina',1,1),(5,'Cristiano','Ronaldo',4,2),(6,'Garet','Bale',4,2),(7,'Marcelo','Viera',4,2),(8,'Danilo','Silva',3,2),(9,'Lucy','Freeman',5,3),(10,'Lina','Popesku',5,3),(11,'Martin','Onchul',6,3),(12,'Lara','Kurbul',6,3),(13,'Peter','Swong',7,4),(14,'Nick','Lupen',8,4),(15,'Anna','Bugu',7,4),(16,'Liza','Shani',8,4),(17,'John','Rid',9,5),(18,'Jack','Rud',9,5),(19,'Jim','Rod',10,5),(20,'Joy','Red',10,5);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `ID_EMPLOYEE` int(10) NOT NULL,
  `FIRST_NAME` varchar(255) NOT NULL,
  `LAST_NAME` varchar(255) NOT NULL,
  `BIRTH_DATE` date NOT NULL,
  `ID_CITY` int(10) NOT NULL,
  `ID_COUNTRY` int(10) NOT NULL,
  `NOTE` varchar(255) NOT NULL,
  `id_chief` int(11) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  PRIMARY KEY (`ID_EMPLOYEE`),
  KEY `ID_CITY` (`ID_CITY`),
  KEY `ID_COUNTRY` (`ID_COUNTRY`),
  KEY `id_chief` (`id_chief`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ID_CITY`) REFERENCES `city` (`ID_CITY`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`ID_COUNTRY`) REFERENCES `country` (`ID_COUNTRY`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`id_chief`) REFERENCES `chief` (`id_chief`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Valerii','Ivanov','1978-11-09',1,1,'burshtein',1,'2017-05-25'),(2,'Andriy','Kotenko','1986-05-30',2,1,'burshtein',2,'2017-05-25'),(3,'Papa','Peres','1954-08-16',4,2,'oleksiuk',3,'2017-05-25'),(4,'Donald','Trump','1946-06-14',3,2,'oleksiuk',4,'2017-05-25'),(5,'Peter','Johnes','1954-12-03',6,3,'Horodetska',1,'2017-05-25'),(6,'Mary','Strein','1963-08-11',5,3,'Horodetska',2,'2017-05-25'),(7,'Steven','Long','1987-05-12',7,4,'yasinska',3,'2017-05-25'),(8,'Amanda','Stress','1968-06-18',8,4,'yasinska',3,'2017-05-25'),(9,'Mark','Sven','1990-10-01',9,5,'Olena',4,'2017-05-25'),(10,'Max','Suy','1991-10-01',10,5,'Olena',4,'2017-05-25'),(11,'Jack','Sparrow','1987-12-15',12,7,'oleksiuk',4,'2017-05-23'),(12,'David','Laptop','1980-09-08',12,7,'oleksiuk',4,'2017-05-23'),(13,'Adele','Adkins','1987-11-14',12,7,'oleksiuk',4,'2017-05-23'),(14,'Petro','Ivanovich','1990-12-31',1,1,'oleksiuk',1,'2017-05-25'),(15,'Serg','Pavlenko','1954-04-12',2,1,'oleksiuk',1,'2017-04-25'),(16,'Isko','Dagama','1965-08-08',4,2,'oleksiuk',1,'2017-03-25'),(17,'Serhio','Alvenso','1975-09-15',3,2,'oleksiuk',1,'2017-03-25'),(18,'Djanko','Popesky','1998-04-18',6,3,'oleksiuk',3,'2017-02-25'),(19,'Lilian','Floreskun','1945-08-14',5,3,'oleksiuk',3,'2017-06-25'),(20,'JanAvgust','Lebol','1977-02-13',8,4,'oleksiuk',3,'2017-05-21'),(21,'Fransisko','Gotie','1983-01-01',8,4,'oleksiuk',2,'2017-05-21'),(22,'Jurek','Samsinskii','1985-01-03',11,6,'oleksiuk',2,'2017-05-21'),(23,'Peter','Swift','1975-12-06',12,7,'horodetska',3,'2016-05-12'),(24,'Kate','Slow','1968-11-03',11,6,'horodetska',2,'2014-05-12'),(25,'Thor','Odinovich','1978-07-03',9,5,'horodetska',4,'2012-07-12'),(26,'Loki','Ragnarok','1978-06-05',10,5,'horodetska',4,'2011-08-12'),(27,'Freja','Northern','1958-12-08',9,5,'horodetska',3,'2005-07-12'),(28,'Bard','Gamer','1988-09-18',2,1,'horodetska',2,'2015-08-22'),(29,'Drack','Immortal','1948-10-28',5,3,'horodetska',1,'2006-09-25'),(107,'Fill','Deui','1990-06-28',7,4,'yasinska',4,'2017-05-25');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ID_ORDER` int(10) NOT NULL,
  `ID_CUSTOMER` int(10) NOT NULL,
  `ID_EMPLOYEE` int(10) NOT NULL,
  `ID_CITY` int(10) NOT NULL,
  `ID_COUNTRY` int(10) NOT NULL,
  `REC_DATE` date NOT NULL,
  `SHIP_DATE` date NOT NULL,
  PRIMARY KEY (`ID_ORDER`),
  KEY `ID_CUSTOMER` (`ID_CUSTOMER`),
  KEY `ID_EMPLOYEE` (`ID_EMPLOYEE`),
  KEY `ID_CITY` (`ID_CITY`),
  KEY `ID_COUNTRY` (`ID_COUNTRY`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID_CUSTOMER`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`ID_EMPLOYEE`) REFERENCES `employee` (`ID_EMPLOYEE`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`ID_CITY`) REFERENCES `city` (`ID_CITY`),
  CONSTRAINT `order_ibfk_4` FOREIGN KEY (`ID_COUNTRY`) REFERENCES `country` (`ID_COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,1,1,1,'2017-05-01','2017-05-10'),(2,3,2,2,1,'2017-05-02','2017-05-11'),(3,5,3,4,2,'2017-05-01','2017-05-04'),(4,8,4,3,2,'2017-04-15','2017-05-16'),(5,9,6,6,3,'2017-03-09','2017-03-17'),(6,11,5,6,3,'2017-02-23','2017-03-01'),(7,15,8,8,4,'2017-02-14','2017-02-16'),(8,13,7,7,4,'2017-04-05','2017-04-18'),(9,17,9,9,5,'2017-01-10','2017-01-20'),(10,18,10,10,5,'2017-02-10','2017-02-20'),(11,13,7,7,4,'2017-02-23','2017-03-01'),(12,13,7,7,4,'2017-02-23','2017-02-23'),(13,15,7,7,4,'2017-01-10','2017-01-10'),(14,15,7,7,4,'2017-02-23','2017-02-23'),(15,16,9,8,4,'2017-01-10','2017-01-10'),(21,4,6,4,5,'2017-04-09','2017-03-27'),(22,4,6,4,5,'2017-05-09','2017-05-24');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `ID_PRODUCT` int(10) NOT NULL,
  `ID_ORDER` int(10) NOT NULL,
  `QUANTITY` int(10) NOT NULL,
  PRIMARY KEY (`ID_PRODUCT`,`ID_ORDER`),
  KEY `ID_ORDER` (`ID_ORDER`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `product` (`ID_PRODUCT`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`ID_ORDER`) REFERENCES `order` (`ID_ORDER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,5),(1,11,3),(2,2,6),(2,13,2),(2,14,1),(3,4,15),(4,3,10),(5,6,3),(5,11,5),(6,5,2),(6,15,12),(7,7,5),(8,8,6),(9,9,3),(10,10,2),(10,12,11);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ID_PRODUCT` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `ID_CATEGORY` int(11) NOT NULL,
  `ID_COUNTRY` int(11) NOT NULL,
  PRIMARY KEY (`ID_PRODUCT`),
  KEY `ID_CATEGORY` (`ID_CATEGORY`),
  KEY `ID_COUNTRY` (`ID_COUNTRY`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ID_CATEGORY`) REFERENCES `category` (`ID_CATEGORY`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`ID_COUNTRY`) REFERENCES `country` (`ID_COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Apple',10,1,1),(2,'Pear',14,1,1),(3,'Pepper',6,2,2),(4,'Tomato',8,2,2),(5,'butter',10,3,3),(6,'cheese',15,3,3),(7,'Anjou wine',10,4,4),(8,'Chateau Corbin Michotte wine',50,4,4),(9,'Chocolate',10,5,5),(10,'Ice-cream',7,5,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-29 14:17:37

