
package Exercicio_Classe_Abstrata;


public class Principal {
    public static void main(String[] args) {
        CartaoCreditoPagamento cc = new CartaoCreditoPagamento("cartao de credito");
        cc.processaPagamento(1450);
        cc.mostraDetalhesPagamento();
        
        System.out.println("---------------------------");
        PIXPagamento pix = new PIXPagamento("pix");
        pix.processaPagamento(520);
        pix.mostraDetalhesPagamento();
        System.out.println("---------------------------");

        PayPalPagamento pay = new PayPalPagamento("PayPal");
        pay.processaPagamento(852);
        pay.mostraDetalhesPagamento();
    
    }
}
