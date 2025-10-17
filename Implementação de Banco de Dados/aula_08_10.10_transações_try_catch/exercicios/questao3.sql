-- EXERCICIO 3
/*
UPDATE com Conferência e Decisão Tarefa: Inicie transação, atualize o endereço de um 
funcionário específico, conferir a alteração e então decidir entre COMMIT ou ROLLBACK
com base na conferência. Entregável: Registre a decisão e o estado final do registro.
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
		print 'Não foi possível realizar a transação'
	END
ELSE
	BEGIN
		COMMIT TRAN;
		print 'Transação realizada con sucesso!!!'
	END;

SELECT * FROM FUNCIONARIO