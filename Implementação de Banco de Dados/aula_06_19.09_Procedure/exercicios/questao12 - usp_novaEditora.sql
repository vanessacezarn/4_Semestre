--* 12) adicionar uma nova editora
CREATE PROCEDURE usp_novaEditora (@nome varchar (100))
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM EDITORA AS E WHERE E.nome = @nome)
	BEGIN
		INSERT INTO Editora (nome) values (@nome)
	END
	ELSE
	PRINT 'Já existe uma editora com o nome: ' + @nome;
END

select * from editora

EXEC usp_novaEditora 'Vanessa';