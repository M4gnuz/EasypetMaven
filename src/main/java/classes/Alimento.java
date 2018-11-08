/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Luis Ragazzi
 */
public class Alimento extends  Produto{

    private String nomeIngrediente;
    private int qtdIngrediente;
    private String dtVencimento;
    
    public Alimento(){}
    
    public Alimento(String imagem, String nome, String descricao, String contraIndicacao, 
            float preco, int estoque, String categoria, String nomeIngrediente, int qtdIngrediente,
            String dtVencimento, int idFornecedor){
        super(imagem, nome, descricao, contraIndicacao, preco, estoque, categoria, idFornecedor);
        this.nomeIngrediente = nomeIngrediente;        
        this.dtVencimento = dtVencimento;
    }
    
    public String getNomeIngrediente() {
        return nomeIngrediente;
    }

    public void setNomeIngrediente(String nomeIngrediente) {
        this.nomeIngrediente = nomeIngrediente;
    }
  
    public String getDtVencimento() {
        return dtVencimento;
    }

    public void setDtVencimento(String dtVencimento) {
        this.dtVencimento = dtVencimento;
    }
    
}
