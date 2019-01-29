-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 29 jan. 2019 à 10:07
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `emp_dept`
--

-- --------------------------------------------------------

--
-- Structure de la table `dept`
--

DROP TABLE IF EXISTS `dept`;
CREATE TABLE IF NOT EXISTS `dept` (
  `DEPTNO` int(11) NOT NULL DEFAULT '0',
  `DNAME` varchar(14) DEFAULT NULL,
  `LOC` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dept`
--

INSERT INTO `dept` (`DEPTNO`, `DNAME`, `LOC`) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- --------------------------------------------------------

--
-- Structure de la table `emp`
--

DROP TABLE IF EXISTS `emp`;
CREATE TABLE IF NOT EXISTS `emp` (
  `EMPNO` int(11) NOT NULL DEFAULT '0',
  `ENAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `MGR` int(11) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` decimal(7,2) DEFAULT NULL,
  `COMM` decimal(7,2) DEFAULT NULL,
  `DEPTNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPNO`),
  KEY `FK_EMP_DEPT` (`DEPTNO`),
  KEY `emp_ibfk_1` (`MGR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `emp`
--

INSERT INTO `emp` (`EMPNO`, `ENAME`, `JOB`, `MGR`, `HIREDATE`, `SAL`, `COMM`, `DEPTNO`) VALUES
(7369, 'SMITH', 'CLERK', 7902, '2018-10-19', NULL, NULL, 40),
(7499, 'ALLEN', 'SALESMAN', 7698, '2018-10-19', NULL, NULL, 40),
(7521, 'WARD', 'SALESMAN', 7698, '2018-10-19', NULL, NULL, 40),
(7566, 'JONES', 'MANAGER', 7839, '2018-10-19', NULL, NULL, 40),
(7654, 'MARTIN', 'SALESMAN', 7698, '2018-10-19', NULL, NULL, 40),
(7698, 'BLAKE', 'MANAGER', 7839, '2018-10-19', NULL, NULL, 40),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', '2450.00', NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '2018-10-19', NULL, NULL, 40),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', '5000.00', NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '2018-10-19', NULL, NULL, 40),
(7876, 'ADAMS', 'CLERK', 7788, '2018-10-19', NULL, NULL, 40),
(7900, 'JAMES', 'CLERK', 7698, '2018-10-19', NULL, NULL, 40),
(7902, 'FORD', 'ANALYST', 7566, '2018-10-19', NULL, NULL, 40),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', '1300.00', NULL, 10);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `FK_EMP_DEPT` FOREIGN KEY (`DEPTNO`) REFERENCES `dept` (`DEPTNO`),
  ADD CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`MGR`) REFERENCES `emp` (`EMPNO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
