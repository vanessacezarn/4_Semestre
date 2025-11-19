package vanessa.cezar.projetopessoa.controller;
import vanessa.cezar.projetopessoa.dao.PessoaDAO;
import vanessa.cezar.projetopessoa.model.Pessoa;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;

import java.sql.SQLException;

public class PessoaController {
    @FXML private TextField txtId;
    @FXML private TextField txtNome;
    @FXML private ComboBox<String> cbSexo;    // "M" / "F"
    @FXML private ComboBox<String> cbIdioma;  // até 10 chars (editable)

    @FXML private TableView<Pessoa> table;
    @FXML private TableColumn<Pessoa, Number> colId;
    @FXML private TableColumn<Pessoa, String> colNome;
    @FXML private TableColumn<Pessoa, String> colSexo;
    @FXML private TableColumn<Pessoa, String> colIdioma;

    private final PessoaDAO dao = new PessoaDAO();
    private final ObservableList<Pessoa> dados = FXCollections.observableArrayList();

    @FXML
    public void initialize() {
        // Combos
        cbSexo.setItems(FXCollections.observableArrayList("M", "F"));
        cbIdioma.setItems(FXCollections.observableArrayList("Português", "Inglês", "Espanhol"));
        cbIdioma.setEditable(true); // permite digitar outro idioma (até 10 chars)

        // Tabela
        colId.setCellValueFactory(c -> new javafx.beans.property.SimpleIntegerProperty(c.getValue().getId()));
        colNome.setCellValueFactory(c -> new javafx.beans.property.SimpleStringProperty(c.getValue().getNome()));
        colSexo.setCellValueFactory(c -> new javafx.beans.property.SimpleStringProperty(c.getValue().getSexo()));
        colIdioma.setCellValueFactory(c -> new javafx.beans.property.SimpleStringProperty(c.getValue().getIdioma()));

        table.setItems(dados);
        table.getSelectionModel().selectedItemProperty().addListener((obs, old, sel) -> preencherFormulario(sel));

        recarregarTabela();
    }

    private void preencherFormulario(Pessoa p) {
        if (p == null) {
            txtId.clear(); txtNome.clear();
            cbSexo.getSelectionModel().clearSelection();
            cbIdioma.getSelectionModel().clearSelection();
            cbIdioma.setValue(null);
            return;
        }
        txtId.setText(String.valueOf(p.getId()));
        txtNome.setText(p.getNome());
        cbSexo.setValue(p.getSexo());
        cbIdioma.setValue(p.getIdioma());
    }

    @FXML
    private void onNovo() {
        table.getSelectionModel().clearSelection();
        preencherFormulario(null);
    }

    @FXML
    private void onSalvar() {
        try {
            String nome = txtNome.getText() == null ? "" : txtNome.getText().trim();
            String sexo = cbSexo.getValue();
            String idioma = cbIdioma.getEditor().getText() != null ? cbIdioma.getEditor().getText().trim() : cbIdioma.getValue();

            validar(nome, sexo, idioma);

            String idStr = txtId.getText();
            Pessoa p = new Pessoa(
                    (idStr == null || idStr.isBlank()) ? null : Integer.parseInt(idStr),
                    nome, sexo, idioma
            );

            if (p.getId() == null) dao.inserir(p); else dao.atualizar(p);

            recarregarTabela();
            onNovo();
            showInfo("Sucesso", "Registro salvo com sucesso.");
        } catch (IllegalArgumentException e) {
            showError("Validação", e.getMessage());
        } catch (SQLException e) {
            showError("Banco de dados", e.getMessage());
        }
    }

    @FXML
    private void onExcluir() {
        try {
            if (txtId.getText() == null || txtId.getText().isBlank()) {
                showError("Atenção", "Selecione um registro para excluir.");
                return;
            }
            int id = Integer.parseInt(txtId.getText());

            Alert confirm = new Alert(Alert.AlertType.CONFIRMATION, "Excluir o registro selecionado?", ButtonType.YES, ButtonType.NO);
            confirm.setHeaderText("Confirmação");
            confirm.showAndWait();

            if (confirm.getResult() == ButtonType.YES) {
                dao.excluir(id);
                recarregarTabela();
                onNovo();
            }
        } catch (SQLException e) {
            showError("Banco de dados", e.getMessage());
        }
    }

    private void recarregarTabela() {
        try {
            dados.setAll(dao.listar());
        } catch (SQLException e) {
            showError("Banco de dados", e.getMessage());
        }
    }

    private void validar(String nome, String sexo, String idioma) {
        if (nome.isBlank()) throw new IllegalArgumentException("Nome é obrigatório.");
        if (sexo == null || !(sexo.equals("M") || sexo.equals("F")))
            throw new IllegalArgumentException("Sexo deve ser 'M' ou 'F'.");
        if (idioma == null || idioma.isBlank())
            throw new IllegalArgumentException("Idioma é obrigatório.");
        if (idioma.length() > 10)
            throw new IllegalArgumentException("Idioma deve ter no máximo 10 caracteres.");
    }

    private void showError(String title, String msg) {
        Alert a = new Alert(Alert.AlertType.ERROR);
        a.setTitle(title);
        a.setHeaderText(title);
        a.setContentText(msg);
        a.showAndWait();
    }

    private void showInfo(String title, String msg) {
        Alert a = new Alert(Alert.AlertType.INFORMATION);
        a.setTitle(title);
        a.setHeaderText(title);
        a.setContentText(msg);
        a.showAndWait();
    }
}
