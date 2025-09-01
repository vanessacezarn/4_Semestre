- prova dia 09/09 cai tudo, inclusive banco de dados
- instalar my sql
# BANCO DE DADOS
- abilitar a execução MySQL80 em serviços
- abrir MySQL 8.0 Command Line Client
- comandos 
  - mysql> comando **;**
  - confirmaçao da criação : Query OK, 5 rows affected (0.02 sec)
  - em caso de digitar errado antes de salvar ctrl+c
  
## Exemplo de criação de um banco de dados
### exemplo 01
```sql
    create database BDAula01;
    show databases;
    use bdaula01;
    CREATE TABLE pessoa(
        id int AUTO_INCREMENT PRIMARY KEY,
        nome varchar(50) NOT NULL,
        sexo varchar(1) NOT NULL,
        idioma varchar(10) NOT NULL
        );

    show tables; // ver as tabelas existentes
    desc pessoa; // ver os dados de uma tabela especifica

    INSERT INTO pessoa(nome, sexo, idioma)
          VALUES("Vanessa","F","Português");

    select * from pessoa;

    INSERT INTO pessoa(nome, sexo, idioma)
    VALUES
    ("Gerald", "M", "Inglês"),
    ("William", "M", "Inglês"),
    ("Umberto", "M", "Espanhol"),
    ("Jostein", "M", "Alemão"),
    "Stephen", "M", "Holandês");
    

    select * from pessoa;
  
```

### BANCO DE DADOS ESCOLA
```sql
CREATE DATABASE escola;
use escola;

CREATE TABLE alunos(
   id int AUTO_INCREMENT PRIMARY KEY,
   nome varchar(50) NOT NULL,
   idade int NOT NULL,
   curso varchar(50) NOT NULL);

desc alunos;

INSERT INTO alunos(nome, idade, curso)
   VALUES
  ("Ricardo", 40, "Matemática"),
  ("Eduardo", 20, "Sistema de Informação"),
  ("Luiza", 20, "Ciência da Computação"),
  ("Guilherme", 20, "Educação Fsica"),
  ("Vanessa", 22, "Jogos");

select * from alunos;

CREATE TABLE professore(
  id int AUTO_INCREMENT PRIMARY KEY,
  nome varchar(50) NOT NULL,
  idade int NOT NULL,
  disciplina varchar(50) NOT NULL);

desc alunos;

INSERT INTO professores(nome, idade, disciplina)
    VALUES
    ('Prof. Mario', 35, 'Matemática'),
    ('Prof. Augusto', 40, 'História'),
    ('Prof. Ricardo', 38, 'Sistema de Informação');

select * from professores;

CREATE TABLE matriculas(
    id int AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_professor INT,
    data_matricula DATE,
    FOREING KEY (id_aluno) REFERENCES alunos(id),
    FOREING KEY (id_professor) REFERENCES professores(id)
    );
desc matriculas;

INSERT INTO matriculas(id_aluno, id_professor, data_matricula)
    VALUES
    (1, 1, '2023-01-15'),
    (2, 2, '2023-02-20'),
    (3, 3, '2023-03-10'),
    (4, 1, '2023-04-05'),
    (5, 2, '2023-05-12');
SELECT * FROM matriculas;

-- CONSULTAS
SELECT nome, curso FROM alunos;
SELECT nome, disciplina FROM professores;

```
# CONEXÃO DO BANCO DE DADOS com NETBEANS
- criar Java with Ant -> Java Application.
- Crie um pacote chamado “conexao” e dentro deste pacote, uma classe chamada “Conexao
- botão direito no nome do projeto E clique em “Open in System”
- Abrirá a pasta do projeto
- Dentro, crie uma pasta “drivers” E baixe o zip do Agenda e coloque os arquivos lá
- clique com o botão direito em “Libraries” e Selecione Add JAR/Folde e Selecione o arquivo jar
- alem de classe conexão e da principal, vai ter mais dois pacote "beans" e "DAO"
## na classe conexão
```java
package conexao;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Classe para realizar a conexão com o Banco de Dados
 */
public class Conexao {
    public Connection getConexao(){
        try{
            Connection coon = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdaula01?useTimeZone=true&serverTimeZone=UTC", "root", "laboratorio");
            System.out.println("Conexão realizada com sucesso!!!");
            /***
             * string da conexão, onde esta o banco
            * string do usuario do bd
            * string senha do bd
             */
            return coon;
        }
        catch(Exception  e){
            System.out.println("Erro ao conectar no Banco de Dados"+e.getMessage());
            return null;
        }
    }
}
```
## pacote beans
- nesse pacote vão estar as classes que mapearão as tabelas do banco de dados, ou seja, as classes terão como atributos as colunas da tabela
- é uma boa prática ter um "bean" para cada tabela do banco
- dentro do pacote vai ter a classe Pessoa (está sendo realizada a conexão com o banco bdaula01, que tem a tabela pessoa)

```java
package beans;

public class Pessoa {
    private int id;
    private String nome;
    private String sexo;
    private String idioma;
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
    public String getSexo() {
        return sexo;
    }
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    public String getIdioma() {
        return idioma;
    }
    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }
}

```
## pacote DAO
- DAO = Data Access Object ou Objeto de Acesso aos Dados
- nele estará as classes responsáveis por persistir os dados (inserção, edição, exclusão e pesquisa) da aplicação nas tabelas
- **é ela quem executará os códigos SQL no banco**
- é importante ter um DAO para cada tabela
```java

package DAO;
import beans.Pessoa;
import conexao.Conexao;
import java.sql.Connection;
import java.sql.*;

public class PessoaDAO {
    private Conexao conexao;
    private Connection conn;

    public PessoaDAO(Conexao conexao, Connection conn) {
        this.conexao = conexao;
        this.conn = conn;
    }
    public void inserir(Pessoa pessoa){
        String sql = "INSERT INTO pessoa (nome, sexo, idioma) VALUES (?,?,?);";
        try{
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, pessoa.getNome());
            stmt.setString(2, pessoa.getSexo());
            stmt.setString(3, pessoa.getIdioma());
            
            stmt.execute();
        }catch(Exception ex){
            System.out.println("Erro ao inserir pessoa: "+ex.getMessage());
        }
    }
}

```
## pacote principal
```java
package ProgramaEscola;

import DAO.PessoaDAO;
import beans.Pessoa;
import conexao.Conexao;

public class ProgramaEscola {
    public static void main(String[] args) {
        //Conexao con = new Conexao();
        //con.getConexao();
        
        Pessoa p = new Pessoa();
        p.setNome("Luiza");
        p.setSexo("F");
        p.setIdioma("Espanhol");
        
        PessoaDAO pDAO = new PessoaDAO();
        pDAO.inserir(p);
    }
}

```
### Interface grafica com conexao ao banco de dados
```java
 private void btn_salvarActionPerformed(java.awt.event.ActionEvent evt) {                                           
        String nome = txt_nome.getText();
        String sexo;
        if (rad_fem.isSelected()) {
            sexo = "F";
        } else {
            sexo = "M";
        }       
        String idioma = (String)cmb_idioma.getSelectedItem();
        
        Pessoa p = new Pessoa();
        p.setNome(nome);
        p.setSexo(sexo);
        p.setIdioma(idioma);
        PessoaDAO pDAO = new PessoaDAO();
        pDAO.inserir(p);
        
        JOptionPane.showInternalMessageDialog(null, "CADASTRO REALIZADO COM SUCESSO");
        
        txt_nome.setText("");
        btn_sexo.clearSelection();
        cmb_idioma.setSelectedIndex(0);

    }         
```
<div align="center">
<img width="1548" height="598" alt="image" src="https://github.com/user-attachments/assets/c5b45c2d-24a9-40df-8523-970465a4ec6b" />
</div>

