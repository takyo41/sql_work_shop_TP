

--Exercie 8 :


--1 : On ajoute la table Disponibilite

CREATE TABLE Disponibilite (
    IdDisponibilite INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IdMateriel INT NOT NULL,
    DateDebut TIMESTAMP NOT NULL,
    DateFin TIMESTAMP NOT NULL,
    FOREIGN KEY (IdMateriel) REFERENCES Materiel(IdMateriel)
);



--2 : Modification de la table Reservation

ALTER TABLE Reservation
ADD COLUMN IdDisponibilite INT,
ADD CONSTRAINT fk_disponibilite
    FOREIGN KEY (IdDisponibilite)
    REFERENCES Disponibilite(IdDisponibilite);


--On ajoute les données dans la table disponibilite
INSERT INTO Disponibilite (IdMateriel, DateDebut, DateFin) VALUES
(1, '2025-05-01 00:00:00', '2025-06-30 23:59:59'),  -- Table
(2, '2025-05-01 00:00:00', '2025-06-30 23:59:59'),  -- Chaise
(3, '2025-05-01 00:00:00', '2025-06-30 23:59:59'),  -- Bureau
(4, '2025-05-01 00:00:00', '2025-06-30 23:59:59'),  -- Ordinateur Portable
(5, '2025-05-01 00:00:00', '2025-06-30 23:59:59'),  -- Clavier
(6, '2025-05-01 00:00:00', '2025-06-30 23:59:59'),  -- Souris
(7, '2025-05-01 00:00:00', '2025-06-30 23:59:59'),  -- Écran
(8, '2025-05-01 00:00:00', '2025-06-30 23:59:59'),  -- Projecteur
(9, '2025-05-01 00:00:00', '2025-06-30 23:59:59'),  -- Imprimante
(10, '2025-05-01 00:00:00', '2025-06-30 23:59:59'); -- Casque Audio


-- On met a jour la table reservation avec les idDisponibilite

UPDATE Reservation r
SET IdDisponibilite = (
    SELECT d.IdDisponibilite
    FROM Disponibilite d
    WHERE d.IdMateriel = r.IdMateriel
      AND r.DateDebut >= d.DateDebut
      AND r.DateFin <= d.DateFin
    LIMIT 1
);





--4 : Vérifier la disponibilité avant réservation 

SELECT 
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM Disponibilite d
            WHERE d.IdMateriel = 4
              AND '2025-06-01 10:00:00' >= d.DateDebut
              AND '2025-06-01 16:00:00' <= d.DateFin
        )
        THEN 'DISPONIBLE'
        ELSE 'NON DISPONIBLE'
    END AS Disponibilite;

-- Avec cette requete, on recupere DISPONIBLE, si le materiel d'id 4 est disponible entre le '2025-06-01 10:00:00' et le '2025-06-01 16:00:00'





--5 : gérer les disponibilités du matériel
INSERT INTO Reservation (DateDebut, DateFin, Quantite, IdUtilisateur, IdMateriel, IdDisponibilite)
VALUES (
    '2025-06-01 10:00:00',
    '2025-06-01 16:00:00',
    1,
    1,   -- IdUtilisateur
    4,   -- IdMateriel
    (SELECT IdDisponibilite
     FROM Disponibilite
     WHERE IdMateriel = 4
       AND '2025-06-01 10:00:00' >= DateDebut
       AND '2025-06-01 16:00:00' <= DateFin
     LIMIT 1)
);




--6 : Gestion des dispos (ajout, modif, suppression)


--Ajouter une nouvelle période de disponibilité
INSERT INTO Disponibilite (IdMateriel, DateDebut, DateFin)
VALUES (4, '2025-07-01 08:00:00', '2025-07-31 18:00:00');


--Modifier une periode de disponibilité existante
UPDATE Disponibilite
SET DateDebut = '2025-05-01 08:00:00',
    DateFin = '2025-06-30 18:00:00'
WHERE IdDisponibilite = 1;


--Supprimer une période(seulement si pas de réservation associée)
DELETE FROM Disponibilite
WHERE IdDisponibilite = 1;
--Exemple ne fonctionne pas car l'idDisponibilité = 1 est deja utilisé dans la table réservation


--7 : Test final

-- Test de vérification
SELECT 
    r.IdReservation,
    m.Categorie,
    r.DateDebut,
    r.DateFin,
    d.DateDebut AS DispDebut,
    d.DateFin AS DispFin,
    CASE 
        WHEN r.DateDebut >= d.DateDebut AND r.DateFin <= d.DateFin THEN 'OK'
        ELSE 'NON DISPONIBLE'
    END AS Statut
FROM Reservation r
JOIN Materiel m ON r.IdMateriel = m.IdMateriel
JOIN Disponibilite d ON r.IdDisponibilite = d.IdDisponibilite;



--Test de non disponibilité
-- Test : essaie de réserver un matériel en dehors des plages
SELECT 
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM Disponibilite d
            WHERE d.IdMateriel = 4
              AND '2025-08-01 10:00:00' >= d.DateDebut
              AND '2025-08-01 16:00:00' <= d.DateFin
        )
        THEN 'OK'
        ELSE 'NON DISPONIBLE'
    END AS Disponibilite;
