# ATIVIDADE
- Criar um novo banco de dados que possua as tabelas:
    - Categorias, com id(PK) e nome
    - Produtos, com id(PK), nome, preco, quantidade e categoria_id(FK).
- Para os **PRODUTOS**
    - Formulário que permita o cadastro de novos produtos, com a possibilidade de selecionar a categoria do produto (comboBox)
    - Operações de CRUD (criar, ler, atualizar e deletar) devem ser implementadas
    - Durante a edição a categoria de um produto pode ser alterada
    - Relatório de todos os produtos cadastrados com nome do produto, preço, quantidade em estoque e categoria associada.
    - Adicionar uma funcionalidade de busca que permita procurar produtos por nome ou categoria.
- Para **CATEGORIAS**
    - Em uma tela separada deve ser implementado cadastrar, editar e listar as categorias

## BANCO DE DADOS PRODUTOS
```SQL
create database produtos;
use produtos;

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
### Categorias
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
### Produtos
```java
package beans;
/**
 * classe que representa a tabela PRODUTOS do banco de dados Produtos
 * cada atributo dessa classe corresponde às colunas da tabela
 * como categoria_id é uma chave estrangeira ela faz referência a classe Categoria
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
### CategoriasDAO
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
    * método responsavel por pesquisar uma determinada categoria de acordo com id
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
### ProdutosDAO
```java

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
            String sql = "UPDATE produtos set nome=?, preco=?, quantidade=?, categoria_id=?;";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, p.getNome());
            stmt.setFloat(2, p.getPreco());
            stmt.setInt(3, p.getQuantidade());
            stmt.setInt(4, p.getCategoria_id().getId());
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
}

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
<div align="center">
    <img width="412" height="244" alt="image" src="https://github.com/user-attachments/assets/da8819b8-06be-4968-8df1-a7b289bcdeda" />
</div>

##### botão consultar
```java
private void btn_consultarActionPerformed(java.awt.event.ActionEvent evt) {                                              
        int categoria_id = Integer.parseInt(txt_id.getText());
        CategoriasDAO cDAO = new CategoriasDAO();
        
        Categorias c = cDAO.getCategorias(categoria_id);
        if (c==null){
            limparFormulario();
            JOptionPane.showMessageDialog(this, "CATEGORIA NÃO ENCONTRADA");
        }else{
            txt_id.setText("");
            txt_ID.setText(c.getId()+"");
            txt_nome.setText(c.getNome());
        }    
    }                                             
```
##### botão editar
```java

    private void btn_editarActionPerformed(java.awt.event.ActionEvent evt) {                                           
        Categorias c = new Categorias();
        c.setId(Integer.parseInt(txt_ID.getText()));
        c.setNome(txt_nome.getText());
        
        CategoriasDAO cDAO = new CategoriasDAO();
        cDAO.editar(c);
        JOptionPane.showMessageDialog(this, "ATUALIZAÇÃO REALIAZADA COM SUCESSO");
        limparFormulario();
    }                                          

```
##### método para limpar formulário
```java
    public void limparFormulario(){
        txt_id.setText("");
        txt_ID.setText("");
        txt_nome.setText("");
    }
```

#### RELATÓRIO DE CATEGORIAS
<div align="center">
    <img width="435" height="355" alt="image" src="https://github.com/user-attachments/assets/638f4d61-c42f-4aaa-a517-300bdfbb9e61" />
</div>

```java
 public RelatorioCategorias() {
        initComponents();
        preencherTabela();
    }

    public void preencherTabela(){
        CategoriasDAO cDAO = new CategoriasDAO();
        List<Categorias> listacat = cDAO.getCategorias();
        DefaultTableModel tabela_categorias = (DefaultTableModel) tbl_categorias.getModel();
        for (Categorias c : listacat){
            Object [] obj = new Object[]{
                c.getId(),
                c.getNome()};
            tabela_categorias.addRow(obj);
        }  
    }
```

### PRODUTOS
#### CADASTRO DE PRODUTOS
<div align="center">
    <img width="380" height="312" alt="image" src="https://github.com/user-attachments/assets/a557b3ee-6905-48b5-877d-101436e9affd" />
</div>

##### método para preencher o comboBox com as categorias já cadastradas no banco
```java
public CadastroProdutos() {
    initComponents();
    preencherCategorias();
}
private void preencherCategorias(){
    CategoriasDAO cDAO = new CategoriasDAO();
    List<Categorias> listacat = cDAO.getCategorias();
    for (Categorias c : listacat){
        cmb_categoria.addItem(c);  
    }
}
```
##### botão de salvar
```java
private void btn_salvarActionPerformed(java.awt.event.ActionEvent evt) {                                           
    Produtos p = new Produtos();
    p.setNome(txt_nome.getText());
    p.setPreco(Float.parseFloat(txt_preco.getText()));
    p.setQuantidade(Integer.parseInt(txt_quantidade.getText()));
    Categorias categoria_id = (Categorias)cmb_categoria.getSelectedItem();
    p.setCategoria_id(categoria_id);
    
    ProdutosDAO pDAO = new ProdutosDAO();
    pDAO.inserir(p);
    JOptionPane.showMessageDialog(null, "PRODUTO CADASTRADO COM SUCESSO");
    limparFormulario();
}                                          
private void limparFormulario(){
    txt_nome.setText("");
    txt_preco.setText("");
    txt_quantidade.setText("");
    cmb_categoria.setSelectedIndex(0);
}
```

#### EDITAR E EXCLUIR PRODUTOS
<div align="center">
    
</div>

##### botão consultar
```java
```
##### botão editar
```java
```
##### botão excluir
```java
```
#### método para limpar o formulario
<div align="center">
    
</div>

#### RELATORIOS DE PRODUTOS
<div align="center">
    
</div>

```java
```
#### RELATORIO DE PRODUTOS COM PESQUISA POR NOME OU CATEGORIA
<div align="center">
    
</div>

```java
```
