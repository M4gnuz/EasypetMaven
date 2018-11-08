/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author glima
 */
public class Financeiro {
    private int id_transacao;
    private int id_pedido;
    private int id_fornecedor;
    private String tipo;
    private String data;
    private double valorOperacao;
    private double saldo;
    

    /**
     * @return the id_transacao
     */
    public int getId_transacao() {
        return id_transacao;
    }

    /**
     * @param id_transacao the id_transacao to set
     */
    public void setId_transacao(int id_transacao) {
        this.id_transacao = id_transacao;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the data
     */
    public String getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(String data) {
        this.data = data;
    }

    /**
     * @return the valorOperacao
     */
    public double getValorOperacao() {
        return valorOperacao;
    }

    /**
     * @param valorOperacao the valorOperacao to set
     */
    public void setValorOperacao(double valorOperacao) {
        this.valorOperacao = valorOperacao;
    }

    /**
     * @return the saldo
     */
    public double getSaldo() {
        return saldo;
    }

    /**
     * @param saldo the saldo to set
     */
    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    /**
     * @return the id_pedido
     */
    public int getId_pedido() {
        return id_pedido;
    }

    /**
     * @param id_pedido the id_pedido to set
     */
    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    /**
     * @return the id_fornecedor
     */
    public int getId_fornecedor() {
        return id_fornecedor;
    }

    /**
     * @param id_fornecedor the id_fornecedor to set
     */
    public void setId_fornecedor(int id_fornecedor) {
        this.id_fornecedor = id_fornecedor;
    }
}
