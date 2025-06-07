--Exercice 5

--Question 1 :
--Exemple : Le matériel avec IdMateriel = 4 a été emprunté en quantité 2

UPDATE Materiel
SET QuantiteDisponible = QuantiteDisponible - 2
WHERE IdMateriel = 4;


--Question 2 :
--Exemple : si la date de retour prévue (DateFin) est dans plus de 2 jours à partir d’aujourd’hui.

UPDATE Materiel
SET QuantiteDisponible = QuantiteDisponible - R.Quantite
FROM Reservation R
WHERE Materiel.IdMateriel = R.IdMateriel
AND R.DateFin > CURRENT_DATE + INTERVAL '2 days';

--CURRENT_DATE : date du jours
--INTERVAL : interval entre moment et un nombre de jours
