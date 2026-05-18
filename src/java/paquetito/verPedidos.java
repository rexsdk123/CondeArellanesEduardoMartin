package paquetito;

/**
 * @author equipo 4: MERCURY
 */
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

public class verPedidos {

    public ArrayList<insertarDatosGeneral> obtenerDatitos() {
        ArrayList<insertarDatosGeneral> insertarDatitosGeneralito = new ArrayList<>();

        try {
            String select = """
                            select id_renta, cliente.usuario, nombreCte, apellidoCte, telefonoCte, fecha_inicio, fecha_fin, hora_inicio, hora_fin, numero, calle, colonia, nombreProd 
                            from renta inner join cliente on cliente.usuario=renta.usuario
                            inner join fecha on renta.id_fecha=fecha.id_fecha inner join direccion on direccion.id_direccion=cliente.id_direccion
                            inner join producto on producto.id_producto=renta.id_producto;""";
            Connection con = conexionBase.conectar();
            PreparedStatement sta = con.prepareStatement(select);
            ResultSet rs = sta.executeQuery();

            while (rs.next()) {
                //Al giualq eu para ingresar las fechas y horas debemos convertirlas al
                //lenguaje de SQL ahora debemos hacerlo en visceversa
                
                LocalDate fechaInicio=rs.getDate("fecha_inicio").toLocalDate();
                LocalDate fechaFin=rs.getDate("fecha_fin").toLocalDate();
                
                LocalTime horaInicio=rs.getTime("hora_inicio").toLocalTime();
                LocalTime horaFin=rs.getTime("hora_fin").toLocalTime();
                
                
                insertarDatosGeneral rentas = new insertarDatosGeneral();
                rentas.setId_renta(rs.getString("id_renta"));
                rentas.setUsuario(rs.getString("usuario"));
                rentas.setNombre(rs.getString("nombreCte"));
                rentas.setApellido(rs.getString("apellidoCte"));
                rentas.setTelefono(rs.getInt("telefonoCte"));
                
                rentas.setFecha_inicio(fechaInicio);
                rentas.setFecha_fin(fechaFin);
                rentas.setHora_inicio(horaInicio);
                rentas.setHora_fin(horaFin);
                
                rentas.setNumero(rs.getInt("numero"));
                rentas.setCalle(rs.getString("calle"));
                rentas.setColonia(rs.getString("colonia"));
                
                rentas.setProducto2(rs.getString("nombreProd"));
                

                insertarDatitosGeneralito.add(rentas);

            }
            return insertarDatitosGeneralito;

        } catch (Exception error) {
            System.out.println("El error es: " + error);
            return new ArrayList<>();
        }
    }

    public boolean quitarRenta(int id, ArrayList<insertarDatosGeneral> Arraysito, String usuario) {
        try {
            String delete = "delete from renta where id_renta=?";
            Connection con = conexionBase.conectar();
            PreparedStatement sta = con.prepareStatement(delete);
            sta.setInt(1, id);
            int filasAfectaditas = sta.executeUpdate();
            if (filasAfectaditas > 0) {
                for (int i = 0; i < Arraysito.size(); i++) {
                    if (Arraysito.get(i).getUsuario().equals(usuario)) {
                        Arraysito.remove(i);
                        break;
                    }
                }
                System.out.println("Holaaa");
                return true;
            } else {
                System.out.println("AntiHolaaaa");
                return false;
            }
        } catch (Exception error) {
            System.out.println("El error al borrar es: " + error);
            return false;
        }
    }

}
