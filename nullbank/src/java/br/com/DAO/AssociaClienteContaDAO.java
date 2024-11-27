package br.com.DAO;

import br.com.DTO.AssociaClienteContaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AssociaClienteContaDAO {

    Connection con;
    PreparedStatement ps;

    public boolean associarClienteConta(AssociaClienteContaDTO associaClienteConta) throws ClassNotFoundException {
        String sql = "INSERT INTO associa_cliente_conta(CLIENTES_CPF, CONTAS_BANCARIAS_numero, CONTAS_BANCARIAS_AGENCIA_ID) VALUES(?, ?, ?)";

        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setString(1, associaClienteConta.getCpfCliente());
            ps.setInt(2, associaClienteConta.getNumeroConta());
            ps.setInt(3, associaClienteConta.getAgenciaId());

            ps.execute();
            ps.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Outros métodos, como desassociarClienteConta, consultarClienteConta, listarAssociacoesClienteConta, podem ser implementados conforme necessário.
}
