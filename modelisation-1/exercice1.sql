

--Exercice 1




--UTILISATEUR--



--Question 2 :
CREATE TABLE Utilisateur (
   IdUtilisateur INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   NumBadge INT,
   Email VARCHAR(50)
);





--Question 3 :
INSERT INTO Utilisateur (Nom, Prenom, NumBadge, Email) VALUES
('Martin', 'Alice', 1001, 'alice.martin@example.com'),
('Durand', 'Lucas', 1002, 'lucas.durand@example.com'),
('Petit', 'Emma', 1003, 'emma.petit@example.com'),
('Moreau', 'Hugo', 1004, 'hugo.moreau@example.com'),
('Lefevre', 'Léa', 1005, 'lea.lefevre@example.com'),
('Girard', 'Nathan', 1006, 'nathan.girard@example.com'),
('Garcia', 'Chloé', 1007, 'chloe.garcia@example.com'),
('Bernard', 'Tom', 1008, 'tom.bernard@example.com'),
('Roux', 'Jade', 1009, 'jade.roux@example.com'),
('Vincent', 'Louis', 1010, 'louis.vincent@example.com'),
('Fournier', 'Manon', 1011, 'manon.fournier@example.com'),
('Lopez', 'Arthur', 1012, 'arthur.lopez@example.com'),
('Morel', 'Inès', 1013, 'ines.morel@example.com'),
('Faure', 'Gabriel', 1014, 'gabriel.faure@example.com'),
('Andre', 'Camille', 1015, 'camille.andre@example.com'),
('Dupont', 'Claire', 1016, 'claire.dupont@example.com'),
('Michel', 'Pierre', 1017, 'pierre.michel@example.com'),
('Leblanc', 'Sophie', 1018, 'sophie.leblanc@example.com'),
('Tanguy', 'Julien', 1019, 'julien.tanguy@example.com'),
('Lemoine', 'Marion', 1020, 'marion.lemoine@example.com');




--MATERIEL--


--Question 2 : 
CREATE TABLE Materiel (
   IdMateriel INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   QuantiteDisponible INT,
   Categorie VARCHAR(50)
);


--Question 3 :
INSERT INTO Materiel (QuantiteDisponible, Categorie) VALUES
(20, 'Table'),
(50, 'Chaise'),
(10, 'Bureau'),
(15, 'Ordinateur Portable'),
(25, 'Clavier'),
(30, 'Souris'),
(12, 'Écran'),
(8, 'Projecteur'),
(5, 'Imprimante'),
(40, 'Casque Audio');





--RESERVATION--




--Question 2 :
CREATE TABLE Reservation (
   IdReservation INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   DateDebut TIMESTAMP,
   DateFin TIMESTAMP,
   Quantite INT,
   IdUtilisateur INT NOT NULL,
   IdMateriel INT,
   FOREIGN KEY (IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur),
   FOREIGN KEY (IdMateriel) REFERENCES Materiel(IdMateriel)
);

--Question 3 :
INSERT INTO Reservation (DateDebut, DateFin, Quantite, IdUtilisateur, IdMateriel) VALUES
('2025-05-20 09:00:00', '2025-05-20 17:00:00', 2, 1, 4),  -- Ordinateur
('2025-05-21 08:30:00', '2025-05-21 12:00:00', 4, 2, 2),  -- Chaises
('2025-05-22 13:00:00', '2025-05-22 16:00:00', 1, 3, 8),  -- Projecteur
('2025-05-23 09:00:00', '2025-05-23 17:00:00', 1, 4, 3),  -- Bureau
('2025-05-24 10:00:00', '2025-05-24 15:00:00', 1, 5, 9),  -- Imprimante
('2025-05-25 14:00:00', '2025-05-25 18:00:00', 3, 6, 1),  -- Tables
('2025-05-26 08:00:00', '2025-05-26 12:00:00', 2, 7, 5),  -- Claviers
('2025-05-27 11:00:00', '2025-05-27 17:00:00', 2, 8, 6),  -- Souris
('2025-05-28 09:00:00', '2025-05-28 16:00:00', 1, 9, 7),  -- Écran
('2025-05-29 13:30:00', '2025-05-29 17:00:00', 2, 10, 10);-- Casque audio