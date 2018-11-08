/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Servico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author glima
 */
public class ServicoDAO {
    public static void addServico(Servico servico, int id){
         try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO tb_servico (id_fornecedor, porte, descricao, animal, preco,"
                    + " frete, categoria, tempo) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);            
            ps.setString(2, servico.getPorte());
            ps.setString(3, servico.getDescricao());
            ps.setString(4, servico.getAnimal());
            ps.setFloat(5, servico.getPreco());
            ps.setFloat(6, servico.getFrete());
            ps.setString(7, servico.getCategoria() + "");
            ps.setString(8, servico.getTempo()+ "");
            ps.execute();
            
            ResultSet rs = ps.getGeneratedKeys();
            servico.setId((rs.next())?rs.getInt(1):0);
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void alterarServico(Servico serv){
        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_servico SET porte=?, descricao=?, animal=?, preco=?,"
                    + " frete=?, categoria=?, tempo=? WHERE id_servico=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, serv.getPorte()+ "");
            ps.setString(2, serv.getDescricao()+ "");
            ps.setString(3, serv.getAnimal()+"");
            ps.setString(4, serv.getPreco()+"");
            ps.setString(5, serv.getFrete()+"");
            ps.setString(6, serv.getCategoria()+"");
            ps.setString(7, serv.getTempo()+"");
            ps.setString(8, serv.getId()+"");
            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static Servico getServico(int id){
        Servico novo = new Servico();
        try{
            Connection con = Conecta.getConexao();
            String sql;
            sql = "SELECT * FROM tb_servico WHERE id_servico = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                novo.setAnimal(rs.getString("animal"));
                novo.setCategoria(rs.getString("categoria"));
                novo.setDescricao(rs.getString("descricao"));
                novo.setFrete(rs.getFloat("frete"));
                novo.setPreco(rs.getFloat("preco"));
                novo.setId(id);
                novo.setIdFornecedor(rs.getInt("id_Fornecedor"));
                novo.setPorte(rs.getString("porte"));
                novo.setTempo(rs.getString("tempo"));
            }
            rs.close();
            ps.close();
            con.close();
            
        }
        catch(SQLException e){
            e.printStackTrace();            
            return novo;
        }
      return novo;
    }
    
    public static void getAllServicos(List lista) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_servico ORDER BY id_servico DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Servico serv = new Servico();
                serv.setId(rs.getInt("id_servico"));
                serv.setIdFornecedor(rs.getInt("id_fornecedor"));
                serv.setAnimal(rs.getString("animal"));
                serv.setCategoria(rs.getString("categoria"));
                serv.setDescricao(rs.getString("descricao"));
                serv.setFrete(rs.getFloat("frete"));
                serv.setPorte(rs.getString("porte"));
                serv.setPreco(rs.getFloat("preco"));
                serv.setTempo(rs.getString("tempo"));

                lista.add(serv);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public static void excluirServico(int id) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM tb_servico WHERE id_servico = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ps.execute();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public static void getProdutos(List lista, int id) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_servico WHERE id_fornecedor=? ORDER BY id_servico DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id + "");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Servico servico = new Servico();
                servico.setPorte(rs.getString("porte"));
                servico.setDescricao(rs.getString("descricao"));
                servico.setAnimal(rs.getString("animal"));
                servico.setPreco(rs.getFloat("preco"));
                servico.setFrete(rs.getFloat("frete"));
                servico.setCategoria(rs.getString("categoria"));
                servico.setTempo(rs.getString("tempo"));
                servico.setIdFornecedor(rs.getInt("id_fornecedor"));
                servico.setId(rs.getInt("id_servico"));

                lista.add(servico);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
