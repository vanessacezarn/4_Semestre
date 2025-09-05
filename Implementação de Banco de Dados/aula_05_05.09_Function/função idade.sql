-- criar uma função que calcula a idade de um funcionario com base na data de nascimento
CREATE FUNCTION fn_CalculaIdade(@DataNasc DATE)
RETURNS INT
AS 
BEGIN
	DECLARE @Idade INT;
	SET @Idade = DATEDIFF(YEAR, @DataNasc, GETDATE());
	IF(MONTH(@DataNasc) > MONTH(GETDATE()) 
		OR (MONTH(@DataNasc) = MONTH(GETDATE())
		AND DAY(@DataNasc) > DAY(GETDATE())))
		SET @Idade = @Idade -1;
	RETURN @Idade
END;
GO 
SELECT F.Pnome, F.Datanasc, dbo.fn_CalculaIdade(F.Datanasc)
FROM FUNCIONARIO AS F