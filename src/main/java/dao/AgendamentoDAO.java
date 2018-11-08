/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Agendamento;
import classes.Cliente;
import classes.Fornecedor;
import classes.Pet;
import classes.Servico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author alanfelipe
 */
public class AgendamentoDAO {

    private static final String INSERT_AGENDAMENTO = "INSERT INTO tb_agendamento(id_fornecedor,id_cliente,id_pet,id_servico,data_agendamento,terminado) VALUES (?,?,?,?,?,?);";
    private static final String UPDATE_AGENDAMENTO = "UPDATE tb_agendamento SET id_fornecedor = ?, id_cliente = ?, id_pet = ?, id_servico = ?, data_agendamento = ?, terminado = ? WHERE id_agendamento = ?;";
    private static final String DELETE_AGENTAMENTO = "DELETE FROM tb_agendamento WHERE id_agendamento = ?;";
    private static final String SELECT_AGENDAMENTO = "SELECT * FROM tb_agendamento WHERE id_agendamento = ?;";

    private static final String LIST_AGENDAMENTO_CLIENTE = "SELECT * FROM tb_agendamento WHERE id_cliente = ?;";
    private static final String LIST_AGENDAMENTO_FORNECEDOR = "SELECT * FROM tb_agendamento WHERE id_fornecedor = ?";

    public void insetAgendamento(Fornecedor fornecedor, Cliente cliente, Pet pet, Servico servico, String data) throws SQLException {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
            LocalDateTime dataFmt = LocalDateTime.parse(data, formatter);
            
            Connection conn = Conecta.getConexao();
            
            PreparedStatement ps = conn.prepareStatement(INSERT_AGENDAMENTO);
            ps.setInt(1, fornecedor.getId());
            ps.setInt(2, cliente.getId());
            ps.setInt(3, pet.getIdPet());
            ps.setInt(4, servico.getId());
            ps.setString(5, formatter.format(dataFmt));
            ps.setBoolean(6, false);
            ps.execute();

            ps.close();
            conn.close();
        } catch (SQLException e) {
            throw new SQLException(e);
        }
    }

    public void updateAgendamento(Agendamento agendamento) throws SQLException {
        try {
            Connection conn = Conecta.getConexao();
            PreparedStatement ps = conn.prepareStatement(UPDATE_AGENDAMENTO);
            ps.setInt(1, agendamento.getFornecedor().getId());
            ps.setInt(2, agendamento.getCliente().getId());
            ps.setInt(3, agendamento.getPet().getIdPet());
            ps.setInt(4, agendamento.getServico().getId());
            ps.setString(5, agendamento.getDataAgendamento());
            ps.setBoolean(6, agendamento.getIsConcluido());
            ps.setInt(7, agendamento.getIdAgendamento());
            ps.execute();

            ps.close();
            conn.close();

        } catch (SQLException e) {
            throw new SQLException(e);
        }
    }

    public void deleteAgendamento(Agendamento agendamento) throws SQLException {
        try {
            Connection conn = Conecta.getConexao();
            PreparedStatement ps = conn.prepareStatement(DELETE_AGENTAMENTO);
            ps.setInt(1, agendamento.getIdAgendamento());
            ps.execute();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            throw new SQLException(e);
        }
    }

    public Agendamento getAgendamento(int idAgendamento) throws SQLException {
        Agendamento agendamento = new Agendamento();
        Pet pet = new Pet();

        try {
            Connection conn = Conecta.getConexao();
            PreparedStatement ps = conn.prepareStatement(SELECT_AGENDAMENTO);
            ps.setInt(1, idAgendamento);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                agendamento.setIdAgendamento(rs.getInt("id_agendamento"));
                agendamento.setDataAgendamento(rs.getString("data_agendamento"));
                agendamento.setIsConcluido(rs.getBoolean("terminado"));

                Fornecedor fornecedor = FornecedorDAO.getFornecedor(rs.getInt("id_fornecedor"));
                Cliente cliente = ClienteDAO.getCliente(rs.getInt("id_cliente"));
                PetDAO.getPet(pet, rs.getInt("id_pet"));
                Servico servico = ServicoDAO.getServico(rs.getInt("id_servico"));

                agendamento.setFornecedor(fornecedor);
                agendamento.setCliente(cliente);
                agendamento.setPet(pet);
                agendamento.setServico(servico);
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            throw new SQLException(e);
        }

        return agendamento;
    }

    public List<Agendamento> getListaAgendamentoCliente(int idCliente) throws SQLException {
        List<Agendamento> lista = new ArrayList<>();
        Pet pet = new Pet();

        try {
            Connection conn = Conecta.getConexao();
            PreparedStatement ps = conn.prepareStatement(LIST_AGENDAMENTO_CLIENTE);
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Agendamento agendamento = new Agendamento();

                agendamento.setIdAgendamento(rs.getInt("id_agendamento"));
                agendamento.setDataAgendamento(rs.getString("data_agendamento"));
                agendamento.setIsConcluido(rs.getBoolean("terminado"));

                Fornecedor fornecedor = FornecedorDAO.getFornecedor(rs.getInt("id_fornecedor"));
                Cliente cliente = ClienteDAO.getCliente(rs.getInt("id_cliente"));
                PetDAO.getPet(pet, rs.getInt("id_pet"));
                Servico servico = ServicoDAO.getServico(rs.getInt("id_servico"));

                agendamento.setFornecedor(fornecedor);
                agendamento.setCliente(cliente);
                agendamento.setPet(pet);
                agendamento.setServico(servico);

                lista.add(agendamento);
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return lista;
    }

    public List<Agendamento> getListaAgendamentoFornecedor(int idFornecedor) throws SQLException {
        List<Agendamento> lista = new ArrayList<>();
        Pet pet = new Pet();

        try {
            Connection conn = Conecta.getConexao();
            PreparedStatement ps = conn.prepareStatement(LIST_AGENDAMENTO_FORNECEDOR);
            ps.setInt(1, idFornecedor);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Agendamento agendamento = new Agendamento();

                agendamento.setIdAgendamento(rs.getInt("id_agendamento"));
                agendamento.setDataAgendamento(rs.getString("data_agendamento"));
                agendamento.setIsConcluido(rs.getBoolean("terminado"));

                Fornecedor fornecedor = FornecedorDAO.getFornecedor(rs.getInt("id_fornecedor"));
                Cliente cliente = ClienteDAO.getCliente(rs.getInt("id_cliente"));
                PetDAO.getPet(pet, rs.getInt("id_pet"));
                Servico servico = ServicoDAO.getServico(rs.getInt("id_servico"));

                agendamento.setFornecedor(fornecedor);
                agendamento.setCliente(cliente);
                agendamento.setPet(pet);
                agendamento.setServico(servico);

                lista.add(agendamento);
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return lista;
    }
}
