<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.productos.negocio.*, com.productos.seguridad.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Code & Cake</title>
<link rel="stylesheet" href="css/style.css">

</head>

<%
String usuario;
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null) //Se verifica si existe la variable
{
usuario = (String) sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
}
%>

<body>
	<header>Code & Cake</header>
	<nav>
		<ul>
			<li><a href="consulta.jsp">Ver Productos</a></li>
			<li><a href="categoria.jsp">Buscar Categoria</a></li>
			<li><a href="login.jsp">Login</a></li>
				<li><a href="Registro.jsp">Registros</a></li>
			<aside>
			<ul>
				<%
				if (sesion.getAttribute("usuario") != null) {
					Pagina pag = new Pagina();
					int perfil = (Integer) sesion.getAttribute("perfil");
					String menu = pag.mostrarMenu(perfil);
					out.print(menu);
				} else {
				%>
				
				<%
				}
				%>
			</ul>		
			</aside>
	</nav>


	<div id="fondo_img"></div>

	<!-- fondo por si acaso  -->
	<div class="flex-container">
		<div class="flex-box">
			<div id="main-container">
				<h2>Nuestra mision</h2>
				<p>¡En Code & Cake, ofrecemos pasteles deliciosos y los mejores
					implementos de pastelería para que puedas crear tus propias
					creaciones, garantizando calidad y sabor en cada producto!</p>
				<p>Encontraras todos los insumos para crear tus deliciosos
					productos</p>
			</div>

			<div id="mapa">
			
				<iframe
					src="https://www.google.com/maps/d/embed?mid=1ODEvsfH7n0A3V9agw0IZlv9eB2caPbc&ehbc=2E312F">
				</iframe>
			</div>
			
			
		</div>

		<div id="lateral" class="flex-box">
			<aside class="informacion">
				<h3>Informacion</h3>


				<a href="https://ec.linkedin.com/">Ver más información del
					desarrolladores</a>         
			</aside>
		</div>
	</div>

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
