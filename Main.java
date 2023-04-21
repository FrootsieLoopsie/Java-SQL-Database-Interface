

public class Main {

    public static UserInterface UI;
    public static void main(String args[])
    {

        UI =  new UserInterface();
        UI.addButton(new DatabaseQuery("( Sql statements here )",
                "Quel pays a été le plus de fois champion?"),
                "Pays champion");
    }

}
