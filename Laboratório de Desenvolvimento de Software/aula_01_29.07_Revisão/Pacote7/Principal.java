/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pacote7;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Casa c = new Casa();
        
        System.out.println("Preco total da casa = "+c.calcularPreco(45));
        System.out.println("Preco total da casa com quartos = "+c.calcularPreco(30, 2));
    }
}
