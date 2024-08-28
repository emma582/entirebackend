-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 06, 2024 at 12:24 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisdom`
--

-- --------------------------------------------------------

--
-- Table structure for table `allottime_table`
--

DROP TABLE IF EXISTS `allottime_table`;
CREATE TABLE IF NOT EXISTS `allottime_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` varchar(20) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `faculty` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `allottime_table`
--

INSERT INTO `allottime_table` (`id`, `year`, `subject`, `faculty`) VALUES
(1, 'sem-I', 'Eng', 'CD');

-- --------------------------------------------------------

--
-- Table structure for table `answer_table`
--

DROP TABLE IF EXISTS `answer_table`;
CREATE TABLE IF NOT EXISTS `answer_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` varchar(10) NOT NULL,
  `question` varchar(50) NOT NULL,
  `answer` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty_mast`
--

DROP TABLE IF EXISTS `faculty_mast`;
CREATE TABLE IF NOT EXISTS `faculty_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faculty_Id` int NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `middle_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `gender` enum('female','male') NOT NULL,
  `contact_no` bigint NOT NULL,
  `email_id` varchar(20) NOT NULL,
  `qualification` varchar(20) NOT NULL,
  `subject` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecture_table`
--

DROP TABLE IF EXISTS `lecture_table`;
CREATE TABLE IF NOT EXISTS `lecture_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` varchar(10) NOT NULL,
  `subject` varchar(10) NOT NULL,
  `faculty` varchar(10) NOT NULL,
  `code_link` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes_table`
--

DROP TABLE IF EXISTS `notes_table`;
CREATE TABLE IF NOT EXISTS `notes_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subject` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_dir` blob NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notes_table`
--

INSERT INTO `notes_table` (`id`, `year`, `subject`, `file_dir`, `upload_date`) VALUES
(31, '', '', '', '2024-08-05 17:49:02'),
(32, '', '', '', '2024-08-05 17:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `question_table`
--

DROP TABLE IF EXISTS `question_table`;
CREATE TABLE IF NOT EXISTS `question_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roll_no` int NOT NULL,
  `class` varchar(10) NOT NULL,
  `query` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_mast`
--

DROP TABLE IF EXISTS `role_mast`;
CREATE TABLE IF NOT EXISTS `role_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `usertype` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role_mast`
--

INSERT INTO `role_mast` (`id`, `role`, `usertype`) VALUES
(1, 1, 'student'),
(2, 2, 'admin'),
(3, 3, 'faculty');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
CREATE TABLE IF NOT EXISTS `user_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` int NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `middle_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `gender` enum('female','male') NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_no` bigint NOT NULL,
  `email_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `role`, `first_name`, `middle_name`, `last_name`, `gender`, `date_of_birth`, `contact_no`, `email_id`, `password`) VALUES
(10, 1, 'Archana', 'Nagesh', 'Palli', 'female', '2024-11-13', 9371254414, 'palliarchana01@gmail.com', 'arch@13'),
(11, 2, 'Vaishnavi', 'Nagesh', 'Palli', 'female', '0000-00-00', 8890817234, 'vaishnavipalli@gmail.com', 'vaish@2002');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_table`
--
ALTER TABLE `user_table`
  ADD CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role_mast` (`role`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
