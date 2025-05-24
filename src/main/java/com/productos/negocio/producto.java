package com.productos.negocio;

import com.productos.datos.*;

import java.sql.ResultSet;
import java.sql.SQLException;

public class producto {
	public String consultarTodo() {
		String sql = "SELECT * FROM tb_producto ORDER BY id_pr";
		conection con = new conection();
		String tabla = "<table border=2><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
		ResultSet rs = null;
		rs = con.Consulta(sql);
		try {
			while (rs.next()) {
				if (rs != null) {
					tabla += "<tr><td>" + rs.getInt(1) + "</td>" + "<td>" + rs.getString(3) + "</td>" + "<td>"
							+ rs.getInt(4) + "</td>" + "<td>" + rs.getDouble(5) + "</td>" + "</td></tr>";
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla += "</table>";
		return tabla;
	}

	public String buscarProductoCategoria(int cat) {
		String sentencia = "SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat=" + cat;
		conection con = new conection();
		ResultSet rs = null;
		String resultado = "<table border=3>";
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				resultado += "<tr><td>" + rs.getString(1) + "</td>" + "<td>" + rs.getDouble(2) + "</td></tr>";
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		System.out.print(resultado);
		return resultado;
	}

	public String reporteProducto()
	{
		String sql="SELECT pr.id_pr, pr.nombre_pr, cat.descripcion_cat, pr.cantidad_pr, pr.precio_pr"
	+"FROM tb_producto pr, tb_categoria cat WHERE pr.id_cat=cat.id_cat";
		conection con = new conection();
		String tabla="<table class=table><thead><tr>"
		   +"   <th scope=\"col\">id</th>"
		   +"   <th scope=\"col\">Producto</th>"
			+"   <th scope=\"col\">Categoria</th>"
			+"<th scope=\"col\">Precio</th>"
			+"<th scope=\"col\">Cantidad</th>"
			+"  <th scope=\"col\">Actualizar</th>"
			+"  <th scope=\"col\">Eliminar</th>"
			+" </tr>/r/n"
			+" </thead>\r\n"
			+"<tbody>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
		    while(rs.next())
		    {
		        tabla+="<tr>"
		        + "<th scope=\"row\">"+rs.getInt(1)+"</th>"
		        + "<td>"+rs.getString(2)+"</td>"
		        + "<td>"+rs.getString(3)+"</td>"
		        + "<td>"+rs.getInt(4)+"</td>"
		        + "<td>"+rs.getDouble(5)+"</td>"
		        + "<td><a href=actualizar.jsp?id="+rs.getInt(1)+">"
		        + "Actualizar</a></td>"
		        + "<td><a href=eliminar.jsp?id="+rs.getInt(1)+">"
		        + "Eliminar</a></td>"
		        + "</tr>";
		    }
		} catch (SQLException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		    System.out.print(e.getMessage());
		}
		tabla+="</tbody></table>";
		return tabla;
	}
	public String eliminarProductos( String id )
    {
    	String sql="DELETE FROM tb_producto"
    			+ "WHERE id_pr=" + id;
    	conection con=new conection ();
    	String msg =con.Ejecutar(sql);
    	return msg;
    	
    }

}
