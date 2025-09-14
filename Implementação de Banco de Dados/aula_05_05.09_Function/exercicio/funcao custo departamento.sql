CREATE FUNCTION fn_CustoDepartamento(@Ndepart int)
RETURNS FLOAT
AS
BEGIN
	DECLARE @custo_departamento FLOAT

	SELECT @custo_departamento = SUM(F.Salario)
	FROM FUNCIONARIO AS F
	WHERE F.Dnr = @Ndepart

	RETURN @custo_departamento;
END

SELECT dbo.fn_CustoDepartamento ('1') as CustoDepartamento


