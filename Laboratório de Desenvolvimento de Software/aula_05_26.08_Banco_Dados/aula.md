- prova dia 09/09 cai tudo, inclusive banco de dados
- instalar my sql
# BANCO DE DADOS
- abilitar a execução MySQL80 em serviços
- abrir MySQL 8.0 Command Line Client
- comandos 
  - onde vai colocar os comando:  mysql>
  - confirmaçao da criação : Query OK, 5 rows affected (0.02 sec)
- em caso de digitar errado antes de salvar ctrl+c
- so compila tudo quando der o ;
  
## Exemplo de criação de um banco de dados

```sql
    create database BDAula01;
    use bdaula01;
    CREATE TABLE pessoa(
        id int AUTO_INCREMENT PRIMARY KEY,
        nome varchar(50) NOT NULL,
        sexo varchar(1) NOT NULL,
        idioma varchar(10) NOT NULL
        );

    show tables;
    desc pessoa;

    INSERT INTO pessoa(nome, sexo, idioma)
          VALUES("Vanessa","F","Português");

    select * from pessoa;

    INSERT INTO pessoa(nome, sexo, idioma)
    VALUES
    ("Gerald", "M", "Inglês"),
    ("William", "M", "Inglês"),
    ("Umberto", "M", "Espanhol"),
    ("Jostein", "M", "Alemão"),
    "Stephen", "M", "Holandês");
    

    select * from pessoa;
  
```

## BANCO DE DADOS ALUNOS
```sql
CREATE DATABASE escola;
use escola;

CREATE TABLE alunos(
   id int AUTO_INCREMENT PRIMARY KEY,
   nome varchar(50) NOT NULL,
   idade int NOT NULL,
   curso varchar(50) NOT NULL);

desc alunos;

INSERT INTO alunos(nome, idade, curso)
   VALUES
  ("Ricardo", 40, "Matemática"),
  ("Eduardo", 20, "Sistema de Informação"),
  ("Luiza", 20, "Ciência da Computação"),
  ("Guilherme", 20, "Educação Fsica"),
  ("Vanessa", 22, "Jogos");

select * from alunos;

CREATE TABLE professore(
  id int AUTO_INCREMENT PRIMARY KEY,
  nome varchar(50) NOT NULL,
  idade int NOT NULL,
  disciplina varchar(50) NOT NULL);

desc alunos;

INSERT INTO professores(nome, idade, disciplina)
    VALUES
    ('Prof. Mario', 35, 'Matemática'),
    ('Prof. Augusto', 40, 'História'),
    ('Prof. Ricardo', 38, 'Sistema de Informação');

select * from professores;

CREATE TABLE matriculas(
    id int AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_professor INT,
    data_matricula DATE,
    FOREING KEY (id_aluno) REFERENCES alunos(id),
    FOREING KEY (id_professor) REFERENCES professores(id)
    );
desc matriculas;

INSERT INTO matriculas(id_aluno, id_professor, data_matricula)
    VALUES
    (1, 1, '2023-01-15'),
    (2, 2, '2023-02-20'),
    (3, 3, '2023-03-10'),
    (4, 1, '2023-04-05'),
    (5, 2, '2023-05-12');
SELECT * FROM matriculas;

-- CONSULTAS
SELECT nome, curso FROM alunos;
SELECT nome, disciplina FROM professores;

```
