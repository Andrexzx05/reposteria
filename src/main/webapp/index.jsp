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
<link rel="stylesheet" href="css/color.css" />
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
					<li><a class="nav-link" href="#"> INICIO </a></li>
					<li><a class="nav-link" href="#"> TIENDA </a></li>
					<li><a class="nav-link" href="#"> CATEGORIAS </a></li>
				</ul>
			</div>
			<div class="flex items-center space-x-4 text-black text-sm">
				<ul
					class="hidden md:flex space-x-6 text-sm font-normal color-text">
					<li><a class="nav-link flex items-center space-x-1" href="">
							<span class=text-xs> Inciar Sesion </span>
					</a></li>
					<li><a class="nav-link flex items-center space-x-1" href="">
							<span class="text-xs"> Registrarse </span>
					</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<!-- Main -->
	<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-6 mb-10">
		<div class="grid grid-cols-1 md:grid-cols-2 gap-8">
			<div class="p-6 color-principal rounded-lg shadow-border">
				<h2 class="text-2xl font-bold color-text mb-4">Nuestra misión</h2>
				<p class="text-sm color-text mb-2">
					¡En Code & Cake, ofrecemos pasteles deliciosos y los mejores
					implementos de pastelería para que puedas crear tus propias
					creaciones, garantizando calidad y sabor en cada producto!
				</p>
				<p class="text-sm color-text">
					Encontrarás todos los insumos para crear tus deliciosos productos.
				</p>
			</div>
			<div class="p-6 color-principal rounded-lg shadow-border">
				<h2 class="text-2xl font-bold color-text mb-4">Estamos ubicados en:</h2>
				<iframe
					class="w-full h-64 rounded-lg border border-color-borde"
					src="https://www.google.com/maps/d/embed?mid=1ODEvsfH7n0A3V9agw0IZlv9eB2caPbc&ehbc=2E312F">
				</iframe>
			</div>
		</div>
		<div class="mt-8">
			<aside class="p-6 color-principal rounded-lg shadow-border">
				<h3 class="text-xl font-bold color-text mb-4">Información</h3>
				<a
					class="text-sm color-text-alt hover:underline"
					href="https://ec.linkedin.com/">Ver más información de los desarrolladores</a>
			</aside>
		</div>
	</main>
	<!-- Footer -->
	<footer class="color-secondary text-white">
		<div
			class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 grid grid-cols-1 md:grid-cols-3 gap-8">
			<div class="flex justify-center md:justify-start">
				<div class="text-center md:text-left">
					<div class="text-xs tracking-widest mt-1 select-none">Code</div>
					<span class="font-gv text-4xl leading-none select-none"> & Cake </span>
				</div>
			</div>
			<div>
				<h3 class="text-lg mb-4">Nuestro Taller</h3>
				<hr class="border-t border-white/40 mb-4" />
				<p class="text-xs max-w-xs">
					<strong> Ubicación: </strong><br />
					<iframe
						src="https://www.google.com/maps/d/embed?mid=1ODEvsfH7n0A3V9agw0IZlv9eB2caPbc&ehbc=2E312F">
					</iframe>
				</p>
			</div>
			<div>
				<h3 class="text-lg mb-4">Visita nuestras redes sociales</h3>
				<hr class="border-t border-white/40 mb-4" />
				<ul class="space-y-2 text-xs max-w-xs">
					<li class="flex items-center space-x-2"><a href=""> <i
							class="fab fa-facebook-f"> </i> <span> Facebook </span>
					</a></li>
					<li class="flex items-center space-x-2"><a href=""> <i
							class="fab fa-instagram"> </i> <span> Instagram </span>
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