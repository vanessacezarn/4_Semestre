import java.util.ArrayList;
import java.util.List;
 
class Ordenacao {
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
 
public class Heap {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>(List.of(8, 3, 6, 1));
 
        System.out.println("Lista original: " + lista);
 
        if (Ordenacao.emHeapMaximo(lista)){
            System.out.println("Em heap máximo");
        }
        else {
            System.out.println("Não em heap máximo");
        }    
    }
}
 