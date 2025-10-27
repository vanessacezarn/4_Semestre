package beans;

public class Disciplinas {
    private int id;
    private String nome;
    private int carga_horaria;
    private Professores professor_id;

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

    public int getCarga_horaria() {
        return carga_horaria;
    }

    public void setCarga_horaria(int carga_horaria) {
        this.carga_horaria = carga_horaria;
    }

    public Professores getProfessor_id() {
        return professor_id;
    }

    public void setProfessor_id(Professores professor_id) {
        this.professor_id = professor_id;
    }
   
    
}
