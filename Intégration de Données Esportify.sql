INSERT INTO `utilisateur` (`username`, `password`, `role`) VALUES
('admin', 'password123', 'administrateur'),
('employee1', 'password123', 'organisateur'),
('player1', 'password123', 'joueur'),
('player2', 'password123', 'joueur');

INSERT INTO `events` (`name`, `description`, `date`, `time`, `max_players`, `created_by`, `status`, `approved_by`) VALUES
('Tournoi de Printemps', 'Tournoi annuel de printemps pour les joueurs de niveau intermédiaire', '2024-11-20', '18:00:00', 16, 3, 'approved', 2),
('Tournoi d\'Été', 'Tournoi de jeu avancé pour experts', '2024-12-15', '20:00:00', 8, 4, 'pending', NULL);

INSERT INTO `eventregistrations` (`user_id`, `event_id`, `registration_date`) VALUES
(3, 1, '2024-11-13 10:00:00'),
(4, 1, '2024-11-13 10:05:00'),
(3, 2, '2024-11-13 10:10:00');

INSERT INTO `performances` (`score`, `rank`, `created_at`, `user_id`, `event_id`)
VALUES (1500, 1, NOW(), 1, 1), (1200, 2, NOW(), 2, 2);

INSERT INTO `chatmessages` (`message`, `timestamp`, `event_id`, `user_id`) VALUES
('Bonjour à tous, prêt pour le tournoi ?', '2024-11-13 18:00:00', 3, 3),
('Oui, impatient de commencer!', '2024-11-13 18:01:00', 4, 4),
('Quelqu\'un de dispo pour s\'entraîner ?', '2024-11-13 18:15:00', 5, 5);