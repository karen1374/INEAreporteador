<%-- 
    Document   : moduloEstudiante
    Created on : 19/12/2024, 02:57:02 PM
    Author     : Karen
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="conexion.jsp" %>
<jsp:include page="includes/header.jsp"/>

<title>INEA - Módulo Estudiante</title>
<style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f8fc;
        }

        header {
            background-color: #004aad;
            color: white;
            padding: 20px;
            text-align: center;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        h1, h2 {
            color: #004aad;
            text-align: center;
        }

        .search-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin: 20px 0;
        }

        .search-container input[type="text"] {
            padding: 10px;
            width: 60%;
            border: 2px solid #004aad;
            border-radius: 5px;
            font-size: 16px;
        }

        .search-container button {
            padding: 10px 20px;
            background-color: #004aad;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-container button:hover {
            background-color: #002e75;
        }

        .result-container {
            text-align: center;
            margin: 20px 0;
        }

        .result-container p {
            margin: 10px 0;
            font-size: 18px;
        }

        .result-container p span {
            font-weight: bold;
            color: #004aad;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 20px 0;
        }

        .button-container button {
            padding: 10px 20px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button-container button:hover {
            background-color: #004aad;
        }

       footer {
            background-color: #004aad;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed; /* Fijar al final */
            bottom: 0;
            left: 0;
            width: 100%; /* Ocupa todo el ancho */
            z-index: 1000; /* Asegura que el footer esté sobre otros elementos */
        }

    </style>

<main>
    <h2>Bienvenido al Sistema</h2>
    <%-- Barra de búsqueda --%>
    <div class="search-container">
        <form action="moduloEstudiante.jsp" method="POST">
            <input type="text" name="nombreEstudiante" placeholder="Ingresa tu nombre" required>
            <button type="submit">Buscar</button>
        </form>
    </div>

    <%-- Resultado de búsqueda --%>
    <%
        String nombreEstudiante = request.getParameter("nombreEstudiante");

        if (nombreEstudiante != null && !nombreEstudiante.isEmpty()) {
            if (conexion != null) {
                try {
                    PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Estudiantes WHERE nombre = ?");
                    ps.setString(1, nombreEstudiante);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        int idEstudiante = rs.getInt("ID_Estudiante"); // Obtener ID del estudiante
                        String nombre = rs.getString("nombre");
                        String apellido = rs.getString("apellido");
                        String carrera = rs.getString("carrera");
                        String tipoServicio = rs.getString("tipo_servicio");
    %>
    <div class="result-container">
        <p><span>ID:</span> <%= idEstudiante %></p>
        <p><span>Nombre:</span> <%= nombre %> <%= apellido %></p>
        <p><span>Carrera:</span> <%= carrera %></p>
        <p><span>Tipo de Servicio:</span> <%= tipoServicio %></p>
    </div>

    <div class="button-container">
        <%-- Formulario para registrar la hora de entrada --%>
        <form action="guardarEntrada.jsp" method="POST">
            <input type="hidden" name="idEstudiante" value="<%= idEstudiante %>">
            <input type="hidden" name="nombreEstudiante" value="<%= nombre %>">
            <button type="submit">Registrar Entrada</button>
        </form>

        <%-- Formulario para registrar la hora de salida --%>
        <form action="registrarSalida.jsp" method="POST">
            <input type="hidden" name="idEstudiante" value="<%= idEstudiante %>">
            <input type="hidden" name="nombreEstudiante" value="<%= nombre %>">
            <button type="submit">Registrar Salida</button>
        </form>
    </div>
    <%
                    } else {
    %>
    <p style="color: red; text-align: center;">No se encontraron resultados para el nombre ingresado.</p>
    <%
                    }
                } catch (SQLException e) {
                    out.println("<p style='color: red; text-align: center;'>Error al consultar la base de datos: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p style='color: red; text-align: center;'>Error: No se pudo establecer conexión con la base de datos.</p>");
            }
        }
    %>
</main>
<jsp:include page="includes/footer.jsp"/>