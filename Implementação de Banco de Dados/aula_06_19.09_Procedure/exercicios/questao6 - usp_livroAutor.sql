-- 6) PROCEDURE QUE RECEBA O NOME DE UM AUTOR E RETORNE O NOME DE TODOS OS LIVROS ESCRITOS POR ELE
CREATE PROCEDURE usp_livroAutor(@nome varchar(100))
AS
BEGIN
	IF EXISTS (SELECT * FROM AUTOR as a WHERE a.nome = @nome)
	BEGIN
		SELECT L.titulo
		FROM AUTOR AS A
		INNER JOIN LivroAutor AS LA
		on A.id = LA.fk_autor
		INNER JOIN LIVRO AS L
		ON L.isbn = LA.fk_livro
		WHERE A.nome = @nome 
	END
	ELSE
	PRINT 'o autor: ' + @nome+ 'não esta cadastrado no banco';
END;

EXEC usp_livroAutor 'J.K. Rowling'

