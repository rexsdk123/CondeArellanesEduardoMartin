<%-- 
    Document   : establecerOrigenCarrito
    Created on : 30 may 2026, 6:12:43 a.m.
    Author     : gampl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setAttribute("origenPago", "carrito");

    response.sendRedirect("pagarCuenta.jsp");
    return;
%>