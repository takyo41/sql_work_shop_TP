



ALTER TABLE utilisateur DROP COLUMN numbadge;

alter table disponibilite drop constraint id_materiel;
alter table reservation drop constraint idutilisateur;
alter table reservation drop constraint idmateriel;
alter table reservation drop constraint iddisponibilite;

TRUNCATE TABLE reservation RESTART IDENTITY CASCADE;
TRUNCATE TABLE disponibilite RESTART IDENTITY CASCADE;
TRUNCATE TABLE materiel RESTART IDENTITY CASCADE;
TRUNCATE TABLE utilisateur RESTART IDENTITY CASCADE;


-- Insert 1,000,000 rows into utilisateur
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..200000 LOOP
        INSERT INTO utilisateur ( Nom, Prenom, Email)
        VALUES (
        
            'nom_' || i,
            'prenom_' || i,
            'user_' || i || '@example.com'
        );
    END LOOP;
END $$;

-- Insert 1,000,000 rows into materiel
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..200000 LOOP
        INSERT INTO materiel (quantitedisponible, categorie)
        VALUES (
                       (random() * 20)::INT + 1, -- Random quantity between 1 and 20 for the available quantity
            'materiel_' || i
        );
    END LOOP;
END $$;

-- Insert 2,000,000 rows into disponibilite
DO $$
DECLARE
    i INT;
    start_date DATE;
    end_date DATE;
BEGIN
    FOR i IN 1..200000 LOOP
        -- Generate random start and end dates
        start_date := DATE '2025-01-01' + (random() * 365)::INT;
        end_date := start_date + (random() * 30)::INT;

        INSERT INTO disponibilite ( idmateriel, datedebut, datefin)
        VALUES (
            (random() * 19999)::INT + 1, -- Random id_materiel between 1 and 200,000
            start_date,
            end_date
        );
    END LOOP;
END $$;

-- Insert 2,000,000 rows into reservation
DO $$
DECLARE
    i INT;
    reservation_date DATE;
    return_date DATE;
	effective_return_date DATE;
BEGIN
    FOR i IN 1..200000 LOOP
        -- Generate random reservation and return dates
        reservation_date := DATE '2025-01-01' + (random() * 365)::INT;
        return_date := reservation_date + (random() * 15)::INT;
		effective_return_date := reservation_date + (random() * 15)::INT;

        INSERT INTO reservation ( datedebut, datefin, quantite, idutilisateur, idmateriel, iddisponibilite, dateretoureffectif)
        VALUES (
           
            reservation_date,
            return_date,
			(random() * 19999)::INT + 1,
            (random() * 19999)::INT + 1, -- Random numero_etudiant between 1 and 200,000
            (random() * 19999)::INT + 1,  -- Random identifiant_materiel between 1 and 200,000
			(random() * 19999)::INT + 1 , -- Random identifiant_materiel between 1 and 200,000
			effective_return_date
        );
    END LOOP;
END $$;
