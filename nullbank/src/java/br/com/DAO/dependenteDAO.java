package br.com.DAO;

import br.com.DTO.dependenteDTO;
import br.com.DTO.dependenteDTO.Parentesco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class dependenteDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ArrayList<dependenteDTO> lista = new ArrayList<>();

    public boolean cadastrarDependente(dependenteDTO dependente) throws ClassNotFoundException {
        String sql = "INSERT INTO DEPENDENTES(nome, FUNCIONARIOS_matricula_login, data_nascimento, parentesco) VALUES(?,?,?,?)";

        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setString(1, dependente.getNome());
            ps.setInt(2, dependente.getMatriculaFuncionario());
            ps.setDate(3, new java.sql.Date(dependente.getDataNascimento().getTime()));
            ps.setString(4, dependente.getParentesco().toString());

            ps.execute();
            ps.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<dependenteDTO> pesquisarDependentes() throws ClassNotFoundException {
        String sql = "SELECT * FROM DEPENDENTES";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                dependenteDTO dependente = new dependenteDTO();
                dependente.setNome(rs.getString("nome"));
                dependente.setMatriculaFuncionario(rs.getInt("FUNCIONARIOS_matricula_login"));
                dependente.setDataNascimento(rs.getDate("data_nascimento"));
                dependente.setParentesco(Parentesco.valueOf(rs.getString("parentesco")));
                dependente.setIdade(rs.getInt("idade"));

                lista.add(dependente);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void excluirDependente(dependenteDTO dependente) throws ClassNotFoundException {
        String sql = "DELETE FROM DEPENDENTES WHERE nome = ? AND FUNCIONARIOS_matricula_login = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, dependente.getNome());
            ps.setInt(2, dependente.getMatriculaFuncionario());

            ps.execute();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void alterarDependente(dependenteDTO dependente) throws ClassNotFoundException {
        String sql = "UPDATE DEPENDENTES SET data_nascimento=?, parentesco=?, idade=? WHERE nome = ? AND FUNCIONARIOS_matricula_login = ?";
        con = new ConexaoDAO().conexaoBD();
        try {
            ps = con.prepareStatement(sql);

            ps.setDate(1, new java.sql.Date(dependente.getDataNascimento().getTime()));
            ps.setString(2, dependente.getParentesco().toString());
            ps.setInt(3, dependente.getIdade());
            ps.setString(4, dependente.getNome());
            ps.setInt(5, dependente.getMatriculaFuncionario());

            ps.execute();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
