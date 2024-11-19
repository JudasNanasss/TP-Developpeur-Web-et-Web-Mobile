-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 13 nov. 2024 à 18:02
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `esportify`
--

-- --------------------------------------------------------

--
-- Structure de la table `chatmessages`
--

CREATE TABLE `chatmessages` (
  `message_id` int(11) NOT NULL COMMENT 'Identifiant unique du message',
  `event_id` int(11) NOT NULL COMMENT 'Référence à event_id',
  `user_id` int(11) NOT NULL COMMENT 'Référence à user_id',
  `message` text NOT NULL COMMENT 'Contenu du message',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date et heure du message'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `eventregistrations`
--

CREATE TABLE `eventregistrations` (
  `registration_id` int(11) NOT NULL COMMENT 'Identifiant unique d’inscription',
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '	Date d’inscription',
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) UNSIGNED NOT NULL COMMENT 'Identifiant unique de l’événement',
  `name` varchar(255) NOT NULL COMMENT 'Nom de l''événement',
  `description` varchar(255) NOT NULL COMMENT 'Description de l''événement',
  `date` date NOT NULL COMMENT 'Date de l''événement',
  `time` time NOT NULL COMMENT 'Heure de l''évenemnt',
  `max_players` int(11) NOT NULL COMMENT 'Nombre maximum de joueurs',
  `created_by` int(11) NOT NULL COMMENT 'Référence à user_id (créateur de l’événement)',
  `status` enum('pending','approved','rejected') NOT NULL COMMENT 'Statut de la demande',
  `approved_by` int(11) NOT NULL COMMENT 'Référence à user_id (employé/administrateur ayant approuvé l’événement)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `performances`
--

CREATE TABLE `performances` (
  `performance_id` int(11) NOT NULL COMMENT 'Identifiant unique de performance',
  `user_id` int(11) NOT NULL COMMENT 'Référence à user_id',
  `event_id` int(11) NOT NULL COMMENT 'Référence à event_id',
  `score` decimal(11,0) NOT NULL COMMENT 'Score du joueur',
  `rank` decimal(11,0) NOT NULL COMMENT 'Classement du joueur',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '	Date d''enregistrement'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `score`
--

CREATE TABLE `score` (
  `score_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `score_value` decimal(10,0) NOT NULL,
  `score_to` int(11) NOT NULL COMMENT 'Référence à user_id',
  `score_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date de l’attribution'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `user_id` int(11) NOT NULL COMMENT 'Clé Primaire',
  `username` varchar(255) NOT NULL COMMENT 'Pseudo unique',
  `email` varchar(255) NOT NULL COMMENT 'Adresse email de l’utilisateur',
  `password` varchar(255) NOT NULL COMMENT 'Mot de passe',
  `role` enum('joueur','organisateur','administrateur') NOT NULL COMMENT 'Rôle de l’utilisateur',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date de création du compte'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chatmessages`
--
ALTER TABLE `chatmessages`
  ADD PRIMARY KEY (`message_id`),
  ADD UNIQUE KEY `event_id` (`event_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `eventregistrations`
--
ALTER TABLE `eventregistrations`
  ADD PRIMARY KEY (`registration_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`event_id`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD UNIQUE KEY `created_by` (`created_by`),
  ADD UNIQUE KEY `approved_by` (`approved_by`);

--
-- Index pour la table `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`performance_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `event_id` (`event_id`);

--
-- Index pour la table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`score_id`),
  ADD UNIQUE KEY `event_id` (`event_id`),
  ADD UNIQUE KEY `score_to` (`score_to`),
  ADD UNIQUE KEY `score_to_2` (`score_to`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chatmessages`
--
ALTER TABLE `chatmessages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique du message', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `eventregistrations`
--
ALTER TABLE `eventregistrations`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique d’inscription', AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique de l’événement', AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `performances`
--
ALTER TABLE `performances`
  MODIFY `performance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique de performance', AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `score`
--
ALTER TABLE `score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé Primaire', AUTO_INCREMENT=105;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
