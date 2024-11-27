package br.com.DTO;

import java.util.Date;
import java.util.List;

public class funcionarioDTO {
    
    private String nome;
    private int agenciaID; // FK
    private int matricula; // para login
    private String senha; // criptografada
    private String endereco;
    private String cidade;
    private Cargo cargo; // pode ser "gerente", "atendente" ou "caixa"
    private Sexo sexo; // pode ser "masculino" ou "feminino"
    private Date dataNascimento;
    private float salario;
    
    public enum Sexo {
        M, F
    }
    public enum Cargo {
        gerente, atendente, caixa
    }

    public String getNome() {
        return nome;
    }
    
    public int getIDagencia() {
        return agenciaID;
    }

    public int getMatricula() {
        return matricula;
    }

    public String getSenha() {
        return senha;
    }

    public String getEndereco() {
        return endereco;
    }

    public String getCidade() {
        return cidade;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public Sexo getSexo() {
        return sexo;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public float getSalario() {
        return salario;
    }

    //
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public void setIDagencia(int agenciaID) {
        this.agenciaID = agenciaID;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }

    public void setSexo(Sexo sexo) {
        this.sexo = sexo;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public void setSalario(float salario) {
        this.salario = salario;
    }
    
}
