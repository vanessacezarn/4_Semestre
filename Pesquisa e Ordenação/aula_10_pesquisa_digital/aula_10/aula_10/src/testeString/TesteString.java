
package testeString;

public class TesteString {
    public static void main(String[] args) {
        String string = new String();
        StringBuffer stringBuffer;
        StringBuilder stringBuilder;
        
        string = "turma de pesquisa e ordenacao";
        stringBuffer = new StringBuffer("turma de pesquisa e ordenacao");
        stringBuilder = new StringBuilder("turma de pesquisa e ordenacao");
        
        System.out.println(string.indexOf("ordenacao"));
        System.out.println("");
    }
}
