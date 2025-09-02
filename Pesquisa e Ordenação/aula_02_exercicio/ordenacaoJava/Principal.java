package ordenacaoJava;

import java.util.ArrayList;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<Integer> listaNumeros = new ArrayList<>();
        ArrayList<String> listaPalavras = new ArrayList<>();
        ArrayList<Integer> lista2Numeros = new ArrayList<>();
        ArrayList<String> lista2Palavras = new ArrayList<>();
        
        Util.popularAleatorioNumeros(listaNumeros, 10,100,500);
        System.out.println("Lista com numeros gerados");
        Util.exibirListaNumeros(listaNumeros);
        System.out.println("---------");
        
        Util.popularAleatorioPalavras(listaPalavras, 10, 6);
        System.out.println("Lista com palavras geradas");
        Util.exibirListaPalavras(listaPalavras);
        System.out.println("---------");
        
        Util.popularArqNumeros(lista2Numeros, "numeros.txt");
        System.out.println("Lista com numeros de um arquivo .txt");
        Util.exibirListaNumeros(lista2Numeros);
        System.out.println("---------");
        
        Util.popularArqPalavras(lista2Palavras, "palavras.txt");
        System.out.println("Lista com palavras vindas de um arquivo .txt");
        Util.exibirListaPalavras(lista2Palavras);
        System.out.println("---------");
	}

}
