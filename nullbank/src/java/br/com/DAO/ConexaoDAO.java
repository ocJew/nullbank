package br.com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDAO {
    public Connection conexaoBD() throws ClassNotFoundException{
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://db4free.net:3306/equipe494871";
            String usuario = "marcops7";
            String senha = "equipe494871";
            con = DriverManager.getConnection(url, usuario, senha);
        } catch (ClassNotFoundException | SQLException e) {e.printStackTrace();}
        return con;
    }
}