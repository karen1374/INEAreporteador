<%-- 
    Document   : eliminarEstudiante
    Created on : 23/12/2024, 03:12:41 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@ page session="true" %>
<jsp:include page="includes/header.jsp"/>
<%@include file="conexion.jsp"%>

<%
    // Verificar si el usuario administrador está autenticado
    String adminNombre = (String) session.getAttribute("adminNombre");
    if (adminNombre == null) {
        response.sendRedirect("loginAdministrador.jsp");
        return;
    }

    // Obtener el ID del estudiante desde el formulario
    String idEstudiante = request.getParameter("idEstudiante");

    if (idEstudiante != null && !idEstudiante.isEmpty()) {
        try {
            // Crear consulta SQL para eliminar el estudiante
            String sql = "DELETE FROM Estudiantes WHERE ID_Estudiante = ?";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(idEstudiante));

            // Ejecutar la consulta
            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                out.println("<script>alert('Estudiante eliminado correctamente.'); window.location.href='panelAdministrador.jsp';</script>");
            } else {
                out.println("<script>alert('Error: No se pudo eliminar el estudiante.'); window.location.href='panelAdministrador.jsp';</script>");
            }
        } catch (SQLException e) {
            out.println("<script>alert('Error en la base de datos: " + e.getMessage() + "'); window.location.href='panelAdministrador.jsp';</script>");
        } catch (NumberFormatException e) {
            out.println("<script>alert('ID del estudiante no válido.'); window.location.href='panelAdministrador.jsp';</script>");
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                out.println("<p>Error al cerrar la conexión: " + e.getMessage() + "</p>");
            }
        }
    } else {
        out.println("<script>alert('No se recibió el ID del estudiante.'); window.location.href='panelAdministrador.jsp';</script>");
    }
%>




<jsp:include page="includes/footer.jsp"/>
