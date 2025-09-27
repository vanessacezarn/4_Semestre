-- 1) Procedure que permita inserir uma nova categoria na "Categoria"

CREATE PROCEDURE usp_novaCategoria (@tipo VARCHAR(50))
AS
BEGIN
	IF  NOT EXISTS (select *
					from Categoria AS C
					WHERE C.tipo_categoria = @tipo)
		
		INSERT INTO Categoria (tipo_categoria) VALUES (@tipo)
	else
		print 'JÁ EXISTE ESTA TABELA'
END

exec usp_novaCategoria 'TERROR'

SELECT * FROM Categoria

