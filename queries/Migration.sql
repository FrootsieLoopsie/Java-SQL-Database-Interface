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
