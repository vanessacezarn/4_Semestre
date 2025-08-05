package Exercicio_Interface;

import static java.lang.Math.log10;
import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

public class Calculadora implements ICalculadora {

    @Override
    public double somar(double n1, double n2) {
        return n1+n2;
    }

    @Override
    public double subtrair(double n1, double n2) {
        return n1-n2;
    }

    @Override
    public double multiplicar(double n1, double n2) {
        return n1*n2;
    }

    @Override
    public double dividir(double n1, double n2) {
        return n1/n2;
    }

    @Override
    public double raizquadrada(double n1) {
        return sqrt(n1);
    }

    @Override
    public double elevarPotencia(double n1, double n2) {
        return pow(n1,n2);
    }

    @Override
    public double logaritmo10(double n1) {
        return Math.log10(n1);
    }
    
}
