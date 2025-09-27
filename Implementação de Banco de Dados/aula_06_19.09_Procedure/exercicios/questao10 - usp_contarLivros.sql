--10) PROCEDURE PARA CONTAR O NÚMERO DE LIVROS EM CADA CATEGORIA

CREATE PROCEDURE usp_contarLivros 
AS
BEGIN
	SELECT c.tipo_categoria, count(L.isbn) AS qtd_livros 
	FROM CATEGORIA AS C
	LEFT JOIN LIVRO AS L
	ON C.id = L.fk_categoria
	Group by c.tipo_categoria

END

EXEC usp_contarLivros