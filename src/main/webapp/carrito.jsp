<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.productos.negocio.*, com.productos.seguridad.*, com.productos.carrito.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<title>Carrito - Code & Cake</title>
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
				<ul class="hidden md:flex space-x-10 text-3xl font-gv color-text relative right-[-40px] ">
					<li><a class="nav-link" href="index.jsp"> Inicio </a></li>
					<li><a class="nav-link" href="products.jsp"> Tienda </a></li>
					<li><a class="nav-link" href="categoria.jsp"> Categorias </a></li>
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
		<!-- Main content for carrito -->
		
	<%
// Obtener o crear el carrito en sesión
HttpSession sesion = request.getSession();
Carrito carrito = (Carrito) sesion.getAttribute("carrito");
if (carrito == null) {
    carrito = new Carrito();
    sesion.setAttribute("carrito", carrito);
}
// Si se envió un producto por POST, agregarlo al carrito
String idParam = request.getParameter("id");
String cantidadParam = request.getParameter("cantidad");
if (idParam != null && cantidadParam != null) {
    try {
        int idProducto = Integer.parseInt(idParam);
        int cantidad = Integer.parseInt(cantidadParam);
        Producto prod = new Producto();
        java.sql.ResultSet rs = prod.consultar(idProducto);
        if (rs != null && rs.next()) {
            int stock = rs.getInt("cantidad_pr");
            // Buscar si ya está en el carrito y sumar la cantidad
            int cantidadEnCarrito = 0;
            for (Carrito.Item item : carrito.getItems()) {
                if (item.getIdProducto() == idProducto) {
                    cantidadEnCarrito = item.getCantidad();
                    break;
                }
            }
            if (cantidad + cantidadEnCarrito > stock) {
                // Redireccionar a vistaProducto.jsp con mensaje de error
                response.sendRedirect("vistaProducto.jsp?id=" + idProducto + "&error=La cantidad solicitada supera el stock disponible");
                return;
            }
            String nombre = rs.getString("nombre_pr");
            double precio = rs.getDouble("precio_pr");
            int estado = rs.getInt("estado");
            double valorOferta = rs.getDouble("valor");
            boolean enOferta = (estado == 1);
            carrito.agregarProducto(idProducto, nombre, cantidad, precio, valorOferta, enOferta);
        }
    } catch (Exception ex) {
        // Manejo de error simple
    }
}
%>
<h1 class="text-center text-3xl font-bold text-indigo-700">Carrito</h1>
<%
if (carrito.getItems().isEmpty()) {
%>
    <p class="text-center text-gray-700 mt-4">Tu carrito está vacío.</p>
<%
} else {
%>
    <div class="max-w-4xl mx-auto mt-8">
        <table class="tabla">
            <tr>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio Unitario</th>
                <th>Subtotal</th>
                <th>Acción</th>
            </tr>
            <% for (Carrito.Item item : carrito.getItems()) { %>
            <tr>
                <td><%=item.getNombre()%></td>
                <td><%=item.getCantidad()%></td>
                <td>
                    <% if (item.isEnOferta()) { %>
                        <span class="text-pink-600 font-bold">$<%=item.getValorOferta()%></span>
                    <% } else { %>
                        <span>$<%=item.getPrecio()%></span>
                    <% } %>
                </td>
                <td>
                    <% if (item.isEnOferta()) { %>
                        $<%=item.getValorOferta() * item.getCantidad()%>
                    <% } else { %>
                        $<%=item.getPrecio() * item.getCantidad()%>
                    <% } %>
                </td>
                <td>
                    <form action="carrito.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="eliminar" value="<%=item.getIdProducto()%>" />
                        <button type="submit" class="bg-color-secondary hover:bg-color-borde text-white font-bold px-3 py-1 rounded transition">Eliminar</button>
                    </form>
                </td>
            </tr>
            <% } %>
            <tr>
				<td colspan="3" class="text-right font-bold color-text">Total:</td>
                <td colspan="2" class="font-bold color-text-alt">$<%=carrito.getTotal()%></td>
            </tr>
        </table>
		<form action="pago.jsp" method="post" class="card mt-4">
			<table border="0" cellpadding="5" cellspacing="5">
				<tr>
					<td colspan="2"><input type="submit" value="Pago" class="bg-color-borde hover:bg-color-secondary text-white font-bold py-2 px-6 rounded transition"></td>
				</tr>
			</table>
		</form>
        <form action="carrito.jsp" method="post" class="mt-4 text-right">
            <input type="hidden" name="limpiar" value="1" />
            <button type="submit" class="bg-color-borde hover:bg-color-secondary text-white font-bold px-6 py-2 rounded transition">Vaciar carrito</button>
        </form>
    </div>
<%
}
// Eliminar producto
String eliminar = request.getParameter("eliminar");
if (eliminar != null) {
    try {
        int idEliminar = Integer.parseInt(eliminar);
        carrito.eliminarProducto(idEliminar);
        response.sendRedirect("carrito.jsp");
        return;
    } catch (Exception ex) {}
}
// Limpiar carrito
if (request.getParameter("limpiar") != null) {
    carrito.limpiar();
    response.sendRedirect("carrito.jsp");
    return;
}
%>
		
	</main>
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