package vanessa.cezar.primeiroprojetox;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class HelloController {
    @FXML
    private Label lblNome;

    @FXML
    private TextField txtPrimeiroNome;

    @FXML
    private TextField txtSobrenome;

    @FXML
    protected void onMostrarNome() {
        String nome;
        nome = txtPrimeiroNome.getText();
        String sobrenome = txtSobrenome.getText();
        lblNome.setText(nome+" "+sobrenome);
    }


}