-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2025 at 05:46 PM
-- Server version: 10.5.27-MariaDB-cll-lve
-- PHP Version: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teky6584_api_ryski`
--

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `team1` varchar(255) NOT NULL,
  `team2` varchar(255) NOT NULL,
  `league` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `team1`, `team2`, `league`, `date`, `time`, `created_at`) VALUES
(1, 'Arsenal', 'Manchester City', 'Premiere League', '2025-02-02', '23:30:00', '2025-01-14 07:37:31'),
(2, 'Juventus', 'AC Milan', 'Serie A', '2025-01-19', '00:00:00', '2025-01-14 09:00:05'),
(3, 'Barcelona', 'Valencia', 'La Liga', '2025-01-27', '03:00:00', '2025-01-14 09:01:45'),
(4, 'RB Leipzig', 'Leverkusen', 'Bundesliga', '2025-01-25', '21:30:00', '2025-01-14 09:03:09'),
(5, 'Manchester City', 'Liverpool', 'Premiere League', '2025-02-23', '23:30:00', '2025-01-14 09:13:23'),
(6, 'Persija Jakarta', 'Persib Bandung', 'Liga 1', '2025-02-16', '15:30:00', '2025-01-14 09:42:46'),
(7, 'Valencia', 'Real Sociedad', 'La Liga', '2025-01-20', '03:00:00', '2025-01-14 15:14:33'),
(9, 'Atalanta', 'Juventus', 'Serie A', '2025-01-15', '02:45:00', '2025-01-14 15:19:26'),
(10, 'Wolfsburg', 'MÃ¶nchengladbach', 'Bundesliga', '2025-01-15', '02:30:00', '2025-01-14 15:21:18'),
(11, 'Barcelona', 'Atalanta', 'UEFA Champions League', '2025-01-30', '03:00:00', '2025-01-14 15:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `goals` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `goals`, `created_at`) VALUES
(1, 'Ryski Maulana', 1, '2025-01-14 06:53:23'),
(8, 'Cristiano Ronaldo', 850, '2025-01-14 09:28:47'),
(9, 'Lionel Messi', 800, '2025-01-14 09:29:09'),
(10, 'RomÃ¡rio', 750, '2025-01-14 09:29:22'),
(11, 'Ferenc PuskÃ¡s', 746, '2025-01-14 09:29:36'),
(12, 'PelÃ©', 770, '2025-01-14 09:29:45'),
(15, 'Josef Bican', 805, '2025-01-14 09:30:37'),
(16, 'Gerd MÃ¼ller', 735, '2025-01-14 09:31:02'),
(17, 'Ronaldo NazÃ¡rio', 414, '2025-01-14 09:31:20'),
(18, 'Zico', 522, '2025-01-14 09:31:38'),
(19, 'David Villa', 500, '2025-01-14 09:31:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'ryski', '$2y$10$Imwf4b/nmdzRHxSz8hHbtusMwojYyBdBcxPDcAV4TFYVUxL9E5T3W', 'ryski@gmail.com', '0896126612', '2025-01-09 10:33:43', '2025-01-09 10:33:43'),
(2, 'maul', '$2y$10$zjSF1Y.Ss9llscPgltrpCePntGhbB3FrhuJYSjFsM0/Hr5QerN58W', 'maulanaikky10@gmail.com', '089667357647', '2025-01-14 11:13:09', '2025-01-14 11:13:09'),
(3, 'rysm', '$2y$10$kKzcHlcIuNc9CLdtN8OpmOsetXcPR1rKbIB0BRCMoJsej5CNd7rrq', 'rysm@gmail.com', '089621771271', '2025-01-14 11:19:27', '2025-01-14 11:19:27'),
(4, '', '$2y$10$k4ejAK6cGzi5QG1ZAZx9wOIukxkSWgxlseYersTTpoNfPjyaM5qnO', '', '', '2025-01-19 07:23:43', '2025-01-19 07:23:43'),
(5, 'jnewfn', '$2y$10$KAbRih7dBigU7VVW.CCRf.JFgwF6Yo/NIV8cZIbRFKHFV1EWaWP1K', 'wlekfnkwen', 'ekfneknfefefef', '2025-01-22 10:21:25', '2025-01-22 10:21:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
