<%-- 
    Document   : iniciarSesion
    Created on : 15 nov 2025, 11:33:14 a.m.
    Author     : ArrayLabs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="paquetito.verificarUsuario"%>
<%@page import="paquetito.iniciarSesion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="1; url=indexJSP.jsp">
                <link rel="stylesheet" href="CSS/red.css">
        <title>Sesion iniciada</title>
    </head>
    <body>
        <%
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");

            if (usuario.isEmpty() || contrasena.isEmpty()) {
                out.print("<script>alert('Ingrese los datos correctamente')</script>");
        %>
        <%
            } else {
                verificarUsuario ver = new verificarUsuario();
                if (ver.verificarUsuario(usuario, contrasena)) {
                    out.print("<script>alert('Se ha iniciado sesion correctamente')</script>");
                    iniciarSesion is = new iniciarSesion();
                    is.setIDUsuario(usuario);
                    is.setIDContrasena(contrasena);
                    session.setAttribute("usuario", usuario);
                    session.setAttribute("contrasena", contrasena);
                } else {
                    out.print("<script>alert('Datos incorrectos')</script>");
                }
            }
        %>
    </body>
    <p class="red">Redirigiendo...</p>
</html>
