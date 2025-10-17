-- EXERCICIO 3
/*
UPDATE com Confer�ncia e Decis�o Tarefa: Inicie transa��o, atualize o endere�o de um 
funcion�rio espec�fico, conferir a altera��o e ent�o decidir entre COMMIT ou ROLLBACK
com base na confer�ncia. Entreg�vel: Registre a decis�o e o estado final do registro.
*/
BEGIN TRAN;
DECLARE @registrosAfetados INT= 0

UPDATE FUNCIONARIO 
SET Endereco = 'Maq. Lucas,32. Santa Maria, RS'
WHERE Cpf = '32132132122'
SET @registrosAfetados = @@ROWCOUNT + @registrosAfetados
IF @registrosAfetados <> 1
	BEGIN
		ROLLBACK TRAN;
		print 'N�o foi poss�vel realizar a transa��o'
	END
ELSE
	BEGIN
		COMMIT TRAN;
		print 'Transa��o realizada con sucesso!!!'
	END;

SELECT * FROM FUNCIONARIO