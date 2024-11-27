package br.com.DAO;

import br.com.DTO.emailDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.util.List;

public class emailDAO {

    private Connection con;
    private PreparedStatement ps;

    public void cadastrarEmail(emailDTO email) throws ClassNotFoundException {
        String sql = "INSERT INTO EMAILS(email, CLIENTES_CPF) VALUES (?, ?)";

        try {
            con = new ConexaoDAO().conexaoBD();
            ps = con.prepareStatement(sql);

            ps.setString(1, email.getEmail());
            ps.setString(2, email.getClientesCpf());

            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao();
        }
    }

    public void excluirEmail(emailDTO email) throws ClassNotFoundException {
        String sql = "DELETE FROM EMAILS WHERE email = ? AND CLIENTES_CPF = ?";

        try {
            con = new ConexaoDAO().conexaoBD();
            ps = con.prepareStatement(sql);

            ps.setString(1, email.getEmail());
            ps.setString(2, email.getClientesCpf());

            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao();
        }
    }
    
    public List<String> getEmailsByCliente(String clientesCpf) throws ClassNotFoundException {
        ArrayList<String> emails = new ArrayList<>();
        String sql = "SELECT email FROM EMAILS WHERE CLIENTES_CPF = ?";

        try {
            con = new ConexaoDAO().conexaoBD();
            ps = con.prepareStatement(sql);
            ps.setString(1, clientesCpf);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                emails.add(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao();
        }

        return emails;
    }

    // Outros métodos relacionados a e-mails podem ser adicionados conforme necessário

    private void fecharConexao() {
        try {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
