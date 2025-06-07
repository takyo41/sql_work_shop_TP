

--Exercice 9

--ajout de la table retourmateriel
CREATE TABLE RetourMateriel (
    IdRetour INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IdReservation INT REFERENCES Reservation(IdReservation),
    DateRetour TIMESTAMP NOT NULL,
    Retard BOOLEAN
);

--Modification de la table reservation
ALTER TABLE Reservation
ADD COLUMN DateRetourEffectif TIMESTAMP;






-- On ajoute des données

-- Retour à l'heure (à la même heure ou avant DateFin)
UPDATE Reservation SET DateRetourEffectif = '2025-06-01 17:30:00' WHERE IdReservation = 21; -- 30 min retard
UPDATE Reservation SET DateRetourEffectif = '2025-06-04 12:00:00' WHERE IdReservation = 22; -- retard 2 jours (DateFin = 2025-06-02 12:00:00)
UPDATE Reservation SET DateRetourEffectif = '2025-06-03 18:00:00' WHERE IdReservation = 23; -- à l'heure
UPDATE Reservation SET DateRetourEffectif = '2025-06-06 13:00:00' WHERE IdReservation = 24; -- retard 2 jours (DateFin = 2025-06-04 11:00:00)
UPDATE Reservation SET DateRetourEffectif = '2025-06-05 12:00:00' WHERE IdReservation = 25; -- à l'heure
UPDATE Reservation SET DateRetourEffectif = '2025-06-06 16:00:00' WHERE IdReservation = 26; -- 1h retard
UPDATE Reservation SET DateRetourEffectif = '2025-06-07 11:30:00' WHERE IdReservation = 27; -- à l'heure
UPDATE Reservation SET DateRetourEffectif = '2025-06-08 12:00:00' WHERE IdReservation = 28; -- 2h retard
UPDATE Reservation SET DateRetourEffectif = '2025-06-09 09:00:00' WHERE IdReservation = 29; -- à l'heure
UPDATE Reservation SET DateRetourEffectif = '2025-06-12 14:00:00' WHERE IdReservation = 30; -- 2 jours retard
UPDATE Reservation SET DateRetourEffectif = '2025-06-12 14:00:00' WHERE IdReservation = 31; -- 2 jours retard





-- On insère automatiquement le retour et détecte le retard ou non
INSERT INTO RetourMateriel (IdReservation, DateRetour, Retard)
SELECT
    IdReservation,
    DateRetourEffectif,
    CASE
        WHEN DateRetourEffectif > DateFin THEN TRUE
        ELSE FALSE
    END
FROM Reservation
WHERE IdReservation IN (21, 22, 23,24, 25,26, 27,28,29,30,31);



--Idreservation de 21 à 31
SELECT 
    IdReservation,
    DateFin,
    DateRetourEffectif,
    CASE 
        WHEN DateRetourEffectif IS NULL THEN 'Pas encore rendu'
        WHEN DateRetourEffectif > DateFin THEN 'En retard'
        ELSE 'À temps'
    END AS Statut,
    CASE 
        WHEN DateRetourEffectif::date > DateFin::date THEN 
            (DateRetourEffectif::date - DateFin::date) * 2
        ELSE 0
    END AS Penalite_Euros
FROM Reservation
WHERE IdReservation = 21;
