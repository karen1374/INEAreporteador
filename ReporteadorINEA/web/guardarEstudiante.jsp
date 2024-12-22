<%-- 
    Document   : guardarEstudiante
    Created on : 21/12/2024, 03:45:45 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="conexion.jsp" %>
<jsp:include page="includes/header.jsp"/>

<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String carrera = request.getParameter("carrera");
    String tipoServicio = request.getParameter("tipoServicio");
    String horasRequeridasStr = request.getParameter("horasRequeridas");

    try {
        float horasRequeridas = Float.parseFloat(horasRequeridasStr);

        if (conexion != null) {
            String sql = "INSERT INTO Estudiantes (Nombre, Apellido, Correo, Telefono, Carrera, Tipo_Servicio, Horas_Requeridas) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, correo);
            ps.setString(4, telefono);
            ps.setString(5, carrera);
            ps.setString(6, tipoServicio);
            ps.setFloat(7, horasRequeridas);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                out.println("<p style='color: green; text-align: center;'>Estudiante agregado exitosamente.</p>");
            } else {
                out.println("<p style='color: red; text-align: center;'>Error al agregar el estudiante. Intenta nuevamente.</p>");
            }
        } else {
            out.println("<p style='color: red; text-align: center;'>Error: No se pudo establecer conexión con la base de datos.</p>");
        }
    } catch (SQLException e) {
        out.println("<p style='color: red; text-align: center;'>Error al guardar en la base de datos: " + e.getMessage() + "</p>");
    } catch (NumberFormatException e) {
        out.println("<p style='color: red; text-align: center;'>Error: Las horas requeridas deben ser un número válido.</p>");
    }
%>






<jsp:include page="includes/footer.jsp"/>