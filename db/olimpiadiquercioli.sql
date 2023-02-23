-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 23, 2023 alle 19:06
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

--
-- Dump dei dati per la tabella `tatleta`
--

INSERT INTO `tatleta` (`id`, `nome`, `cognome`, `dataNascita`, `idSquadra`, `idIstitutoProvenienza`, `idNazionalita`) VALUES
(1, 'Joel', 'Bosio', '2004-02-02', 1, 1, 1),
(2, 'Lorenzo', 'Gambel', '2004-05-05', 1, 1, 1),
(3, 'Alexandre ', 'Germain', '2006-09-08', 2, 2, 2),
(4, 'Cesare ', 'Olivati', '2004-02-12', 3, 1, 1),
(5, 'Marietto', 'Malandrini', '2013-02-01', 4, 3, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `tfasegara`
--

CREATE TABLE `tfasegara` (
  `id` int(11) NOT NULL,
  `nome` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `tfasegara`
--

INSERT INTO `tfasegara` (`id`, `nome`) VALUES
(1, 'Scolastica'),
(2, 'Regionale'),
(3, 'Nazionale'),
(4, 'Internazionale');

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

--
-- Dump dei dati per la tabella `tgara`
--

INSERT INTO `tgara` (`id`, `target`, `data`, `viaSede`, `nCivicoSede`, `idFaseGara`) VALUES
(1, 'ITS Volta', '2023-02-14', 'Via Monte Grappa', 1, 1),
(2, 'Friuli-Venezia Giulia', '2023-02-01', 'Via Roma ', 1, 2),
(3, 'Istituto brutto francese', '2022-11-16', 'Via francese', 1, 1),
(4, 'Italia', '2023-02-21', 'Val rosandra', 1, 3),
(5, 'ITS Genova', '2022-01-06', 'Via mare ', 1, 1),
(6, 'Liguria', '2023-02-17', 'Via Luka Sciardis', 6, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `tistituto`
--

CREATE TABLE `tistituto` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `tistituto`
--

INSERT INTO `tistituto` (`id`, `nome`) VALUES
(1, 'ITS Volta'),
(2, 'Reyer Institute'),
(3, 'ITS Genova');

-- --------------------------------------------------------

--
-- Struttura della tabella `tnazionalita`
--

CREATE TABLE `tnazionalita` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `tnazionalita`
--

INSERT INTO `tnazionalita` (`id`, `nome`) VALUES
(1, 'Italia'),
(2, 'Francia');

-- --------------------------------------------------------

--
-- Struttura della tabella `tpartecipazioneatleta`
--

CREATE TABLE `tpartecipazioneatleta` (
  `id` int(11) NOT NULL,
  `punteggio` int(11) NOT NULL,
  `idAtleta` int(11) NOT NULL,
  `idGara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `tpartecipazioneatleta`
--

INSERT INTO `tpartecipazioneatleta` (`id`, `punteggio`, `idAtleta`, `idGara`) VALUES
(1, 30, 4, 1),
(2, 40, 1, 1),
(3, 100, 2, 1),
(4, 5, 1, 2),
(5, 0, 2, 2),
(6, 90, 3, 3),
(7, 100, 5, 5),
(8, 100, 5, 6),
(9, 90, 5, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `tpartecipazionesquadra`
--

CREATE TABLE `tpartecipazionesquadra` (
  `id` int(11) NOT NULL,
  `idGara` int(11) NOT NULL,
  `idSquadra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `tpartecipazionesquadra`
--

INSERT INTO `tpartecipazionesquadra` (`id`, `idGara`, `idSquadra`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 1),
(4, 3, 2),
(5, 5, 4),
(6, 6, 4),
(7, 4, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `tsquadra`
--

CREATE TABLE `tsquadra` (
  `id` int(11) NOT NULL,
  `nome` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `tsquadra`
--

INSERT INTO `tsquadra` (`id`, `nome`) VALUES
(1, 'Fazzoletti'),
(2, 'Ratatouille'),
(3, 'Piastrelle'),
(4, 'Tirchi');

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
-- Indici per le tabelle `tpartecipazioneatleta`
--
ALTER TABLE `tpartecipazioneatleta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tpartecipazioneatleta_tatleta` (`idAtleta`),
  ADD KEY `tpartecipazioneatleta_tgara` (`idGara`);

--
-- Indici per le tabelle `tpartecipazionesquadra`
--
ALTER TABLE `tpartecipazionesquadra`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `tfasegara`
--
ALTER TABLE `tfasegara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `tgara`
--
ALTER TABLE `tgara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `tistituto`
--
ALTER TABLE `tistituto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `tnazionalita`
--
ALTER TABLE `tnazionalita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `tpartecipazioneatleta`
--
ALTER TABLE `tpartecipazioneatleta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `tpartecipazionesquadra`
--
ALTER TABLE `tpartecipazionesquadra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `tsquadra`
--
ALTER TABLE `tsquadra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Limiti per la tabella `tpartecipazioneatleta`
--
ALTER TABLE `tpartecipazioneatleta`
  ADD CONSTRAINT `tpartecipazioneatleta_tatleta` FOREIGN KEY (`idAtleta`) REFERENCES `tatleta` (`id`),
  ADD CONSTRAINT `tpartecipazioneatleta_tgara` FOREIGN KEY (`idGara`) REFERENCES `tgara` (`id`);

--
-- Limiti per la tabella `tpartecipazionesquadra`
--
ALTER TABLE `tpartecipazionesquadra`
  ADD CONSTRAINT `tpartecipazionegara_tgara` FOREIGN KEY (`idGara`) REFERENCES `tgara` (`id`),
  ADD CONSTRAINT `tpartecipazionegara_tsquadra` FOREIGN KEY (`idSquadra`) REFERENCES `tsquadra` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
