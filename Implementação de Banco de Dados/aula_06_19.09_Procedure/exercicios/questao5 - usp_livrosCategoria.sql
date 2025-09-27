--5) PROCEDURE QUE RECEBA O NOME DE UMA CATEGORIA E RETORNE TODOS OS LIVROS DESSA CATEGORIA
ALTER PROCEDURE usp_livrosCategoria (@nome varchar(50))
AS
BEGIN
	SELECT L.titulo 
	FROM Categoria AS C
	INNER JOIN LIVRO AS L
	ON C.id = L.fk_categoria
	WHERE C.tipo_categoria = @nome
END

EXEC usp_livrosCategoria 'Humor'

select * from categoria
select * from livro
