module vanessa.cezar.primeiroprojetox {
    requires javafx.controls;
    requires javafx.fxml;


    opens vanessa.cezar.primeiroprojetox to javafx.fxml;
    exports vanessa.cezar.primeiroprojetox;
}