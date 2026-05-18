package paquetito;

/**
 * EQUIPO 4: EDUSAN
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class conexionBase {

    public static Connection conectar() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EDUSAN5", "root", "n0m3l0");
            return con;
        } catch (Exception error) {
            System.out.println("El error es: " + error);
            return null;
        }

    }

}
