<%-- 
    Document   : registrarSalida
    Created on : 20/12/2024, 02:37:25 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<%@ include file="conexion.jsp" %>
<jsp:include page="includes/header.jsp"/>

<%
    String idEstudiante = request.getParameter("idEstudiante");
    String horaSalida = java.time.LocalTime.now().toString(); // Hora actual

    if (idEstudiante != null && !idEstudiante.isEmpty()) {
        try {
            // Verificar si existe una entrada sin salida registrada
            PreparedStatement psVerificar = conexion.prepareStatement(
                "SELECT ID_Hora FROM RegistroHoras WHERE ID_Estudiante = ? AND Hora_Salida IS NULL ORDER BY ID_Hora DESC LIMIT 1"
            );
            psVerificar.setInt(1, Integer.parseInt(idEstudiante));
            ResultSet rs = psVerificar.executeQuery();

            if (rs.next()) {
                int idHora = rs.getInt("ID_Hora"); // Obtener el ID de la hora registrada sin salida

                // Actualizar la hora de salida
                PreparedStatement psActualizar = conexion.prepareStatement(
                    "UPDATE RegistroHoras SET Hora_Salida = ? WHERE ID_Hora = ?"
                );
                psActualizar.setString(1, horaSalida);
                psActualizar.setInt(2, idHora);

                int filas = psActualizar.executeUpdate();

                if (filas > 0) {
%>
                    <script>
                        alert("Hora de salida registrada correctamente.");
                        window.location.href = "moduloEstudiante.jsp";
                    </script>
<%
                } else {
%>
                    <p style="color: red; text-align: center;">Error al registrar la hora de salida.</p>
<%
                }
            } else {
%>
                <p style="color: red; text-align: center;">No hay registro de entrada pendiente para el estudiante.</p>
<%
            }
        } catch (SQLException e) {
            out.println("<p style='color: red; text-align: center;'>Error de base de datos: " + e.getMessage() + "</p>");
        }
    } else {
%>
        <p style="color: red; text-align: center;">Error: El ID del estudiante es inválido.</p>
<%
    }
%>

<jsp:include page="includes/footer.jsp"/>
