
package trabalhoordenacao;

import Arquivo.CarregarArquivo;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author thiag
 */
public class TrabalhoOrdenacao {

    
    public static void main(String[] args) {
        /**
         * Declaração de listas que serão usadas 
         * cada método de ordenação possuirá uma lista que será uma copia da lista vinda do arquivo txt
         */
        List<Integer>listaDesordenada = new ArrayList<>();
        List<Integer>listaBolha = new ArrayList<>();
        List<Integer>listaSelecao = new ArrayList<>();
        List<Integer>listaInsercao = new ArrayList<>();
        List<Integer>listaAgitacao = new ArrayList<>();
        List<Integer>listaPente = new ArrayList<>();
        List<Integer>listaShell = new ArrayList<>();
        List<Integer>listaQuick = new ArrayList<>();
        List<Integer>listaHeap = new ArrayList<>();
      
        /**
         * gerando números para uma lista por enquanto 
         * eles deveram vir de um arquivo txt
         */
        Random random = new Random();
        int t = 10;
        int lim = 100;
        
        for (int i = 0; i<t; i++){
            int v = random.nextInt(lim);
            listaDesordenada.add(v);
        }
        
        System.out.println("Lista desordenada: "+listaDesordenada);
        /**
         * Instanciando o objeto ord que vem da classe ordenacao, a qual contem 
         * todos os métodos de ordenacao
         */
        Ordenacao ord = new Ordenacao();
        
        System.out.println("Ordenando por bolha:");
        listaBolha.addAll(listaDesordenada); // usado para fazer uma copia da listaDesordenada
        ord.bolha(listaBolha);
        System.out.println("lista ordenada: "+listaBolha);
        
        
      
       
        
    }
    
}
