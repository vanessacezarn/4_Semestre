

-- PROCEDURE
-- Crie um procedimento que exiba seu nome.

CREATE PROCEDURE usp_ExibirMeuNome
	@nome VARCHAR(100)
AS
BEGIN
	print 'nome : '+ @nome;
END;

EXEC usp_ExibirMeuNome 'Vanessa';


