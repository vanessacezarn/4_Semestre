CREATE PROCEDURE usp_atualizaSalario (@cpf varchar(11), @salarioNovo DECIMAL (10,2))
AS
BEGIN 
	-- ATUALIZAR DADO DA TABELA
	UPDATE FUNCIONARIO
	SET Salario = @salarioNovo
	WHERE Cpf = @cpf

	IF @@ROWCOUNT = 0 -- nenhuma linha esta sendo afetada quando roda a atualização
		Print 'não ha funcionarios com o cpf: '+@cpf

END;

exec usp_atualizaSalario @cpf = '98765432288', @salarioNovo = '15000.00'
select * from FUNCIONARIO