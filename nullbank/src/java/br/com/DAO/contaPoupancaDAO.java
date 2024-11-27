package br.com.DAO;

import br.com.DTO.contaPoupancaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.math.BigDecimal;
import java.util.ArrayList;

public class contaPoupancaDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public boolean cadastrarContaPoupanca(contaPoupancaDTO contaPoupanca) throws ClassNotFoundException {
        String sql = "INSERT INTO CONTA_POUPANCA(CONTAS_BANCARIAS_numero, taxa_juros) VALUES(?, ?)";

        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setInt(1, contaPoupanca.getNumeroConta());
            ps.setBigDecimal(2, contaPoupanca.getTaxaJuros());

            ps.execute();
            ps.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public contaPoupancaDTO consultarContaPoupanca(int numeroConta) throws ClassNotFoundException {
        String sql = "SELECT * FROM CONTA_POUPANCA WHERE CONTAS_BANCARIAS_numero = ?";
        con = new ConexaoDAO().conexaoBD();
        contaPoupancaDTO contaPoupanca = new contaPoupancaDTO();

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, numeroConta);
            rs = ps.executeQuery();

            if (rs.next()) {
                contaPoupanca.setNumeroConta(rs.getInt("CONTAS_BANCARIAS_numero"));
                contaPoupanca.setTaxaJuros(rs.getBigDecimal("taxa_juros"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return contaPoupanca;
    }

    // Outros métodos, como excluirContaPoupanca, alterarContaPoupanca, listarContasPoupanca, podem ser implementados conforme necessário.
}
