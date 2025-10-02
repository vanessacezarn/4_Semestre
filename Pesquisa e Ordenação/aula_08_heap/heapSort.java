import java.util.ArrayList;
import java.util.List;
 
class Ordenacao {
    public static void heapSort(ArrayList<Integer> lista) {
        int tmp;
        int qtdComparacoes = 0, qtdTrocas = 0;
        int fe, fd;
        int n = lista.size();
        boolean houveTrocas;
        while (n > 1){
            houveTrocas = false;
            for (int i = 0; i*2+1 < n; i++) {
                fe = i*2+1;
                fd = i*2+2;
                qtdComparacoes++;
                
                if ( lista.get(i) < lista.get(fe) ){ //comparando o raiz com seu filho da esquerda
                    tmp = lista.get(i);
                    lista.set(i, lista.get(fe));
                    lista.set(fe, tmp);
                    qtdTrocas++;
                    houveTrocas = true;
                }
                if (fd < n) { //só vamos comparar o filho da direita se ele existir
                    qtdComparacoes++;
                    if ( lista.get(i) < lista.get(fd) ){ //comparando o raiz com seu filho da direita
                        tmp = lista.get(i);
                        lista.set(i, lista.get(fd));
                        lista.set(fd, tmp);
                        qtdTrocas++;
                        houveTrocas = true;
                    }
                }
            }
            
            if (!houveTrocas) {
                tmp = lista.get(0);
                lista.set(0, lista.get(n-1));
                lista.set(n-1, tmp);
                qtdTrocas++;
                n--;
            }
        }
        System.out.println("Quantidade comparações: " + qtdComparacoes);
        System.out.println("Quantidade trocas: " + qtdTrocas);
    }
 
    public static boolean emHeapMaximo(ArrayList<Integer> lista) {
        int fe, fd;
        for (int i = 0; i*2+1 < lista.size(); i++) {
            fe = i * 2 + 1;
            fd = i * 2 + 2;
            if (lista.get(i) < lista.get(fe)) {
                return false;
            }
            
            if (fd < lista.size()){
                if (lista.get(i) < lista.get(fd)){
                    return false;
                }
            }
        }        
        return true;
    }
}
 
public class heapSort {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>(List.of(8, 3, 6, 1, 8, 6, 98, 12, 8, 9 ,12));
        
 
        System.out.println("Lista original: " + lista);
 
        if (Ordenacao.emHeapMaximo(lista)){
            System.out.println("Em heap máximo");
        }
        else {
            System.out.println("Não em heap máximo");
        }  
        
        Ordenacao.heapSort(lista);
        System.out.println("Lista ordenada: " + lista);
    }
}
 