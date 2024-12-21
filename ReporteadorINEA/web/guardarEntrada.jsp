<%-- 
    Document   : guardarEntrada
    Created on : 20/12/2024, 02:18:59 PM
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
    String fecha = java.time.LocalDate.now().toString(); // Fecha actual
    String horaEntrada = java.time.LocalTime.now().toString(); // Hora actual

    if (idEstudiante != null && !idEstudiante.isEmpty()) {
        try {
            // Obtener el nombre completo del estudiante desde la tabla "Estudiantes"
            String nombreEstudiante = "";
            PreparedStatement psNombre = conexion.prepareStatement(
                "SELECT CONCAT(Nombre, ' ', Apellido) AS NombreCompleto FROM Estudiantes WHERE ID_Estudiante = ?"
            );
            psNombre.setInt(1, Integer.parseInt(idEstudiante));
            ResultSet rs = psNombre.executeQuery();

            if (rs.next()) {
                nombreEstudiante = rs.getString("NombreCompleto");

                // Insertar el registro con el nombre del estudiante
                PreparedStatement ps = conexion.prepareStatement(
                    "INSERT INTO RegistroHoras (ID_Estudiante, Nombre_Estudiante, Fecha, Hora_Entrada, Hora_Salida) VALUES (?, ?, ?, ?, NULL)"
                );
                ps.setInt(1, Integer.parseInt(idEstudiante));
                ps.setString(2, nombreEstudiante);
                ps.setString(3, fecha);
                ps.setString(4, horaEntrada);

                int filas = ps.executeUpdate();

                if (filas > 0) {
%>
                    <script>
                        alert("Hora de entrada registrada correctamente.");
                        window.location.href = "moduloEstudiante.jsp";
                    </script>
<%
                } else {
%>
                    <p style="color: red; text-align: center;">Error al registrar la hora de entrada.</p>
<%
                }
            } else {
%>
                <p style="color: red; text-align: center;">Error: No se encontró el estudiante.</p>
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