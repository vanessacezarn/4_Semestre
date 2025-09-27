--11) PROCEDURE PARA LISTAR OS LIVROS POR AUTORES DE UM NACIONALIDAE ESPECIFICA
CREATE PROCEDURE usp_livrosNacionalidae (@nacionalidade varchar(50))
AS
BEGIN
	SELECT L.titulo
	FROM Autor AS A
	INNER JOIN LivroAutor as LA
	ON A.id = LA.fk_autor
	INNER JOIN LIVRO AS L
	ON L.isbn = LA.fk_livro
	WHERE A.nacionalidade = @nacionalidade
END

EXEC usp_livrosNacionalidae 'Brasil'

select * from autor;
select * from livro;
select * from LivroAutor