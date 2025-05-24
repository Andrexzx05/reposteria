<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.productos.seguridad.*, com.productos.negocio.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
<title>Insert title here</title>
</head>

 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
 
<body>

	<h2>
		Gestión Productos
		<button onclick="cerrarSesion()">Cerrar Sesión</button>
		
	</h2>
	  </body>

	<form action="Ingresar productos.jsp" metohod="" get>
		<divclass "mb-3">
  <label for ="nombre" class ="form label">Nombre </label>
  <input type ="text"class ="from-control"id= "nombre"name ="txtNombre"> 
  </div>
  

	<Select class "from-select" arial-label="default select example">
		<option>
	</Select>

	<select class="form-select" aria-label="Default select example">
		<option selected>escoja la categoria</option>
		<option value="1">Utensilios de Pastelería</option>
		<option value="2">Ingredientes Secos</option>
		<option value="3">Decoraciones y Toppings</option>
		<option value="4">Moldes y Bandejas</option>
		<option value="5">Herramientas de Decoración</option>
	</select>
	
	<button type="submit" class="btn btn-primary">Submit</button>
	
	</form>



	<form id="formularioProducto" enctype="multipart/form-data">
		<label for="nombre">Nombre:</label> <input type="text" id="nombre"
			name="nombre" required><br> <br> <label
			for="categoria">Categoría:</label> <select id="categoria"
			name="categoria" required>
			<option value="">Seleccione una categoría</option>
			<option value="damas">Damas</option>
			<option value="caballeros">Caballeros</option>
			<option value="niños">Niños</option>
		</select><br> <br> <label for="cantidad">Cantidad:</label> <input
			type="number" id="cantidad" name="cantidad" min="0" required><br>
		<br> <label for="precio">Precio:</label> <input type="number"
			id="precio" name="precio" min="0" step="0.01" required><br>
		<br> <label for="foto">Foto:</label> <input type="file" id="foto"
			name="foto" accept="image/*">
		<button type="button" onclick="subirFoto()">Subir</button>
		<br> <br>

		<button type="submit">Enviar</button>
		<button type="reset">Borrar</button>
	</form>
	
	<table class="table">
  <thead>
  <div class="agrupar">
    <tr>
      <th scope="col">id</th>
      <th scope="col">Producto</th>
      <th scope="col">Categoria</th>
      <th scope="col">Precio</th>
      <th scope="col">Cantidad</th>
      <th scope="col">Actualizar</th>
      <th scope="col">Eliminar</th>
      <% producto pr = new producto();
  out.print(pr.reporteProducto());
  %>
    </tr>
  </thead>

</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Categoria, com.productos.datos.Conexion, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ingresar Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="estilos.css">
    <link rel="stylesheet" href="productos.css">
   
</head>
<body>
    <!-- TÍTULO COMO LOGO -->
    <h1 class="titulo-logo">E-COMMERCE PARADISE STORE</h1>

    <header>
        <div class="logo">
            <a href="index.jsp">
                <img src="fotos/e.png" alt="Logo">
            </a>
        </div>
        <nav class="nav-container">
        	<a href="productos1.jsp">CONOCE NUESTROS PRODUCTOS</a>
            <a href="productos.jsp">BUSCALOS POR CATEGORIA</a>
            <a href="carrito.jsp">CARRITO</a>
            <a href="login.jsp">INICIAR SESIÓN</a>
        </nav>
    </header>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <div class="container">
        <h2 class="mt-4">Ingresar Productos</h2>
        
        <%
            // Cargar datos para edición
            String idPr = request.getParameter("edit");
            String nombre = "";
            String idCat = "";
            String cantidad = "";
            String precio = "";
            boolean isEdit = false;

            if (idPr != null) {
                Conexion con = new Conexion();
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    String sql = "SELECT nombre_pr, id_cat, cantidad_pr, precio_pr FROM tb_producto WHERE id_pr = ?";
                    ps = con.prepareStatement(sql);
                    ps.setInt(1, Integer.parseInt(idPr));
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        isEdit = true;
                        nombre = rs.getString("nombre_pr");
                        idCat = rs.getString("id_cat");
                        cantidad = rs.getString("cantidad_pr");
                        precio = rs.getString("precio_pr");
                    }
                } catch (SQLException e) {
                    out.print("<p class='error'>Error al cargar producto: " + e.getMessage() + "</p>");
                } finally {
                    Conexion.closeResources(rs, ps);
                    con.close();
                }
            }

            // Mostrar mensaje de éxito o error
            String mensaje = request.getParameter("mensaje");
            if (mensaje != null) {
                if (mensaje.equals("success")) {
                    out.print("<p class='success'>Producto actualizado correctamente</p>");
                } else if (mensaje.equals("error")) {
                    out.print("<p class='error'>Error al actualizar producto</p>");
                }
            }
        %>
        <form method="POST" action="<%= isEdit ? "ActualizarProducto.jsp" : "ProcesarIngresoProducto.jsp" %>">
            <% if (isEdit) { %>
                <input type="hidden" name="id_pr" value="<%= idPr %>">
            <% } %>
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombre %>" placeholder="Ingrese el nombre" required>
            </div>
            <div class="mb-3">
                <label for="cmbCategoria" class="form-label">Categoría</label>
                <%
                    Categoria categoria = new Categoria();
                    String selectCategoria = categoria.mostrarCategoria();
                    if (isEdit) {
                        selectCategoria = selectCategoria.replace("value=\"" + idCat + "\"", "value=\"" + idCat + "\" selected");
                    }
                    out.print(selectCategoria);
                %>
            </div>
            <div class="mb-3">
                <label for="cantidad" class="form-label">Cantidad</label>
                <select class="form-select" id="cantidad" name="cantidad" required>
                    <option value="" <%= cantidad.isEmpty() ? "selected disabled" : "" %>>Seleccione cantidad</option>
                    <% for (int i = 1; i <= 100; i++) { %>
                        <option value="<%= i %>" <%= cantidad.equals(String.valueOf(i)) ? "selected" : "" %>><%= i %></option>
                    <% } %>
                </select>
            </div>
            <div class="mb-3">
                <label for="precio" class="form-label">Precio</label>
                <input type="text" class="form-control" id="precio" name="precio" value="<%= precio %>" placeholder="Ingrese el precio" required>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-primary me-2"><%= isEdit ? "Actualizar" : "Enviar" %></button>
                <button type="reset" class="btn btn-secondary">Borrar</button>
                <% if (isEdit) { %>
                    <a href="IngresarProducto.jsp" class="btn btn-secondary">Cancelar</a>
                <% } %>
            </div>
        </form>

        <%
            // Procesar eliminación
            String deleteId = request.getParameter("delete");
            if (deleteId != null) {
                Conexion con = new Conexion();
                PreparedStatement ps = null;
                try {
                    String sql = "DELETE FROM tb_producto WHERE id_pr = ?";
                    ps = con.prepareStatement(sql);
                    ps.setInt(1, Integer.parseInt(deleteId));
                    ps.executeUpdate();
                    out.print("<p class='success'>Producto eliminado correctamente</p>");
                } catch (SQLException e) {
                    out.print("<p class='error'>Error al eliminar producto: " + e.getMessage() + "</p>");
                } finally {
                    Conexion.closeResources(null, ps);
                    con.close();
                }
            }
        %>

        <h3 class="mt-5">Productos Ingresados</h3>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Producto</th>
                    <th scope="col">Categoría</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Modificar</th>
                    <th scope="col">Eliminar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Conexion con = new Conexion();
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        String sql = "SELECT p.id_pr, p.nombre_pr, c.descripcion_cat, p.cantidad_pr, p.precio_pr " +
                                    "FROM tb_producto p JOIN tb_categoria c ON p.id_cat = c.id_cat";
                        ps = con.prepareStatement(sql);
                        rs = ps.executeQuery();
                        boolean hasResults = false;
                        while (rs.next()) {
                            hasResults = true;
                %>
                            <tr>
                                <td><%= rs.getString("nombre_pr") %></td>
                                <td><%= rs.getString("descripcion_cat") %></td>
                                <td><%= rs.getInt("cantidad_pr") %></td>
                                <td>$<%= rs.getDouble("precio_pr") %></td>
                                <td><a href="IngresarProducto.jsp?edit=<%= rs.getInt("id_pr") %>" class="btn btn-warning btn-sm">Modificar</a></td>
                                <td><a href="IngresarProducto.jsp?delete=<%= rs.getInt("id_pr") %>" class="btn btn-danger btn-sm">Eliminar</a></td>
                            </tr>
                <%
                        }
                        if (!hasResults) {
                %>
                            <tr>
                                <td colspan="6" class="text-center">No hay productos ingresados</td>
                            </tr>
                <%
                        }
                    } catch (SQLException e) {
                %>
                        <tr>
                            <td colspan="6" class="text-center text-red-400">Error al cargar productos: <%= e.getMessage() %></td>
                        </tr>
                <%
                    } finally {
                        Conexion.closeResources(rs, ps);
                        con.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>