import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;

import java.util.HashMap;

public class DatabaseQuery {

    String sqlQuery, description;

    public DatabaseQuery(String sql, String description) {
        this.sqlQuery = sql;
        this.description = description;

    }


    // From: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/3-ways-to-build-a-Hibernate-SessionFactory-in-Java-by-example
    private static Session getCurrentSession(){
        HashMap<String, String> settings = new HashMap<String, String>();
        settings.put("connection.driver_class", "org.postgresql.Driver");
        settings.put("dialect", "org.hibernate.dialect.PostgreSQL95Dialect");
        settings.put("hibernate.connection.url", Main.url);
        settings.put("hibernate.connection.username", Main.username);
        settings.put("hibernate.connection.password", Main.password);
        settings.put("hibernate.current_session_context_class", "thread");
        settings.put("hibernate.show_sql", "true");
        settings.put("hibernate.format_sql", "true");

        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(settings).build();
        MetadataSources metadataSources = new MetadataSources(serviceRegistry);
        Metadata metadata = metadataSources.buildMetadata();

        // here we build the SessionFactory (Hibernate 5.4)
        SessionFactory sessionFactory = metadata.getSessionFactoryBuilder().build();
        Session session = sessionFactory.getCurrentSession();
        return session;
    }


    // From: https://www.digitalocean.com/community/tutorials/hibernate-native-sql-query-example
    public String getOutput() {

        // Get Hibernate Server Session:
        Session session = DatabaseQuery.getCurrentSession();

        ///TODO: RUN SQL QUERY
        //Transaction tx = session.beginTransaction();
        //SQLQuery query = session.createSQLQuery(this.sqlQuery); //"select emp_id, emp_name, emp_salary from Employee");
        String output = "(Test: À faire)";

        return description + "\nRésultat: " + output;
    }

}
