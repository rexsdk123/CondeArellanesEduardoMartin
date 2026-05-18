package paquetito;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

/**
 * @author Arraylabs
 */
public class carritoCompras {

    public ArrayList<insertarDatosTraerPedido> obtenerPedidos(String usuario) {
        ArrayList<insertarDatosTraerPedido> traerDatitos = new ArrayList<>();
        try {

            String select = """
                    select * from renta inner join producto on producto.id_producto=renta.id_producto 
                            inner join fecha on fecha.id_fecha=renta.id_fecha inner join nom_ctg on nom_ctg.id_ctg=producto.id_ctg
                            where usuario=?;""";
            Connection con = conexionBase.conectar();
            PreparedStatement sta = con.prepareStatement(select);
            sta.setString(1, usuario);

            ResultSet rs = sta.executeQuery();

            while (rs.next()) {
                insertarDatosTraerPedido carrito = new insertarDatosTraerPedido();

                carrito.setCategoria(rs.getString("nombre"));
                carrito.setProducto(rs.getString("nombreProd"));
                carrito.setPrecio(rs.getFloat("precio"));

                LocalDate fechaInicio = rs.getDate("fecha_inicio").toLocalDate();
                LocalDate fechaFin = rs.getDate("fecha_fin").toLocalDate();

                LocalTime horaInicio = rs.getTime("hora_inicio").toLocalTime();
                LocalTime horaFin = rs.getTime("hora_fin").toLocalTime();

                carrito.setFI(fechaInicio);
                carrito.setFF(fechaFin);
                carrito.setHI(horaInicio);
                carrito.setHF(horaFin);
                
                carrito.setNombreUsuario(usuario);
                carrito.setIdRenta(rs.getInt("id_renta"));

                traerDatitos.add(carrito);
            }
            return traerDatitos;
        } catch (Exception error) {
            System.out.println("El error es: " + error);
            return null;
        }

    }

    public boolean saberPedidos(String usuario) {
        ArrayList<insertarDatosTraerPedido> traerDatitos = new ArrayList<>();
        try {

            String select = """
                            select * from renta inner join producto on producto.id_producto=renta.id_producto 
                            inner join fecha on fecha.id_fecha=renta.id_fecha where usuario=?;""";
            Connection con = conexionBase.conectar();
            PreparedStatement sta = con.prepareStatement(select);
            sta.setString(1, usuario);

            ResultSet rs = sta.executeQuery();

            while (rs.next()) {
                return true;
            }

        } catch (Exception error) {
            System.out.println("El error es: " + error);
            return false;
        }
        return false;
    }

}
