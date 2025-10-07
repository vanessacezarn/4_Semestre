package beans;

import java.util.Objects;

/**
 * classe que representa a tabela Categorias do banco de dados Produtos
 * cada atributo dessa classe corresponde às colunas da tabela
 **/
public class Categorias {
    private int id;
    private String nome;

    /**
     * reimplementação o método do equals utilizado para comparar se dois objetos
     * esse método compara esta categoria com outro objeto para verificar igualdade
     * dois objetos de categoria são considerados iguais se tiverem o mesmo id e o mesmo nome
     * @param obj é o objeto a ser comparado com esta instancia
     * @return True, se forem iguais ou False, se não forem iguais
     */
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
        final Categorias other = (Categorias) obj;
        if (this.id != other.id) {
            return false;
        }
        return Objects.equals(this.nome, other.nome);
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * foi criado para que quando utilizar o ComboBox na interface gráfica possa aparecer o id e o nome de cada categoria
     * @return uma string com id-nome da categoria
     */
    @Override
    public String toString() {
        return this.id+"-"+this.nome;
    }    
}
