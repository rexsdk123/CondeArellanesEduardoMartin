<%@page import="java.util.ArrayList"%>
<%@page import="paquetito.guardarDatosPedidos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String eliminar = request.getParameter("eliminar");

if (eliminar != null) {

    int id = Integer.parseInt(request.getParameter("idEliminar"));

    ArrayList<guardarDatosPedidos> carrito =
            (ArrayList<guardarDatosPedidos>) session.getAttribute("carrito");

    if (carrito != null && id >= 0 && id < carrito.size()) {

        carrito.remove(id);

        session.setAttribute("carrito", carrito);

        response.sendRedirect("carritoF.jsp");
        return;

    }
}

%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Error</title>
    </head>
    <body>
        <h1>No fue posible eliminar el producto</h1>
        <a href="carritoF.jsp">Volver al carrito</a>
    </body>
</html>
