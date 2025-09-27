--8) listar livros publicados por uma editora especifica
CREATE PROCEDURE usp_livrosEditora(@nome varchar(100))
AS
BEGIN
	if exists (select * from editora where Editora.nome = @nome)
	BEGIN
		SELECT L.titulo
		FROM EDITORA AS E
		INNER JOIN LIVRO AS L
		ON E.id = L.fk_editora
		WHERE E.nome = @nome
	END
	ELSE
	PRINT 'não tem a editora' + @nome + 'cadastrada no banco';
END

EXEC usp_livrosEditora 'Wmf Martins Fontes'