CREATE TABLE Arbitre if not exists(
	identifiant INT NOT NULL,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	PRIMARY KEY (identifiant)
);

CREATE TABLE IF NOT EXISTS coupe (
    annee INT NOT NULL,
    nb_equipe INT NOT NULL,
    id_equipe_gagnant INT,
    PRIMARY KEY (annee)
);

CREATE TABLE IF NOT EXISTS Equipe (
    id_equipe VARCHAR(50),
    pays varchar(50) NOT NULL,
    annee INT NOT NULL,
    nb_joueurs INT NOT NULL,
    PRIMARY KEY (id_equipe)
);

ALTER TABLE Equipe ADD CONSTRAINT uc_Equipe UNIQUE (pays, annee); --assure qu'un pays n'ait pas plsuierus �quipes par coupe

create table if not exists Joueur(
    identifiant int not null,
    prenom varchar(50),
    nom varchar(50),
    annee_naissance int,
    primary key (identifiant)
);

create table if not exists Match(
    id int not null,
    jour int not null check (
        jour > 0
        and jour < 32
    ),
    mois int not null check (
        mois > 0
        and mois < 13
    ),
    annee int not null,
    id_equipe1 int not null,
    id_equipe2 int not null,
    nb_buts_pays1 int,
    nb_buts_pays2 int,
    lieu varchar(50),
    rang VARCHAR(10)not null CHECK (rang IN ('1/16e', '1/8e', '1/4', '1/2', 'finale')),
    id_arbitre_princ int,
    id_arbitre_ass1 int,
    id_arbitre_ass2 int,
    id_arbitre_ass3 int,
    primary key (id)
);


create table if not exists Participation(
    numero int,
    id_equipe int not null,
    identifiant_joueur int not null,
    primary key (identifiant_joueur, id_equipe)
);

CREATE TABLE if not exists Sanction (
  identifiant_joueur INTEGER not null,
  id_match INT not null,
  secondes int not null, 
  couleur VARCHAR(1) ,

  PRIMARY KEY (identifiant_joueur, id_match, secondes, couleur)
  
);

CREATE FUNCTION count_sanctions_rouges(identifiant_joueur integer, id_match integer) RETURNS integer AS $$
    SELECT COUNT(*) FROM Sanction 
    WHERE identifiant_joueur = $1 
    AND couleur='R'
    AND id_match = $2 
$$ LANGUAGE SQL;

CREATE FUNCTION count_sanctions_jaunes(identifiant_joueur integer, id_match integer) RETURNS integer AS $$
    SELECT COUNT(*) FROM Sanction 
    WHERE identifiant_joueur = $1 
    AND id_match = $2 
    AND couleur='J'
$$ LANGUAGE SQL;

ALTER TABLE Sanction ADD CONSTRAINT nb_cartons CHECK( 
  (count_sanctions_jaunes(identifiant_joueur, id_match) < 2
    AND
  count_sanctions_rouges(identifiant_joueur, id_match) < 1
  )
    OR
  (couleur='R' AND count_sanctions_jaunes(identifiant_joueur, id_match)= 2
  )
);


CREATE TABLE IF NOT EXISTS Staff (
    identifiant INT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    PRIMARY KEY (identifiant)
);


CREATE TABLE IF NOT EXISTS TravailPour (
   id_equipe int not null,
   identifiant_staff INTEGER NOT NULL,
   role_staff VARCHAR(50) NOT NULL check (role_staff in ('entraineur', 'collaborateur')),
   PRIMARY KEY (id_equipe, identifiant_staff)
);


CREATE FUNCTION count_entraineur(id_equipe int) RETURNS integer AS $$
    SELECT COUNT(*) FROM TravailPour 
    WHERE id_equipe = $1 
    AND role_staff='entraineur'
$$ LANGUAGE SQL;

Alter table TravailPour add constraint check_entraineur check(count_entraineur(id_equipe)<=1);

--arbitre

--coupe
ALTER TABLE coupe ADD CONSTRAINT fk_gagnant FOREIGN KEY (id_equipe_gagnant) REFERENCES Equipe(id_equipe);

--equipe
ALTER TABLE Equipe ADD CONSTRAINT fk_annee FOREIGN KEY (annee) REFERENCES Coupe(annee);

--joueur

--match
ALTER TABLE Match ADD CONSTRAINT fk_id_equipe1 FOREIGN KEY (id_equipe1) REFERENCES Equipe(id_equipe);
ALTER TABLE Match ADD CONSTRAINT fk_id_equipe2 FOREIGN KEY (id_equipe2) REFERENCES Equipe(id_equipe);
ALTER TABLE Match ADD CONSTRAINT fk_annee FOREIGN KEY (annee) REFERENCES Coupe(annee);
ALTER TABLE Match ADD CONSTRAINT fk_id_arbitre_princ FOREIGN KEY (id_arbitre_princ) REFERENCES Arbitre(identifiant);
ALTER TABLE Match ADD CONSTRAINT fk_id_arbitre_ass1 FOREIGN KEY (id_arbitre_ass1) REFERENCES Arbitre(identifiant);
ALTER TABLE Match ADD CONSTRAINT fk_id_arbitre_ass2 FOREIGN KEY (id_arbitre_ass2) REFERENCES Arbitre(identifiant);
ALTER TABLE Match ADD CONSTRAINT fk_id_arbitre_ass3 FOREIGN KEY (id_arbitre_ass3) REFERENCES Arbitre(identifiant);

--participation
ALTER TABLE participation ADD CONSTRAINT fk_identifiant_joueur FOREIGN KEY (identifiant_joueur) REFERENCES Joueur(identifiant);
ALTER TABLE participation ADD CONSTRAINT fk_id_equipe FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe);

--sanction
ALTER TABLE Sanction ADD CONSTRAINT fk_id_match FOREIGN KEY (id_match) REFERENCES Match(id);
ALTER TABLE Sanction ADD CONSTRAINT fk_id_joueur FOREIGN KEY (identifiant_joueur) REFERENCES Joueur(identifiant);

--staff

--travailpour
ALTER TABLE TravailPour ADD CONSTRAINT fk_id_equipe FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe);
ALTER TABLE TravailPour ADD CONSTRAINT fk_identifiant_staff FOREIGN KEY (identifiant_staff) REFERENCES Staff(identifiant);

--Quel est le pays ayant été le plus de fois gagnant, et son nombre de victoire ?
--R�ponse: France, 2
Select Equipe.pays, count(*)
from Coupe
Join Equipe On Coupe.id_equipe_gagnant=Equipe.id_equipe
Group by Equipe.pays
Having Count (*)=(select max(nb_victoires)
				 from (select count(*) as nb_victoires
					  from Coupe, Equipe
					   Where coupe.id_equipe_gagnant=equipe.id_equipe
					  Group by pays)as TableVictoire);



--Les noms et pr�noms des entra�neurs des �quipes qui ont �t� jusqu�en demi-finale en 2010 avec le pays en question.
--R�ponse
--"Carlos"	"Queiroz"	"Iran"
--"Austin"	"Eguavoen"	"Nigeria"
--"Joachim"	"L�w"	"Allemagne"
--"Paulo"	"Queiroz"	"Portugal"
SELECT
    S.prenom AS prenom,
    S.nom AS nom,
    E.pays AS pays
FROM TravailPour AS TP
JOIN Staff AS S ON TP.identifiant_staff = S.identifiant
JOIN Equipe AS E ON TP.id_equipe = E.id_equipe
JOIN Match AS M ON (
    (M.id_equipe1 = E.id_equipe OR M.id_equipe2 = E.id_equipe) AND
    M.annee = 2010 AND
    M.rang = '1/2'
)
WHERE TP.role_staff = 'entraineur';


--Le nom et le pr�nom des joueurs qui ont eu un carton rouge en 2018.
--R�ponse
--"Lukaku"	"Romelu"
--"Carrasco" "Yannick"
SELECT J.nom, J.prenom
FROM Joueur J
JOIN Sanction S ON J.identifiant = S.identifiant_joueur 
JOIN Match M ON S.id_match = M.id 
WHERE S.couleur ='R' and M.annee=2018;



--Les noms et pr�noms du personnel �tant pass�s de collaborateurs � entra�neurs.
--R�ponse
--"Queiroz"	"Carlos"
--"Eguavoen"	"Austin"
SELECT s.nom, s.prenom 
FROM Staff s 
JOIN TravailPour collab ON s.identifiant = collab.identifiant_staff 
JOIN TravailPour trainer ON s.identifiant = trainer.identifiant_staff 
JOIN Equipe equipeCollab ON collab.id_equipe = equipeCollab.id_equipe 
JOIN Equipe equipeTrainer ON trainer.id_equipe = equipeTrainer.id_equipe 
WHERE collab.role_staff = 'collaborateur' 
AND trainer.role_staff = 'entraineur' 
AND equipeCollab.annee < equipeTrainer.annee;
