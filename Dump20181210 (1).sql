-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: final
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auction` (
  `AuctionID` int(9) NOT NULL,
  `BidIncrement` decimal(13,2) DEFAULT NULL,
  `OpeningBid` decimal(13,2) DEFAULT NULL,
  `ClosingBid` decimal(13,2) DEFAULT NULL,
  `ProxyBid` decimal(13,2) DEFAULT NULL,
  `CurrentBid` decimal(13,2) DEFAULT NULL,
  `Reserve` decimal(13,2) DEFAULT NULL,
  `Monitor` int(9) NOT NULL,
  `ItemID` int(9) NOT NULL,
  PRIMARY KEY (`AuctionID`),
  KEY `Monitor` (`Monitor`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`Monitor`) REFERENCES `employee` (`employeeid`) ON UPDATE CASCADE,
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`itemid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (100,1.00,5.00,11.00,15.00,11.00,10.00,123456789,1),(101,10.00,1000.00,NULL,NULL,NULL,2000.00,123456789,1),(102,10.00,1000.00,235.00,NULL,235.00,2000.00,123456789,2),(103,10.00,1000.00,14922.00,NULL,14922.00,2000.00,123456789,3),(104,10.00,1000.00,2000000.00,NULL,2000000.00,2000.00,789123456,4),(105,1.00,5.00,999992.00,99999995.00,999992.00,10.00,789123456,4);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bid` (
  `CustomerID` int(9) NOT NULL,
  `AuctionID` int(9) NOT NULL,
  `BidTime` datetime NOT NULL,
  `BidPlaced` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`,`AuctionID`,`BidTime`),
  KEY `AuctionID` (`AuctionID`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`customerid`) ON UPDATE CASCADE,
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`AuctionID`) REFERENCES `auction` (`auctionid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (111222333,100,'2008-12-15 13:00:00',10.00),(111222333,100,'2008-12-15 13:01:00',10.00),(111222333,100,'2008-12-15 15:00:00',15.00),(111222333,102,'2008-12-10 13:00:00',235.00),(222333444,100,'2008-12-10 13:00:00',10.00),(222333444,103,'2008-12-15 13:00:00',14922.00),(222333444,104,'2008-12-10 13:00:00',2000000.00),(999999999,105,'2008-12-10 13:00:00',99999995.00);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `CustomerID` int(9) NOT NULL,
  `CreditCardNum` varchar(30) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `person` (`ssn`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (111222333,'1234-5678-1234-5678',1),(222333444,'5678-1234-5678-1234',1),(333222111,'6789-2345-6789-2345',1),(444333222,'2345-6789-2345-6789',1),(999999999,'9999-9999-9999-9999',2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `EmployeeID` int(9) NOT NULL,
  `StartDate` datetime DEFAULT NULL,
  `HourlyRate` decimal(13,0) DEFAULT NULL,
  `Title` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `person` (`ssn`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (123456789,'1998-11-01 00:00:00',60,'Customer Representative'),(789123456,'1999-02-02 00:00:00',50,'Manager');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `ItemID` int(9) NOT NULL,
  `Description` char(255) DEFAULT NULL,
  `ItemName` char(255) DEFAULT NULL,
  `ItemType` varchar(60) DEFAULT NULL,
  `YearManufactured` year(4) DEFAULT NULL,
  `NumCopies` int(9) DEFAULT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'a wonderful movie','Titanic','DVD',2005,5),(2,'Used Nissan Sentra Car','Nissan Sentra','Car',2007,0),(3,'Toyora Camry','Toyota Camry','Car',2008,3),(4,'Lexus IS','Lexus','Car',2008,5);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person` (
  `SSN` int(9) NOT NULL,
  `LastName` char(50) NOT NULL,
  `FirstName` char(50) NOT NULL,
  `Address` char(255) DEFAULT NULL,
  `City` char(20) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  `Email` char(100) DEFAULT NULL,
  `PWD` char(30) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (111222333,'Lu','Shiyong','123 Success Street','Stony Brook','NY',11790,'5166328959','shiyong@cs.sunysb.edu','password'),(123456789,'Smith','David','123 College road','Stony Brook','NY',11790,'5162152345','dsmith@cs.sunysb.edu','password5'),(222333444,'Du','Haixia','456 Fortune Road','Stony Brook','NY',11790,'5166324360','dhaixia@cs.sunysb.edu','password2'),(333222111,'Phil','Lewis','135 Knowledge Lane','Stony Brook','NY',11794,'5166668888','pml@cs.sunysb.edu','password4'),(444333222,'Smith','John','789 Peace Blvd','Los Angeles','CA',12345,'4124434321','shlu@ic.sunysb.edu','password3'),(789123456,'Warren','David','456 Sunken Street','Stony Brook','NY',11794,'5166329987','dwarren@cs.sunysb.edu','password6'),(999999999,'Per','Son','2929292 Street','Stony Brook','NY',11790,'7182929018','pson@cs.sunysb.edu','password7');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post` (
  `ClosingDate` datetime DEFAULT NULL,
  `PostDate` datetime DEFAULT NULL,
  `CustomerID` int(9) NOT NULL,
  `AuctionID` int(9) NOT NULL,
  PRIMARY KEY (`CustomerID`,`AuctionID`),
  KEY `AuctionID` (`AuctionID`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`customerid`) ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`AuctionID`) REFERENCES `auction` (`auctionid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('2008-12-16 13:00:00','2008-12-06 13:00:00',333222111,100),('2008-12-07 13:00:00','2008-12-17 13:00:00',333222111,101),('2008-12-18 13:00:00','2008-12-08 13:00:00',444333222,102),('2008-12-19 13:00:00','2008-12-09 13:00:00',444333222,103),('2008-12-20 13:00:00','2008-12-10 13:00:00',444333222,104),('2008-12-21 13:00:00','2008-12-11 13:00:00',444333222,105);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-10 14:13:53
