<%-- 
    Document   : consultarEstudiante
    Created on : 21/12/2024, 01:37:59 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="Utilidades.utilidades"%>






<%@include file="conexion.jsp"%>


<title>Progreso del Estudiante</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f8fc;
        margin: 0;
        padding: 0;
    }

    header {
        background-color: #004aad;
        color: white;
        padding: 20px;
        text-align: center;
    }

    main {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    h1, h2 {
        text-align: center;
        color: #004aad;
    }

    p {
        font-size: 18px;
        color: #333;
    }

    .progreso-bar {
        background-color: #ddd;
        border-radius: 10px;
        overflow: hidden;
        height: 30px;
        margin: 20px 0;
    }

    .progreso-bar-inner {
        height: 100%;
        background-color: #004aad;
        color: white;
        line-height: 30px;
        text-align: center;
    }

    button {
        padding: 10px;
        background-color: #004aad;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin: 10px;
    }

    button:hover {
        background-color: #002e75;
    }
</style>

  <%
    String idEstudiante = request.getParameter("idEstudiante");

    if (idEstudiante == null || idEstudiante.isEmpty()) {
        out.println("<p style='color:red;'>Error: No se proporcionó un ID de estudiante válido.</p>");
    } else {
        try {
            int id = Integer.parseInt(idEstudiante);

            // Consulta para obtener información básica del estudiante
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Estudiantes WHERE ID_Estudiante = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String nombreEstudiante = rs.getString("Nombre") + " " + rs.getString("Apellido");
                float horasRequeridas = rs.getFloat("Horas_Requeridas");

                // Consulta para calcular las horas completadas desde la tabla RegistroHoras
                PreparedStatement psHoras = conexion.prepareStatement(
                    "SELECT SUM(TIMESTAMPDIFF(MINUTE, Hora_Entrada, Hora_Salida)) AS MinutosCompletados " +
                    "FROM RegistroHoras WHERE ID_Estudiante = ? AND Hora_Salida IS NOT NULL");
                psHoras.setInt(1, id);
                ResultSet rsHoras = psHoras.executeQuery();

                float horasCompletadas = 0;
                if (rsHoras.next()) {
                    int minutosCompletados = rsHoras.getInt("MinutosCompletados");
                    horasCompletadas = minutosCompletados / 60.0f; // Convertir minutos a horas
                }

                // Calcular horas faltantes
                float horasFaltantes = horasRequeridas - horasCompletadas;
                if (horasFaltantes < 0) horasFaltantes = 0; // Evitar valores negativos

                int progreso = 0; // Definir progreso inicial
                if (horasRequeridas > 0) {
                    progreso = (int)((horasCompletadas / horasRequeridas) * 100); // Calcular solo si horasRequeridas > 0
                }

                // Mostrar datos en la página
%>
                <header>
                    <h1>Progreso del Estudiante</h1>
                </header>
                <main>
                    <<h2>Nombre: <%= nombreEstudiante %></h2>
                            <p><strong>Horas Requeridas:</strong> <%= Utilidades.utilidades.formatoHoras(horasRequeridas) %></p>
                            <p><strong>Horas Completadas:</strong> <%= Utilidades.utilidades.formatoHoras(horasCompletadas) %></p>
                            <p><strong>Horas Faltantes:</strong> <%= Utilidades.utilidades.formatoHoras(horasFaltantes) %></p>

                    <p><strong><%= progreso %>% Completado</strong></p>
                    <div class="progreso-bar">
                        <div class="progreso-bar-inner" style="width: <%= progreso %>%;">
                            <%= progreso %>%
                        </div>
                    </div>
                    <form action="panelAdministrador.jsp" method="get" style="text-align: center;">
                        <button type="submit">Regresar</button>
                    </form>
                </main>
<%
            } else {
                out.println("<p style='color:red;'>Error: No se encontró un estudiante con el ID proporcionado.</p>");
            }
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Error: ID de estudiante inválido.</p>");
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Error al consultar la base de datos: " + e.getMessage() + "</p>");
        }
    }
%>





<jsp:include page="includes/footer.jsp"/>