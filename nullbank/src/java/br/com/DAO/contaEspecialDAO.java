package br.com.DAO;

import br.com.DTO.contaEspecialDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class contaEspecialDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public boolean cadastrarContaEspecial(contaEspecialDTO contaEspecial) throws ClassNotFoundException {
        String sql = "INSERT INTO CONTA_ESPECIAL(CONTAS_BANCARIAS_numero, limite_credito) VALUES(?, ?)";

        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setInt(1, contaEspecial.getNumeroConta());
            ps.setFloat(2, contaEspecial.getLimiteCredito());

            ps.execute();
            ps.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public contaEspecialDTO consultarContaEspecial(int numeroConta) throws ClassNotFoundException {
        String sql = "SELECT * FROM CONTA_ESPECIAL WHERE CONTAS_BANCARIAS_numero = ?";
        con = new ConexaoDAO().conexaoBD();
        contaEspecialDTO contaEspecial = new contaEspecialDTO();

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, numeroConta);
            rs = ps.executeQuery();

            if (rs.next()) {
                contaEspecial.setNumeroConta(rs.getInt("CONTAS_BANCARIAS_numero"));
                contaEspecial.setLimiteCredito(rs.getFloat("limite_credito"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return contaEspecial;
    }

    // Outros métodos, como excluirContaEspecial, alterarContaEspecial, listarContasEspeciais, podem ser implementados conforme necessário.
}
