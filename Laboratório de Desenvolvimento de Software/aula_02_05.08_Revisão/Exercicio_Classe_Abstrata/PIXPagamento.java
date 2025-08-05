/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Exercicio_Classe_Abstrata;

/**
 *
 * @author laboratorio
 */
public class PIXPagamento extends MetodoPagamento {
    
    public PIXPagamento(String nomeMetodo) {
        super(nomeMetodo);
    }

    @Override
    void processaPagamento(double valor) {
        System.out.println("Processando o pagamento de "+valor+" com "+nomeMetodo);
        System.out.println("Pagamento realizado com SUCESSO!!!");
    }

    @Override
    void mostraDetalhesPagamento() {
        System.out.println("o pagamento com "+nomeMetodo+ " tem como id de pagamento: "+idPagamento);

    }
    
}
