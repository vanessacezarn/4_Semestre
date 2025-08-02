-- 4 crie o comando SQL para a criação do banco de dados BIBLIOTECA
CREATE DATABASE BIBLIOTECA;
USE BIBLIOTECA;

-- 5 Crie o comando SQL para a criação das tabelas solicitadas
/* Lógico_1: */
CREATE TABLE LIVRO (
    isbn VARCHAR(50) PRIMARY KEY,
    titulo VARCHAR(100),
    ano int,
    FK_EDITORA_Id INT,
    FK_CATEGORIA_codigo INT
);

CREATE TABLE AUTOR (
    Id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50)
);

CREATE TABLE CATEGORIA (
    codigo INT PRIMARY KEY IDENTITY,
    descricao VARCHAR(50)
);

CREATE TABLE EDITORA (
    Id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100)
);

CREATE TABLE LIVRO_AUTOR_ESCRITO (
    FK_LIVRO_isbn VARCHAR(50),
    FK_AUTOR_Id INT
);
 
ALTER TABLE LIVRO ADD CONSTRAINT FK_LIVRO_2
    FOREIGN KEY (FK_EDITORA_Id)
    REFERENCES EDITORA (Id)
    ON DELETE CASCADE;
 
ALTER TABLE LIVRO ADD CONSTRAINT FK_LIVRO_3
    FOREIGN KEY (FK_CATEGORIA_codigo)
    REFERENCES CATEGORIA (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE LIVRO_AUTOR_ESCRITO ADD CONSTRAINT FK_LIVRO_AUTOR_ESCRITO_1
    FOREIGN KEY (FK_LIVRO_isbn)
    REFERENCES LIVRO (isbn);
 
ALTER TABLE LIVRO_AUTOR_ESCRITO ADD CONSTRAINT FK_LIVRO_AUTOR_ESCRITO_2
    FOREIGN KEY (FK_AUTOR_Id)
    REFERENCES AUTOR (Id);

-- 6 Crie o comando SQL para inserção dos referidos dados em todas as tabelas

INSERT INTO CATEGORIA (descricao) VALUES ('Literatura Juvenil');
INSERT INTO CATEGORIA (descricao) VALUES ('Ficção Científica');
INSERT INTO CATEGORIA (descricao) VALUES ('Humor');
SELECT * FROM CATEGORIA;


INSERT INTO AUTOR (nome,nacionalidade) VALUES ('J.K.Rowling','Inglaterra');
INSERT INTO AUTOR (nome,nacionalidade) VALUES ('Clive Staples Lewis','Inglaterra');
INSERT INTO AUTOR (nome,nacionalidade) VALUES ('Afonso Solano','Brasil');
INSERT INTO AUTOR (nome,nacionalidade) VALUES ('Marcos Piangers','Brasil');
INSERT INTO AUTOR (nome,nacionalidade) VALUES ('Ciro Botelho - Tiririca','Brasil');
INSERT INTO AUTOR (nome,nacionalidade) VALUES ('Bianca Mói','Brasil');
SELECT * FROM AUTOR;

INSERT INTO EDITORA (nome) VALUES ('Rocco');
INSERT INTO EDITORA (nome) VALUES ('Wmf Martins');
INSERT INTO EDITORA (nome) VALUES ('Casa da Palavra');
INSERT INTO EDITORA (nome) VALUES ('Belas Letras');
INSERT INTO EDITORA (nome) VALUES ('Matrix');
SELECT * FROM EDITORA;

INSERT INTO LIVRO_AUTOR_ESCRITO (FK_LIVRO_isbn,FK_AUTOR_Id) VALUES ('8532511015',1);
INSERT INTO LIVRO_AUTOR_ESCRITO (FK_LIVRO_isbn,FK_AUTOR_Id) VALUES ('9788578270698',2);
INSERT INTO LIVRO_AUTOR_ESCRITO (FK_LIVRO_isbn,FK_AUTOR_Id) VALUES ('9788577343348',3);
INSERT INTO LIVRO_AUTOR_ESCRITO (FK_LIVRO_isbn,FK_AUTOR_Id) VALUES ('9788581742458',4);
INSERT INTO LIVRO_AUTOR_ESCRITO (FK_LIVRO_isbn,FK_AUTOR_Id) VALUES ('9788582302026',5);
INSERT INTO LIVRO_AUTOR_ESCRITO (FK_LIVRO_isbn,FK_AUTOR_Id) VALUES ('9788577345670',6);
INSERT INTO LIVRO_AUTOR_ESCRITO (FK_LIVRO_isbn,FK_AUTOR_Id) VALUES ('8532512062',1);

SELECT * FROM LIVRO_AUTOR_ESCRITO;


INSERT INTO LIVRO (isbn,titulo,ano,FK_EDITORA_Id,FK_CATEGORIA_codigo) VALUES ('8532511015','Harry Potter e a Pedra Filosofal',2000,1,1);
INSERT INTO LIVRO (isbn,titulo,ano,FK_EDITORA_Id,FK_CATEGORIA_codigo) VALUES ('9788578270698','As Crônicas de Nárnia',2009,1,1);
INSERT INTO LIVRO (isbn,titulo,ano,FK_EDITORA_Id,FK_CATEGORIA_codigo) VALUES ('9788577343348','O Espadachim de Carvão',2013,3,2);
INSERT INTO LIVRO (isbn,titulo,ano,FK_EDITORA_Id,FK_CATEGORIA_codigo) VALUES ('9788581742458','O papai É Pop',2015,4,3);
INSERT INTO LIVRO (isbn,titulo,ano,FK_EDITORA_Id,FK_CATEGORIA_codigo) VALUES ('9788582302026','Pior Que Tá Não Fica',2015,5,3);
INSERT INTO LIVRO (isbn,titulo,ano,FK_EDITORA_Id,FK_CATEGORIA_codigo) VALUES ('9788577345670','Garota Desdobrável',2015,3,1);
INSERT INTO LIVRO (isbn,titulo,ano,FK_EDITORA_Id,FK_CATEGORIA_codigo) VALUES ('8532512062','Harry Potter e o Prisioneiro de Azkaban',2000,1,1);

SELECT * FROM LIVRO;

-- 7 crie uma consulta para relacionar todos os dados de todos os livros existentes na biblioteca em ordem alfabetica de titulo
SELECT L.isbn, L.titulo, L.ano, E.nome, A.nome as Autor, a.nacionalidade as Nacipnalidade, C.descricao
FROM LIVRO AS L, LIVRO_AUTOR_ESCRITO as LA, AUTOR AS A, EDITORA as E, CATEGORIA as C
WHERE L.isbn = LA.FK_LIVRO_isbn and LA.FK_AUTOR_Id = A.Id and L.FK_EDITORA_Id = e.Id and L.FK_CATEGORIA_codigo = C.codigo
ORDER BY L.titulo;


-- 8 crie uma consulta para relacionar todos os dados de todos os livros existentes na biblioteca em ordem alfabetica de AUTOR
SELECT L.isbn, L.titulo, L.ano, E.nome, A.nome as Autor, a.nacionalidade as Nacipnalidade, C.descricao
FROM LIVRO AS L, LIVRO_AUTOR_ESCRITO as LA, AUTOR AS A, EDITORA as E, CATEGORIA as C
WHERE L.isbn = LA.FK_LIVRO_isbn and LA.FK_AUTOR_Id = A.Id and L.FK_EDITORA_Id = e.Id and L.FK_CATEGORIA_codigo = C.codigo
ORDER BY A.nome;

-- 9 crie uma consulta para relacionar todos os dados de todos os livros da categoria de literatura juvenil em ordem de ano
SELECT L.isbn, L.titulo, L.ano, E.nome, A.nome as Autor, a.nacionalidade as Nacipnalidade, C.descricao
FROM LIVRO AS L, LIVRO_AUTOR_ESCRITO as LA, AUTOR AS A, EDITORA as E, CATEGORIA as C
WHERE L.isbn = LA.FK_LIVRO_isbn and LA.FK_AUTOR_Id = A.Id and L.FK_EDITORA_Id = e.Id and L.FK_CATEGORIA_codigo = C.codigo and C.descricao = 'Literatura Juvenil'
ORDER BY L.ano; 


-- 10 crie uma consulta para relacionar todos os dados de todos os livros de humor ou ficção cientifica com ano 2015
SELECT L.isbn, L.titulo, L.ano, E.nome, A.nome as Autor, a.nacionalidade as Nacipnalidade, C.descricao
FROM LIVRO AS L, LIVRO_AUTOR_ESCRITO as LA, AUTOR AS A, EDITORA as E, CATEGORIA as C
WHERE L.isbn = LA.FK_LIVRO_isbn and LA.FK_AUTOR_Id = A.Id and L.FK_EDITORA_Id = e.Id and L.FK_CATEGORIA_codigo = C.codigo and (C.descricao = 'Humor' or C.descricao = 'Ficção Científica') and L.ano = 2015 
