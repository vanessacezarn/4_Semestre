--TRY CATCH DO SQL

begin try
	SELECT 1/0; -- ERRO
	PRINT 'N�o cheguei aqui'
end try
begin catch
	PRINT 'DEU ERRO!'
	PRINT 'n�mero '+cast(ERROR_NUMBER() AS VARCHAR(10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();
end catch

-- FULL TRY CATCH
SELECT * FROM FUNCIONARIO;
BEGIN TRY
	BEGIN TRAN;
	UPDATE FUNCIONARIO
	SET Salario = 66666
	WHERE Cpf = '98765432168'

	UPDATE FUNCIONARIO 
	SET Dnr = 6666
	WHERE CPF = '98765432168'
	COMMIT TRAN
	PRINT 'altera��o de departamento!!!';
END TRY
BEGIN CATCH
	-- XACT_STATE() retorna o estado da transa��o 1
	-- 1 = transa��o em aberto
	-- 0 = n�o existe transa��o em aberto
	if XACT_STATE() <> 0
		ROLLBACK TRAN;
	PRINT 'Numero: ' +CAST(ERROR_NUMBER() AS VARCHAR(10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();	
END CATCH

SELECT * FROM FUNCIONARIO WHERE Cpf = '98765432168'