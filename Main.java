// simple executable console app to ask for creds, then call database,
import java.sql.*;
import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.print("Enter DB username: ");
    String user = scanner.nextLine();

    System.out.print("Enter DB password: ");
    String password = scanner.nextLine();

    String url = "jdbc:mysql://cse-335-spring-2025.cluster-c924km8o85q2.us-east-1.rds.amazonaws.com:3306/G8";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(url, user, password);
      System.out.println("✅ Connected to MySQL!");

      String sql = "SELECT * FROM CombinedBookData LIMIT 25";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      ResultSetMetaData meta = rs.getMetaData();
      int columnCount = meta.getColumnCount();

      // Print column headers
      for (int i = 1; i <= columnCount; i++) {
        System.out.print(meta.getColumnName(i) + "\t");
      }
      System.out.println();

      // Print rows
      while (rs.next()) {
        for (int i = 1; i <= columnCount; i++) {
          System.out.print(rs.getString(i) + "\t");
        }
        System.out.println();
      }

    } catch (ClassNotFoundException e) {
      System.out.println("❌ JDBC Driver not found: " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("❌ SQL Error: " + e.getMessage());
    } finally {
      try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
      try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
      try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
    }

    scanner.close();
  }
}
