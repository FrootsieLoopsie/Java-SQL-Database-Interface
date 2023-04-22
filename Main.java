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
