-- 3) excluir um autor e remover suas associações com os livros a tabela livroAutor
CREATE PROCEDURE usp_excluirAutor(@id int, @nome varchar(100))
AS
BEGIN
	IF EXISTS (select * from Autor as a WHERE a.id = @id and a.nome = @nome)
	BEGIN
		DELETE FROM LivroAutor WHERE fk_autor = @id
		DELETE FROM AUTOR WHERE Autor.id = @id and Autor.nome = @nome
	END
	ELSE
	PRINT 'Não é possivel excluir pois não tem um autor : '+CAST(@ID as VARCHAR(10)) +'|'+@nome ;
END

EXEC usp_excluirAutor 6, 'Bianca Mól'