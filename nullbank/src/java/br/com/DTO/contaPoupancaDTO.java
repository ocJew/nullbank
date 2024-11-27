package br.com.DTO;

import java.math.BigDecimal;

public class contaPoupancaDTO {

    private int numeroConta; // Chave estrangeira referenciando CONTAS_BANCARIAS_numero
    private BigDecimal taxaJuros;

    public int getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(int numeroConta) {
        this.numeroConta = numeroConta;
    }

    public BigDecimal getTaxaJuros() {
        return taxaJuros;
    }

    public void setTaxaJuros(BigDecimal taxaJuros) {
        this.taxaJuros = taxaJuros;
    }
}
