/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author alanfelipe
 */
public class Agendamento {

    private int idAgendamento;
    private Fornecedor fornecedor;
    private Cliente cliente;
    private Pet pet;
    private Servico servico;
    private String dataAgendamento;
    private Boolean isConcluido;

    public int getIdAgendamento() {
        return idAgendamento;
    }

    public void setIdAgendamento(int idAgendamento) {
        this.idAgendamento = idAgendamento;
    }

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }

    public Servico getServico() {
        return servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }

    public String getDataAgendamento() {
        return dataAgendamento;
    }

    public void setDataAgendamento(String dataAgendamento) {
        this.dataAgendamento = dataAgendamento;
    }

    public Boolean getIsConcluido() {
        return isConcluido;
    }

    public void setIsConcluido(Boolean isConcluido) {
        this.isConcluido = isConcluido;
    }
    
    public Double getTotalSerico() {
    	float total =  (this.getServico().getPreco() + this.servico.getFrete());
    	Double result = new Double(total);
    	return result;
    }
}