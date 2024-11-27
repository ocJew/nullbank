package br.com.DTO;

import java.math.BigDecimal;

public class contaDTO {
    
    private int numero;
    private int agenciaID; // FK
    private int gerenteMatricula; // FK
    private Float saldo;
    private String senha; // criptografada
    private TipoConta tipoConta; // pode ser "poupanca", "corrente", "especial"

    public enum TipoConta {
        poupanca, corrente, especial
    }

    public int getNumero() {
        return numero;
    }

    public int getAgenciaID() {
        return agenciaID;
    }

    public int getGerenteMatricula() {
        return gerenteMatricula;
    }

    public Float getSaldo() {
        return saldo;
    }

    public String getSenha() {
        return senha;
    }

    public TipoConta getTipoConta() {
        return tipoConta;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public void setAgenciaID(int agenciaID) {
        this.agenciaID = agenciaID;
    }

    public void setGerenteMatricula(int gerenteMatricula) {
        this.gerenteMatricula = gerenteMatricula;
    }

    public void setSaldo(Float saldo) {
        this.saldo = saldo;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public void setTipoConta(TipoConta tipoConta) {
        this.tipoConta = tipoConta;
    }
}
