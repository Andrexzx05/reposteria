<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.productos.seguridad.*, com.productos.negocio.Producto" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
<title>Insert title here</title>
</head>

<body>
	<h2>
		Gestión Productos
		<button onclick="cerrarSesion()">Cerrar Sesión</button>
	</h2>

	<form action="Ingresar productos.jsp" method="get">
		<div class="mb-3">
			<label for="nombre" class="form-label">Nombre</label>
			<input type="text" class="form-control" id="nombre" name="txtNombre"> 
		</div>

		<select class="form-select" aria-label="Default select example">
			<option selected>Escoja la categoría</option>
			<option value="1">Utensilios de Pastelería</option>
			<option value="2">Ingredientes Secos</option>
			<option value="3">Decoraciones y Toppings</option>
			<option value="4">Moldes y Bandejas</option>
			<option value="5">Herramientas de Decoración</option>
		</select>
	
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<table class="table">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Producto</th>
				<th scope="col">Categoría</th>
				<th scope="col">Precio</th>
				<th scope="col">Cantidad</th>
				<th scope="col">Actualizar</th>
				<th scope="col">Eliminar</th>
			</tr>
		</thead>
		<tbody>
			<%
			Producto pr = new Producto();
			out.print(pr.reporte());
			%>
		</tbody>
	</table>
</body>
</html>