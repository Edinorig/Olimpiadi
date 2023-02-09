-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 09, 2023 alle 18:40
-- Versione del server: 10.4.25-MariaDB
-- Versione PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olimpiadiquercioli`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `tatleta`
--

CREATE TABLE `tatleta` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL,
  `cognome` varchar(64) NOT NULL,
  `dataNascita` date NOT NULL,
  `idSquadra` int(11) NOT NULL,
  `idIstitutoProvenienza` int(11) NOT NULL,
  `idNazionalita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tfasegara`
--

CREATE TABLE `tfasegara` (
  `id` int(11) NOT NULL,
  `nome` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tgara`
--

CREATE TABLE `tgara` (
  `id` int(11) NOT NULL,
  `target` varchar(64) NOT NULL,
  `data` date NOT NULL,
  `viaSede` varchar(64) NOT NULL,
  `nCivicoSede` int(11) NOT NULL,
  `idFaseGara` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tistituto`
--

CREATE TABLE `tistituto` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tnazionalita`
--

CREATE TABLE `tnazionalita` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tpartecipazionegara`
--

CREATE TABLE `tpartecipazionegara` (
  `id` int(11) NOT NULL,
  `punteggio` int(32) NOT NULL,
  `idGara` int(11) NOT NULL,
  `idSquadra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `tsquadra`
--

CREATE TABLE `tsquadra` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `tatleta`
--
ALTER TABLE `tatleta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tatleta_tistituto` (`idIstitutoProvenienza`),
  ADD KEY `tatleta_tnazionalita` (`idNazionalita`),
  ADD KEY `tatleta_tsquadra` (`idSquadra`);

--
-- Indici per le tabelle `tfasegara`
--
ALTER TABLE `tfasegara`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tgara`
--
ALTER TABLE `tgara`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tgara_tfasegara` (`idFaseGara`);

--
-- Indici per le tabelle `tistituto`
--
ALTER TABLE `tistituto`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tnazionalita`
--
ALTER TABLE `tnazionalita`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tpartecipazionegara`
--
ALTER TABLE `tpartecipazionegara`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tpartecipazionegara_tsquadra` (`idSquadra`),
  ADD KEY `tpartecipazionegara_tgara` (`idGara`);

--
-- Indici per le tabelle `tsquadra`
--
ALTER TABLE `tsquadra`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `tatleta`
--
ALTER TABLE `tatleta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tfasegara`
--
ALTER TABLE `tfasegara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tgara`
--
ALTER TABLE `tgara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tistituto`
--
ALTER TABLE `tistituto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tnazionalita`
--
ALTER TABLE `tnazionalita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tpartecipazionegara`
--
ALTER TABLE `tpartecipazionegara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tsquadra`
--
ALTER TABLE `tsquadra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `tatleta`
--
ALTER TABLE `tatleta`
  ADD CONSTRAINT `tatleta_tistituto` FOREIGN KEY (`idIstitutoProvenienza`) REFERENCES `tistituto` (`id`),
  ADD CONSTRAINT `tatleta_tnazionalita` FOREIGN KEY (`idNazionalita`) REFERENCES `tnazionalita` (`id`),
  ADD CONSTRAINT `tatleta_tsquadra` FOREIGN KEY (`idSquadra`) REFERENCES `tsquadra` (`id`);

--
-- Limiti per la tabella `tgara`
--
ALTER TABLE `tgara`
  ADD CONSTRAINT `tgara_tfasegara` FOREIGN KEY (`idFaseGara`) REFERENCES `tfasegara` (`id`);

--
-- Limiti per la tabella `tpartecipazionegara`
--
ALTER TABLE `tpartecipazionegara`
  ADD CONSTRAINT `tpartecipazionegara_tgara` FOREIGN KEY (`idGara`) REFERENCES `tgara` (`id`),
  ADD CONSTRAINT `tpartecipazionegara_tsquadra` FOREIGN KEY (`idSquadra`) REFERENCES `tsquadra` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
