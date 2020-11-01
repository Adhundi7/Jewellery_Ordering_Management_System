-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: dearbornjewelry
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `Category_Id` char(10) NOT NULL,
  `Category_Name` char(25) DEFAULT NULL,
  `Category_Description` char(25) DEFAULT NULL,
  PRIMARY KEY (`Category_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('CAT101','Ring','Ring'),('CAT102','Diamond','All cut diamonds'),('CAT103','Gold','Gold'),('CAT104','Others','Other non-jewerly items');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `Customer_ID` char(10) NOT NULL,
  `Customer_Name` char(25) DEFAULT NULL,
  `Address_Street` char(25) DEFAULT NULL,
  `Address_City` char(25) DEFAULT NULL,
  `Address_State` char(25) DEFAULT NULL,
  `Address_Zip` char(10) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C123','John','457 pls dr','Ann Arbor','MI','48152'),('C124','Devendra','458 pls dr','westland','MI','48153'),('C125','Mike','459 pls dr','canton','MI','48154'),('C126','Adheeth','460 pls dr','Dearborn','MI','48155'),('C127','John','461 pls dr','Ann Arbor','MI','48156'),('C128','Barb','462 pls dr','Novi','MI','48157'),('C129','Bob','463 pls dr','Ann Arbor','MI','48158'),('C130','Julie','464 pls dr','Dearborn','MI','48159'),('C131','Jane','465 pls dr','Dearborn','MI','48160'),('C132','James','466 pls dr','Dearborn','MI','48161');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `Employee_Id` char(10) NOT NULL,
  `Employee_Name` char(25) DEFAULT NULL,
  `Employee_Title` char(25) DEFAULT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('E101','John','Clerk'),('E102','Joe','Clerk'),('E103','Keith','Manager'),('E104','Mike','Clerk');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_detail` (
  `Order_detail_no` int(11) NOT NULL AUTO_INCREMENT,
  `Order_no` int(11) NOT NULL,
  `Product_ID` char(10) NOT NULL,
  `Category_Id` char(10) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Unit_Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Order_detail_no`),
  KEY `Order_no` (`Order_no`),
  KEY `Product_ID` (`Product_ID`),
  KEY `Category_Id` (`Category_Id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`Order_no`) REFERENCES `order_master` (`Order_no`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`Category_Id`) REFERENCES `category` (`Category_Id`),
  CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (2,1,'PR101','CAT101',1,49000.00),(3,1,'PR101','CAT101',1,100.00),(4,1,'PR102','CAT102',2,500.00),(5,2,'PR105','CAT101',1,100.00),(8,2,'PR104','CAT103',1,150.00),(9,3,'PR102','CAT102',1,500.00),(10,3,'PR101','CAT101',1,100.00),(11,4,'PR103','CAT103',1,150.00),(12,5,'PR101','CAT101',1,100.00),(13,6,'PR106','CAT103',1,50.00),(16,7,'PR107','CAT101',2,100.00),(25,8,'PR105','CAT101',1,500.00),(26,1,'PR105','CAT101',1,NULL),(27,1,'PR105','CAT101',1,NULL);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_detail_BEFORE_INSERT` BEFORE INSERT ON `order_detail` FOR EACH ROW BEGIN
DECLARE order_total_temp INT;
set order_total_temp = (select sum(quantity * unit_price) as order_total from order_detail where order_no = new.order_no group by order_no) ;
    if (new.unit_price + order_total_temp) > 4500 THEN
      SET NEW.unit_price = null;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_master`
--

DROP TABLE IF EXISTS `order_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_master` (
  `Order_no` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` char(10) NOT NULL,
  `Employee_Id` char(10) NOT NULL,
  `Payment_Type_Id` int(11) DEFAULT NULL,
  `Order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`Order_no`),
  UNIQUE KEY `idx_costomer_order_date` (`Order_date`,`Customer_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Employee_Id` (`Employee_Id`),
  KEY `Payment_Type_Id` (`Payment_Type_Id`),
  CONSTRAINT `order_master_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  CONSTRAINT `order_master_ibfk_2` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`Employee_Id`),
  CONSTRAINT `order_master_ibfk_3` FOREIGN KEY (`Payment_Type_Id`) REFERENCES `payment_type` (`Payment_Type_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_master`
--

LOCK TABLES `order_master` WRITE;
/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
INSERT INTO `order_master` VALUES (1,'C123','E101',1,'2019-04-12 00:22:23','2019-05-12'),(2,'C124','E102',2,'2019-04-12 00:26:07','2019-05-12'),(3,'C125','E102',3,'2019-04-12 00:26:07','2019-05-12'),(4,'C126','E102',2,'2019-04-12 00:26:07','2019-05-12'),(5,'C127','E101',2,'2019-04-12 00:26:07','2019-05-12'),(6,'C128','E103',2,'2019-04-12 00:26:07','2019-05-12'),(7,'C129','E103',3,'2019-04-12 00:26:07','2019-05-12'),(8,'C130','E104',3,'2019-04-12 00:26:07','2019-05-12');
/*!40000 ALTER TABLE `order_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_master_BEFORE_INSERT` BEFORE INSERT ON `order_master` FOR EACH ROW BEGIN
set new.delivery_date = DATE_ADD(CURRENT_DATE(), INTERVAL 30 DAY);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_type` (
  `Payment_Type_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Payment_Type_Method` char(25) DEFAULT NULL,
  `Payment_Type_Notes` char(25) DEFAULT NULL,
  PRIMARY KEY (`Payment_Type_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'Cash','Cash'),(2,'Credit_Card','Credit card'),(3,'Check','Check');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `Product_ID` char(10) NOT NULL,
  `Product_Name` char(25) DEFAULT NULL,
  `Product_Description` char(25) DEFAULT NULL,
  `Category_Id` char(10) DEFAULT NULL,
  `Unit_Price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `Category_Id` (`Category_Id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_Id`) REFERENCES `category` (`Category_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('PR101','Ring','Ring R10','CAT101',100.00),('PR102','Diamond','Diamond small','CAT102',500.00),('PR103','Bracelet','Bracelet golden color','CAT103',150.00),('PR104','Necklaces','Necklaces with diamond','CAT103',500.00),('PR105','Ring','Ring R20','CAT101',100.00),('PR106','Earrings','Silver-Gold Earrings','CAT103',50.00),('PR107','Armlets','Golden Armlets','CAT101',100.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dearbornjewelry'
--
/*!50003 DROP PROCEDURE IF EXISTS `simpleproc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `simpleproc`(IN Category_ID varchar(50),IN Category_Name varchar(50),IN Category_Description varchar(50))
BEGIN
    insert into Category (Category_Id,Category_Name,Category_Description) values (Category_Id,Category_Name,Category_Description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-16  0:44:49
