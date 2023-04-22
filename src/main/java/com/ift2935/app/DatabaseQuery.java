package com.ift2935.app;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.ServiceRegistry;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

public class DatabaseQuery {

    String sqlQuery, description;

    public DatabaseQuery(String sql, String description) {
        this.sqlQuery = sql;
        this.description = description;

    }

    /// TODO
    // From: https://www.digitalocean.com/community/tutorials/hibernate-native-sql-query-example
    public String getOutput() {
        // Get Hibernate Server Session:
        Session session = DatabaseQuery.getCurrentSession();
        if(session == null) {
            return "ERREUR: Aucune session n'a pu être ouverte avec le serveur SQL. SVP vérifier url, usename, password.";
        }
        else {
            // Run SQL query
            NativeQuery query = session.createNativeQuery(this.sqlQuery);
            List<Object[]> results = (List<Object[]>) query.getResultList();
    
            if (results.isEmpty()) {
                return "";
            } else if (results.size() == 1 && results.get(0).length == 1) {
                // Single-element result
                return results.get(0)[0].toString();
            } else {
                // Normal table result
                StringBuilder sb = new StringBuilder();
                sb.append(this.description + "\n\n");
                for (Object[] row : results) {
                    for (Object col : row) {
                        sb.append(col.toString());
                        sb.append("\t");
                    }
                    sb.append("\n");
                }
                return sb.toString();
            }
        }
    }
    
    // From: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/3-ways-to-build-a-Hibernate-SessionFactory-in-Java-by-example
    private static Session getCurrentSession(){
        Map<String, Object> settings = new HashMap<>();
        settings.put("hibernate.connection.driver_class", "org.postgresql.Driver");
        settings.put("hibernate.dialect", "org.hibernate.dialect.PostgreSQL10Dialect");
        settings.put("hibernate.connection.url", Main.url);
        settings.put("hibernate.connection.username", Main.username);
        settings.put("hibernate.connection.password", Main.password);
        settings.put("hibernate.show_sql", "true");
        settings.put("hibernate.format_sql", "true");
        try {
            StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(settings)
                    .build();
            MetadataSources metadataSources = new MetadataSources(serviceRegistry);
            Metadata metadata = metadataSources.buildMetadata();
            SessionFactory sessionFactory = metadata.buildSessionFactory();
            return sessionFactory.openSession();
        }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("ERREUR: Aucune session n'a pu être ouverte avec le serveur SQL. SVP vérifier url, usename, password.");
            return null;
        }
    }
}
