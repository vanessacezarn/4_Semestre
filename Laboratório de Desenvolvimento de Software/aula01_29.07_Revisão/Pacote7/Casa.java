/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Pacote7;

/**
 *
 * @author laboratorio
 */
public class Casa {
    public int tamanho;
    public int quartos;
    public int calcularPreco(int tamanho){
        return tamanho * 2000;
    }
    
    public int calcularPreco(int tamanho, int quartos){
        return (tamanho*2500) + (quartos*850);
    }
    
    
}
