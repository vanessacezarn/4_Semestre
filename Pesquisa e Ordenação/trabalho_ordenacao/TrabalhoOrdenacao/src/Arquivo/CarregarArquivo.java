package Arquivo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author thiag
 */
public class CarregarArquivo {
    /**public static void popularAleatorioNumeros(ArrayList<Integer> lista, long quantidade, int inicio, int fim,String caminhoArquivo){
        Random gerador = new Random();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(caminhoArquivo))) {
            for (; quantidade > 0; quantidade--) {
                int numero = gerador.nextInt(inicio, fim);
                lista.add(numero);
                bw.write(String.valueOf(numero));
                bw.newLine();
            }
            System.out.println("Lista populada e salva em: " + caminhoArquivo);
        } catch (IOException e) {
            System.out.println("Erro ao salvar arquivo: " + e.getMessage());
        }
    }
     /**
* método estático que popula uma lista com numeros vindos de um arquivo .txt 
* @param lista armazena os numeros vindo do arquivo
* @param caminho contem o caminho do arquivo .txt
*/
public static void popularArqNumeros(ArrayList<Integer> lista, File caminho) {
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


}
