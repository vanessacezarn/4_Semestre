
package DAO;

import Conexao.conexao;
import beans.Categorias;
import beans.Produtos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 * CLASSE RESPONSÁVEL PELO ACESSO E MANIPULAÇÃO DE DADOS DA TABELA PRODUTOS
 * POSSUI MÉTODOS PARA CADASTRO, EDIÇÃO, EXCLUSÃO E CONSULTAS DE PRODUTOS
 * É QUEM EXECUTARÁ OS COMANDOS/CÓDIGOS SQL NO BANCO DE DADOS
 */

public class ProdutosDAO {
    private conexao conexao;
    private Connection conn;
    
    /**
     * Construtor da classe utilizado para realizar a conexão com banco 
     * utiliza a classe conexao do pacote conexao
    */
    public ProdutosDAO(){
        this.conexao = new conexao();
        this.conn = this.conexao.getConexao();
    }
   
    /**
     * método responsável pela inserção de novos produtos no banco de dados
     * @param p objeto da classe Produtos que contem os dados do produtos que será adicionado
     */
    public void inserir (Produtos p){
        try {
            String sql = "INSERT INTO produtos (nome, preco, quantidade, categoria_id) VALUES (?,?,?,?);";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, p.getNome());
            stmt.setFloat(2, p.getPreco());
            stmt.setInt(3, p.getQuantidade());
            stmt.setInt(4, p.getCategoria_id().getId());
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir PRODUTO: "+ex.getMessage());
        }
    }
    
    /**
     * método responsável pela edição de dados de um produto já existente
     * @param p objeto da classe Produtos que contem os novos dados do produto que será alterado
     */
    public void editar(Produtos p){
        try {
            String sql = "UPDATE produtos set nome=?, preco=?, quantidade=?, categoria_id=? WHERE id=?;";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, p.getNome());
            stmt.setFloat(2, p.getPreco());
            stmt.setInt(3, p.getQuantidade());
            stmt.setInt(4, p.getCategoria_id().getId());
            stmt.setInt(5, p.getId());
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("Erro ao editar PRODUTO:"+ex.getMessage());
        }
        
    }
    
    /**
     * métodos responsável pela exclusão de produtos 
     * @param id identificador único de cada produto
     */
    public void excluir(int id){
        try {
            String sql = "DELETE FROM produtos WHERE id=?";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir o PRODUTO:"+ex.getMessage());
        }
    }
    
    /**
     * método responsável pela pesquisa de todos os produtos cadastrados no banco de dados
     * @return lista com todos os produtos ou null, caso não consiga consultar
     */ 
    public List<Produtos> getProdutos(){
        try {
            String sql = "SELECT * FROM produtos";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery();
            List<Produtos> listaProdutos = new ArrayList();
            while(rs.next()){
                Produtos p = new Produtos();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setPreco(rs.getFloat("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                int categoria_id = rs.getInt("categoria_id");
                CategoriasDAO cDAO = new CategoriasDAO();
                Categorias c = cDAO.getCategorias(categoria_id);
                p.setCategoria_id(c);
                listaProdutos.add(p);
                
            }
            return listaProdutos;
        } catch (SQLException ex) {
            System.out.println("Erro ao consutar todos os PRODUTOS"+ex.getMessage());
            return null;
        }
    }
    
    /**
     * método responsável por pesquisar um determinado produto através de seu id
     * @param id identificador único de cada produto
     * @return objeto, se realizar a consulta, ou null, se não realizar a consulta
     */
    public Produtos getProdutos(int id){
        try {
            String sql = "SELECT * FROM produtos WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Produtos p = new Produtos();
            rs.first();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setPreco(rs.getFloat("preco"));
            p.setQuantidade(rs.getInt("quantidade"));
            
            int categoria_id = rs.getInt("categoria_id");
            CategoriasDAO cDAO = new CategoriasDAO();
            Categorias c = cDAO.getCategorias(rs.getInt("categoria_id"));
            p.setCategoria_id(c);
                   
            return p;
        } catch (SQLException ex) {
            System.out.println("Erro ao consultar PRODUTO");
            return null;
        }
    }
    public List<Produtos> getProdutos(String nome, Categorias categoria_id){
        try {
            String sql = "SELECT * FROM produtos WHERE nome LIKE ? and categoria_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.setString(1, "%"+nome+"%");
            stmt.setInt(2, categoria_id.getId());
            ResultSet rs = stmt.executeQuery();
            List<Produtos>listaProd = new ArrayList();
            CategoriasDAO cDAO = new CategoriasDAO();

            while(rs.next()){
                Produtos p = new Produtos();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setPreco(rs.getFloat("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                int idCategoria = rs.getInt("categoria_id");
                Categorias c = cDAO.getCategorias(idCategoria);
                p.setCategoria_id(c);
                listaProd.add(p);
            }
            return listaProd;
        } catch (SQLException ex) {
            System.out.println("Erro ao consultar PRODUTO"+ex.getMessage());
            return null;
        }
    }
}
