-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 13. Jun 2022 um 13:37
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `SchoolDex`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Accounts`
--

CREATE TABLE `Accounts` (
  `id` int(11) NOT NULL,
  `benutzername` text NOT NULL,
  `passwort` text NOT NULL,
  `status1` text NOT NULL,
  `schulname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Accounts`
--

INSERT INTO `Accounts` (`id`, `benutzername`, `passwort`, `status1`, `schulname`) VALUES
(1, 'Testuser', '1', 'L135', 'SchoolDex');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Ags`
--

CREATE TABLE `Ags` (
  `id` int(11) NOT NULL,
  `thema` text NOT NULL,
  `jahrgang` text NOT NULL,
  `beschreibung` text NOT NULL,
  `termin` text NOT NULL,
  `schulname` text NOT NULL,
  `userId` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Blackboard`
--

CREATE TABLE `Blackboard` (
  `id` int(11) NOT NULL,
  `ueberschrift` text NOT NULL,
  `beschreibung` text NOT NULL,
  `color` text NOT NULL,
  `datum` text NOT NULL,
  `userId` text NOT NULL,
  `benutzername` text NOT NULL,
  `schulname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Nachhilfe`
--

CREATE TABLE `Nachhilfe` (
  `id` int(11) NOT NULL,
  `fach` text NOT NULL,
  `jahrgang` text NOT NULL,
  `beschreibung` text NOT NULL,
  `userId` text NOT NULL,
  `benutzername` text NOT NULL,
  `schulname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `News`
--

CREATE TABLE `News` (
  `id` int(11) NOT NULL,
  `ueberschrift` text NOT NULL,
  `inhalt` text NOT NULL,
  `datum` text NOT NULL,
  `schulname` text NOT NULL,
  `userId` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Accounts`
--
ALTER TABLE `Accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Ags`
--
ALTER TABLE `Ags`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Blackboard`
--
ALTER TABLE `Blackboard`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Nachhilfe`
--
ALTER TABLE `Nachhilfe`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `News`
--
ALTER TABLE `News`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Accounts`
--
ALTER TABLE `Accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Ags`
--
ALTER TABLE `Ags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Blackboard`
--
ALTER TABLE `Blackboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Nachhilfe`
--
ALTER TABLE `Nachhilfe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `News`
--
ALTER TABLE `News`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
