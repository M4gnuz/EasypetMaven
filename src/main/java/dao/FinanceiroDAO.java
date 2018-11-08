/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Financeiro;
import classes.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author glima
 */
public class FinanceiroDAO {

    public static void getSaldo(Financeiro financeiro) throws SQLException {
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT saldo FROM tb_financeiro WHERE id_transacao = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, financeiro.getId_transacao());
            ResultSet rs = ps.executeQuery();
            rs.next();
            financeiro.setSaldo(rs.getDouble("saldo"));
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void getMaxID(Financeiro financeiro) throws SQLException {
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT MAX(id_transacao) as id_transacao FROM tb_financeiro";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            financeiro.setId_transacao(rs.getInt("id_transacao"));
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void Entrada(Financeiro financeiro) throws SQLException {
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO tb_financeiro (id_pedido, tipo, data, valor_operacao, saldo)"
                    + " VALUES(?,'ENTRADA', ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, financeiro.getId_pedido());
            ps.setString(2, financeiro.getData());
            ps.setDouble(3, financeiro.getValorOperacao());
            ps.setDouble(4, financeiro.getSaldo());

            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void Saida(Financeiro financeiro) throws SQLException {
        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO tb_financeiro (id_fornecedor, tipo, data, valor_operacao, saldo)"
                    + " VALUES(?,'SAIDA', ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, financeiro.getId_fornecedor());
            ps.setString(2, financeiro.getData());
            ps.setDouble(3, financeiro.getValorOperacao());
            ps.setDouble(4, financeiro.getSaldo());

            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
