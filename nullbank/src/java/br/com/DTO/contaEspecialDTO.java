package br.com.DTO;

public class contaEspecialDTO {

    private int numeroConta; // Chave estrangeira referenciando CONTAS_BANCARIAS_numero
    private float limiteCredito;

    public int getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(int numeroConta) {
        this.numeroConta = numeroConta;
    }

    public float getLimiteCredito() {
        return limiteCredito;
    }

    public void setLimiteCredito(float limiteCredito) {
        this.limiteCredito = limiteCredito;
    }
}
