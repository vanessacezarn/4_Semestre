CREATE PROCEDURE usp_novoAutor(@nome VARCHAR(100), @nacionalidade varchar(100))
as
BEGIN
	insert into Autor (nome, nacionalidade)
	values (@nome, @nacionalidade)
END

exec usp_novoAutor 'vanessa cezar', 'Brasileira'

select * from Autor