<%-- 
    Document   : verPedidosJSP
    Created on : 14 jun 2025, 11:39:02 a.m.
    Author     : Equipo 4: Mercury
--%>

<%@page import="paquetito.verPedidos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="paquetito.insertarDatosGeneral"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PEDIDOS</title>
        <link rel="stylesheet" href="CSS/verPedidosJSP.css">
    </head>
    <body>
        <%
            // Apartado de funciones
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");
            if ("admin".equals(usuario) && "abc123".equals(contrasena)) {
        %>
        <h1>PEDIDOS DE CLIENTES</h1>

        <%
            verPedidos DP = new verPedidos();
            ArrayList<insertarDatosGeneral> rentitas = DP.obtenerDatitos();
            if (rentitas.isEmpty()) {
        %>
        <h1>Enhorabuena!!</h1>
        <h2>No hay ninguna renta en curso</h2>
        <a href="indexJSP.jsp" class="link">Regresar al inicio</a>
        <%
        } else {
            int tamanoArray = rentitas.size();
            for (int i = 0; i < tamanoArray; i++) {
                insertarDatosGeneral datito = rentitas.get(i);

        %>
        <table>
            <tr>
                <th>Nombre</th> 
                <th>Apellido</th> 
                <th>Producto</th> 
                <th>Teléfono</th>
                <th>Fecha Inicio</th> 
                <th>Fecha Fin</th> 
                <th>Hora Inicio</th> 
                <th>Hora Fin</th> 
                <th>Numero</th>
                <th>Calle</th>
                <th>Colonia</th>
                <th>Eliminar</th>
            </tr>
            <tr>
                <th><%=datito.getNombre()%></th>
                <th><%=datito.getApellido()%></th>
                <th><%=datito.getProducto2()%></th>
                <th><%=datito.getTelefono()%></th>
                <th><%=datito.getFecha_inicio()%></th>
                <th><%=datito.getFecha_fin()%></th>
                <th><%=datito.getHora_inicio()%></th>
                <th><%=datito.getHora_fin()%></th>
                <th><%=datito.getNumero()%></th>
                <th><%=datito.getCalle()%></th>
                <th><%=datito.getColonia()%></th>
                <th>
                    <form action="quitarRenta.jsp" method="post" name="formularioEliminar">
                        <input type="submit" name="eliminar" value="Eliminar" class="enviar">
                        <input type="hidden" name="idEliminar" value="<%=datito.getId_renta()%>">
                        <input type="hidden" name="usuarioEliminar" value="<%=datito.getUsuario()%>">
                    </form>
                </th>
            </tr>
            <%
                }
            %>
        </table>
        <a href="indexJSP.jsp" class="link">Regresar al inicio</a>
        <%
            }
        } else {
        %>
        <h2>Usuario o contraseña incorrectos</h2>
        <h3>Por favor intentelo de nuevo</h3>
        <a href="indexJSP.jsp" class="link">Regresar al inicio</a>
        <%
            }
        %>
    </body>
</html>
