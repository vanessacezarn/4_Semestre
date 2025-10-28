
package exemplothreads;

public class ExemploThreads {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // criar e iniciar threads secundaria
        MinhaThread thread1 = new MinhaThread("Thread 1 - mensagem a cada 1 segundo",1000);
        MinhaThread thread2 = new MinhaThread("Thread 2 - mensagem a cada 2 segundo",2000);
        
        thread1.start();
        thread2.start();
        
        for(int i =0;i<5;i++){
            System.out.println("Thread Principal - Iteração "+i);
            try{
                Thread.sleep(1500);
            }catch(InterruptedException e){
                e.printStackTrace();
            }
        }
        thread1.interrupt();
        thread2.interrupt();
        
    }
    
}
