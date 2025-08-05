package pkg_2_Interface;

public class Cachorro implements Animal{

    @Override
    public void emitirSom() {
        System.out.println("AU AU AU");
    }

    @Override
    public void movimentar() {
        System.out.println("o Cachorro esta se movimentando");
    }
    
}
