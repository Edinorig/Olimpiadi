-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 27, 2023 alle 19:20
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
(1, 'Joel', 'Bosio', '2004-03-03', 1, 1, 1),
(2, 'Lorenzo', 'Gambel', '2004-05-05', 1, 1, 1),
(3, 'Alexandre ', 'Germain', '2006-09-08', 2, 2, 2),
(4, 'Cesare ', 'Olivati', '2004-02-12', 3, 1, 1),
(5, 'Marietto', 'Malandrini', '2013-02-01', 4, 3, 1),
(6, 'Cabrel ', 'Kana Kengne', '2004-02-02', 5, 1, 1),
(7, 'Marco', 'Rossi', '2004-01-10', 12, 9, 8),
(8, 'Luca', 'Bianchi', '2004-02-15', 1, 15, 12),
(9, 'Giulia', 'Verdi', '2004-03-20', 12, 15, 14),
(10, 'Simone', 'Antonini', '2004-04-25', 5, 8, 7),
(11, 'Alessandra', 'Russo', '2004-05-30', 17, 19, 7),
(12, 'Giovanni', 'Ferrari', '2004-06-05', 16, 11, 5),
(13, 'Elena', 'Romano', '2004-07-10', 15, 8, 7),
(14, 'Davide', 'Rizzo', '2004-08-15', 15, 19, 6),
(15, 'Silvia', 'Moretti', '2004-09-20', 1, 17, 6),
(16, 'Lorenzo', 'Conti', '2004-10-25', 3, 10, 2),
(17, 'Sara', 'Giordano', '2004-11-30', 9, 11, 4),
(18, 'Filippo', 'Moretti', '2004-12-05', 8, 6, 5);

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
(6, 'Liguria', '2023-02-17', 'Via Luka Sciardis', 6, 2),
(7, 'Internazionale', '2023-02-25', 'Via terra ', 2, 4),
(8, 'Liceo Classico \"G. D\'Annunzio\"', '2023-03-10', 'Via Roma', 10, 1),
(9, 'Liceo Scientifico \"A. Volta\"', '2023-03-12', 'Piazza Garibaldi', 12, 1),
(10, 'Liceo Artistico \"A. Modigliani\"', '2023-03-15', 'Via Dante', 25, 1),
(11, 'Liceo Linguistico \"E. Fermi\"', '2023-03-18', 'Piazza della Repubblica', 8, 1),
(12, 'Toscana', '2023-03-22', 'Via delle Terme', 3, 2),
(13, 'Lazio', '2023-03-25', 'Piazza Navona', 18, 2),
(14, 'Veneto', '2023-03-28', 'Corso del Popolo', 36, 2),
(15, 'Emilia-Romagna', '2023-04-01', 'Via Indipendenza', 15, 2),
(16, 'Germania', '2023-04-05', 'Friedrichstraße', 30, 3),
(17, 'Francia', '2023-04-08', 'Avenue des Champs-Élysées', 20, 3),
(18, 'Svizzera', '2023-04-11', 'Bahnhofstrasse', 42, 3),
(19, 'Grecia', '2023-04-14', 'Leoforos Vasileos Konstantinou', 5, 3),
(20, 'Spagna', '2023-04-17', 'Calle Gran Vía', 12, 3),
(21, 'Olanda', '2023-04-20', 'Damrak', 8, 3);

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
(3, 'ITS Genova'),
(4, 'Gymnasium am Munsterplatz'),
(5, 'Lycee Louis-le-Grand'),
(6, 'Gimnazija Bezigrad'),
(7, 'Istituto Tecnico Industriale Ettore Majorana'),
(8, 'Gymnazium Jura Hronca'),
(9, 'Colegio Militar'),
(10, 'Gymnasium Novum'),
(11, 'Gymnazium Cesky Tesin'),
(12, 'Gymnasium Unterried'),
(13, 'Realgymnasium Monchengladbach'),
(14, 'Srednja skola Krapina'),
(15, 'Liceo Scientifico Archimede'),
(16, 'Liceo Classico Virgilio'),
(17, 'Istituto Tecnico Industriale G. Marconi'),
(18, 'Liceo Linguistico C. Colombo'),
(19, 'Istituto Tecnico Agrario S. Pertini');

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
(2, 'Francia'),
(3, 'Germania'),
(4, 'Regno Unito'),
(5, 'Spagna'),
(6, 'Portogallo'),
(7, 'Paesi Bassi'),
(8, 'Belgio'),
(9, 'Svezia'),
(10, 'Norvegia'),
(11, 'Danimarca'),
(12, 'Polonia'),
(13, 'Grecia'),
(14, 'Irlanda'),
(15, 'Finlandia');

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
(9, 90, 5, 4),
(10, 100, 5, 7),
(11, 40, 6, 1),
(12, 20, 10, 11),
(13, 30, 13, 10),
(14, 0, 17, 21),
(15, 50, 17, 21),
(16, 0, 16, 15),
(17, 30, 16, 15),
(18, 0, 12, 15),
(19, 40, 12, 15);

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
(7, 4, 4),
(8, 7, 4),
(9, 1, 5),
(10, 10, 15),
(11, 11, 17),
(12, 21, 8),
(13, 18, 9),
(14, 15, 16);

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
(4, 'Tirchi'),
(5, 'Air dribble'),
(6, 'Volcano'),
(7, 'Thunder'),
(8, 'Sapphire'),
(9, 'Serenade'),
(10, 'Horizon'),
(11, 'Lighthouse'),
(12, 'Thunderbolt'),
(13, 'Aquila'),
(14, 'Fenicottero'),
(15, 'Lupi'),
(16, 'Gabbiano'),
(17, 'Stelle'),
(18, 'Corvi'),
(19, 'Falchi');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `tfasegara`
--
ALTER TABLE `tfasegara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `tgara`
--
ALTER TABLE `tgara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT per la tabella `tistituto`
--
ALTER TABLE `tistituto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `tnazionalita`
--
ALTER TABLE `tnazionalita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `tpartecipazioneatleta`
--
ALTER TABLE `tpartecipazioneatleta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `tpartecipazionesquadra`
--
ALTER TABLE `tpartecipazionesquadra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `tsquadra`
--
ALTER TABLE `tsquadra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
