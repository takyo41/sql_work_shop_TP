

--Exercice 7

-- Ajout de réservations cohérentes pour tester les requêtes avancées
INSERT INTO Reservation (DateDebut, DateFin, Quantite, IdUtilisateur, IdMateriel) VALUES
('2025-06-01 09:00:00', '2025-06-01 17:00:00', 1, 1, 1), -- Alice Martin réserve une table
('2025-06-02 08:00:00', '2025-06-02 12:00:00', 2, 2, 1), -- Lucas Durand réserve 2 tables
('2025-06-03 14:00:00', '2025-06-03 18:00:00', 1, 3, 2), -- Emma Petit réserve une chaise
('2025-06-04 09:00:00', '2025-06-04 11:00:00', 1, 4, 2), -- Hugo Moreau réserve une chaise
('2025-06-05 10:00:00', '2025-06-05 12:00:00', 1, 5, 2), -- Léa Lefevre réserve une chaise
('2025-06-06 13:00:00', '2025-06-06 15:00:00', 1, 6, 4), -- Nathan Girard réserve un ordinateur portable
('2025-06-07 09:30:00', '2025-06-07 11:30:00', 1, 7, 4), -- Chloé Garcia réserve un ordinateur portable
('2025-06-08 08:00:00', '2025-06-08 10:00:00', 1, 8, 4), -- Tom Bernard réserve un ordinateur portable
('2025-06-09 09:00:00', '2025-06-09 13:00:00', 1, 9, 4), -- Jade Roux réserve un ordinateur portable
('2025-06-10 10:00:00', '2025-06-10 14:00:00', 1, 10, 5); -- Louis Vincent réserve un clavier







--1 : Afficher tous les utilisateurs ayant emprunté au moins un équipement
SELECT DISTINCT u.*
FROM Utilisateur u
JOIN Reservation r ON u.IdUtilisateur = r.IdUtilisateur;

--Ici JOIN permet de relier les tables réservations et utilisateur avec la clé étrangères IdUtilisateur 
-- Le DISTINCT permet de ne pas afficher plusieurs fois les mêmes utilisateurs.
--u.* permet d'afficher toutes les colones de la table u (utilisateur)







--2 : Afficher les équipements n’ayant jamais été empruntés
SELECT m.*
FROM Materiel m
LEFT JOIN Reservation r ON m.IdMateriel = r.IdMateriel
WHERE r.IdMateriel IS NULL;

--DAns cet exemple, on utilise LEFT JOIN, ce qui nous permet de recuperer tout les materiels même ceux qui ne sont pas présent dans une réservations
--Avec le WHERE, on filtre et on garde uniquement les materiels qui ne sont pas associé avec une résa grace au IS NULL (si le IdMateriel dans la table réservation est NULL)









--3 : Afficher les équipements ayant été emprunté plus de 3 fois
SELECT m.*, COUNT(r.IdReservation) AS NbEmprunts
FROM Materiel m
JOIN Reservation r ON m.IdMateriel = r.IdMateriel
GROUP BY m.IdMateriel
HAVING COUNT(r.IdReservation) > 3;

--Le JOIN relie la table reservatio et materiels
-- le GROUP BY permet de regrouper les lignes par id de materiels afin de compter combien de fois chaque materiel a été réservé
-- le COUNT permet de compter
--HAVING COUNT(...) > 3 on garde seulement les matériels réservés plus de 3 fois










--4 : Afficher le nombre d’emprunts pour chaque utilisateur, ordonné par numéro d'étudiant. 
--    Les utilisateurs n'ayant pas de réservations en cours doivent également être affichés avec la valeur 0 dans le nombre d'emprunts
SELECT u.Nom, u.Prenom, u.NumBadge, COUNT(r.IdReservation) AS NombreEmprunts
FROM Utilisateur u
LEFT JOIN Reservation r ON u.IdUtilisateur = r.IdUtilisateur
GROUP BY u.IdUtilisateur
ORDER BY u.NumBadge;

--Le AS permet de donner un nom a une nouvelle colone
--LEFT JOIN, on garde tous les utilisateurs, meme ceux sans réservation
--COUNT(...) : on compte 
--GROUP BY
--ORDER BY u.NumBagde permet de trier à partir du numéro de badge
 