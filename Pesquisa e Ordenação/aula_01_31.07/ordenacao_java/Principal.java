
package ordenacao;

import java.util.ArrayList;



public class Principal {
    public static void main(String[] args) {
        ArrayList<Integer> listaNumeros = new ArrayList<>();
        ArrayList<String> listaPalavras = new ArrayList<>();
        
        Util.popularAleatorioNumeros(listaNumeros, 10,100,500);
        Util.exibirListaNumeros(listaNumeros);
        
        Util.popularAleatorioPalavras(listaPalavras, 10, 6);
        Util.exibirListaPalavras(listaPalavras);

        
        
    }
}
