/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Alimento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Luis Ragazzi
 */
public class AlimentoDAO {
    
    

    public static void addAlimento(Alimento alimento, int id) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO tb_produtos(id_fornecedor, imagem, nome, descricao, contra_indicacao, estoque,"
                    + " valor, categoria, ingredientes, validade) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
           PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);
            ps.setString(2, alimento.getImagem());
            ps.setString(3, alimento.getNome());
            ps.setString(4, alimento.getDescricao());
            ps.setString(5, alimento.getContraIndicacao());
            ps.setFloat(7, alimento.getPreco());
            ps.setInt(6, alimento.getEstoque());
            ps.setString(8, alimento.getCategoria() + "");
            ps.setString(9, alimento.getNomeIngrediente() + "");
            ps.setString(10, alimento.getDtVencimento() + "");
            ps.execute();
            ResultSet rs = ps.getGeneratedKeys();
            alimento.setId((rs.next())?rs.getInt(1):0);
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void getAlimentos(ArrayList lista, int id) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_produtos WHERE id_fornecedor=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id + "");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Alimento alimento = new Alimento();
                alimento.setImagem(rs.getString("imagem"));
                alimento.setNome(rs.getString("nome"));
                alimento.setDescricao(rs.getString("descricao"));
                alimento.setPreco(rs.getFloat("valor"));
                alimento.setContraIndicacao(rs.getString("contra_indicacao"));
                alimento.setCategoria(rs.getString("categoria"));
                alimento.setEstoque(rs.getInt("estoque"));
                alimento.setDtVencimento(rs.getString("validade"));
                alimento.setNomeIngrediente(rs.getString("ingrediente"));
                alimento.setId(rs.getInt("id_produto"));

                lista.add(alimento);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Alimento getAlimentosUnitario(int id) {
        Alimento alimento = new Alimento();
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_produtos WHERE id_produto=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            alimento.setImagem(rs.getString("imagem"));
            alimento.setNome(rs.getString("nome"));
            alimento.setDescricao(rs.getString("descricao"));
            alimento.setPreco(rs.getFloat("valor"));
            alimento.setContraIndicacao(rs.getString("contra_indicacao"));
            alimento.setCategoria(rs.getString("categoria"));
            alimento.setEstoque(rs.getInt("estoque"));
            alimento.setDtVencimento(rs.getString("validade"));
            alimento.setNomeIngrediente(rs.getString("ingredientes"));
            alimento.setId(rs.getInt("id_produto"));

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return alimento;
    }

    public static void alteraProduto(Alimento alimento) {
        try {

            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_produtos SET nome = ?, descricao = ?, contra_indicacao = ?, "
                    + "estoque = ?, valor = ?, categoria =?, ingredientes = ?,"
                    + "validade = ? WHERE id_produto = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, alimento.getNome());
            ps.setString(2, alimento.getDescricao());
            ps.setString(3, alimento.getContraIndicacao());
            ps.setInt(4, alimento.getEstoque());
            ps.setFloat(5, alimento.getPreco());
            ps.setString(6, alimento.getCategoria());
            ps.setString(7, alimento.getNomeIngrediente());
            ps.setString(8, alimento.getDtVencimento());
            ps.setInt(9, alimento.getId());

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
            String sql = "DELETE FROM tb_produtos WHERE = id_produto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
