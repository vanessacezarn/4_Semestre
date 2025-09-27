-- 2) CRIE UM PROCEDURE PARA ATUALIZAR OS DETALHES DE UM LIVRO (POR EXEMPLO: TÍTULO, ANO) PELO ISBN
CREATE PROCEDURE usp_alterarLivro(@isbn varchar (50), @titulo varchar(100))
as
BEGIN
	IF EXISTS (select * from Livro as L where l.isbn = @isbn)
	BEGIN
		UPDATE Livro 
		set titulo = @titulo
		where isbn = @isbn

	END
	ELSE
		print 'NÃO EXISTE UM LIVRO COM ISBN = ' +@isbn;
END

EXEC usp_alterarLivro '8532511015', 'Vanessa'



