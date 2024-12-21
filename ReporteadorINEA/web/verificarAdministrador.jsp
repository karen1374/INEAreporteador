<%-- 
    Document   : verificarAdministrador
    Created on : 21/12/2024, 11:41:18 AM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<jsp:include page="includes/header.jsp"/>
<%@include file="conexion.jsp"%>


<%
    String nombre = request.getParameter("nombre");
    String contrasena = request.getParameter("contrasena");

    if (nombre != null && contrasena != null) {
        try {
            // Consulta para verificar el nombre y contraseña
            String query = "SELECT * FROM Supervisores WHERE Nombre = ? AND Contraseña = ?";
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Si las credenciales son correctas
                session.setAttribute("adminNombre", rs.getString("Nombre"));
                response.sendRedirect("panelAdministrador.jsp");
            } else {
                // Si las credenciales son incorrectas
                out.println("<p style='color:red; text-align:center;'>Nombre o contraseña incorrectos.</p>");
            }
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Error de base de datos: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red; text-align:center;'>Por favor, completa todos los campos.</p>");
    }
%>

<jsp:include page="includes/footer.jsp"/>
