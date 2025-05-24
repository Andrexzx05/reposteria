<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	HttpSession sesion = request.getSession();
	out.println("IdSesion: " + sesion.getId());

	out.println("Creación: " + sesion.getCreationTime());
	Date momento = new Date(sesion.getCreationTime());
	out.println("<BR>Creación: " + momento);
	%>
	<%
	Date acceso = new Date(sesion.getLastAccessedTime());
	out.println("Último acceso: " + acceso + "<br>");
	%>
	<%
	out.println("nueva: " + sesion.isNew());
	%>

	<%
	int adivinar = 0;
	if (request.getParameter("edad") != null) {
		adivinar = Integer.parseInt(request.getParameter("edad"));
		sesion.setAttribute("edad", adivinar);
		int edad = (int) sesion.getAttribute("edad");
		out.print(edad);
		if (edad >= 15 && edad <= 24) {
			sesion.setAttribute("etapa", "juventud");
		} else
			sesion.setAttribute("etapa", "aún no existe la categoría");
	}
	%>

	<%
	HttpSession Sesion = request.getSession();
	out.println("Tu edad es " + sesion.getAttribute("edad"));
	out.println(" estás en la etapa de " + sesion.getAttribute("etapa"));
	%>
</body>
</html>