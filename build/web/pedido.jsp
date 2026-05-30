<%@page import="java.util.ArrayList"%>
<%@page import="paquetito.guardarDatosPedidos"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="shortcut icon" href="img/inflable.png" type="image/x-icon">
        <link rel="stylesheet" href="CSS/red.css">
        <title>MERCURY: Pedido</title>
    </head>
    <body>

```
    <%
        guardarDatosPedidos save = new guardarDatosPedidos();

        String cadenita = request.getParameter("enviar");

        String usuarioVerificar = request.getParameter("usuario");
        String contrasenaVerificar = request.getParameter("contrasena");
        String nombreCategoriaVer = request.getParameter("categoria");
        String productoVerificar = request.getParameter("IndexSelecionado");

        System.out.println(usuarioVerificar);
        System.out.println(contrasenaVerificar);
        System.out.println(nombreCategoriaVer);
        System.out.println(productoVerificar);

        try {

            LocalDate.parse(request.getParameter("fechaInicio"));
            LocalDate.parse(request.getParameter("fechaFin"));

            LocalTime.parse(request.getParameter("horaInicio"));
            LocalTime.parse(request.getParameter("horaFin"));

            if (usuarioVerificar == null || usuarioVerificar.trim().isEmpty()
                    || contrasenaVerificar == null || contrasenaVerificar.trim().isEmpty()
                    || nombreCategoriaVer == null || nombreCategoriaVer.trim().isEmpty()
                    || productoVerificar == null || productoVerificar.trim().isEmpty()) {

                out.println("<script>alert('Ingrese los datos')</script>");

            } else {

                if (cadenita != null) {

                    save.setUsuario(usuarioVerificar);
                    save.setContrasena(contrasenaVerificar);

                    save.setNombre_categoria(nombreCategoriaVer);
                    save.setProducto2(productoVerificar);

                    LocalDate fechaInicio = LocalDate.parse(request.getParameter("fechaInicio"));
                    LocalDate fechaFin = LocalDate.parse(request.getParameter("fechaFin"));

                    save.setFecha_inicio(fechaInicio);
                    save.setFecha_fin(fechaFin);

                    LocalTime horaInicio = LocalTime.parse(request.getParameter("horaInicio"));
                    LocalTime horaFin = LocalTime.parse(request.getParameter("horaFin"));

                    save.setHora_inicio(horaInicio);
                    save.setHora_fin(horaFin);

                    ArrayList<guardarDatosPedidos> carrito
                            = (ArrayList<guardarDatosPedidos>) session.getAttribute("carrito");

                    if (carrito == null) {
                        carrito = new ArrayList<guardarDatosPedidos>();
                    }

                    carrito.add(save);

                    session.setAttribute("carrito", carrito);

                    session.setAttribute("usuario", usuarioVerificar);

                    response.sendRedirect("pagarCuenta.jsp");
                    session.setAttribute("origenPago", "pedido");
                    return;

                } else {

                    out.println("<script>alert('Acceso no válido')</script>");

                }
            }

        } catch (Exception error) {

            System.out.println("Error: " + error);

            out.println("<script>alert('Ingrese datos válidos en todos los campos')</script>");

        }
    %>

    <p class="red">Redirigiendo...</p>

</body>
```

</html>
