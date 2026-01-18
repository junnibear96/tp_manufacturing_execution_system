import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class OracleConnectionTest {
    public static void main(String[] args) {
        // Oracle Cloud connection details from environment
        String host = System.getenv("ORACLE_HOST");
        String service = System.getenv("ORACLE_SERVICE");
        String user = System.getenv("ORACLE_USER");
        String password = System.getenv("ORACLE_PASSWORD");

        // Build connection URL
        String url = String.format(
                "jdbc:oracle:thin:@(DESCRIPTION=(RETRY_COUNT=20)(RETRY_DELAY=3)" +
                        "(ADDRESS=(PROTOCOL=TCPS)(PORT=1522)(HOST=%s))" +
                        "(CONNECT_DATA=(SERVICE_NAME=%s))" +
                        "(SECURITY=(SSL_SERVER_DN_MATCH=YES)))",
                host, service);

        System.out.println("========================================");
        System.out.println("Oracle Cloud Connection Test");
        System.out.println("========================================");
        System.out.println("Host: " + host);
        System.out.println("Service: " + service);
        System.out.println("User: " + user);
        System.out.println("URL: " + url);
        System.out.println("========================================\n");

        try {
            // Load Oracle JDBC driver
            Class.forName("oracle.jdbc.OracleDriver");
            System.out.println("✓ Oracle JDBC Driver loaded");

            // Attempt connection
            System.out.println("Connecting to Oracle Cloud...");
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("✓ Connection successful!\n");

            // Test query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt
                    .executeQuery("SELECT 'Connected to Oracle Cloud!' AS message, SYSDATE AS current_time FROM DUAL");

            if (rs.next()) {
                String message = rs.getString("message");
                String time = rs.getString("current_time");
                System.out.println("Test Query Result:");
                System.out.println("  Message: " + message);
                System.out.println("  Server Time: " + time);
            }

            // Check database version
            rs = stmt.executeQuery("SELECT BANNER FROM V$VERSION WHERE ROWNUM = 1");
            if (rs.next()) {
                System.out.println("\nDatabase Version:");
                System.out.println("  " + rs.getString("BANNER"));
            }

            // Close connections
            rs.close();
            stmt.close();
            conn.close();

            System.out.println("\n========================================");
            System.out.println("✓ Connection test PASSED");
            System.out.println("========================================");

        } catch (Exception e) {
            System.err.println("\n========================================");
            System.err.println("✗ Connection test FAILED");
            System.err.println("========================================");
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
    }
}
