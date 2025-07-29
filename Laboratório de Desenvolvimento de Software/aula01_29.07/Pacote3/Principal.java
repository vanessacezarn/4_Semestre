/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pacote3;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Carro c = new Carro();
        c.exibiMsg();
        c.setNome("Carro 1");
        System.out.println("Nome: "+c.getNome());
        
        Onibus o = new Onibus();
        o.exibiMsg();
        o.setModelo("Modelo A");
        o.setNome("Onibus a");
        System.out.println("Nome: "+o.getNome());
        System.out.println("Modelo: "+o.getModelo());

        
    }
}
