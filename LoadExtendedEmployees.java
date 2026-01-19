import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;

public class LoadExtendedEmployees {
    private static final String JDBC_URL = "jdbc:oracle:thin:@nm0uo1ntyefptn5b_medium?TNS_ADMIN=c:/Users/junse/antigravity_project/tp_manufacturing_execution_system/wallet";
    private static final String USERNAME = "ADMIN";
    private static final String PASSWORD = "NVdh49CQE3gFMWtb0ebJ";

    public static void main(String[] args) throws Exception {
        System.out.println("=== Loading Extended Employee Data ===");

        Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        conn.setAutoCommit(false);

        try {
            // Execute the SQL script
            String scriptPath = "scripts/insert-extended-employees.sql";
            String content = new String(Files.readAllBytes(Paths.get(scriptPath)));

            // Split by semicolons and execute each statement
            String[] statements = content.split(";");
            int executedCount = 0;

            try (Statement stmt = conn.createStatement()) {
                for (String sql : statements) {
                    sql = sql.trim();
                    if (sql.isEmpty() || sql.startsWith("--")) {
                        continue;
                    }

                    // Handle COMMIT separately
                    if (sql.equalsIgnoreCase("COMMIT")) {
                        conn.commit();
                        System.out.println("✓ Transaction committed");
                        continue;
                    }

                    try {
                        stmt.execute(sql);
                        executedCount++;

                        if (sql.toUpperCase().startsWith("INSERT INTO EMPLOYEES")) {
                            System.out.println("✓ Employee inserted");
                        } else if (sql.toUpperCase().startsWith("INSERT INTO EMPLOYEE_ROLES")) {
                            System.out.print(".");
                        }
                    } catch (Exception e) {
                        // Skip errors for duplicate entries
                        if (!e.getMessage().contains("unique constraint")) {
                            System.err.println("Error executing: " + sql.substring(0, Math.min(50, sql.length())));
                            System.err.println("  " + e.getMessage());
                        }
                    }
                }
            }

            conn.commit();
            System.out.println("\n\n=== Summary ===");
            System.out.println("Total statements executed: " + executedCount);
            System.out.println("✓ Extended employee data loaded successfully!");

        } catch (Exception e) {
            conn.rollback();
            throw e;
        } finally {
            conn.close();
        }
    }
}
