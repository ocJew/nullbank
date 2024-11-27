package br.com.DAO;

import br.com.DTO.telefoneDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class telefoneDAO {

    ResultSet rs;
    Connection con;
    PreparedStatement ps;

    public void cadastrarTelefone(telefoneDTO telefone) throws ClassNotFoundException {
        String sql = "INSERT INTO TELEFONES(telefone, CLIENTES_CPF) VALUES (?, ?)";

        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setString(1, telefone.getTelefone());
            ps.setString(2, telefone.getClientesCpf());

            ps.execute();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<telefoneDTO> getTelefonesByCliente(String cpf) throws ClassNotFoundException {
        List<telefoneDTO> telefones = new ArrayList<>();
        String sql = "SELECT telefone FROM TELEFONES WHERE CLIENTES_CPF = ?";

        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cpf);

            rs = ps.executeQuery();

            while (rs.next()) {
                telefoneDTO telefone = new telefoneDTO();
                telefone.setTelefone(rs.getString("telefone"));
                telefone.setClientesCpf(cpf); // Defina o CPF para cada telefone
                telefones.add(telefone);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return telefones;
    }
}
