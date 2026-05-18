<%-- 
    Document   : quitarRenta
    Created on : 15 jun 2025, 9:41:08 a.m.
    Author     : gampl
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="paquetito.insertarDatosGeneral"%>
<%@page import="paquetito.verPedidos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDUSAN: Eliminar renta</title>
        <link rel="stylesheet" href="CSS/quitarPedido.css">
    </head>
    <body>
        <%
            verPedidos DP = new verPedidos();
            String eliminar = request.getParameter("eliminar");
            String usuarioEli = request.getParameter("usuarioEliminar");
            int id = Integer.parseInt(request.getParameter("idEliminar"));
            ArrayList<insertarDatosGeneral> rentitas = DP.obtenerDatitos();
            if (eliminar != null && id >= 0) {
                boolean exito = DP.quitarRenta(id, rentitas, usuarioEli);
                if (exito == true) {
        %>
        <h1>Renta Eliminada exitosamente</h1>
        <form action="verPedidosJSP.jsp" name="formulario" method="post">
            <input type="hidden" name="usuario" value="admin">
            <input type="hidden" name="contrasena" value="abc123">
            <input type="submit" name="enviar" value="Volver" class="volver">
        </form>
        <%
        } else {
        %>
        <h1>No fue posible eliminar la renta 1</h1>
        <%
            }
        } else {
        %>
        <h1>No fue posible eliminar la renta 2</h1>
        <%
            }
        %>
    </body>
</html>
