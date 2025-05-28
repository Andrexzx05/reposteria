<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.productos.negocio.*, com.productos.seguridad.*"%>
<html lang="es">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<title>Modificar producto-Code & Cake</title>
<script src="https://cdn.tailwindcss.com">
	
</script>
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
	box-shadow: 0 4px 6px -1px var(--color-borde), 0 2px 4px -2px var(--color-borde);
}
</style>
</head>
<body class="color-fondo text-black">
	<!-- Header -->
	<header class="border-b border-color-borde">
		<nav
			class="max-w-7xl mx-auto flex items-center justify-between px-4 sm:px-6 lg:px-8 h-20">
			<div class="flex items-center space-x-6">
				<div class="flex justify-center md:justify-start">
					<div class="text-center md:text-left">
						<div
							class="text-xs tracking-widest mt-1 select-none color-text-alt">Code</div>
						<a href="#"> <span
							class="font-gv text-4xl leading-none select-none color-text-alt">
								& Cake </span>
						</a>
					</div>
				</div>
				<ul
					class="hidden md:flex space-x-6 text-sm font-normal color-text">
					<li><a class="nav-link" href="index.jsp"> INICIO </a></li>
					<li><a class="nav-link" href="products.jsp"> TIENDA </a></li>
					<li><a class="nav-link" href="categoria.jsp"> CATEGORIAS </a></li>
				</ul>
			</div>
			<div class="flex items-center space-x-4 text-black text-sm">
				<ul
					class="hidden md:flex space-x-6 text-sm font-normal color-text">
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
	
		<%
	 // Solo procesar la modificación si es POST y todos los parámetros existen
	boolean mostrarFormulario = true;
	if (request.getMethod().equalsIgnoreCase("POST") &&
	    request.getParameter("id") != null &&
	    request.getParameter("producto") != null &&
	    request.getParameter("cantidad") != null &&
	    request.getParameter("precio") != null &&
	    request.getParameter("cmbCategoria") != null) {
	    Producto negocio = new Producto();
	    int id = Integer.parseInt(request.getParameter("id"));
	    String producto = request.getParameter("producto");
	    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
	    double precio = Double.parseDouble(request.getParameter("precio"));
	    int cat = Integer.parseInt(request.getParameter("cmbCategoria"));
	    boolean resultado = negocio.modificarProducto(id, producto, cantidad, precio, cat);
	    mostrarFormulario = false;
	    if (resultado) {
	        out.println("<p class='text-green-700 font-bold text-xl my-4'>Producto modificado correctamente.</p>");
	    } else {
	        out.println("<p class='text-red-700 font-bold text-xl my-4'>Error al modificar el producto.</p>");
	    }
	}
	%>
	
	<!-- Main -->
	<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-6 mb-10">
	<h2 class="text-3xl font-bold font-gv color-text mb-4">Modificar Producto</h2>
	<% if (mostrarFormulario) {
	    // Obtener datos actuales del producto para precargar el formulario
	    int id = 0;
	    String nombre = "";
	    int cantidad = 0;
	    double precio = 0.0;
	    int cat = 0;
	    if (request.getParameter("id") != null) {
	        try {
	            id = Integer.parseInt(request.getParameter("id"));
	            Producto negocio = new Producto();
	            java.sql.ResultSet rs = negocio.consultar(id);
	            if (rs != null && rs.next()) {
	                nombre = rs.getString("nombre_pr");
	                cantidad = rs.getInt("cantidad_pr");
	                precio = rs.getDouble("precio_pr");
	                cat = rs.getInt("id_cat");
	            }
	        } catch(Exception ex) {}
	    }
	%>
	<form action="modificarProducto.jsp" method="post" class="bg-white p-6 rounded shadow-border max-w-lg mx-auto">
	    <input type="hidden" name="id" value="<%= id %>">
	    <label for="producto" class="block font-bold mb-1">Producto</label>
	    <input type="text" id="producto" name="producto" value="<%= nombre %>" required class="w-full mb-4 border rounded px-3 py-2">
	    <label for="categoria" class="block font-bold mb-1">Categoría</label>
	    <select id="categoria" name="cmbCategoria" required class="w-full mb-4 border rounded px-3 py-2">
	        <%
	        Categoria cate = new Categoria();
	        out.print(cate.mostrarCategoria(cat));
	        %>
	    </select>
	    <label for="cantidad" class="block font-bold mb-1">Cantidad</label>
	    <input type="number" id="cantidad" name="cantidad" min="0" value="<%= cantidad %>" required class="w-full mb-4 border rounded px-3 py-2">
	    <label for="precio" class="block font-bold mb-1">Precio</label>
	    <input type="number" step="0.01" id="precio" name="precio" min="0" value="<%= precio %>" required class="w-full mb-4 border rounded px-3 py-2">
	    <input type="submit" value="Modificar Producto" class="bg-color-borde hover:bg-color-secondary text-white font-bold py-2 px-6 rounded transition">
	</form>
	<% } %>
		
		
	</main>
	<!-- Footer -->
	<footer class="color-secondary text-white">
		<div
			class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 grid grid-cols-1 md:grid-cols-3 gap-8">
			<div class="flex justify-center md:justify-start">
				<div class="text-center md:text-left">
					<div class="text-xl tracking-widest orbitron mt-1 select-none">Code</div>
					<span class="font-gv text-4xl leading-none select-none"> &
						Cake </span>
				</div>
			</div>
			<div>
				<h3 class="text-4xl font-gv mb-4">Nuestro Taller</h3>
				<hr class="border-t border-white/40 mb-4" />
				<p class="text-s max-w-xs">
					<strong> Ubicación: </strong><br />
					<iframe
						src="https://www.google.com/maps/d/embed?mid=1ODEvsfH7n0A3V9agw0IZlv9eB2caPbc&ehbc=2E312F">
					</iframe>
				</p>
			</div>
			<div>
				<h3 class="text-4xl font-gv mb-4 ">Visita nuestras redes sociales</h3>
				<hr class="border-t border-white/40 mb-4" />
				<ul class="space-y-2 text-xl max-w-xs">
					<li class="flex items-center space-x-2"><a href="https://www.facebook.com/profile.php?id=61576678326598"> <i
							class="fab fa-facebook-f"> </i> <span class="text-2xl font-bold font-gv "> Facebook </span>
					</a></li>
					<li class="flex items-center space-x-2"><a href="https://www.instagram.com/cod3_cak3/"> <i
							class="fab fa-instagram"> </i> <span class="text-2xl font-bold font-gv "> Instagram </span>
					</a></li>
					<li class="flex items-center space-x-2"><a href="https://www.linkedin.com/in/andré-michelena-andrade-74b4581b9/"> <i
							class="fab fa-instagram"> </i> <span class="text-2xl font-bold font-gv "> LikedIn </span>
					</a></li>
				</ul>
			</div>
		</div>
		<div
			class="border-t border-white/40 py-3 text-xs max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row justify-between items-center">
			<span> Desarrollado por Andre Michelena </span>
		</div>
	</footer>
</body>
</html>


