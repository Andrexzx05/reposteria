<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
<%
String usuario;
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null) {
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
} else {
	usuario = (String) sesion.getAttribute("usuario");
	int perfil = (Integer) sesion.getAttribute("perfil");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<title>Cambio de Clave - Code & Cake</title>
	<script src="https://cdn.tailwindcss.com"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&amp;display=swap" rel="stylesheet" />
	<link rel="stylesheet" href="css/color.css" />
	<link rel="stylesheet" href="css/style.css" />
	<style>
		.font-gv { font-family: 'Great Vibes', cursive; }
		.nav-link:hover { color: var(--color-text-alt); }
		.shadow-border { box-shadow: 0 4px 6px -1px var(--color-borde), 0 2px 4px -2px var(--color-borde); }
	</style>
</head>
<body class="color-fondo text-black">
	<header class="border-b border-color-borde">
		<nav class="max-w-7xl mx-auto flex items-center justify-between px-4 sm:px-6 lg:px-8 h-20">
			<div class="flex items-center space-x-6">
				<div class="flex justify-center md:justify-start">
					<div class="text-center md:text-left">
						<div class="text-xs tracking-widest mt-1 select-none color-text-alt">Code</div>
						<a href="#"><span class="font-gv text-4xl leading-none select-none color-text-alt">& Cake</span></a>
					</div>
				</div>
				<ul class="hidden md:flex space-x-6 text-sm font-normal color-text">
					<li><a class="nav-link" href="index.jsp">INICIO</a></li>
					<li><a class="nav-link" href="products.jsp">TIENDA</a></li>
					<li><a class="nav-link" href="categoria.jsp">CATEGORIAS</a></li>
				</ul>
			</div>
			<div class="flex items-center space-x-4 text-black text-sm">
				<ul class="hidden md:flex space-x-6 text-sm font-normal color-text">
					<%
					Pagina pag_nav = new Pagina();
					HttpSession ses = request.getSession();
					Object usr = ses.getAttribute("usuario");
					boolean isLoggedIn = (usr != null);
					int perfl = isLoggedIn ? (int) ses.getAttribute("perfil") : 0;
					out.print(pag_nav.mostrarMenu(perfl, isLoggedIn));
					%>
				</ul>
			</div>
		</nav>
	</header>
	<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-6 mb-10">
		<section class="opcion">
			<h1>Cambio de clave (<%= usuario %>)</h1>
			<form action="validarCambioClave.jsp" method="post" class="card">
				<table border="0" cellpadding="5" cellspacing="5">
					<!-- Formulario -->
					<tr>
						<td><label for="contrasena">Contraseña actual:</label></td>
						<td><input type="password" id="contrasena" name="contrasena" required></td>
					</tr>
					<tr>
						<td><label for="nueva_contrasena">Nueva Contraseña:</label></td>
						<td><input type="password" id="nueva_contrasena" name="nueva_contrasena" required></td>
					</tr>
					<tr>
						<td><label for="confirmar_contrasena">Confirmar Nueva Contraseña:</label></td>
						<td><input type="password" id="confirmar_contrasena" name="confirmar_contrasena" required></td>
					</tr>
					<tr>
						<td><label for="estado">
							<%
							String estado = (String) sesion.getAttribute("estado");
							if (estado != null) {
								out.println(estado);
							}
							%>
						</label></td>
					</tr>
					<!-- Boton de confirmar -->
					<tr>
						<td><input type="reset" value="Cancelar"></td>
						<td><input type="submit" value="Cambio de Clave"></td>
					</tr>
				</table>
			</form>
		</section>
	</main>
	<footer class="color-secondary text-white">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 grid grid-cols-1 md:grid-cols-3 gap-8">
			<div class="flex justify-center md:justify-start">
				<div class="text-center md:text-left">
					<div class="text-xs tracking-widest mt-1 select-none">Code</div>
					<span class="font-gv text-4xl leading-none select-none">& Cake</span>
				</div>
			</div>
			<div>
				<h3 class="text-lg mb-4">Nuestro Taller</h3>
				<hr class="border-t border-white/40 mb-4" />
				<p class="text-xs max-w-xs">
					<strong>Ubicación:</strong><br />
					<iframe src="https://www.google.com/maps/d/embed?mid=1ODEvsfH7n0A3V9agw0IZlv9eB2caPbc&ehbc=2E312F"></iframe>
				</p>
			</div>
			<div>
				<h3 class="text-lg mb-4">Visita nuestras redes sociales</h3>
				<hr class="border-t border-white/40 mb-4" />
				<ul class="space-y-2 text-xs max-w-xs">
					<li class="flex items-center space-x-2"><a href=""><i class="fab fa-facebook-f"></i><span>Facebook</span></a></li>
					<li class="flex items-center space-x-2"><a href=""><i class="fab fa-instagram"></i><span>Instagram</span></a></li>
				</ul>
			</div>
		</div>
		<div class="border-t border-white/40 py-3 text-xs max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row justify-between items-center">
			<span>Desarrollado por Andre Michelena</span>
		</div>
	</footer>
</body>
</html>
<%
}
%>