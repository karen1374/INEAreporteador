<%-- 
    Document   : header
    Created on : 19/12/2024, 01:35:26 PM
    Author     : Karen
--%>

<%-- Header Reporteador de Horas Servicio Social INEA GRKE --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header INEA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5; /* Fondo suave */
        }

        header {
            display: flex;
            justify-content: center; /* Centrar el contenido del header */
            align-items: center;
            background-color: #002855; /* Azul corporativo */
            color: #ffffff; /* Texto blanco */
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .header-content {
            display: flex;
            align-items: center;
            text-align: center;
        }

        .logo {
            height: 70px; /* Tamaño del logo */
            margin-right: 20px;
        }

        .nombre-empresa {
            font-size: 28px;
            font-weight: bold;
            color: #ffffff; /* Blanco para resaltar el texto */
        }

        /* Estilo adicional para cuerpo de texto */
        p {
            color: #333333; /* Texto gris oscuro */
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <!-- Logo del INEA -->
            <img src="img/inea2.jpeg" alt="Logo INEA" class="logo">

            <!-- Nombre de la empresa -->
            <div class="nombre-empresa">INEA</div>
        </div>
    </header>

    

