/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pacote5;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Pessoa p = new Pessoa();
        p.nome = "Vanessa";
        p.exibirDados();
        
        Cliente c = new Cliente();
        c.nome = "Vanessa Cezar";
        c.cpf = "03715364050";
        c.exibirDados();
    }
}
