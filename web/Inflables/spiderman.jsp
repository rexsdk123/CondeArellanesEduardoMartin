<%-- 
    Document   : spiderman
    Created on : 15 nov 2025, 8:24:54 a.m.
    Author     : gampl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>MERCURY: Inflable Spiderman</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="../CSS/productos.css">
        <link rel="shortcut icon" href="img/inflable.png" type="image/x-icon">
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const posicion = document.querySelector('.imagenesSeguimiento');
                const deslizar = Array.from(posicion.children);
                const botonSiguiente = document.querySelector('.imagenesbotonSig');
                const botonAnterior = document.querySelector('.imagenesbotonAnt');
                let IndexActual = 0;

                function ActualizarImagen() {
                    const deslizadorAncho = deslizar[0].getBoundingClientRect().width;
                    posicion.style.transform = 'translateX(-' + (deslizadorAncho * IndexActual) + 'px)';
                }

                botonSiguiente.addEventListener('click', () => {
                    IndexActual = (IndexActual + 1) % deslizar.length;
                    ActualizarImagen();
                });

                botonAnterior.addEventListener('click', () => {
                    IndexActual = (IndexActual - 1 + deslizar.length) % deslizar.length;
                    ActualizarImagen();
                });

            });
        </script>
    </head>
    <body>
        <section class="PP">
            <div class="imgPP">
                <div class="carousel">
                    <button class="imagenesbotonAnt">&#10094;</button>
                    <div class="imagenesSeguimiento">
                        <div class="deslizador"><img src="img/spiderman1.jpeg" alt="Inflable Spiderman 1"></div>
                        <div class="deslizador"><img src="img/spiderman2.jpeg" alt="Inflable Spiderman 2"></div>
                        <div class="deslizador"><img src="img/spiderman3.jpeg" alt="Inflable Spiderman 3"></div>
                        <div class="deslizador"><img src="img/spiderman4.jpeg" alt="Inflable Spiderman 4"></div>
                    </div>
                    <button class="imagenesbotonSig">&#10095;</button>
                </div>
            </div>

            <div class="infosPP">
                <div class="TextoPP">
                    <div class="TituloPP">
                        <h2>Inflable spiderman</h2>
                    </div>
                    <div class="ValorPP">
                        $900 MXN
                    </div>
                    <hr>
                    <div class="ImpuestosPP">
                        Envio gratuito <br><br>
                        (IMPORTATE: UNICAMENTE A LOS ALREDEDORES DE IZTAPALAPA)
                    </div>
                    <hr>
                    <div class="InfoPP">
                        Dimensiones:<br>
                        4 Ancho (metros)
                        <br>
                        4 Largo (metros)
                        <br>
                        2.5 Altura (metros)
                    </div>
                    <div class="botonPP">
                        <a href="../InflablesJSP.jsp"><b>Volver</b></a>
                    </div>
                    <br>
                    <div class="botonPP">
                        <a href="../pedidosMod.jsp?categoria=2&indexSeleccionado=6"><b>Agregar al carrito</b></a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
