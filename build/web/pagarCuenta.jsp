<%@page import="paquetito.insertarDatosPedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="paquetito.guardarDatosPedidos"%>
<%@page import="paquetito.realizarPago"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String metodo = request.getParameter("metodo_pago");
    String procesar = request.getParameter("procesar");
%>

<%
    String origenPago = (String) session.getAttribute("origenPago");

    String paginaRegreso;

    if ("pedido".equals(origenPago)) {
        paginaRegreso = "indexJSP.jsp";
    } else {
        paginaRegreso = "carritoF.jsp";
    }
%>

<html>
    <head>
        <title>Pago</title>
        <link rel="stylesheet" href="CSS/pagarCuenta.css">
    </head>
    <body>
        <div>

            <h1>EDUSAN</h1>

            <%
                if (metodo == null) {
            %>

            <h2>Selecciona método de pago</h2>

            <form method="post">
                <select name="metodo_pago" class="texto">
                    <option value="efectivo">Efectivo</option>
                    <option value="tarjeta">Tarjeta</option>
                </select><br>  

                <input type="submit" value="Continuar" class="enviar"><br><br>
                <a href="<%=paginaRegreso%>" class="regresar">Regresar</a>
            </form>

            <%
            } else if (metodo.equals("tarjeta") && procesar == null) {
            %>

            <h2>Pago con tarjeta</h2>

            <form method="post">
                <input type="hidden" name="metodo_pago" value="tarjeta">
                <input type="hidden" name="procesar" value="si">

                Número de tarjeta:<br>
                <input type="text" name="num_tarjeta" class="texto"><br>

                Nombre en tarjeta:<br>
                <input type="text" name="nombre_tarjeta" class="texto"><br>

                Fecha de expiración:<br>
                <input type="text" name="fecha_exp" class="texto"><br>

                CVV:<br>
                <input type="text" name="cvv" class="texto"><br>

                <input type="submit" value="Pagar" class="enviar"><br>
                <br><a href="<%=paginaRegreso%>" class="regresar">Regresar</a>
            </form>

            <%
            } else if (metodo.equals("tarjeta") && procesar != null) {

                String usuario = (String) session.getAttribute("usuario");

                String num_tarjeta = request.getParameter("num_tarjeta");
                String nombre_tarjeta = request.getParameter("nombre_tarjeta");
                String fecha_exp = request.getParameter("fecha_exp");
                String cvv = request.getParameter("cvv");

                int idPago = realizarPago.insertarPago(usuario, metodo, num_tarjeta, nombre_tarjeta, fecha_exp, cvv);

                boolean exito = (idPago != -1);
            %>

            <h2>
                <%
                    if (exito) {

                        ArrayList<guardarDatosPedidos> carrito
                                = (ArrayList<guardarDatosPedidos>) session.getAttribute("carrito");

                        if (carrito != null) {

                            for (guardarDatosPedidos pedido : carrito) {

                                System.out.println("ANTES: " + pedido.getIdPago());

                                pedido.setIdPago(idPago);

                                System.out.println("DESPUES:" + pedido.getIdPago());

                                insertarDatosPedido.insertarPedidoActualizado(
                                        pedido,
                                        pedido.getUsuario(),
                                        pedido.getContrasena()
                                );
                            }

                            session.removeAttribute("carrito");
                            session.removeAttribute("origenPago");
                        }
                %>

                Pago aprobado <br>
                ¡¡Gracias por su renta!!

                <br><br>

                <a href="RUTA_DE_TU_PDF.pdf" download class="enviar">
                    Descargar contrato
                </a>

                <br><br>

                <a href="<%=paginaRegreso%>" class="regresar">Regresar</a>

                <%
                } else {
                %>

                Upss algo salió mal <br>
                Vuelva a intentarlo

                <%
                    }
                %>
            </h2>

            <%
            } else if (metodo.equals("efectivo")) {

                String usuario = (String) session.getAttribute("usuario");

                int idPago = realizarPago.insertarPago(usuario, metodo, null, null, null, null);

                boolean exito = (idPago != -1);

                if (exito) {

                    ArrayList<guardarDatosPedidos> carrito
                            = (ArrayList<guardarDatosPedidos>) session.getAttribute("carrito");

                    if (carrito != null) {

                        for (guardarDatosPedidos pedido : carrito) {

                            pedido.setIdPago(idPago);

                            insertarDatosPedido.insertarPedidoActualizado(
                                    pedido,
                                    pedido.getUsuario(),
                                    pedido.getContrasena()
                            );
                        }

                        session.removeAttribute("carrito");
                        session.removeAttribute("origenPago");
                    }
            %>

            <h2>Pago en efectivo</h2>

            <p>Descarga tu contrato y paga al momento de la entrega.</p>

            <a href="RUTA_DE_TU_PDF.pdf" download class="enviar">
                Descargar contrato
            </a>

            <br><br>

            <a href="<%=paginaRegreso%>" class="regresar">Regresar</a>
            <%
            } else {
            %>

            <h2>Error al generar el pago</h2>

            <%
                    }
                }
            %>

        </div>
    </body>
</html>