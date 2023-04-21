

public class Main {

    public static UserInterface UI;

    public static String username, password, url;
    public static void main(String args[])
    {
        UI =  new UserInterface();


        ///TODO: Modifier les requêtes SQL associées aux boutons

        UI.addButton(new DatabaseQuery("SELECT * FROM *",
                "Quel pays a été le plus de fois champion?"),
                "Pays champion");

        UI.addButton(new DatabaseQuery("SELECT * FROM *",
                        "Quel pays a été le plus de fois champion?"),
                "Pays champion");

        UI.addButton(new DatabaseQuery("SELECT * FROM *",
                        "Quel pays a été le plus de fois champion?"),
                "Pays champion");

        UI.addButton(new DatabaseQuery("SELECT * FROM *",
                        "Quel pays a été le plus de fois champion?"),
                "Pays champion");
    }

}
