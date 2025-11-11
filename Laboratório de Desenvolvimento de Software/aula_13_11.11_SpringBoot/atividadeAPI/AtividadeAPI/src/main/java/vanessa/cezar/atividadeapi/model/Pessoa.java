package vanessa.cezar.atividadeapi.model;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
public class Pessoa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String nome;
    @Column(nullable = false)
    private String sexo;
    @Column(nullable = false)
    private String idioma;

    public long getId() { return id; }

    public void setId(long id) {this.id = id;}

    public String getNome() { return nome; }

    public void setNome(String nome) {this.nome = nome;}

    public String getSexo() {return sexo;}

    public void setSexo(String sexo) {this.sexo = sexo;}

    public String getIdioma() {return idioma;}

    public void setIdioma(String idioma) { this.idioma = idioma;}

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Pessoa pessoa = (Pessoa) o;
        return id == pessoa.id && Objects.equals(nome, pessoa.nome) && Objects.equals(sexo, pessoa.sexo) && Objects.equals(idioma, pessoa.idioma);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nome, sexo, idioma);
    }
}
