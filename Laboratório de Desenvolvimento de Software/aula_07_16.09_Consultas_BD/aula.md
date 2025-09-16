# CONSULTAR TODAS AS PESSOAS
Na classe pessoaDAO
```java
public List<Pessoa> getPessoa(){
        String sql = "SELECT * FROM pessoa";
        try{
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery();
            List <Pessoa> listaPessoas = new ArrayList();
            while(rs.next()){
                Pessoa p = new Pessoa();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setSexo(rs.getString("sexo"));
                p.setIdioma(rs.getString("idioma"));
                listaPessoas.add(p);
            }
            return listaPessoas;
            
        }catch(Exception e){
            System.out.println("Erro ao consultar todas as pessoas"+e.getMessage());
            return null;
            
        }
    }
```
#### RESULTSET (rs)
rs.next() --> enquanto exitir um proximo
### Criar um Jframe Form chamado Relatório das pessoas
criar um Jtable
<div align="center">
  <img width="851" height="349" alt="{F797C899-AAE9-4843-8730-889354964BEC}" src="https://github.com/user-attachments/assets/0f2217a1-be33-479e-beef-a022cd626aee" />

</div>

criar uma classe preencher tabela
```java
public void preencheTabela(){
        PessoaDAO pDAO = new PessoaDAO();
        List<Pessoa> listaPessoas = pDAO.getPessoas();
        DefaultTableModel tabelaPessoas = (DefaultTableModel) tbl_pessoas.getModel();
        
        for(Pessoa p : listaPessoas){
            Object [] obj = new Object[]{
                p.getId(),
                p.getNome(),
                p.getSexo(),
                p.getIdioma()};
            tabelaPessoas.addRow(obj);
 
        }        
    }
```
no construtor da JframeForm
```.java
 public RelatorioPessoas() {
        initComponents();
        preencheTabela();
    }
```
## MENU
- em uma nova JFrame Form adicionar um Menu Bar e dentro dele adicionar os menus arquivo, cadastro e relatorio
- dentro do menu cadastro adicionar o menu item para cadastro de pessoa e menu item para editar e excluir pessoas
```java
   private void menu_CadPessoaActionPerformed(java.awt.event.ActionEvent evt) {                                               
        CadastraPessoas cadPessoa = new CadastraPessoas();
        cadPessoa.setVisible(true);
    }                                                                                          

    private void menu_Altera_Exclui_PessoaActionPerformed(java.awt.event.ActionEvent evt) {                                                          
        Editar_excluir edPessoa = new Editar_excluir();
        edPessoa.setVisible(true);
    }                                                         
```
- dentro do menu relatorios adicionar o menu item para relatório de pessoas
```java
    private void menu_listarPessoasActionPerformed(java.awt.event.ActionEvent evt) {                                                   
        RelatorioPessoas relPessoas = new RelatorioPessoas();
        relPessoas.setVisible(true);
    }                                                  

```
- dentro de arquivo adicionar o menu item sair para fechar
```java
   private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {                                           
        System.exit(0);
    } 
```
<div align="center">
  <img width="426" height="319" alt="{7BE744A0-070A-4A5C-8058-8F847E26BF59}" src="https://github.com/user-attachments/assets/c7a9f5e9-7fbd-4034-b82e-aa765a2397c6" />

</div>

## PESQUISA PELO NOME
em outro JFrame Form criar novamente um JTable e agora também uma opção para digitar um nome 
<div align="center">
  <img width="433" height="450" alt="{7CCB4BBC-1938-4720-9BE5-08AD826AAC2E}" src="https://github.com/user-attachments/assets/2d847fc6-8951-4d00-9ee5-84d878ab8fd9" />
</div>

na classe PessoaDAO

```.java
public List<Pessoa> getPessoasNome(String nome){
        String sql = "SELECT * FROM pessoa WHERE nome LIKE ?";
        try{
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.setString(1, "%"+ nome +"%");

            ResultSet rs = stmt.executeQuery();
            List <Pessoa> listaPessoas = new ArrayList();
            while(rs.next()){
                Pessoa p = new Pessoa();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setSexo(rs.getString("sexo"));
                p.setIdioma(rs.getString("idioma"));
                listaPessoas.add(p);
            }
            return listaPessoas;
            
        }catch(Exception e){
            System.out.println("Erro ao consultar pessoas "+ nome +e.getMessage());
            return null;
            
        }
    }
```

criar a classe preencher tabela

```.java
    public void preencherTabela(){
        PessoaDAO pDAO = new PessoaDAO();
        
        List<Pessoa> listaPessoas = pDAO.getPessoasNome(txt_nome.getText());
        DefaultTableModel tabelaPessoas = (DefaultTableModel) tbl_pessoas.getModel();
        
        tabelaPessoas.setNumRows(0);
       
        for(Pessoa p : listaPessoas){
            Object [] obj = new Object[]{
                p.getId(),
                p.getNome(),
                p.getSexo(),
                p.getIdioma()};
            tabelaPessoas.addRow(obj);
        } 
        
    }

```

clicar com botão direito no txt_nome ➔ events ➔ caret ➔ caretUpdate 

```
  private void txt_nomeCaretUpdate(javax.swing.event.CaretEvent evt) {                                     
    preencherTabela();
    } 
```


### FILTRAR PELO SEXO
adicionar os radioButton e ButtonGroup 
<div align="center">
  <img width="453" height="457" alt="{801AEC93-DB2B-47B8-A781-67A44E4BD896}" src="https://github.com/user-attachments/assets/63d5f361-0408-4e9a-8170-b9cae0ed2e4a" />
</div>

na classe PessoaDAO apenas fazer alterações no método getPessoasNome
```JAVA
public List<Pessoa> getPessoasNome(String nome, String sexo){
        String sql = "SELECT * FROM pessoa WHERE nome LIKE ? and sexo LIKE ?";
        try{
            PreparedStatement stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.setString(1, "%"+ nome +"%");
            stmt.setString(2, "%"+ sexo +"%");
            ResultSet rs = stmt.executeQuery();
            List <Pessoa> listaPessoas = new ArrayList();
            while(rs.next()){
                Pessoa p = new Pessoa();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setSexo(rs.getString("sexo"));
                p.setIdioma(rs.getString("idioma"));
                listaPessoas.add(p);
            }
            return listaPessoas;
            
        }catch(Exception e){
            System.out.println("Erro ao consultar pessoas "+ nome +e.getMessage());
            return null;
            
        }
    }
```

na classe preenchertabela dentro JFrame Form fazer algumas alterações

```java
    public void preencherTabela(){
        String sexo = "";
        PessoaDAO pDAO = new PessoaDAO();
        if(rad_masc.isSelected())
            sexo = "M";
        else if (rad_fem.isSelected())
            sexo = "F";
        else
            sexo = "";
        
        List<Pessoa> listaPessoas = pDAO.getPessoasNome(txt_nome.getText(),sexo);
        DefaultTableModel tabelaPessoas = (DefaultTableModel) tbl_pessoas.getModel();
        
        tabelaPessoas.setNumRows(0); // limpar a tabela durante a pesquisa 
       
        for(Pessoa p : listaPessoas){
            Object [] obj = new Object[]{
                p.getId(),
                p.getNome(),
                p.getSexo(),
                p.getIdioma()};
            tabelaPessoas.addRow(obj);
        } 
        
    }
```

clicar com botão direito no rad_fem ➔ events ➔ caret ➔ caretUpdate | mesmo prosseco para o rad_masc

```java
  private void rad_mascStateChanged(javax.swing.event.ChangeEvent evt) {                                      
       preencherTabela();
    }                                     

    private void rad_femStateChanged(javax.swing.event.ChangeEvent evt) {                                     
       preencherTabela();
    } 
```

limpar os dados do JFrame Form para realizar uma nova consulta ➔ adicionar um botão

```java
    private void btn_limparActionPerformed(java.awt.event.ActionEvent evt) {                                           
        txt_nome.setText("");
        btn_sexo.clearSelection();
        preencherTabela();
    } 
```
