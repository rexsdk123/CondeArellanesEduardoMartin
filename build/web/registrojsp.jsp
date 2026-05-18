<%-- 
    Document   : registrojsp
    Created on : 20 abr 2025, 6:31:00 p.m.
    Author     : gampl
--%>

<%@page import= "paquetito.conexionBase"%>
<%@page import= "paquetito.guardarDatos"%>
<%@page import= "paquetito.insertarDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="shortcut icon" href="img/inflable.png" type="image/x-icon">
        <meta http-equiv="refresh" content="1; url=index.html">
        <link rel="stylesheet" href="CSS/red.css">
        <title>MERCURY: Registro</title>
    </head>
    <body>
        <%
            conexionBase con = new conexionBase();
            insertarDatos set = new insertarDatos();
            guardarDatos save = new guardarDatos();

            String cadenita = request.getParameter("enviar");

            String nombreRegistro = request.getParameter("nombre");
            String apellidoRegistro = request.getParameter("apellido");
            String telefonoRegistro = request.getParameter("telefono");
            String numeroCDRegistro = request.getParameter("numeroCD");
            String calleRegistro = request.getParameter("calle");
            String coloniaRegistro = request.getParameter("colonia");

            int redire = 0;

            if (nombreRegistro == "" || apellidoRegistro == "" || telefonoRegistro == "" || numeroCDRegistro == "" || calleRegistro == "" || coloniaRegistro == "") {
        %>
        <p class="red">
            Ingrese los datos correctamente...
        </p>
        <script>
            setTimeout(function () {
                window.location.href = "registros.html";
            }, 900);
        </script>
        <%
                return;
            } else {
                if (cadenita != null) {

                    save.setUsuario(request.getParameter("usuario"));
                    save.setNombre(request.getParameter("nombre"));
                    save.setApellido(request.getParameter("apellido"));
                    save.setTelefono(Integer.parseInt(request.getParameter("telefono")));
                    save.setNumero(Integer.parseInt(request.getParameter("numeroCD")));
                    save.setCalle(request.getParameter("calle"));
                    save.setColonia(request.getParameter("colonia"));
                    save.setContrasena(request.getParameter("contrasena"));

                    int numeroIDDireccion = insertarDatos.insertarDireccion(save);

                    if (numeroIDDireccion != -1) {
                        boolean exito = insertarDatos.insertarPersona(save, numeroIDDireccion);
                        if (exito) {
                            out.print("<script>alert('Datos guardados exitosamente')</script>");
                        } else {
                            out.print("<script>alert('Ya existe un usuario con ese nombre. Utilice otro')</script>");
                        }
                    } else {
                        out.print("<script>alert('Error al registrar dirección.')</script>");
                    }
                }
            }


        %>
        <p class="red">Redirigiendo...</p>
    </body>
</html>
