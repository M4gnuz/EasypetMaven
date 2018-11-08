/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Pet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author glima
 */
public class PetDAO {

    public static void addPet(Pet pet, int id) {

        try {
            Connection con = Conecta.getConexao();
            String sql = "INSERT INTO tb_pet (id_cliente, nome, nascimento, tipo,"
                    + "porte, raca, obs) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);
            ps.setString(2, pet.getNome());
            ps.setString(3, pet.getDtNascimento());
            ps.setString(4, pet.getTipo());
            ps.setString(5, pet.getPorte());
            ps.setString(6, pet.getRaca());
            ps.setString(7, pet.getObs());

            ps.execute();

            ResultSet rs = ps.getGeneratedKeys();
            pet.setIdPet((rs.next()) ? rs.getInt(1) : 0);
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void addImagemPet(int idPet, String imagem) {
        try {

            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_pet SET imagem = ? WHERE id_pet = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, imagem);
            ps.setInt(2, idPet);

            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void alteraPet(Pet pet) {
        try {

            Connection con = Conecta.getConexao();
            String sql = "UPDATE tb_pet SET nome = ?, nascimento = ?, tipo = ?, "
                    + "porte = ?, raca = ?, obs =?"
                    + " WHERE id_pet = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pet.getNome());
            ps.setString(2, pet.getDtNascimento());
            ps.setString(3, pet.getTipo());
            ps.setString(4, pet.getPorte());
            ps.setString(5, pet.getRaca());
            ps.setString(6, pet.getObs());
            ps.setInt(7, pet.getIdPet());
            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void excluirPet(int id) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "DELETE FROM tb_pet WHERE id_pet = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ps.execute();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void getPets(List lista, int id) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_pet WHERE id_cliente=? ORDER BY id_pet DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id + "");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pet pet = new Pet();
                pet.setImagem(rs.getString("imagem"));
                pet.setNome(rs.getString("nome"));
                pet.setDtNascimento(rs.getString("nascimento"));
                pet.setPorte(rs.getString("porte"));
                pet.setRaca(rs.getString("raca"));
                pet.setTipo(rs.getString("tipo"));
                pet.setObs(rs.getString("obs"));
                pet.setIdPet(rs.getInt("id_pet"));

                lista.add(pet);

            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void getPet(Pet pet, int id) {
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_pet WHERE id_pet=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pet.setImagem(rs.getString("imagem"));
                pet.setNome(rs.getString("nome"));
                pet.setDtNascimento(rs.getString("nascimento"));
                pet.setPorte(rs.getString("porte"));
                pet.setRaca(rs.getString("raca"));
                pet.setTipo(rs.getString("tipo"));
                pet.setObs(rs.getString("obs"));
                pet.setIdPet(rs.getInt("id_pet"));
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Pet> getListaPetCliente(Integer idCliente) {
        List<Pet> lista = new ArrayList<>();
        try {
            Connection con = Conecta.getConexao();
            String sql = "SELECT * FROM  tb_pet WHERE id_cliente=? ORDER BY id_pet DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pet pet = new Pet();
                pet.setImagem(rs.getString("imagem"));
                pet.setNome(rs.getString("nome"));
                pet.setDtNascimento(rs.getString("nascimento"));
                pet.setPorte(rs.getString("porte"));
                pet.setRaca(rs.getString("raca"));
                pet.setTipo(rs.getString("tipo"));
                pet.setObs(rs.getString("obs"));
                pet.setIdPet(rs.getInt("id_pet"));

                lista.add(pet);

            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}
