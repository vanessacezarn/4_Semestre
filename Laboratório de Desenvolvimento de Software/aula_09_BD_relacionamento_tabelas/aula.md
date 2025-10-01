# ATIVIDADE
- Em um novo projeto criar um novo banco de dados que possua as tabelas Categorias, com id(PK) e nome, e Produtos, com id(PK), nome, preco, quantidade e categoria_id(FK).
- Deve ser implementado um formulário que permita o cadastro de novos produtos, o formulario também deve incluir a possibilidade de selecionar a categoria do produto, listando as categorias cadastradas. Além disso, as operações de CRUD (criar, ler, atualizar e deletar) devem ser implementadas para o cadastro de produtos, o sistema também deve permitir que a categoria de um produto seja alterada durante a edição.
- Deve ser desenvolvido uma tela que exiba todos os produtos cadastrados, mostrando o nome do produto, preço, quantidade em estoque e a categoria associada.
- Em uma tela separada deve ser implementado cadastrar, editar e listar as categorias
- Adicionar uma funcionalidade de busca que permita procurar produtos por nome ou categoria.

## BANCO DE DADOS PRODUTOS
```SQL
create database produtos;
mysql> use produtos

create table categorias(
    id int auto_increment primary key,
    nome varchar(50) not null);

create table produtos(
    id int auto_increment primary key,
    nome varchar(50) not null,
    preco float not null,
    quantidade int not null,
    categoria_id int not null,
    foreign key(categoria_id) references categoria(id)
    );

```
## PACOTE CONEXÃO
```java
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
```
## PACOTE BEANS
### CATEGORIAS
```java
package beans;

/**
 * classe que representa a tabela Categorias do banco de dados Produtos
 * cada atributo dessa classe corresponde às colunas da tabela
 **/
public class Categorias {
    private int id;
    private String nome;

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

    /**
     * foi criado para que quando utilizar o ComboBox na interface gráfica possa aparecer o id e o nome de cada categoria
     * @return uma string com id-nome da categoria
     */
    @Override
    public String toString() {
        return this.id+"-"+this.nome;
    }    
}

```
### PRODUTOS
```java
package beans;
/**
 * classe que representa a tabela PRODUTOS do banco de dados Produtos
 * cada atributo dessa classe corresponde às colunas da tabela
 * como categoria_id é uma chave estrangeira e faz referência a classe Categoria
 **/
public class Produtos {
    private int id;
    private String nome;
    private float preco;
    private int quantidade;
    private Categorias categoria_id;

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

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Categorias getCategoria_id() {
        return categoria_id;
    }

    public void setCategoria_id(Categorias categoria_id) {
        this.categoria_id = categoria_id;
    }    
}


```
## PACOTE DAO
### CATEGORIASDAO
```java
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
            PreparedStatement stmt = this.conn.prepareStatement(sql);
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
    * classe responsavel por pesquisar uma determinada categoria de acordo com id
    * @param id é o identificado único de cada categoria
    * @return se conseguir consultar retorna o objeto 
    *         ou se não conseguir consultar retorna null
    */
    public Categorias getCategorias(int id){
        try {
            String sql = "SELECT * FROM categorias WHERE id =?";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
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

```
### PRODUTOSDAO
```java
```


## INTERFACE
### CATEGORIAS
#### CADASTRO DE CATEGORIAS
<div align="center">
  <img width="472" height="225" alt="image" src="https://github.com/user-attachments/assets/c0a840ec-066e-4687-998c-5785d36e759e" />

</div>

```java
 private void btn_salvarActionPerformed(java.awt.event.ActionEvent evt) {                                           
        Categorias c = new Categorias();
        c.setNome(txt_nome.getText());
        CategoriasDAO cDAO = new CategoriasDAO();
        cDAO.inserir(c);
        JOptionPane.showInternalMessageDialog(null, "CADASTRO REALIZADO COM SUCESSO");
        
        limparFormulario();
    }                                          

    public void limparFormulario(){
        txt_nome.setText("");
    }
```
#### EDITAR CATEGORIAS
```java
```
#### RELATÓRIO DE CATEGORIAS
```java
```

### PRODUTOS
```java
```
