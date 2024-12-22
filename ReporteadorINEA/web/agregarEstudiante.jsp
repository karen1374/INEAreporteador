<%-- 
    Document   : agregarEstudiante
    Created on : 21/12/2024, 03:30:35 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="conexion.jsp" %>
<jsp:include page="includes/header.jsp"/>

<title>Agregar Estudiante</title>
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

        h1 {
            text-align: center;
            color: #004aad;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            color: #004aad;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
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
        }

        button:hover {
            background-color: #002e75;
        }

        footer {
            background-color: #004aad;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
        }
    </style>
    
    
    <header>
        <h1>Agregar Nuevo Estudiante</h1>
    </header>
    <main>
        <form action="guardarEstudiante.jsp" method="POST">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>

            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required>

            <label for="correo">Correo Electrónico:</label>
            <input type="email" id="correo" name="correo" required>

            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono">

            <label for="carrera">Carrera:</label>
            <input type="text" id="carrera" name="carrera" required>

            <label for="tipoServicio">Tipo de Servicio:</label>
            <input type="text" id="tipoServicio" name="tipoServicio" required>

            <label for="horasRequeridas">Horas Requeridas:</label>
            <input type="number" id="horasRequeridas" name="horasRequeridas" required>

            <button type="submit">Guardar Estudiante</button>
        </form>
    </main>

<jsp:include page="includes/footer.jsp"/>