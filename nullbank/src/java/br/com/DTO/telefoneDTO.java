package br.com.DTO;

public class telefoneDTO {

    private String telefone; // Primary Key
    private String clientesCpf; // Foreign Key

    public String getTelefone() {
        return telefone;
    }

    public String getClientesCpf() {
        return clientesCpf;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public void setClientesCpf(String clientesCpf) {
        this.clientesCpf = clientesCpf;
    }
}
