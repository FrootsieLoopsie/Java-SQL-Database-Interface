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

--insertion des tuples des coupes
INSERT INTO Coupe (annee, nb_equipe, id_equipe_gagnant)
VALUES 
  (2018, 32, NULL),
  (2014, 32, NULL),
  (2010, 32, NULL),
  (1998, 32, NULL)


--insertion des tuples des �quipes de la coupe de 2018
INSERT INTO Equipe (id_equipe, pays, annee, nb_joueurs)
VALUES
  (1, 'Russie', 2018, 23),
  (2, 'Allemagne', 2018, 23),
  (3, 'Br�sil', 2018, 23),
  (4, 'Portugal', 2018, 23),
  (5, 'Argentine', 2018, 23),
  (6, 'Belgique', 2018, 23),
  (7, 'Pologne', 2018, 23),
  (8, 'France', 2018, 23),
  (9, 'Espagne', 2018, 23),
  (10, 'P�rou', 2018, 23),
  (11, 'Suisse', 2018, 23),
  (12, 'Angleterre', 2018, 23),
  (13, 'Colombie', 2018, 23),
  (14, 'Mexique', 2018, 23),
  (15, 'Uruguay', 2018, 23),
  (16, 'Croatie', 2018, 23),
  (17, 'Danemark', 2018, 23),
  (18, 'Islande', 2018, 23),
  (19, 'Costa Rica', 2018, 23),
  (20, 'Su�de', 2018, 23),
  (21, 'Tunisie', 2018, 23),
  (22, '�gypte', 2018, 23),
  (23, 'S�n�gal', 2018, 23),
  (24, 'Iran', 2018, 23),
  (25, 'Serbie', 2018, 23),
  (26, 'Nigeria', 2018, 23),
  (27, 'Japon', 2018, 23),
  (28, 'Maroc', 2018, 23),
  (29, 'Panama', 2018, 23),
  (30, 'Cor�e du Sud', 2018, 23),
  (31, 'Arabie Saoudite', 2018, 23),
  (32, 'Australie', 2018, 23);

--insertion des tuples des �quipes de la coupe de 2014
INSERT INTO Equipe (id_equipe, pays, annee, nb_joueurs)
VALUES
  (33, 'Br�sil', 2014, 23),
  (34, 'Mexique', 2014, 23),
  (35, 'Cameroun', 2014, 23),
  (36, 'Croatie', 2014, 23),
  (37, 'Espagne', 2014, 23),
  (38, 'Pays-Bas', 2014, 23),
  (39, 'Chili', 2014, 23),
  (40, 'Australie', 2014, 23),
  (41, 'Colombie', 2014, 23),
  (42, 'Gr�ce', 2014, 23),
  (43, 'C�te dIvoire', 2014, 23),
  (44, 'Japon', 2014, 23),
  (45, 'Uruguay', 2014, 23),
  (46, 'Costa Rica', 2014, 23),
  (47, 'Angleterre', 2014, 23),
  (48, 'Italie', 2014, 23),
  (49, 'Suisse', 2014, 23),
  (50, '�quateur', 2014, 23),
  (51, 'France', 2014, 23),
  (52, 'Honduras', 2014, 23),
  (53, 'Argentine', 2014, 23),
  (54, 'Bosnie-Herz�govine', 2014, 23),
  (55, 'Iran', 2014, 23),
  (56, 'Nigeria', 2014, 23),
  (57, 'Allemagne', 2014, 23),
  (58, 'Portugal', 2014, 23),
  (59, 'Ghana', 2014, 23),
  (60, '�tats-Unis', 2014, 23),
  (61, 'Belgique', 2014, 23),
  (62, 'Alg�rie', 2014, 23),
  (63, 'Russie', 2014, 23),
  (64, 'Cor�e du Sud', 2014, 23);

--insertion des tuples des equipes de la coupe de 2010
INSERT INTO Equipe (id_equipe, pays, annee, nb_joueurs)
VALUES
  (65, 'Br�sil', 2010, 23),
  (66, 'Mexique', 2010, 23),
  (67, 'Cameroun', 2010, 23),
  (68, 'Croatie', 2010, 23),
  (69, 'Espagne', 2010, 23),
  (70, 'Pays-Bas', 2010, 23),
  (71, 'Chili', 2010, 23),
  (72, 'Australie', 2010, 23),
  (73, 'Colombie', 2010, 23),
  (74, 'Gr�ce', 2010, 23),
  (75, 'C�te d\'Ivoire', 2010, 23),
  (76, 'Japon', 2010, 23),
  (77, 'Uruguay', 2010, 23),
  (78, 'Costa Rica', 2010, 23),
  (79, 'Angleterre', 2010, 23),
  (80, 'Italie', 2010, 23),
  (81, 'Suisse', 2010, 23),
  (82, '�quateur', 2010, 23),
  (83, 'France', 2010, 23),
  (84, 'Honduras', 2010, 23),
  (85, 'Argentine', 2010, 23),
  (86, 'Bosnie-Herz�govine', 2010, 23),
  (87, 'Iran', 2010, 23),
  (88, 'Nigeria', 2010, 23),
  (89, 'Allemagne', 2010, 23),
  (90, 'Portugal', 2010, 23),
  (91, 'Ghana', 2010, 23),
  (92, '�tats-Unis', 2010, 23),
  (93, 'Belgique', 2010, 23),
  (94, 'Alg�rie', 2010, 23),
  (95, 'Russie', 2010, 23),
  (96, 'Cor�e du Sud', 2010, 23);

--insertion des tuples des equipes de 1998
INSERT INTO Equipe (id_equipe, pays, annee, nb_joueurs)
VALUES
  (97, 'France', 1998, 23),
  (98, 'Arabie Saoudite', 1998, 23),
  (99, 'Afrique du Sud', 1998, 23),
  (100, 'Danemark', 1998, 23),
  (101, 'Espagne', 1998, 23),
  (102, 'Nigeria', 1998, 23),
  (103, 'Allemagne', 1998, 23),
  (104, 'Iran', 1998, 23),
  (105, '�tats-Unis', 1998, 23),
  (106, 'Yougoslavie', 1998, 23),
  (107, 'Mexique', 1998, 23),
  (108, 'Pays-Bas', 1998, 23),
  (109, 'Cor�e du Sud', 1998, 23),
  (110, 'Belgique', 1998, 23),
  (111, 'Roumanie', 1998, 23),
  (112, 'Angleterre', 1998, 23),
  (113, 'Colombie', 1998, 23),
  (114, 'Argentine', 1998, 23),
  (115, 'Croatie', 1998, 23),
  (116, 'Jama�que', 1998, 23),
  (117, 'Japon', 1998, 23),
  (118, 'Italie', 1998, 23),
  (119, 'Cameroun', 1998, 23),
  (120, 'Chili', 1998, 23),
  (121, 'Autriche', 1998, 23),
  (122, 'Paraguay', 1998, 23),
  (123, 'Norv�ge', 1998, 23),
  (124, '�cosse', 1998, 23),
  (125, 'Bulgarie', 1998, 23),
  (126, 'Nouvelle-Z�lande', 1998, 23),
  (127, 'Maroc', 1998, 23),
  (128, 'Honduras', 1998, 23);

--ajouter les gagnants aux coupes
UPDATE Coupe SET id_equipe_gagnant = 8 WHERE annee = 2018;
UPDATE Coupe SET id_equipe_gagnant = 57 WHERE annee = 2014;
UPDATE Coupe SET id_equipe_gagnant = 69 WHERE annee = 2010;
UPDATE Coupe SET id_equipe_gagnant = 97 WHERE annee = 1998;

--insertion des tuples des arbitres
INSERT INTO Arbitre (identifiant, prenom, nom)
VALUES
  (401, 'Jean', 'Dupont'),
  (402, 'Marie', 'Martin'),
  (403, 'Pierre', 'Durand'),
  (404, 'Lucie', 'Lefebvre'),
  (405, 'Antoine', 'Rousseau'),
  (406, 'Sophie', 'Gagn�'),
  (407, 'Mathieu', 'Bergeron'),
  (408, 'Julie', 'Tremblay'),
  (409, 'Alexandre', 'Lavoie'),
  (410, 'Isabelle', 'Roy');

--insertion des tuples de matchs
INSERT INTO Match(id, jour, mois, annee, id_equipe1, id_equipe2, nb_buts_pays1, nb_buts_pays2, lieu, rang, id_arbitre_princ, id_arbitre_ass1, id_arbitre_ass2, id_arbitre_ass3)
VALUES 
(203, 12, 6, 2010, 69, 70, 0, 1, 'Durban', '1/8e', 409, 401, 402, 403),
(204, 12, 6, 2010, 71, 72, 1, 0, 'Santiago', '1/8e', 404, 405, 406, 407),
(205, 13, 6, 2010, 73, 74, 2, 1, 'Port Elizabeth', '1/8e', 408, 409, 401, 402),
(206, 14, 6, 2010, 75, 76, 0, 0, 'Cape Town', '1/8e', 403, 404, 405, 406),
(207, 14, 6, 2010, 77, 78, 2, 3, 'Rustenburg', '1/8e', 407, 408, 409, 401),
(208, 14, 6, 2010, 79, 80, 0, 0, 'Nelspruit', '1/8e', 402, 403, 404, 405),
(209, 15, 6, 2010, 81, 82, 0, 0, 'Bloemfontein', '1/8e', 406, 407, 408, 409),
(210, 15, 6, 2010, 83, 84, 0, 0, 'Polokwane', '1/8e', 401, 402, 403, 404),
(201, 1, 7, 2010, 90, 88, 1, 0, 'Cape Town', '1/2', 403, 404, 405, 406),
(202, 2, 7, 2010, 89, 87, 1, 0, 'Durban', '1/2', 407, 408, 409, 410),
(211, 14, 6, 2018, 1, 2, 1, 2, 'Moscou', '1/16e', 401, 402, 403, 404),
(212, 16, 6, 2018, 3, 4, 0, 1, 'Saint-P�tersbourg', '1/16e', 405, 406, 407, 408),
(213, 18, 6, 2018, 5, 6, 0, 0, 'Sotchi', '1/16e', 409, 410, 401, 402),
(214, 20, 6, 2018, 7, 8, 2, 1, 'Kazan', '1/16e', 403, 404, 405, 406),
(215, 22, 6, 2018, 9, 10, 1, 1, 'Samara', '1/16e', 407, 408, 409, 410),
(216, 24, 6, 2018, 11, 12, 0, 0, 'Volgograd', '1/16e', 401, 402, 403, 404),
(217, 26, 6, 2018, 13, 14, 1, 0, 'Nijni Novgorod', '1/16e', 405, 406, 407, 408),
(218, 28, 6, 2018, 15, 16, 2, 1, 'Kaliningrad', '1/16e', 409, 410, 401, 402),
(219, 30, 6, 2018, 17, 18, 1, 2, 'Rostov-sur-le-Don', '1/16e', 403, 404, 405, 406),
(220, 2, 7, 2018, 19, 20, 0, 1, 'Saransk', '1/16e', 407, 408, 409, 410);

-- Insertion des tuples Staff
INSERT INTO Staff (identifiant, nom, prenom)
VALUES
    (101, 'Queiroz', 'Carlos'),
    (102, 'Eguavoen', 'Austin'),
    (103, 'L�w', 'Joachim'),
    (104, 'Queiroz', 'Paulo'),
    (105, 'Alain', 'Tapp'),
    (106, 'Clo�', 'Martia'),
    (107, 'Penelope', 'Cruz'),
    (108, 'Simon', 'Perret');

-- Insertion des tuples TravailPour
INSERT INTO TravailPour (id_equipe, identifiant_staff, role_staff)
VALUES
    (87, 101, 'entraineur'),
    (88, 102, 'entraineur'),
    (89, 103, 'entraineur'),
    (90, 104, 'entraineur'),
    (102, 105, 'collaborateur'),
    (103, 106, 'collaborateur'),
    (104, 107, 'collaborateur'),
    (105, 108, 'collaborateur'),
    (102, 101, 'collaborateur'),
    (103, 102, 'collaborateur');

--
-- Ins�rer des joueurs pour l'�quipe 5
INSERT INTO Joueur (identifiant, annee_naissance, prenom, nom)
VALUES
    (101, 1995, 'Lionel', 'Messi'),
    (102, 1991, 'Paulo', 'Dybala'),
    (103, 1992, 'Giovani', 'Lo Celso'),
    (104, 1988, 'Angel', 'Di Maria'),
    (105, 1990, 'Leandro', 'Paredes'),
    (106, 1987, 'Sergio', 'Ag�ero'),
    (107, 1993, 'Nicolas', 'Tagliafico'),
    (108, 1991, 'Gonzalo', 'Martinez'),
    (109, 1994, 'Lucas', 'Ocampos'),
    (110, 1995, 'Rodrigo', 'De Paul');

-- Ins�rer les participations des joueurs pour l'�quipe 5
INSERT INTO Participation (numero, id_equipe, identifiant_joueur)
VALUES
    (1, 5, 101),
    (2, 5, 102),
    (3, 5, 103),
    (4, 5, 104),
    (5, 5, 105),
    (6, 5, 106),
    (7, 5, 107),
    (8, 5, 108),
    (9, 5, 109),
    (10, 5, 110);

-- Ins�rer des joueurs pour l'�quipe 6
INSERT INTO Joueur (identifiant, annee_naissance, prenom, nom)
VALUES
    (111, 1991, 'Romelu', 'Lukaku'),
    (112, 1988, 'Eden', 'Hazard'),
    (113, 1989, 'Kevin', 'De Bruyne'),
    (114, 1990, 'Thorgan', 'Hazard'),
    (115, 1988, 'Axel', 'Witsel'),
    (116, 1993, 'Yannick', 'Carrasco'),
    (117, 1992, 'Youri', 'Tielemans'),
    (118, 1993, 'Leander', 'Dendoncker'),
    (119, 1997, 'J�r�my', 'Doku'),
    (120, 1989, 'Toby', 'Alderweireld');

-- Ins�rer les participations des joueurs pour l'�quipe 6
INSERT INTO Participation (numero, id_equipe, identifiant_joueur)
VALUES
    (1, 6, 111),
    (2, 6, 112),
    (3, 6, 113),
    (4, 6, 114),
    (5, 6, 115),
    (6, 6, 116),
    (7, 6, 117),
    (8, 6, 118),
    (9, 6, 119),
    (10, 6, 120);

--Ins�rer des tuples de sanction
INSERT INTO Sanction(identifiant_joueur, id_match, secondes, couleur) VALUES
(111, 213, 45, 'J'),
(111, 213, 76, 'R'),
(116, 213, 69, 'R');
   

