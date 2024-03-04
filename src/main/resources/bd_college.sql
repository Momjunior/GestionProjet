-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 24, 2023 at 10:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_college`
--

-- --------------------------------------------------------

--
-- Table structure for table `annee_scolaire`
--

CREATE TABLE `annee_scolaire` (
  `id_annee_scolaire` bigint(20) NOT NULL,
  `debut` varchar(255) NOT NULL,
  `fin` varchar(255) NOT NULL,
  `statut` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bulletin`
--

CREATE TABLE `bulletin` (
  `id_bulletin` bigint(20) NOT NULL,
  `appreciation` varchar(255) DEFAULT NULL,
  `assiduite` varchar(255) DEFAULT NULL,
  `conduite` varchar(255) DEFAULT NULL,
  `semestre` varchar(255) NOT NULL,
  `tableau_honneur` varchar(255) DEFAULT NULL,
  `id_inscription` bigint(20) NOT NULL,
  `id_professeur` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorie_classe`
--

CREATE TABLE `categorie_classe` (
  `id_categorie_classe` bigint(20) NOT NULL,
  `nom_categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie_classe`
--

INSERT INTO `categorie_classe` (`id_categorie_classe`, `nom_categorie`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'),
(6, 'F'),
(7, 'G'),
(8, 'H'),
(9, 'I'),
(10, 'J'),
(11, 'K'),
(12, 'L'),
(13, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `id_classe` bigint(20) NOT NULL,
  `nom_classe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`id_classe`, `nom_classe`) VALUES
(1, '6e'),
(2, '5e'),
(3, '4e'),
(4, '3e');

-- --------------------------------------------------------

--
-- Table structure for table `coefficient`
--

CREATE TABLE `coefficient` (
  `id_coefficient` bigint(20) NOT NULL,
  `valeur` int(11) DEFAULT NULL,
  `id_classe` bigint(20) NOT NULL,
  `id_matiere` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coefficient`
--

INSERT INTO `coefficient` (`id_coefficient`, `valeur`, `id_classe`, `id_matiere`) VALUES
(1, 2, 1, 1),
(2, 2, 1, 2),
(3, 2, 1, 3),
(4, 2, 1, 4),
(5, 2, 1, 5),
(6, 2, 1, 6),
(7, 2, 1, 7),
(8, 2, 1, 8),
(9, 2, 2, 1),
(10, 2, 2, 2),
(11, 2, 2, 3),
(12, 2, 2, 4),
(13, 2, 2, 5),
(14, 2, 2, 6),
(15, 2, 2, 7),
(16, 2, 2, 8),
(17, 2, 3, 1),
(18, 2, 3, 2),
(19, 2, 3, 3),
(20, 2, 3, 4),
(21, 2, 3, 5),
(22, 2, 3, 6),
(23, 2, 3, 7),
(24, 2, 3, 8),
(25, 2, 4, 1),
(26, 2, 4, 2),
(27, 2, 4, 3),
(28, 2, 4, 4),
(29, 2, 4, 5),
(30, 2, 4, 6),
(31, 2, 4, 7),
(32, 2, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `detail_classe`
--

CREATE TABLE `detail_classe` (
  `id_detail_classe` bigint(20) NOT NULL,
  `conduite_classe` int(11) NOT NULL,
  `id_annee_scolaire` bigint(20) NOT NULL,
  `id_categorie` bigint(20) DEFAULT NULL,
  `id_classe` bigint(20) DEFAULT NULL,
  `id_professeur` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eleve`
--

CREATE TABLE `eleve` (
  `id_eleve` bigint(20) NOT NULL,
  `date_naiss` date DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inscription`
--

CREATE TABLE `inscription` (
  `id_inscription` bigint(20) NOT NULL,
  `date_inscription` date NOT NULL,
  `montant` bigint(20) NOT NULL,
  `id_detail_classe` bigint(20) NOT NULL,
  `id_eleve` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` bigint(20) NOT NULL,
  `nom_matiere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `nom_matiere`) VALUES
(1, 'Anglais'),
(2, 'EFS'),
(3, 'EPS'),
(4, 'Français'),
(5, 'Histoire / Géo'),
(6, 'Maths'),
(7, 'PC'),
(8, 'SVT');

-- --------------------------------------------------------

--
-- Table structure for table `moyenne`
--

CREATE TABLE `moyenne` (
  `id_moyenne` bigint(20) NOT NULL,
  `note` float NOT NULL,
  `semestre` varchar(255) DEFAULT NULL,
  `id_inscription` bigint(20) NOT NULL,
  `id_matiere` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `moyenne_semestre`
--

CREATE TABLE `moyenne_semestre` (
  `id_moyenne_semestre` bigint(20) NOT NULL,
  `note` float NOT NULL,
  `semestre` varchar(255) NOT NULL,
  `id_inscription` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE `note` (
  `id_note` bigint(20) NOT NULL,
  `note` float NOT NULL,
  `semestre` varchar(255) NOT NULL,
  `type_note` varchar(255) NOT NULL,
  `id_inscription` bigint(20) NOT NULL,
  `id_matiere` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

CREATE TABLE `professeur` (
  `id_professeur` bigint(20) NOT NULL,
  `date_naiss` date DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scolarite`
--

CREATE TABLE `scolarite` (
  `id_scolarite` bigint(20) NOT NULL,
  `date_versement` date NOT NULL,
  `mois` varchar(255) NOT NULL,
  `montant_versement` bigint(20) NOT NULL,
  `id_inscription` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) NOT NULL,
  `login` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annee_scolaire`
--
ALTER TABLE `annee_scolaire`
  ADD PRIMARY KEY (`id_annee_scolaire`),
  ADD UNIQUE KEY `UK_bahlg43hg5vun2d636h0scb8w` (`debut`),
  ADD UNIQUE KEY `UK_951jlchk8t30mqd9lors0qybx` (`fin`),
  ADD UNIQUE KEY `UK_i8f7n0sdce10xp1lol80o5d9y` (`statut`);

--
-- Indexes for table `bulletin`
--
ALTER TABLE `bulletin`
  ADD PRIMARY KEY (`id_bulletin`),
  ADD KEY `FKelqlc8vsx42domm8fdayhyi90` (`id_inscription`),
  ADD KEY `FKipi3gh4hxq915i37mjrnkmvk5` (`id_professeur`);

--
-- Indexes for table `categorie_classe`
--
ALTER TABLE `categorie_classe`
  ADD PRIMARY KEY (`id_categorie_classe`);

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`);

--
-- Indexes for table `coefficient`
--
ALTER TABLE `coefficient`
  ADD PRIMARY KEY (`id_coefficient`),
  ADD KEY `FKjfytax6pexm5ixghr7pjagvsk` (`id_classe`),
  ADD KEY `FK2cs0ycarmij0skti3an2x81sf` (`id_matiere`);

--
-- Indexes for table `detail_classe`
--
ALTER TABLE `detail_classe`
  ADD PRIMARY KEY (`id_detail_classe`),
  ADD KEY `FKpq2ylohsgw2v293hp8g28lmp6` (`id_annee_scolaire`),
  ADD KEY `FKer1rii6ljpah8cie2ita41vhq` (`id_categorie`),
  ADD KEY `FKhfwk5gtv6lyn374agcy0mn03v` (`id_classe`),
  ADD KEY `FK6a0tasu7tbqtnrfwrxtli2oxj` (`id_professeur`);

--
-- Indexes for table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id_eleve`),
  ADD UNIQUE KEY `UK_tj0b5oabvt2uyys676n2qsmbu` (`matricule`);

--
-- Indexes for table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id_inscription`),
  ADD KEY `FKh0snoe501v5ojr1d52lh5o0gl` (`id_detail_classe`),
  ADD KEY `FKbxdylcbhncf6gygyhg303o3n2` (`id_eleve`);

--
-- Indexes for table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_matiere`);

--
-- Indexes for table `moyenne`
--
ALTER TABLE `moyenne`
  ADD PRIMARY KEY (`id_moyenne`),
  ADD KEY `FK5ca2vxr54ggwn69rr3vs4h2dn` (`id_inscription`),
  ADD KEY `FKqlkdti0u7kov7yfg2sqwj3kp` (`id_matiere`);

--
-- Indexes for table `moyenne_semestre`
--
ALTER TABLE `moyenne_semestre`
  ADD PRIMARY KEY (`id_moyenne_semestre`),
  ADD KEY `FKbx1xi3f1262embf4l5181s4k4` (`id_inscription`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id_note`),
  ADD KEY `FKc3a6abmvyvmoqda6ymi0l5173` (`id_inscription`),
  ADD KEY `FKrifp5iv0petlpuwyaxpqng8md` (`id_matiere`);

--
-- Indexes for table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id_professeur`);

--
-- Indexes for table `scolarite`
--
ALTER TABLE `scolarite`
  ADD PRIMARY KEY (`id_scolarite`),
  ADD KEY `FKqumg92qvmj4rc24s1iy7ug91u` (`id_inscription`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annee_scolaire`
--
ALTER TABLE `annee_scolaire`
  MODIFY `id_annee_scolaire` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulletin`
--
ALTER TABLE `bulletin`
  MODIFY `id_bulletin` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorie_classe`
--
ALTER TABLE `categorie_classe`
  MODIFY `id_categorie_classe` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coefficient`
--
ALTER TABLE `coefficient`
  MODIFY `id_coefficient` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `detail_classe`
--
ALTER TABLE `detail_classe`
  MODIFY `id_detail_classe` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id_eleve` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id_inscription` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_matiere` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `moyenne`
--
ALTER TABLE `moyenne`
  MODIFY `id_moyenne` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moyenne_semestre`
--
ALTER TABLE `moyenne_semestre`
  MODIFY `id_moyenne_semestre` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
  MODIFY `id_note` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id_professeur` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scolarite`
--
ALTER TABLE `scolarite`
  MODIFY `id_scolarite` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bulletin`
--
ALTER TABLE `bulletin`
  ADD CONSTRAINT `FKelqlc8vsx42domm8fdayhyi90` FOREIGN KEY (`id_inscription`) REFERENCES `inscription` (`id_inscription`),
  ADD CONSTRAINT `FKipi3gh4hxq915i37mjrnkmvk5` FOREIGN KEY (`id_professeur`) REFERENCES `professeur` (`id_professeur`);

--
-- Constraints for table `coefficient`
--
ALTER TABLE `coefficient`
  ADD CONSTRAINT `FK2cs0ycarmij0skti3an2x81sf` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`),
  ADD CONSTRAINT `FKjfytax6pexm5ixghr7pjagvsk` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`);

--
-- Constraints for table `detail_classe`
--
ALTER TABLE `detail_classe`
  ADD CONSTRAINT `FK6a0tasu7tbqtnrfwrxtli2oxj` FOREIGN KEY (`id_professeur`) REFERENCES `professeur` (`id_professeur`),
  ADD CONSTRAINT `FKer1rii6ljpah8cie2ita41vhq` FOREIGN KEY (`id_categorie`) REFERENCES `categorie_classe` (`id_categorie_classe`),
  ADD CONSTRAINT `FKhfwk5gtv6lyn374agcy0mn03v` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `FKpq2ylohsgw2v293hp8g28lmp6` FOREIGN KEY (`id_annee_scolaire`) REFERENCES `annee_scolaire` (`id_annee_scolaire`);

--
-- Constraints for table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FKbxdylcbhncf6gygyhg303o3n2` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `FKh0snoe501v5ojr1d52lh5o0gl` FOREIGN KEY (`id_detail_classe`) REFERENCES `detail_classe` (`id_detail_classe`);

--
-- Constraints for table `moyenne`
--
ALTER TABLE `moyenne`
  ADD CONSTRAINT `FK5ca2vxr54ggwn69rr3vs4h2dn` FOREIGN KEY (`id_inscription`) REFERENCES `inscription` (`id_inscription`),
  ADD CONSTRAINT `FKqlkdti0u7kov7yfg2sqwj3kp` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`);

--
-- Constraints for table `moyenne_semestre`
--
ALTER TABLE `moyenne_semestre`
  ADD CONSTRAINT `FKbx1xi3f1262embf4l5181s4k4` FOREIGN KEY (`id_inscription`) REFERENCES `inscription` (`id_inscription`);

--
-- Constraints for table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FKc3a6abmvyvmoqda6ymi0l5173` FOREIGN KEY (`id_inscription`) REFERENCES `inscription` (`id_inscription`),
  ADD CONSTRAINT `FKrifp5iv0petlpuwyaxpqng8md` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`);

--
-- Constraints for table `scolarite`
--
ALTER TABLE `scolarite`
  ADD CONSTRAINT `FKqumg92qvmj4rc24s1iy7ug91u` FOREIGN KEY (`id_inscription`) REFERENCES `inscription` (`id_inscription`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
