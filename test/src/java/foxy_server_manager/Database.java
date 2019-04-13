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

    public static int registerUser(String name, String email, String password) {
        try {
            Statement stmt = con.createStatement();
            ResultSet r = stmt.executeQuery("SELECT id FROM `user` Where email='" + email + "'");
//            r.next();
//           r.next();
            if (r.next() == false) {
                stmt.executeUpdate("INSERT INTO `user`(`name`, `email`, `password`) VALUES ('" + name + "','" + email + "','" + password + "')");
                ResultSet id_set = stmt.executeQuery("SELECT id FROM user WHERE email='"+email+"';");
                id_set.next();
                stmt.executeUpdate("CREATE TABLE `hosting`.`user_"+id_set.getInt("id")+"` ( `files` VARCHAR(255) NOT NULL ) ENGINE = InnoDB;");
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    public static int uploadFile(String filename,int id) {
        try {
            System.out.println("id:"+id);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `user_"+id+"` VALUES ('"+ filename +"')");
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    public static int deleteFile(String filename,int id) {
        try {
            System.out.println("id:"+id);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM `user_"+id+"` WHERE  files='"+ filename +"'");
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    public static ResultSet searchFiles(int id) {
        try {
            System.out.println("id:"+id);
            Statement stmt = con.createStatement();
            ResultSet r = stmt.executeQuery("SELECT * FROM user_"+id+";");
            return r;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static String getId(String email){
        try{
            Statement stmt = con.createStatement();
            ResultSet r =stmt.executeQuery("SELECT id FROM user WHERE email='"+email+"';");
            r.next();
            String id = Integer.toString(r.getInt("id"));
            return id;
        }
        catch(Exception e){
        }
        return null;
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
