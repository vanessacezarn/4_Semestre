/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pacote5;

/**
 *
 * @author laboratorio
 */
public class Cliente extends Pessoa{
   public String cpf;

    @Override
    public void exibirDados() {
        super.exibirDados(); 
        System.out.println("cpf: "+cpf);
        
    }
   
   
}
