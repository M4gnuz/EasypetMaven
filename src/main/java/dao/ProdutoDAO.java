    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Luis Ragazzi
 */
public class ProdutoDAO {   
    

    public static void addProduto(Produto produto, int id) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO tb_produtos (id_fornecedor, nome, descricao, contra_indicacao, estoque,"
                    + " valor, categoria) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);            
            ps.setString(2, produto.getNome());
            ps.setString(3, produto.getDescricao());
            ps.setString(4, produto.getContraIndicacao());
            ps.setFloat(6, produto.getPreco());
            ps.setInt(5, produto.getEstoque());
            ps.setString(7, produto.getCategoria() + "");
            ps.execute();
            
            ResultSet rs = ps.getGeneratedKeys();
            produto.setId((rs.next())?rs.getInt(1):0);
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void getAcessorio(Produto produto, int id){        
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_produtos WHERE id_produto=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id + "");            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                produto.setImagem(rs.getString("imagem"));
                produto.setNome(rs.getString("nome"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getFloat("valor"));
                produto.setContraIndicacao(rs.getString("contra_indicacao"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setEstoque(rs.getInt("estoque"));
                produto.setId(rs.getInt("id_produto"));
                produto.setIdFornecedor(rs.getInt("id_fornecedor"));
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void getProdutos(List lista, int id) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_produtos WHERE id_fornecedor=? ORDER BY id_produto DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id + "");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setImagem(rs.getString("imagem"));
                produto.setNome(rs.getString("nome"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getFloat("valor"));
                produto.setContraIndicacao(rs.getString("contra_indicacao"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setEstoque(rs.getInt("estoque"));
                produto.setId(rs.getInt("id_produto"));

                lista.add(produto);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public static void getAllProdutos(List lista) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_produtos ORDER BY id_produto DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setImagem(rs.getString("imagem"));
                produto.setNome(rs.getString("nome"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getFloat("valor"));
                produto.setContraIndicacao(rs.getString("contra_indicacao"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setEstoque(rs.getInt("estoque"));
                produto.setId(rs.getInt("id_produto"));

                lista.add(produto);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void alteraProduto(Produto produto) {
        try {

            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_produtos SET nome = ?, descricao = ?, contra_indicacao = ?, "
                    + "estoque = ?, valor = ?, categoria =? WHERE id_produto = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, produto.getNome());
            ps.setString(2, produto.getDescricao());
            ps.setString(3, produto.getContraIndicacao());
            ps.setInt(4, produto.getEstoque());
            ps.setFloat(5, produto.getPreco());
            ps.setString(6, produto.getCategoria());
            ps.setInt(7, produto.getId());

            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void excluirProduto(int id) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM tb_produtos WHERE id_produto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ps.execute();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public static void pesquisaProdutoFornecedor(String string, List lista, int id) {
        try {

            Connection con = Conecta.getConexao();
            String sql = "select * from tb_produtos where nome like ? and id_Fornecedor=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, '%'+string+'%');
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setImagem(rs.getString("imagem"));
                produto.setNome(rs.getString("nome"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getFloat("valor"));
                produto.setContraIndicacao(rs.getString("contra_indicacao"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setEstoque(rs.getInt("estoque"));
                produto.setId(rs.getInt("id_produto"));

                lista.add(produto);

                ps.execute();
                ps.close();
                con.close();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
     public static void addImagem(int idProduto, String imagem) {
        try {

            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_produtos SET imagem = ? WHERE id_produto = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, imagem);
            ps.setInt(2, idProduto);

            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
     
     public static boolean verificaTitulo(int id, String nome) {
         String resp = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_produtos WHERE nome=? and id_Fornecedor=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nome);
            ps.setInt(2, id);
           
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return true;
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
       return false;
    }
     
      
}
