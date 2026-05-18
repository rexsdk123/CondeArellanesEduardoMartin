package paquetito;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author gampl
 */
public class insertarDatosPedido {

    public static String resultado = "";

    public static boolean insertarPedido(guardarDatosPedidos Datos) {
        try {
            String sqlInsertaFecha = "INSERT INTO fecha (fecha_inicio, fecha_fin, hora_inicio, hora_fin) VALUES(?,?,?,?)";
            String sqlInsertaRenta = "INSERT INTO renta (id_fecha, id_cliente, id_producto, id_pago) VALUES (?,?,?,?)";
            String Sid_fecha = "SELECT id_fecha FROM FECHA WHERE fecha_inicio=? AND fecha_fin=? AND hora_inicio=? AND hora_fin=?";
            String Sid_cliente = "SELECT id_cliente FROM CLIENTE WHERE nombreCte=? AND apellidoCte=?";
            String Sid_producto = "SELECT id_producto FROM PRODUCTO WHERE nombreProd=?";

            Connection con = conexionBase.conectar();

            PreparedStatement PIIFecha = con.prepareStatement(sqlInsertaFecha);
            PreparedStatement PIIRenta = con.prepareStatement(sqlInsertaRenta);
            PreparedStatement PSIFecha = con.prepareStatement(Sid_fecha);
            PreparedStatement PSICliente = con.prepareStatement(Sid_cliente);
            PreparedStatement PSIProd = con.prepareStatement(Sid_producto);

            //Como en MySQL y en JAVA no es lo mismo DateTime y Time, tenemos que
            //cambiarlo a la hora de mysql al igual q la hora
            java.sql.Date sqlFechaInicio = java.sql.Date.valueOf(Datos.getFecha_inicio());
            java.sql.Date sqlFechaFin = java.sql.Date.valueOf(Datos.getFecha_fin());

            java.sql.Time sqlHoraInicio = java.sql.Time.valueOf(Datos.getHora_inicio());
            java.sql.Time sqlHoraFin = java.sql.Time.valueOf(Datos.getHora_fin());

            PIIFecha.setDate(1, sqlFechaInicio);
            PIIFecha.setDate(2, sqlFechaFin);
            PIIFecha.setTime(3, sqlHoraInicio);
            PIIFecha.setTime(4, sqlHoraFin);
            PIIFecha.executeUpdate();

            PSIFecha.setDate(1, sqlFechaInicio);
            PSIFecha.setDate(2, sqlFechaFin);
            PSIFecha.setTime(3, sqlHoraInicio);
            PSIFecha.setTime(4, sqlHoraFin);

            PSICliente.setString(1, Datos.getNombre());
            PSICliente.setString(2, Datos.getApellido());

            PSIProd.setString(1, Datos.getProducto2());

            ResultSet apo = PSIFecha.executeQuery();
            ResultSet apon = PSICliente.executeQuery();
            ResultSet apon2 = PSIProd.executeQuery();

            if (apo.next() && apon.next() && apon2.next()) {
                String apo1 = apo.getString("id_fecha");
                String apon1 = apon.getString("id_cliente");
                String apon21 = apon2.getString("id_producto");
                PIIRenta.setString(1, apo1);
                PIIRenta.setString(2, apon1);
                PIIRenta.setString(3, apon21);
                PIIRenta.setInt(4, Datos.getIdPago());
                PIIRenta.executeUpdate();
                con.close();
                return true;
            } else {
                System.out.println("No se encontro el usuario");
                con.close();
                return false;
            }

        } catch (Exception error) {
            System.out.println("El error es: " + error);
            return false;
        }
    }

    public static boolean insertarPedidoActualizado(guardarDatosPedidos Datos, String usuario, String contrasena) {

        try {

            String sqlInsertaFecha = "INSERT INTO fecha (fecha_inicio, fecha_fin, hora_inicio, hora_fin) VALUES(?,?,?,?)";

            // 🔥 AQUÍ YA INCLUIMOS id_pago
            String sqlInsertaRenta = "INSERT INTO renta (id_fecha, usuario, id_producto, id_pago) VALUES (?,?,?,?)";

            String Sid_fecha = "SELECT id_fecha FROM fecha WHERE fecha_inicio=? AND fecha_fin=? AND hora_inicio=? AND hora_fin=?";
            String Sid_cliente = "SELECT usuario FROM cliente WHERE usuario=? AND contrasena=?";
            String Sid_producto = "SELECT id_producto FROM producto WHERE nombreProd=?";

            Connection con = conexionBase.conectar();

            PreparedStatement PIIFecha = con.prepareStatement(sqlInsertaFecha);
            PreparedStatement PIIRenta = con.prepareStatement(sqlInsertaRenta);
            PreparedStatement PSIFecha = con.prepareStatement(Sid_fecha);
            PreparedStatement PSICliente = con.prepareStatement(Sid_cliente);
            PreparedStatement PSIProd = con.prepareStatement(Sid_producto);

            // 🔹 CONVERSIONES
            java.sql.Date sqlFechaInicio = java.sql.Date.valueOf(Datos.getFecha_inicio());
            java.sql.Date sqlFechaFin = java.sql.Date.valueOf(Datos.getFecha_fin());

            java.sql.Time sqlHoraInicio = java.sql.Time.valueOf(Datos.getHora_inicio());
            java.sql.Time sqlHoraFin = java.sql.Time.valueOf(Datos.getHora_fin());

            // 🔹 INSERT FECHA
            PIIFecha.setDate(1, sqlFechaInicio);
            PIIFecha.setDate(2, sqlFechaFin);
            PIIFecha.setTime(3, sqlHoraInicio);
            PIIFecha.setTime(4, sqlHoraFin);
            PIIFecha.executeUpdate();

            // 🔹 OBTENER ID FECHA
            PSIFecha.setDate(1, sqlFechaInicio);
            PSIFecha.setDate(2, sqlFechaFin);
            PSIFecha.setTime(3, sqlHoraInicio);
            PSIFecha.setTime(4, sqlHoraFin);

            // 🔹 VALIDAR USUARIO
            PSICliente.setString(1, usuario);
            PSICliente.setString(2, contrasena);

            // 🔹 OBTENER PRODUCTO
            PSIProd.setString(1, Datos.getProducto2());

            ResultSet rsFecha = PSIFecha.executeQuery();
            ResultSet rsCliente = PSICliente.executeQuery();
            ResultSet rsProducto = PSIProd.executeQuery();

            if (rsFecha.next() && rsCliente.next() && rsProducto.next()) {

                String idFecha = rsFecha.getString("id_fecha");
                String idProducto = rsProducto.getString("id_producto");

                // 🔥 DEBUG (opcional pero GOD)
                System.out.println("ID PAGO QUE LLEGA: " + Datos.getIdPago());

                // 🔥 INSERT FINAL CON FK
                PIIRenta.setString(1, idFecha);
                PIIRenta.setString(2, usuario);
                PIIRenta.setString(3, idProducto);
                PIIRenta.setInt(4, Datos.getIdPago());

                PIIRenta.executeUpdate();

                con.close();
                return true;

            } else {
                System.out.println("Error: datos no encontrados");
                con.close();
                return false;
            }

        } catch (Exception error) {
            System.out.println("Error al insertar pedido: " + error);
            return false;
        }
    }

    public String saberNombreProd(int index) {
        int valor = index;
        switch (valor) {
            case 1:
                return "Brincolin chico";
            case 2:
                return "Brincolin mediano";
            case 3:
                return "Brincolin grande";
            case 4:
                return "Brincolin jumbo";
            case 5:
                return "Inflable minion";
            case 6:
                return "Inflable spiderman";
            case 7:
                return "Inflable mario bros";
            case 8:
                return "Inflable batman";
            case 9:
                return "Inflable castillo";
            case 10:
                return "Futbolito grande cafe oscuro";
            case 11:
                return "Futbolito grande cafe";
            case 12:
                return "Futbolito chico";
            case 13:
                return "Rockola";
        }
        return null;
    }

}
