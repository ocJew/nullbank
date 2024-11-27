package br.com.DTO;

import java.util.Date;

public class transacaoDTO {

    private int numeroTransacao;
    private int numeroConta; // Chave estrangeira referenciando CONTAS_BANCARIAS_numero
    private String tipoTransacao; // 'saque', 'deposito', 'pagamento', 'estorno', 'transferencia'
    private Date dataHora;
    private float valor;

    public int getNumeroTransacao() {
        return numeroTransacao;
    }

    public void setNumeroTransacao(int numeroTransacao) {
        this.numeroTransacao = numeroTransacao;
    }

    public int getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(int numeroConta) {
        this.numeroConta = numeroConta;
    }

    public String getTipoTransacao() {
        return tipoTransacao;
    }

    public void setTipoTransacao(String tipoTransacao) {
        this.tipoTransacao = tipoTransacao;
    }

    public Date getDataHora() {
        return dataHora;
    }

    public void setDataHora(Date dataHora) {
        this.dataHora = dataHora;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }
}
