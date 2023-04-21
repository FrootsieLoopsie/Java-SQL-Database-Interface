

public class Main {

    public static UserInterface UI;

    public static String username, password, url;
    public static void main(String args[])
    {
        UI =  new UserInterface();

        UI.addButton(new DatabaseQuery("SELECT * FROM *",
                "Quel pays a été le plus de fois champion?"),
                "Pays champion");
    }

}
