package br.com.DAO;

import br.com.DTO.contaDTO;
import br.com.DTO.contaDTO.TipoConta;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class contaDAO {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ArrayList<contaDTO> lista = new ArrayList<>();
    
    public boolean cadastrarConta(contaDTO conta) throws ClassNotFoundException {
        String sql = "INSERT INTO CONTAS_BANCARIAS(numero, AGENCIA_ID, gerente_mat, saldo, senha, tipo_conta) VALUES(?,?,?,?,?,?)";
        
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, conta.getNumero());
            ps.setInt(2, conta.getAgenciaID());
            ps.setInt(3, conta.getGerenteMatricula());
            ps.setFloat(4, conta.getSaldo());
            ps.setString(5, conta.getSenha());
            ps.setString(6, conta.getTipoConta().toString());
            
            ps.execute();
            ps.close();   
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public ArrayList<contaDTO> listarContasPorCliente(String cpfCliente) throws ClassNotFoundException {
        String sql = "SELECT * FROM CONTAS_BANCARIAS WHERE gerente_mat = (SELECT matricula_login FROM FUNCIONARIOS WHERE cpf = ?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cpfCliente);
            rs = ps.executeQuery();

            while (rs.next()) {
                contaDTO conta = new contaDTO();
                conta.setNumero(rs.getInt("numero"));
                conta.setAgenciaID(rs.getInt("AGENCIA_ID"));
                conta.setGerenteMatricula(rs.getInt("gerente_mat"));
                conta.setSaldo(rs.getFloat("saldo"));
                conta.setSenha(rs.getString("senha"));
                conta.setTipoConta(TipoConta.valueOf(rs.getString("tipo_conta")));  
                lista.add(conta);
            } 
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return lista;
    }
    
    public void excluirConta(int numeroConta, int agenciaID) throws ClassNotFoundException {
        String sql = "DELETE FROM CONTAS_BANCARIAS WHERE numero = ? AND AGENCIA_ID = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, numeroConta);
            ps.setInt(2, agenciaID);
            
            ps.execute();
            ps.close();     
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void alterarConta(contaDTO conta) throws ClassNotFoundException {
        String sql = "UPDATE CONTAS_BANCARIAS SET saldo=?, senha=?, tipo_conta=?, AGENCIA_ID=?, gerente_mat=? WHERE numero = ?";
        System.out.println("SQL Query: " + sql);
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            
            ps.setFloat(1, conta.getSaldo());
            ps.setString(2, conta.getSenha());
            ps.setString(3, conta.getTipoConta().toString());
            ps.setInt(4, conta.getAgenciaID());
            ps.setInt(5, conta.getGerenteMatricula());
            
            ps.setInt(6, conta.getNumero());

            ps.execute();
            ps.close();     
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<contaDTO> listarContas() throws ClassNotFoundException {
        String sql = "SELECT * FROM CONTAS_BANCARIAS";
        con = new ConexaoDAO().conexaoBD();

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                contaDTO conta = new contaDTO();
                conta.setNumero(rs.getInt("numero"));
                conta.setAgenciaID(rs.getInt("AGENCIA_ID"));
                conta.setGerenteMatricula(rs.getInt("gerente_mat"));
                conta.setSaldo(rs.getFloat("saldo"));
                conta.setSenha(rs.getString("senha"));
                conta.setTipoConta(TipoConta.valueOf(rs.getString("tipo_conta")));  
                lista.add(conta);
            } 
        } catch (Exception e) {
            e.printStackTrace();
        } 

        return lista;
    }
    
    public ArrayList<contaDTO> listarContasPorMatricula(int matricula) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<contaDTO> contas = new ArrayList<>();
        try {
            con = new ConexaoDAO().conexaoBD();
            String sql = "SELECT * FROM CONTAS_BANCARIAS WHERE gerente_mat = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, matricula);
            rs = ps.executeQuery();
            while (rs.next()) {
                contaDTO conta = new contaDTO();
                conta.setNumero(rs.getInt("numero"));
                conta.setAgenciaID(rs.getInt("AGENCIA_ID"));
                conta.setGerenteMatricula(rs.getInt("gerente_mat"));
                conta.setSaldo(rs.getFloat("saldo"));
                conta.setSenha(rs.getString("senha"));
                conta.setTipoConta(TipoConta.valueOf(rs.getString("tipo_conta")));
                contas.add(conta);
            }
        } catch (SQLException e) {e.printStackTrace();}
        return contas;
    }
}
