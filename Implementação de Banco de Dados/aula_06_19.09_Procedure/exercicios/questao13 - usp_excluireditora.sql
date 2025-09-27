--13) excluir uma editora e atualizar os livros associados a essa editora 
ALTER PROCEDURE usp_excluirEditora (@nome varchar (100), @id int)
AS
BEGIN
	IF EXISTS (select * from Editora as E WHERE E.nome = @nome AND E.id = @id)
	BEGIN
		DELETE FROM LivroAutor WHERE fk_livro = (select isbn from livro where fk_editora = @id)
		DELETE FROM Livro WHERE fk_editora = @id
		DELETE FROM EDITORA WHERE id= @id AND nome = @nome
	END
	ELSE
	PRINT 'NÃO TEM UMA EDITORA COM ESSSE NOME '+@nome+ 'ou/e esse id' + CAST (@id AS VARCHAR(10));
END

exec usp_excluirEditora 'Belas Letras', 4 

select * from editora;
select * from livro;