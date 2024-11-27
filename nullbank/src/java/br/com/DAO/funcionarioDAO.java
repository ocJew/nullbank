package br.com.DAO;

import br.com.DTO.funcionarioDTO;
import br.com.DTO.funcionarioDTO.Cargo;
import br.com.DTO.funcionarioDTO.Sexo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class funcionarioDAO {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ArrayList<funcionarioDTO> lista = new ArrayList<>();
    
    public boolean cadastrarFuncionario(funcionarioDTO funcionario) throws ClassNotFoundException {
        String sql = "INSERT INTO FUNCIONARIOS(matricula_login, AGENCIA_ID, senha, cargo, salario, nome, endereço, cidade, sexo, data_nascimento) VALUES(?,?,?,?,?,?,?,?,?,?)";
        
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, funcionario.getMatricula());
            ps.setInt(2, funcionario.getIDagencia());
            ps.setString(3, funcionario.getSenha());
            ps.setString(4, funcionario.getCargo().toString());
            ps.setFloat(5, funcionario.getSalario());
            ps.setString(6, funcionario.getNome());
            ps.setString(7, funcionario.getEndereco());
            ps.setString(8, funcionario.getCidade());
            ps.setString(9, funcionario.getSexo().toString());
            ps.setDate(10, new java.sql.Date(funcionario.getDataNascimento().getTime()));
            
            ps.execute();
            ps.close();   
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public ArrayList<funcionarioDTO> pesquisarFuncionario() throws ClassNotFoundException {
        String sql = "SELECT * FROM FUNCIONARIOS";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                funcionarioDTO funcionario = new funcionarioDTO();
                funcionario.setNome(rs.getString("nome"));
                funcionario.setMatricula(rs.getInt("matricula_login"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setEndereco(rs.getString("endereço"));
                funcionario.setCidade(rs.getString("cidade"));
                funcionario.setDataNascimento(rs.getDate("data_nascimento"));
                funcionario.setSalario(rs.getFloat("salario"));
                funcionario.setIDagencia(rs.getInt("AGENCIA_ID"));
                funcionario.setSexo(Sexo.valueOf(rs.getString("sexo"))); 
                funcionario.setCargo(Cargo.valueOf(rs.getString("cargo")));         
                lista.add(funcionario);
            } 
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return lista;
    }
    
    public void excluirFuncionario(funcionarioDTO funcionario) throws ClassNotFoundException {
        String sql = "DELETE FROM FUNCIONARIOS WHERE matricula_login = ? AND AGENCIA_ID = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, funcionario.getMatricula());
            ps.setInt(2, funcionario.getIDagencia());
            
            ps.execute();
            ps.close();     
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void alterarFuncionario(funcionarioDTO funcionario) throws ClassNotFoundException {
        String sql = "UPDATE FUNCIONARIOS SET nome=?, senha=?, endereço=?, cidade=?, cargo=?, sexo=?, data_nascimento=?, salario=?, AGENCIA_ID=? WHERE matricula_login = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            
            ps.setString(1, funcionario.getNome());
            ps.setString(2, funcionario.getSenha());
            ps.setString(3, funcionario.getEndereco());
            ps.setString(4, funcionario.getCidade());
            ps.setString(5, funcionario.getCargo().toString());
            ps.setString(6, funcionario.getSexo().toString());
            ps.setDate(7, new java.sql.Date(funcionario.getDataNascimento().getTime()));
            ps.setFloat(8, funcionario.getSalario());
            ps.setInt(9, funcionario.getIDagencia());
            
            ps.setInt(10, funcionario.getMatricula());

            ps.execute();
            ps.close();     
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean verificarLogin(funcionarioDTO funcionario) throws ClassNotFoundException {
        String sql = "SELECT * FROM FUNCIONARIOS WHERE matricula_login = ? AND senha = md5(?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, funcionario.getMatricula());
            ps.setString(2, funcionario.getSenha());
            rs = ps.executeQuery();
            return rs.next(); // Retorna true se encontrou um funcionário com o login e senha fornecidos 
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false; // Se ocorrer uma exceção, assume que o login não é válido
    }
    
    public Cargo obterCargoPorMatricula(int matricula) throws ClassNotFoundException {
        String sql = "SELECT cargo FROM FUNCIONARIOS WHERE matricula_login = ?";
        con = new ConexaoDAO().conexaoBD();

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, matricula);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Retorna o cargo correspondente à matrícula
                return Cargo.valueOf(rs.getString("cargo"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } 

        return null;
    }
    
}

