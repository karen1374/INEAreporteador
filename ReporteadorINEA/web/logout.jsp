<%-- 
    Document   : logout
    Created on : 21/12/2024, 11:49:58 AM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
    response.sendRedirect("loginAdministrador.jsp");
%>

