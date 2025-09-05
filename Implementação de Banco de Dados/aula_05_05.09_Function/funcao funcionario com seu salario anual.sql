-- FUNÇÕES MULTI-STATEMENT
-- CRIAR UMA FUNÇÃO QUE RETORNA NOME COMPLETO DOS FUNCIONARIOS E O VALOR DO SALARIO ANUAL
CREATE FUNCTION fn_SalarioAnual ()
RETURNS @Tabela TABLE
(
	nomeCompleto VARCHAR(100),
	salarioMensal DECIMAL(10,2),
	salarioAnual DECIMAL(12,2)
)
AS
BEGIN
	INSERT INTO @Tabela
	SELECT
		CONCAT(F.Pnome,' ',F.Minicial, ' ',F.Unome),
		F.Salario,
		F.Salario * 12
	FROM FUNCIONARIO AS F
	RETURN;
END;

GO 
SELECT * FROM fn_SalarioAnual();