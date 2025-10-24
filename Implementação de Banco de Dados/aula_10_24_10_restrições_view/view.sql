-- utilizando o banco de dados BIBLIOTECA, crie uma view para retornar todas as informações 
GO;
alter VIEW [nome_exibição] AS
SELECT L.isbn, L.titulo,l.ano, CONCAT(A.nome,'(', a.nacionalidade,')') AS Autor_Nacionalidade, e.nome as editora,c.tipo_categoria as categoria
FROM Livro as L
JOIN LivroAutor as LA
ON LA.fk_livro = L.isbn
JOIN Autor as A
on a.id = LA.fk_autor
JOIN Editora AS E
ON L.fk_editora = E.id
JOIN Categoria AS C
ON L.fk_categoria = C.id


SELECT * FROM nome_exibição order by titulo
