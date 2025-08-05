
package Exercicio_Interface;


public class Principal {
    public static void main(String[] args) {
        Calculadora c = new Calculadora();
        double soma = c.somar(45, 25);
        System.out.println("Soma = "+soma);
        double sub = c.subtrair(88,25);
        System.out.println("Subtracao = "+sub);
        double mult = c.multiplicar(6,25);
        System.out.println("Multiplicacao = "+mult);
        double dividir = c.dividir(550, 5);
        System.out.println("Divisao = "+dividir);
        double raiz = c.raizquadrada(81);
        System.out.println("Raiz Quadrada = "+raiz);
        double pot = c.elevarPotencia(5, 2);
        System.out.println("Potencia = "+pot);
        double log = c.logaritmo10(1000);
        System.out.println("Logatimo10 = "+log);
        
    }
}
