-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2023 at 08:29 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(8) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `name`) VALUES
(12, 'Adventure'),
(14, 'Fantasy'),
(16, 'Animation'),
(18, 'Drama'),
(27, 'Horror'),
(28, 'Action'),
(35, 'Comedy'),
(36, 'History'),
(37, 'Western'),
(53, 'Thriller'),
(80, 'Crime'),
(99, 'Documentary'),
(878, 'Science Fiction'),
(9648, 'Mystery'),
(10402, 'Music'),
(10749, 'Romance'),
(10751, 'Family'),
(10752, 'War'),
(10770, 'TV Movie');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `video_id` int(8) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(4048) NOT NULL,
  `poster_path` varchar(1024) NOT NULL,
  `video_path` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`video_id`, `name`, `description`, `poster_path`, `video_path`) VALUES
(315162, 'Puss in Boots: The Last Wish', 'Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.', 'https://image.tmdb.org/t/p/w500//kuf6dutpsT0vSVehic3EZIqkOBt.jpg', 'https://www.youtube.com/watch?v=tHb7WlgyaUc'),
(505642, 'Black Panther: Wakanda Forever', 'Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.', 'https://image.tmdb.org/t/p/w500/sv1xJUazXeYqALzczSZ3O6nkH75.jpg', 'https://www.youtube.com/watch?v=_Z3QKkl1WyM'),
(615777, 'Babylon', 'A tale of outsized ambition and outrageous excess, tracing the rise and fall of multiple characters in an era of unbridled decadence and depravity during Hollywood\'s transition from silent films and to sound films in the late 1920s.', 'https://image.tmdb.org/t/p/w500/wjOHjWCUE0YzDiEzKv8AfqHj3ir.jpg', 'https://www.youtube.com/watch?v=t7HT83wkVss'),
(640146, 'Ant-Man and the Wasp: Quantumania', 'Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope\'s parents Janet van Dyne and Hank Pym, and Scott\'s daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.', 'https://image.tmdb.org/t/p/w500/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg', 'https://www.youtube.com/watch?v=ZlNFpri-Y40'),
(667216, 'Infinity Pool', 'While staying at an isolated island resort, James and Em are enjoying a perfect vacation of pristine beaches, exceptional staff, and soaking up the sun. But guided by the seductive and mysterious Gabi, they venture outside the resort grounds and find themselves in a culture filled with violence, hedonism, and untold horror.', 'https://image.tmdb.org/t/p/w500/5DNRr2juXdwtvktwXxwuk9Usk8O.jpg', 'https://www.youtube.com/watch?v=PVnIMvVEkrA'),
(696157, 'Whitney Houston: I Wanna Dance with Somebody', 'The joyous, emotional, heartbreaking celebration of the life and music of Whitney Houston, the greatest female R&B pop vocalist of all time. Tracking her journey from obscurity to musical superstardom.', 'https://image.tmdb.org/t/p/w500/oodPJ3Op1pWBhnEFyw5fampRCWf.jpg', 'https://www.youtube.com/watch?v=WcBKfSOKYdc'),
(814757, 'Empire of Light', 'The duty manager of a seaside cinema, who is struggling with her mental health, forms a relationship with a new employee on the south coast of England in the 1980s.', 'https://image.tmdb.org/t/p/w500/h84SnIQF91Gz2Fv1OpMJ3245t4i.jpg', 'https://www.youtube.com/watch?v=3JA3bD5xs-Q');

-- --------------------------------------------------------

--
-- Table structure for table `video_genre`
--

CREATE TABLE `video_genre` (
  `vg_id` int(8) NOT NULL,
  `video_id` int(8) NOT NULL,
  `genre_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_genre`
--

INSERT INTO `video_genre` (`vg_id`, `video_id`, `genre_id`) VALUES
(1, 505642, 28),
(2, 505642, 12),
(3, 505642, 878),
(4, 615777, 18),
(5, 615777, 35),
(6, 640146, 12),
(7, 640146, 878),
(8, 640146, 35),
(9, 315162, 16),
(10, 315162, 12),
(11, 315162, 35),
(12, 315162, 10751),
(13, 315162, 14),
(14, 696157, 10402),
(15, 696157, 36),
(16, 696157, 18),
(17, 814757, 18),
(18, 814757, 10749);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD UNIQUE KEY `genre_id` (`genre_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD UNIQUE KEY `video_id` (`video_id`);

--
-- Indexes for table `video_genre`
--
ALTER TABLE `video_genre`
  ADD PRIMARY KEY (`vg_id`),
  ADD KEY `video_genre_fk_2` (`genre_id`),
  ADD KEY `video_genre_fk_1` (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `video_genre`
--
ALTER TABLE `video_genre`
  MODIFY `vg_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `video_genre`
--
ALTER TABLE `video_genre`
  ADD CONSTRAINT `video_genre_fk_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `video_genre_fk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
