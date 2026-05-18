package paquetito;

/**
 * EQUIPO 4: EDUSAN
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;

public class insertarDatos {

    public static String resultado = "";

    public static boolean insertarPersona(guardarDatos Datos, int direccion) {
        try {
            Connection con = conexionBase.conectar();
            String sqlInserta = "insert into cliente (usuario, nombreCte, apellidoCte, telefonoCte, id_direccion, contrasena) values (?,?,?,?,?,?)";
            PreparedStatement sentencia = con.prepareStatement(sqlInserta);
            sentencia.setString(1, Datos.getUsuario());
            sentencia.setString(2, Datos.getNombre());
            sentencia.setString(3, Datos.getApellido());
            sentencia.setInt(4, Datos.getTelefono());
            sentencia.setInt(5, direccion);
            sentencia.setString(6, Datos.getContrasena());

            sentencia.executeUpdate();
            con.close();
            return true;

        } catch (Exception error) {
            System.out.println("<script>alert('El error es'" + error.toString() + ")</script>");
            return false;
        }
    }

    public static int insertarDireccion(guardarDatos Datos) {

        try {
            Connection con = conexionBase.conectar();
            //Ahora lo hacemos para insertar los datos en la tabla direccion
            //Primero realizamos el de direccion que es el que contiene una llave foranea 
            String sqlInsertaDireccion = "insert into direccion (numero, calle, colonia) values(?, ?, ?)";

            PreparedStatement sentencia2 = con.prepareStatement(sqlInsertaDireccion);

            sentencia2.setInt(1, Datos.getNumero());
            sentencia2.setString(2, Datos.getCalle());
            sentencia2.setString(3, Datos.getColonia());

            sentencia2.executeUpdate();

            //Creamos otra sentencia para traer el ID foraneo
            String sqlTraeIDDireccion = "select id_direccion from direccion where numero=? and calle=? and colonia=?";
            PreparedStatement sentencia21 = con.prepareStatement(sqlTraeIDDireccion);
            sentencia21.setInt(1, Datos.getNumero());
            sentencia21.setString(2, Datos.getCalle());
            sentencia21.setString(3, Datos.getColonia());

            ResultSet rs = sentencia21.executeQuery();
            if (rs.next()) {
                return rs.getInt("id_direccion");
            } else {
                System.out.println("No se encontró la dirección insertada.");
                return -1;
            }
        } catch (Exception error) {
            System.out.println("<script>alert('El error es'" + error.toString() + ")</script>");
            return -1;
        }
    }

}
