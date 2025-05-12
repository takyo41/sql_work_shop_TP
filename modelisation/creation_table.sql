CREATE TABLE Utilisateur(
   IdUtilisateur VARCHAR(50),
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   NumBadge INT,
   Email VARCHAR(50),
   PRIMARY KEY(IdUtilisateur)
);

CREATE TABLE Materiel(
   IdMateriel VARCHAR(50),
   QuantiteDisponible INT,
   Categorie VARCHAR(50),
   PRIMARY KEY(IdMateriel)
);

CREATE TABLE Reservation(
   IdReservation VARCHAR(50),
   DateDebut DATETIME,
   DateFin DATETIME,
   quantite INT,
   IdUtilisateur VARCHAR(50) NOT NULL,
   IdMateriel VARCHAR(50),
   PRIMARY KEY(IdReservation),
   FOREIGN KEY(IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur),
   FOREIGN KEY(IdMateriel) REFERENCES Materiel(IdMateriel)
);
