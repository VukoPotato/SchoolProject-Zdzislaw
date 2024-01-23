-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Paź 2023, 23:17
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `commands`
--
CREATE DATABASE IF NOT EXISTS `commands` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `commands`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `champions`
--

CREATE TABLE `champions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_runes` int(11) NOT NULL,
  `id_support` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `champions`
--

INSERT INTO `champions` (`id`, `name`, `id_runes`, `id_support`) VALUES
(1, 'Aphelios', 1, 6),
(2, 'Twitch', 2, 7),
(3, 'Ashe', 1, 7),
(4, 'Caitlyn', 1, 6),
(5, 'Ezreal', 5, 7),
(6, 'Jhin', 6, 7),
(7, 'Jinx', 1, 6),
(8, 'Vayne', 1, 6),
(9, 'Kai\'Sa', 2, 6),
(10, 'Miss Fortune', 4, 7),
(11, 'Nilah', 5, 7),
(12, 'Kalista', 1, 7),
(13, 'Draven', 2, 6),
(14, 'Kog\'Maw', 1, 6),
(15, 'Lucian', 4, 7),
(16, 'Samira', 5, 7),
(17, 'Sivir', 1, 6),
(18, 'Tristana', 1, 6),
(19, 'Varus', 2, 7),
(20, 'Xayah', 1, 6),
(21, 'Zeri', 1, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `counterchampions`
--

CREATE TABLE `counterchampions` (
  `id` int(11) NOT NULL,
  `idchampiona` int(11) NOT NULL,
  `idcountera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `counterchampions`
--

INSERT INTO `counterchampions` (`id`, `idchampiona`, `idcountera`) VALUES
(1, 1, 11),
(2, 1, 3),
(3, 3, 14),
(4, 3, 2),
(5, 2, 11),
(6, 2, 14),
(7, 4, 6),
(8, 4, 2),
(9, 5, 14),
(10, 5, 11),
(11, 6, 8),
(12, 6, 14),
(13, 7, 2),
(14, 7, 14),
(15, 8, 10),
(16, 9, 11),
(17, 9, 14),
(18, 10, 2),
(19, 11, 20),
(20, 11, 8),
(21, 12, 3),
(22, 12, 7),
(23, 13, 11),
(24, 13, 10),
(25, 14, 10),
(26, 15, 14),
(27, 15, 10),
(28, 16, 11),
(29, 16, 14),
(30, 17, 14),
(31, 17, 8),
(32, 18, 11),
(33, 18, 10),
(34, 19, 14),
(35, 19, 11),
(36, 20, 14),
(37, 20, 5),
(38, 21, 14),
(39, 21, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `runes`
--

CREATE TABLE `runes` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `runes`
--

INSERT INTO `runes` (`id`, `nazwa`) VALUES
(1, 'LT'),
(2, 'HoB'),
(3, 'PTA'),
(4, 'First Strike'),
(5, 'Conqueror'),
(6, 'Fleet Footwork');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `supports`
--

CREATE TABLE `supports` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `supports`
--

INSERT INTO `supports` (`id`, `name`) VALUES
(6, 'Ardenty'),
(7, 'Tanki');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `champions`
--
ALTER TABLE `champions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_runes` (`id_runes`),
  ADD KEY `index_support` (`id_support`);

--
-- Indeksy dla tabeli `counterchampions`
--
ALTER TABLE `counterchampions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind_idchampion` (`idchampiona`),
  ADD KEY `ind_idchampiona` (`idcountera`);

--
-- Indeksy dla tabeli `runes`
--
ALTER TABLE `runes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ind_runy` (`id`),
  ADD KEY `index_idruny` (`id`);

--
-- Indeksy dla tabeli `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `champions`
--
ALTER TABLE `champions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `counterchampions`
--
ALTER TABLE `counterchampions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT dla tabeli `runes`
--
ALTER TABLE `runes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `supports`
--
ALTER TABLE `supports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `champions`
--
ALTER TABLE `champions`
  ADD CONSTRAINT `champions_ibfk_1` FOREIGN KEY (`id_runes`) REFERENCES `runes` (`id`),
  ADD CONSTRAINT `champions_ibfk_2` FOREIGN KEY (`id_support`) REFERENCES `supports` (`id`);

--
-- Ograniczenia dla tabeli `counterchampions`
--
ALTER TABLE `counterchampions`
  ADD CONSTRAINT `counterchampions_ibfk_1` FOREIGN KEY (`idchampiona`) REFERENCES `champions` (`id`),
  ADD CONSTRAINT `counterchampions_ibfk_2` FOREIGN KEY (`idcountera`) REFERENCES `champions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
