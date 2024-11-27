package br.com.DTO;

import java.util.Date;

public class contaCorrenteDTO {

    private int numeroConta; // Chave estrangeira referenciando CONTAS_BANCARIAS_numero
    private Date dataAniversario;

    public int getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(int numeroConta) {
        this.numeroConta = numeroConta;
    }

    public Date getDataAniversario() {
        return dataAniversario;
    }

    public void setDataAniversario(Date dataAniversario) {
        this.dataAniversario = dataAniversario;
    }
}
