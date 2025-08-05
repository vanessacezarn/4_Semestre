package pkg1_Classe_Abstrata;

public class Principal {
    public static void main(String[] args) {
        Quadrado q = new Quadrado();
        q.lado = 7;
        System.out.println("Area do quadrado = " + q.calcularArea());
        
        Triangulo t = new Triangulo();
        t.base = 6;
        t.altura = 3;
        System.out.println("Area do triangulo = "+t.calcularArea());
        
        Retangulo r = new Retangulo();
        r.altura = 4;
        r.base = 5;
        System.out.println("Area do retangulo = "+r.calcularArea());
    }
}
