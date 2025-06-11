CREATE DATABASE  IF NOT EXISTS `shopexpense` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shopexpense`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: shopexpense
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Nguyễn Văn Anh','Số 15, ngõ 45 Nguyễn Trãi, Thanh Xuân, Hà Nội','0901234561','nguyenvananh@gmail.com','2025-05-14 16:08:14','2025-06-10 06:28:46'),(2,'Trần Thị Nhàn ','Số 21, đường Lê Duẩn, Hoàn Kiếm, Hà Nội','0909876541','tranthib1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(3,'Lê Văn Chuyên','123 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội','0912345671','levanc1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(4,'Phạm Thị Duyên','456 Hai Bà Trưng, Phường Bùi Thị Xuân, Hai Bà Trưng, Hà Nội','0923456781','phamthid1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(5,'Hoàng Văn Hùng','789 Lý Thường Kiệt, Quận Đống Đa, Hà Nội','0934567891','hoangvane1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(6,'Nguyễn Xuân Hoàng','32 Nguyễn Du, Quận Hai Bà Trưng, Hà Nội','0945678901','nguyenthif1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(7,'Trần Minh Tâm','27 Nguyễn Văn Linh, Long Biên, Hà Nội','0956789011','tranvang1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(8,'Vũ Thị Hường','98 Phan Đình Phùng, Quận Ba Đình, Hà Nội','0967890121','vuthih1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(9,'Bùi Hùng Cường','45 Hoàng Hoa Thám, Quận Tây Hồ, Hà Nội','0978901231','buivani1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(10,'Đặng Thanh Huyền','112 Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội','0989012341','dangthik1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(11,'Đỗ Văn Lương','67 Lê Lợi, Hà Đông, Hà Nội','0990123451','dovanl1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(12,'Ngô Mỹ Tâm','301 Trần Phú, Hà Đông, Hà Nội','0901234562','ngothim1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(13,'Lý Văn Nguyên','21 Ngô Gia Tự, Long Biên, Hà Nội','0912345672','lyvann1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(14,'Dương Thị Oanh','8A Nguyễn Huệ, Ba Đình, Hà Nội','0923456782','duongthio1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(15,'Trịnh Văn Phong','234 Lạc Long Quân, Quận Tây Hồ, Hà Nội','0934567892','trinhvanp1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(16,'Phan Thị Quyên','56 Trần Quốc Toản, Hai Bà Trưng, Hà Nội','0945678902','phanthiq1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(17,'Nguyễn Quỳnh Châu','11 Phạm Văn Đồng, Bắc Từ Liêm, Hà Nội','0956789012','nguyenvanr1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(18,'Lê Thu Sang','76 Nguyễn Công Trứ, Hai Bà Trưng, Hà Nội','0967890122','lethis1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(19,'Hoàng Văn Sơn','89 Quang Trung, Hà Đông, Hà Nội','0978901232','hoangvant1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56'),(20,'Phạm Thanh Trúc','17 Lý Nam Đế, Quận Ba Đình, Hà Nội','0989012342','phamthiu1@gmail.com','2025-05-14 16:08:14','2025-06-10 06:38:56');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `discount_type` varchar(20) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,'SALE5',5.00,'PERCENTAGE','2025-06-01 00:00:00','2025-06-30 23:59:59','EXPIRED','2025-05-14 16:08:14','2025-05-22 03:46:10'),(2,'FIXED25',25.00,'FIXED_AMOUNT','2025-06-01 00:00:00','2025-06-30 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(3,'SUMMER10',10.00,'PERCENTAGE','2025-07-01 00:00:00','2025-07-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(4,'SAVE50',50.00,'FIXED_AMOUNT','2025-07-01 00:00:00','2025-07-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(5,'FALL15',15.00,'PERCENTAGE','2025-09-01 00:00:00','2025-09-30 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(6,'DEAL100',100.00,'FIXED_AMOUNT','2025-09-01 00:00:00','2025-09-30 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(7,'WINTER20',20.00,'PERCENTAGE','2025-12-01 00:00:00','2025-12-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(8,'SAVE150',150.00,'FIXED_AMOUNT','2025-12-01 00:00:00','2025-12-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(9,'SPRING25',25.00,'PERCENTAGE','2026-03-01 00:00:00','2026-03-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(10,'CUT200',200.00,'FIXED_AMOUNT','2026-03-01 00:00:00','2026-03-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(11,'PROMO30',30.00,'PERCENTAGE','2026-06-01 00:00:00','2026-06-30 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(12,'SAVE75',75.00,'FIXED_AMOUNT','2026-06-01 00:00:00','2026-06-30 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(13,'HOTDEAL12',12.00,'PERCENTAGE','2026-08-01 00:00:00','2026-08-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(14,'DEAL80',80.00,'FIXED_AMOUNT','2026-08-01 00:00:00','2026-08-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(15,'SCHOOL18',18.00,'PERCENTAGE','2026-09-01 00:00:00','2026-09-30 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(16,'SAVE120',120.00,'FIXED_AMOUNT','2026-09-01 00:00:00','2026-09-30 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(17,'BLACKFRIDAY35',35.00,'PERCENTAGE','2026-11-01 00:00:00','2026-11-30 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(18,'CUT300',300.00,'FIXED_AMOUNT','2026-11-01 00:00:00','2026-11-30 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(19,'CYBERMONDAY22',22.00,'PERCENTAGE','2026-12-01 00:00:00','2026-12-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14'),(20,'YEAREND250',250.00,'FIXED_AMOUNT','2026-12-01 00:00:00','2026-12-31 23:59:59','ACTIVE','2025-05-14 16:08:14','2025-05-14 16:08:14');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1,1,22490000.00,'2025-05-14 16:08:14'),(2,2,2,1,30000000.00,'2025-05-14 16:08:14'),(3,3,3,1,12000000.00,'2025-05-14 16:08:14'),(4,4,4,1,9000000.00,'2025-05-14 16:08:14'),(5,5,5,1,7300000.00,'2025-05-14 16:08:14'),(6,6,6,1,2100000.00,'2025-05-14 16:08:14'),(7,7,7,1,5670000.00,'2025-05-14 16:08:14'),(8,8,8,1,5000000.00,'2025-05-14 16:08:14'),(9,9,9,1,13000000.00,'2025-05-14 16:08:14'),(10,10,10,1,3400000.00,'2025-05-14 16:08:14'),(11,11,11,1,6000000.00,'2025-05-14 16:08:14'),(12,12,12,1,7300000.00,'2025-05-14 16:08:14'),(13,13,13,1,3400000.00,'2025-05-14 16:08:14'),(14,14,14,1,5700000.00,'2025-05-14 16:08:14'),(15,15,15,1,4000000.00,'2025-05-14 16:08:14'),(16,16,16,1,5000000.00,'2025-05-14 16:08:14'),(17,17,17,1,9700000.00,'2025-05-14 16:08:14'),(18,18,18,1,12000000.00,'2025-05-14 16:08:14'),(19,19,19,1,2300000.00,'2025-05-14 16:08:14'),(20,20,20,1,1200000.00,'2025-05-14 16:08:14');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_code` varchar(20) NOT NULL,
  `customer_id` int NOT NULL,
  `user_id` int NOT NULL,
  `discount_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'PENDING',
  `order_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_code` (`order_code`),
  KEY `customer_id` (`customer_id`),
  KEY `user_id` (`user_id`),
  KEY `discount_id` (`discount_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'ORD001',1,1,1,29000000.00,'CANCELLED','2025-05-01','2025-05-14 16:08:14','2025-06-10 09:18:38'),(2,'ORD002',2,2,2,8000000.00,'CONFIRMED','2025-05-02','2025-05-14 16:08:14','2025-06-10 09:18:38'),(3,'ORD003',3,3,3,5200000.00,'SHIPPED','2025-02-03','2025-05-14 16:08:14','2025-06-10 09:18:38'),(4,'ORD004',4,4,4,1000000.00,'DELIVERED','2025-06-04','2025-05-14 16:08:14','2025-06-10 09:18:38'),(5,'ORD005',5,5,5,5600000.00,'PENDING','2025-03-05','2025-05-14 16:08:14','2025-06-10 09:18:38'),(6,'ORD006',6,6,6,1240000.00,'CONFIRMED','2025-06-06','2025-05-14 16:08:14','2025-06-10 09:18:38'),(7,'ORD007',7,7,7,3000000.00,'SHIPPED','2025-06-07','2025-05-14 16:08:14','2025-06-10 09:18:38'),(8,'ORD008',8,8,8,4000000.00,'DELIVERED','2025-06-08','2025-05-14 16:08:14','2025-06-10 09:18:38'),(9,'ORD009',9,9,9,6000000.00,'PENDING','2025-04-09','2025-05-14 16:08:14','2025-06-10 09:18:38'),(10,'ORD010',10,10,10,7000000.00,'CONFIRMED','2025-06-10','2025-05-14 16:08:14','2025-06-10 09:18:38'),(11,'ORD011',11,11,11,8000000.00,'SHIPPED','2025-06-11','2025-05-14 16:08:14','2025-06-10 09:18:38'),(12,'ORD012',12,12,12,1300000.00,'DELIVERED','2025-04-12','2025-05-14 16:08:14','2025-06-10 09:18:38'),(13,'ORD013',13,13,13,20000000.00,'PENDING','2025-06-13','2025-05-14 16:08:14','2025-06-10 09:18:38'),(14,'ORD014',14,14,14,12000000.00,'CONFIRMED','2025-06-14','2025-05-14 16:08:14','2025-06-10 09:18:38'),(15,'ORD015',15,15,15,1500000.00,'SHIPPED','2025-06-15','2025-05-14 16:08:14','2025-06-10 09:18:38'),(16,'ORD016',16,16,16,1350000.00,'DELIVERED','2025-06-16','2025-05-14 16:08:14','2025-06-10 09:18:38'),(17,'ORD017',17,17,17,2000000.00,'PENDING','2025-06-17','2025-05-14 16:08:14','2025-06-10 09:18:38'),(18,'ORD018',18,18,18,8500000.00,'CONFIRMED','2025-05-18','2025-05-14 16:08:14','2025-06-10 09:18:38'),(19,'ORD019',19,19,19,11000000.00,'SHIPPED','2025-05-19','2025-05-14 16:08:14','2025-06-10 09:18:38'),(20,'ORD020',20,20,20,16000000.00,'DELIVERED','2025-04-20','2025-05-14 16:08:14','2025-06-10 09:18:38');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `specifications` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'IPHONE15','iPhone 15','iPhone 15 128GB, Camera 48MP',22490000.00,60,'RAM: 6GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-10 10:00:08'),(2,'SAMSUNGZ5','Samsung Galaxy Z Fold 6','Samsung Z Fold 6 256GB, Foldable',30000000.00,20,'RAM: 12GB, Storage: 256GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(3,'XIAOMI14','Xiaomi 14','Xiaomi 14 256GB, 5G',12000000.00,30,'RAM: 8GB, Storage: 256GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(4,'OPPOA81','Oppo A81','Oppo A81 128GB, Camera 50MP',9000000.00,40,'RAM: 6GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(5,'VIVOY38','Vivo Y38','Vivo Y38 128GB, 5G',7300000.00,35,'RAM: 6GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(6,'NOKIAX33','Nokia X33','Nokia X33 256GB, Camera 50MP',2100000.00,25,'RAM: 8GB, Storage: 256GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(7,'HUAWEIP63','Huawei P63','Huawei P63 512GB, Camera 48MP',5670000.00,20,'RAM: 8GB, Storage: 512GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(8,'SONYXPERIA3','Sony Xperia 3','Sony Xperia 3 256GB, Camera 12MP',5000000.00,15,'RAM: 12GB, Storage: 256GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(9,'GOOGLEPIXEL10','Google Pixel 10','Google Pixel 10 128GB, Camera 50MP',13000000.00,30,'RAM: 8GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(10,'ASUSROG8','Asus ROG Phone 8','Asus ROG Phone 8 512GB, Gaming',3400000.00,10,'RAM: 16GB, Storage: 512GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(11,'REALME13','Realme 13','Realme 13 256GB, Camera 108MP',6000000.00,50,'RAM: 8GB, Storage: 256GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(12,'MOTOG56','Moto G56','Moto G56 128GB, 5G',7300000.00,60,'RAM: 4GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(13,'ONEPLUS13','OnePlus 13','OnePlus 13 256GB, Camera 50MP',3400000.00,25,'RAM: 12GB, Storage: 256GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(14,'LENOVOK16','Lenovo K16','Lenovo K16 128GB, Camera 48MP',5700000.00,40,'RAM: 6GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(15,'TCL42SE','TCL 42 SE','TCL 42 SE 128GB, Camera 50MP',4000000.00,70,'RAM: 4GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(16,'ZTEAXON52','ZTE Axon 52','ZTE Axon 52 256GB, Camera 64MP',5000000.00,20,'RAM: 12GB, Storage: 256GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(17,'ALCATEL5X','Alcatel 5X','Alcatel 5X 128GB, Camera 48MP',9700000.00,55,'RAM: 4GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(18,'INFINIXNOTE32','Infinix Note 32','Infinix Note 32 256GB, Camera 64MP',12000000.00,45,'RAM: 8GB, Storage: 256GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(19,'TECNO22','Tecno 22','Tecno 22 128GB, Camera 50MP',2300000.00,50,'RAM: 6GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-08 14:31:32'),(20,'BLACKVIEWA102','Blackview A102','Blackview A102 128GB, Camera 48MP',1200000.00,60,'RAM: 4GB, Storage: 128GB','2025-05-14 16:08:14','2025-06-08 14:31:32');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'EMPLOYEE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','ADMIN','2025-05-14 16:08:14'),(2,'admin2','c81e728d9d4c2f636f067f89cc14862c','ADMIN','2025-05-14 16:08:14'),(3,'employee1','5d4e8733e426e42fd0f3fd7f93d29ddd','EMPLOYEE','2025-05-14 16:08:14'),(4,'employee2','6d2b12a4a350e3b2e0e09d7c1aa4a4a9','EMPLOYEE','2025-05-14 16:08:14'),(5,'employee3','2db8d136f9cd24ebaf37ae4c7fc33e2c','EMPLOYEE','2025-05-14 16:08:14'),(6,'employee4','e6d974561c574da88e8b4e53c6b4ae60','EMPLOYEE','2025-05-14 16:08:14'),(7,'employee5','c6b5c86f0d7caea73b5f76fb8e4b601b','EMPLOYEE','2025-05-14 16:08:14'),(8,'employee6','33e4a8c2d7b1f4e5f7b6e8c7e5a4b3c2','EMPLOYEE','2025-05-14 16:08:14'),(9,'employee7','f5e6d7c8e9f0a1b2c3d4e5f6a7b8c9d0','EMPLOYEE','2025-05-14 16:08:14'),(10,'employee8','a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6','EMPLOYEE','2025-05-14 16:08:14'),(11,'employee9','b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7','EMPLOYEE','2025-05-14 16:08:14'),(12,'employee10','c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8','EMPLOYEE','2025-05-14 16:08:14'),(13,'employee11','d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9','EMPLOYEE','2025-05-14 16:08:14'),(14,'employee12','e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0','EMPLOYEE','2025-05-14 16:08:14'),(15,'employee13','f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1','EMPLOYEE','2025-05-14 16:08:14'),(16,'employee14','a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2','EMPLOYEE','2025-05-14 16:08:14'),(17,'employee15','c4ca4238a0b923820dcc509a6f75849b','EMPLOYEE','2025-05-14 16:08:14'),(18,'employee16','eccbc87e4b5ce2fe28308fd9f2a7baf3','EMPLOYEE','2025-05-14 16:08:14'),(19,'employee17','a87ff679a2f3e71d9181a67b7542122c','EMPLOYEE','2025-05-14 16:08:14'),(20,'employee18','e4da3b7fbbce2345d7772b0674a318d5','EMPLOYEE','2025-05-14 16:08:14');
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

-- Dump completed on 2025-06-11 12:27:28
