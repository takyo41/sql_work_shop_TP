
--Exercice 4


--Question 1 : 
SELECT COUNT(*) AS TotalReservations
FROM Reservation
WHERE DateDebut BETWEEN '2025-05-25' AND '2025-05-30';

-- Le count(*) permet de compter toutes les colones sans exception
-- Le as nomme le resultat du count(*)



--Question 2 : 
SELECT COUNT(DISTINCT R.IdUtilisateur) AS NombreUtilisateurs
FROM Reservation R
JOIN Materiel M ON R.IdMateriel = M.IdMateriel;

-- Le DISTINCT permet d'enlever les doublons
