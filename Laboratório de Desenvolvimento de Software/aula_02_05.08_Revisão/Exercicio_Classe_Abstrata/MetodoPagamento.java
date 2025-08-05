
package Exercicio_Classe_Abstrata;

import java.util.Random;

abstract class MetodoPagamento {
    public String nomeMetodo;
    public int idPagamento;

    public MetodoPagamento(String nomeMetodo) {
        this.nomeMetodo = nomeMetodo;
        Random gerador = new Random();
        idPagamento = gerador.nextInt(100);
    }
    abstract void processaPagamento(double valor);
    
    abstract void mostraDetalhesPagamento();
}
