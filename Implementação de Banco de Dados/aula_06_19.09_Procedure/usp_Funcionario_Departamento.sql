--Crie um procedure que liste o nome completo dos funcionarios e o nome dos seus respctivos departamentos
CREATE PROCEDURE usp_Funcionario_Departamento 
AS
BEGIN
	select CONCAT (F.Pnome,' ', f.Unome) as Funcionario, D.Dnome AS Departamento
	from FUNCIONARIO as F
	inner join DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
END;

EXEC usp_Funcionario_Departamento;