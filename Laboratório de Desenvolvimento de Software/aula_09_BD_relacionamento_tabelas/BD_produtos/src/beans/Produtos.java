
package beans;

/**
 * classe que representa a tabela PRODUTOS do banco de dados Produtos
 * cada atributo dessa classe corresponde às colunas da tabela
 * como categoria_id é uma chave estrangeira e faz referência a classe Categoria
 **/
public class Produtos {
    private int id;
    private String nome;
    private float preco;
    private int quantidade;
    private Categorias categoria_id;

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

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Categorias getCategoria_id() {
        return categoria_id;
    }

    public void setCategoria_id(Categorias categoria_id) {
        this.categoria_id = categoria_id;
    }
    
    
    
}
