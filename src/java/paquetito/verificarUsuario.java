package paquetito;

/**
 * @author ArrayLabs
 */
import java.sql.*;

public class verificarUsuario {

    public boolean verificarUsuario(String usuario, String contrasena) {
        try {

            Connection con = conexionBase.conectar();
            String sqlTraeUsuario = "select usuario, contrasena from cliente where usuario=? and contrasena=?";
            PreparedStatement stUsuario = con.prepareStatement(sqlTraeUsuario);
            stUsuario.setString(1, usuario);
            stUsuario.setString(2, contrasena);
            System.out.println(usuario+contrasena);
            ResultSet rs = stUsuario.executeQuery();
            rs.next();
            if (rs.getString("usuario").equals(usuario) && rs.getString("contrasena").equals(contrasena)) {
                return true;
            } else {
                System.out.println("No se encontró el usuario");
                return false;
            }
        } catch (Exception error) {
            System.out.println("El error es: " + error);
        }
        return false;
    }
}
