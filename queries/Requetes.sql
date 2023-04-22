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
