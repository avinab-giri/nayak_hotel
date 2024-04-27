-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2023 at 01:26 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_be`
--

-- --------------------------------------------------------

--
-- Table structure for table `activityfeed`
--

CREATE TABLE `activityfeed` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(10) DEFAULT NULL,
  `type` varchar(250) NOT NULL,
  `bid` int(11) DEFAULT NULL,
  `bdid` int(11) DEFAULT NULL,
  `oldData` varchar(250) DEFAULT NULL,
  `changedata` varchar(250) DEFAULT NULL,
  `ipaddres` varchar(250) DEFAULT NULL,
  `result` varchar(150) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `addBy` varchar(11) DEFAULT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activityfeed`
--

INSERT INTO `activityfeed` (`id`, `hotelId`, `type`, `bid`, `bdid`, `oldData`, `changedata`, `ipaddres`, `result`, `reason`, `addBy`, `addOn`) VALUES
(1, '', 'login', 0, 0, '', '', '', 'success', '', 'a_1', '2023-04-04 08:00:58'),
(2, 'c1f91', 'checkinstatus', 2, 2, NULL, '2', NULL, NULL, NULL, 'a_1', '2023-04-04 09:34:50'),
(3, '', 'login', 0, 0, '', '', '', 'success', '', 'a_1', '2023-08-23 04:14:55'),
(4, '', 'login', 0, 0, '', '', '', 'success', '', 'a_1', '2023-08-25 05:47:59'),
(5, '', 'login', 0, 0, '', '', '', 'success', '', 'a_1', '2023-08-25 12:11:24'),
(6, '', 'login', 0, 0, '', '', '', 'success', '', 'a_1', '2023-08-25 12:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `img` varchar(150) NOT NULL,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addBy` varchar(11) DEFAULT NULL,
  `add_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `hotelId`, `title`, `img`, `deleteRec`, `addBy`, `add_on`) VALUES
(1, '', 'Lockers', 'locker.svg', 1, NULL, '2022-01-06 09:03:49'),
(2, '', 'Free Wi-Fi', 'wifi.svg', 1, NULL, '2022-01-06 09:03:49'),
(3, '', 'Air-conditioning', 'ac.svg', 1, NULL, '2022-01-06 09:03:49'),
(4, '', 'Cafe', 'restaurant.svg', 1, NULL, '2022-01-06 09:03:49'),
(5, '', 'Breakfast', 'breakfast.svg', 1, NULL, '0000-00-00 00:00:00'),
(6, '', 'Linen Included', 'linen.svg', 1, NULL, '0000-00-00 00:00:00'),
(7, '', 'Parking', 'parking.svg', 1, NULL, '0000-00-00 00:00:00'),
(8, '', 'Hot water', 'hot-water.svg', 1, NULL, '0000-00-00 00:00:00'),
(9, '', 'Card Payment Accepted', 'card.svg', 1, NULL, '0000-00-00 00:00:00'),
(10, '', '\n24/7 Reception', 'reception.svg', 1, NULL, '0000-00-00 00:00:00'),
(11, '', 'In-house Activities', 'game.svg', 1, NULL, '0000-00-00 00:00:00'),
(12, '', 'Sea View', 'sea-view.svg', 1, NULL, '0000-00-00 00:00:00'),
(13, '', 'UPI Payment Accepted', 'upi.svg', 1, NULL, '0000-00-00 00:00:00'),
(14, '', 'Laundry Services', 'laundry.svg', 1, NULL, '0000-00-00 00:00:00'),
(15, '', 'Water Dispenser', 'water-dispenser.svg', 1, NULL, '0000-00-00 00:00:00'),
(16, '', 'Common hangout area', 'casino.svg', 1, NULL, '0000-00-00 00:00:00'),
(17, '', 'Bedside Lamps', 'bedside-lamps.svg', 1, NULL, '0000-00-00 00:00:00'),
(18, '', 'Storage Facility', 'luggage.svg', 1, NULL, '2023-05-09 16:47:53'),
(19, '', 'Shower', 'shower.svg', 1, NULL, '2023-05-09 16:47:53'),
(30, '', 'Electric Kettle', '7167.png', 1, NULL, '0000-00-00 00:00:00'),
(31, '', 'Hair Drier', '1898.png', 1, NULL, '0000-00-00 00:00:00'),
(32, '', 'Mini Refrigerator ', '3771.png', 1, NULL, '0000-00-00 00:00:00'),
(33, '', 'Room Service', '7943.png', 1, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `banktypemethod`
--

CREATE TABLE `banktypemethod` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `addBy` varchar(250) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banktypemethod`
--

INSERT INTO `banktypemethod` (`id`, `pid`, `name`, `status`, `addBy`, `addOn`) VALUES
(1, 0, 'Cheque', 1, '1', '2022-06-24 00:50:15'),
(2, 0, 'Credit card', 1, '1', '2022-06-24 00:50:59'),
(3, 0, 'Debit card', 1, '1', '2022-06-24 00:50:59'),
(4, 0, 'NEFT/RTGS', 1, '1', '2022-06-24 00:51:22'),
(5, 0, 'UPI', 1, '1', '2022-06-24 00:51:49'),
(6, 0, 'Cash', 1, '1', '2022-07-07 12:50:49'),
(7, 0, 'Payment Gateway', 1, '1', '2023-08-15 16:23:08');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `bookinId` varchar(250) NOT NULL,
  `reciptNo` varchar(8) DEFAULT NULL,
  `userPay` float DEFAULT 0,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `nroom` int(11) NOT NULL,
  `couponCode` varchar(250) DEFAULT NULL,
  `pickUp` float DEFAULT NULL,
  `payment_status` varchar(250) DEFAULT NULL,
  `payment_id` varchar(250) DEFAULT NULL,
  `bookingSource` int(11) NOT NULL,
  `reservationType` int(11) DEFAULT NULL,
  `salesType` int(11) DEFAULT NULL,
  `bussinessSource` int(11) NOT NULL,
  `voucherNumber` varchar(250) DEFAULT NULL,
  `comPlanId` int(11) DEFAULT NULL,
  `comValue` float DEFAULT NULL,
  `coompanyId` int(11) DEFAULT NULL,
  `paymethodId` int(11) DEFAULT NULL,
  `paytypeId` int(11) DEFAULT NULL,
  `commission` float DEFAULT NULL,
  `booking_attr` varchar(250) NOT NULL,
  `addBy` text DEFAULT NULL,
  `add_on` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1,
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `hotelId`, `bookinId`, `reciptNo`, `userPay`, `checkIn`, `checkOut`, `nroom`, `couponCode`, `pickUp`, `payment_status`, `payment_id`, `bookingSource`, `reservationType`, `salesType`, `bussinessSource`, `voucherNumber`, `comPlanId`, `comValue`, `coompanyId`, `paymethodId`, `paytypeId`, `commission`, `booking_attr`, `addBy`, `add_on`, `status`, `deleteRec`) VALUES
(1, 'c1f91', 'booking2ad168', NULL, 0, '0000-00-00', '0000-00-00', 0, '', 0, 'pending', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-11 04:12:36', 1, 1),
(2, 'c1f91', 'booking35d5fd', NULL, 0, '0000-00-00', '0000-00-00', 0, '', 0, 'pending', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-11 07:26:21', 1, 1),
(3, 'c1f91', 'booking8ef2a1', NULL, 0, '2023-08-10', '2023-08-11', 0, '', 0, 'pending', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-11 11:48:56', 1, 1),
(4, 'c1f91', 'booking991508', NULL, 0, '0000-00-00', '0000-00-00', 0, '', 0, 'pending', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-14 09:56:50', 1, 1),
(5, 'c1f91', 'booking1e7d6a', NULL, 0, '0000-00-00', '0000-00-00', 0, '', 0, 'pending', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-14 10:43:31', 1, 1),
(6, 'c1f91', 'booking6af3f6', NULL, 0, '0000-00-00', '0000-00-00', 0, '', 0, 'pending', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-14 10:52:42', 1, 1),
(7, 'c1f91', 'booking8efe9f', NULL, 0, '0000-00-00', '0000-00-00', 0, '', 0, 'pending', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-14 10:53:37', 1, 1),
(8, 'c1f91', 'booking68b48d', NULL, 0, '2023-08-12', '2023-08-14', 0, '', 0, 'pending', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-14 11:52:18', 1, 1),
(9, 'c1f91', 'booking881e48', NULL, 0, '2023-08-15', '0000-00-00', 0, '', 0, 'pending', NULL, 2, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-16 12:05:42', 1, 1),
(10, 'c1f91', 'booking82fd28', NULL, 0, '2023-08-16', '0000-00-00', 0, '', 0, 'pending', NULL, 2, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2023-08-16 12:21:19', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookingdetail`
--

CREATE TABLE `bookingdetail` (
  `id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `roomDId` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `gstPer` int(11) DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `checkinstatus` int(11) DEFAULT 1,
  `addBy` varchar(250) DEFAULT NULL,
  `checkinBy` datetime DEFAULT NULL,
  `checkOutBy` datetime DEFAULT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingdetail`
--

INSERT INTO `bookingdetail` (`id`, `bid`, `roomId`, `roomDId`, `room_number`, `adult`, `child`, `gstPer`, `totalPrice`, `checkinstatus`, `addBy`, `checkinBy`, `checkOutBy`, `addOn`, `deleteRec`) VALUES
(1, 1, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2023-08-10 22:42:36', 1),
(2, 2, 1, 1, 0, 2, 1, NULL, 3171.84, 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2023-08-11 13:56:21', 1),
(3, 3, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-11 00:00:00', '2023-08-12 00:00:00', '2023-08-11 18:18:56', 1),
(4, 3, 3, 3, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-11 00:00:00', '2023-08-12 00:00:00', '2023-08-11 18:18:56', 1),
(5, 4, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-12 00:00:00', '2023-08-13 00:00:00', '2023-08-14 04:26:50', 1),
(6, 4, 1, 5, 0, 2, 0, NULL, 3360, 1, NULL, '2023-08-12 00:00:00', '2023-08-13 00:00:00', '2023-08-14 04:26:50', 1),
(7, 4, 2, 2, 0, 2, 0, NULL, 4480, 1, NULL, '2023-08-12 00:00:00', '2023-08-13 00:00:00', '2023-08-14 04:26:50', 1),
(8, 5, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-14 00:00:00', '2023-08-15 00:00:00', '2023-08-14 05:13:31', 1),
(9, 6, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-14 00:00:00', '2023-08-15 00:00:00', '2023-08-14 05:22:42', 1),
(10, 7, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-14 00:00:00', '2023-08-15 00:00:00', '2023-08-14 05:23:37', 1),
(11, 7, 2, 2, 0, 2, 0, NULL, 4480, 1, NULL, '2023-08-14 00:00:00', '2023-08-15 00:00:00', '2023-08-14 05:23:37', 1),
(12, 8, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-14 00:00:00', '2023-08-15 00:00:00', '2023-08-14 06:22:18', 1),
(13, 8, 1, 5, 0, 2, 0, NULL, 3360, 1, NULL, '2023-08-14 00:00:00', '2023-08-15 00:00:00', '2023-08-14 06:22:18', 1),
(14, 9, 2, 2, 0, 2, 0, NULL, 4480, 1, NULL, '2023-08-15 00:00:00', '2023-08-16 00:00:00', '2023-08-15 18:35:42', 1),
(15, 9, 2, 2, 0, 2, 0, NULL, 4480, 1, NULL, '2023-08-15 00:00:00', '2023-08-16 00:00:00', '2023-08-15 18:35:42', 1),
(16, 9, 2, 2, 0, 2, 0, NULL, 4480, 1, NULL, '2023-08-15 00:00:00', '2023-08-16 00:00:00', '2023-08-15 18:35:42', 1),
(17, 9, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-15 00:00:00', '2023-08-16 00:00:00', '2023-08-15 18:35:42', 1),
(18, 9, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-15 00:00:00', '2023-08-16 00:00:00', '2023-08-15 18:35:42', 1),
(19, 9, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-15 00:00:00', '2023-08-16 00:00:00', '2023-08-15 18:35:42', 1),
(20, 10, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-16 00:00:00', '2023-08-17 00:00:00', '2023-08-15 18:51:19', 1),
(21, 0, 1, 1, 0, 2, 0, NULL, 3136, 1, NULL, '2023-08-17 00:00:00', '2023-08-18 00:00:00', '2023-08-17 19:10:39', 1),
(22, 0, 2, 2, 0, 2, 0, NULL, 4480, 1, NULL, '2023-08-16 00:00:00', '2023-08-17 00:00:00', '2023-08-17 19:10:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookingpaymenttimeline`
--

CREATE TABLE `bookingpaymenttimeline` (
  `id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `amount` float NOT NULL,
  `paymentMethod` int(11) NOT NULL,
  `remark` text DEFAULT NULL,
  `addBy` varchar(11) NOT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingpaymenttimeline`
--

INSERT INTO `bookingpaymenttimeline` (`id`, `bid`, `amount`, `paymentMethod`, `remark`, `addBy`, `addOn`) VALUES
(1, 1, 5000, 6, NULL, 'a_1', '2023-04-02 14:34:34'),
(2, 2, 10000, 6, NULL, 'a_1', '2023-04-02 14:35:06'),
(3, 3, 5000, 6, NULL, 'a_2', '2023-04-02 14:39:30'),
(4, 4, 5000, 6, NULL, 'a_2', '2023-04-02 14:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `bookingsource`
--

CREATE TABLE `bookingsource` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(10) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `img` varchar(250) NOT NULL,
  `addBy` varchar(150) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingsource`
--

INSERT INTO `bookingsource` (`id`, `hotelId`, `name`, `status`, `img`, `addBy`, `addOn`) VALUES
(1, '', 'Direct Booking', 1, 'pms.png', '0', '2022-06-07 20:05:19'),
(2, '', 'Booking Engine', 1, 'diretBooking.png', '0', '2022-06-07 20:04:27'),
(3, '', 'Travel Agent', 1, 'travel.png', '0', '2022-06-07 20:05:05'),
(4, '', 'Company', 1, '', '0', '2022-06-07 20:05:05'),
(6, '', 'OTA', 1, 'ota.png', '0', '2022-06-07 20:04:27');

-- --------------------------------------------------------

--
-- Table structure for table `cashiering`
--

CREATE TABLE `cashiering` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `bookingSource` varchar(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `contactPerson` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `type` varchar(20) NOT NULL,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `addBy` text NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cashiering`
--

INSERT INTO `cashiering` (`id`, `hotelId`, `bookingSource`, `name`, `contactPerson`, `phone`, `email`, `type`, `deleteRec`, `status`, `addBy`, `addOn`) VALUES
(1, '8351f', '1', 'Avinab', 'avinab giri', '', '', '', 0, 1, '1_16-03-2023', '2023-03-16 05:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `check_in_status`
--

CREATE TABLE `check_in_status` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `check_in_status`
--

INSERT INTO `check_in_status` (`id`, `name`, `color`, `addOn`) VALUES
(1, 'Reservation', '7928ca', '2022-07-05 02:08:26'),
(2, 'Check In', '008000', '2022-07-05 02:08:26'),
(3, 'Check Out', 'ff8100', '2022-07-05 02:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `couponcode`
--

CREATE TABLE `couponcode` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `offerType` int(11) NOT NULL,
  `coupon_code` varchar(250) NOT NULL,
  `coupon_type` enum('P','F') NOT NULL,
  `min_value` float NOT NULL,
  `coupon_value` float NOT NULL,
  `expire_on` date NOT NULL,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addBy` text NOT NULL,
  `add_on` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `couponcode`
--

INSERT INTO `couponcode` (`id`, `hotelId`, `offerType`, `coupon_code`, `coupon_type`, `min_value`, `coupon_value`, `expire_on`, `deleteRec`, `addBy`, `add_on`, `status`) VALUES
(1, 'c1f91', 1, 'test25', 'P', 0, 25, '2023-08-31', 1, '', '2023-07-27 16:40:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bookingId` varchar(50) NOT NULL,
  `roomNum` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `file` varchar(150) NOT NULL,
  `amount` float NOT NULL,
  `paymentMode` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `addBy` int(11) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `expense_type`
--

CREATE TABLE `expense_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `facing`
--

CREATE TABLE `facing` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `img` varchar(150) NOT NULL,
  `addOn` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facing`
--

INSERT INTO `facing` (`id`, `title`, `img`, `addOn`) VALUES
(1, 'See Facing', 'seeFaching.png', '2022-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `text` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  `addBy` text NOT NULL,
  `add_on` datetime NOT NULL DEFAULT current_timestamp(),
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `bookId` int(11) DEFAULT NULL,
  `bookingdId` int(11) NOT NULL,
  `verify` int(11) NOT NULL,
  `serial` varchar(11) NOT NULL DEFAULT '0',
  `nameTitle` enum('Mr.','Ms.','Mrs.') NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` varchar(150) DEFAULT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `comGst` varchar(250) DEFAULT NULL,
  `country` varchar(250) NOT NULL,
  `state` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `kyc_file` varchar(250) DEFAULT NULL,
  `kyc_number` varchar(250) DEFAULT NULL,
  `kyc_type` int(11) DEFAULT NULL,
  `file_upload_type` varchar(10) DEFAULT NULL,
  `proof_file_upload_type` varchar(11) DEFAULT NULL,
  `addBy` text DEFAULT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp(),
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`id`, `hotelId`, `bookId`, `bookingdId`, `verify`, `serial`, `nameTitle`, `name`, `email`, `phone`, `gender`, `company_name`, `comGst`, `country`, `state`, `city`, `zip`, `image`, `kyc_file`, `kyc_number`, `kyc_type`, `file_upload_type`, `proof_file_upload_type`, `addBy`, `addOn`, `deleteRec`) VALUES
(1, 'c1f91', 1, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-11 04:12:36', 1),
(2, 'c1f91', 2, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-11 19:26:21', 1),
(3, 'c1f91', 2, 0, 0, '2', 'Mr.', 'Avinab Giri', 'avinabgiri7978@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-11 19:26:21', 1),
(4, 'c1f91', 3, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-11 23:48:56', 1),
(5, 'c1f91', 4, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 09:56:50', 1),
(6, 'c1f91', 5, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 10:43:31', 1),
(7, 'c1f91', 6, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 10:52:42', 1),
(8, 'c1f91', 7, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 10:53:37', 1),
(9, 'c1f91', 8, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 11:52:18', 1),
(10, 'c1f91', 9, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-16 00:05:42', 1),
(11, 'c1f91', 10, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-16 00:21:19', 1),
(12, 'c1f91', 0, 0, 0, '1', 'Mr.', 'Avinab Giri', 'avinabgiri9439@gmail.com', '9439706344', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-18 00:40:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `guestamenddetail`
--

CREATE TABLE `guestamenddetail` (
  `id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `bdid` int(11) NOT NULL,
  `checkInTime` timestamp NULL DEFAULT NULL,
  `checkOutTime` timestamp NULL DEFAULT NULL,
  `addbycheckin` int(11) DEFAULT NULL,
  `addbycheckout` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guestamenddetail`
--

INSERT INTO `guestamenddetail` (`id`, `bid`, `bdid`, `checkInTime`, `checkOutTime`, `addbycheckin`, `addbycheckout`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL),
(2, 2, 2, '2023-04-03 21:34:50', NULL, 1, NULL),
(3, 3, 3, '2023-04-02 02:40:11', NULL, 2, NULL),
(4, 4, 4, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guestidproof`
--

CREATE TABLE `guestidproof` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `guest_review`
--

CREATE TABLE `guest_review` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `adminId` int(11) DEFAULT NULL,
  `guestId` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `msg` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addBy` text DEFAULT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `hCode` varchar(8) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `hotelName` varchar(150) NOT NULL,
  `hotelEmailId` varchar(250) NOT NULL,
  `hotelPhoneNum` varchar(250) NOT NULL,
  `waNum` varchar(15) DEFAULT NULL,
  `website` varchar(250) NOT NULL,
  `commission` int(11) NOT NULL,
  `paymentGetway` varchar(50) NOT NULL,
  `webBilder` int(11) NOT NULL,
  `bookingEngine` int(11) NOT NULL,
  `pms` int(11) NOT NULL,
  `kot` int(11) NOT NULL DEFAULT 0,
  `marketing` int(11) NOT NULL DEFAULT 0,
  `beLink` varchar(250) NOT NULL,
  `distanceTrainStation` varchar(250) DEFAULT NULL,
  `distanceBusStand` varchar(250) DEFAULT NULL,
  `distanceAirport` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `hotelAddOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id`, `hCode`, `slug`, `hotelName`, `hotelEmailId`, `hotelPhoneNum`, `waNum`, `website`, `commission`, `paymentGetway`, `webBilder`, `bookingEngine`, `pms`, `kot`, `marketing`, `beLink`, `distanceTrainStation`, `distanceBusStand`, `distanceAirport`, `status`, `hotelAddOn`) VALUES
(1, 'c1f91', 'arpita-beach-resort', 'Arpita Beach Resort', 'avinabgiri7978@gmail.com', '8763816022', NULL, 'https://arpitabeachresort.in', 3, 'retrod', 1, 1, 1, 0, 0, '', 'Chandigarh Railway Station is the nearest railway station which is approximately 260 km away from the hostel.', 'The closest bus station is Banjar Bus Station which is around 12 km away from the hostel.', 'The nearest airport is Chandigarh Airport which is approximately 265 km away from the hostel.', 1, '2023-04-01 12:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `hotelprofile`
--

CREATE TABLE `hotelprofile` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `lightlogo` varchar(250) NOT NULL,
  `darklogo` varchar(250) NOT NULL,
  `favicon` varchar(150) NOT NULL,
  `kotLogo` varchar(150) NOT NULL,
  `gst` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `checkIn` varchar(250) NOT NULL,
  `checkOut` varchar(250) NOT NULL,
  `addBy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotelprofile`
--

INSERT INTO `hotelprofile` (`id`, `hotelId`, `lightlogo`, `darklogo`, `favicon`, `kotLogo`, `gst`, `description`, `checkIn`, `checkOut`, `addBy`) VALUES
(12, 'c1f91', 'logo_534852.png', 'logo_483223.png', 'logo_105596.png', 'logo_164731.png', '', 'Arpita Beach Resort is a popular Four Star facility Hotel located in Chandipur, a seaside resort town in the state of Odisha, India. Chandipur beach is known for its unique natural phenomenon of receding water, which happens twice a day and exposes miles of pristine beach and sea shells.', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `hotelservice`
--

CREATE TABLE `hotelservice` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `slag` varchar(10) NOT NULL,
  `short` varchar(5) NOT NULL,
  `serviceName` varchar(11) NOT NULL,
  `commission` float NOT NULL,
  `voucher` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotelservice`
--

INSERT INTO `hotelservice` (`id`, `hotelId`, `slag`, `short`, `serviceName`, `commission`, `voucher`, `status`) VALUES
(1, 'c1f91', 'booking', 'BE', 'Booking', 0, '', 1),
(2, 'c1f91', 'quickPay', 'QP', 'Quick Pay', 0, '', 1),
(3, 'c1f91', 'walkIn', 'WI', 'Walk In', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hotelsociallink`
--

CREATE TABLE `hotelsociallink` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(10) NOT NULL,
  `slId` int(11) NOT NULL,
  `link` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotelsociallink`
--

INSERT INTO `hotelsociallink` (`id`, `hotelId`, `slId`, `link`) VALUES
(1, 'c1f91', 1, 'daskjd'),
(2, 'c1f91', 2, 'sdssdf');

-- --------------------------------------------------------

--
-- Table structure for table `hoteluser`
--

CREATE TABLE `hoteluser` (
  `id` int(11) NOT NULL,
  `hotelMainId` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `bio` text NOT NULL,
  `userId` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) DEFAULT 0,
  `permission` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `addBy` varchar(11) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hoteluser`
--

INSERT INTO `hoteluser` (`id`, `hotelMainId`, `name`, `email`, `phone`, `designation`, `bio`, `userId`, `password`, `role`, `permission`, `status`, `addBy`, `addOn`) VALUES
(1, 1, 'Janmejay ', 'arpitabeachresort@gmail.com', '7504838884', '', '', 'arpitabeachresort@gmail.com', 'Pass@2022', 1, NULL, 1, '', '2023-04-02 17:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_booking_attr`
--

CREATE TABLE `hotel_booking_attr` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(150) NOT NULL,
  `bookingAttrId` int(11) NOT NULL,
  `value` float NOT NULL DEFAULT 0,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `room_detail_id` int(11) DEFAULT NULL,
  `add_date` date NOT NULL,
  `room` int(11) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `price2` float NOT NULL DEFAULT 0,
  `eAdult` float NOT NULL,
  `eChild` float NOT NULL,
  `addBy` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kotcategory`
--

CREATE TABLE `kotcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kotcategory`
--

INSERT INTO `kotcategory` (`id`, `name`) VALUES
(1, 'veg'),
(2, 'non veg');

-- --------------------------------------------------------

--
-- Table structure for table `kotgstprice`
--

CREATE TABLE `kotgstprice` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(50) NOT NULL,
  `cgst` float NOT NULL,
  `sgst` float NOT NULL,
  `igst` int(11) DEFAULT NULL,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kotguestdetail`
--

CREATE TABLE `kotguestdetail` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kotguestdetail`
--

INSERT INTO `kotguestdetail` (`id`, `hotelId`, `name`, `email`, `phone`, `deleteRec`) VALUES
(1, '8351f', 'avi giri', 'avi@gmail.com', '3546456', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kotorder`
--

CREATE TABLE `kotorder` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(10) NOT NULL,
  `billno` int(11) NOT NULL,
  `serviceId` int(11) NOT NULL,
  `servicePropertyId` int(11) NOT NULL,
  `personId` int(11) NOT NULL,
  `totalProductPrice` float NOT NULL,
  `kotDisPro` varchar(10) NOT NULL,
  `kotDisValue` float NOT NULL,
  `subTotal` float NOT NULL,
  `tax` float NOT NULL,
  `totalPrice` float NOT NULL,
  `kotAdvancePay` float NOT NULL,
  `kotBalancePay` float NOT NULL,
  `orderStatus` int(11) NOT NULL DEFAULT 0,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kotorder`
--

INSERT INTO `kotorder` (`id`, `hotelId`, `billno`, `serviceId`, `servicePropertyId`, `personId`, `totalProductPrice`, `kotDisPro`, `kotDisValue`, `subTotal`, `tax`, `totalPrice`, `kotAdvancePay`, `kotBalancePay`, `orderStatus`, `deleteRec`, `addOn`) VALUES
(1, '8351f', 1, 1, 3, 1, 123, '', 0, 123, 0, 123, 0, 123, 1, 1, '2023-03-13 04:20:44');

-- --------------------------------------------------------

--
-- Table structure for table `kotorderdetail`
--

CREATE TABLE `kotorderdetail` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `proId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `note` varchar(550) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kotorderdetail`
--

INSERT INTO `kotorderdetail` (`id`, `orderId`, `proId`, `qty`, `note`) VALUES
(1, 1, 1, 1, ''),
(2, 1, 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `kotorderstatus`
--

CREATE TABLE `kotorderstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `bgcolor` varchar(10) NOT NULL,
  `color` varchar(10) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kotorderstatus`
--

INSERT INTO `kotorderstatus` (`id`, `name`, `bgcolor`, `color`, `addOn`) VALUES
(1, 'clean', '#c3e6cb', '#155724', '2023-02-13 10:32:48'),
(2, 'dirty', '#ffeeba', '#856404', '2023-02-13 10:32:48'),
(3, 'book', '#f5c6cb', '#721c24', '2023-02-13 10:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `kotprouct`
--

CREATE TABLE `kotprouct` (
  `id` int(11) NOT NULL,
  `hotelid` varchar(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` float NOT NULL,
  `productcat` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kotprouct`
--

INSERT INTO `kotprouct` (`id`, `hotelid`, `name`, `price`, `productcat`, `status`, `deleteRec`, `addOn`) VALUES
(1, '8351f', 'Rice', 20, 1, 1, 1, '2023-03-13 09:02:49'),
(2, '8351f', 'Biryani', 103, 2, 1, 1, '2023-03-13 09:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `kotservice`
--

CREATE TABLE `kotservice` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `bdTable` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kotservice`
--

INSERT INTO `kotservice` (`id`, `hotelId`, `name`, `bdTable`, `status`, `addOn`) VALUES
(1, '', 'Table', 'kottable', 1, '2022-12-05 23:25:22'),
(2, '', 'Room', 'room', 1, '2022-12-05 23:25:33'),
(3, '', 'kotSeviceList', '', 1, '2022-12-05 23:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `kottable`
--

CREATE TABLE `kottable` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(10) NOT NULL,
  `tableNum` varchar(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kottable`
--

INSERT INTO `kottable` (`id`, `hotelId`, `tableNum`, `status`, `deleteRec`, `addOn`) VALUES
(1, '8351f', '1', 1, 1, '2023-03-13 08:53:50'),
(2, '8351f', '2', 1, 1, '2023-03-13 08:53:52'),
(3, '8351f', '3', 1, 1, '2023-03-13 08:53:53'),
(4, '97143', '1', 1, 1, '2023-03-29 00:21:58'),
(5, '97143', '2', 1, 1, '2023-03-29 00:21:59'),
(6, '97143', '3', 1, 1, '2023-03-29 00:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `kot_qty_unit`
--

CREATE TABLE `kot_qty_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fullForm` varchar(250) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kot_qty_unit`
--

INSERT INTO `kot_qty_unit` (`id`, `name`, `fullForm`, `addOn`) VALUES
(1, 'kg', 'kilogram ', '2023-01-31 02:58:05'),
(2, 'lt', 'Litre', '2023-01-31 02:59:56'),
(4, 'pack', 'pack', '2023-02-01 18:26:17'),
(5, 'tray', 'tray', '2023-02-01 18:26:17'),
(6, 'bottle', 'bottle', '2023-02-01 18:26:32');

-- --------------------------------------------------------

--
-- Table structure for table `kot_raw_product_list`
--

CREATE TABLE `kot_raw_product_list` (
  `id` int(11) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `priceCalculateBy` varchar(150) NOT NULL,
  `img` varchar(150) DEFAULT NULL,
  `tag` varchar(250) NOT NULL,
  `addBy` int(11) NOT NULL DEFAULT 0,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kot_raw_product_list`
--

INSERT INTO `kot_raw_product_list` (`id`, `sku`, `name`, `priceCalculateBy`, `img`, `tag`, `addBy`, `addOn`) VALUES
(1, 'ptt', 'potato', 'kg', 'kotFood_344536.jpg', 'allu, potato', 0, '2023-02-16 16:50:15'),
(2, 'onn', 'onion', 'kg', 'kotFood_198712.jpg', 'piaga', 0, '2023-02-16 16:50:51'),
(3, 'eg', 'egg', 'tray', 'kotFood_537535.jpg', 'anda', 0, '2023-02-16 16:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `kot_stock`
--

CREATE TABLE `kot_stock` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(50) NOT NULL,
  `rawProId` int(11) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp(),
  `totalPrice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kot_stock`
--

INSERT INTO `kot_stock` (`id`, `hotelId`, `rawProId`, `addOn`, `totalPrice`) VALUES
(1, '8351f', 3, '2023-03-13 09:07:00', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `kot_stock_timeline`
--

CREATE TABLE `kot_stock_timeline` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(10) NOT NULL,
  `kotStockId` int(11) NOT NULL,
  `action` enum('buy','sell') NOT NULL,
  `qty` float NOT NULL,
  `totalPrice` float DEFAULT NULL,
  `addBy` int(11) NOT NULL DEFAULT 0,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kot_stock_timeline`
--

INSERT INTO `kot_stock_timeline` (`id`, `hotelId`, `kotStockId`, `action`, `qty`, `totalPrice`, `addBy`, `addOn`) VALUES
(1, '8351f', 1, 'buy', 100, 1000, 0, '2023-03-13 09:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `live`
--

CREATE TABLE `live` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `live`
--

INSERT INTO `live` (`id`, `status`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  `car` int(11) NOT NULL,
  `duration` float NOT NULL,
  `description` text NOT NULL,
  `room` int(11) NOT NULL,
  `rdid` int(11) NOT NULL,
  `discount` float NOT NULL,
  `pickup` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `addBy` text NOT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `package_policy`
--

CREATE TABLE `package_policy` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`id`, `name`, `addOn`) VALUES
(1, 'Success', '2022-08-26 06:26:35'),
(2, 'Failed', '2022-08-26 06:26:47'),
(3, 'Return', '2022-08-26 06:27:07');

-- --------------------------------------------------------

--
-- Table structure for table `propertycounlist`
--

CREATE TABLE `propertycounlist` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT 0,
  `name` varchar(250) NOT NULL,
  `addBy` int(11) DEFAULT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `propertyinfo`
--

CREATE TABLE `propertyinfo` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(50) NOT NULL,
  `sn` int(11) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `type` enum('information','policies') NOT NULL,
  `addBy` int(11) NOT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `propertyinfo`
--

INSERT INTO `propertyinfo` (`id`, `hotelId`, `sn`, `title`, `description`, `type`, `addBy`, `addOn`) VALUES
(1, 'c1f91', NULL, 'Important Timings', '<div class=\"iconWithList\">\r\n                                    <div class=\"item\">\r\n                                        <div class=\"icon\">\r\n                                            <svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\" viewBox=\"15.5 0 50 50\" style=\"enable-background:new 15.5 0 50 50;\">\r\n\r\n                                                <path id=\"checkIn\" d=\"M32.9,25c-3.4,0-6.1-2.7-6.1-6c0-3.3,2.7-6,6.1-6c3.4,0,6.1,2.7,6.1,6C39,22.3,36.2,25,32.9,25z M32.9,16\r\n                                                    c-1.7,0-3,1.4-3,3c0,1.7,1.4,3,3,3c1.7,0,3-1.4,3-3C35.9,17.3,34.6,16,32.9,16z M40.5,37.1H25.3c-0.8,0-1.5-0.7-1.5-1.5v-1.5\r\n                                                    c0-2.6,1.2-5.1,3.2-6.9c0.5-0.4,1.1-0.5,1.7-0.2c2.6,1.4,5.9,1.4,8.5,0c0.6-0.3,1.2-0.2,1.7,0.2c2,1.7,3.2,4.2,3.2,6.9v1.5\r\n                                                    C42,36.4,41.3,37.1,40.5,37.1z M26.8,34.1H39c0-1.4-0.5-2.8-1.5-3.9c-2.9,1.2-6.3,1.2-9.3,0C27.3,31.2,26.8,32.6,26.8,34.1z\r\n                                                    M52.7,35.6c-0.2,0-0.4,0-0.6-0.1c-0.6-0.2-0.9-0.8-0.9-1.4v-4.5h-4.6c-0.8,0-1.5-0.7-1.5-1.5v-6c0-0.8,0.7-1.5,1.5-1.5h4.6V16\r\n                                                    c0-0.6,0.4-1.2,0.9-1.4c0.6-0.2,1.2-0.1,1.7,0.3l9.1,9.1c0.6,0.6,0.6,1.5,0,2.1l-9.1,9C53.5,35.4,53.1,35.6,52.7,35.6z M48.1,26.5\r\n                                                    h4.6c0.8,0,1.5,0.7,1.5,1.5v2.4l5.5-5.4l-5.5-5.4V22c0,0.8-0.7,1.5-1.5,1.5h-4.6V26.5z M42,46.1c0-0.8-0.7-1.5-1.5-1.5H23.7\r\n                                                    c-1.7,0-3-1.4-3-3V8.4c0-1.7,1.4-3,3-3h16.8c0.8,0,1.5-0.7,1.5-1.5c0-0.8-0.7-1.5-1.5-1.5H23.7c-3.4,0-6.1,2.7-6.1,6v33.2\r\n                                                    c0,3.3,2.7,6,6.1,6h16.8C41.3,47.6,42,47,42,46.1z\"/>\r\n                                                </svg>\r\n                                        </div>\r\n                                        <div class=\"textArea\">\r\n                                            <p>Check In</p>\r\n                                            <strong>1 PM</strong>\r\n                                        </div>\r\n                                    </div>\r\n\r\n                                    <div class=\"item\">\r\n                                        <div class=\"icon\">\r\n                                            <svg xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\" viewBox=\"15.5 0 50 50\" style=\"enable-background:new 15.5 0 50 50;\">\r\n                                                <path id=\"check_out\" d=\"M48,25c3.3,0,6-2.7,6-5.9c0-3.3-2.7-5.9-6-5.9s-6,2.7-6,5.9C42,22.3,44.7,25,48,25z M48,16.1\r\n                                                    c1.6,0,3,1.3,3,3c0,1.6-1.3,3-3,3c-1.6,0-3-1.3-3-3C45,17.5,46.3,16.1,48,16.1z M40.5,36.8h14.9c0.8,0,1.5-0.7,1.5-1.5v-1.5\r\n                                                    c0-2.6-1.1-5-3.1-6.7c-0.5-0.4-1.1-0.5-1.7-0.2c-2.6,1.3-5.8,1.3-8.3,0c-0.5-0.3-1.2-0.2-1.7,0.2c-2,1.7-3.1,4.2-3.1,6.7v1.5\r\n                                                    C39,36.2,39.7,36.8,40.5,36.8z M53.9,33.9H42c0-1.4,0.5-2.8,1.4-3.8c2.9,1.2,6.2,1.2,9.1,0C53.4,31.1,53.9,32.5,53.9,33.9L53.9,33.9\r\n                                                    z M28.5,35.4c0.2,0,0.4,0,0.6-0.1c0.6-0.2,0.9-0.8,0.9-1.4v-4.4h4.5c0.8,0,1.5-0.7,1.5-1.5V22c0-0.8-0.7-1.5-1.5-1.5H30v-4.4\r\n                                                    c0-0.6-0.4-1.1-0.9-1.4c-0.6-0.2-1.2-0.1-1.6,0.3l-9,8.9c-0.6,0.6-0.6,1.5,0,2.1l9,8.9C27.8,35.2,28.2,35.4,28.5,35.4L28.5,35.4z\r\n                                                    M33,26.5h-4.5c-0.8,0-1.5,0.7-1.5,1.5v2.3L21.7,25l5.4-5.3V22c0,0.8,0.7,1.5,1.5,1.5H33V26.5z M39,45.7c0-0.8,0.7-1.5,1.5-1.5h16.4\r\n                                                    c1.6,0,3-1.3,3-3V8.7c0-1.6-1.3-3-3-3H40.5c-0.8,0-1.5-0.7-1.5-1.5c0-0.8,0.7-1.5,1.5-1.5h16.4c3.3,0,6,2.7,6,5.9v32.5\r\n                                                    c0,3.3-2.7,5.9-6,5.9H40.5C39.7,47.2,39,46.5,39,45.7z\"/>\r\n                                            </svg>\r\n\r\n                                        </div>\r\n                                        <div class=\"textArea\">\r\n                                            <p>Check Out</p>\r\n                                            <strong>11 AM</strong>\r\n                                        </div>\r\n                                    </div>\r\n\r\n                                    <div class=\"item\">\r\n                                        <div class=\"icon\">\r\n                                        <svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"15.5 0 50 50\" style=\"enable-background:new 15.5 0 50 50;\">\r\n                                            <g id=\"guest\">\r\n                                                <path d=\"M40.3,23.2c1.5,0,3.1-0.5,4.3-1.3s2.3-2.1,2.9-3.5c0.6-1.4,0.7-3,0.4-4.5c-0.3-1.5-1-2.9-2.1-4c-1.1-1.1-2.5-1.8-4-2.1\r\n                                                    c-1.5-0.3-3.1-0.1-4.5,0.4c-1.4,0.6-2.6,1.6-3.5,2.9c-0.9,1.3-1.3,2.8-1.3,4.3c0,2.1,0.8,4.1,2.3,5.5\r\n                                                    C36.2,22.4,38.2,23.2,40.3,23.2z M40.3,10.8c0.9,0,1.8,0.3,2.6,0.8c0.8,0.5,1.4,1.2,1.7,2.1c0.4,0.9,0.4,1.8,0.3,2.7\r\n                                                    c-0.2,0.9-0.6,1.7-1.3,2.4c-0.7,0.7-1.5,1.1-2.4,1.3c-0.9,0.2-1.8,0.1-2.7-0.3c-0.9-0.4-1.6-0.9-2.1-1.7c-0.5-0.8-0.8-1.7-0.8-2.6\r\n                                                    c0-1.2,0.5-2.4,1.4-3.3C37.9,11.3,39.1,10.8,40.3,10.8z\"/>\r\n                                                <path d=\"M25.5,27.8c1.2,0,2.4-0.4,3.3-1c1-0.7,1.8-1.6,2.2-2.7c0.5-1.1,0.6-2.3,0.3-3.5c-0.2-1.2-0.8-2.2-1.6-3.1\r\n                                                    c-0.8-0.8-1.9-1.4-3.1-1.6c-1.2-0.2-2.4-0.1-3.5,0.3c-1.1,0.5-2,1.2-2.7,2.2c-0.7,1-1,2.2-1,3.3c0,1.6,0.6,3.1,1.8,4.3\r\n                                                    S23.9,27.8,25.5,27.8z M25.5,19c0.6,0,1.1,0.2,1.6,0.5c0.5,0.3,0.8,0.8,1,1.3c0.2,0.5,0.3,1.1,0.2,1.6c-0.1,0.6-0.4,1.1-0.8,1.5\r\n                                                    c-0.4,0.4-0.9,0.7-1.5,0.8c-0.6,0.1-1.1,0.1-1.6-0.2c-0.5-0.2-1-0.6-1.3-1c-0.3-0.5-0.5-1-0.5-1.6c0-0.8,0.3-1.5,0.8-2\r\n                                                    C24,19.3,24.8,19,25.5,19z\"/>\r\n                                                <path d=\"M55.1,27.8c1.2,0,2.4-0.4,3.3-1c1-0.7,1.8-1.6,2.2-2.7c0.5-1.1,0.6-2.3,0.3-3.5c-0.2-1.2-0.8-2.2-1.6-3.1\r\n                                                    c-0.8-0.8-1.9-1.4-3.1-1.6c-1.2-0.2-2.4-0.1-3.5,0.3c-1.1,0.5-2,1.2-2.7,2.2c-0.7,1-1,2.2-1,3.3c0,1.6,0.6,3.1,1.8,4.3\r\n                                                    S53.5,27.8,55.1,27.8z M55.1,19c0.6,0,1.1,0.2,1.6,0.5c0.5,0.3,0.8,0.8,1,1.3c0.2,0.5,0.3,1.1,0.2,1.6c-0.1,0.6-0.4,1.1-0.8,1.5\r\n                                                    c-0.4,0.4-0.9,0.7-1.5,0.8c-0.6,0.1-1.1,0.1-1.6-0.2c-0.5-0.2-1-0.6-1.3-1c-0.3-0.5-0.5-1-0.5-1.6c0-0.8,0.3-1.5,0.8-2\r\n                                                    C53.6,19.3,54.3,19,55.1,19z\"/>\r\n                                                <path d=\"M55.3,31c-1.4,0-2.8,0.4-4,1c-1.2-1.8-2.7-3.3-4.6-4.4c-1.9-1.1-4-1.6-6.2-1.7c-2.2,0-4.3,0.6-6.2,1.7\r\n                                                    c-1.9,1.1-3.5,2.6-4.6,4.4c-1.2-0.7-2.6-1-4-1c-2.5,0.1-4.8,1.2-6.5,3.1c-1.7,1.8-2.6,4.3-2.5,6.8c0,0.4,0.2,0.8,0.5,1.1\r\n                                                    c0.3,0.3,0.7,0.5,1.1,0.5s0.8-0.2,1.1-0.5c0.3-0.3,0.5-0.7,0.5-1.1c-0.1-1.7,0.4-3.3,1.5-4.5c1.1-1.2,2.6-2,4.3-2.1\r\n                                                    c0.9,0,1.7,0.2,2.5,0.7c-0.7,1.9-1.1,3.9-1.1,5.9c0,0.4,0.2,0.8,0.5,1.1c0.3,0.3,0.7,0.5,1.1,0.5c0.4,0,0.8-0.2,1.1-0.5\r\n                                                    c0.3-0.3,0.5-0.7,0.5-1.1c0-6.4,4.6-11.6,10.2-11.6c5.6,0,10.2,5.2,10.2,11.6c0,0.4,0.2,0.8,0.5,1.1c0.3,0.3,0.7,0.5,1.1,0.5\r\n                                                    c0.4,0,0.8-0.2,1.1-0.5c0.3-0.3,0.5-0.7,0.5-1.1c0-2-0.4-4-1.1-5.9c0.8-0.4,1.6-0.7,2.5-0.7c1.6,0.1,3.2,0.9,4.3,2.1\r\n                                                    c1.1,1.2,1.6,2.9,1.5,4.5c0,0.4,0.2,0.8,0.5,1.1c0.3,0.3,0.7,0.5,1.1,0.5c0.4,0,0.8-0.2,1.1-0.5c0.3-0.3,0.5-0.7,0.5-1.1\r\n                                                    c0.1-2.5-0.8-4.9-2.5-6.8C60.1,32.2,57.8,31.1,55.3,31z\"/>\r\n                                            </g>\r\n                                            </svg>\r\n\r\n                                        </div>\r\n                                        <div class=\"textArea\">\r\n                                            <p>Guest Visit</p>\r\n                                            <strong>10 AM - 8 PM</strong>\r\n                                        </div>\r\n                                    </div>\r\n\r\n                                    <div class=\"item\">\r\n                                        <div class=\"icon\">\r\n                                        <svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"15.5 0 50 50\" style=\"enable-background:new 15.5 0 50 50;\">\r\n                                            <g id=\"coffe\">\r\n                                                <path d=\"M58.4,18.2h-2.3c-0.1-0.9-0.6-1.7-1.3-2.2c-0.7-0.6-1.5-0.9-2.4-0.9H24.8c-1,0-1.9,0.4-2.6,1.1c-0.7,0.7-1.1,1.7-1.1,2.7\r\n                                                    v12.6c0,3.1,1.2,6.1,3.4,8.4c2.2,2.2,5.1,3.5,8.2,3.5h11.8c2.9,0,5.7-1.1,7.8-3.1c2.1-2,3.5-4.7,3.8-7.6h2.3c1,0,2-0.4,2.7-1.2\r\n                                                    c0.7-0.7,1.1-1.7,1.1-2.8v-6.5c0-1-0.4-2-1.1-2.8C60.4,18.6,59.4,18.2,58.4,18.2 M44.5,40.8H32.7c-2.4,0-4.8-1-6.5-2.7\r\n                                                    c-1.7-1.8-2.7-4.1-2.7-6.6V18.9c0-0.7,0.6-1.3,1.3-1.3h27.6c0.7,0,1.2,0.6,1.3,1.3v12.6c0,2.5-1,4.8-2.7,6.6\r\n                                                    C49.3,39.8,46.9,40.8,44.5,40.8 M59.8,28.7c0,0.4-0.1,0.7-0.4,1c-0.3,0.3-0.6,0.4-1,0.4h-2.3v-9.4h2.3c0.4,0,0.7,0.2,1,0.4\r\n                                                    c0.3,0.3,0.4,0.7,0.4,1V28.7z\"/>\r\n                                                <path d=\"M37.9,14.1c-0.6,0-1.2-0.4-1.3-1.1c-0.1-0.6,0.3-1.2,1-1.4c0.3-0.1,0.6-0.2,0.9-0.3c0.2-0.1,0.3-0.2,0.5-0.3\r\n                                                    c0.1-0.3,0.1-0.5,0-0.8c-0.2-0.4-0.4-0.8-0.7-1.2c-0.1-0.2-0.3-0.3-0.5-0.5c-0.6-0.6-1.1-1.3-1.4-2.1c-0.2-0.7-0.2-1.5,0-2.2\r\n                                                    c0.1-0.5,0.4-0.9,0.7-1.2c0.4-0.4,1-0.6,1.5-0.7c0.6-0.1,1.2,0.4,1.3,1C40,4,39.7,4.6,39,4.8h-0.2c0,0.1-0.1,0.1-0.1,0.2\r\n                                                    c-0.1,0.2-0.1,0.5,0,0.7c0.2,0.4,0.4,0.8,0.7,1.1c0.2,0.2,0.4,0.4,0.6,0.6c0.6,0.6,1,1.3,1.3,2.1c0.3,0.8,0.2,1.7-0.1,2.4\r\n                                                    c-0.3,0.8-1,1.4-1.7,1.7c-0.4,0.2-0.9,0.4-1.4,0.5C38,14.1,37.9,14.1,37.9,14.1\"/>\r\n                                                <path d=\"M30.9,14.1c-0.6,0-1.1-0.4-1.2-0.9c-0.1-0.3,0-0.7,0.1-1c0.2-0.3,0.5-0.5,0.8-0.6c0.3-0.1,0.6-0.2,0.9-0.3\r\n                                                    c0.2-0.1,0.3-0.2,0.4-0.3c0.1-0.3,0.1-0.5,0-0.8c-0.2-0.4-0.4-0.8-0.7-1.2c-0.1-0.2-0.3-0.3-0.4-0.5v0c-0.6-0.6-1.1-1.3-1.4-2.1\r\n                                                    c-0.2-0.7-0.2-1.5,0-2.2c0.1-0.5,0.4-0.9,0.8-1.2c0.4-0.4,0.9-0.6,1.5-0.7c0.7-0.1,1.3,0.4,1.4,1c0.1,0.7-0.3,1.3-1,1.4h-0.2\r\n                                                    c0,0-0.1,0.1-0.1,0.2c-0.1,0.2-0.1,0.5,0,0.7c0.2,0.4,0.5,0.7,0.8,1c0.2,0.2,0.4,0.4,0.6,0.6c0.5,0.6,1,1.3,1.2,2.1\r\n                                                    c0.3,0.8,0.2,1.7-0.1,2.4c-0.3,0.8-1,1.4-1.7,1.7c-0.4,0.2-0.9,0.4-1.4,0.5C31.1,14,31,14,30.9,14.1\"/>\r\n                                                <path d=\"M44.9,14.1c-0.6,0-1.1-0.4-1.2-0.9c-0.1-0.3,0-0.7,0.2-1c0.2-0.3,0.5-0.5,0.8-0.6c0.3-0.1,0.6-0.2,0.9-0.3\r\n                                                    c0.2-0.1,0.3-0.2,0.5-0.3c0.1-0.3,0.1-0.5,0-0.8c-0.1-0.5-0.4-0.9-0.7-1.2c-0.1-0.2-0.3-0.3-0.4-0.5c-0.6-0.6-1.1-1.3-1.4-2.1\r\n                                                    c-0.2-0.7-0.2-1.5,0-2.2c0.1-0.5,0.4-0.9,0.7-1.2c0.4-0.4,0.9-0.6,1.5-0.7c0.6-0.1,1.2,0.4,1.3,1c0.1,0.6-0.3,1.3-0.9,1.4h-0.2\r\n                                                    c0,0-0.1,0.1-0.1,0.2c-0.1,0.2-0.1,0.5,0,0.7c0.2,0.4,0.4,0.8,0.8,1c0.2,0.2,0.4,0.4,0.6,0.6c0.5,0.6,1,1.3,1.2,2.1\r\n                                                    c0.3,0.8,0.2,1.7-0.1,2.4c-0.3,0.8-1,1.4-1.7,1.7c-0.4,0.2-0.9,0.4-1.4,0.5c-0.1,0-0.2,0-0.3,0\"/>\r\n                                                <path d=\"M57.4,47.7H19.8c-0.6-0.1-1.1-0.6-1.1-1.3s0.5-1.2,1.1-1.3h37.5c0.3,0,0.7,0.1,0.9,0.3c0.3,0.2,0.4,0.6,0.4,0.9\r\n                                                    c0,0.4-0.1,0.7-0.4,0.9C58,47.6,57.7,47.7,57.4,47.7\"/>\r\n                                                <path d=\"M35.8,39.5c-3.4,0-6.1-1.1-7.9-3.2c-3.1-3.5-2.5-8.7-2.5-8.9c0.1-0.7,0.7-1.2,1.4-1.1c0.7,0.1,1.2,0.7,1.1,1.4\r\n                                                    c0,0.1-0.4,4.3,1.9,6.9c1.3,1.5,3.4,2.3,6.1,2.3c0.7,0,1.2,0.6,1.2,1.3C37,39,36.5,39.5,35.8,39.5\"/>\r\n                                            </g>\r\n                                        </svg>\r\n\r\n                                        </div>\r\n                                        <div class=\"textArea\">\r\n                                            <p>Cafe</p>\r\n                                            <strong>Not operational</strong>\r\n                                        </div>\r\n                                    </div>\r\n\r\n                                    <div class=\"item\">\r\n                                        <div class=\"icon\">\r\n                                            <svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"15.5 0 50 50\" style=\"enable-background:new 15.5 0 50 50;\">\r\n                                                <g>\r\n                                                    <path d=\"M21.6,35.9c0,0.8,0.6,1.4,1.4,1.4h35.2c0.7,0,1.4-0.6,1.4-1.4c0-9.5-6.8-16.4-17.6-17v-1.4h2.7c0.7,0,1.4-0.6,1.4-1.4\r\n                                                        c0-0.8-0.6-1.4-1.4-1.4h-8.1c-0.7,0-1.4,0.6-1.4,1.4c0,0.8,0.6,1.4,1.4,1.4h2.7v1.4C28.4,19.5,21.6,26.4,21.6,35.9z M56.7,34.5\r\n                                                        H24.3c0.6-7.6,6.7-13,16.2-13C50,21.6,56,26.9,56.7,34.5z\"/>\r\n                                                    <path d=\"M54.7,38.6H26.3c-5.4,0-7.4,2.5-7.4,8.2h0c0,0.8,0.6,1.4,1.4,1.4h40.6c0.7,0,1.4-0.6,1.4-1.4C62.1,41.1,60,38.6,54.7,38.6z\r\n                                                        M21.6,45.5c0.2-3.2,1.4-4.1,4.7-4.1h28.4c2.3,0,3.6,0.4,4.2,1.8c0.4,0.8,0.5,2.3,0.5,2.3H21.6z\"/>\r\n                                                    <path d=\"M57.6,15.8l4.1-3.4c0.6-0.5,0.7-1.3,0.2-1.9c-0.5-0.6-1.3-0.7-1.9-0.2l-4.1,3.4c-0.6,0.5-0.7,1.3-0.2,1.9\r\n                                                        C56.2,16.2,57,16.3,57.6,15.8z\"/>\r\n                                                    <path d=\"M23.4,15.8c0.6,0.5,1.4,0.4,1.9-0.2c0.5-0.6,0.4-1.4-0.2-1.9l-4.1-3.4c-0.6-0.5-1.4-0.4-1.9,0.2c-0.5,0.6-0.4,1.4,0.2,1.9\r\n                                                        L23.4,15.8z\"/>\r\n                                                    <path d=\"M40.5,9.3c0.7,0,1.4-0.6,1.4-1.4V3.2c0-0.8-0.6-1.4-1.4-1.4c-0.7,0-1.4,0.6-1.4,1.4V8C39.1,8.7,39.8,9.3,40.5,9.3z\"/>\r\n                                                </g>\r\n                                            </svg>\r\n\r\n                                        </div>\r\n                                        <div class=\"textArea\">\r\n                                            <p>Reception</p>\r\n                                            <strong>24 Hours</strong>\r\n                                        </div>\r\n                                    </div>\r\n\r\n                                    <div class=\"item\">\r\n                                        <div class=\"icon\">\r\n                                            <svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"15.5 0 50 50\" style=\"enable-background:new 15.5 0 50 50;\">\r\n                                                <path id=\"sofa\" d=\"M25,44.5c-0.4,0-0.8-0.2-1.1-0.5c-0.3-0.3-0.5-0.7-0.5-1.1v-2.3h-0.7c-1.7,0-3.1-0.6-4.2-1.7\r\n                                                    c-1.2-1.2-1.7-2.6-1.7-4.2V21.4c0-1.8,0.6-3.2,1.7-4.2c1.1-1,2.4-1.4,3.9-1.4v-4.6c0-1.7,0.5-3,1.6-4.1c1-1,2.4-1.6,4.1-1.6h25.1\r\n                                                    c1.7,0,3,0.5,4,1.6c1,1,1.5,2.4,1.5,4.1v4.6c1.5,0,2.8,0.5,3.9,1.4c1.1,1,1.7,2.4,1.7,4.2v13.2c0,1.7-0.6,3.1-1.7,4.2\r\n                                                    c-1.2,1.2-2.6,1.7-4.2,1.7h-0.7v2.3c0,0.4-0.2,0.8-0.5,1.1c-0.3,0.3-0.7,0.5-1.1,0.5c-0.4,0-0.8-0.2-1.1-0.5\r\n                                                    c-0.3-0.3-0.5-0.7-0.5-1.1v-2.3H26.6v2.3c0,0.4-0.2,0.8-0.5,1.1C25.8,44.3,25.4,44.5,25,44.5z M22.7,37.3h35.7\r\n                                                    c0.7,0,1.4-0.3,1.9-0.8c0.5-0.5,0.8-1.2,0.8-1.9V21.4c0-0.7-0.2-1.3-0.6-1.7c-0.4-0.4-1-0.6-1.7-0.6c-0.7,0-1.3,0.2-1.7,0.6\r\n                                                    c-0.4,0.4-0.6,1-0.6,1.7v9.5H24.7v-9.5c0-0.7-0.2-1.3-0.6-1.7c-0.4-0.4-1-0.6-1.7-0.6c-0.7,0-1.3,0.2-1.7,0.6\r\n                                                    c-0.4,0.4-0.6,1-0.6,1.7v13.2c0,0.7,0.3,1.4,0.8,1.9C21.3,37.1,21.9,37.3,22.7,37.3z M28,27.7H53v-6.3c0-1.1,0.3-2,0.8-2.8\r\n                                                    c0.5-0.7,1-1.3,1.6-1.8v-5.7c0-0.7-0.2-1.3-0.6-1.7c-0.4-0.4-1-0.6-1.7-0.6H28c-0.7,0-1.3,0.2-1.7,0.6c-0.4,0.4-0.6,1-0.6,1.7v5.7\r\n                                                    c0.6,0.4,1.1,1,1.6,1.8c0.5,0.7,0.8,1.7,0.8,2.8V27.7z\"/>\r\n                                            </svg>\r\n\r\n                                        </div>\r\n                                        <div class=\"textArea\">\r\n                                            <p>Common Area</p>\r\n                                            <strong>24 Hours</strong>\r\n                                        </div>\r\n                                    </div>\r\n\r\n\r\n                                </div>', 'information', 1, '2023-08-21 17:53:29'),
(2, 'c1f91', NULL, 'Health and Safety', '<p>Strictly mandatory to follow all Covid guidelines as mandated by GOI at all times during the stay. For more details, refer to our policies.</p>\r\n                                <p>Strictly mandatory to follow all Covid guidelines as mandated by GOI at all times during the stay. For more details, refer to our policies.</p>\r\n                                <p>Strictly mandatory to follow all Covid guidelines as mandated by GOI at all times during the stay. For more details, refer to our policies.</p>', 'information', 1, '2023-08-21 17:54:46'),
(3, 'c1f91', NULL, 'Guest Policy', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>', 'information', 1, '2023-08-21 18:02:35'),
(4, 'c1f91', NULL, 'FAQs', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>', 'information', 1, '2023-08-21 18:03:27'),
(5, 'c1f91', NULL, 'General Policies', '<ul>\r\n <li><span>1</span>Lorem 1</li>\r\n <li><span>2</span>Lorem 1</li>\r\n <li><span>3</span>Lorem 1</li>\r\n <li><span>4</span>Lorem 1</li>\r\n <li><span>5</span>Lorem 1</li>\r\n</ul>', 'policies', 1, '2023-08-21 18:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `propertylocation`
--

CREATE TABLE `propertylocation` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `district` varchar(250) DEFAULT NULL,
  `pincode` varchar(25) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `coordinate` varchar(50) DEFAULT NULL,
  `mapIfrem` varchar(500) DEFAULT NULL,
  `mapIfremStatus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `propertylocation`
--

INSERT INTO `propertylocation` (`id`, `hotelId`, `address`, `district`, `pincode`, `country`, `state`, `coordinate`, `mapIfrem`, `mapIfremStatus`) VALUES
(1, 'c1f91', 'Sonapur, Chandipur, Balasore, Odisha,\r\nPins - 7560252', '', '', '', '', '20.29147523727708, 85.85606276741946', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3742.215156968343!2d85.85349321123884!3d20.29135951261744!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a18ad6b3fbb91ef%3A0x2ec03d75e37d910e!2sRetrod!5e0!3m2!1sen!2sin!4v1692985305460!5m2!1sen!2sin\" width=\"100%\" height=\"100%\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 1),
(2, 'a941a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, '32073', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, '8ba91', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'fecba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 'e2b28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, '99937', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, '8d368', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, '980e1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 'd5850', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 'ac112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, '18785', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(13, '768e3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(14, 'd5f87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `propertyrateplan`
--

CREATE TABLE `propertyrateplan` (
  `id` int(11) NOT NULL,
  `srtcode` varchar(11) NOT NULL,
  `fullForm` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `propertyrateplan`
--

INSERT INTO `propertyrateplan` (`id`, `srtcode`, `fullForm`) VALUES
(1, 'EP', 'Room Only'),
(2, 'CP', 'Room With Breakfast'),
(3, 'MAP', 'Room With Breakfast Plus Lunch Or Dinner'),
(4, 'AP', 'All Included');

-- --------------------------------------------------------

--
-- Table structure for table `propertysetting`
--

CREATE TABLE `propertysetting` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `adultRestriction` varchar(250) DEFAULT NULL,
  `childRestriction` varchar(250) DEFAULT NULL,
  `maxRoomCapacity` int(11) DEFAULT NULL,
  `advancePay` float DEFAULT NULL,
  `pckupDropPrice` float DEFAULT NULL,
  `pckupDropCaption` text DEFAULT NULL,
  `PartialPaymentPrice` float DEFAULT NULL,
  `partialPaymentCaption` text DEFAULT NULL,
  `pckupDropStatus` int(11) DEFAULT NULL,
  `partialPaymentStatus` int(11) DEFAULT NULL,
  `payByRoom` int(11) DEFAULT NULL,
  `bookingCode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `propertysetting`
--

INSERT INTO `propertysetting` (`id`, `hotelId`, `adultRestriction`, `childRestriction`, `maxRoomCapacity`, `advancePay`, `pckupDropPrice`, `pckupDropCaption`, `PartialPaymentPrice`, `partialPaymentCaption`, `pckupDropStatus`, `partialPaymentStatus`, `payByRoom`, `bookingCode`) VALUES
(1, 'c1f91', NULL, 'Below 10 Yr', 0, 0, 0, '', 0, '', 0, 0, 0, 'arpita'),
(2, 'a941a', NULL, NULL, 0, 0, 0, '', 0, '', 0, 0, 0, ''),
(3, '32073', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '8ba91', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'fecba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'e2b28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '99937', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '8d368', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '980e1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'd5850', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'ac112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '18785', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '768e3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'd5f87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_pg`
--

CREATE TABLE `property_pg` (
  `id` int(11) NOT NULL,
  `hid` varchar(11) NOT NULL,
  `type` varchar(11) NOT NULL,
  `paymentGetway` int(11) NOT NULL,
  `keyId` varchar(250) NOT NULL,
  `keySecret` varchar(250) NOT NULL,
  `env` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_pg`
--

INSERT INTO `property_pg` (`id`, `hid`, `type`, `paymentGetway`, `keyId`, `keySecret`, `env`, `status`, `addOn`) VALUES
(1, 'c1f91', 'hotel', 1, '2PBP7IABZ2', 'DAH88E3UWQ', 'test', 1, '2023-08-10 19:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `property_seo`
--

CREATE TABLE `property_seo` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(50) NOT NULL,
  `beTitle` varchar(60) NOT NULL,
  `beMetaDesc` varchar(160) NOT NULL,
  `keywords` varchar(500) NOT NULL,
  `chartBoot` text NOT NULL,
  `googleAnalytics` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `property_term`
--

CREATE TABLE `property_term` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `policy` text DEFAULT NULL,
  `cancel` text DEFAULT NULL,
  `refund` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property_term`
--

INSERT INTO `property_term` (`id`, `hotelId`, `policy`, `cancel`, `refund`) VALUES
(1, 'c1f91', NULL, NULL, NULL),
(2, 'a941a', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quickpay`
--

CREATE TABLE `quickpay` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `orderId` varchar(250) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `room` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `nOfRoom` int(11) NOT NULL DEFAULT 1,
  `roomPrice` float NOT NULL,
  `qickPayNote` text NOT NULL,
  `totalAmount` float NOT NULL DEFAULT 0,
  `amount` float NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `paymentId` varchar(250) DEFAULT NULL,
  `paymentStatus` varchar(250) NOT NULL,
  `addBy` text NOT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_list`
--

CREATE TABLE `report_list` (
  `id` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `head` text DEFAULT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_list`
--

INSERT INTO `report_list` (`id`, `typeId`, `name`, `head`, `addOn`, `deleteRec`) VALUES
(1, 1, 'Arrival List', 'Res.No,Guest,Room,Rate(Rs),Arrival,Departure,Pax,Company,Res.Type,User', '2023-04-01 09:26:17', 1),
(2, 1, 'Departure List', 'Res.No,Guest,Room,Rate(Rs),Arrival,Departure,Pax,Company,Res.Type,User', '2023-04-01 09:32:13', 1),
(3, 1, 'Cancelled Reservation', 'Res.No,Guest,Room,Rate(Rs),Arrival,Departure,Pax,Company,Res.Type,User', '2023-04-01 09:32:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE `report_type` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_type`
--

INSERT INTO `report_type` (`id`, `name`) VALUES
(1, 'Reservation Report'),
(2, 'Front Office Report'),
(3, 'Back Office Report'),
(4, 'Audit Report'),
(5, 'Statistical Report'),
(6, 'Graphs and Charts');

-- --------------------------------------------------------

--
-- Table structure for table `reservationtype`
--

CREATE TABLE `reservationtype` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservationtype`
--

INSERT INTO `reservationtype` (`id`, `name`, `addOn`) VALUES
(1, 'Confirm Booking', '2022-06-06 21:51:27'),
(2, 'Unconfirmed Booking Inquiry', '2022-06-06 21:51:27'),
(3, 'Online Failed Booking', '2022-06-06 21:51:49'),
(4, 'Hold Confirm Booking', '2022-06-06 21:51:49'),
(5, 'Hold Unconfirm Booking', '2022-06-06 21:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `minDay` int(11) NOT NULL DEFAULT 1,
  `header` varchar(250) NOT NULL,
  `sName` varchar(150) NOT NULL,
  `bedtype` varchar(250) NOT NULL,
  `totalroom` int(11) NOT NULL,
  `roomcapacity` int(11) NOT NULL,
  `description` text NOT NULL,
  `noAdult` int(11) NOT NULL,
  `noChild` int(11) NOT NULL,
  `add_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `mrp` float NOT NULL,
  `roomArea` varchar(150) DEFAULT NULL,
  `noBed` varchar(150) DEFAULT NULL,
  `noBathroom` varchar(150) DEFAULT NULL,
  `faceId` int(11) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `booking` int(11) NOT NULL DEFAULT 0,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addBy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `hotelId`, `slug`, `minDay`, `header`, `sName`, `bedtype`, `totalroom`, `roomcapacity`, `description`, `noAdult`, `noChild`, `add_on`, `status`, `mrp`, `roomArea`, `noBed`, `noBathroom`, `faceId`, `view`, `booking`, `deleteRec`, `addBy`) VALUES
(1, 'c1f91', 'standar-room', 2, 'Standar Room', '', 'King', 2, 3, '', 2, 0, '2023-04-02 08:02:52', 1, 3000, NULL, NULL, NULL, 0, 0, 0, 1, ''),
(2, 'c1f91', 'executive-room', 1, 'Executive Room', '', 'King', 0, 3, '', 2, 0, '2023-04-02 08:04:01', 1, 4500, NULL, NULL, NULL, 0, 0, 0, 1, ''),
(3, 'a941a', 'executive-room', 1, 'Executive Room', '', 'King', 0, 3, '', 2, 0, '2023-04-02 08:08:06', 1, 3000, NULL, NULL, NULL, 0, 0, 0, 1, ''),
(4, 'a941a', 'classic-deluxe', 1, 'Classic Deluxe', '', 'King', 0, 3, '', 2, 1, '2023-04-02 08:08:50', 1, 3000, NULL, NULL, NULL, 0, 0, 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `roomfeature`
--

CREATE TABLE `roomfeature` (
  `id` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `featureId` int(11) NOT NULL,
  `value` varchar(250) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomfeature`
--

INSERT INTO `roomfeature` (`id`, `roomId`, `featureId`, `value`, `addOn`) VALUES
(1, 1, 1, '1', '2023-08-19 13:03:37');

-- --------------------------------------------------------

--
-- Table structure for table `roomnumber`
--

CREATE TABLE `roomnumber` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `roomNo` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `addBy` text NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp(),
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomnumber`
--

INSERT INTO `roomnumber` (`id`, `hotelId`, `roomNo`, `roomId`, `status`, `addBy`, `addOn`, `deleteRec`) VALUES
(1, 'c1f91', 101, 1, 1, '', '2023-04-02 20:02:53', 1),
(2, 'c1f91', 102, 1, 1, '', '2023-04-02 20:02:53', 1),
(3, 'c1f91', 103, 1, 1, '', '2023-04-02 20:02:53', 1),
(4, 'c1f91', 201, 2, 1, '', '2023-04-02 20:04:01', 1),
(5, 'c1f91', 202, 2, 1, '', '2023-04-02 20:04:02', 1),
(6, 'c1f91', 203, 2, 1, '', '2023-04-02 20:04:02', 1),
(7, 'a941a', 101, 3, 1, '', '2023-04-02 20:08:06', 1),
(8, 'a941a', 102, 3, 1, '', '2023-04-02 20:08:06', 1),
(9, 'a941a', 103, 3, 1, '', '2023-04-02 20:08:06', 1),
(10, 'a941a', 104, 3, 1, '', '2023-04-02 20:08:06', 1),
(11, 'a941a', 105, 3, 1, '', '2023-04-02 20:08:07', 1),
(12, 'a941a', 201, 4, 1, '', '2023-04-02 20:08:50', 1),
(13, 'a941a', 202, 4, 1, '', '2023-04-02 20:08:50', 1),
(14, 'a941a', 203, 4, 1, '', '2023-04-02 20:08:50', 1),
(15, 'a941a', 204, 4, 1, '', '2023-04-02 20:08:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roomratetype`
--

CREATE TABLE `roomratetype` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `singlePrice` float NOT NULL,
  `doublePrice` float NOT NULL DEFAULT 0,
  `extra_adult` float NOT NULL,
  `extra_child` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomratetype`
--

INSERT INTO `roomratetype` (`id`, `room_id`, `title`, `singlePrice`, `doublePrice`, `extra_adult`, `extra_child`, `status`) VALUES
(1, 1, '2', 2500, 2800, 150, 32, 1),
(2, 2, '1', 3800, 4000, 150, 20, 1),
(3, 3, '1', 2500, 2800, 150, 32, 1),
(4, 4, '1', 2500, 2800, 150, 32, 1),
(5, 1, '3', 2800, 3000, 150, 32, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roomstatus`
--

CREATE TABLE `roomstatus` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `color` varchar(150) NOT NULL,
  `bg` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomstatus`
--

INSERT INTO `roomstatus` (`id`, `name`, `color`, `bg`) VALUES
(1, 'clean', '#fff', '#7928ca'),
(2, 'Book', '#fff', '#008000'),
(3, 'Dirty', '#fff', '#ff8100'),
(4, 'Under construction', '#fff', '#ea0606');

-- --------------------------------------------------------

--
-- Table structure for table `room_amenities`
--

CREATE TABLE `room_amenities` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `amenitie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_amenities`
--

INSERT INTO `room_amenities` (`id`, `room_id`, `amenitie_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 3),
(4, 4, 3),
(5, 1, 1),
(6, 1, 3),
(7, 1, 4),
(8, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `room_gst`
--

CREATE TABLE `room_gst` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(50) NOT NULL,
  `price` varchar(150) NOT NULL,
  `gst` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_gst`
--

INSERT INTO `room_gst` (`id`, `hotelId`, `price`, `gst`) VALUES
(1, 'c1f91', '0-999', 0),
(2, 'c1f91', '999-4999', 12);

-- --------------------------------------------------------

--
-- Table structure for table `room_img`
--

CREATE TABLE `room_img` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_img`
--

INSERT INTO `room_img` (`id`, `room_id`, `image`) VALUES
(1, 1, '620012.JPG'),
(2, 2, '329880.JPG'),
(3, 3, '540744.JPG'),
(4, 4, '643784.JPG');

-- --------------------------------------------------------

--
-- Table structure for table `sales_type_list`
--

CREATE TABLE `sales_type_list` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_type_list`
--

INSERT INTO `sales_type_list` (`id`, `name`, `addOn`) VALUES
(1, 'Room Sales', '2023-03-27 15:35:24'),
(2, 'Direct Room Sales', '2023-03-27 15:36:02'),
(3, 'Cancellation Sales', '2023-03-27 15:36:14');

-- --------------------------------------------------------

--
-- Table structure for table `superadmin`
--

CREATE TABLE `superadmin` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `designation` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `superadmin`
--

INSERT INTO `superadmin` (`id`, `name`, `username`, `password`, `designation`, `image`, `status`, `addOn`) VALUES
(1, 'Avinab Giri', 'avi', '12345', 'Head Of Technology', 'avi.jpg', 1, '2022-06-01 13:25:25'),
(2, 'Rupa khilar', 'rupa', '12345', 'Associate software engineer', '', 1, '2023-01-19 00:45:01'),
(3, 'Nitu pradhan', 'nitu', '12345', 'Associate software engineer', '', 1, '2023-01-19 00:45:01'),
(4, 'Pravat panda', 'pravat', '12345', 'Founnder', '', 1, '2023-01-19 00:45:37'),
(5, 'Archana Sahoo', 'archana', '12345', 'Inside sales', '', 1, '2023-01-19 01:56:02'),
(6, 'Sandya maam', 'sandya', '12345', 'Operation head', '', 1, '2023-01-19 01:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `system_rp`
--

CREATE TABLE `system_rp` (
  `id` int(11) NOT NULL,
  `shortCut` varchar(10) NOT NULL,
  `fullName` varchar(250) NOT NULL,
  `clr` varchar(50) NOT NULL,
  `bg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_rp`
--

INSERT INTO `system_rp` (`id`, `shortCut`, `fullName`, `clr`, `bg`) VALUES
(1, 'EP', 'Only Room', '', ''),
(2, 'CP', 'Room With Breakfast', '', ''),
(3, 'MAP', 'MAP', '', ''),
(4, 'AP', 'AP', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_booking_attr`
--

CREATE TABLE `sys_booking_attr` (
  `id` int(11) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `str` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `formName` varchar(250) NOT NULL,
  `summary` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_booking_attr`
--

INSERT INTO `sys_booking_attr` (`id`, `type`, `str`, `name`, `formName`, `summary`) VALUES
(1, NULL, 'advancePay', 'Advance Pay', '', 0),
(2, 'f', 'pckupDrop', 'Pickup And Drop', 'bookingExtra', 1),
(3, 'p', 'partialPayment', 'Partial Payment', 'bookingAttribute', 1),
(4, NULL, 'payByRoom', 'Pay By Room', 'bookingAttribute', 1),
(5, NULL, 'payAtHotel', 'Pay At Hotel', 'bookingAttribute', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sys_coupon_type`
--

CREATE TABLE `sys_coupon_type` (
  `id` int(11) NOT NULL,
  `icon` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_coupon_type`
--

INSERT INTO `sys_coupon_type` (`id`, `icon`, `name`) VALUES
(1, '', 'Coupons'),
(2, '', 'Offers'),
(3, '', 'Counter'),
(4, '', 'Flash Notification');

-- --------------------------------------------------------

--
-- Table structure for table `sys_currency`
--

CREATE TABLE `sys_currency` (
  `id` int(11) NOT NULL,
  `country` varchar(150) NOT NULL,
  `locales` varchar(50) NOT NULL,
  `shortCode` varchar(150) NOT NULL,
  `valueInRs` varchar(150) NOT NULL,
  `img` varchar(250) NOT NULL,
  `icon` varchar(250) NOT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_currency`
--

INSERT INTO `sys_currency` (`id`, `country`, `locales`, `shortCode`, `valueInRs`, `img`, `icon`, `addOn`) VALUES
(1, 'India', 'en-IN', 'INR', '1', 'india.png', '<i class=\"fas fa-rupee-sign\"></i>', '2023-08-15 19:56:33'),
(2, 'United States', 'en-Us', 'USD', '0.012', 'us.png', '<i class=\"fas fa-dollar-sign\"></i>', '2023-08-15 19:56:33'),
(3, 'Euro', 'en-DE', 'EUR', '0.011', 'euro.png', '<i class=\"fas fa-euro-sign\"></i>', '2023-08-15 20:06:22'),
(4, 'British', 'en-GB', 'GBP', '0.0094', 'british.png', '<i class=\"fas fa-pound-sign\"></i>', '2023-08-15 20:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `sys_feature`
--

CREATE TABLE `sys_feature` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `icon` varchar(250) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_feature`
--

INSERT INTO `sys_feature` (`id`, `name`, `icon`, `addOn`) VALUES
(1, 'Bathroom', '', '2023-08-19 13:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `sys_payment_getway`
--

CREATE TABLE `sys_payment_getway` (
  `id` int(11) NOT NULL,
  `acc_key` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_payment_getway`
--

INSERT INTO `sys_payment_getway` (`id`, `acc_key`, `name`, `logo`, `addOn`) VALUES
(1, 'easebuzz', 'easebuzz', '', '2023-08-10 19:04:18'),
(2, 'razorpay', 'razorpay', NULL, '2023-08-10 19:05:01'),
(3, 'payu', 'payu', NULL, '2023-08-10 19:05:01'),
(4, 'ccavenue', 'CCAvenue', NULL, '2023-08-10 19:05:37');

-- --------------------------------------------------------

--
-- Table structure for table `sys_sociallink`
--

CREATE TABLE `sys_sociallink` (
  `id` int(11) NOT NULL,
  `accesKey` varchar(120) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` text NOT NULL,
  `color` varchar(250) DEFAULT NULL,
  `bgClr` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_sociallink`
--

INSERT INTO `sys_sociallink` (`id`, `accesKey`, `name`, `icon`, `color`, `bgClr`) VALUES
(1, 'fb', 'Facebook', '<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"0 0 50 50\" style=\"enable-background:new 0 0 50 50;\">\n	<g id=\"facebook\"><path d=\"M33.6,0.8C34.4,0.9,35.2,1,36,1c0.5,0,1,0.1,1.5,0.1c0,2.6,0,5.1,0,7.7c-0.2,0-0.3,0-0.5,0\n			c-1.6,0-3.3,0-4.9,0.1c-2.1,0.1-3.2,1.2-3.3,3.3c-0.1,2.1,0,4.2,0,6.3c2.8,0,5.6,0,8.5,0c-0.4,2.9-0.7,5.8-1.1,8.7\n			c-2.5,0-4.9,0-7.4,0c0,7.4,0,14.7,0,22c-3,0-5.9,0-8.9,0c0-7.3,0-14.7,0-22c-2.5,0-4.9,0-7.4,0c0-2.9,0-5.7,0-8.6\n			c2.4,0,4.9,0,7.4,0c0-0.2,0-0.4,0-0.6c0-2.3,0-4.5,0.1-6.8c0.1-3.1,1.1-5.8,3.5-7.8c1.6-1.4,3.6-2.1,5.7-2.3c0.2,0,0.3-0.1,0.5-0.1\n			C31,0.8,32.3,0.8,33.6,0.8z\"/></g>\n</svg>', '#1976d2', '#c8def4'),
(2, 'in', 'Instagram', '<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"0 0 50 50\" style=\"enable-background:new 0 0 50 50;\"> <g id=\"instagram\"><path d=\"M1.6,37.9c0-8.6,0-17.2,0-25.8c0.1-0.3,0.1-0.5,0.2-0.8C2.6,7.1,5,4.1,9,2.4c1-0.4,2.1-0.6,3.1-0.8 		c8.6,0,17.2,0,25.8,0c0.4,0.1,0.7,0.1,1.1,0.2c4.7,1.1,7.7,3.9,9.1,8.6c0.2,0.6,0.3,1.2,0.4,1.8c0,8.6,0,17.2,0,25.8 		c-0.1,0.3-0.1,0.5-0.2,0.8C47.4,43,45,45.9,41,47.6c-1,0.4-2.1,0.6-3.1,0.8c-8.6,0-17.2,0-25.8,0c-0.4-0.1-0.7-0.1-1.1-0.2 		c-4.7-1.1-7.7-4-9-8.6C1.8,39,1.7,38.5,1.6,37.9z M25,44.5c4,0,8,0,11.9,0c0.8,0,1.6-0.2,2.3-0.4c3.2-1.1,5.3-4,5.3-7.4 		c0-7.8,0-15.5,0-23.3c0-0.4,0-0.8-0.1-1.2C44,8.6,40.6,5.6,37,5.5c-8,0-16,0-24.1,0c-0.4,0-0.8,0.1-1.2,0.1C8,6.5,5.5,9.6,5.5,13.4 		c0,7.7,0,15.5,0,23.2c0,0.4,0,0.8,0.1,1.2c0.5,3.6,3.7,6.6,7.4,6.6C17,44.5,21,44.5,25,44.5z\"/><path d=\"M25,13.3c6.5,0,11.7,5.3,11.7,11.8c0,6.5-5.3,11.7-11.7,11.7c-6.5,0-11.7-5.3-11.7-11.8 		C13.3,18.5,18.6,13.3,25,13.3z M25,17.2c-4.3,0-7.8,3.5-7.8,7.8c0,4.3,3.5,7.8,7.8,7.8c4.3,0,7.8-3.5,7.8-7.8 		C32.8,20.7,29.3,17.2,25,17.2z\"/><path d=\"M37.7,15.3c-1.6,0-2.9-1.3-2.9-2.9c0-1.6,1.4-3,3-3c1.6,0,2.9,1.4,2.9,3C40.6,13.9,39.3,15.3,37.7,15.3z\"/></g> </svg>', '#c0318c', '#f9ddea'),
(3, '', 'Twitter', '<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"0 0 50 50\" style=\"enable-background:new 0 0 50 50;\"> <g id=\"twitter\"><path d=\"M0.3,40.5c5.6,0.5,10.5-0.8,14.8-4.1c-2.5-0.2-4.7-1.1-6.5-2.8c-1.3-1.2-2.3-2.7-2.7-4.3c1.4,0,2.8,0,4.2,0 		c0-0.1,0-0.1,0-0.2C5.3,27.6,2.7,24.2,2.3,19c1.5,0.7,2.9,1.2,4.5,1.3c-2.1-1.7-3.6-3.7-4.2-6.2c-0.6-2.6-0.1-5,1.2-7.3 		c5.5,6.4,12.3,10,20.8,10.6c-0.4-1.7-0.3-3.2,0.1-4.8c1.9-7.4,11.2-10.1,16.8-4.9c0.4,0.4,0.7,0.4,1.2,0.3c1.9-0.5,3.8-1.2,5.7-2.3 		c-0.8,2.4-2.2,4.2-4.1,5.6c0.6-0.1,1.2-0.2,1.8-0.4c0.6-0.1,1.2-0.3,1.8-0.5c0.6-0.2,1.2-0.4,1.7-0.6c0,0,0.1,0.1,0.1,0.1 		c-0.6,0.7-1.1,1.5-1.8,2.2C47,13,45.9,13.9,45,14.8c-0.2,0.2-0.3,0.5-0.3,0.7c0.4,11.3-6.5,23.6-18.6,28c-4.1,1.5-8.3,2-12.6,1.6 		c-4.6-0.4-8.8-1.8-12.7-4.2C0.7,40.8,0.6,40.7,0.3,40.5z\"/></g> </svg>', '#2daae1', '#d9f0fa'),
(4, '', 'LinkedIn', '<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"0 0 50 50\" style=\"enable-background:new 0 0 50 50;\"> <g id=\"linkedin\"><path d=\"M49.4,49.3c-3.4,0-6.7,0-10.1,0c0-0.3,0-0.5,0-0.7c0-5,0-9.9,0-14.9c0-1.7-0.1-3.3-0.4-5 		c-0.6-3-2.7-4.1-5.6-3.8c-3,0.3-4.7,2-5,5.2c-0.1,1.2-0.2,2.3-0.2,3.5c0,5,0,10,0,15c0,0.2,0,0.5,0,0.7c-3.4,0-6.7,0-10.1,0 		c0-10.8,0-21.6,0-32.5c3.2,0,6.4,0,9.6,0c0,1.4,0,2.9,0,4.4c0.2-0.2,0.2-0.3,0.3-0.4c1.9-3,4.7-4.5,8.1-4.8c2.4-0.2,4.8,0,7.1,0.9 		c3,1.3,4.6,3.6,5.5,6.7c0.6,2.1,0.8,4.2,0.8,6.3c0,6.3,0,12.6,0,18.8C49.4,49,49.4,49.1,49.4,49.3z\"/><path d=\"M1.5,49.3c0-10.8,0-21.6,0-32.5c3.4,0,6.7,0,10,0c0,10.8,0,21.6,0,32.5C8.2,49.3,4.8,49.3,1.5,49.3z\"/><path d=\"M6.5,12.4c-3.2,0-5.9-2.7-5.9-5.9c0-3.2,2.7-5.8,5.9-5.8c3.2,0,5.9,2.7,5.8,5.9C12.3,9.8,9.7,12.4,6.5,12.4 		z\"/></g> </svg>', NULL, NULL),
(5, '', 'Youtube', '<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"0 0 50 50\" style=\"enable-background:new 0 0 50 50;\"> <g id=\"youtube\"><path d=\"M0.7,20.1c0.1-0.9,0.1-1.9,0.2-2.8c0.1-2,0.3-4,1.2-5.9c1.1-2.4,3-3.9,5.6-4.2c2.4-0.3,4.7-0.4,7.1-0.5 		c5.4-0.1,10.9-0.1,16.3-0.1c3.3,0,6.5,0.2,9.8,0.4c2.1,0.1,4,0.7,5.6,2.3c1.1,1.2,1.8,2.6,2,4.1c0.3,1.7,0.5,3.5,0.6,5.2 		c0.1,3.4,0.1,6.8,0.1,10.2c0,2.2-0.2,4.4-0.5,6.6c-0.2,1.6-0.7,3.2-1.8,4.6c-1.2,1.5-2.8,2.5-4.7,2.6c-2.7,0.2-5.4,0.4-8.1,0.5 		c-2.2,0.1-4.5,0.2-6.7,0.2c-4,0-8-0.1-12-0.2c-2.1-0.1-4.3-0.2-6.4-0.3c-1.6-0.1-3.1-0.4-4.5-1.3c-1.8-1.2-2.6-2.9-3.1-5 		C1,34.6,1,32.7,0.8,30.7c0-0.3-0.1-0.6-0.1-0.9C0.7,26.6,0.7,23.4,0.7,20.1z M24.1,40.5C24.1,40.5,24.1,40.5,24.1,40.5 		c0.6,0,1.3,0,1.9,0c4.6-0.1,9.2-0.3,13.8-0.4c1,0,2.1-0.1,3.1-0.4c1.6-0.5,2.4-1.8,2.8-3.3c0.6-2,0.6-4,0.6-6 		c0.2-4.2,0.2-8.3-0.1-12.5c-0.1-1.4-0.3-2.8-0.6-4.2c-0.4-2.1-1.8-3.3-3.9-3.5c-1.8-0.2-3.5-0.3-5.3-0.4c-2.9-0.1-5.9-0.2-8.8-0.2 		C21.4,9.4,15.1,9.6,8.8,10c-2.4,0.2-3.9,1.4-4.5,3.7c-0.5,1.9-0.6,3.9-0.6,5.9c-0.2,4.7-0.2,9.3,0.2,14c0.1,1.3,0.3,2.6,0.9,3.9 		c0.6,1.4,1.9,2.1,3.4,2.3c2.1,0.2,4.2,0.4,6.4,0.5C17.7,40.4,20.9,40.4,24.1,40.5z\"/><path d=\"M18.8,24.5c0-1.9,0.1-3.7,0-5.6c-0.1-1.6,1.5-2.7,3.1-1.9c3.4,1.9,6.9,3.8,10.4,5.7c0.7,0.4,1.2,1,1.2,1.8 		c0,0.8-0.5,1.4-1.2,1.8c-3.5,1.9-7,3.8-10.5,5.6c-1.5,0.8-3-0.1-3-1.8C18.8,28.2,18.8,26.3,18.8,24.5z M21.7,28.8 		c2.7-1.4,5.3-2.8,8-4.3c-2.7-1.5-5.3-2.9-8-4.4C21.7,23.1,21.7,25.9,21.7,28.8z\"/></g> </svg>', NULL, NULL),
(6, '', 'Pinterest', '<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"0 0 50 50\" style=\"enable-background:new 0 0 50 50;\"> <g id=\"pintrest\"><path id=\"XMLID_26_\" d=\"M14.3,49c-0.2-0.9-0.3-1.8-0.5-2.7c-0.1-0.9-0.1-1.8-0.2-2.7c-0.2-2.5,0.2-4.9,0.8-7.3c1-4,2-8.1,3-12.2 		c0.1-0.2,0-0.6-0.1-0.8c-0.9-2.5-1.1-5.1,0.1-7.6c0.8-1.7,2.1-2.8,3.9-3.3c2.5-0.6,4.6,1,4.7,3.6c0.1,1.3-0.2,2.6-0.6,3.9 		c-0.6,2-1.3,4.1-1.8,6.1c-0.8,2.7,1.2,5,3.8,5.3c3.1,0.3,5.5-1.2,7.3-3.6c1.6-2.1,2.4-4.4,2.7-7c0.3-2.5,0.1-4.9-0.8-7.3 		c-1.4-3.4-3.8-5.6-7.4-6.6c-3.7-1-7.3-0.9-10.8,0.8c-4.3,2-6.7,5.5-7.3,10.2c-0.3,2.8,0.3,5.4,2.2,7.6c0.2,0.3,0.3,0.6,0.2,1 		c-0.3,1-0.5,2-0.8,3c-0.2,0.8-0.5,0.9-1.2,0.5c-1.8-0.9-3.1-2.3-4.1-4C4.8,21,4.9,16,7.3,11.1C9.6,6.3,13.5,3.5,18.5,2 		c0.9-0.3,1.8-0.5,2.8-0.6c0.5-0.1,1-0.1,1.4-0.2c0.4,0,0.9-0.1,1.3-0.1c0.8,0,1.5,0,2.3,0c2.2,0,4.5,0.5,6.6,1.2 		c1.6,0.6,3.1,1.4,4.5,2.3c4.2,3,6.6,7,7,12.2c0.3,4.1-0.6,8-2.8,11.6c-1.8,3-4.3,5.3-7.6,6.6c-2.3,0.9-4.6,1.3-7,0.9 		c-2.2-0.3-4-1.2-5.4-3.1c-0.3,1.2-0.7,2.4-1,3.5c-0.8,3.2-1.8,6.3-3.6,9c-0.8,1.2-1.6,2.5-2.4,3.7C14.6,49,14.5,49,14.3,49z\"/></g> </svg>', NULL, NULL),
(7, '', 'WhatsApp', '<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"0 0 50 50\" style=\"enable-background:new 0 0 50 50;\" ><g ><path id=\"XMLID_17_\" d=\"M1.8,48.3c0-0.2,0.1-0.3,0.1-0.4c1-3.7,2-7.3,3-11C5,36.5,5,36.2,4.8,35.8c-1.5-2.7-2.4-5.6-2.7-8.6 		C1.1,17.4,6.3,8.2,15,4c3.3-1.6,6.9-2.4,10.6-2.3c8.8,0.4,15.3,4.4,19.7,12c1.5,2.7,2.4,5.6,2.7,8.6c0.7,7.7-1.8,14.2-7.4,19.5 		c-3.4,3.2-7.5,5.1-12.2,5.8c-5,0.7-9.7-0.1-14.2-2.4c-0.2-0.1-0.4-0.1-0.6,0c-3.8,1-7.5,2-11.3,2.9C2.2,48.2,2.1,48.3,1.8,48.3z 		 M7.4,42.8c0.2-0.1,0.4-0.1,0.5-0.1c2.1-0.5,4.1-1.1,6.2-1.6c0.4-0.1,0.7-0.1,1,0.1c2.7,1.6,5.6,2.6,8.7,2.8 		c3.6,0.2,7-0.5,10.2-2.2c7.3-3.9,11.3-11.8,10.1-19.9c-0.7-4.4-2.6-8.1-5.9-11.1c-4.8-4.5-10.6-6.1-17-4.8c-5,1-9,3.7-11.9,8 		c-2.8,4.1-3.9,8.7-3.1,13.7c0.4,2.8,1.4,5.3,2.9,7.6c0.2,0.3,0.2,0.6,0.1,0.9C8.6,38.4,8,40.5,7.4,42.8z\"/><path d=\"M13.3,19.6c0-1.9,0.8-3.6,2.2-4.9c0.4-0.4,0.9-0.6,1.5-0.6c0.5,0,0.9,0,1.4,0.1c0.2,0,0.5,0.2,0.6,0.4 		c0.2,0.2,0.3,0.5,0.4,0.8c0.6,1.4,1.1,2.7,1.7,4.1c0.2,0.5,0.2,0.9-0.1,1.3c-0.5,0.6-0.9,1.2-1.4,1.8c-0.4,0.5-0.4,0.7-0.1,1.2 		c1.9,3.1,4.5,5.4,7.9,6.8c0.5,0.2,0.8,0.1,1.2-0.3c0.6-0.7,1.1-1.4,1.7-2.1c0.4-0.5,0.7-0.7,1.3-0.4c1.6,0.7,3.2,1.5,4.8,2.3 		c0.3,0.1,0.4,0.4,0.4,0.7c0,1.7-0.5,3.2-2.1,4.2c-1.9,1.2-3.9,1.3-6,0.7c-5.5-1.5-9.5-5-12.8-9.5c-1.1-1.5-2-3-2.5-4.8 		C13.4,20.7,13.4,20.2,13.3,19.6z\"/></g></svg>', '#4de35d', '#c7f2ca');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'Chief Cashier'),
(3, 'Front Office Clerk'),
(4, 'Front Office Manager'),
(5, 'General Manager'),
(6, 'House Keeping'),
(7, 'Night Auditor'),
(8, 'Reservation Clerk'),
(9, 'Reservation Manager');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `visitor_ip` varchar(250) NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wb_basic`
--

CREATE TABLE `wb_basic` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `voucherIdGen` varchar(25) DEFAULT NULL,
  `qpVoucherIdGen` varchar(25) DEFAULT NULL,
  `chartBoot` varchar(250) DEFAULT NULL,
  `fb_ifrm` text DEFAULT NULL,
  `wbAna` varchar(250) DEFAULT NULL,
  `beAna` varchar(250) DEFAULT NULL,
  `fbLink` varchar(250) DEFAULT NULL,
  `inLink` varchar(250) DEFAULT NULL,
  `twLink` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wb_basic`
--

INSERT INTO `wb_basic` (`id`, `hotelId`, `voucherIdGen`, `qpVoucherIdGen`, `chartBoot`, `fb_ifrm`, `wbAna`, `beAna`, `fbLink`, `inLink`, `twLink`) VALUES
(1, 'c1f91', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'a941a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '32073', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '8ba91', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'fecba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'e2b28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '99937', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '8d368', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '980e1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'd5850', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'ac112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '18785', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '768e3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'd5f87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wb_blog`
--

CREATE TABLE `wb_blog` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `category` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `addBy` text NOT NULL,
  `addOn` datetime NOT NULL DEFAULT current_timestamp(),
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wb_blog_category`
--

CREATE TABLE `wb_blog_category` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `addBy` int(11) DEFAULT NULL,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wb_feedback`
--

CREATE TABLE `wb_feedback` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `feedbackorder` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `rating` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `addBy` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wb_gallery`
--

CREATE TABLE `wb_gallery` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `text` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  `addBy` text NOT NULL,
  `add_on` datetime NOT NULL DEFAULT current_timestamp(),
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wb_gallery_category`
--

CREATE TABLE `wb_gallery_category` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `deleteRec` int(11) NOT NULL DEFAULT 1,
  `addBy` int(11) DEFAULT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wb_offersection`
--

CREATE TABLE `wb_offersection` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `price` float NOT NULL,
  `img` varchar(250) NOT NULL,
  `percentage` float NOT NULL,
  `description` text NOT NULL,
  `addBy` text NOT NULL,
  `code` varchar(250) NOT NULL,
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wb_page`
--

CREATE TABLE `wb_page` (
  `id` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `pageName` varchar(250) NOT NULL,
  `bgImg` varchar(250) NOT NULL,
  `img1` varchar(250) DEFAULT NULL,
  `img2` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `srtDes` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rurl` varchar(250) DEFAULT NULL,
  `rurlBtn` varchar(250) DEFAULT NULL,
  `addBy` text DEFAULT NULL,
  `addOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wb_slider`
--

CREATE TABLE `wb_slider` (
  `id` int(11) NOT NULL,
  `hotelId` varchar(11) NOT NULL,
  `sliderorder` int(11) NOT NULL,
  `img` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `subTitle` varchar(250) NOT NULL,
  `addBy` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `deleteRec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activityfeed`
--
ALTER TABLE `activityfeed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banktypemethod`
--
ALTER TABLE `banktypemethod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookingdetail`
--
ALTER TABLE `bookingdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookingpaymenttimeline`
--
ALTER TABLE `bookingpaymenttimeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookingsource`
--
ALTER TABLE `bookingsource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashiering`
--
ALTER TABLE `cashiering`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `check_in_status`
--
ALTER TABLE `check_in_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couponcode`
--
ALTER TABLE `couponcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_type`
--
ALTER TABLE `expense_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facing`
--
ALTER TABLE `facing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guestamenddetail`
--
ALTER TABLE `guestamenddetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guestidproof`
--
ALTER TABLE `guestidproof`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_review`
--
ALTER TABLE `guest_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotelprofile`
--
ALTER TABLE `hotelprofile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotelservice`
--
ALTER TABLE `hotelservice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotelsociallink`
--
ALTER TABLE `hotelsociallink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hoteluser`
--
ALTER TABLE `hoteluser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_booking_attr`
--
ALTER TABLE `hotel_booking_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_inventory` (`room_id`);

--
-- Indexes for table `kotcategory`
--
ALTER TABLE `kotcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kotgstprice`
--
ALTER TABLE `kotgstprice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kotguestdetail`
--
ALTER TABLE `kotguestdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kotorder`
--
ALTER TABLE `kotorder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kotorderdetail`
--
ALTER TABLE `kotorderdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kotorderstatus`
--
ALTER TABLE `kotorderstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kotprouct`
--
ALTER TABLE `kotprouct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kotservice`
--
ALTER TABLE `kotservice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kottable`
--
ALTER TABLE `kottable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kot_qty_unit`
--
ALTER TABLE `kot_qty_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kot_raw_product_list`
--
ALTER TABLE `kot_raw_product_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kot_stock`
--
ALTER TABLE `kot_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kot_stock_timeline`
--
ALTER TABLE `kot_stock_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live`
--
ALTER TABLE `live`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_policy`
--
ALTER TABLE `package_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `propertycounlist`
--
ALTER TABLE `propertycounlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `propertyinfo`
--
ALTER TABLE `propertyinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `propertylocation`
--
ALTER TABLE `propertylocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `propertyrateplan`
--
ALTER TABLE `propertyrateplan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `propertysetting`
--
ALTER TABLE `propertysetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_pg`
--
ALTER TABLE `property_pg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_seo`
--
ALTER TABLE `property_seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_term`
--
ALTER TABLE `property_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quickpay`
--
ALTER TABLE `quickpay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_list`
--
ALTER TABLE `report_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_type`
--
ALTER TABLE `report_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservationtype`
--
ALTER TABLE `reservationtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomfeature`
--
ALTER TABLE `roomfeature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomnumber`
--
ALTER TABLE `roomnumber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomratetype`
--
ALTER TABLE `roomratetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomstatus`
--
ALTER TABLE `roomstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_amenities`
--
ALTER TABLE `room_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_gst`
--
ALTER TABLE `room_gst`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_img`
--
ALTER TABLE `room_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_type_list`
--
ALTER TABLE `sales_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superadmin`
--
ALTER TABLE `superadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_booking_attr`
--
ALTER TABLE `sys_booking_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_coupon_type`
--
ALTER TABLE `sys_coupon_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_currency`
--
ALTER TABLE `sys_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_feature`
--
ALTER TABLE `sys_feature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_payment_getway`
--
ALTER TABLE `sys_payment_getway`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_sociallink`
--
ALTER TABLE `sys_sociallink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wb_basic`
--
ALTER TABLE `wb_basic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wb_blog`
--
ALTER TABLE `wb_blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wb_blog_category`
--
ALTER TABLE `wb_blog_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wb_feedback`
--
ALTER TABLE `wb_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wb_gallery`
--
ALTER TABLE `wb_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wb_gallery_category`
--
ALTER TABLE `wb_gallery_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wb_offersection`
--
ALTER TABLE `wb_offersection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wb_page`
--
ALTER TABLE `wb_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wb_slider`
--
ALTER TABLE `wb_slider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activityfeed`
--
ALTER TABLE `activityfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `banktypemethod`
--
ALTER TABLE `banktypemethod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bookingdetail`
--
ALTER TABLE `bookingdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `bookingpaymenttimeline`
--
ALTER TABLE `bookingpaymenttimeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bookingsource`
--
ALTER TABLE `bookingsource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cashiering`
--
ALTER TABLE `cashiering`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `check_in_status`
--
ALTER TABLE `check_in_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `couponcode`
--
ALTER TABLE `couponcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_type`
--
ALTER TABLE `expense_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facing`
--
ALTER TABLE `facing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `guestamenddetail`
--
ALTER TABLE `guestamenddetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `guestidproof`
--
ALTER TABLE `guestidproof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest_review`
--
ALTER TABLE `guest_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hotelprofile`
--
ALTER TABLE `hotelprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hotelservice`
--
ALTER TABLE `hotelservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hotelsociallink`
--
ALTER TABLE `hotelsociallink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hoteluser`
--
ALTER TABLE `hoteluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hotel_booking_attr`
--
ALTER TABLE `hotel_booking_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kotcategory`
--
ALTER TABLE `kotcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kotgstprice`
--
ALTER TABLE `kotgstprice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kotguestdetail`
--
ALTER TABLE `kotguestdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kotorder`
--
ALTER TABLE `kotorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kotorderdetail`
--
ALTER TABLE `kotorderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kotorderstatus`
--
ALTER TABLE `kotorderstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kotprouct`
--
ALTER TABLE `kotprouct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kotservice`
--
ALTER TABLE `kotservice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kottable`
--
ALTER TABLE `kottable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kot_qty_unit`
--
ALTER TABLE `kot_qty_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kot_raw_product_list`
--
ALTER TABLE `kot_raw_product_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kot_stock`
--
ALTER TABLE `kot_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kot_stock_timeline`
--
ALTER TABLE `kot_stock_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `live`
--
ALTER TABLE `live`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_policy`
--
ALTER TABLE `package_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `propertycounlist`
--
ALTER TABLE `propertycounlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `propertyinfo`
--
ALTER TABLE `propertyinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `propertylocation`
--
ALTER TABLE `propertylocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `propertyrateplan`
--
ALTER TABLE `propertyrateplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `propertysetting`
--
ALTER TABLE `propertysetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `property_pg`
--
ALTER TABLE `property_pg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `property_seo`
--
ALTER TABLE `property_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_term`
--
ALTER TABLE `property_term`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quickpay`
--
ALTER TABLE `quickpay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_list`
--
ALTER TABLE `report_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `report_type`
--
ALTER TABLE `report_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reservationtype`
--
ALTER TABLE `reservationtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roomfeature`
--
ALTER TABLE `roomfeature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roomnumber`
--
ALTER TABLE `roomnumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roomratetype`
--
ALTER TABLE `roomratetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roomstatus`
--
ALTER TABLE `roomstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `room_amenities`
--
ALTER TABLE `room_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room_gst`
--
ALTER TABLE `room_gst`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_img`
--
ALTER TABLE `room_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales_type_list`
--
ALTER TABLE `sales_type_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `superadmin`
--
ALTER TABLE `superadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sys_booking_attr`
--
ALTER TABLE `sys_booking_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sys_coupon_type`
--
ALTER TABLE `sys_coupon_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sys_currency`
--
ALTER TABLE `sys_currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sys_feature`
--
ALTER TABLE `sys_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sys_payment_getway`
--
ALTER TABLE `sys_payment_getway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sys_sociallink`
--
ALTER TABLE `sys_sociallink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wb_basic`
--
ALTER TABLE `wb_basic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wb_blog`
--
ALTER TABLE `wb_blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wb_blog_category`
--
ALTER TABLE `wb_blog_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wb_feedback`
--
ALTER TABLE `wb_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wb_gallery`
--
ALTER TABLE `wb_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wb_gallery_category`
--
ALTER TABLE `wb_gallery_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wb_offersection`
--
ALTER TABLE `wb_offersection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wb_page`
--
ALTER TABLE `wb_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wb_slider`
--
ALTER TABLE `wb_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
