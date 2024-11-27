package br.com.DTO;

import java.util.Date;

public class clienteDTO {

    private String cpf; // Primary Key
    private String senha; // criptografada
    private String nome;
    private String rg;
    private String orgaoEmissor;
    private String uf;
    private Date dataNascimento;
    private String tipoLogradouro;
    private String nomeLogradouro;
    private String numero;
    private String bairro;
    private String cep;
    private String cidade;
    private String estado;

    public String getCpf() {
        return cpf;
    }

    public String getSenha() {
        return senha;
    }

    public String getNome() {
        return nome;
    }

    public String getRg() {
        return rg;
    }

    public String getOrgaoEmissor() {
        return orgaoEmissor;
    }

    public String getUf() {
        return uf;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public String getTipoLogradouro() {
        return tipoLogradouro;
    }

    public String getNomeLogradouro() {
        return nomeLogradouro;
    }

    public String getNumero() {
        return numero;
    }

    public String getBairro() {
        return bairro;
    }

    public String getCep() {
        return cep;
    }

    public String getCidade() {
        return cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public void setOrgaoEmissor(String orgaoEmissor) {
        this.orgaoEmissor = orgaoEmissor;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public void setTipoLogradouro(String tipoLogradouro) {
        this.tipoLogradouro = tipoLogradouro;
    }

    public void setNomeLogradouro(String nomeLogradouro) {
        this.nomeLogradouro = nomeLogradouro;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
