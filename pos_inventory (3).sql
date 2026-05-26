-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 26, 2026 at 02:46 PM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` int NOT NULL DEFAULT '0',
  `low_stock_threshold` int NOT NULL DEFAULT '10',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `barcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ean13` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `idx_barcode` (`barcode`),
  KEY `idx_ean13` (`ean13`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `category`, `price`, `stock`, `low_stock_threshold`, `created_at`, `barcode`, `ean13`) VALUES
(1, 'P001', 'Coca Cola 1.5L', 'Beverages', 65.00, 39, 10, '2026-05-03 20:42:32', '4800016121012', '4800016121010'),
(2, 'P002', 'Pepsi 1.5L', 'Beverages', 62.00, 100, 10, '2026-05-03 20:42:32', '4800016121029', '4800016121027'),
(3, 'P003', 'Royal 1.5L', 'Beverages', 60.00, 100, 10, '2026-05-03 20:42:32', '4800016121036', '4800016121034'),
(4, 'P004', 'Sprite 1.5L', 'Beverages', 62.00, 18, 10, '2026-05-03 20:42:32', '4800016121043', '4800016121041'),
(5, 'P005', 'Minute Maid Orange 1L', 'Beverages', 55.00, 15, 10, '2026-05-03 20:42:32', '4800016121050', '4800016121058'),
(6, 'P006', 'C2 Apple Green Tea', 'Beverages', 22.50, 50, 15, '2026-05-03 20:42:32', '4800016121067', '4800016121065'),
(7, 'P007', 'Kopiko Brown Coffee', 'Beverages', 8.50, 79, 20, '2026-05-03 20:42:32', '4800016121074', '4800016121072'),
(8, 'P008', 'Nescafe 3in1', 'Beverages', 8.00, 60, 20, '2026-05-03 20:42:32', '4800016121081', '4800016121089'),
(9, 'P009', 'Milo Sachet 22g', 'Beverages', 12.50, 70, 20, '2026-05-03 20:42:32', '4800016121098', '4800016121096'),
(10, 'P010', 'Gatorade Blue 500ml', 'Beverages', 45.00, 29, 10, '2026-05-03 20:42:32', '4800016121104', '4800016121102'),
(11, 'P011', 'Piatos Cheese 85g', 'Snacks', 32.00, 45, 15, '2026-05-03 20:42:32', '4800016121111', '4800016121119'),
(12, 'P012', 'Piatos BBQ 85g', 'Snacks', 32.00, 40, 15, '2026-05-03 20:42:32', '4800016121128', '4800016121126'),
(13, 'P013', 'Piatos Sour Cream 85g', 'Snacks', 32.00, 35, 15, '2026-05-03 20:42:32', '4800016121135', '4800016121133'),
(14, 'P014', 'Nova Country Cheddar', 'Snacks', 28.50, 50, 15, '2026-05-03 20:42:32', '4800016121142', '4800016121140'),
(15, 'P015', 'Chippy Chili Cheese', 'Snacks', 15.00, 60, 20, '2026-05-03 20:42:32', '4800016121159', '4800016121157'),
(16, 'P016', 'Clover Chips BBQ', 'Snacks', 10.00, 55, 20, '2026-05-03 20:42:32', '4800016121166', '4800016121164'),
(17, 'P017', 'Oishi Prawn Crackers', 'Snacks', 35.00, 30, 10, '2026-05-03 20:42:32', '4800016121173', '4800016121171'),
(18, 'P018', 'Boy Bawang Cornick', 'Snacks', 15.00, 45, 15, '2026-05-03 20:42:32', '4800016121180', '4800016121188'),
(19, 'P019', 'Chiz Curls Original', 'Snacks', 15.00, 50, 15, '2026-05-03 20:42:32', '4800016121197', '4800016121195'),
(20, 'P020', 'V-Cut Cheese 60g', 'Snacks', 15.00, 40, 15, '2026-05-03 20:42:32', '4800016121203', '4800016121201'),
(21, 'P021', 'Lucky Me Pancit Canton', 'Noodles', 12.50, 80, 20, '2026-05-03 20:42:32', '4800016121210', '4800016121218'),
(22, 'P022', 'Lucky Me Beef Mami', 'Noodles', 12.50, 65, 20, '2026-05-03 20:42:32', '4800016121227', '4800016121225'),
(23, 'P023', 'Payless Pancit Canton', 'Noodles', 9.00, 70, 20, '2026-05-03 20:42:32', '4800016121234', '4800016121232'),
(24, 'P024', 'Quickchow Chicken', 'Noodles', 8.50, 60, 20, '2026-05-03 20:42:32', '4800016121241', '4800016121249'),
(25, 'P025', 'Nissin Cup Noodles', 'Noodles', 28.50, 40, 15, '2026-05-03 20:42:32', '4800016121258', '4800016121256'),
(26, 'P026', 'San Marino Tuna', 'Canned Goods', 32.00, 17, 10, '2026-05-03 20:42:32', '4800016121265', '4800016121263'),
(27, 'P027', 'Century Tuna Flakes', 'Canned Goods', 32.00, 25, 10, '2026-05-03 20:42:32', '4800016121272', '4800016121270'),
(28, 'P028', 'Ligo Sardines in Sauce', 'Canned Goods', 22.50, 30, 10, '2026-05-03 20:42:32', '4800016121289', '4800016121287'),
(29, 'P029', 'Argentina Corned Beef', 'Canned Goods', 55.00, 17, 10, '2026-05-03 20:42:32', '4800016121296', '4800016121294'),
(30, 'P030', 'Purefoods Corned Beef', 'Canned Goods', 58.50, 15, 10, '2026-05-03 20:42:32', '4800016121302', '4800016121300'),
(31, 'P031', '555 Sardines', 'Canned Goods', 18.50, 34, 10, '2026-05-03 20:42:32', '4800016121319', '4800016121317'),
(32, 'P032', 'Del Monte Fruit Cocktail', 'Canned Goods', 55.00, 20, 10, '2026-05-03 20:42:32', '4800016121326', '4800016121324'),
(33, 'P033', 'Alaska Evap Milk 370ml', 'Dairy', 28.00, 26, 15, '2026-05-03 20:42:32', '4800016121333', '4800016121331'),
(34, 'P034', 'Bear Brand Powder 150g', 'Dairy', 52.50, 25, 10, '2026-05-03 20:42:32', '4800016121340', '4800016121348'),
(35, 'P035', 'Magnolia Cheese 165g', 'Dairy', 85.00, 15, 10, '2026-05-03 20:42:32', '4800016121357', '4800016121355'),
(36, 'P036', 'Nestle All Purpose Cream', 'Dairy', 45.00, 20, 10, '2026-05-03 20:42:32', '4800016121364', '4800016121362'),
(37, 'P037', 'Selecta Ice Cream 1.4L', 'Dairy', 150.00, 10, 5, '2026-05-03 20:42:32', '4800016121371', '4800016121379'),
(38, 'P038', 'Tide Powder 1kg', 'Household', 85.00, 25, 10, '2026-05-03 20:42:32', '4800016121388', '4800016121386'),
(39, 'P039', 'Ariel Powder 1kg', 'Household', 88.50, 20, 10, '2026-05-03 20:42:32', '4800016121395', '4800016121393'),
(40, 'P040', 'Surf Powder 1kg', 'Household', 75.00, 22, 10, '2026-05-03 20:42:32', '4800016121401', '4800016121409'),
(41, 'P041', 'Downy Fabric Conditioner', 'Household', 52.50, 18, 10, '2026-05-03 20:42:32', '4800016121418', '4800016121416'),
(42, 'P042', 'Joy Dishwashing 250ml', 'Household', 38.50, 20, 10, '2026-05-03 20:42:32', '4800016121425', '4800016121423'),
(43, 'P043', 'Mr. Muscle Floor Cleaner', 'Household', 85.00, 12, 10, '2026-05-03 20:42:32', '4800016121432', '4800016121430'),
(44, 'P044', 'Safeguard White 135g', 'Personal Care', 32.00, 40, 15, '2026-05-03 20:42:32', '4800016121449', '4800016121447'),
(45, 'P045', 'Palmolive Shampoo 180ml', 'Personal Care', 55.00, 30, 10, '2026-05-03 20:42:32', '4800016121456', '4800016121454'),
(46, 'P046', 'Colgate Toothpaste 150ml', 'Personal Care', 65.00, 25, 10, '2026-05-03 20:42:32', '4800016121463', '4800016121461'),
(47, 'P047', 'Dove Soap 135g', 'Personal Care', 45.00, 30, 10, '2026-05-03 20:42:32', '4800016121470', '4800016121478'),
(48, 'P048', 'Head & Shoulders 180ml', 'Personal Care', 88.50, 20, 10, '2026-05-03 20:42:32', '4800016121487', '4800016121485'),
(49, 'P049', 'Closeup Toothpaste 160ml', 'Personal Care', 62.50, 22, 10, '2026-05-03 20:42:32', '4800016121494', '4800016121492'),
(50, 'P050', 'Gardenia White Bread', 'Bakery', 55.00, 15, 5, '2026-05-03 20:42:32', '4800016121500', '4800016121508'),
(51, 'P051', 'Gardenia Wheat Bread', 'Bakery', 58.50, 12, 5, '2026-05-03 20:42:32', '4800016121517', '4800016121515'),
(52, 'P052', 'Skyflakes Crackers', 'Bakery', 32.00, 25, 10, '2026-05-03 20:42:32', '4800016121524', '4800016121522'),
(53, 'P053', 'Fita Crackers', 'Bakery', 28.50, 20, 10, '2026-05-03 20:42:32', '4800016121531', '4800016121539'),
(54, 'P054', 'Rebisco Crackers', 'Bakery', 12.50, 35, 10, '2026-05-03 20:42:32', '4800016121548', '4800016121546'),
(55, 'P055', 'UFC Banana Ketchup 320g', 'Condiments', 42.50, 20, 10, '2026-05-03 20:42:32', '4800016121555', '4800016121553'),
(56, 'P056', 'Datu Puti Soy Sauce 1L', 'Condiments', 38.50, 18, 10, '2026-05-03 20:42:32', '4800016121562', '4800016121560'),
(57, 'P057', 'Datu Puti Vinegar 1L', 'Condiments', 32.00, 15, 10, '2026-05-03 20:42:32', '4800016121579', '4800016121577'),
(58, 'P058', 'Mang Tomas Sauce 500g', 'Condiments', 45.00, 20, 10, '2026-05-03 20:42:32', '4800016121586', '4800016121584'),
(59, 'P059', 'Lady Choice Mayonnaise', 'Condiments', 72.50, 15, 10, '2026-05-03 20:42:32', '4800016121593', '4800016121591'),
(60, 'P060', 'Sinandomeng Rice 1kg', 'Rice & Grains', 52.00, 50, 20, '2026-05-03 20:42:32', '4800016121609', '4800016121607'),
(61, 'P061', 'Jasmine Rice 1kg', 'Rice & Grains', 55.00, 45, 20, '2026-05-03 20:42:32', '4800016121616', '4800016121614'),
(62, 'P062', 'Marlboro Red', 'Cigarettes', 12.50, 100, 30, '2026-05-03 20:42:32', '4800016121623', '4800016121621'),
(63, 'P063', 'Philip Morris Blue', 'Cigarettes', 12.50, 80, 30, '2026-05-03 20:42:32', '4800016121630', '4800016121638'),
(64, 'P064', 'Fortune Menthol', 'Cigarettes', 10.00, 90, 30, '2026-05-03 20:42:32', '4800016121647', '4800016121645');

-- --------------------------------------------------------

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
CREATE TABLE IF NOT EXISTS `product_price` (
  `PriceID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `Price` decimal(10,2) DEFAULT '0.00',
  `DateAdded` date DEFAULT NULL,
  `PriceStatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  PRIMARY KEY (`PriceID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_price`
--

INSERT INTO `product_price` (`PriceID`, `ProductID`, `Price`, `DateAdded`, `PriceStatus`) VALUES
(10, 1, 65.00, '2026-05-04', 'Active'),
(11, 2, 62.00, '2026-05-08', 'Updated'),
(12, 3, 60.00, '2026-05-08', 'Updated'),
(13, 4, 62.00, '2026-05-04', 'Active'),
(14, 5, 55.00, '2026-05-04', 'Active'),
(15, 6, 22.50, '2026-05-04', 'Active'),
(16, 7, 8.50, '2026-05-04', 'Active'),
(17, 8, 8.00, '2026-05-04', 'Active'),
(18, 9, 12.50, '2026-05-04', 'Active'),
(19, 10, 45.00, '2026-05-04', 'Active'),
(20, 11, 32.00, '2026-05-04', 'Active'),
(21, 12, 32.00, '2026-05-04', 'Active'),
(22, 13, 32.00, '2026-05-04', 'Active'),
(23, 14, 28.50, '2026-05-04', 'Active'),
(24, 15, 15.00, '2026-05-04', 'Active'),
(25, 16, 10.00, '2026-05-04', 'Active'),
(26, 17, 35.00, '2026-05-04', 'Active'),
(27, 18, 15.00, '2026-05-04', 'Active'),
(28, 19, 15.00, '2026-05-04', 'Active'),
(29, 20, 15.00, '2026-05-04', 'Active'),
(30, 21, 12.50, '2026-05-04', 'Active'),
(31, 22, 12.50, '2026-05-04', 'Active'),
(32, 23, 9.00, '2026-05-04', 'Active'),
(33, 24, 8.50, '2026-05-04', 'Active'),
(34, 25, 28.50, '2026-05-04', 'Active'),
(35, 26, 32.00, '2026-05-04', 'Active'),
(36, 27, 32.00, '2026-05-04', 'Active'),
(37, 28, 22.50, '2026-05-04', 'Active'),
(38, 29, 55.00, '2026-05-26', 'Updated'),
(39, 30, 58.50, '2026-05-04', 'Active'),
(40, 31, 18.50, '2026-05-04', 'Active'),
(41, 32, 55.00, '2026-05-04', 'Active'),
(42, 33, 28.00, '2026-05-04', 'Active'),
(43, 34, 52.50, '2026-05-04', 'Active'),
(44, 35, 85.00, '2026-05-04', 'Active'),
(45, 36, 45.00, '2026-05-04', 'Active'),
(46, 37, 150.00, '2026-05-04', 'Active'),
(47, 38, 85.00, '2026-05-04', 'Active'),
(48, 39, 88.50, '2026-05-04', 'Active'),
(49, 40, 75.00, '2026-05-04', 'Active'),
(50, 41, 52.50, '2026-05-04', 'Active'),
(51, 42, 38.50, '2026-05-04', 'Active'),
(52, 43, 85.00, '2026-05-04', 'Active'),
(53, 44, 32.00, '2026-05-04', 'Active'),
(54, 45, 55.00, '2026-05-04', 'Active'),
(55, 46, 65.00, '2026-05-04', 'Active'),
(56, 47, 45.00, '2026-05-04', 'Active'),
(57, 48, 88.50, '2026-05-04', 'Active'),
(58, 49, 62.50, '2026-05-04', 'Active'),
(59, 50, 55.00, '2026-05-04', 'Active'),
(60, 51, 58.50, '2026-05-04', 'Active'),
(61, 52, 32.00, '2026-05-04', 'Active'),
(62, 53, 28.50, '2026-05-04', 'Active'),
(63, 54, 12.50, '2026-05-04', 'Active'),
(64, 55, 42.50, '2026-05-04', 'Active'),
(65, 56, 38.50, '2026-05-04', 'Active'),
(66, 57, 32.00, '2026-05-04', 'Active'),
(67, 58, 45.00, '2026-05-04', 'Active'),
(68, 59, 72.50, '2026-05-04', 'Active'),
(69, 60, 52.00, '2026-05-04', 'Active'),
(70, 61, 55.00, '2026-05-04', 'Active'),
(71, 62, 12.50, '2026-05-04', 'Active'),
(72, 63, 12.50, '2026-05-04', 'Active'),
(73, 64, 10.00, '2026-05-04', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `product_quantity`
--

DROP TABLE IF EXISTS `product_quantity`;
CREATE TABLE IF NOT EXISTS `product_quantity` (
  `QuantityID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `StockQty` int DEFAULT '0',
  PRIMARY KEY (`QuantityID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_quantity`
--

INSERT INTO `product_quantity` (`QuantityID`, `ProductID`, `StockQty`) VALUES
(10, 1, 39),
(11, 2, 125),
(12, 3, 120),
(13, 4, 18),
(14, 5, 15),
(15, 6, 50),
(16, 7, 80),
(17, 8, 60),
(18, 9, 70),
(19, 10, 30),
(20, 11, 45),
(21, 12, 40),
(22, 13, 35),
(23, 14, 50),
(24, 15, 60),
(25, 16, 55),
(26, 17, 30),
(27, 18, 45),
(28, 19, 50),
(29, 20, 40),
(30, 21, 80),
(31, 22, 65),
(32, 23, 70),
(33, 24, 60),
(34, 25, 40),
(35, 26, 20),
(36, 27, 25),
(37, 28, 30),
(38, 29, 35),
(39, 30, 15),
(40, 31, 35),
(41, 32, 20),
(42, 33, 30),
(43, 34, 25),
(44, 35, 15),
(45, 36, 20),
(46, 37, 10),
(47, 38, 25),
(48, 39, 20),
(49, 40, 22),
(50, 41, 18),
(51, 42, 25),
(52, 43, 12),
(53, 44, 40),
(54, 45, 30),
(55, 46, 25),
(56, 47, 30),
(57, 48, 20),
(58, 49, 22),
(59, 50, 15),
(60, 51, 12),
(61, 52, 25),
(62, 53, 20),
(63, 54, 35),
(64, 55, 20),
(65, 56, 18),
(66, 57, 15),
(67, 58, 20),
(68, 59, 15),
(69, 60, 50),
(70, 61, 45),
(71, 62, 100),
(72, 63, 80),
(73, 64, 90);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cashier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) DEFAULT '0.00',
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Cash',
  `sale_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `cashier`, `total`, `discount`, `payment_method`, `sale_date`) VALUES
(1, 'cashier', 150.00, 0.00, 'Cash', '2026-05-04 01:15:06'),
(2, 'cashier', 85.50, 10.00, 'GCash', '2026-05-04 01:15:06'),
(3, 'cashier', 220.00, 0.00, 'Cash', '2026-05-04 01:15:06'),
(4, 'Dwyne', 95.00, 5.00, 'Maya', '2026-05-04 01:15:06'),
(5, 'Admin', 68.00, 5.00, 'Cash', '2026-05-04 04:24:34'),
(6, 'Admin', 258.50, 57.70, 'Cash', '2026-05-04 10:46:23'),
(7, 'Christian', 59.92, 0.00, 'GCash', '2026-05-04 11:49:10'),
(8, 'Admin', 3080.00, 0.00, 'Cash', '2026-05-04 11:51:34'),
(9, 'Admin', 433.44, 0.00, 'Cash', '2026-05-10 23:28:36'),
(10, 'Cashier', 616.00, 0.00, 'Cash', '2026-05-11 09:39:55'),
(11, 'Admin', 198.32, 6.43, 'Cash', '2026-05-11 11:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

DROP TABLE IF EXISTS `sale_items`;
CREATE TABLE IF NOT EXISTS `sale_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `product_name`, `quantity`, `price`, `subtotal`) VALUES
(11, 6, 26, 'San Marino Tuna', 3, 32.00, 96.00),
(12, 6, 42, 'Joy Dishwashing 250ml', 5, 38.50, 192.50),
(13, 7, 7, 'Kopiko Brown Coffee', 1, 8.50, 8.50),
(14, 7, 10, 'Gatorade Blue 500ml', 1, 45.00, 45.00),
(15, 8, 2, 'Pepsi 1.5L', 25, 62.00, 1550.00),
(16, 8, 3, 'Royal 1.5L', 20, 60.00, 1200.00),
(17, 9, 33, 'Alaska Evap Milk 370ml', 4, 28.00, 112.00),
(18, 9, 29, 'Argentina Corned Beef', 5, 55.00, 275.00),
(19, 10, 29, 'Argentina Corned Beef', 10, 55.00, 550.00),
(20, 11, 31, '555 Sardines', 1, 18.50, 18.50),
(21, 11, 29, 'Argentina Corned Beef', 3, 55.00, 165.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Cashier',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin123', 'Admin', '2026-05-03 17:15:06'),
(2, 'cashier', 'cashier123', 'Cashier', '2026-05-03 17:15:06'),
(4, 'Christian', 'admin123', 'Admin', '2026-05-03 20:06:33');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE IF NOT EXISTS `user_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_login_time` (`login_time`),
  KEY `idx_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_login_log`
--

INSERT INTO `user_login_log` (`id`, `username`, `login_time`) VALUES
(1, 'Admin', '2026-05-10 22:43:24'),
(2, 'Admin', '2026-05-10 23:14:52'),
(3, 'Cashier', '2026-05-11 09:30:39'),
(4, 'Admin', '2026-05-11 09:31:45'),
(5, 'Cashier', '2026-05-11 09:35:59'),
(6, 'Admin', '2026-05-11 09:40:27'),
(7, 'Admin', '2026-05-11 11:07:32'),
(8, 'Admin', '2026-05-11 11:19:32'),
(9, 'Admin', '2026-05-11 11:27:09'),
(10, 'Admin', '2026-05-11 11:32:57'),
(11, 'Admin', '2026-05-11 12:31:21'),
(12, 'Admin', '2026-05-11 12:44:20'),
(13, 'Admin', '2026-05-11 14:00:42'),
(14, 'Admin', '2026-05-11 14:13:01'),
(15, 'Admin', '2026-05-11 14:21:28'),
(16, 'Admin', '2026-05-11 14:40:00'),
(17, 'Admin', '2026-05-11 15:29:12'),
(18, 'admin', '2026-05-26 19:53:14'),
(19, 'admin', '2026-05-26 20:02:05'),
(20, 'Admin', '2026-05-26 21:10:08'),
(21, 'admin', '2026-05-26 21:15:22'),
(22, 'admin', '2026-05-26 21:46:04');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
