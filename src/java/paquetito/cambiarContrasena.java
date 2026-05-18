package paquetito;

/**
 * @author Conde Arellanes Eduardo Martin
 */
import java.sql.Connection;
import java.sql.PreparedStatement;

public class cambiarContrasena {

    public static String resultado;

    public static boolean actualizaContrasena(guardarDatos per) {
        try {
            String sqlInserta = "update cliente set contrasena=? where telefonoCte=? and apellidoCte=? and usuario=?";
            Connection con = conexionBase.conectar();
            PreparedStatement sentencia = con.prepareStatement(sqlInserta);
            sentencia.setString(1, per.getContrasena());
            sentencia.setInt(2, per.getTelefono());
            sentencia.setString(3, per.getApellido());
            sentencia.setString(4, per.getUsuario());
            sentencia.executeUpdate();

            int filas = sentencia.executeUpdate();

            if (filas > 0) {
                System.out.println("<script>alert('El registro fue actualizado')</script>");
                return true;
            } else {
                System.out.println("<script>alert('El registro no fue actualizado')</script>");
                return false;
            }
        } catch (Exception error) {
            System.out.println("<script>alert('El error es'" + error.toString() + ")</script>");
            return false;
        }
    }
}
