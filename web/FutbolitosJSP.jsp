<%-- 
    Document   : FutbolitosJSP
    Created on : 16 nov 2025, 10:10:52 a.m.
    Author     : gampl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MERCURY: Futbolitos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/inflable.png" type="image/x-icon">
        <link rel="stylesheet" href="CSS/Nstyle.css">
    </head>
    <body>
        <header>
            <div class="MARCA">
                <p><a href="indexJSP.jsp"><b>ARRAYLABS</b></a></p>
            </div>


            <%
                String usuario = (String) session.getAttribute("usuario");
            %>
            <div class="LINKS">
                <a href="BrincolinesJSP.jsp" class="a1"><b>BRINCOLINES</b></a>
                <a href="InflablesJSP.jsp" class="a2"><b>INFLABLES</b></a>
                <a href="FutbolitosJSP.jsp" class="a3"><b>FUTBOLITOS</b></a>
                <a href="Rockola.jsp" class="a4"><b>ROCKOLA</b></a>
            </div>

            <div class="SESION">
                <%
                    if (usuario == null) {
                %>
                <a href="iniciarSesion.html">Iniciar Sesion</a>
                <a href="pedidos.html" class="Carrito">Ordenar</a>
                <a href="verPedidosAdministrador.html">Ver pedidos (Administrador)</a>
                <a href="registros.html" class="Inicio">Registrarse</a>
                <%
                } else {
                %>
                <a href="carritoF.jsp">Carrito</a>
                <a href="pedidos.html" class="Carrito">Ordenar</a>
                <a href="verPedidosAdministrador.html">Ver pedidos (Administrador)</a>
                <a href="registros.html" class="Inicio">Registrarse</a>
                <%
                    }
                %>
            </div>
        </header>
        <section class="MasArticulos">
            <div class="TituloMA">
                <p>FUTBOLITOS</p>
            </div>

            <div class="Articulos">

                <div class="articulo1">
                    <a href="Futbolitos/futbolitoGrande.jsp">
                        <img src="img/futbolitoGrande.jpeg" alt="">
                    </a>
                    <h1>FUTBOLITO GRANDE CAFÉ OSCURO</h1>
                    <p>El clásico joven</p>
                </div>
                <div class="articulo2">
                    <a href="Futbolitos/futbolitoGrande2.jsp">
                        <img src="img/futbolitoGrande2.jpeg" alt="">
                    </a>
                    <h1>FUTBOLITO GRANDE CAFÉ</h1>
                    <p>El clásico nacional</p>
                </div>
                <div class="articulo3">
                    <a href="Futbolitos/futbolitoChico.jsp">
                        <img src="img/futbolitoChiquito.jpeg" alt="">
                    </a>
                    <h1>FUTBOLITO CHICO</h1>
                    <p>Sin varillas, sin nada de qué preocuparse</p>
                </div>
            </div>
        </section>
    </body>
</html>
