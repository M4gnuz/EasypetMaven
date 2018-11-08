/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Admin;
import classes.Fornecedor;
import classes.Cliente;
import classes.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import sun.rmi.transport.TransportConstants;

/**
 *
 * @author glima
 */
public class AdminDAO {

    public static Admin loginAdmin(String email, String senha) {
        Admin novo = new Admin();
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_admin WHERE email= ? AND senha=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email + "");
            ps.setString(2, senha + "");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                novo.setNome(rs.getString("nome"));
                novo.setSobreNome(rs.getString("sobrenome"));
                novo.setCpf(rs.getString("cpf"));
                novo.setEmail(rs.getString("email"));
                novo.setNascimento(rs.getString("nascimento"));
                novo.setSenha(rs.getString("senha"));
                novo.setSexo(rs.getString("sexo").charAt(0));
                novo.setTelefone(rs.getString("telefone"));
                novo.setIdAdmin(rs.getInt("id_admin"));
            }
            rs.close();
            ps.close();
            con.close();
            return novo;
        } catch (Exception e) {
            e.printStackTrace();
            return novo;
        }
    }

    public static String getSenha(int id){
        String senha="";
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_admin WHERE id_admin= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id + "");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                senha = rs.getString("senha");
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return senha;
    }
    
    public static void alteraSenha(int id, String senha){
        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_admin SET senha=? WHERE id_admin=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, senha + "");
            ps.setInt(2, id);
            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void getFornecedores(List lista) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM tb_fornecedor ORDER BY id_fornecedor DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setNome(rs.getString("nome"));
                fornecedor.setCnpj(rs.getString("cnpj"));
                fornecedor.setId(rs.getInt("id_fornecedor"));
                fornecedor.setImagem(rs.getString("imagem"));
                fornecedor.setStatus(rs.getString("statusCadastro"));

                lista.add(fornecedor);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void getClientes(List lista) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_cliente ORDER BY id_cliente DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setNome(rs.getString("nome"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setStatus(rs.getString("statusCadastro"));

                lista.add(cliente);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void addAdmin(Admin admin) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO tb_admin (nome, sobrenome, cpf, email,"
                    + "nascimento, senha, sexo, telefone"
                    + ") VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, admin.getNome() + "");
            ps.setString(2, admin.getSobreNome() + "");
            ps.setString(3, admin.getCpf());
            ps.setString(4, admin.getEmail() + "");
            ps.setString(5, admin.getNascimento()+ "");
            ps.setString(6, admin.getSenha() + "");
            ps.setString(7, admin.getSexo() + "");
            ps.setString(8, admin.getTelefone() + "");            
            ps.execute();           
            ResultSet rs = ps.getGeneratedKeys();
            admin.setIdAdmin((rs.next())?rs.getInt(1):0);            
            ps.close();
            //rs.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
     public static void getFaturamentoTotal(Fornecedor forn, double media){       
        try{
            Connection con = Conecta.getConexao();
            String sql = "SELECT SUM(valorPedido) as valorPedido FROM tb_pedido";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, forn.getId());      
            ResultSet rs = ps.executeQuery();
            media = rs.getDouble("valorPedido");
            if(rs.next()){
                
            }
            
            ps.execute(sql);
            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static void getPeriodoFaturamento(Fornecedor forn, List lista, String data1, String data2){
       
        try{
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM tb_pedidos WHERE AND dataPedido BETWEEN ? and ?";
            PreparedStatement ps = con.prepareStatement(sql);            
            ps.setInt(1, forn.getId());      
            ps.setString(2, data1);
            ps.setString(3, data2);
            ResultSet rs = ps.executeQuery();            
            while(rs.next()){
                 Pedido pedido = new Pedido();
                 pedido.setIdPedido(rs.getInt("id_pedido"));
                 pedido.setIdCliente(rs.getInt("id_cliente"));
                 pedido.setIdFornecedor(rs.getInt("id_fornecedor"));
                 pedido.setDataPedido(rs.getString("dataPedido"));
                 pedido.setValorPedido(rs.getDouble("valorPedido"));
                 lista.add(pedido);
            }
            
            rs.close();
            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static void getAllPedidos(Fornecedor forn, List lista, String data1, String data2){
       
        try{
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM tb_pedidos WHERE AND dataPedido BETWEEN ? and ?";
            PreparedStatement ps = con.prepareStatement(sql);            
            ps.setInt(1, forn.getId());      
            ps.setString(2, data1);
            ps.setString(3, data2);
            ResultSet rs = ps.executeQuery();            
            while(rs.next()){
                 Pedido pedido = new Pedido();
                 pedido.setIdPedido(rs.getInt("id_pedido"));
                 pedido.setIdCliente(rs.getInt("id_cliente"));
                 pedido.setIdFornecedor(rs.getInt("id_fornecedor"));
                 pedido.setDataPedido(rs.getString("dataPedido"));
                 pedido.setValorPedido(rs.getDouble("valorPedido"));
                 lista.add(pedido);
            }
            
            rs.close();
            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
