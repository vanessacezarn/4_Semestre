package DAO;
import Conexao.conexao;
import beans.Categorias;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
        
/**
 * CLASSE RESPONSÁVEL PELO ACESSO E MANIPULAÇÃO DE DADOS DA TABELA CATEGORIAS
 * POSSUI MÉTODOS PARA CADASTRO, EDIÇÃO E CONSULTAS 
 * É ELA QUEM EXECUTARÁ OS CÓDIGOS/COMANDOS SQL NO BANCO DE DADOS
 */
public class CategoriasDAO {
    private conexao conexao;
    private Connection conn;

    /**
     * Construtor da classe utilizado para realizar a conexão com banco 
     * utiliza a classe conexao do pacote conexao
     */
    public CategoriasDAO(){
        this.conexao =  new conexao();
        this.conn = this.conexao.getConexao();
    }
    /**
     * método responsável por inserir novas categorias no banco de dados
     * @param c é o objeto da classe Categorias que contem os dados da categoria que será adicionada
     */
    public void inserir(Categorias c){
        try {
            String sql = "INSERT INTO categorias(nome) VALUES (?);";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, c.getNome());
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("ERRO AO INSERIR CATEGORIA : "+ex.getMessage());
        }
    }
    /**
     * método responsável por editar dados de uma categoria já existente
     * @param c objeto da classe Categoria que contem os novos dados da categoria que será alterada
     */
    public void editar(Categorias c){
        try {
            String sql = "UPDATE categorias SET nome=? WHERE id=?";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, c.getNome());
            stmt.setInt(2, c.getId());
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("ERRO AO EDITAR CATEGORIA : "+ex.getMessage());
        }
    }
    /**
     * método responsavel pela pesquisa de todas as categorias cadastradas
     * @return uma lista com todas as categorias (id e nome) cadastrados no banco
     *         ou null se não conseguir realizar a consulta
     */
   public List<Categorias> getCategorias(){
        try {
            String sql = "SELECT * FROM categorias";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery();
            List<Categorias>listaCategorias = new ArrayList();
            while (rs.next()){
                Categorias c = new Categorias();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                listaCategorias.add(c);
            }
            return listaCategorias;
            
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAS TODAS AS CATEGORIA : "+ex.getMessage());
            return null;
        }
   }
   /**
    * método responsavel por pesquisar uma determinada categoria de acordo com id
    * @param id é o identificado único de cada categoria
    * @return se conseguir consultar retorna o objeto 
    *         ou se não conseguir consultar retorna null
    */
    public Categorias getCategorias(int id){
        try {
            String sql = "SELECT * FROM categorias WHERE id =?";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Categorias c = new Categorias();
            rs.first();
            
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            
            return c;            
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAS CATEGORIA : "+ex.getMessage());
            return null;        }
    }
    
    
}
