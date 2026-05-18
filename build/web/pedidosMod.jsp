<%-- 
    Document   : pedidosMod
    Created on : 15 nov 2025, 12:27:59 p.m.
    Author     : gampl
--%>

<%@page import="paquetito.iniciarSesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>MERCURY: Registrar pedido</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/pedidos.css">
        <script>
            function actualizarProductos() {
                var mat1 = ["Brincolin chico", "Brincolin mediano", "Brincolin grande", "Brincolin jumbo"];
                var mat2 = ["Inflable minion", "Inflable spiderman", "Inflable mario bros", "Inflable batman", "Inflable castillo"];
                var mat3 = ["Futbolito grande cafe oscuro", "Futbolito grande cafe", "Futbolito chico"];
                var mat4 = ["Rockola"];
                var alcaldiaSelect = document.getElementById("menude1");
                var coloniaSelect = document.getElementById("menude2");
                coloniaSelect.options.length = 1;
                var index = alcaldiaSelect.selectedIndex;
                if (index === 0) {
                    alert("Ingrese un producto");
                    return;
                }

                var colonias = [];
                if (index === 1)
                    colonias = mat1;
                else
                if (index === 2)
                    colonias = mat2;
                else
                if (index === 3)
                    colonias = mat3;
                else
                if (index === 4)
                    colonias = mat4;
                for (var i = 0; i < colonias.length; i++) {
                    var opt = new Option(colonias[i], colonias[i]);
                    coloniaSelect.options.add(opt);
                }


            }

            function seleccionarIndex() {
                var alcaldiaSelect = document.getElementById("menude1");
                var coloniaSelect = document.getElementById("menude2");
                var inputHidden = document.getElementById("productoSeleccionado");

                var indexCategoria = alcaldiaSelect.selectedIndex;
                var indexProducto = coloniaSelect.selectedIndex;

                if (indexCategoria === 0 || indexProducto === 0) {
                    inputHidden.value = "";
                    return;
                }

                inputHidden.value = coloniaSelect.options[indexProducto].value;
            }
        </script>
    </head>
    <body>
        <div class="formularioPedido">
            <h1>EDUSAN</h1>
            <h2>PEDIDO</h2>
            <form action="pedidoSw.jsp" method="post" name="cuestionario" onsubmit="seleccionarIndex()">

                <%
                    String usuario = (String) session.getAttribute("usuario");
                    String contrasena = (String) session.getAttribute("contrasena");
                    String categoria = request.getParameter("categoria");
                    String indexSeleccionado = request.getParameter("indexSeleccionado");
                    System.out.println(indexSeleccionado);
                    System.out.println(categoria);
                %>

                <div hidden>

                    <input type="text" name="usuario" value="<%=usuario%>" class="texto">
                    <input type="text" name="contrasena" value="<%=contrasena%>" class="texto">
                    <input type="text" name="categoria" value="<%=categoria%>" class="texto">
                    <input type="text" name="indexSelecionado" value="<%=indexSeleccionado%>" class="texto">
                </div>


                <h3>Fecha</h3>
                <div class="fechasyhoras">
                    <div class="fechashorasizquierda">
                        <label>Fecha de inicio:</label><br><br>
                        <input type="date" name="fechaInicio" required><br><br>
                        <label>Hora de inicio:</label><br><br>
                        <input type="time" name="horaInicio" required><br><br>
                    </div>
                    <div class="fechashorasderecha">
                        <label>Fecha de fin:</label><br><br>
                        <input type="date" name="fechaFin" required><br><br>
                        <label>Hora de fin:</label><br><br>
                        <input type="time" name="horaFin" required><br><br>
                    </div>
                </div>

                <input type="submit" name="enviar" value="Agregar al carrito" class="enviar">
            </form>
            <a href="cambiodeContrasena.html">¿Olvidaste tu contraseña?</a>
            <a href="indexJSP.jsp">Regresar</a>
        </div>
    </body>
</html>
