<%-- 
    Document   : conexion
    Created on : 18/12/2024, 08:32:32 PM
    Author     : Karen
    Proyecto final INEA Servicio Social
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%
    Connection conexion = null;

    try {
        // Cargar el driver
         Class.forName("com.mysql.jdbc.Driver"); // Asegúrate de usar la versión correcta del driver

        // Crear la conexión
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/servicioinea", "ugarcia", "ud123");
    } catch (ClassNotFoundException e) {
        out.println("<p>Error: No se encontró el driver JDBC: " + e.getMessage() + "</p>");
    } catch (SQLException e) {
        out.println("<p>Error al conectar a la base de datos: " + e.getMessage() + "</p>");
    }
%>