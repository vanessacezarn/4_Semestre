-- 7) procedure que liste os livros publicados em um ano especifico

CREATE PROCEDURE usp_livrosAno(@ano int) 
AS
BEGIN
	select l.titulo, L.ano
	from Livro as L
	WHERE L.ano = @ano
END

exec usp_livrosAno 2015
