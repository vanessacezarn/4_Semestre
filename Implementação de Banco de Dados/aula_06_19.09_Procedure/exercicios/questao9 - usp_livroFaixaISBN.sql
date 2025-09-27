--9) procedure que retorne uma lista de livros com isbn dentro de uma faixa 
CREATE PROCEDURE usp_livroFaixaISBN (@inicio varchar(50), @fim varchar(50))
AS
BEGIN
	SELECT L.titulo, L.isbn
	FROM LIVRO AS L
	WHERE l.isbn BETWEEN @inicio and @fim
END

exec usp_livroFaixaISBN '9788577343348','9788578270698'

select * from livro