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
public class Cartao {
    private int id_cartao;
    private String nrCartao;
    private String nomeImpresso;
    private String validade;
    private String cvv;
    private String cpfTitular;
    private float saldo;

   
    public int getId_cartao() {
        return id_cartao;
    }

   
    public void setId_cartao(int id_cartao) {
        this.id_cartao = id_cartao;
    }

    /**
     * @return the nrCartao
     */
    public String getNrCartao() {
        return nrCartao;
    }

    /**
     * @param nrCartao the nrCartao to set
     */
    public void setNrCartao(String nrCartao) {
        this.nrCartao = nrCartao;
    }

    /**
     * @return the nomeImpresso
     */
    public String getNomeImpresso() {
        return nomeImpresso;
    }

    /**
     * @param nomeImpresso the nomeImpresso to set
     */
    public void setNomeImpresso(String nomeImpresso) {
        this.nomeImpresso = nomeImpresso;
    }

    /**
     * @return the validade
     */
    public String getValidade() {
        return validade;
    }

    /**
     * @param validade the validade to set
     */
    public void setValidade(String validade) {
        this.validade = validade;
    }

    /**
     * @return the cvv
     */
    public String getCvv() {
        return cvv;
    }

    /**
     * @param cvv the cvv to set
     */
    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    /**
     * @return the cpfTitular
     */
    public String getCpfTitular() {
        return cpfTitular;
    }

    /**
     * @param cpfTitular the cpfTitular to set
     */
    public void setCpfTitular(String cpfTitular) {
        this.cpfTitular = cpfTitular;
    }

    /**
     * @return the saldo
     */
    public float getSaldo() {
        return saldo;
    }

    /**
     * @param saldo the saldo to set
     */
    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }
}
