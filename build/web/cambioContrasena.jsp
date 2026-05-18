<%-- 
    Document   : cambioContrasena
    Created on : 24 jun 2025, 6:47:34 p.m.
    Author     : Mercury
--%>

<%@page import="paquetito.cambiarContrasena"%>
<%@page import="paquetito.guardarDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="1; url=pedidos.html">
        <title>Cambiar contraseña</title>
        <link rel="stylesheet" href="CSS/red.css">
    </head>
    <body>
        <%
            try {
                String telefonoS = request.getParameter("telefono");
                int telefono = Integer.parseInt(request.getParameter("telefono"));
                String apellido=request.getParameter("apellido");
                String usuario = request.getParameter("username");
                String contra = request.getParameter("contra");
                String contraver = request.getParameter("contraver");

                if (telefonoS != null || usuario != null || contra != null || contraver != null) {
                    if (contra.equals(contraver)) {
                        guardarDatos GD = new guardarDatos();
                        GD.setUsuario(usuario);
                        GD.setApellido(apellido);
                        GD.setTelefono(telefono);
                        GD.setContrasena(contra);
                        if (cambiarContrasena.actualizaContrasena(GD)) {
                            out.println("<script>alert('Contraseña actualizada')</script>");
                        } else {
                            out.println("<script>alert('Upss hubo un problema')</script>");
                        }
                    } else {
                        out.println("<script>alert('Contraseñas diferentes')</script>");
                    }
                } else {
                    out.println("<script>alert('Ingrese los campos correctamente')</script>");
                }

            } catch (Exception error) {
                out.println("<script>alert('El error es: " + error + "')</script>");
            }


        %>
        <p class="red">Redirigiendo...</p>
    </body>
</html>
