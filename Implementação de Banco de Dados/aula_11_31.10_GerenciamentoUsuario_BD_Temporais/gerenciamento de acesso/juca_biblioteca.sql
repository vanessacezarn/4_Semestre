select l.isbn, l.titulo, l.ano, a.nome
from Livro as l
join LivroAutor as la
on la.fk_livro = l.isbn
join Autor as a
on la.fk_autor = a.id;

INSERT INTO Autor(nacionalidade, nome)
VALUES ('Brasileiro', 'Juca da Silva');

select * from Autor;

-- Juca tentado ser ser esritor de Harry Potter e a pedra Filosofal
-- ISBN: 8532511015
UPDATE LivroAutor
set fk_autor = 7
WHERE fk_livro = '8532511015'

