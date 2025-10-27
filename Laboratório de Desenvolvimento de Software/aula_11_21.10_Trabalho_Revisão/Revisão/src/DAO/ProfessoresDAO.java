package DAO;

import beans.Professores;
import Conexao.Conexao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProfessoresDAO {
    private Conexao Conexao;
    private Connection conn;

    /**
     * Construtor da classe utilizado para realizar a conexão com banco 
     * utiliza a classe conexao do pacote conexao
     */
    public ProfessoresDAO(){
        this.Conexao =  new Conexao();
        this.conn = this.Conexao.getConexao();
    }
    
    public void inserir(Professores p){
        try {
            String sql = "INSERT INTO professores(nome, email) VALUES (?, ?);";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, p.getNome());
            stmt.setString(2,p.getEmail());
            
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("ERRO AO INSERIR PROFESSOR : "+ex.getMessage());
        }
    }
    
    public void editar(Professores p){
        try {
            String sql = "UPDATE professores SET nome=?, email=? WHERE id=?";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, p.getNome());
            stmt.setString(2,p.getEmail());
            stmt.setInt(3, p.getId());
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("ERRO AO EDITAR PROFESSOR : "+ex.getMessage());
        }
    }
    
    //EXCLUIR
    public void excluir(int id) {
        try {
            String sql = "delete from professores WHERE id=?";

            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);   
            stmt.execute();
            
        } catch (SQLException ex) {
            System.out.println("Erro ao deletar professor: " + ex.getMessage());
        }
    }
    
    // PESQUISA TODOS OS PROFESSORES
     public List<Professores> getProfessores(){
        try {
            String sql = "SELECT * FROM professores";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            List<Professores>listaCategorias = new ArrayList();
            while (rs.next()){
                Professores p = new Professores();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setEmail(rs.getString("email"));
                listaCategorias.add(p);
            }
            return listaCategorias;
            
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAS TODAS OS PROFESSORES : "+ex.getMessage());
            return null;
        }
    }
    
    //PESQUISA PELO ID
    public Professores getProfessores(int id){
        try {
            String sql = "SELECT * FROM professores WHERE id =?";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Professores p = new Professores();
            rs.first();
            
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setEmail(rs.getString("email"));
            
            return p;            
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAS PROFESSORES : "+ex.getMessage());
            return null;        }
    }
    //PESQUISA PELO NOME
    public List<Professores> getProfessores(String nome){
        try {
            String sql = "SELECT * FROM professores WHERE nome LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.setString(1, "%"+ nome +"%");
            ResultSet rs = stmt.executeQuery();
            List <Professores> listaProfessores = new ArrayList();
            while(rs.next()){
                Professores p = new Professores();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setEmail(rs.getString("email"));
                listaProfessores.add(p);
            }
            return listaProfessores;
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAS PROFESSORES : "+ex.getMessage());
            return null;        }
    }
    
}
