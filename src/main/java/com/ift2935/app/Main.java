package com.ift2935.app;
import io.github.cdimascio.dotenv.Dotenv;
import io.github.cdimascio.dotenv.DotenvException;

public class Main {

    public static UserInterface UI;

    public static String username, password, url;
    public static void main(String args[])
    {

        // Environment Variables
        Dotenv dotenv = null;
        dotenv = Dotenv.configure().load();

        username = dotenv.get("USERNAME");
        password = dotenv.get("PASSWORD");
        url = dotenv.get("URL");

        UI =  new UserInterface();

        ///TODO: Modifier les requêtes SQL associées aux boutons

        UI.addButton(new DatabaseQuery("Select Equipe.pays, count(*) from Coupe Join Equipe On Coupe.id_equipe_gagnant=Equipe.id_equipe Group by Equipe.pays Having Count (*)=(select max(nb_victoires) from (select count(*) as nb_victoires from Coupe, Equipe Where coupe.id_equipe_gagnant=equipe.id_equipe Group by pays)as TableVictoire);",
                "Quel pays a été le plus de fois champion?"),
                "Question 1");

        UI.addButton(new DatabaseQuery("SELECT S.prenom AS prenom, S.nom AS nom, E.pays AS pays FROM TravailPour AS TP JOIN Staff AS S ON TP.identifiant_staff = S.identifiant JOIN Equipe AS E ON TP.id_equipe = E.id_equipe JOIN Match AS M ON ( (M.id_equipe1 = E.id_equipe OR M.id_equipe2 = E.id_equipe) AND M.annee = 2010 AND M.rang = '1/2' ) WHERE TP.role_staff = 'entraineur';",
                        "Le nom et le prenom des joueurs qui ont eu un carton rouge en 2018"),
                "Question 2");

        UI.addButton(new DatabaseQuery("SELECT J.nom, J.prenom FROM Joueur J JOIN Sanction S ON J.identifiant = S.identifiant_joueur JOIN Match M ON S.id_match = M.id WHERE S.couleur ='R' and M.annee=2018;",
                        "Les noms et prénoms des entraineurs des équipes qui ont été jusqu'en demi-finale en 2010 avec \nle pays en question."),
                "Question 3");

        UI.addButton(new DatabaseQuery("SELECT s.nom, s.prenom FROM Staff s JOIN TravailPour collab ON s.identifiant = collab.identifiant_staff JOIN TravailPour trainer ON s.identifiant = trainer.identifiant_staff JOIN Equipe equipeCollab ON collab.id_equipe = equipeCollab.id_equipe JOIN Equipe equipeTrainer ON trainer.id_equipe = equipeTrainer.id_equipe WHERE collab.role_staff = 'collaborateur' AND trainer.role_staff = 'entraineur' AND equipeCollab.annee < equipeTrainer.annee;",
                        "Les noms et prénoms du personnel étant passés de collaborateurs à entraineurs."),
                "Question 4");
    }

}
