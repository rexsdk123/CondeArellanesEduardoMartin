<%-- 
    Document   : Rockola
    Created on : 15 nov 2025, 8:32:55 a.m.
    Author     : gampl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ARRAYLABS: ROCKOLA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/inflable.png" type="image/x-icon">
        <link rel="stylesheet" href="CSS/Nstyle.css">
    </head>
    <style>

        .PP {
            display: flex;
            align-items: center;
            gap: 60px;
            padding: 80px 40px;
        }

        .imgPP {
            flex: 1;
            display: flex;
            justify-content: center;
        }

        .imgPP2{
            height: 550px;
            width: 400px;
            flex: 1;
            display: flex;
            justify-content: center;

        }

        .infosPP {
            flex: 1;
            display: flex;
            justify-content: center;
        }

        .TextoPP {
            background: rgba(255, 255, 255, 0.95);
            padding: 50px;
            border-radius: 20px;
            border: 3px solid #99d6ff;
            box-shadow: 0 10px 30px rgba(0, 120, 215, 0.15);
            max-width: 500px;
        }

        .TituloPP h2 {
            font-size: 2.2rem;
            color: #0066cc;
        }

        .ValorPP {
            font-size: 3rem;
            color: #0078d7;
            font-weight: bold;
            margin: 20px 0;
        }

        .InfoPP {
            color: #555;
            line-height: 1.8;
        }

        hr {
            border: none;
            height: 2px;
            background: linear-gradient(90deg, transparent, #99d6ff, transparent);
            margin: 25px 0;
        }

        .botonPP a {
            display: block;
            padding: 18px;
            background: linear-gradient(135deg, #4da6ff, #0078d7);
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-weight: bold;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(0, 120, 215, 0.3);
        }

        .botonPP a:hover {
            background: linear-gradient(135deg, #0078d7, #0066cc);
            transform: translateY(-3px);
        }
    </style>
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


        <section class="PP">
            <div class="imgPP">
                <div class="carousel-slide"><img src="img/rockola1.jpeg" alt="Rockola"></div>
            </div>
            <div class="infosPP">
                <div class="TextoPP">
                    <div class="TituloPP">
                        <h2>Rockola</h2>
                    </div>
                    <div class="ValorPP">
                        $800 MXN
                    </div>
                    <hr>
                    <div class="ImpuestosPP">
                        Envio gratuito <br><br>
                        (IMPORTATE: UNICAMENTE A LOS ALREDEDORES DE IZTAPALAPA)
                    </div>
                    <hr>
                    <div class="InfoPP">
                        Dimensiones:<br>
                        40 Ancho (centimetros)
                        <br>
                        1 Largo (metros)
                        <br>
                        2 Altura (metros)
                    </div>
                    <div class="botonPP">
                        <a href="index.html"><b>Volver</b></a>
                    </div>
                    <br>
                    <div class="botonPP">
                        <a href="../pedidosMod.jsp?categoria=4&indexSeleccionado=13"><b>Agregar al carrito</b></a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>

