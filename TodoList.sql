-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 16 jan. 2025 à 16:09
-- Version du serveur : 8.0.40-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `TodoList`
--

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id_message` int NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id_message`, `message`) VALUES
(1, 'bonjour message test\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id_question` int NOT NULL,
  `question` varchar(255) NOT NULL,
  `bonne_reponse` varchar(255) NOT NULL,
  `theme_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id_question`, `question`, `bonne_reponse`, `theme_id`) VALUES
(3, 'Quel est le premier président des États-Unis ?', 'George Washington', 1),
(4, 'Quel est le plus grand pays du monde ?', 'Russie', 2),
(5, 'Qui est l’empereur a avoir le plus de enfant ?', 'Gengis Khan', 1);

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

CREATE TABLE `themes` (
  `id_Theme` int NOT NULL,
  `theme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `themes`
--

INSERT INTO `themes` (`id_Theme`, `theme`) VALUES
(1, 'Histoire'),
(2, 'Geographie');

-- --------------------------------------------------------

--
-- Structure de la table `Todo`
--

CREATE TABLE `Todo` (
  `id_Message` int NOT NULL,
  `Message` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Todo`
--

INSERT INTO `Todo` (`id_Message`, `Message`, `user`) VALUES
(1, 'bonjour tu a reussie a recuperer le message', 'john doe'),
(3, 'bonjounr', 'gkgkgkg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'user',
  `email` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `createdAT`, `role`, `email`, `nom`, `prenom`) VALUES
(6, 'lounis', '$2b$10$TCghrbmP8bhqThoHeDX5suu30Jc2161NjmwDieRzxT/HhblRox5Cq', '2024-12-18 10:47:22', NULL, '', '', ''),
(7, 'bob', '$2b$10$dfOfo8ZW5RAzByckU.EqO.MLJNo9JxOQaTRRWiLcpQeW3YzJzS4X.', '2024-12-18 11:00:00', NULL, '', '', ''),
(9, 'greg', '$2b$10$P.2EMQW4rdaJrg/jRBveT.vDrAswcB96KvefdxyVFj5BAY1vmBlJi', '2024-12-18 11:20:49', NULL, '', '', ''),
(16, 'test', '$2b$10$cT1yRYBxYxcgsEPHir2G0.w.L2UKp2Dc9ILPJaibKS80r97C7k1Mu', '2024-12-23 14:52:10', NULL, '', '', ''),
(17, 'fredo', '$2b$10$6bZmyiBCBBZZoz0e4a4xzeydTwf2.F1kiuwgb.0swvQfVlDAUBVFW', '2025-01-06 12:25:09', 'user', '', '', ''),
(18, 'fre', '$2b$10$p2PKu6/je7VjJLYCT/QW.ev4kMcBVT0bh7s8WBDUdaOg07IByaIHO', '2025-01-07 14:05:57', 'user', '', '', ''),
(19, 'fre', '$2b$10$rjMpGoo7ML11jLdHIdv6e.yrtnJpjybt7jgPXxnjZS3/dFjQX8zU6', '2025-01-07 14:09:20', 'user', '', '', ''),
(20, 'fre', '$2b$10$lWLnW7jOrw0Y69dP9zvI9OOO2IYXCMgRD4HQKJEAkNeKs.9WnbjnW', '2025-01-07 14:35:44', 'user', '', '', ''),
(21, 'fre', '$2b$10$G1cSnyipzV7y5My82PZG8eHh8nUskVFUxp.6CQ.MEBpR3UGleQp06', '2025-01-07 14:36:07', 'user', '', '', ''),
(22, 'fre', '$2b$10$ve50U2SUPE6pXUjYY779GOX9G7ehdWeSXxnCuAJKRUa4s2runl0pK', '2025-01-07 14:37:41', 'user', '', '', ''),
(23, 'fre', '$2b$10$wOtH.VsSDgr2ZCMnGAZ7bezfJuJwtAaJrysv2XGrHQjVREl67lh2W', '2025-01-07 14:37:58', 'user', '', '', ''),
(24, 'aaa', '$2b$10$Eak7ttvnQYHmEsljAamd.eOHLO/yICQiKNk32xbYHTPI1lE5VdwNm', '2025-01-07 14:38:16', 'user', '', '', ''),
(25, 'aaa', '$2b$10$IFoWCcbnCsDItPLpU6movuvZ9k5Q2QrLQDSTqW2.mA5z2aApMEbPm', '2025-01-07 14:40:38', 'user', '', '', ''),
(26, 'aaa', '$2b$10$UVw1.S32SCzWtmSM3BwJQeDZOOCqjDrp7emAuYGA6l5NI84syxMHa', '2025-01-07 14:40:52', 'user', '', '', ''),
(27, 'aaa', '$2b$10$vxDrhc4EMBfgaGmR/OnXPe0PR2rVg/P98HD5QYhkcGjfCvtpkTkHq', '2025-01-07 14:41:26', 'user', '', '', ''),
(28, 'gg', '$2b$10$5AFspDLRGkIbpj1wEQPfj.Ep7r8CloO95u1Wi5KUL0ZALT9IxW962', '2025-01-07 15:13:51', 'user', '', '', ''),
(29, 'ggg', '$2b$10$w/Egf3iPhxpmQVuxCqsoCurGDn.H3dlweiDXrnfxKmaIopeH7jRGe', '2025-01-07 15:16:31', 'user', '', '', ''),
(30, 'lou', '$2b$10$87b7eI7V/18WIx.RH.l7eOzwCp9RfDzLCdcw0/YUd5BICkvrOx/ye', '2025-01-08 08:45:54', 'user', '', '', ''),
(31, 'aze', '$2b$10$TRLIoVNgkm78k0oGnDcV1OV/G.xEhcFu0xYXd.VHWQj/ZWB2EFNeq', '2025-01-08 08:57:35', 'user', '', '', ''),
(32, 'jobil', '$2b$10$w1K2eiLhU1QB65VdlZlQeumIupftGD6uBJHSn9ZfCOjyhtiz1rC2a', '2025-01-08 08:58:27', 'user', '', '', ''),
(33, 'rere', '$2b$10$77/b20ZzCUryzGrsCo4xeOuOfXjxXhudVL9VeVdaBa9Pe0xe01r9u', '2025-01-08 09:57:35', 'user', '', '', ''),
(34, 'trtrtr', '$2b$10$8o50bntuBmA/FqqVJCBzjOVywLkdhOrTSv3BvHchlsjiBWpZ4bFpy', '2025-01-08 10:02:02', 'user', '', '', ''),
(35, 'uuuu', '$2b$10$JVS63ybmfyb1MRAaLoSY4uKCMkwEoq2MzBrU1Ezm8mRiSgPLVNr3a', '2025-01-08 10:02:19', 'user', '', '', ''),
(36, 'rrr', '$2b$10$mse8PM/V/JnbZdJbRcpmhODNxvj745XSqmVzL2kOSp6kylw7jK7xO', '2025-01-08 10:02:40', 'user', '', '', ''),
(37, 'ttt', '$2b$10$WYeC52ugtgYRl5jyYcU0q.0g1lUShbxeHKr7/JldnsU8YNSsOxj/i', '2025-01-08 10:03:00', 'user', '', '', ''),
(38, 'iiii', '$2b$10$1933k01K.ih6eu0jPLom6.U1mLRWAJTzlg41mRS25OCT1tgvMhjq.', '2025-01-08 10:07:24', 'user', '', '', ''),
(39, 'gggg', '$2b$10$j.9CpSpyk/LPQnK0j/epU.0je58jNvd8VOngsbOcCtcUGspd8tr7S', '2025-01-08 14:35:40', 'user', '', '', ''),
(40, 'franck', '2222', '2025-01-14 09:58:54', 'user', 'gg@iii.fr', 'groge', 'hhh'),
(41, 'frank', '$2b$10$m4oNJx9MF1ewZEVA3k7zLejIu5LoDfRoLDbH9Ete1eCxOCBHqcxhW', '2025-01-14 14:45:01', 'user', 'ggg@gg.g', 'do', 'john'),
(42, 'mehdy', '$2b$10$bdfTCe9nVPNPoaUun.S0qOYUN./xx72a3vYFqMI.Tr3P9qQepwoY.', '2025-01-15 12:29:15', 'user', 'lolo@ggg.fr', 'schot', 'medy');

-- --------------------------------------------------------

--
-- Structure de la table `vueForm`
--

CREATE TABLE `vueForm` (
  `idUser` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `vueForm`
--

INSERT INTO `vueForm` (`idUser`, `name`, `password`, `email`, `createdAt`) VALUES
(1, 'garo', '$2b$10$C2Y9zFdtXJrj0nVmQMsHBeVIau.BEtu0zKtd9FFHyOMcmmkQ9WgES', 'garo@garo.fr', '2025-01-09 14:48:26'),
(2, 'garo1', '$2b$10$8VjqGAspyRQfA64aTebsrOmwHeYm3uSL6Mn.e9dhWSx7kcorvIZT.', 'garo@garo.fr', '2025-01-09 14:50:10');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `theme_key` (`theme_id`);

--
-- Index pour la table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id_Theme`);

--
-- Index pour la table `Todo`
--
ALTER TABLE `Todo`
  ADD PRIMARY KEY (`id_Message`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vueForm`
--
ALTER TABLE `vueForm`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id_question` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `themes`
--
ALTER TABLE `themes`
  MODIFY `id_Theme` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Todo`
--
ALTER TABLE `Todo`
  MODIFY `id_Message` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `vueForm`
--
ALTER TABLE `vueForm`
  MODIFY `idUser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `theme_key` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id_Theme`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
