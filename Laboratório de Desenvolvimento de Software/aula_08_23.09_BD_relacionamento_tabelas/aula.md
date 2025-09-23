# RELACIONAMENTO ENTRE TABELAS
- utilizando o projeto bdaula01;
### criar uma nova tabela veiculo
```sql
create table veiculo(
    id int auto_increment primary key,
    modelo varchar(30),
    placa varchar(7),
    id_pessoa int not null,
    foreign key(id_pessoa) references pessoa(id)
     );
```
### no pacote beans criar uma classe para Veiculo
  
```java
public class Veiculo {
    private int id;
    private String modelo;
    private String placa;
    private Pessoa pessoaid;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getModelo() {
        return modelo;
    }
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public String getPlaca() {
        return placa;
    }
    public void setPlaca(String placa) {
        this.placa = placa;
    }
    public Pessoa getPessoaid() {
        return pessoaid;
    }
    public void setPessoaid(Pessoa pessoaid) {
        this.pessoaid = pessoaid;
    }
}
```
- pessoaid vem da classe pessoa por isso nos get ele retorna o objeto pessoa
### No pacote DAO criar uma classe VeiculoDAO, com Os métodos para INSERIR, EDITAR e EXCLUIR um veiculo
```java
package DAO;
import beans.Veiculo;
import conexao.Conexao;
import java.sql.*;

public class VeiculoDAO {
    private Conexao conexao;
    private Connection conn;
    
    public VeiculoDAO(){
        this.conexao = new Conexao();
        this.conn = this.conexao.getConexao();
    }
    
    public void inserir (Veiculo v){
        try {
            String sql = "INSERT INTO veiculo (modelo, placa, id_pessoa) VALUES (?,?,?);";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, v.getModelo());
            stmt.setString(2, v.getPlaca());
            stmt.setInt(3, v.getPessoaid().getId());
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("Erro ao inserir Veiculo: "+ex.getMessage());
        }
    }
    
    public void editar (Veiculo v){
        try {
            String sql = "UPDATE veiculo set modelo=?, placa=?, id_pessoa=? WHERE id=?";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, v.getModelo());
            stmt.setString(2, v.getPlaca());
            stmt.setInt(3, v.getPessoaid().getId());
            stmt.setInt(4, v.getId());
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar o Veiculo"+ex.getMessage());
        }   
    }
    public void excluir(int id){
        try {
            String sql = "DELETE FROM veiculo WHERE id=?";
            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.execute();
        } catch (SQLException ex) {
            System.out.println("Erro ao excluir o Veiculo"+ex.getMessage());
        }
        
    }
    
}
```
### Criar a interface para cadastro
- comb box --> code --> type paraments --> apagar tudo
<div align="center">
  <img width="447" height="238" alt="image" src="https://github.com/user-attachments/assets/c9ae8ebf-0154-4206-a0bf-958ff59150bb" />
</div>
- criar o método preencher pessoa e adiciona-lo no constutor 

```java
public CadastrarVeiculo() {
        initComponents();
        preencherComboPessoas();
    }

    public void preencherComboPessoas(){
        PessoaDAO pDAO = new PessoaDAO();
        List<Pessoa> listaP = pDAO.getPessoas();
        for (Pessoa p : listaP){
            cmb_pessoa.addItem(p);  
        }
    }
```
- na classe Pessoa adicionar o toString para arrumar como aparece os id no combo box
```java
public String toString(){
        return this.id+"-"+this.nome;
    }
```
### RELATORIO DE VEICULOS
#### na classe VeiculoDAO
```JAVA
public List<Veiculo> getVeiculo(){
        try {
            String sql = "SELECT * FROM veiculo";
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery();
            List<Veiculo> listaVeiculo = new ArrayList();
            while(rs.next()){
                Veiculo v = new Veiculo();
                v.setId(rs.getInt("id"));
                v.setModelo(rs.getString("modelo"));
                v.setPlaca(rs.getString("placa"));
                Pessoa p = new Pessoa();
                p.setId(rs.getInt("id_pessoa"));
                v.setPessoaid(p);
                listaVeiculo.add(v);
            }
            return listaVeiculo;
        } catch (SQLException ex) {
            System.out.println("Erro ao consutar todos os veiculos"+ex.getMessage());
            return null;
        }
    }
```
#### na interface do relatorio
```java
 public RelatorioVeiculo() {
        initComponents();
        preencheTabela();
    }

    public void preencheTabela(){
        VeiculoDAO vDAO = new VeiculoDAO();
        List<Veiculo> listaVeiculos = vDAO.getVeiculo();
        DefaultTableModel tabelaVeiculos = (DefaultTableModel) tbl_veiculos.getModel();
        for (Veiculo v : listaVeiculos){
            Object [] obj = new Object[]{
            v.getId(),
            v.getModelo(),
            v.getPlaca(),
            v.getPessoaid()};
            tabelaVeiculos.addRow(obj);
            
        }
        
    }
```



