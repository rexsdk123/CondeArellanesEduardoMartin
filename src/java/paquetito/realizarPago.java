package paquetito;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class realizarPago {

    public static int insertarPago(
            String usuario,
            String metodo,
            String num_tarjeta,
            String nombre_tarjeta,
            String fecha_exp,
            String cvv
    ) {

        int idPago = -1;

        try {
            Connection con = conexionBase.conectar();

            String sql;

            // 🔹 INSERT DEL PAGO
            if (metodo.equals("tarjeta")) {

                sql = "INSERT INTO pago(usuario, metodo_pago, num_tarjeta, nombre_tarjeta, fecha_exp, cvv) VALUES (?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, usuario);
                ps.setString(2, metodo);
                ps.setString(3, num_tarjeta);
                ps.setString(4, nombre_tarjeta);
                ps.setString(5, fecha_exp);
                ps.setString(6, cvv);

                ps.executeUpdate();

            } else {

                sql = "INSERT INTO pago(usuario, metodo_pago) VALUES (?,?)";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, usuario);
                ps.setString(2, metodo);

                ps.executeUpdate();
            }

            // 🔥 OBTENER EL ÚLTIMO ID
            String sql2 = "SELECT id_pago FROM pago WHERE usuario = ? ORDER BY id_pago DESC LIMIT 1";
            PreparedStatement ps2 = con.prepareStatement(sql2);

            ps2.setString(1, usuario);

            ResultSet rs = ps2.executeQuery();

            if (rs.next()) {
                idPago = rs.getInt("id_pago");
            }

            con.close();

        } catch (Exception e) {
            System.out.println("Error al insertar pago: " + e);
        }

        return idPago;
    }
}