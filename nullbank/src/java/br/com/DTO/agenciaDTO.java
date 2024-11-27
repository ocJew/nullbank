package br.com.DTO;

public class agenciaDTO {
    
    private int numero; //PK
    private String nome;
    private float montante_salarial;
    private String cidade;
    
    public int getNumero(){
        return numero;
    }
    
    public void setNumero(int numero){
        this.numero = numero;
    }
    
    public String getNome(){
        return nome;
    }
    
    public void setNome(String nome){
        this.nome = nome;
    }
    
    public float getMontante(){
        return montante_salarial;
    }
    
    public void setMontante(float montante_salarial_agencia){
        this.montante_salarial = montante_salarial_agencia;
    }
    
    public String getCidade(){
        return cidade;
    }
    
    public void setCidade(String cidade){
        this.cidade = cidade;
    }
    
}
