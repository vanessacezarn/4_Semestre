/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package exemplothreads;

/**
 *
 * @author thiag
 */
public class MinhaThread extends Thread {
    private String mensagem;
    private int intervalo;

    public MinhaThread(String mensagem, int intervalo) {
        this.mensagem = mensagem;
        this.intervalo = intervalo;
    }
    public void run(){
        try{
            while(true){
                System.out.println(mensagem);
                Thread.sleep(intervalo);
            }
        }catch(InterruptedException e){
            //lidar com a interrupção 
        }
    }
    
    
}
