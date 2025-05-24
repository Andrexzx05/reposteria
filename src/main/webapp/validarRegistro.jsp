<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
    
<%
String usuario;
HttpSession sesion = request.getSession();
if (sesion.getAttribute("usuario") == null) 
{
%>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
} else {
%>

<%
usuario = (String) sesion.getAttribute("usuario"); 
int perfil = (Integer) sesion.getAttribute("perfil");
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Code & cake</title>
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

	<section class="opcion">
		<h1>Registro validarUsuario (
			<%
		out.println(usuario);
		%>
		)
		</h1>
		
		
		<form action="validarRegistro.jsp" method="post" class="card">
		<table border="0" cellpadding="5" cellspacing="5">
			<tr>
				<td><label for="nombre">Nombre:</label></td>
				<td><input type="text" id="nombre" name="nombre" required>
				</td>
			</tr>
			<tr>
				<td><label for="cedula">Cedula:</label></td>
				<td><input type="text" id="cedula" name="cedula" required>
				</td>
			</tr>
			
			<tr>
				<td><label for="perfil">Perfil:</label></td>
				<td><select id="perfil" name="perfil">
						<option value="1">Administrador</option>
						<option value="2">Cliente</option>
						<option value="3">Vendedor</option>
				</select></td>
			</tr>
			<tr>
				<td><label for="estado_civil">Estado Civil:</label></td>
				<td><select id="estado_civil" name="estado_civil">
						<option value="1">Soltero</option>
						<option value="2">Casado</option>
						<option value="3">Divorciado</option>
						<option value="4">Viudo</option>
				</select></td>
			</tr>
			<tr>
				<td><label for="correo">Correo:</label></td>
				<td><input type="email" id="correo" name="correo" required>
				</td>
			</tr>

			<tr>
                <td><label for="contrasena">Contraseña:</label></td>
                <td><label for="contrasena-default">654321</label></td>
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
			<tr>
				<td><input type="reset" value="Cancelar"></td>
				<td><input type="submit" value="Registrar"></td>
			</tr>

		</table>
	</form>
		
		
		<nav>
		<%
		Pagina pag = new Pagina();
		String menu = pag.mostrarMenu(perfil);
		out.print(menu);
		%>
		</nav>
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
	<script src="main.js"></script>
</body>
</html>

<%
}
%>



