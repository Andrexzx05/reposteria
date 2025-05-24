<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div =id="content">
		<section>
			<article>
				<h3>Registro nuevo Cliente</h3>
				<form action="Respuesta.	jsp" method="post">
					<table border="1" cellpadding="5" cellspacing="5">
						<tr>
							<td>Nombre</td>
							<td><input type="text" name="textNombre"></td>
						</tr>
						<tr>
							<td>Cedula</td>
							<td><input type="number" name="textCedula" maxlenght="10" /></td>
						</tr>
						<tr>
							<td>Correo</td>
							<td><input type="number" name="textCorreo" maxlenght="10" /></td>
						</tr>
						<tr>
							<td>Contraseña</td>
							<td><input type="number" name="textContraseña"
								maxlenght="10" /></td>
						</tr>
						<tr>
							<td>Estado Civil</td>
							<td><select name="cmbECivil">
									<option value="Soltero">Soltero</option>
									<option value="Casado">Casado</option>
									<option value="Divorciado">Divorciado</option>
									<option value="Viudo">Viudo</option>
							</select></td>
						</tr>
						<tr>
							<td>Lugar de residencia</td>
							<td><input type="radio" name="rdResidencia" value="Sur" />Sur
								<input type="radio" name="rdResidencia" value="Norte" />Norte <input
								type="radio" name="rdResidencia" value="Centro" />Centro</td>
						</tr>

						<tr>
							<td>foto</td>
							<td><input type="file" name="fileFoto"
								accept=".jpg, .jpeg, .png" /></td>
						</tr>
						<tr>
							<td><h3>Mes y año de nacimiento</h3></td>
							<td><input type="month" name="fecha" /></td>
						</tr>

						<tr>
							<td><h3>Color favorito</h3></td>
							<td><input type="color" name="colorFavorito" value="#ff6b6b"
								style="cursor: pointer;" title="Selecciona tu color preferido"></td>
						</tr>

						<tr>
							<td><input type="submit" name="btn_enviar" id="btn_enviar"
								value="EnviarRegistro" /></td>

							<td><input type="reset" /></td>
						</tr>

					</table>
				</form>
			</article>
		</section>


	</div>




</body>
</html>