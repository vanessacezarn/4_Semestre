package Conexao;

/**
 *
 * Classe responsável por realizar a conexão com o banco de dados
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexao {
    public Connection getConexao(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/produtos?useTimezone=true$serverTimezone=UTC","root","0113MA1404A");
            System.out.println("Conexão realizada com sucesso!!!!!");
            return conn;
        } catch (SQLException ex) {
            System.out.println("Erro ao conectar com o banco de dados"+ex.getMessage());
            return null;
        }   
    }
}
