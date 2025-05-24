package com.productos.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.conection;

public class categoria {
	public String mostrarCategoria()
	{
	String combo="<select name=cmbCategoria>";
	String sql="SELECT * FROM tb_categoria";
	ResultSet rs=null;
	conection con=new conection();
	try
	{
	rs=con.Consulta(sql);
	while(rs.next())
	{
	combo+="<option value="+rs.getInt(1)+ ">"+rs.getString(2)+"</option>";
	}
	combo+="</select>";
	}
	catch(SQLException e)
	{
	System.out.print(e.getMessage());
	}
	return combo;
	}


}
