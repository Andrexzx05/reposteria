<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buscar con categoria</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header>Code & Cake</header>
	<nav>
		<ul>
			<li><a href="login.jsp">Login</a></li>
			<li><a href="consulta.jsp">Ver Productos</a></li>
			<li><a href="categoria.jsp">Buscar Categoria</a></li>
			<li><a href="Registro.jsp">Registros</a></li>
		</ul>
	</nav>

	<section id="categorias">
		<form method="post" action="categoria.jsp">
			<%
			categoria c = new categoria();
			out.print(c.mostrarCategoria());
			%>
			<input type="submit" value="Verificar" />
		</form>

		<h3>Productos</h3>

		<%
		// Mostrar productos si se ha enviado el formulario
		String idCat = request.getParameter("cmbCategoria");
		if (idCat != null) {
			try {
				int catId = Integer.parseInt(idCat);
				producto p = new producto(); // Aquí se instancia correctamente
				out.print("<h3>Productos:</h3>");
				out.print(p.buscarProductoCategoria(catId)); // Se llama a la función desde la clase producto
			} catch (NumberFormatException e) {
				out.print("ID de categoría inválido.");
			}
		}
		%>
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