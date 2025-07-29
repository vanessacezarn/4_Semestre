/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pacote2;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Aluno a = new Aluno("vanessa",8,9);
        double media = a.calculaMedia();
        System.out.println("Media = "+media);
    }
}
