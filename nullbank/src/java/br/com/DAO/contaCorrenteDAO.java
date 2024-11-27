package br.com.DAO;

import br.com.DTO.contaCorrenteDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class contaCorrenteDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ArrayList<contaCorrenteDTO> lista = new ArrayList<>();

    public boolean cadastrarContaCorrente(contaCorrenteDTO contaCorrente) throws ClassNotFoundException {
        String sql = "INSERT INTO CONTA_CORRENTE(CONTAS_BANCARIAS_numero, data_aniversario) VALUES(?, ?)";

        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setInt(1, contaCorrente.getNumeroConta());
            ps.setDate(2, new java.sql.Date(contaCorrente.getDataAniversario().getTime()));

            ps.execute();
            ps.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public contaCorrenteDTO consultarContaCorrente(int numeroConta) throws ClassNotFoundException {
        String sql = "SELECT * FROM CONTA_CORRENTE WHERE CONTAS_BANCARIAS_numero = ?";
        con = new ConexaoDAO().conexaoBD();
        contaCorrenteDTO contaCorrente = new contaCorrenteDTO();

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, numeroConta);
            rs = ps.executeQuery();

            if (rs.next()) {
                contaCorrente.setNumeroConta(rs.getInt("CONTAS_BANCARIAS_numero"));
                contaCorrente.setDataAniversario(rs.getDate("data_aniversario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return contaCorrente;
    }

    // Outros métodos, como excluirContaCorrente, alterarContaCorrente, listarContasCorrentes, podem ser implementados conforme necessário.
}
