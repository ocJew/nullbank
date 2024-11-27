package br.com.DAO;

import br.com.DTO.agenciaDTO;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class agenciaDAO {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ArrayList<agenciaDTO> lista = new ArrayList<>();
    
    public void cadastrarAgencia(agenciaDTO agencia) throws ClassNotFoundException{
        String sql = "INSERT INTO AGENCIA(ID, nome, salario_montante_total, cidade) VALUES(?,?,?,?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, agencia.getNumero());
            ps.setString(2, agencia.getNome());
            ps.setFloat(3, agencia.getMontante());
            ps.setString(4, agencia.getCidade());
            
            ps.execute();
            ps.close();     
        } catch (SQLException e) {e.printStackTrace();}
    }
    
    public ArrayList<agenciaDTO> PesquisarAgencia() throws ClassNotFoundException{
        String sql = "SELECT * FROM AGENCIA";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while(rs.next()){
                agenciaDTO agencia = new agenciaDTO();
                agencia.setNumero(rs.getInt("ID"));
                agencia.setNome(rs.getString("nome"));
                agencia.setMontante(rs.getFloat("salario_montante_total"));
                agencia.setCidade(rs.getString("cidade"));
                
                lista.add(agencia);
            } 
        } catch (Exception e) {e.printStackTrace();} 
        return lista;
    }
    
    public void excluirAgencia(agenciaDTO agencia) throws ClassNotFoundException{
        String sql = "DELETE FROM AGENCIA WHERE ID = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, agencia.getNumero());
            
            ps.execute();
            ps.close();     
        } catch (SQLException e) {e.printStackTrace();}
    }
    
    public void alterarAgencia(agenciaDTO agencia) throws ClassNotFoundException{
        String sql = "UPDATE AGENCIA SET nome = ?, cidade = ? WHERE ID = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setString(1, agencia.getNome());
            ps.setString(2, agencia.getCidade());
            ps.setInt(3, agencia.getNumero());

            ps.execute();
            ps.close();     
        } catch (SQLException e) {e.printStackTrace();}
    }
}
