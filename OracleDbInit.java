import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.ArrayList;
import java.util.List;

public class OracleDbInit {

    public static void main(String[] args) {
        String walletPath = System.getProperty("user.dir") + "\\wallet";

        // Ordered list of scripts to execute
        String[] scripts = {
                "oracle-init.sql", // Base Schema (MVP)
                "oracle-seed.sql", // Base Seed Data
                "hrm-schema.sql", // HR Schema (Employees, Depts)
                "insert-sample-employees.sql", // HR Seed Data (Inserts into employees)
                "factory-schema.sql", // Factory Schema (Plants, Lines)
                "inventory-schema.sql", // Inventory Schema
                "fix-production-schema.sql" // Schema Enhancements (FKs, columns, PL/SQL blocks)
        };

        System.out.println("========================================");
        System.out.println("Oracle Database Initialization (Full)");
        System.out.println("========================================");
        System.out.println("Wallet Location: " + walletPath);

        System.setProperty("oracle.net.tns_admin", walletPath);
        System.setProperty("oracle.net.wallet_location", walletPath);

        String tnsAlias = "nm0uo1ntyefptn5b_medium";
        String user = "ADMIN";
        String password = "NVdh49CQE3gFMWtb0ebJ";
        String url = "jdbc:oracle:thin:@" + tnsAlias;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Properties props = new Properties();
            props.setProperty("user", user);
            props.setProperty("password", password);
            props.setProperty("oracle.net.tns_admin", walletPath);

            System.out.println("Connecting to database...");
            try (Connection conn = DriverManager.getConnection(url, props)) {
                System.out.println("✓ Connected!");

                for (String scriptName : scripts) {
                    String scriptPath = System.getProperty("user.dir") + "\\scripts\\" + scriptName;
                    executeScript(conn, scriptPath);
                }

                // Sync tp_user/tp_role for legacy auth compatibility
                insertInitialData(conn);

                System.out.println("\n✓ All scripts executed and database completed.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    private static void executeScript(Connection conn, String scriptPath) throws IOException, SQLException {
        String scriptName = scriptPath.substring(scriptPath.lastIndexOf("\\") + 1);
        System.out.println("\n----------------------------------------");
        System.out.println("Executing: " + scriptName);
        System.out.println("----------------------------------------");

        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new FileReader(scriptPath))) {
            String line;
            while ((line = br.readLine()) != null) {
                line = line.trim();
                // Ignore comments and empty lines
                if (line.isEmpty() || line.startsWith("--")) {
                    continue;
                }

                sb.append(line).append("\n"); // Acculumate with newlines

                String buffer = sb.toString().trim();
                boolean isPlSql = buffer.toUpperCase().startsWith("DECLARE") ||
                        buffer.toUpperCase().startsWith("BEGIN");

                boolean execute = false;
                String sqlToRun = null;

                if (line.equals("/")) {
                    // PL/SQL Block end
                    execute = true;
                    // Remove the slash
                    sqlToRun = sb.toString().replace("/", "").trim();
                } else if (!isPlSql && line.endsWith(";")) {
                    // Normal SQL statement end (and NOT inside a pending PL/SQL block)
                    execute = true;
                    // Remove trailing semicolon
                    sqlToRun = sb.toString().trim();
                    if (sqlToRun.endsWith(";")) {
                        sqlToRun = sqlToRun.substring(0, sqlToRun.length() - 1);
                    }
                }

                if (execute) {
                    if (sqlToRun != null && !sqlToRun.isEmpty()) {
                        try (Statement stmt = conn.createStatement()) {
                            stmt.execute(sqlToRun);
                            System.out.print(".");
                        } catch (SQLException e) {
                            if (e.getErrorCode() == 955) { // ORA-00955: Name already used
                                System.out.print("S");
                            } else if (e.getErrorCode() == 1) { // ORA-00001: Unique constraint
                                System.out.print("D");
                            } else if (e.getErrorCode() == 1430) { // ORA-01430: Column exists
                                System.out.print("E");
                            } else if (e.getErrorCode() == 2275) { // ORA-02275: Ref constraint exists
                                System.out.print("K");
                            } else if (e.getErrorCode() == 2260) { // ORA-02260: Multiple PK
                                System.out.print("P");
                            } else if (e.getErrorCode() == 1442) { // ORA-01442: Modify null to not null
                                System.out.print("N");
                            } else if (e.getErrorCode() == 1418) { // ORA-01418: Index doesn't exist
                                System.out.print("I");
                            } else if (e.getErrorCode() == 2261) { // ORA-02261: Index already exists
                                System.out.print("X");
                            } else {
                                System.err.println("\n[WARN] Error: "
                                        + (sqlToRun.length() > 60 ? sqlToRun.substring(0, 60) + "..." : sqlToRun));
                                System.err.println("       Msg: " + e.getMessage());
                            }
                        }
                    }
                    sb.setLength(0);
                }
            }
        } catch (IOException e) {
            System.err.println("Failed to read: " + scriptPath + " (" + e.getMessage() + ")");
        }
        System.out.println("\nDone.");
    }

    private static void insertInitialData(Connection conn) throws SQLException {
        System.out.println("\nSyncing tp_user authentication data...");
        try (Statement stmt = conn.createStatement()) {
            // 1. Insert Roles
            String[] roles = { "ADMIN", "MANAGER", "OPERATOR", "VIEWER", "PRODUCTION", "QUALITY", "LOGISTICS" };
            for (String role : roles) {
                try {
                    stmt.execute("INSERT INTO tp_role (role_code) VALUES ('" + role + "')");
                } catch (SQLException e) {
                    if (e.getErrorCode() != 1) {
                    }
                }
            }

            // 2. Insert Users (Legacy sync)
            String[][] users = {
                    { "admin", "admin123", "Administrator", "ADMIN", "MANAGER", "OPERATOR", "VIEWER" },
                    { "manager", "manager123", "Manager", "MANAGER", "VIEWER" },
                    { "operator", "operator123", "Operator", "OPERATOR", "VIEWER" },
                    { "viewer", "viewer123", "Viewer", "VIEWER" },
                    { "prod001", "prod123", "Production Manager", "MANAGER", "VIEWER", "PRODUCTION" },
                    { "worker001", "work123", "Factory Worker", "OPERATOR", "VIEWER", "PRODUCTION" }
            };

            for (String[] userData : users) {
                String username = userData[0];
                String password = "{noop}" + userData[1];
                String displayName = userData[2];

                // Insert User
                try {
                    boolean exists = stmt.executeQuery("SELECT 1 FROM tp_user WHERE username = '" + username + "'")
                            .next();
                    if (!exists) {
                        stmt.execute("INSERT INTO tp_user (username, password_hash, display_name, enabled_yn) " +
                                "VALUES ('" + username + "', '" + password + "', '" + displayName + "', 'Y')");
                        System.out.print("U");
                    }
                } catch (SQLException e) {
                }

                // Assign Roles
                int userId = getUserId(stmt, username);
                if (userId != -1) {
                    for (int i = 3; i < userData.length; i++) {
                        String roleCode = userData[i];
                        int roleId = getRoleId(stmt, roleCode);
                        if (roleId != -1) {
                            try {
                                boolean linkExists = stmt.executeQuery(
                                        "SELECT 1 FROM tp_user_role WHERE user_id=" + userId + " AND role_id=" + roleId)
                                        .next();
                                if (!linkExists) {
                                    stmt.execute("INSERT INTO tp_user_role (user_id, role_id) VALUES (" + userId + ", "
                                            + roleId + ")");
                                }
                            } catch (SQLException e) {
                            }
                        }
                    }
                }
            }
            System.out.println("\n✓ tp_user synced");
        }
    }

    private static int getUserId(Statement stmt, String username) {
        try {
            var rs = stmt.executeQuery("SELECT user_id FROM tp_user WHERE username='" + username + "'");
            if (rs.next())
                return rs.getInt(1);
        } catch (SQLException e) {
        }
        return -1;
    }

    private static int getRoleId(Statement stmt, String roleCode) {
        try {
            var rs = stmt.executeQuery("SELECT role_id FROM tp_role WHERE role_code='" + roleCode + "'");
            if (rs.next())
                return rs.getInt(1);
        } catch (SQLException e) {
        }
        return -1;
    }
}
