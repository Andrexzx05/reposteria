<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Respuesta</title>
</head>
<body>


<body>
    <h2>Datos ingresados:</h2>
    <p>Nombre: <%= request.getParameter("txtNombre") %></p>
    <p>Cédula: <%= request.getParameter("txtCedula") %></p>
    <p>Estado Civil: <%= request.getParameter("cmbECivil") %></p>
    <p>Lugar de residencia: <%= request.getParameter("rdResidencia") %></p>
    <p>Foto seleccionada: <u><%= request.getParameter("fileFoto") %></u></p>
    <p>Año y mes de nacimiento: <strong><%= request.getParameter("fecha") %></strong></p>
    <p>Color favorito: <font color="<%= request.getParameter("color") %>">Este es tu color favorito</font></p>
</body>
</html>

<%
out.print("Su nombre es"+request.getParameter("txtNombre")+"</br>");

String cedula=request.getParameter("txtCedula");
String estadoCivil=request.getParameter("cmbECivil");
String residencia=request.getParameter("rdResidencia");
String foto=request.getParameter("fileFoto");
String color=request.getParameter("colorFavorito");
%>

<%= cedula%> </br> Su estado civil s <%=estadoCivil %> </br>
<u><%=foto %></u>
<strong><%out.print(request.getParameter("fecha")); %></strong>
<font color=<%=color %>>Este es tu color favorito </font>
<tr><td>Nombre </td><td> <input type="text" name = "txtNombre" required /> *</td></tr>
<tr><td>Correo </td><td> <input type="email" name= "extCorreo"
placehorder = "usuario@nombreProveedor.dominio"/>
<tr><td>Cedula </td> <td> <input type ="text" name="txtCedula" maxlenth ="10" /> </td></tr>
</body>
</html>
