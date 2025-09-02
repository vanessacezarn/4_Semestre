- continua utilizando o banco da aula passada
# PESQUISAR 
### na classe PessoaDAO
```java
public Pessoa getPessoa(int id){
        String sql = "SELEC * FROM pessoa WHERE id = ?";
        PreparedStatement stmt;
        try {
            stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            Pessoa p = new Pessoa();
            rs.first();
            p.setId(id);
            p.setNome(rs.getString("nome"));
            p.setSexo(rs.getString("sexo"));
            p.setIdioma(rs.getString("idioma"));
            return p;
        } catch (SQLException ex) {
            System.out.println("Erro ao consultar pessoa: "+ex.getMessage());
            return null;
       } 
    }
```
### no botão consultar
```java
 private void btn_consultaActionPerformed(java.awt.event.ActionEvent evt) {                                             
        int idPessoa = Integer.parseInt(txt_id.getText());
        PessoaDAO pDAO = new PessoaDAO();
        
        Pessoa p = pDAO.getPessoa(idPessoa);
        if(p == null){
            txt_nome.setText("");
            txt_sexo.setText("");
            txt_idioma.setText("");
            JOptionPane.showMessageDialog(this, "Pessoa não encontrada");
        }else{
            txt_ID.setText(String.valueOf(p.getId()));
            txt_nome.setText(p.getNome());
            txt_sexo.setText(p.getSexo());
            txt_idioma.setText(p.getIdioma());
        }  
    } 
```
<div align="center">
</div>

# EDITAR
### na classe pessoaDAO
```java
 public void editar(Pessoa pessoa) {
        try {
            String sql = "UPDATE pessoa set nome=?, sexo=?, idioma=? WHERE id=?";

            PreparedStatement stmt = this.conn.prepareStatement(sql);
            stmt.setString(1, pessoa.getNome());
            stmt.setString(2, pessoa.getSexo());
            stmt.setString(3, pessoa.getIdioma());
            stmt.setInt(4, pessoa.getId());
            
            stmt.execute();
            
        } catch (Exception ex) {
            System.out.println("Erro ao atualizar pessoa: " + ex.getMessage());
        }
    }
```
### no botão atualizar
```java
private void btn_atualizarActionPerformed(java.awt.event.ActionEvent evt) {                                              
        Pessoa p = new Pessoa();
        p.setId(Integer.parseInt(txt_ID.getText()));
        p.setNome(txt_nome.getText());
        p.setSexo(txt_sexo.getText());
        p.setIdioma(txt_idioma.getText());

        PessoaDAO pDAO = new PessoaDAO();
        pDAO.editar(p);
        JOptionPane.showMessageDialog(this, "Atualização realizada com sucesso !!!");

        limparFormulario();

    }                                             
    private void limparFormulario() {
        txt_id.setText("");
        txt_ID.setText("");
        txt_nome.setText("");
        txt_sexo.setText("");
        txt_idioma.setText("");

    }
```
# EXCLUIR

<div align="center">
  
</div>
