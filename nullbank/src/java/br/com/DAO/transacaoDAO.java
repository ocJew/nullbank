package br.com.DAO;

import br.com.DTO.transacaoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class transacaoDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ArrayList<transacaoDTO> lista = new ArrayList<>();

    public boolean cadastrarTransacao(transacaoDTO transacao) throws ClassNotFoundException {
        String sql = "INSERT INTO TRANSACOES(CONTAS_BANCARIAS_numero, tipo_transacao, data_hora, valor) VALUES(?,?,?,?)";

        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setInt(1, transacao.getNumeroConta());
            ps.setString(2, transacao.getTipoTransacao());
            ps.setTimestamp(3, new java.sql.Timestamp(transacao.getDataHora().getTime()));
            ps.setFloat(4, transacao.getValor());

            ps.execute();
            ps.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<transacaoDTO> listarTransacoesPorConta(int numeroConta) throws ClassNotFoundException {
        String sql = "SELECT * FROM TRANSACOES WHERE CONTAS_BANCARIAS_numero = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, numeroConta);
            rs = ps.executeQuery();

            while (rs.next()) {
                transacaoDTO transacao = new transacaoDTO();
                transacao.setNumeroTransacao(rs.getInt("numero_transacao"));
                transacao.setNumeroConta(rs.getInt("CONTAS_BANCARIAS_numero"));
                transacao.setTipoTransacao(rs.getString("tipo_transacao"));
                transacao.setDataHora(rs.getTimestamp("data_hora"));
                transacao.setValor(rs.getFloat("valor"));
                lista.add(transacao);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Outros métodos, como excluirTransacao, alterarTransacao, verificarTransacao, podem ser implementados conforme necessário.
}
