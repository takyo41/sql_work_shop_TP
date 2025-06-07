
--Exercice 2

SELECT * 
FROM Utilisateur
WHERE NumBadge > 1010;

SELECT * 
FROM Materiel
WHERE QuantiteDisponible <= 10;

SELECT * 
FROM Reservation
WHERE DateDebut > '2025-05-25'
  AND (DateFin - DateDebut) > INTERVAL '4 hours';
