
import org.hibernate.*;

public class DatabaseQuery {

    String sql, description;

    public DatabaseQuery(String sql, String description) {
        this.sql = sql;
        this.description = description;
    }

    public String getOutput() {
        return description;
    }

}
