<%-- 
    Document   : actualizarHoras
    Created on : 21/12/2024, 02:05:16 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%@ include file="conexion.jsp" %>
<%
    String idEstudiante = request.getParameter("idEstudiante");
    String horasStr = request.getParameter("horas");

    if (idEstudiante != null && !idEstudiante.isEmpty() && horasStr != null && !horasStr.isEmpty()) {
        try {
            float horas = Float.parseFloat(horasStr);

            PreparedStatement ps = conexion.prepareStatement(
                "UPDATE Estudiantes SET Horas_Completadas = Horas_Completadas + ? WHERE ID_Estudiante = ?");
            ps.setFloat(1, horas);
            ps.setString(2, idEstudiante);

            int filasActualizadas = ps.executeUpdate();
            if (filasActualizadas > 0) {
                out.println("<p>Horas actualizadas exitosamente.</p>");
            } else {
                out.println("<p>No se pudo actualizar las horas.</p>");
            }
        } catch (SQLException e) {
            out.println("<p>Error al actualizar las horas: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>Error: ID del estudiante o las horas no fueron proporcionadas.</p>");
    }
%>
<a href="panelAdministrador.jsp">Regresar al Panel</a>
