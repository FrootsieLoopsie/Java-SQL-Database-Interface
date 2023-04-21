
import org.hibernate.*;

public class DatabaseQuery {

    String sql, description;

    public DatabaseQuery(String sql, String description) {
        this.sql = sql;
        this.description = description;
    }

    public String getOutput() {

        // Settings:
        String username = Main.username, password = Main.password, url = Main.url;

        ///TODO: RUN SQL QUERY
        String output = "(Test: À faire)";

        return description + "\nRésultat: " + output;
    }

}
