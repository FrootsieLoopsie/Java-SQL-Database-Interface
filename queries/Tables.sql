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
