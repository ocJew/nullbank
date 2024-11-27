package br.com.DTO;

import java.util.Date;

public class dependenteDTO {

    private String nome;
    private int matriculaFuncionario; // Chave estrangeira referenciando FUNCIONARIOS.matricula_login
    private Date dataNascimento;
    private Parentesco parentesco; // Pode ser "filho", "filha", "conjuge", "genitor", "genitora"
    private Integer idade;

    public enum Parentesco {
        filho, filha, conjuge, genitor, genitora
    }

    public String getNome() {
        return nome;
    }

    public int getMatriculaFuncionario() {
        return matriculaFuncionario;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public Parentesco getParentesco() {
        return parentesco;
    }

    public Integer getIdade() {
        return idade;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setMatriculaFuncionario(int matriculaFuncionario) {
        this.matriculaFuncionario = matriculaFuncionario;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public void setParentesco(Parentesco parentesco) {
        this.parentesco = parentesco;
    }

    public void setIdade(Integer idade) {
        this.idade = idade;
    }
}
