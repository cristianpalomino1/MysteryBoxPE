package mbpe.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {

    public Connection getConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mbpe?serverTimezone=UTC", "root", "admin");
            System.out.println("conexion exitosa");
            return conexion;
        } catch (SQLException e) {
            System.out.println(e.toString());
            System.out.println("error conexion clase conexion");
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error conexion clase conexion");
            return null;
        }
    }

}
