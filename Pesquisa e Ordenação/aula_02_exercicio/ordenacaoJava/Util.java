package ordenacaoJava;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

public class Util {
	  public static void popularAleatorioNumeros(ArrayList<Integer> lista, long quantidade, int inicio, int fim){
	        Random gerador = new Random();
	        for(;quantidade>0;quantidade--){
	            lista.add(gerador.nextInt(inicio, fim));
	        }
	    }
	    /***
	     * método estatico que gera palavras aleatórias
	     * @param lista armazenam as palavras geradas
	     * @param quantidade de palavras a serem geradas
	     * @param tamanho das palavras a serem geradas
	     */
	    public static void popularAleatorioPalavras(ArrayList<String> lista, long quantidade, int tamanho){
	        String letras = "abcdefghijklmnopqrstuvwxyz";
	        //System.out.println(letras);
	        Random gerador = new Random();
	        
	        for(;quantidade>0;quantidade--){
	            String palavraGerada = "";
	            char letraSorteada ;
	            for(int i=0; i<tamanho;i++){
	                letraSorteada = letras.charAt(gerador.nextInt(letras.length())) ;
	                palavraGerada = palavraGerada + letraSorteada;
	            }
	            
	            lista.add(palavraGerada);
	        }
	    }
	     
	    /***
	     * método estático que exibe uma lista de números inteiros
	     * @param lista contendo numeros inteiros
	     */
	    public static void exibirListaNumeros(ArrayList<Integer> lista){
	        for(Integer item : lista){
	            System.out.println(item);
	        }
	    }
	    
	    /***
	     * método estático que exibe uma lista de palavras 
	     * @param lista contendo palavras
	     */
	     public static void exibirListaPalavras(ArrayList<String> lista){
	        for (String item : lista){
	            System.out.println(item);
	        }
	    }
	     
	    /**
	     * método estático que popula uma lista com numeros vindos de um arquivo .txt 
	     * @param lista armazena os numeros vindo do arquivo
	     * @param caminho contem o caminho do arquivo .txt
	     */
	    public static void popularArqNumeros(ArrayList<Integer> lista, String caminho) {
	    	 try (BufferedReader br = new BufferedReader(new FileReader(caminho))) {
	             String linha;
	             while ((linha = br.readLine()) != null) {
	                 try {
	                     lista.add(Integer.parseInt(linha.trim()));
	                 } catch (NumberFormatException e) {
	                     System.out.println("Linha inválida ignorada: " + linha);
	                 }
	             }
	         } catch (IOException e) {
	             System.out.println("Erro ao ler arquivo: " + e.getMessage());
	         }

	    }
	    
	    /**
	     * método estatico que popula uma lista com palvras vindas de um arquivo .txt
	     * @param lista armazena as palavras vindas do arquivo
	     * @param caminho contem o caminho do arquivo .txt 
	     */
	    public static void popularArqPalavras(ArrayList<String> lista, String caminho) {
	    	try (BufferedReader br = new BufferedReader(new FileReader(caminho))) {
	             String linha;
	             while ((linha = br.readLine()) != null) {
	                 try {
	                     lista.add((linha.trim()));
	                 } catch (NumberFormatException e) {
	                     System.out.println("Linha inválida ignorada: " + linha);
	                 }
	             }
	         } catch (IOException e) {
	             System.out.println("Erro ao ler arquivo: " + e.getMessage());
	         }

	    }
	     
	     
	     
}
