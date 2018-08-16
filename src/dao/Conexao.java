package dao;


import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.jdbc.Driver;

public class Conexao {
	private static Connection con = null;
	private Conexao(){
		System.out.println("Conexão criada");
	}
	public static Connection getConexao() throws ClassNotFoundException, SQLException{
		if (con == null){
			Class.forName("com.mysql.jdbc.Driver");
			//String url = "jdbc:mysql://localhost:3306/projetocrudnb?user=root&password=";
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/projetocrudnb","root","");
		}
		return con;
	}
	
	public static void finalizar() throws Exception{
		con.close();
	}
 	
}

    
    
   
