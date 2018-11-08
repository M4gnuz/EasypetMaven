/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import classes.Cartao;
import classes.Cliente;

/**
 *
 * @author glima
 */
public class ClienteDAO {

    public static void addCliente(Cliente cliente) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO tb_cliente (nome, sobrenome, cpf, email,"
                    + "dt_nascimento, senha, sexo, telefone, endereco, numero_rua, "
                    + "cidade, bairro, complemento, cep, statusCadastro) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNome() + "");
            ps.setString(2, cliente.getSobreNome() + "");
            ps.setString(3, cliente.getCpf());
            ps.setString(4, cliente.getEmail() + "");
            ps.setString(5, cliente.getDtNascimento() + "");
            ps.setString(6, cliente.getSenha() + "");
            ps.setString(7, cliente.getSexo() + "");
            ps.setString(8, cliente.getTelefone() + "");
            ps.setString(9, cliente.getEndereco() + "");
            ps.setString(10, cliente.getNrRua() + "");
            ps.setString(11, cliente.getCidade() + "");
            ps.setString(12, cliente.getBairro() + "");
            ps.setString(13, cliente.getComplemento() + "");
            ps.setString(14, cliente.getCep());
            ps.setString(15, "ATIVADO");
            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String confirmaSenha(Cliente cliente) {
        String senha = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT senha FROM  tb_cliente WHERE id_cliente= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cliente.getId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                senha = rs.getString("senha");
            }
            rs.close();
            ps.close();
            con.close();
            return senha;
        } catch (Exception e) {
            e.printStackTrace();
            return senha;
        }
    }

    public static void alteraSenha(int id, String senha) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_cliente SET senha=? WHERE id_cliente=?";
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

    public static void alteraCliente(Cliente cliente) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_cliente SET nome=?, sobrenome=?,"
                    + "senha=?, sexo=?, telefone=?, endereco=?, numero_rua=?, "
                    + "cidade=?, bairro=?, complemento=?, cep=?, dt_nascimento=? WHERE id_cliente=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getNome() + "");
            ps.setString(2, cliente.getSobreNome() + "");
            ps.setString(3, cliente.getSenha() + "");
            ps.setString(4, cliente.getSexo() + "");
            ps.setString(5, cliente.getTelefone() + "");
            ps.setString(6, cliente.getEndereco() + "");
            ps.setString(7, cliente.getNrRua() + "");
            ps.setString(8, cliente.getCidade() + "");
            ps.setString(9, cliente.getBairro() + "");
            ps.setString(10, cliente.getComplemento() + "");
            ps.setString(11, cliente.getCep());
            ps.setString(12, cliente.getDtNascimento());
            ps.setInt(13, cliente.getId());
            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String recuperarSenha(String email) {
        String senha = "";
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT senha FROM  tb_cliente WHERE email= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                senha = rs.getString("senha");
            }
            rs.close();
            ps.close();
            con.close();
            return senha;
        } catch (Exception e) {
            e.printStackTrace();
            return senha;
        }
    }

    public static boolean confereEmail(Cliente cliente) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_cliente WHERE email= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getEmail() + "");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
            rs.close();
            ps.close();
            con.close();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean confereCPF(Cliente cliente) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_cliente WHERE cpf= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getCpf() + "");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
            rs.close();
            ps.close();
            con.close();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Cliente loginCliente(String email, String senha) {
        Cliente novo = new Cliente();
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_cliente WHERE email= ? AND senha=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email + "");
            ps.setString(2, senha + "");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                novo.setNome(rs.getString("nome"));
                novo.setSobreNome(rs.getString("sobrenome"));
                novo.setCpf(rs.getString("cpf"));
                novo.setEmail(rs.getString("email"));
                novo.setDtNascimento(rs.getString("dt_nascimento"));
                novo.setSenha(rs.getString("senha"));
                novo.setSexo(rs.getString("sexo").charAt(0));
                novo.setTelefone(rs.getString("telefone"));
                novo.setEndereco(rs.getString("endereco"));
                novo.setNrRua(rs.getString("numero_rua"));
                novo.setCidade(rs.getString("cidade"));
                novo.setBairro(rs.getString("bairro"));
                novo.setComplemento(rs.getString("complemento"));
                novo.setCep(rs.getString("cep"));
                novo.setId(rs.getInt("id_cliente"));
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

    public static Cliente getCliente(int id) {
        Cliente novo = new Cliente();
        Cartao cartao = new Cartao();
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM tb_cliente cliente INNER JOIN tb_cartao cartao ON "
                    + "cliente.id_cartao = cartao.id_cartao WHERE cliente.id_cliente = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	novo.setId(rs.getInt("id_cliente"));
                novo.setNome(rs.getString("nome"));
                novo.setSobreNome(rs.getString("sobrenome"));
                novo.setCpf(rs.getString("cpf"));
                novo.setEmail(rs.getString("email"));
                novo.setDtNascimento(rs.getString("dt_nascimento"));
                novo.setSenha(rs.getString("senha"));
                novo.setSexo(rs.getString("sexo").charAt(0));
                novo.setTelefone(rs.getString("telefone"));
                novo.setEndereco(rs.getString("endereco"));
                novo.setNrRua(rs.getString("numero_rua"));
                novo.setCidade(rs.getString("cidade"));
                novo.setBairro(rs.getString("bairro"));
                novo.setComplemento(rs.getString("complemento"));
                novo.setCep(rs.getString("cep"));
                novo.setStatus(rs.getString("statusCadastro"));
                cartao.setId_cartao(rs.getInt("id_cartao"));
                cartao.setCpfTitular(rs.getString("cpfTitular"));
                cartao.setCvv(rs.getString("cvv"));
                cartao.setNomeImpresso(rs.getString("nomeImpresso"));
                cartao.setSaldo(rs.getFloat("saldo"));
                cartao.setNrCartao(rs.getString("nr_cartao"));
                cartao.setValidade(rs.getString("validade"));
                novo.setCartao(cartao);
            }
            rs.close();
            ps.close();
            con.close();
            return novo;
        } catch (SQLException e) {
            e.printStackTrace();
            return novo;
        }

    }

    public static void alteraStatus(int id, String status) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_cliente set statusCadastro ='"+status+"'  where id_cliente ="+id+"";
            PreparedStatement ps = con.prepareStatement(sql);
            //ps.setString(1, status);
            //ps.setInt(2, id);

            ps.execute(sql);
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
