<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.productos.negocio.*, com.productos.seguridad.*"%>
<html lang="es">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<title>Code & Cake</title>
<script src="https://cdn.tailwindcss.com">
	
</script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Great+Vibes&amp;display=swap"
	rel="stylesheet" />
<link 
	href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400..900&display=swap" 
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
	<!-- Header -->
	<header class="border-b border-color-borde">
		<nav
			class="max-w-7xl mx-auto flex items-center justify-between px-4 sm:px-6 lg:px-8 h-20">
			<div class="flex items-center space-x-6">
				<div class="flex justify-center md:justify-start">
					<div class="text-center md:text-left">
					<div class="text-xl tracking-widest orbitron mt-1 select-none">Code</div>
						
						<a href="#"> <span
							class="font-gv text-4xl leading-none select-none color-text-alt">
								& Cake </span>
						</a>
					</div>
				</div>
				<ul class="hidden md:flex space-x-10 text-3xl font-gv color-text relative right-[-40px] ">
					<li><a class="nav-link" href="index.jsp"> Inicio </a></li>
					<li><a class="nav-link" href="products.jsp"> Tienda </a></li>
					<li><a class="nav-link" href="categoria.jsp"> Categorias </a></li>
				</ul>
			</div>
			<div class="flex items-center space-x-4 text-black text-sm">
				<ul class="hidden md:flex space-x-6 text-sm font-gv color-text">
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
	<!-- Main -->
	<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-6 mb-10">
		
		<%
        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int idProducto = Integer.parseInt(idParam);
                Producto producto = new Producto();
                java.sql.ResultSet rs = producto.consultar(idProducto);
                if (rs != null && rs.next()) {
                    String nombre = rs.getString("nombre_pr");
                    int cantidad = rs.getInt("cantidad_pr");
                    double precio = rs.getDouble("precio_pr");
                    String imagen = producto.obtenerImagenProducto(idProducto);
                    if (imagen == null || imagen.isEmpty()) {
                        imagen = "imagenes/cupcakes.jpg";
                    }
        %>
        <section class="flex flex-col md:flex-row items-center justify-center gap-8 mt-8">
            <div class="shadow-border rounded-lg overflow-hidden w-full max-w-xs bg-white">
                <img src="<%= imagen %>" alt="<%= nombre %>" class="w-full h-64 object-cover">
            </div>
            <div class="w-full max-w-lg bg-white p-8 rounded-lg shadow-border">
                <h1 class="text-4xl font-bold font-gv color-text mb-4"><%= nombre %></h1>
                <p class="text-xl mb-2">Stock disponible: <span class="font-bold"><%= cantidad %></span></p>
                <p class="text-2xl mb-2">Precio: <span class="text-black font-bold">$<%= precio %></span></p>
                <form action="carrito.jsp" method="post" class="mt-6 flex flex-col sm:flex-row items-center gap-4">
                    <input type="hidden" name="id" value="<%= idProducto %>">
                    <input type="number" name="cantidad" min="1" max="<%= cantidad %>" value="1" class="border rounded px-3 py-2 w-24" required>
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-6 rounded text-lg transition">Agregar al carrito</button>
                </form>
                <% if (request.getParameter("error") != null) { %>
                    <div class="mt-4 text-red-600 font-bold"><%= request.getParameter("error") %></div>
                <% } %>
            </div>
        </section>
        <% } else { %>
            <div class="text-center text-2xl text-red-600 font-bold mt-10">Producto no encontrado.</div>
        <% }
        } catch(Exception ex) { %>
            <div class="text-center text-2xl text-red-600 font-bold mt-10">Error al cargar el producto.</div>
        <% }
        } else { %>
            <div class="text-center text-2xl text-red-600 font-bold mt-10">No se especificó el producto.</div>
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