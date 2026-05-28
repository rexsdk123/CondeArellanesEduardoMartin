<%@page import="java.util.ArrayList"%>
<%@page import="paquetito.guardarDatosPedidos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Nstyle3.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="CSS/red.css">
        <title>Carrito</title>
    </head>
    <body>

        <%
            float totalPagar = 0;

            String usuario = (String) session.getAttribute("usuario");
            String contrasena = (String) session.getAttribute("contrasena");

            if (usuario == null || contrasena == null) {
                out.print("<script>alert('Inicie sesión en una cuenta')</script>");
        %>
        <p class="red">Redirigiendo...</p>
        <%
        } else {

            ArrayList<guardarDatosPedidos> carrito
                    = (ArrayList<guardarDatosPedidos>) session.getAttribute("carrito");
        %>

        <header>
            <div class="MARCA">
                <p><a href="indexJSP.jsp"><b>ARRAYLABS</b></a></p>
            </div>

            <div class="LINKS">
                <a href="BrincolinesJSP.jsp"><b>BRINCOLINES</b></a>
                <a href="InflablesJSP.jsp"><b>INFLABLES</b></a>
                <a href="FutbolitosJSP.jsp"><b>FUTBOLITOS</b></a>
                <a href="Rockola.jsp"><b>ROCKOLA</b></a>
            </div>

            <div class="SESION">
                <a href="carritoF.jsp">Carrito</a>
                <a href="pedidos.html">Ordenar</a>
                <a href="verPedidosAdministrador.html">Ver pedidos (Administrador)</a>
                <a href="registros.html">Registrarse</a>
            </div>
        </header>

        <nav>
            <h2>CARRITO DE COMPRAS</h2>
        </nav>

        <main>
            <section>

                <%
                    if (carrito != null && !carrito.isEmpty()) {

                        for (int i = 0; i < carrito.size(); i++) {

                            guardarDatosPedidos datito = carrito.get(i);
                %>

                <article>
                    <h3>Producto: <%= datito.getProducto2()%></h3>
                    <p>Fecha inicio: <%= datito.getFecha_inicio()%></p>
                    <p>Fecha fin: <%= datito.getFecha_fin()%></p>
                    <p>Hora inicio: <%= datito.getHora_inicio()%></p>
                    <p>Hora fin: <%= datito.getHora_fin()%></p>

                    <!-- ELIMINAR (por índice) -->
                    <form action="quitarRenta.jsp" method="post">
                        <input type="hidden" name="idEliminar" value="<%= i%>">
                        <input type="hidden" name="eliminar" value="true">
                        <input type="hidden" name="usuarioEliminar" value="<%= usuario%>">

                        <input type="submit" value="Eliminar" class="enviar">
                    </form>
                </article>

                <%
                    } // cierre for

                } else {
                %>

                <article>
                    <h3>Agrega un producto</h3>
                    <p>Tu carrito está vacío...</p>
                </article>

                <%
                    }
                %>

            </section>

            <aside>
                <h3>Total a pagar</h3>
                <p>$<%= totalPagar%> + envío</p>

                <form action="pagarCuenta.jsp" method="post">
                    <input type="submit" name="pagarCuenta" value="Pagar y Ordenar">
                </form>

                <form action="cerrarSesion.jsp" method="post">
                    <input type="submit" value="Cerrar Sesión">
                </form>
            </aside>

        </main>

        <%
            } // cierre else login
%>

    </body>
</html>