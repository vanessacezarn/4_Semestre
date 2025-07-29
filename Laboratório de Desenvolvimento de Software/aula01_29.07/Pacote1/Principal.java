/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pacote1;

/**
 *
 * @author laboratorio
 */
public class Principal {
    public static void main(String[] args) {
        Pessoa p = new Pessoa("vanessa",22);
        
        System.out.println("nome: "+p.getNome());
        System.out.println("idade: "+p.getIdade());

        p.setNome("LUIZA");
        p.setIdade(20);
        String retorno = p.getNome();
        System.out.println("Nome: "+retorno);
        System.out.println("Idade: "+p.getIdade());

    }
}
