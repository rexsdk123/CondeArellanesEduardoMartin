<%-- 
    Document   : BrincolinesJSP
    Created on : 16 nov 2025, 10:10:20 a.m.
    Author     : gampl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ARRAYLABS: Brincolines</title>
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
                <p>BRINCOLINES</p>
            </div>

            <div class="Articulos">

                <div class="articulo1">
                    <a href="Brincolines/brincolinChico.jsp">
                        <img src="img/brincolinChico.jpeg" alt="">
                    </a>
                    <h1>BRINCOLIN CHICO</h1>
                    <p>Un brincolin apto para los más peques de la familia</p>
                </div>
                <div class="articulo2">
                    <a href="Brincolines/brincolinMediano.jsp">
                        <img src="img/brincolinNormal2.jpeg" alt="">
                    </a>
                    <h1>BRINCOLIN MEDIANO</h1>
                    <p>El clasico de clsicos, un brincolin de tamaño standar</p>
                </div>
                <div class="articulo3">
                    <a href="Brincolines/brincolinGrande.jsp">
                        <img src="img/brincolinNegro2.jpeg" alt="">
                    </a>
                    <h1>BRINCOLIN GRANDE</h1>
                    <p>El brincolin perfecto para aquellos que necesitan más espacio para jugar</p>
                </div>
                <div class="articulo4">
                    <a href="Brincolines/brincolinJumbo.jsp">
                        <img src="img/brincolinGrande.jpeg" alt="">
                    </a>
                    <h1>BRINCOLIN JUMBO</h1>
                    <p>Tamaño Jumbo con una diversión sin limites</p>
                </div>
            </div>
        </section>
    </body>
</html>