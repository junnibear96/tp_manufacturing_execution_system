import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import java.io.FileInputStream;

public class OracleJKSTest {
    public static void main(String[] args) {
        String walletPath = System.getProperty("user.dir") + "\\wallet";

        System.out.println("========================================");
        System.out.println("Oracle Cloud - JKS Keystore Test");
        System.out.println("========================================");
        System.out.println("Wallet Location: " + walletPath);

        // Use JKS keystore instead of SSO
        String keystorePath = walletPath + "\\keystore.jks";
        String truststorePath = walletPath + "\\truststore.jks";

        // Set system properties for SSL
        System.setProperty("javax.net.ssl.keyStore", keystorePath);
        System.setProperty("javax.net.ssl.keyStorePassword", ""); // Usually empty for client certs
        System.setProperty("javax.net.ssl.trustStore", truststorePath);
        System.setProperty("javax.net.ssl.trustStorePassword", ""); // Usually empty

        // Connection details
        String tnsAlias = "nm0uo1ntyefptn5b_medium";
        String user = "ADMIN";
        String password = "NVdh49CQE3gFMWtb0ebJ";

        String url = "jdbc:oracle:thin:@" + tnsAlias;

        System.out.println("Keystore: " + keystorePath);
        System.out.println("Truststore: " + truststorePath);
        System.out.println("TNS Alias: " + tnsAlias);
        System.out.println("========================================\n");

        try {
            // Set TNS_ADMIN
            System.setProperty("oracle.net.tns_admin", walletPath);

            Class.forName("oracle.jdbc.OracleDriver");
            System.out.println("✓ Oracle JDBC Driver loaded");

            Properties props = new Properties();
            props.setProperty("user", user);
            props.setProperty("password", password);
            props.setProperty("oracle.net.tns_admin", walletPath);
            props.setProperty("oracle.net.ssl_server_dn_match", "true");

            System.out.println("Connecting to Oracle Cloud (JKS mode)...");
            Connection conn = DriverManager.getConnection(url, props);
            System.out.println("✓ Connection successful!\n");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT 'Success!' AS msg, SYSDATE AS time FROM DUAL");

            if (rs.next()) {
                System.out.println("✓ Test Query Passed:");
                System.out.println("  " + rs.getString("msg"));
                System.out.println("  Time: " + rs.getString("time"));
            }

            rs.close();
            stmt.close();
            conn.close();

            System.out.println("\n========================================");
            System.out.println("✓ JKS WALLET TEST PASSED!");
            System.out.println("========================================");
            System.out.println("\nReady for Railway deployment:");
            System.out.println("1. Include wallet folder in Docker");
            System.out.println("2. Set TNS_ADMIN=/app/wallet");
            System.out.println("3. Use connection: jdbc:oracle:thin:@nm0uo1ntyefptn5b_medium");

        } catch (Exception e) {
            System.err.println("\n========================================");
            System.err.println("✗ JKS TEST FAILED");
            System.err.println("========================================");
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();

            System.err.println("\n⚠️  Alternative: Try mTLS connection without wallet");
            System.err.println("Update pom.xml to use ojdbc11 (21.9+) with oraclepki");
            System.exit(1);
        }
    }
}
