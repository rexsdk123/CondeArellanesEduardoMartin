
<%@page import="paquetito.guardarDatos"%>
<%@page import="paquetito.guardarDatosPedidos"%>
<%@page import="paquetito.insertarDatosPedido"%>
<%@page import="paquetito.conexionBase"%>
<%@page import="paquetito.insertarDatos"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="shortcut icon" href="img/inflable.png" type="image/x-icon">
        <meta http-equiv="refresh" content="1; url=indexJSP.jsp">
        <link rel="stylesheet" href="CSS/red.css">
        <title>MERCURY: Pedido</title>
    </head>
    <body>
        <%

            ArrayList<guardarDatosPedidos> carrito = (ArrayList<guardarDatosPedidos>) session.getAttribute("carrito");

            if (carrito == null) {
                carrito = new ArrayList<>();
            }
            conexionBase con = new conexionBase();
            insertarDatosPedido set = new insertarDatosPedido();
            guardarDatosPedidos save = new guardarDatosPedidos();

            String cadenita = request.getParameter("enviar");

            String usuarioVerificar = request.getParameter("usuario");
            String contrasenaVerificar = request.getParameter("contrasena");
            String Nombre_categoriaVer = request.getParameter("categoria");
            String Producto2Verificar = set.saberNombreProd(Integer.parseInt(request.getParameter("indexSelecionado")));

            System.out.println(usuarioVerificar);
            System.out.println(contrasenaVerificar);
            System.out.println(Nombre_categoriaVer);
            System.out.println(Producto2Verificar);

            try {
                LocalDate fechaInicioVerificar = LocalDate.parse(request.getParameter("fechaInicio"));
                LocalDate fechaFinVerificar = LocalDate.parse(request.getParameter("fechaFin"));

                LocalTime horaInicioVerificar = LocalTime.parse(request.getParameter("horaInicio"));
                LocalTime horaFinVerificar = LocalTime.parse(request.getParameter("horaFin"));
                if (usuarioVerificar == null || usuarioVerificar.trim().isEmpty()
                        || contrasenaVerificar == null || contrasenaVerificar.trim().isEmpty()
                        || Nombre_categoriaVer == null || Nombre_categoriaVer.trim().isEmpty()
                        || Producto2Verificar == null || Producto2Verificar.trim().isEmpty()) {
                    out.println("<script>alert('Ingrese los datitos')</script>");
                } else {
                    if (cadenita != null) {
                        save.setUsuario(request.getParameter("usuario"));
                        save.setContrasena(request.getParameter("contrasena"));

                        save.setNombre_categoria(request.getParameter("categoria"));
                        save.setProducto2(Producto2Verificar);

                        //Convertimos los String a los dias y horas correspondientes
                        //En MySQL
                        LocalDate fechaInicio = LocalDate.parse(request.getParameter("fechaInicio"));
                        LocalDate fechaFin = LocalDate.parse(request.getParameter("fechaFin"));

                        save.setFecha_inicio(fechaInicio);
                        save.setFecha_fin(fechaFin);

                        LocalTime horaInicio = LocalTime.parse(request.getParameter("horaInicio"));
                        LocalTime horaFin = LocalTime.parse(request.getParameter("horaFin"));

                        save.setHora_inicio(horaInicio);
                        save.setHora_fin(horaFin);

                        carrito.add(save);
                        session.setAttribute("carrito", carrito);

                        out.println("<script>alert('Producto agregado al carrito')</script>");

                    } else {
                        System.out.println("<script>alert('Pequeño bro hackeo el sistema')</script>");
                    }
                }
            } catch (Exception error) {
                out.println("<script>alert('Ingrese datos en los campos requeridos')</script>");
            }

        %>
        <p class="red">Redirigiendo...</p>
    </body>
</html>
