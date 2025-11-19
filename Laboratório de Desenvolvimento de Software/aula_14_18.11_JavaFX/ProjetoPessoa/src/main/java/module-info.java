module vanessa.cezar.projetopessoa {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;



    opens vanessa.cezar.projetopessoa to javafx.fxml;
    exports vanessa.cezar.projetopessoa;
    opens vanessa.cezar.projetopessoa.controller to javafx.fxml;
}