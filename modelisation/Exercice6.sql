
--Exercice 6 :


--1 : Requête de suppression d’une réservation existante
DELETE FROM Reservation
WHERE IdReservation = 1;



--2 : Requête de suppression d'une réservation ou la date de retour prévue est passée
DELETE FROM Reservation
WHERE DateFin < CURRENT_TIMESTAMP;





--BONUS : Requête de suppression d'un utilisateur 
DELETE FROM Utilisateur
WHERE Email = 'claire.dupont@example.com';