# ATIVIDADE
### 1) Refatorar o código paraque ele não aceite números replicados
### 2) Refatorar o código para que possa busca um número, informando sua posição na tabela
### 3) Refatorar o código para buscar e remover um número

## Código Base
```java
package Hash;

import java.util.ArrayList;
import java.util.Scanner;

/*
--- ATIVIDADE
--- 1) Refatorar o código paraque ele não aceite números replicados
--- 2) Refatorar o código para que possa busca um número, informando sua posição na tabela
--- 3) Refatorar o código para buscar e remover um número
*/
class Util {

    public static int hash(int numero, int tamanho) {
        return numero % tamanho;
    }
}

public class HashFatorado {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        // Cria um vetor (array) de 10 posições, cada um será uma lista
        ArrayList<Integer>[] tabela = new ArrayList[10];

        // Inicia cada posição do vetor com uma nova lista
        for (int i = 0; i < tabela.length; i++) {
            tabela[i] = new ArrayList<>();
        }

        int numero, endereco;
        for (int i = 0; i < 5; i++) {
            System.out.println("Numero: ");
            numero = teclado.nextInt();

            // Calcular o endereço do número dentro da tabela para espalhamento
            endereco = Util.hash(numero, tabela.length);
            System.out.println("Endereco gerado: " + endereco);

            // Inserir o numero no endereco gerado
            tabela[endereco].add(numero);
        }

        // Exemplo: percorrendo o vetor e imprimindo o conteúdo
        for (int i = 0; i < tabela.length; i++) {
            System.out.println("Posicao " + i + ": " + tabela[i]);
        }
    }
}
```
