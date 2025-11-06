package Arquivo;

import desafiotelefonia.Sessao;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;


public class CarregarArquivo {

public static void carregarArquivo(HashMap<String,Sessao> sessoes, String caminho) {
    try (BufferedReader br = new BufferedReader(new FileReader(caminho))) {
        String linha;
        while ((linha = br.readLine()) != null) {
            linha = linha.trim();
            if (!linha.isEmpty()){
                String[] partes = linha.split(";",2);
                if(partes.length == 2){
                    String numeroCelular = partes[0];
                    String dadosSessao = partes[1];
                    
                    Sessao sessao = new Sessao(numeroCelular, dadosSessao);
                    sessoes.put(numeroCelular, sessao);
                }else{
                    System.out.println("Linha mal formatada");
                }
            }
        }
    } catch (IOException e) {
        System.out.println("Erro ao ler arquivo: " + e.getMessage());
    }

}

}