<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.productos.seguridad.*, com.productos.negocio.Producto"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<title>Gestión de Productos - Code & Cake</title>
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Great+Vibes&amp;display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="css/color.css" />
<link rel="stylesheet" href="css/style.css" />
<style>
.font-gv {
	font-family: 'Great Vibes', cursive;
}

.nav-link:hover {
	color: var(--color-text-alt);
}

.shadow-border {
	box-shadow: 0 4px 6px -1px var(--color-borde), 0 2px 4px -2px
		var(--color-borde);
}
</style>
</head>
<body class="color-fondo text-black">
	<header class="border-b border-color-borde">
		<nav
			class="max-w-7xl mx-auto flex items-center justify-between px-4 sm:px-6 lg:px-8 h-20">
			<div class="flex items-center space-x-6">
				<div class="flex justify-center md:justify-start">
					<div class="text-center md:text-left">
						<div
							class="text-xs tracking-widest mt-1 select-none color-text-alt">Code</div>
						<a href="#"><span
							class="font-gv text-4xl leading-none select-none color-text-alt">&
								Cake</span></a>
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
					int perfil = isLoggedIn ? (int) ses.getAttribute("perfil") : 0;
					out.print(pag_nav.mostrarMenu(perfil, isLoggedIn));
					%>
				</ul>
			</div>
		</nav>
	</header>
	<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-6 mb-10">
		<h2 class="text-2xl font-bold mb-6">Gestión de Productos</h2>

		<form action="agregarProducto.jsp" method="post" class="card">
			<table border="0" cellpadding="5" cellspacing="5">
				<tr>
					<td><label for="nombre">Nombre:</label></td>
					<td><input type="text" id="nombre" name="txtNombre"
						class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"></td>
				</tr>
				<tr>
					<td><label for="categoria"
						class="block text-sm font-medium text-gray-700">Categoría</label></td>
					<td><select id="categoria" name="categoria"
						class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
							<option selected>Escoja la categoría</option>
							<option value="1">Utensilios de Pastelería</option>
							<option value="2">Ingredientes Secos</option>
							<option value="3">Decoraciones y Toppings</option>
							<option value="4">Moldes y Bandejas</option>
							<option value="5">Herramientas de Decoración</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Agregar Producto"></td>
				</tr>
			</table>
		</form>


		<table class="min-w-full divide-y divide-gray-200">

			<tbody class="bg-white divide-y divide-gray-200">
				<%
				Producto pr = new Producto();
				out.print(pr.reporte("", ""));
				%>
			</tbody>
		</table>
	</main>
	<footer class="color-secondary text-white">
		<div
			class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 grid grid-cols-1 md:grid-cols-3 gap-8">
			<div class="flex justify-center md:justify-start">
				<div class="text-center md:text-left">
					<div class="text-xs tracking-widest mt-1 select-none">Code</div>
					<span class="font-gv text-4xl leading-none select-none">&
						Cake</span>
				</div>
			</div>
			<div>
				<h3 class="text-lg mb-4">Nuestro Taller</h3>
				<hr class="border-t border-white/40 mb-4" />
				<p class="text-xs max-w-xs">
					<strong>Ubicación:</strong><br />
					<iframe
						src="https://www.google.com/maps/d/embed?mid=1ODEvsfH7n0A3V9agw0IZlv9eB2caPbc&ehbc=2E312F"></iframe>
				</p>
			</div>
			<div>
				<h3 class="text-lg mb-4">Visita nuestras redes sociales</h3>
				<hr class="border-t border-white/40 mb-4" />
				<ul class="space-y-2 text-xs max-w-xs">
					<li class="flex items-center space-x-2"><a href=""><i
							class="fab fa-facebook-f"></i><span>Facebook</span></a></li>
					<li class="flex items-center space-x-2"><a href=""><i
							class="fab fa-instagram"></i><span>Instagram</span></a></li>
				</ul>
			</div>
		</div>
		<div
			class="border-t border-white/40 py-3 text-xs max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row justify-between items-center">
			<span>Desarrollado por Andre Michelena</span>
		</div>
	</footer>
</body>
</html>