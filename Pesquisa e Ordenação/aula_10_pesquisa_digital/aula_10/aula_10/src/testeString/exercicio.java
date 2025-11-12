
package testeString;

/**
 *
 * @author laboratorio
 */
public class exercicio {
    
    public static void main(String[] args) {
        //Algoritmos geneticos
        //cromossomo - estado - objeto -> conjunto de genes
        //pai - "00000000001111111111"
        //mae - "99999999997777777777"
        //filho1 = primeiraParteDoPai + segundaParteDaMae - 00000000007777777777
        //filho2 = primeiraParteDaMae + segundaParteDoPai - 99999999991111111111

        StringBuffer pai = new StringBuffer("alexandre");
        StringBuffer mae = new StringBuffer("99999999997777777777");
        System.out.println("Pai... " + pai);
        System.out.println("Mae... " + mae);
        System.out.println("Tamanho pai... " + pai.length());
        System.out.println("Tamanho mae... " + mae.length());
        System.out.println("Primeira metade pai... " + pai.substring(0, (int)pai.length()/2));
        System.out.println("Segunda metade pai... " + pai.substring((int)pai.length()/2, pai.length()));
        System.out.println("Primeira metade mae... " + mae.substring(0, (int)mae.length()/2));
        System.out.println("Segunda metade pai... " + mae.substring((int)mae.length()/2, mae.length()));
        StringBuffer filho1;
        filho1 = new StringBuffer((pai.substring(0, (int)pai.length()/2) + mae.substring((int)mae.length()/2, mae.length())).toString());
        System.out.println(filho1);
        StringBuffer filho2;
        filho2 = new StringBuffer((mae.substring(0, (int)mae.length()/2) + pai.substring((int)pai.length()/2, pai.length())).toString());
        System.out.println(filho2);        
    }
}