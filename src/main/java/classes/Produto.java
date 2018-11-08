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
public class Produto {
    
    private int id;
    private int idFornecedor;
    private String imagem;
    private String nome;
    private String descricao;
    private String contraIndicacao;
    private float preco;
    private int estoque;
    private String categoria;
    
    public Produto(){}
    
    public Produto(String imagem, String nome, String descricao, String contraIndicacao,
            float preco, int estoque, String categoria, int idFornecedor){
        this.idFornecedor = idFornecedor;
        this.imagem = imagem;
        this.nome = nome;
        this.descricao = descricao;
        this.contraIndicacao = contraIndicacao;
        this.preco = preco;
        this.estoque = estoque;
        this.categoria = categoria;
    }
    
    public int getIdFornecedor(){
        return this.idFornecedor;
    }
    
    public void setIdFornecedor(int id){
        this.idFornecedor = id;
    }
    
    public String getImagem(){
        return this.imagem;
    }
    
    public void setImagem(String imagem){
        this.imagem = imagem;
    }
    
    public String getNome() {
        return nome;
    }
  
    public void setNome(String nome) {
        this.nome = nome;
    }
  
    public String getDescricao() {
        return descricao;
    }
  
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
  
    public String getContraIndicacao() {
        return contraIndicacao;
    }
   
    public void setContraIndicacao(String contraIndicacao) {
        this.contraIndicacao = contraIndicacao;
    }
   
    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public int getEstoque() {
        return estoque;
    }

    public void setEstoque(int estoque) {
        this.estoque = estoque;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    
    
}
