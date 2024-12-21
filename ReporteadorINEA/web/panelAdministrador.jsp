<%-- 
    Document   : panelAdministrador
    Created on : 21/12/2024, 11:45:05 AM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<jsp:include page="includes/header.jsp"/>
<%@include file="conexion.jsp"%>
<%@ page session="true" %>
<%
    String adminNombre = (String) session.getAttribute("adminNombre");
    if (adminNombre == null) {
        response.sendRedirect("loginAdministrador.jsp");
    }
%>

 <title>Panel del Administrador</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f8fc;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #004aad;
            color: white;
            text-align: center;
            padding: 20px;
        }

        main {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #004aad;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #004aad;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        button {
            padding: 10px 20px;
            background-color: #004aad;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #003a7d;
        }

        a {
            text-decoration: none;
            color: white;
        }
    </style>
    
    <h1>Panel del Administrador</h1>
        <p>Bienvenido, <%= adminNombre %></p>
    </header>
    <main>
        <h2>Lista de Estudiantes</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Carrera</th>
                <th>Tipo de Servicio</th>
                <th>Horas Requeridas</th>
                <th>Horas Completadas</th>
                <th>Acciones</th>
            </tr>
            <%
                try {
                    PreparedStatement ps = conexion.prepareStatement("SELECT * FROM Estudiantes");
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("ID_Estudiante") %></td>
                <td><%= rs.getString("Nombre") %></td>
                <td><%= rs.getString("Apellido") %></td>
                <td><%= rs.getString("Correo") %></td>
                <td><%= rs.getString("Telefono") %></td>
                <td><%= rs.getString("Carrera") %></td>
                <td><%= rs.getString("Tipo_Servicio") %></td>
                <td><%= rs.getFloat("Horas_Requeridas") %></td>
                <td><%= rs.getFloat("Horas_Completadas") %></td>
                <td>
                    <form action="consultarEstudiante.jsp" method="POST">
                        <input type="hidden" name="idEstudiante" value="<%= rs.getInt("ID_Estudiante") %>">
                        <button type="submit">Consultar</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<p style='color:red;'>Error al cargar los datos: " + e.getMessage() + "</p>");
                }
            %>
        </table>

        <div class="buttons">
            <button><a href="agregarEstudiante.jsp">Agregar Estudiante</a></button>
            <button><a href="eliminarEstudiante.jsp">Eliminar Estudiante</a></button>
            <button><a href="logout.jsp">Cerrar Sesión</a></button>
        </div>
    </main>

<jsp:include page="includes/footer.jsp"/>


