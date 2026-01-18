import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class OracleWalletTest {
    public static void main(String[] args) {
        // Get current directory
        String walletPath = System.getProperty("user.dir") + "\\wallet";

        System.out.println("========================================");
        System.out.println("Oracle Cloud Wallet Connection Test");
        System.out.println("========================================");
        System.out.println("Wallet Location: " + walletPath);

        // Set Oracle properties for wallet
        System.setProperty("oracle.net.tns_admin", walletPath);
        System.setProperty("oracle.net.wallet_location", walletPath);

        // Connection details
        String tnsAlias = "nm0uo1ntyefptn5b_medium";
        String user = "ADMIN";
        String password = "NVdh49CQE3gFMWtb0ebJ";

        // Build connection URL using TNS alias
        String url = "jdbc:oracle:thin:@" + tnsAlias;

        System.out.println("TNS Alias: " + tnsAlias);
        System.out.println("Username: " + user);
        System.out.println("URL: " + url);
        System.out.println("========================================\n");

        try {
            // Load Oracle JDBC driver
            Class.forName("oracle.jdbc.OracleDriver");
            System.out.println("✓ Oracle JDBC Driver loaded");

            // Connection properties
            Properties props = new Properties();
            props.setProperty("user", user);
            props.setProperty("password", password);
            props.setProperty("oracle.net.tns_admin", walletPath);

            // Attempt connection
            System.out.println("Connecting to Oracle Cloud with wallet...");
            Connection conn = DriverManager.getConnection(url, props);
            System.out.println("✓ Connection successful!\n");

            // Test query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(
                    "SELECT 'Connected to Oracle Cloud via Wallet!' AS message, " +
                            "SYSDATE AS current_time FROM DUAL");

            if (rs.next()) {
                System.out.println("Test Query Result:");
                System.out.println("  Message: " + rs.getString("message"));
                System.out.println("  Server Time: " + rs.getString("current_time"));
            }

            // Check database version
            rs = stmt.executeQuery("SELECT BANNER FROM V$VERSION WHERE ROWNUM = 1");
            if (rs.next()) {
                System.out.println("\nDatabase Info:");
                System.out.println("  " + rs.getString("BANNER"));
            }

            // Check tablespace
            rs = stmt.executeQuery(
                    "SELECT tablespace_name, status FROM dba_tablespaces WHERE ROWNUM <= 3");
            System.out.println("\nTablespaces:");
            while (rs.next()) {
                System.out.println("  - " + rs.getString("tablespace_name") +
                        " (" + rs.getString("status") + ")");
            }

            // Close connections
            rs.close();
            stmt.close();
            conn.close();

            System.out.println("\n========================================");
            System.out.println("✓ Wallet Connection Test PASSED");
            System.out.println("========================================");
            System.out.println("\nNext Steps:");
            System.out.println("1. Add wallet to Docker image");
            System.out.println("2. Set TNS_ADMIN=/app/wallet in Railway");
            System.out.println("3. Deploy to Railway");

        } catch (Exception e) {
            System.err.println("\n========================================");
            System.err.println("✗ Wallet Connection Test FAILED");
            System.err.println("========================================");
            System.err.println("Error: " + e.getMessage());
            System.err.println("\nTroubleshooting:");
            System.err.println("1. Check wallet files exist in: " + walletPath);
            System.err.println("2. Verify TNS alias in tnsnames.ora");
            System.err.println("3. Confirm credentials are correct");
            e.printStackTrace();
            System.exit(1);
        }
    }
}
