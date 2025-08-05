package pkg_2_Interface;

public class Principal {
    public static void main(String[] args) {
        Cachorro c = new Cachorro();
        c.emitirSom();
        c.movimentar();
        Animal ca = new Cachorro();
        ca.emitirSom();
    }
}
