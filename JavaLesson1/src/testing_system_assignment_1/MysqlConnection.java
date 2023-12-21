package testing_system_assignment_1;
import java.sql.*;

class MysqlConnection {
    public static void main(String args[]) throws SQLException {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/Training", "root", "123456");
            Statement stmt = conn.createStatement();
//            ResultSet rs = stmt.executeQuery("select * from Account");
//            while (rs.next()) {
//                System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3)+ "  " + rs.getString(4));
//            }
            ResultSet rs = stmt.executeQuery("select * from Position");
            while (rs.next()) {
                System.out.println(rs.getInt(1) + "  " + rs.getString(2));
            }
            
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }
}  