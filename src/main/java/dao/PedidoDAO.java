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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import classes.Cliente;
import classes.Fornecedor;
import classes.ItemCarrinho;
import classes.ItemPedido;
import classes.Pedido;
import classes.Produto;

/**
 *
 * @author alanfelipe
 */
public class PedidoDAO {

	private static final String INSERT_PEDIDO = "INSERT INTO tb_pedido (id_cliente, id_fornecedor, dataPedido) VALUES(?,?,CURDATE());";
	private static final String UPDATE_PEDIDO = "UPDATE tb_pedido SET id_cliente= ? WHERE id_pedido = ?;";
	private static final String DELETE_PEDIDO = "DELETE FROM tb_pedido WHERE id_pedido = ?;";

	private static final String INSERT_ITEM_PEDIDO = "INSERT INTO tb_pedido_produto (id_pedido, id_produto, quantidade) VALUES (?,?,?);";
	private static final String UPDATE_ITEM_PEDIDO = "UPDATE tb_pedido_produto SET quantidade = ? WHERE id_pedido = ? and id_produto = ?;";
	private static final String DELETE_ITEM_PEDIDO = "DELETE FROM tb_pedido_produto WHERE id_pedido = ?";

	private static final String GET_LIST_PEDIDO_FORNECEDOR = "SELECT * FROM tb_pedido , tb_pedido_produto, tb_produtos WHERE tb_pedido_produto.id_pedido = tb_pedido.id_pedido AND tb_produtos.id_fornecedor = ? AND tb_pedido_produto.ID_PRODUTO = tb_produtos.id_produto;";
	private static final String GET_LIST_PEDIDO_CLIENTE = "SELECT * FROM tb_pedido, tb_pedido_produto, tb_produtos WHERE tb_pedido.id_cliente = ? AND tb_pedido_produto.id_pedido = tb_pedido.id_pedido and tb_produtos.id_produto = tb_pedido_produto.id_produto;";

	private static final String GET_PEDIDO = "SELECT * FROM tb_pedido, tb_pedido_produto, tb_produtos WHERE tb_pedido.id_pedido = ? AND tb_pedido_produto.id_pedido = tb_pedido.id_pedido and tb_produtos.id_produto = tb_pedido_produto.id_produto;";

	private static final String GET_PEDIDOS_CLIENTE = "SELECT * FROM tb_pedido p INNER JOIN tb_fornecedor f ON p.id_fornecedor = f.id_fornecedor WHERE p.id_cliente = ?;";

	private static final String GET_PEDIDOS_FORNECEDOR = "SELECT * FROM tb_pedido p INNER JOIN tb_cliente c ON p.id_cliente = c.id_cliente WHERE p.id_fornecedor = ?;";

	private static final String GET_DETALHES_PEDIDO = "SELECT * FROM tb_pedido p INNER JOIN tb_cliente c ON p.id_cliente = c.id_cliente inner join tb_pedido_produto pp on pp.id_pedido = p.id_pedido WHERE p.id_pedido = ?;";

        private static final String GET_AVALIACAO = "SELECT COUNT(p.id_pedido),SUM(avaliacao) AS avaliacao FROM tb_pedido p INNER JOIN tb_pedido_produto pp ON p.id_pedido = pp.id_pedido WHERE pp.id_produto = ? AND avaliacao!=0;";
        
	public void getDetalhes(List<Pedido> lista, Integer idPedido, Cliente cliente) throws SQLException {
		try {
			Connection conn = Conecta.getConexao();
			PreparedStatement ps = conn.prepareStatement(GET_DETALHES_PEDIDO);
			ps.setInt(1, idPedido);
			ResultSet rs = ps.executeQuery();
			List<ItemPedido> itens = new ArrayList<>();
			while (rs.next()) {
				Pedido pedido = new Pedido();
				ItemPedido item = new ItemPedido();
				item.setIdPedido(rs.getInt("id_pedido"));
				item.setQuantidade(rs.getInt("quantidade"));

				Produto produto = new Produto();
				ProdutoDAO.getAcessorio(produto, rs.getInt("id_produto"));

				item.setProduto(produto);
				itens.add(item);
				pedido.setItensPedido(itens);
				pedido.setIdPedido(rs.getInt("id_pedido"));
				pedido.setIdCliente(rs.getInt("id_cliente"));
				pedido.setIdFornecedor(rs.getInt("id_fornecedor"));
				pedido.setStatus(rs.getString("status"));
                                pedido.setAvaliacao(rs.getInt("avaliacao"));
				cliente.setNome(rs.getString("nome"));
				cliente.setSobreNome(rs.getString("sobrenome"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setEmail(rs.getString("email"));
				cliente.setDtNascimento(rs.getString("dt_nascimento"));
				cliente.setSenha(rs.getString("senha"));
				cliente.setSexo(rs.getString("sexo").charAt(0));
				cliente.setTelefone(rs.getString("telefone"));
				cliente.setEndereco(rs.getString("endereco"));
				cliente.setNrRua(rs.getString("numero_rua"));
				cliente.setCidade(rs.getString("cidade"));
				cliente.setBairro(rs.getString("bairro"));
				cliente.setComplemento(rs.getString("complemento"));
				cliente.setCep(rs.getString("cep"));
				cliente.setId(rs.getInt("id_cliente"));
				lista.add(pedido);
			}

			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			throw new SQLException(e);
		}
	}

	public static void getAllPedidosFornecedor(List<Pedido> lista, Integer idFornecedor, Cliente cliente) throws SQLException {

		try {
			Connection conn = Conecta.getConexao();
			PreparedStatement ps = conn.prepareStatement(GET_PEDIDOS_FORNECEDOR);
			ps.setInt(1, idFornecedor);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Pedido pedido = new Pedido();
				pedido.setIdPedido(rs.getInt("id_pedido"));
				pedido.setIdCliente(rs.getInt("id_cliente"));
				pedido.setIdFornecedor(rs.getInt("id_fornecedor"));
				pedido.setStatus(rs.getString("status"));
                                pedido.setAvaliacao(rs.getInt("avaliacao"));
				cliente.setNome(rs.getString("nome"));
				lista.add(pedido);
			}

			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			throw new SQLException(e);
		}
	}
        
        public static void setAvaliacao(int avaliacao, int id_Pedido){
            try {
			Connection conn = Conecta.getConexao();
			String sql = "UPDATE tb_pedido SET avaliacao = ? WHERE id_pedido = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, avaliacao);
			ps.setInt(2, id_Pedido);

			ps.execute();
			ps.close();
			conn.close();

		} catch (Exception e) {
                 e.printStackTrace();
        }

        }

	public static int getAvaliacao(int id){
            int avaliacao = 0;
            int cont = 0;
            try {
			Connection conn = Conecta.getConexao();
			PreparedStatement ps = conn.prepareStatement(GET_AVALIACAO);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
                                avaliacao = rs.getInt("avaliacao");
                                cont = rs.getInt(1);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
            
            return (avaliacao/cont);
        }
        
        public static void getAllPedidosCliente(List<Pedido> lista, Integer idCliente, Fornecedor forn) throws SQLException {

		try {
			Connection conn = Conecta.getConexao();
			PreparedStatement ps = conn.prepareStatement(GET_PEDIDOS_CLIENTE);
			ps.setInt(1, idCliente);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Pedido pedido = new Pedido();
				pedido.setIdPedido(rs.getInt("id_pedido"));
				pedido.setIdCliente(rs.getInt("id_cliente"));
				pedido.setIdFornecedor(rs.getInt("id_fornecedor"));
				pedido.setStatus(rs.getString("status"));
                                pedido.setAvaliacao(rs.getInt("avaliacao"));
				forn.setNome(rs.getString("nome"));
				lista.add(pedido);
			}

			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			throw new SQLException(e);
		}
	}

	public static Pedido getPedido(Integer idPedido) throws SQLException {
		Pedido pedido = null;
		List<ItemPedido> itens = new ArrayList<>();

		try {
			Connection conn = Conecta.getConexao();
			PreparedStatement ps = conn.prepareStatement(GET_PEDIDO);
			ps.setInt(1, idPedido);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				if (pedido == null) {
					pedido = new Pedido();
					pedido.setIdPedido(rs.getInt("id_pedido"));
					pedido.setIdCliente(rs.getInt("id_cliente"));
					pedido.setIdFornecedor(rs.getInt("id_fornecedor"));
				}

				ItemPedido item = new ItemPedido();
				item.setIdPedido(rs.getInt("id_pedido"));
				item.setQuantidade(rs.getInt("quantidade"));

				Produto produto = new Produto();
				ProdutoDAO.getAcessorio(produto, rs.getInt("id_produto"));

				item.setProduto(produto);
				itens.add(item);
			}

			rs.close();
			ps.close();
			conn.close();

			pedido.setItensPedido(itens);
		} catch (SQLException e) {
			throw new SQLException(e);
		}

		return pedido;
	}

	public Pedido insertPedido(List<ItemCarrinho> carrinho, int idCliente) throws SQLException {
		Pedido pedido = new Pedido();
		List<ItemPedido> itemsPedido = new ArrayList<>();
		PreparedStatement ps;
		
		try {
			Connection conn = Conecta.getConexao();

			for (ItemCarrinho item : carrinho) {
				if(pedido.getIdPedido() == null) {
					ps = conn.prepareStatement(INSERT_PEDIDO, Statement.RETURN_GENERATED_KEYS);
					ps.setInt(1, idCliente);
					ps.setInt(2, item.getProduto().getIdFornecedor());
					ps.execute();

					ResultSet rs = ps.getGeneratedKeys();
					pedido.setIdPedido((rs.next()) ? rs.getInt(1) : 0);
					pedido.setIdCliente(idCliente);

					rs.close();
				}

				ItemPedido itemPedido = new ItemPedido();

				ps = conn.prepareStatement(INSERT_ITEM_PEDIDO);
				ps.setInt(1, pedido.getIdPedido());
				ps.setInt(2, item.getProduto().getId());
				ps.setInt(3, item.getQuantidade());
				ps.execute();
				ps.close();

				itemPedido.setIdPedido(pedido.getIdPedido());
				itemPedido.setProduto(item.getProduto());
				itemPedido.setQuantidade(item.getQuantidade());
				itemsPedido.add(itemPedido);
			}

			conn.close();
			pedido.setItensPedido(itemsPedido);

		} catch (SQLException e) {
			throw new SQLException(e);
		}

		return pedido;
	}

	public void deletePedido(int idPedido) throws SQLException {
		try {
			Connection conn = Conecta.getConexao();
			PreparedStatement ps = conn.prepareStatement(DELETE_ITEM_PEDIDO);
			ps.setInt(1, idPedido);
			ps.executeQuery();

			ps = conn.prepareStatement(DELETE_PEDIDO);
			ps.setInt(1, idPedido);
			ps.executeQuery();

			ps.close();
			conn.close();
		} catch (SQLException e) {
			throw new SQLException(e);
		}
	}

	public static void getPedidosFornecedor(List<Pedido> lista, List<Cliente> listaCliente, Integer idFornecedor) throws SQLException {

		try {
			Connection conn = Conecta.getConexao();
			PreparedStatement ps = conn.prepareStatement(GET_PEDIDOS_FORNECEDOR);
			ps.setInt(1, idFornecedor);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Pedido pedido = new Pedido();
				Cliente cliente = new Cliente();
				pedido.setIdPedido(rs.getInt("id_pedido"));
				pedido.setIdCliente(rs.getInt("id_cliente"));
				pedido.setIdFornecedor(rs.getInt("id_fornecedor"));
				pedido.setStatus(rs.getString("status"));
				pedido.setDataPedido(rs.getString("dataPedido"));
                                pedido.setValorPedido(rs.getDouble("valorPedido"));
				cliente.setNome(rs.getString("nome"));
				lista.add(pedido);
				listaCliente.add(cliente);
			}

			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			throw new SQLException(e);
		}
	}

	public static void baixaEstoque(Produto produto, int id_produto, int baixa) throws SQLException {
		ProdutoDAO.getAcessorio(produto, id_produto);
		int estoque = produto.getEstoque() - baixa;
		System.out.print(estoque);
		try {
			Connection conn = Conecta.getConexao();
			String sql = "UPDATE tb_produtos SET estoque = ? WHERE id_produto = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, estoque);
			ps.setInt(2, id_produto);

			ps.execute();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			throw new SQLException(e);
		}
	}

	public static void addCartao(int id_cartao, int id_Pedido) throws SQLException {
		try {
			Connection conn = Conecta.getConexao();
			String sql = "UPDATE tb_pedido SET id_cartao = ? WHERE id_pedido = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id_cartao);
			ps.setInt(2, id_Pedido);

			ps.execute();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			throw new SQLException(e);
		}

	}

	public static void baixaSaldoCartao(double baixa, int id_cartao) throws SQLException {
		try {
			Connection conn = Conecta.getConexao();
			String sql = "UPDATE tb_cartao SET saldo = ? WHERE id_cartao = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, baixa);
			ps.setInt(2, id_cartao);

			ps.execute();
			ps.close();
			conn.close();

		} catch (SQLException e) {
			throw new SQLException(e);
		}
	}
}