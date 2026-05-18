<%-- 
    Document   : cerrarSesion
    Created on : 20 nov. 2025, 09:23:53
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/cerrarSesion.css">
        <title>CerrarSesion</title>
    </head>
    <body>
        <%
            float totalPagar = 0;
            session.setAttribute("usuario", null);
            session.setAttribute("contrasena", null);

            String usuario = (String) session.getAttribute("usuario");
            String contrasena = (String) session.getAttribute("contrasena");
            if (usuario == null && contrasena == null) {
        %>
        <div class="cierre-box">
            <h1>Se ha cerrado Sesión correctamente</h1>
            <a href="indexJSP.jsp">Volver</a>
        </div>
        <%
        } else {
        %>
        <div class="cierre-box">
            <h1>No se pudo cerrado Sesión correctamente</h1>
            <a href="indexJSP.jsp">Volver</a>
        </div>
        <%
            }
        %>
    </body>
</html>
