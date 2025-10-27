package DAO;

import beans.Disciplinas;
import Conexao.Conexao;
import beans.Professores;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DisciplinasDAO {
    private Conexao conexao;
    private Connection conn;

    /**
     * Construtor da classe utilizado para realizar a conexão com banco 
     * utiliza a classe conexao do pacote conexao
     */
    public DisciplinasDAO(){
        this.conexao =  new Conexao();
        this.conn = this.conexao.getConexao();
    }
    public void inserir(Disciplinas d){
        try {
            String sql = "INSERT INTO disciplinas(nome, carga_horaria, professor_id) VALUES (?, ?, ?);";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, d.getNome());
            stmt.setInt(2,d.getCarga_horaria());
            stmt.setInt(3, d.getProfessor_id().getId());
            
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("ERRO AO INSERIR DISCIPLINA : "+ex.getMessage());
        }
    }
    
    public void editar(Disciplinas d){
        try {
            String sql = "UPDATE disciplinas SET nome=?, carga_horaria=?, professor_id=? WHERE id=?";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, d.getNome());
            stmt.setInt(2, d.getCarga_horaria());
            stmt.setInt(3, d.getProfessor_id().getId());            
            stmt.setInt(4, d.getId());
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("ERRO AO EDITAR DISCIPLINA : "+ex.getMessage());
        }
    }
    
    //EXCLUIR
    public void excluir(int id) {
        try {
            String sql = "delete from disciplinas WHERE id=?";

            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);   
            stmt.execute();
            
        } catch (SQLException ex) {
            System.out.println("Erro ao deletar disciplina: " + ex.getMessage());
        }
    }
    
    // PESQUISA TODOS AS DISCIPLINAS
     public List<Disciplinas> getDisciplinas(){
        try {
            String sql = "SELECT * FROM disciplinas";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            List<Disciplinas>listaCategorias = new ArrayList();
            while (rs.next()){
                Disciplinas d = new Disciplinas();
                d.setId(rs.getInt("id"));
                d.setNome(rs.getString("nome"));
                d.setCarga_horaria(rs.getInt("carga_horaria"));
                ProfessoresDAO pDAO = new ProfessoresDAO();
                Professores p = pDAO.getProfessores(rs.getInt("professor_id"));
                d.setProfessor_id(p);
                
                listaCategorias.add(d);
            }
            return listaCategorias;
            
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAS TODAS OS DISCIPLINAS : "+ex.getMessage());
            return null;
        }
    }
    
    //PESQUISA PELO ID
    public Disciplinas getDisciplinas(int id){
        try {
            String sql = "SELECT * FROM disciplinas WHERE id =?";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Disciplinas d = new Disciplinas();
            rs.first();
            
            d.setId(rs.getInt("id"));
            d.setNome(rs.getString("nome"));
            d.setCarga_horaria(rs.getInt("carga_horaria"));
            ProfessoresDAO pDAO = new ProfessoresDAO();
            Professores p = pDAO.getProfessores(rs.getInt("professor_id"));
            d.setProfessor_id(p);
            
            return d;            
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAS DISCIPLINAS PELO ID : "+ex.getMessage());
            return null;        }
    }
    
    //PESQUISA PELO NOME
    public List<Disciplinas> getDisciplinas(String nome){
        try {
            String sql = "SELECT * FROM disciplinas WHERE nome LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.setString(1, "%"+ nome +"%");
            ResultSet rs = stmt.executeQuery();
            List <Disciplinas> listaDisciplinas = new ArrayList();
            while(rs.next()){
                Disciplinas d = new Disciplinas();
                d.setId(rs.getInt("id"));
                d.setNome(rs.getString("nome"));
                d.setCarga_horaria(rs.getInt("carga_horaria"));
                ProfessoresDAO pDAO = new ProfessoresDAO();
                Professores p = pDAO.getProfessores(rs.getInt("professor_id"));
                d.setProfessor_id(p);
                listaDisciplinas.add(d);
            }
            return listaDisciplinas;
            
                  
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAS DISCIPLINAS PELO NOME : "+ex.getMessage());
            return null;        }
    }
    
    public List<Disciplinas> getDisciplinasPorProfessor(int idProfessor) {
        try {
            String sql = "SELECT * FROM disciplinas WHERE professor_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idProfessor);
            ResultSet rs = stmt.executeQuery();
           List<Disciplinas> lista = new ArrayList<>();

            while (rs.next()) {
                Disciplinas d = new Disciplinas();
                d.setId(rs.getInt("id"));
                d.setNome(rs.getString("nome"));
                d.setCarga_horaria(rs.getInt("carga_horaria"));

                ProfessoresDAO pDAO = new ProfessoresDAO();
                Professores p = pDAO.getProfessores(rs.getInt("professor_id"));
                    d.setProfessor_id(p);

                lista.add(d);
            }
            return lista;
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAR DISCIPLINAS: " + ex.getMessage());
            return null;
        }
    }
    
    public Professores getProfessorDisciplina(int idDisciplina) {
        Professores professor = null;
        try {
            //String sql = "SELECT p.nome, p.email FROM professores as p WHERE  p.id = ?";
            String sql = "SELECT p.nome, p.email FROM professores p JOIN disciplinas d ON d.professor_id = p.id WHERE d.id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idDisciplina);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                professor  = new Professores();

                professor.setNome(rs.getString("nome"));
                professor.setEmail(rs.getString("email"));
            }
            return professor;
        } catch (SQLException ex) {
            System.out.println("ERRO AO CONSULTAR DISCIPLINAS: " + ex.getMessage());
            return null;
        }
    }

     
}

