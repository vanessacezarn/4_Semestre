package desafiotelefonia;

import java.util.HashSet;
import java.util.Objects;

public class Sessao {
    public String numeroCelular;
    public String dadosSessao;

    public Sessao(String numeroCelular, String dadosSessao) {
        this.numeroCelular = numeroCelular;
        this.dadosSessao = dadosSessao;
    }

    @Override
    public String toString() {
        return "Sessao[" + "numeroCelular=" + numeroCelular + ", dadosSessao=" + dadosSessao + ']';
    }

 
    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 23 * hash + Objects.hashCode(this.numeroCelular);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Sessao other = (Sessao) obj;
        return Objects.equals(this.numeroCelular, other.numeroCelular);
    }
    
    public static Sessao pegar(HashSet<Sessao> sessoes, Sessao chave){
        for (Sessao s : sessoes){
            if(s.equals(chave)){
                return s;
            }
        }
        return null;
    }
}
