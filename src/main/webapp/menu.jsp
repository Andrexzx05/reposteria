<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.productos.seguridad.Pagina" %>

<%
String usuario;
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null) //Se verifica si existe la variable
{
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
} else {
	usuario = (String) sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
	int perfil = (Integer) sesion.getAttribute("perfil");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<header>Code & Cake</header>
	<nav>
		<ul>
			<li><a href="consulta.jsp">Ver Productos</a></li>
			<li><a href="categoria.jsp">Buscar Categoria</a></li>
			<li><a href="Registro.jsp">Registros</a></li>
		</ul>
		<aside>
			<ul>
				<%
				Pagina pag = new Pagina();
				String menu = pag.mostrarMenu(perfil);
				out.print(menu);
				%>
			</ul>
		</aside>
	</nav>


	<section id="menu">
		<h1>
			Bienvenido
			<%= usuario %>
		</h1>
	</section>
	
	<footer>
		<h3>Redes Sociales</h3>
		<ul>
			<li><a href="https://www.facebook.com" target="_blank"> <img
					class="icono" src="imagenes/facebook.png" width="50" height="50"
					alt="facebook">
			</a></li>
			<li><a href="https://www.instagram.com" target="_blank"> <img
					class="icono" src="imagenes/instagram.png" width="50" height="50"
					alt="instagram">
			</a></li>
			<li><a href="https://whatsapp.com" target="_blank"> <img
					class="icono" src="imagenes/whatsapp.png" width="50" height="50"
					alt="Whatsapp">
			</a></li>
		</ul>
	</footer>


</body>
</html>
	<%
	}
	%>