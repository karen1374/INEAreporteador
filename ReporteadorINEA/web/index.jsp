<%-- 
    Document   : index
    Created on : 19/12/2024, 02:04:40 PM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="includes/header.jsp"/>
<%@include file="conexion.jsp"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <title>INEA - Inicio</title>
    
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5; /* Fondo claro */
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: flex-start; /* Mover el contenido hacia arriba */
            align-items: center;
            height: 100vh; /* Altura de la pantalla completa */
            padding-top: 100px; /* Espaciado superior */
            text-align: center;
        }

        .title {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 30px;
            color: #002855; /* Azul corporativo */
        }

        .btn-container {
            display: flex;
            gap: 20px; /* Espaciado entre los botones */
        }

        .btn {
            font-size: 18px;
            font-weight: bold;
            padding: 10px 30px;
            border-radius: 8px; /* Bordes redondeados */
            transition: all 0.3s ease;
        }

        .btn-estudiante {
            background-color: #4b88a2; /* Azul más sobrio */
            color: #ffffff;
            border: none;
        }

        .btn-estudiante:hover {
            background-color: #37677d; /* Azul más oscuro al pasar el mouse */
        }

        .btn-administrador {
            background-color: #5c946e; /* Verde oliva profesional */
            color: #ffffff;
            border: none;
        }

        .btn-administrador:hover {
            background-color: #437154; /* Verde más oscuro al pasar el mouse */
        }
    </style>
    
     <div class="container">
        <h1 class="title">Bienvenido al Sistema INEA</h1>
        <div class="btn-container">
            <!-- Botón Estudiante -->
            <a href="moduloEstudiante.jsp" class="btn btn-estudiante">Estudiante</a>
            <!-- Botón Administrador -->
            <a href="loginAdministrador.jsp" class="btn btn-administrador">Administrador</a>
        </div>
    </div>

<jsp:include page="includes/footer.jsp"/>
