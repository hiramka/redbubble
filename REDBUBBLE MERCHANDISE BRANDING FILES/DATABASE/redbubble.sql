-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2025 at 09:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redbubble`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`) VALUES
(1, 'hiram', 'hiram@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

CREATE TABLE `assign` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `assign_status` varchar(20) NOT NULL DEFAULT 'Pending deliver',
  `materials` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `order_id` int(11) NOT NULL,
  `client_id` int(15) NOT NULL,
  `order_cost` int(11) DEFAULT NULL,
  `shipping_cost` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `payment_code` varchar(30) DEFAULT NULL,
  `county` varchar(70) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `expected_date` varchar(50) DEFAULT NULL,
  `address` varchar(11) DEFAULT NULL,
  `order_status` varchar(11) NOT NULL DEFAULT '0',
  `order_date` varchar(50) DEFAULT NULL,
  `rating` varchar(40) DEFAULT NULL,
  `order_remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`order_id`, `client_id`, `order_cost`, `shipping_cost`, `total_cost`, `payment_code`, `county`, `town`, `expected_date`, `address`, `order_status`, `order_date`, `rating`, `order_remark`) VALUES
(1, 2, 6000, 400, 6400, 'QWERTYUIO1', 'Kiambu', 'Kikuyu', '11/24/2025', '123', '11', '2025-11-24 00:49:02', '5.0', NULL),
(2, 2, 1200, 400, 1600, 'QWERTYUIO2', 'Mombasa', 'Mambasa town', '11/24/2025', '123', '8', '2025-11-24 10:43:40', NULL, NULL),
(3, 2, 3000, 400, 3400, 'QWERTYUIO2', 'Meru', 'Runogone', '11/25/2025', '1243', '11', '2025-11-25 10:06:24', '4.0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `phone_no` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'Pending approval',
  `password` varchar(50) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `remarks` text DEFAULT NULL,
  `user` varchar(10) NOT NULL DEFAULT 'Client'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `status`, `password`, `date_created`, `remarks`, `user`) VALUES
(1, 'samuel', 'ngugi', 'sam', '0723456788', 'jehujoe98@gmail.com', 'Approved', '12345', '2023-10-16 13:46:34', NULL, 'Client'),
(2, 'grace', 'wanjiru', 'grace', '0734567347', 'wanjiru@gmail.com', 'Approved', '1234', '2023-10-16 15:47:25', NULL, 'Client'),
(3, 'Kamau', 'Mwangi', 'Kamau', '0734563782', 'kamau@gmail.com', 'Approved', '1234', '2023-10-23 05:36:39', NULL, 'Supplier'),
(4, 'Sharon', 'Chebet', 'Sharon', '0734563456', 'sharon@gmail.com', 'Approved', '1234', '2023-10-23 05:37:37', NULL, 'Supplier'),
(5, 'John', 'Kiberenge', 'Kibe', '0767907523', 'kibe@gmail.com', 'Approved', '1234', '2025-11-23 20:26:19', NULL, 'Supplier'),
(6, 'John', 'kamau', 'John', '0712451223', 'john@gmail.com', 'Pending approval', '1234', '2025-11-24 09:12:01', NULL, 'Client');

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

CREATE TABLE `counties` (
  `county_id` int(11) NOT NULL,
  `county_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `counties`
--

INSERT INTO `counties` (`county_id`, `county_name`) VALUES
(1, 'Meru'),
(2, 'Kiambu'),
(3, 'Mombasa'),
(4, 'Kwale'),
(5, 'Embu');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `county` varchar(70) NOT NULL,
  `town` varchar(50) NOT NULL,
  `client_id` int(11) NOT NULL,
  `address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `county`, `town`, `client_id`, `address`) VALUES
(1, 'Meru', 'Runogone', 2, '1243');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_cost`
--

CREATE TABLE `delivery_cost` (
  `d_id` int(11) NOT NULL,
  `cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `delivery_cost`
--

INSERT INTO `delivery_cost` (`d_id`, `cost`) VALUES
(1, 300);

-- --------------------------------------------------------

--
-- Table structure for table `design_assignments`
--

CREATE TABLE `design_assignments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `tech_id` int(11) NOT NULL,
  `date_assigned` date NOT NULL,
  `pdf_design` varchar(50) DEFAULT NULL,
  `assign_status` varchar(50) NOT NULL DEFAULT 'Pending',
  `tech_status` varchar(50) NOT NULL DEFAULT 'Pending',
  `client_fb` text DEFAULT NULL,
  `client_approval` varchar(50) DEFAULT 'Pending approval',
  `stock_release` varchar(50) DEFAULT 'Pending release'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `design_assignments`
--

INSERT INTO `design_assignments` (`id`, `order_id`, `emp_id`, `tech_id`, `date_assigned`, `pdf_design`, `assign_status`, `tech_status`, `client_fb`, `client_approval`, `stock_release`) VALUES
(1, 1, 8, 10, '2025-11-23', 'IMG_20251113_174033_474.jpg', 'Submited', 'Completed', 'good job', 'Approved', 'Released'),
(2, 2, 8, 10, '2025-11-24', 'IMG_20251113_174033_474.jpg', 'Submited', 'Completed', '', 'Approved', 'Released'),
(3, 3, 8, 10, '2025-11-25', 'c7a3175c64ce4344b1ca57d03ed93121.jpg', 'Submited', 'Completed', 'well done', 'Approved', 'Released');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `userlevel` varchar(20) NOT NULL DEFAULT 'Staff',
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  `contact` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `f_name`, `l_name`, `username`, `email`, `password`, `date_added`, `userlevel`, `status`, `contact`) VALUES
(1, 'Kiprono', 'John', 'Kiprono', 'kiprono@gmail.com', '1234', '2023-10-16 15:24:21', 'Finance', 'Active', '0723456298'),
(5, 'Brian', 'gachari', 'brian', 'briangachari@gmail.com', '1234', '2023-10-23 05:28:13', 'Stock manager', 'Active', '0783456298'),
(7, 'Robert', 'Maina', 'Robert', 'robertmaina@gmail.com', '1234', '2023-11-05 15:20:15', 'Technician', 'Active', '0767439045'),
(8, 'John', 'Maina', 'John', 'john@gmail.com', '1234', '2025-02-19 20:12:00', 'Designer', 'Active', '0745321298'),
(9, 'Vivian', 'Wambui', 'Vivian', 'vivian@gmail.com', '1234', '2025-03-15 18:26:33', 'Designer', 'Active', '0745763218'),
(10, 'David', 'Muhindi', 'David', 'david@gmail.com', '1234', '2025-03-15 18:28:23', 'Technician', 'Active', '0789654890'),
(11, 'Ben', 'Wafula', 'Ben', 'ben@gmail.com', '1234', '2025-03-22 14:27:13', 'Dispatch manager', 'Active', '0756432387'),
(12, 'Abigael ', 'Muruiki', 'Abigael', 'abigaelm@gmail.com', '1234', '2025-10-05 09:39:09', 'Service manager', 'Active', '0789096534'),
(13, 'Elvis', 'Butasi', 'Elvis', 'butasi@gmail.com', '1234', '2025-10-14 21:36:24', 'Driver', 'Active', '0789653412'),
(14, 'Caren', 'Wambui', 'Caren', 'maria@gmail.com', '1234', '2025-10-14 21:36:24', 'Driver', 'Active', '0765459809');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fb_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `fb` text NOT NULL,
  `fb_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_id` int(11) NOT NULL,
  `staff_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(15) NOT NULL,
  `county_id` int(11) DEFAULT NULL,
  `town_id` int(11) DEFAULT NULL,
  `address` varchar(11) DEFAULT NULL,
  `date_to_deliver` varchar(20) DEFAULT NULL,
  `time_to_deliver` varchar(20) DEFAULT NULL,
  `order_status` varchar(11) NOT NULL DEFAULT '0',
  `order_date` varchar(20) DEFAULT NULL,
  `date_delivered` varchar(20) DEFAULT NULL,
  `order_remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `product_id` int(15) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `category` varchar(70) DEFAULT NULL,
  `order_id` int(15) NOT NULL,
  `item_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `print_area` varchar(170) DEFAULT NULL,
  `dimension` varchar(100) DEFAULT NULL,
  `color` varchar(70) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `file_name` varchar(70) DEFAULT NULL,
  `item_status` int(11) NOT NULL DEFAULT 0,
  `design_file` varchar(100) DEFAULT NULL,
  `design_status` varchar(50) DEFAULT 'Pending approval',
  `client_comment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `product_id`, `client_id`, `product_name`, `category`, `order_id`, `item_price`, `quantity`, `total_price`, `print_area`, `dimension`, `color`, `notes`, `file_name`, `item_status`, `design_file`, `design_status`, `client_comment`) VALUES
(1, 7, 2, 'Wedding Hoodies', 'Hoodies', 1, 1500, 4, 6000, 'Front', 'medium-2,large-2', 'Green', 'Dr wedding', '6923814e746d90.86874475_Screenshot_20251124-004532.jpg', 2, 'IMG_20251113_174033_474.jpg', 'Approved', 'good job'),
(2, 17, 2, 'Birthday Caps', 'Caps', 2, 300, 4, 1200, 'Back', 'medium-2,large-2', 'Black', 'happy birthday', '69240cace674e3.27387093_IMG-20251124-WA0054.jpg', 2, 'IMG_20251113_174033_474.jpg', 'Approved', ''),
(3, 10, 2, 'Compaign Hoodie', 'Hoodies', 3, 1500, 2, 3000, 'Front', 'medium-1,large-1', 'Red', 'mama county laikipia', '692555705bddd8.59801918_5a5e3c0f0d264f4c95c1b90b576b892a.jpg', 2, 'c7a3175c64ce4344b1ca57d03ed93121.jpg', 'Approved', 'well done');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(15) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `mpesa_code` varchar(15) NOT NULL,
  `client_id` int(15) NOT NULL,
  `order_cost` int(11) NOT NULL,
  `delivery_cost` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `order_id`, `payment_method`, `mpesa_code`, `client_id`, `order_cost`, `delivery_cost`, `total_cost`, `status`) VALUES
(1, 1, 'mpesa', 'QWERTYUIO1', 2, 6000, 400, 6400, 2),
(2, 2, 'mpesa', 'QWERTYUIO2', 2, 1200, 400, 1600, 2),
(3, 3, 'mpesa', 'QWERTYUIO2', 2, 3000, 400, 3400, 2);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `items` text NOT NULL,
  `color` varchar(50) NOT NULL,
  `request_date` date NOT NULL,
  `request_status` varchar(30) NOT NULL DEFAULT 'Active',
  `remarks` text NOT NULL,
  `quantity` varchar(11) NOT NULL,
  `amount` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `items`, `color`, `request_date`, `request_status`, `remarks`, `quantity`, `amount`) VALUES
(1, 'Caps', 'Black', '2025-11-23', 'Closed', '', '11', ''),
(2, 'Caps', 'Red', '2025-11-24', 'Closed', '', '10', ''),
(3, 'T-shirts', 'White', '2025-11-24', 'Closed', '', '10', ''),
(4, 'T-shirts', 'White', '2025-11-24', 'Closed', '', '5', ''),
(5, 'Caps', 'Maroon', '2025-11-24', 'Closed', '', '5', ''),
(6, 'T-shirts', 'Black', '2025-11-24', 'Closed', '', '45', ''),
(7, 'Hoodies', 'Green', '2025-11-25', 'Closed', '', '50', '');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `stock_id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`stock_id`, `image`, `product_name`, `price`, `stock`, `last_update`, `description`, `category`) VALUES
(1, 'weeding-t.webp', 'Wedding T-Shirts', 700, 2500, '2025-11-24 06:12:32', 'weeding-t', 'T-shirts'),
(2, 'birthday-t.jpeg', 'Birthday T-Shirts', 700, 2500, '2025-11-14 14:57:07', 'birthday-t', 'T-shirts'),
(3, 'religous-t.jpeg', 'Religous T-Shirts', 700, 2500, '2025-11-14 14:57:07', 'religous-t', 'T-shirts'),
(4, 'sports-t.jpeg', 'Sports T-Shirts', 700, 2500, '2025-11-14 14:57:07', 'sports-t', 'T-shirts'),
(5, 'compaign-t.jpeg', 'Compaign T-Shirts', 700, 5000, '2025-11-14 14:57:07', 'compaign-t', 'T-shirts'),
(6, 'NGO-t.jpg', 'NGO  T-Shirts', 700, 2500, '2025-11-14 14:57:07', 'NGO-t', 'T-shirts'),
(7, 'wedding_hoodie.jpg', 'Wedding Hoodies', 1500, 2500, '2025-11-14 14:57:36', 'wedding_hoodie', 'Hoodies'),
(8, 'birthday_hoodie.jpg', 'Birthday Hoodie', 1500, 1000, '2025-11-14 14:57:36', 'birthday_hoodie', 'Hoodies'),
(9, 'sports_hoodie.webp', 'Sports Hoodies', 1500, 1000, '2025-11-14 14:57:36', 'sports_hoodie', 'Hoodies'),
(10, 'compaign_hoodie.jpg', 'Compaign Hoodie', 1500, 5000, '2025-11-14 14:57:36', 'compaign_hoodie', 'Hoodies'),
(11, 'religious_hoodie.jpg', 'Religious Hoodie', 1500, 2900, '2025-11-14 14:57:36', 'religious_hoodie', 'Hoodies'),
(12, 'NGO_hoodie.jpg', 'NGO Hoodie', 1500, 1000, '2025-11-14 14:57:36', 'NGO_hoodie', 'Hoodies'),
(13, 'wedding cap.webp', 'Wedding Caps', 300, 5000, '2025-11-14 14:52:24', 'wedding caps', 'Caps'),
(14, 'compaign cap.jpeg', 'Compaign Caps', 300, 2000, '2025-11-14 14:52:24', 'compaign cap', 'Caps'),
(15, 'sports caps.jpg', 'Sports Caps', 300, 1000, '2025-11-14 14:52:24', 'sports caps', 'Caps'),
(16, 'Religious caps.jpg', 'Religious Caps', 300, 4000, '2025-11-14 14:52:24', 'Religious caps', 'Caps'),
(17, 'birthday caps.jpg', 'Birthday Caps', 300, 2000, '2025-11-14 14:52:24', 'birthday caps', 'Caps'),
(18, 'NGO caps.jpg', 'NGO Caps', 300, 2000, '2025-11-14 14:52:24', 'NGO caps', 'Caps');

-- --------------------------------------------------------

--
-- Table structure for table `service_payment`
--

CREATE TABLE `service_payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(15) NOT NULL,
  `mpesa_code` varchar(15) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `client_id` int(15) NOT NULL,
  `service_fee` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `ship_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `client_name` varchar(70) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `ship_status` varchar(50) DEFAULT 'Pending Delivery'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`ship_id`, `order_id`, `driver_id`, `client_name`, `phone`, `email`, `ship_status`) VALUES
(1, 1, 13, 'grace wanjiru', '0734567347', 'wanjiru@gmail.com', 'Completed'),
(2, 1, 13, 'grace wanjiru', '0734567347', 'wanjiru@gmail.com', 'Completed'),
(3, 1, 13, 'grace wanjiru', '0734567347', 'wanjiru@gmail.com', 'Completed'),
(4, 1, 13, 'grace wanjiru', '0734567347', 'wanjiru@gmail.com', 'Completed'),
(5, 1, 13, 'grace wanjiru', '0734567347', 'wanjiru@gmail.com', 'Completed'),
(6, 3, 13, 'grace wanjiru', '0734567347', 'wanjiru@gmail.com', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `color` varchar(70) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `image`, `product_category`, `color`, `price`, `stock`, `last_update`, `description`) VALUES
(1, 'img', 'T-shirts', 'Black', 500, 253, '2025-11-24 12:38:37', 'T-shirts- black'),
(2, 'img', 'T-shirts', 'White', 500, 165, '2025-11-24 11:47:42', 'T-shirts-white'),
(3, 'img', 'T-shirts', 'Red', 500, 195, '2025-11-13 13:58:28', 'T-shirts-red'),
(4, 'img', 'T-shirts', 'Blue', 500, 200, '2025-11-14 08:40:21', 'T-shirts-blue'),
(5, 'img', 'T-shirts', 'Green', 500, 100, '2025-11-13 13:58:28', 'T-shirts-green'),
(6, 'img', 'T-shirts', 'Maroon', 500, 100, '2025-11-13 13:58:28', 'T-shirts-maroon'),
(7, 'img', 'Hoodies', 'Black', 1000, 97, '2025-11-13 14:00:09', 'Black-hoodie'),
(8, 'img', 'Hoodies', 'White', 1000, 100, '2025-11-13 14:00:09', 'White-hoodie'),
(9, 'img', 'Hoodies', 'Red', 1000, 120, '2025-11-14 08:17:47', 'Red'),
(10, 'img', 'Hoodies', 'Blue', 1000, 100, '2025-11-13 14:00:09', 'Blue-hoodie'),
(11, 'img', 'Hoodies', 'Green', 1000, 146, '2025-11-25 07:29:21', 'Green-hoodie'),
(12, 'img', 'Hoodies', 'Maroon', 1000, 100, '2025-11-13 14:00:09', 'Maroon-hoodie'),
(13, 'img', 'Caps', 'Black', 300, 176, '2025-11-24 07:48:44', 'Black-cap'),
(14, 'img', 'Caps', 'White-cap', 300, 100, '2025-11-13 14:02:17', 'White-cap'),
(15, 'img', 'Caps', 'Red', 300, 110, '2025-11-24 09:56:02', 'Red-cap'),
(16, 'img', 'Caps', 'Blue', 300, 100, '2025-11-13 14:02:17', 'Blue-cap'),
(17, 'img', 'Caps', 'Green', 300, 100, '2025-11-13 14:02:17', 'Green-cap'),
(18, 'img', 'Caps', 'Maroon', 300, 95, '2025-11-24 12:09:55', 'Maroon-cap');

-- --------------------------------------------------------

--
-- Table structure for table `stock_old`
--

CREATE TABLE `stock_old` (
  `stock_id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stock_old`
--

INSERT INTO `stock_old` (`stock_id`, `image`, `product_name`, `price`, `stock`, `last_update`, `description`) VALUES
(1, '1606235323_6911.jpg', 'Onions 1 kg', 250, 822, '2022-03-18 23:11:03', 'best quality'),
(2, '1606235066_9235.jpg', 'Maize per bag', 1500, 165, '2022-03-15 22:44:06', 'best maize'),
(3, '1606235176_3722.jpg', 'Sukuma wiki per bag', 580, 989, '2022-03-18 23:11:03', 'best for all'),
(4, '1606235546_5496.jpg', 'rabbits ', 2500, 175, '2022-03-18 13:41:47', 'best item'),
(5, '1606236173_4002.jpg', 'milk 1 ltr', 100, 981, '2022-03-15 22:39:43', 'quality milk'),
(6, '1606236764_8439.jpg', 'cabbage per bag', 300, 1379, '2022-03-18 23:11:03', 'fresh cabbage'),
(7, '1647640148_7658.jpg', 'l;l;l', 9800, 0, '2022-03-18 21:49:08', 'ljlj');

-- --------------------------------------------------------

--
-- Table structure for table `supply_bids`
--

CREATE TABLE `supply_bids` (
  `bid_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` varchar(60) NOT NULL,
  `total_amount` varchar(60) NOT NULL,
  `bid_status` varchar(30) DEFAULT 'Pending approval'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supply_bids`
--

INSERT INTO `supply_bids` (`bid_id`, `supplier_id`, `request_id`, `quantity`, `unit_price`, `total_amount`, `bid_status`) VALUES
(1, 5, 1, 11, '150', '1650', 'Paid'),
(2, 4, 1, 11, '100', '1100', 'Paid'),
(3, 3, 1, 11, '200', '2200', 'Paid'),
(4, 5, 2, 10, '200', '2000', 'Paid'),
(5, 4, 2, 10, '190', '1900', 'Paid'),
(6, 5, 3, 10, '500', '5000', 'Paid'),
(7, 3, 3, 10, '400', '4000', 'Paid'),
(8, 4, 3, 10, '400', '4000', 'Paid'),
(9, 5, 4, 5, '500', '2500', 'Paid'),
(10, 4, 4, 5, '400', '2000', 'Paid'),
(11, 5, 5, 5, '150', '750', 'Paid'),
(12, 3, 6, 45, '400', '18000', 'Paid'),
(13, 5, 7, 50, '500', '25000', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `supply_payment`
--

CREATE TABLE `supply_payment` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `supplier_id` varchar(25) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `payment_description` varchar(50) NOT NULL,
  `payment_status` varchar(25) NOT NULL DEFAULT 'unpaid',
  `payment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `quantity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supply_payment`
--

INSERT INTO `supply_payment` (`id`, `request_id`, `supplier_id`, `amount`, `payment_description`, `payment_status`, `payment_date`, `quantity`) VALUES
(1, 1, '5', '1650', 'Caps', 'unpaid', '2025-11-24 00:59:30', '11'),
(2, 1, '4', '1100', 'Caps', 'Paid', '2025-11-24 01:00:12', '11'),
(3, 1, '3', '2200', 'Caps', 'unpaid', '2025-11-24 01:00:47', '11'),
(4, 2, '5', '2000', 'Caps', 'unpaid', '2025-11-24 12:43:52', '10'),
(5, 2, '4', '1900', 'Caps', 'Paid', '2025-11-24 12:44:29', '10'),
(6, 3, '5', '5000', 'T-shirts', 'unpaid', '2025-11-24 13:44:11', '10'),
(7, 3, '3', '4000', 'T-shirts', 'unpaid', '2025-11-24 13:45:55', '10'),
(8, 3, '4', '4000', 'T-shirts', 'Paid', '2025-11-24 13:48:11', '10'),
(9, 4, '5', '2500', 'T-shirts', 'unpaid', '2025-11-24 14:42:47', '5'),
(10, 4, '4', '2000', 'T-shirts', 'Paid', '2025-11-24 14:44:37', '5'),
(11, 5, '5', '750', 'Caps', 'Paid', '2025-11-24 15:07:16', '5'),
(12, 6, '3', '18000', 'T-shirts', 'Paid', '2025-11-24 15:33:55', '45'),
(13, 7, '5', '25000', 'Hoodies', 'Paid', '2025-11-25 10:24:46', '50');

-- --------------------------------------------------------

--
-- Table structure for table `tech_assignments`
--

CREATE TABLE `tech_assignments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `pdf_design` varchar(50) NOT NULL,
  `date_assigned` date NOT NULL,
  `assign_status` varchar(50) NOT NULL DEFAULT 'Pending',
  `client_remark` text DEFAULT NULL,
  `client_approval` varchar(50) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `tool_id` int(11) NOT NULL,
  `tool_name` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`tool_id`, `tool_name`, `quantity`) VALUES
(1, 'Scaffolding', 35),
(2, 'Power Drill', 19),
(3, 'Angle Grinder', 17),
(4, 'Silicon', 19),
(5, 'Measuring Tape', 20),
(6, 'Rivet Gun', 18);

-- --------------------------------------------------------

--
-- Table structure for table `tools_requests`
--

CREATE TABLE `tools_requests` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `materials` varchar(100) NOT NULL,
  `request_status` varchar(50) NOT NULL DEFAULT 'Pending approval'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

CREATE TABLE `towns` (
  `town_id` int(11) NOT NULL,
  `town_name` varchar(50) NOT NULL,
  `county_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `towns`
--

INSERT INTO `towns` (`town_id`, `town_name`, `county_id`) VALUES
(1, 'Meru town', 1),
(2, 'Maua', 1),
(3, 'Kianjai', 1),
(4, 'Kiambu town', 2),
(5, 'Limuru', 2),
(6, 'Thika', 2),
(7, 'Kikuyu', 2),
(8, 'Old town', 3),
(9, 'Mambasa town', 3),
(10, 'Nkubu', 1),
(11, 'Mikinduri', 1),
(14, 'Mathare', 1),
(15, 'Runogone', 1),
(16, 'Kaaga', 1),
(17, 'Kaaga', 1),
(18, 'Mloleni', 4),
(19, 'Kiambere', 4),
(20, 'Kisimani', 4),
(21, 'Kagundo', 4),
(22, 'Embu Town', 5),
(23, 'Mvita', 5),
(24, 'Mikinduri', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `assign`
--
ALTER TABLE `assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_code` (`client_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `client_code_2` (`client_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `location_id` (`county`),
  ADD KEY `ap_id` (`town`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `counties`
--
ALTER TABLE `counties`
  ADD PRIMARY KEY (`county_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ap_id` (`county`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `town_id` (`town`);

--
-- Indexes for table `delivery_cost`
--
ALTER TABLE `delivery_cost`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `design_assignments`
--
ALTER TABLE `design_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fb_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_code` (`client_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `client_code_2` (`client_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `location_id` (`county_id`),
  ADD KEY `ap_id` (`town_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `product_code` (`product_id`),
  ADD KEY `order_code` (`order_id`),
  ADD KEY `order_code_2` (`order_id`),
  ADD KEY `order_code_3` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `pro_id` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_id_2` (`order_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `service_payment`
--
ALTER TABLE `service_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_id_2` (`order_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`ship_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_old`
--
ALTER TABLE `stock_old`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `supply_bids`
--
ALTER TABLE `supply_bids`
  ADD PRIMARY KEY (`bid_id`);

--
-- Indexes for table `supply_payment`
--
ALTER TABLE `supply_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tech_assignments`
--
ALTER TABLE `tech_assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`tool_id`);

--
-- Indexes for table `tools_requests`
--
ALTER TABLE `tools_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`town_id`),
  ADD KEY `county_id` (`county_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assign`
--
ALTER TABLE `assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `counties`
--
ALTER TABLE `counties`
  MODIFY `county_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_cost`
--
ALTER TABLE `delivery_cost`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `design_assignments`
--
ALTER TABLE `design_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fb_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `service_payment`
--
ALTER TABLE `service_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `ship_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `stock_old`
--
ALTER TABLE `stock_old`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supply_bids`
--
ALTER TABLE `supply_bids`
  MODIFY `bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `supply_payment`
--
ALTER TABLE `supply_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tech_assignments`
--
ALTER TABLE `tech_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `tool_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tools_requests`
--
ALTER TABLE `tools_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `towns`
--
ALTER TABLE `towns`
  MODIFY `town_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
