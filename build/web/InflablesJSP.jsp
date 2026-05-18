<%-- 
    Document   : InflablesJSP
    Created on : 16 nov 2025, 10:11:50 a.m.
    Author     : gampl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--

            //Inflable de spiderman 800
            //Inflable otros 750
-->
<html>
    <head>
        <title>MERCURY: Inflables</title>
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
                <p>INFLABLES</p>
            </div>

            <div class="Articulos">
                <div class="articulo1">
                    <a href="Inflables/minion.jsp">
                        <img src="img/minion1.jpeg" alt="">
                    </a>
                    <h1>INFLABLE MINION</h1>
                    <p>Banana, banana!! Lo mejor para los pequeños villanos</p>
                </div>
                <div class="articulo2">
                    <a href="Inflables/spiderman.jsp">
                        <img src="img/spiderman1.jpeg" alt="">
                    </a>
                    <h1>INFLABLE SPIDERMAN</h1>
                    <p>Un gran inflable conlleva una gran diversión</p>
                </div>
                <div class="articulo3">
                    <a href="Inflables/marioBros.jsp">
                        <img src="img/marioBros5.jpeg" alt="">
                    </a>
                    <h1>INFLABLE MARIO BROS</h1>
                    <p>El mejor dúo de personajes de los videojuegos llega para tu fiesta</p>
                </div>
                <div class="articulo4">
                    <a href="Inflables/batman.jsp">
                        <img src="img/batman2.jpeg" alt="">
                    </a>
                    <h1>INFLABLE BATMAN</h1>
                    <p>SOY BATMAN!!!</p>
                </div>
            </div>
            <br><br>
            <div class="Articulos">
                <div class="articulo1">
                    <a href="Inflables/castillo.jsp">
                        <img src="img/castillo6.jpeg" alt="">
                    </a>
                    <h1>INFLABLE CASTILLO</h1>
                    <p>Un reino de aventuras sin límites</p>
                </div>
            </div>
        </section>
    </body>
</html>
