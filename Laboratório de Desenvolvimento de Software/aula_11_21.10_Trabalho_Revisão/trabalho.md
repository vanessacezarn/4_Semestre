# CONEXÃO
```java
package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    public Connection getConexao(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdaula01?useTimezone=true$serverTimezone=UTC","root","0113MA1404A");
            System.out.println("Conexão realizada com sucesso!!!!!");
            return conn;
        } catch (SQLException ex) {
            System.out.println("Erro ao conectar com o banco de dados"+ex.getMessage());
            return null;
        }
        
    }
}
```
# BEANS
### PROFESSORES
```JAVA
package beans;
public class Professores {
    private int id;
    private String nome;
    private String email;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return this.id+"-"+this.nome;
    }
    
    
}

```
### DISCIPLINAS
```JAVA
package beans;

public class Disciplinas {
    private int id;
    private String nome;
    private int carga_horaria;
    private Professores professor_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getCarga_horaria() {
        return carga_horaria;
    }

    public void setCarga_horaria(int carga_horaria) {
        this.carga_horaria = carga_horaria;
    }

    public Professores getProfessor_id() {
        return professor_id;
    }

    public void setProfessor_id(Professores professor_id) {
        this.professor_id = professor_id;
    }   
}
```
# DAO
# INTEFACE GRÁFICA
# APLICAÇÃO CLIENTE x SERVIDOR
