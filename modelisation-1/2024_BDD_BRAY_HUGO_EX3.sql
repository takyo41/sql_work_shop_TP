



--Exercice 3

--Question 1 :

SELECT U.IdUtilisateur, U.Nom, U.Prenom, R.IdReservation, R.DateDebut, R.DateFin, R.Quantite
FROM Utilisateur U
JOIN Reservation R ON U.IdUtilisateur = R.IdUtilisateur;




--Question 2 :

--Exemple d'un utilisateur qui a emprunté du matériel
SELECT U.IdUtilisateur, U.Nom, U.Prenom, M.Categorie, M.QuantiteDisponible, R.Quantite AS QuantiteEmpruntee
FROM Utilisateur U
JOIN Reservation R ON U.IdUtilisateur = R.IdUtilisateur
JOIN Materiel M ON R.IdMateriel = M.IdMateriel
WHERE U.IdUtilisateur = 10;  

--Exemple d'un utilisateur qui n'a pas emprunté du matériel
SELECT U.IdUtilisateur, U.Nom, U.Prenom, M.Categorie, M.QuantiteDisponible, R.Quantite AS QuantiteEmpruntee
FROM Utilisateur U
JOIN Reservation R ON U.IdUtilisateur = R.IdUtilisateur
JOIN Materiel M ON R.IdMateriel = M.IdMateriel
WHERE U.IdUtilisateur = 12;  
