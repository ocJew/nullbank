package br.com.DTO;

public class AssociaClienteContaDTO {

    private String cpfCliente; // Chave estrangeira referenciando CLIENTES_CPF
    private int numeroConta; // Chave estrangeira referenciando CONTAS_BANCARIAS_numero
    private int agenciaId; // Chave estrangeira referenciando CONTAS_BANCARIAS_AGENCIA_ID

    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public int getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(int numeroConta) {
        this.numeroConta = numeroConta;
    }

    public int getAgenciaId() {
        return agenciaId;
    }

    public void setAgenciaId(int agenciaId) {
        this.agenciaId = agenciaId;
    }
}
