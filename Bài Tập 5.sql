-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for company_db
CREATE DATABASE IF NOT EXISTS `company_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `company_db`;

-- Dumping structure for table company_db.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.category: ~5 rows (approximately)
INSERT INTO `category` (`category_id`, `category_name`, `description`) VALUES
	(1, 'Phone', NULL),
	(2, 'Laptop', NULL),
	(3, 'Accessory', NULL),
	(4, 'Mouse', NULL),
	(5, 'Keyboard', NULL);

-- Dumping structure for table company_db.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.customer: ~5 rows (approximately)
INSERT INTO `customer` (`customer_id`, `full_name`, `email`, `phone`, `address`, `created_at`) VALUES
	(1, 'Dinh Quang Hao', 'hao@gmail.com', '0901234567', 'Ho Chi Minh City', '2026-05-08 09:14:46'),
	(2, 'Nguyen Khac Duy', 'duy@gmail.com', '0912345678', 'Thu Duc, Ho Chi Minh City', '2026-05-08 09:14:46'),
	(3, 'Le Thanh Hai', '2207quochung@gmail.com', '0923456789', 'District 1, Ho Chi Minh City', '2026-05-08 09:14:46'),
	(4, 'Nguyen Nhat Quoc Hung', 'hung@gmail.com', '0934567890', 'District 3, Ho Chi Minh City', '2026-05-08 09:14:46'),
	(5, 'Bui Minh Hieu', 'hieu@gmail.com', '0945678901', 'District 5, Ho Chi Minh City', '2026-05-08 09:14:46');

-- Dumping structure for table company_db.department
CREATE TABLE IF NOT EXISTS `department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.department: ~0 rows (approximately)

-- Dumping structure for table company_db.department_new
CREATE TABLE IF NOT EXISTS `department_new` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.department_new: ~0 rows (approximately)

-- Dumping structure for table company_db.department_new_new
CREATE TABLE IF NOT EXISTS `department_new_new` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.department_new_new: ~0 rows (approximately)

-- Dumping structure for table company_db.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(100) NOT NULL,
  `gender` int DEFAULT '1',
  `birth_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `email` (`email`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.employee: ~0 rows (approximately)

-- Dumping structure for table company_db.employee_new
CREATE TABLE IF NOT EXISTS `employee_new` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(100) NOT NULL,
  `gender` int DEFAULT '1',
  `birth_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `employee_new_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.employee_new: ~0 rows (approximately)

-- Dumping structure for table company_db.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `STATUS` varchar(50) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.orders: ~5 rows (approximately)
INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `STATUS`) VALUES
	(1, 1, '2026-05-01 00:00:00', 'Pending'),
	(2, 2, '2026-05-02 00:00:00', 'Completed'),
	(3, 3, '2026-05-03 00:00:00', 'Shipping'),
	(4, 4, '2026-05-04 00:00:00', 'Pending'),
	(5, 5, '2026-05-05 00:00:00', 'Cancelled');

-- Dumping structure for table company_db.order_detail
CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.order_detail: ~4 rows (approximately)
INSERT INTO `order_detail` (`order_id`, `product_id`, `quantity`, `unit_price`) VALUES
	(1, 3, 1, 22000000.00),
	(2, 1, 1, 3500000.00),
	(3, 4, 2, 400000.00),
	(4, 2, 1, 8000000.00);

-- Dumping structure for table company_db.product
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.product: ~5 rows (approximately)
INSERT INTO `product` (`product_id`, `product_name`, `price`, `stock`, `category_id`) VALUES
	(1, 'Redmi 12', 5000000.00, 0, 1),
	(2, 'Poco X7 Pro', 8000000.00, 0, 1),
	(3, 'Lenovo LOQ 2025', 22000000.00, 0, 2),
	(4, 'Logitech G102 Mouse', 400000.00, 0, 4),
	(5, 'Akko Mechanical Keyboard', 1200000.00, 0, 5);

-- Dumping structure for table company_db.project
CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(200) DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `start_date` date DEFAULT (curdate()),
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `rang_buoc` CHECK ((`end_date` >= `start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table company_db.project: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
