/*
Crie um trigger que seja disparado depois que uma opera��o de inser��o
ocorra na tabela FUNCIONARIO. Esse trigger deve registrar o CPF do novo 
funcion�rio inserido e a opera��o realizada (neste caso, "INSERT") em
uma tabela de log (Log_Funcionario), juntamente com a data e hora da
inser��o. Esse trigger ajudar� a manter um hist�rico das inser��es
realizadas na tabela de funcion�rios
*/


CREATE TRIGGER trg_logFuncionario
ON FUNCIONARIO
INSTEAD OF INSERT
AS 
BEGIN
	INSERT INTO Log_

	DECLARE @cpf varchar(11);
	SELECT @cpf = Cpf
	FROM inserted;
	INSERT INTO 
	VALUES (@cpf,'insert')
END;


create table Log_Funcionario(
	LogId INT IDENTITY(1,1) PRIMARY KEY,
	Cpf CHAR(11),
	Operacao VARCHAR(10),
	Data_hora DATETIME DEFAULT GETDATE()

);

select * from Log_Funcionario;