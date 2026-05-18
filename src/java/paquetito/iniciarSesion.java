package paquetito;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author ArrayLabs
 */
public class iniciarSesion {
    public String IDUsuario;
    public String IDContrasena;

    public String getIDUsuario() {
        return IDUsuario;
    }

    public void setIDUsuario(String IDUsuario) {
        this.IDUsuario = IDUsuario;
    }

    public String getIDContrasena() {
        return IDContrasena;
    }

    public void setIDContrasena(String IDContrasena) {
        this.IDContrasena = IDContrasena;
    }

    
    public String IDUsuario(String usuario, String contrasena) {
        try {
            Connection con = conexionBase.conectar();
            String sqlTraeUsuario = "select usuario, contrasena from cliente where usuario=? and contrasena=?";
            PreparedStatement stUsuario = con.prepareStatement(sqlTraeUsuario);
            stUsuario.setString(1, usuario);
            stUsuario.setString(2, contrasena);
            System.out.println(usuario + contrasena);
            ResultSet rs = stUsuario.executeQuery();
            rs.next();
            if (rs.getString("usuario").equals(usuario) && rs.getString("contrasena").equals(contrasena)) {
                return rs.getString("usuario");
            } else {
                System.out.println("No se encontró el usuario");
                return null;
            }
        } catch (Exception error) {
            System.out.println("El error es: " + error);
        }
        return null;
    }

    public String IDContrasena(String usuario, String contrasena) {
        try {

            Connection con = conexionBase.conectar();
            String sqlTraeUsuario = "select usuario, contrasena from cliente where usuario=? and contrasena=?";
            PreparedStatement stUsuario = con.prepareStatement(sqlTraeUsuario);
            stUsuario.setString(1, usuario);
            stUsuario.setString(2, contrasena);
            System.out.println(usuario + contrasena);
            ResultSet rs = stUsuario.executeQuery();
            rs.next();
            if (rs.getString("usuario").equals(usuario) && rs.getString("contrasena").equals(contrasena)) {
                return rs.getString("contrasena");
            } else {
                System.out.println("No se encontró el usuario");
                return null;
            }
        } catch (Exception error) {
            System.out.println("El error es: " + error);
        }
        return null;
    }

}
