package br.com.DAO;

import br.com.DTO.clienteDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class clienteDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ArrayList<clienteDTO> lista = new ArrayList<>();

    public void cadastrarCliente(clienteDTO cliente) throws ClassNotFoundException {
        String sql = "INSERT INTO CLIENTES(CPF, senha, nome, RG, orgao_emissor, UF, data_nascimento, tipo_logradouro, nome_logradouro, numero, bairro, CEP, cidade, estado) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setString(1, cliente.getCpf());
            ps.setString(2, cliente.getSenha());
            ps.setString(3, cliente.getNome());
            ps.setString(4, cliente.getRg());
            ps.setString(5, cliente.getOrgaoEmissor());
            ps.setString(6, cliente.getUf());
            ps.setDate(7, new java.sql.Date(cliente.getDataNascimento().getTime()));
            ps.setString(8, cliente.getTipoLogradouro());
            ps.setString(9, cliente.getNomeLogradouro());
            ps.setString(10, cliente.getNumero());
            ps.setString(11, cliente.getBairro());
            ps.setString(12, cliente.getCep());
            ps.setString(13, cliente.getCidade());
            ps.setString(14, cliente.getEstado());

            ps.execute();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<clienteDTO> pesquisarCliente() throws ClassNotFoundException {
        String sql = "SELECT * FROM CLIENTES";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                clienteDTO cliente = new clienteDTO();
                cliente.setCpf(rs.getString("CPF"));
                cliente.setSenha(rs.getString("senha"));
                cliente.setNome(rs.getString("nome"));
                cliente.setRg(rs.getString("RG"));
                cliente.setOrgaoEmissor(rs.getString("orgao_emissor"));
                cliente.setUf(rs.getString("UF"));
                cliente.setDataNascimento(rs.getDate("data_nascimento"));
                cliente.setTipoLogradouro(rs.getString("tipo_logradouro"));
                cliente.setNomeLogradouro(rs.getString("nome_logradouro"));
                cliente.setNumero(rs.getString("numero"));
                cliente.setBairro(rs.getString("bairro"));
                cliente.setCep(rs.getString("CEP"));
                cliente.setCidade(rs.getString("cidade"));
                cliente.setEstado(rs.getString("estado"));
                lista.add(cliente);
            }
        } catch (Exception e) {
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
        return lista;
    }

    public void excluirCliente(clienteDTO cliente) throws ClassNotFoundException {
        String sql = "DELETE FROM CLIENTES WHERE CPF = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getCpf());

            ps.execute();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterarCliente(clienteDTO cliente) throws ClassNotFoundException {
        String sql = "UPDATE CLIENTES SET senha=?, nome=?, RG=?, orgao_emissor=?, UF=?, data_nascimento=?, tipo_logradouro=?, nome_logradouro=?, numero=?, bairro=?, CEP=?, cidade=?, estado=? WHERE CPF = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setString(1, cliente.getSenha());
            ps.setString(2, cliente.getNome());
            ps.setString(3, cliente.getRg());
            ps.setString(4, cliente.getOrgaoEmissor());
            ps.setString(5, cliente.getUf());
            ps.setDate(6, new java.sql.Date(cliente.getDataNascimento().getTime()));
            ps.setString(7, cliente.getTipoLogradouro());
            ps.setString(8, cliente.getNomeLogradouro());
            ps.setString(9, cliente.getNumero());
            ps.setString(10, cliente.getBairro());
            ps.setString(11, cliente.getCep());
            ps.setString(12, cliente.getCidade());
            ps.setString(13, cliente.getEstado());

            ps.setString(14, cliente.getCpf());

            ps.execute();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean verificarLogin(clienteDTO cliente) throws ClassNotFoundException {
        String sql = "SELECT * FROM CLIENTES WHERE CPF = ? AND senha = md5(?)";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getCpf());
            ps.setString(2, cliente.getSenha());
            rs = ps.executeQuery();
            return rs.next(); // Retorna true se encontrou um cliente com o login e senha fornecidos 
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
}
