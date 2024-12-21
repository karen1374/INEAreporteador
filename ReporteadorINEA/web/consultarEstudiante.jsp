<%-- 
    Document   : consultarEstudiante
    Created on : 21/12/2024, 01:37:59 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<jsp:include page="includes/header.jsp"/>
<%@include file="conexion.jsp"%>


<style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f8fc;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #004aad;
            margin-bottom: 30px;
        }

        .info {
            text-align: center;
            margin-bottom: 20px;
        }

        .info p {
            font-size: 18px;
            line-height: 1.6;
            color: #333;
        }

        .progress-container {
            margin: 20px 0;
            text-align: center;
        }

        .progress-bar {
            width: 100%;
            background: #e0e0e0;
            border-radius: 10px;
            overflow: hidden;
            height: 30px;
        }

        .progress-bar div {
            height: 100%;
            background: #28a745;
            width: 0; /* Se ajustará dinámicamente */
            transition: width 0.3s ease-in-out;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            opacity: 0.9;
        }

        .btn-back {
            background-color: #007bff;
            color: white;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }

        .btn-complete {
            background-color: #28a745;
            color: white;
        }

        .btn-complete:hover {
            background-color: #1c7430;
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            color: #666;
            font-size: 14px;
        }
    </style>
<div class="container">
        <h2>Progreso del Estudiante</h2>
        <% 
            String idEstudiante = request.getParameter("idEstudiante");
            if (idEstudiante != null && !idEstudiante.isEmpty()) {
                try {
                    PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Estudiantes WHERE ID_Estudiante = ?");
                    ps.setString(1, idEstudiante);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        String nombre = rs.getString("Nombre");
                        String apellido = rs.getString("Apellido");
                        float horasRequeridas = rs.getFloat("Horas_Requeridas");
                        float horasCompletadas = rs.getFloat("Horas_Completadas");
                        float horasFaltantes = horasRequeridas - horasCompletadas;
                        int progreso = (int) ((horasCompletadas / horasRequeridas) * 100);
        %>
        <p><strong>Nombre:</strong> <%= nombre %> <%= apellido %></p>
        <p><strong>Horas Requeridas:</strong> <%= horasRequeridas %></p>
        <p><strong>Horas Completadas:</strong> <%= horasCompletadas %></p>
        <p><strong>Horas Faltantes:</strong> <%= horasFaltantes %></p>

        <div class="progress-container">
            <div class="progress-bar">
                <div style="width: <%= progreso %>%;"></div>
            </div>
            <p><%= progreso %>% Completado</p>
        </div>

        <div class="buttons">
            <form action="panelAdministrador.jsp">
                <button type="submit">Regresar</button>
            </form>
            <form action="actualizarHoras.jsp" method="POST">
                <input type="hidden" name="idEstudiante" value="<%= idEstudiante %>">
                <input type="number" name="horas" placeholder="Horas a registrar" required>
                <button type="submit">Horas Completadas</button>
            </form>
        </div>
        <% 
                    } else {
                        out.println("<p>No se encontró información del estudiante.</p>");
                    }
                } catch (SQLException e) {
                    out.println("<p>Error al consultar la base de datos: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p>ID del estudiante no proporcionado.</p>");
            }
        %>
    </div>







<jsp:include page="includes/footer.jsp"/>