-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 28 fév. 2020 à 09:25
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `assopeche`
--

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

DROP TABLE IF EXISTS `evenements`;
CREATE TABLE IF NOT EXISTS `evenements` (
  `idevenement` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `lieu` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `datedebut` date NOT NULL,
  `datefin` date NOT NULL,
  PRIMARY KEY (`idevenement`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `evenements`
--

INSERT INTO `evenements` (`idevenement`, `nom`, `lieu`, `datedebut`, `datefin`) VALUES
(1, 'W.E. découverte', 'Base de loisir Paris', '2020-03-14', '2020-03-15'),
(3, 'W.E. découverte', 'Base de loisir Paris', '2020-04-11', '2020-04-12'),
(4, 'W.E. découverte', 'Base de loisir Paris', '2020-05-09', '2020-05-10'),
(5, 'W.E. découverte', 'Base de loisir Paris', '2020-04-11', '2020-04-12'),
(6, 'W.E. découverte', 'Base de loisir Paris', '2020-05-09', '2020-05-10'),
(7, 'W.E. découverte', 'Base de loisir Paris', '2020-06-13', '2020-06-14'),
(8, 'W.E. découverte', 'Base de loisir Paris', '2020-07-11', '2020-07-12'),
(11, 'W.E. découverte', 'Base de loisir Paris', '2020-08-08', '2020-08-09'),
(12, 'W.E. découverte', 'Base de loisir Paris', '2020-09-12', '2020-09-13'),
(15, 'W.E. découverte', 'Base de loisir Paris', '2020-10-10', '2020-10-11'),
(16, 'W.E. découverte', 'Base de loisir Paris', '2020-11-14', '2020-11-15'),
(19, 'W.E. découverte', 'Base de loisir Paris', '2020-12-12', '2020-12-13'),
(21, 'Journée partages de conseils ', 'Local de l\'association', '2020-03-07', '2020-03-07'),
(22, 'Journée partages de conseils ', 'Local de l\'association', '2020-06-06', '2020-06-06'),
(25, 'Journée partages de conseils', 'Local de l\'association', '2020-09-05', '2020-09-05'),
(26, 'Journée partages de conseils', 'Local de l\'association', '2020-12-05', '2020-12-05'),
(27, 'Journée partages de conseils', 'Local de l\'association', '2020-09-05', '2020-09-05'),
(28, 'Journée partages de conseils', 'Local de l\'association', '2020-12-05', '2020-12-05'),
(29, 'Voyage Pêche du saumon au Québec', 'CANADA - Gaspésie', '2020-07-11', '2020-07-31'),
(30, 'Voyage Parc national de Glacier', 'MONTANA - Bozeman', '2020-08-08', '2020-08-23'),
(31, 'Pêche du saumon au Québec', 'CANADA - Gaspésie', '2019-08-10', '2019-08-24'),
(32, 'Parc national de Glacier', 'MONTANA - Bozeman', '2019-07-13', '2019-07-27'),
(35, 'Parc national de Glacier', 'MONTANA - Bozeman', '2018-07-14', '2018-07-28'),
(38, 'Pêche du saumon au Québec', 'CANADA - Gaspésie', '2018-08-11', '2018-08-25');

-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

DROP TABLE IF EXISTS `inscriptions`;
CREATE TABLE IF NOT EXISTS `inscriptions` (
  `idinscription` int(11) NOT NULL AUTO_INCREMENT,
  `idmembre` int(11) NOT NULL,
  `idevenement` int(11) NOT NULL,
  PRIMARY KEY (`idinscription`),
  KEY `idmembre` (`idmembre`,`idevenement`),
  KEY `idevenement` (`idevenement`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `inscriptions`
--

INSERT INTO `inscriptions` (`idinscription`, `idmembre`, `idevenement`) VALUES
(5, 1, 35),
(1, 1, 38),
(3, 2, 38),
(6, 5, 35),
(4, 5, 38);

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `idmembre` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `adresse` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` enum('debutant','intermediaire','expert') COLLATE utf8_unicode_ci NOT NULL,
  `dateinscription` date NOT NULL,
  PRIMARY KEY (`idmembre`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`idmembre`, `nom`, `prenom`, `age`, `adresse`, `niveau`, `dateinscription`) VALUES
(1, 'nomexpert1', 'prenomexpert1', 44, '1 rue du saumon, Paris', 'expert', '2018-01-08'),
(2, 'nomexpert2', 'prenomexpert2', 52, '2 rue de la paix, Paris', 'expert', '2018-02-02'),
(5, 'nomexpert3', 'prenomexpert3', 31, '15 rue de la truite, Paris', 'expert', '2018-07-09'),
(6, 'nominterm1', 'prenominterm1', 28, '22 rue de l\'alerte, Orléans', 'intermediaire', '2019-03-15'),
(9, 'nominterm2', 'prenominterm2', 23, '12 allée des oliviers, Orléans', 'intermediaire', '2019-03-04'),
(11, 'nominterm3', 'prenominterm3', 46, '27 rue du puits, Nanterre', 'intermediaire', '2019-04-11'),
(13, 'nomdebutant1', 'prenomdebutant1', 26, '13 avenue des banquiers, La Défense', 'debutant', '2019-11-06'),
(15, 'nomdebutant2', 'prenomdebutant2', 23, '6 place de l\'église, Meudon', 'debutant', '2019-12-24'),
(17, 'nomdebutant3', 'prenomdebutant3', 18, '4 place du marais, Paris', 'debutant', '2020-02-01');

-- --------------------------------------------------------

--
-- Structure de la table `produitsneufs`
--

DROP TABLE IF EXISTS `produitsneufs`;
CREATE TABLE IF NOT EXISTS `produitsneufs` (
  `idproduit` int(11) NOT NULL AUTO_INCREMENT,
  `typeproduit` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `refproduit` int(11) NOT NULL,
  `numproduit` int(11) NOT NULL,
  `nomproduit` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `prixproduit` int(11) NOT NULL,
  `qtestock` int(11) NOT NULL,
  `adresseimage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idproduit`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produitsneufs`
--

INSERT INTO `produitsneufs` (`idproduit`, `typeproduit`, `refproduit`, `numproduit`, `nomproduit`, `prixproduit`, `qtestock`, `adresseimage`) VALUES
(1, 'hameçon', 1, 1, 'hameçon N°10', 1, 100, './images/hameçons/hameçonNum10.png'),
(2, 'hameçon', 2, 1, 'hameçon N°12', 1, 100, './images/hameçons/hameçonNum12.png'),
(3, 'hameçon', 3, 1, 'hameçon N°14', 1, 100, './images/hameçon/hameçonNum14.png'),
(4, 'hameçon', 4, 1, 'hameçon N°16', 1, 100, './images/hameçon/hameçonNum16.png'),
(7, 'canne', 5, 1, 'canne bambou 3 mètres', 4, 20, './images/canne/canneBambou3m.png'),
(8, 'canne', 6, 1, 'canne bambou 5 mètres', 5, 20, './images/canne/canneBambou5m.png'),
(9, 'canne', 7, 1, 'canne fibre 5 mètres', 6, 50, './images/canne/canneFibre5m.png'),
(10, 'canne', 8, 1, 'canne fibre 10 mètres', 10, 50, './images/canne/canneFibre10m.png');

-- --------------------------------------------------------

--
-- Structure de la table `produitsoccasion`
--

DROP TABLE IF EXISTS `produitsoccasion`;
CREATE TABLE IF NOT EXISTS `produitsoccasion` (
  `idmembre` int(11) NOT NULL,
  `typeproduit` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `nomproduit` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `prixproduit` int(11) NOT NULL,
  `adresseimage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  KEY `idproduit` (`idmembre`),
  KEY `nomproduit` (`nomproduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ventesneufs`
--

DROP TABLE IF EXISTS `ventesneufs`;
CREATE TABLE IF NOT EXISTS `ventesneufs` (
  `idvente` int(11) NOT NULL AUTO_INCREMENT,
  `idmembre` int(11) NOT NULL,
  `idproduit` int(11) NOT NULL,
  PRIMARY KEY (`idvente`),
  KEY `idmembre` (`idmembre`,`idproduit`),
  KEY `idproduit` (`idproduit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `ventesneufs`
--

INSERT INTO `ventesneufs` (`idvente`, `idmembre`, `idproduit`) VALUES
(1, 1, 10),
(2, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ventesoccasion`
--

DROP TABLE IF EXISTS `ventesoccasion`;
CREATE TABLE IF NOT EXISTS `ventesoccasion` (
  `idvente` int(11) NOT NULL AUTO_INCREMENT,
  `nomproduit` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `idmembre` int(11) NOT NULL,
  PRIMARY KEY (`idvente`),
  KEY `idmembre` (`idmembre`),
  KEY `nomproduit` (`nomproduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD CONSTRAINT `inscriptions_ibfk_1` FOREIGN KEY (`idmembre`) REFERENCES `membres` (`idmembre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscriptions_ibfk_2` FOREIGN KEY (`idevenement`) REFERENCES `evenements` (`idevenement`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produitsoccasion`
--
ALTER TABLE `produitsoccasion`
  ADD CONSTRAINT `produitsoccasion_ibfk_1` FOREIGN KEY (`idmembre`) REFERENCES `membres` (`idmembre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ventesneufs`
--
ALTER TABLE `ventesneufs`
  ADD CONSTRAINT `ventesneufs_ibfk_1` FOREIGN KEY (`idmembre`) REFERENCES `membres` (`idmembre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventesneufs_ibfk_2` FOREIGN KEY (`idproduit`) REFERENCES `produitsneufs` (`idproduit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ventesoccasion`
--
ALTER TABLE `ventesoccasion`
  ADD CONSTRAINT `ventesoccasion_ibfk_1` FOREIGN KEY (`idmembre`) REFERENCES `membres` (`idmembre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventesoccasion_ibfk_2` FOREIGN KEY (`nomproduit`) REFERENCES `produitsoccasion` (`nomproduit`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
