<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.productos.seguridad.*"%>

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
%>

<%
usuario = (String) sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
int perfil = (Integer) sesion.getAttribute("perfil");
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Code & Cake</title>

<link rel="stylesheet" href="style.css">
</head>

<body>
	<header>Code & Cake</header>
	<nav>
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="consulta.jsp">Ver Productos</a></li>
			<li><a href="categoria.jsp">Buscar Categoria</a></li>
			<li><a href="Registro.jsp">Registrarse</a></li>
			<%
				Pagina pag = new Pagina();
				String menu = pag.mostrarMenu(perfil);
				out.print(menu);
				%>
		</ul>
	</nav>

	<section class="opcion">
		<h1>
			Cambio de clave (
			<%
		out.println(usuario);
		%>
			)
		</h1>
		<form action="validarCambioClave.jsp" method="post" class="card">
			<table border="0" cellpadding="5" cellspacing="5">
			
			<!-- Formulario -->

				<tr>
					<td><label for="contrasena">Contraseña actual:</label></td>
					<td><input type="password" id="contrasena" name="contrasena"
						required></td>
				</tr>
				
				<tr>
					<td><label for="nueva_contrasena">Nueva Contraseña:</label></td>
					<td><input type="password" id="nueva_contrasena"
						name="nueva_contrasena" required></td>
				</tr>

				<tr>
					<td><label for="confirmar_contrasena">Confirmar Nueva
							Contraseña:</label></td>
					<td><input type="password" id="confirmar_contrasena"
						name="confirmar_contrasena" required></td>
				</tr>

				<tr>
					<td><label for="estado"> <%
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