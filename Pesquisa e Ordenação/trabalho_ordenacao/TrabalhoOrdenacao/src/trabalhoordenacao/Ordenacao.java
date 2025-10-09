
package trabalhoordenacao;

import java.util.ArrayList;
import java.util.List;

/**
 * Classe que contém todos os métodos de ordenação
 */
public class Ordenacao {
    
    int comparacoes;
    int trocas;
    
    /**
     * Método que ordena uma lista recebida por parametro a partirdo método bolha
     * @param lista com números desordenados
     */
    public void bolha(List<Integer> lista) {
        boolean houveTroca;
        int tmp;
        int qtdComparacoes = 0, qtdTrocas = 0;
        do {
            houveTroca = false;
            for (int i = 0; i < lista.size()-1; i++){
                qtdComparacoes++;
                if (lista.get(i) > lista.get(i+1)) {
                    qtdTrocas++;
                    houveTroca = true;
                    tmp = lista.get(i);
                    lista.set(i, lista.get(i+1));
                    lista.set(i+1, tmp);
                }
            }
        } while (houveTroca);
    }
    
    /**
     * metodo que ordena uma lista por meio de seleção
     * @param lista 
     */
    public void selecao(List<Integer>lista){
        int posMenor;
        int tmp;
        int qtd_comparacoes = 0, qtd_troca=0;
        for(int i=0; i< lista.size()-1; i++){
          posMenor = i;
          for(int j = i+1; j< lista.size(); j++){
            qtd_comparacoes ++;
            if(lista.get(j)<lista.get(posMenor)){
              posMenor = j;
            }
          }
          if(i != posMenor){
            qtd_troca++;
            tmp = lista.get(i);
            lista.set(i, lista.get(posMenor));
            lista.set(posMenor,tmp);
          }  
        }
    }
    /**
     * método que ordena uma lista por meio de inserção
     */
    public void insercao(List<Integer> lista){
        int qtdComparacoes = 0, qtdTrocas = 0;
        int tmp;
        for (int i =1; i<lista.size();i++){
            tmp = lista.get(i);
            int j;
            for(j = i-1; j>= 0; j-- ){ 
                qtdComparacoes ++;
                if(tmp < lista.get(j)){
                    lista.set(j+1, lista.get(j));
                    qtdTrocas++;
                }else{
                    break;
                }
            }
            lista.set(j+1, tmp);
            qtdTrocas++;
        }
    }
    
    /**
     * método que ordena uma lista por meio de agitação
     * @param lista 
     */
    public void agitacao(List<Integer> lista) {
        boolean houveTroca = true;
        int tmp;
        int ini = 0;
        int fim = lista.size()-1;
        int qtdComparacoes = 0, qtdTrocas = 0;

        do {
            houveTroca = false;
            for (int i = 0; i < fim; i++){
                qtdComparacoes++;
                if (lista.get(i) > lista.get(i+1)) {
                    qtdTrocas++;
                    houveTroca = true;
                    tmp = lista.get(i);
                    lista.set(i,lista.get(i+1));
                    lista.set(i+1, tmp);
                }
            }
            if(!houveTroca){
              break;
            }
            fim--;

            houveTroca = false;
            for (int i = fim; i > ini+1; i--){
                qtdComparacoes++;
                if (lista.get(i) < lista.get(i-1)) {
                    qtdTrocas++;
                    houveTroca = true;
                    tmp = lista.get(i);
                    lista.set(i,lista.get(i-1));
                    lista.set(i-1,tmp);
                }
            }
            ini++;    
        } while (houveTroca);
    }
    
    /**
     * método que ordena a lista atraves do método pente
     * @param lista 
     */
    public void pente(List<Integer>lista){
        boolean houveTroca = true;
        int tmp;
        int qtdComparacoes = 0, qtdTrocas = 0;
        int distancia = lista.size();
        
        while (distancia > 1 || houveTroca ){
            distancia = (int) (distancia/1.3);
            houveTroca = false;
            if (distancia < 1){
                distancia = 1;
            }
            for (int i=0; i<lista.size()-distancia; i++){
                qtdComparacoes ++;
                if(lista.get(i) > lista.get(i+distancia)){
                    qtdTrocas ++;
                    houveTroca = true;
                    tmp = lista.get(i);
                    lista.set(i,lista.get(i+distancia));
                    lista.set(i+distancia, tmp);
                }
            }
        }
    }
    
    /**
     * método que ordena a lista com shell
     * @param lista 
     */
    public void shell(List<Integer>lista){
    int n = lista.size();
        int qtdComparacoes = 0, qtdTrocas = 0;

        int distancia = 1;
        int referenciaTamanho = 3;

        // Calcula o maior gap inicial usando a sequência de Knuth
        while (distancia < n / referenciaTamanho) {
            distancia = referenciaTamanho * distancia + 1;
        }

        while (distancia > 0) {
            // Passagem com o gap atual
            for (int i = distancia; i < n; i++) {
                int tmp = lista.get(i);
                int j;
                for (j = i - distancia; j >= 0; j -= distancia) {
                    qtdComparacoes++;
                    if (tmp < lista.get(j)) {
                        lista.set(j + distancia, lista.get(j)); // shift
                        qtdTrocas++;
                    } else {
                        break;
                    }
                }
                lista.set(j + distancia, tmp);
                qtdTrocas++;
            }
            // Reduz o gap
            distancia = distancia / referenciaTamanho;
        }
    }
    
    
    public int particionaQuick(List<Integer>lista, int ini, int fim){
        int pivo = lista.get(ini);
        int i = ini+1;
        int j = fim;
        
        while(i <= j){
            // da esquerda para direita
            while(i<=fim && lista.get(i)<=pivo){
                comparacoes++;
                i++;
            }
            //da direita para esquerda
            while(j>ini && lista.get(j)>pivo){
                comparacoes++;
                j--;
            }
            
            if (i<j){
                trocas++;
                int tmp = lista.get(i);
                lista.set(i, lista.get(j));
                lista.set(j, tmp);
            }
        }
        trocas++;
        int tmp = lista.get(ini);
        lista.set(ini, lista.get(j));
        lista.set(j, tmp);    
        return j;
    }
    
    /**
     * método que ordena uma lista utilizando quick
     * @param lista 
     */
    public void quick(List<Integer>lista, int ini, int fim){
        if (ini<fim){
            int pivo = particionaQuick(lista, ini, fim); 
            quick(lista, ini, pivo - 1);
            quick(lista, pivo + 1, fim);
        }
    }
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
        
    }
    
        
 
// ultima chave --> fecha a classe    
}
    
    
 