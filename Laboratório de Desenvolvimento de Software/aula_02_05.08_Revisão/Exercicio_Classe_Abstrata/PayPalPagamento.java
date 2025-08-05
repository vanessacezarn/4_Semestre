package Exercicio_Classe_Abstrata;

public class PayPalPagamento extends MetodoPagamento {
    
    public PayPalPagamento(String nomeMetodo) {
        super(nomeMetodo);
    }

    @Override
    void processaPagamento(double valor) {
        System.out.println("Processando o pagamento de "+valor+" com "+nomeMetodo);
        System.out.println("Pagamento realizado com SUCESSO!!!");    }

    @Override
    void mostraDetalhesPagamento() {
        System.out.println("o pagamento com "+nomeMetodo+ " tem como id de pagamento: "+idPagamento);
    }
    
}
