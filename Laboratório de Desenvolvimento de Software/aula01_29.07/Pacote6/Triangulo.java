/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pacote6;

/**
 *
 * @author laboratorio
 */
public class Triangulo extends FormaGeometrica {
    public double base;
    public double altura;

    @Override
    public void calcularArea() {
        double area = (base*altura)/2;
        System.out.println("Area = "+area);
    }
    
}
