<%-- 
    Document   : loginAdministrador
    Created on : 21/12/2024, 11:35:11 AM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="includes/header.jsp"/>
<%@include file="conexion.jsp"%>

<title>Inicio de Sesión - Administrador</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f8fc;
            text-align: center;
            margin-top: 100px;
        }

        form {
            display: inline-block;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 20px;
            background-color: #004aad;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #003a7d;
        }
    </style>
    
    
    <h1>Inicio de Sesión - Administrador</h1>
    <form action="verificarAdministrador.jsp" method="POST">
        <input type="text" name="nombre" placeholder="Nombre" required>
        <input type="password" name="contrasena" placeholder="Contraseña" required>
        <button type="submit">Iniciar Sesión</button>
    </form>

<jsp:include page="includes/footer.jsp"/>
