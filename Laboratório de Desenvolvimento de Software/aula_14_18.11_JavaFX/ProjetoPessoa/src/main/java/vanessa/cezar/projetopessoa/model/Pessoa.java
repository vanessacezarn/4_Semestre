package vanessa.cezar.projetopessoa.model;

public class Pessoa {

    private Integer id;
    private String nome;
    private String sexo;
    private String idioma;

    public Pessoa() {
    }

    public Pessoa(Integer id, String sexo, String nome, String idioma) {
        this.id = id;
        this.sexo = sexo;
        this.nome = nome;
        this.idioma = idioma;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}


