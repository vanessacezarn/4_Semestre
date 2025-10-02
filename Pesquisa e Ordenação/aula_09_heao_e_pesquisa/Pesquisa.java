import java.util.ArrayList;
import java.util.List;

class Util{
    public static int pesquisaBinaria(int numero,ArrayList<Integer>lista){
        int ini = 0;
        int fim = lista.size();
        int meio;
        while (ini <= fim){
            meio = (int)(ini+fim)/2;
            if (numero == lista.get(meio)){
                return meio; //localizado
            }
            if(numero < lista.get(meio)){
                fim = meio -1;
            }else{
                ini = meio + 1;
            }
        }

        return -1;
    }
}

public class Pesquisa {
   public static void main(String[] args) {
    ArrayList<Integer> lista = new ArrayList<Integer>(List.of(9,7,3,2,9,1,1,6,7,4,14));

    System.out.println("Lista original: "+lista);
    System.out.println(lista.indexOf(14));



    lista.sort(null);

    System.out.println("lista ordenada"+lista);
    System.out.println(Util.pesquisaBinaria(14, lista));
   } 
}
