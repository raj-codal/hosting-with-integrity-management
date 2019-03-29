package foxy_server_manager;

import java.sql.*;

public class Database {

    private static final String url = "jdbc:mysql://localhost:3306/hosting";
    private static Connection con;

    public static void connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, "root", "");
            System.out.println("connected");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static int registerUser(String name, String id, String email, String password) {
        try {
            Statement stmt = con.createStatement();
            ResultSet r = stmt.executeQuery("SELECT id FROM `user` Where email='" + email + "'");
//            r.next();
//           r.next();
            if (r.next() == false) {
                stmt.executeUpdate("INSERT INTO `user`(`name`, `email`, `id`, `password`) VALUES ('" + name + "','" + email + "','" + id + "','" + password + "')");
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static String login(String email, String password) {
        try {
            Statement stmt = con.createStatement();
            
            ResultSet r = stmt.executeQuery("SELECT name FROM `user` Where email=\"" + email.trim() + "\" AND password=\"" + password.trim() + "\"");
            r.beforeFirst();
            if (r.next()) {
                return r.getString(1);
//                return "Valid";
            } else {
                r = stmt.executeQuery("SELECT name FROM `user` Where email='" + email +"'");
                if(r.next()){
                    return "Invalid password";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Not a registered user";
    }
}
