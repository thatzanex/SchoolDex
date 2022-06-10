-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 09. Jun 2022 um 23:07
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
(1, 'Test123', '2', 'S246', 'SchoolDex'),
(2, 'Test1', '1', 'S246', 'SchoolDex'),
(3, 'Moritz', '1', 'L135', 'SchoolDex');

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

--
-- Daten für Tabelle `Ags`
--

INSERT INTO `Ags` (`id`, `thema`, `jahrgang`, `beschreibung`, `termin`, `schulname`, `userId`) VALUES
(1, 'Orchester', '5-Q', 'Alle die gerne ein Instrument spielen sind eingeladen zu kommen', 'Dienstag 8-9 Stunde', 'SchoolDex', '2');

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

--
-- Daten für Tabelle `Nachhilfe`
--

INSERT INTO `Nachhilfe` (`id`, `fach`, `jahrgang`, `beschreibung`, `userId`, `benutzername`, `schulname`) VALUES
(1, 'Mathe', '5-7', 'Test ', '23', 'Test123', 'SchoolDex');

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
-- Daten für Tabelle `News`
--

INSERT INTO `News` (`id`, `ueberschrift`, `inhalt`, `datum`, `schulname`, `userId`) VALUES
(1, 'Neuer Basketballkorb', 'Das lange Warten hat nun endlich ein Ende. Wir haben nun einen neuen Basketballkorb auf unserem Schulhof. Gestern wurde er von den Handwerken errichtet und dufte heute gleich von den ersten Schüler eingeweiht werden.', '09.06.2022', 'SchoolDex', '2');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `Ags`
--
ALTER TABLE `Ags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Nachhilfe`
--
ALTER TABLE `Nachhilfe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `News`
--
ALTER TABLE `News`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
