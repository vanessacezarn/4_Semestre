ALTER PROCEDURE usp_Funcionario_por_Departamento (@departamento varchar (150) = null )
AS 
BEGIN
	IF @departamento IS  NULL or @departamento = ''
		BEGIN
			select CONCAT (F.Pnome,' ',F.Minicial,' ', f.Unome) as Funcionario, D.Dnome AS Departamento
			from FUNCIONARIO as F
			FULL join DEPARTAMENTO AS D
			ON F.Dnr = D.Dnumero
		END;
	ELSE
		BEGIN
			select CONCAT (F.Pnome,' ',F.Minicial,' ', f.Unome) as Funcionario, D.Dnome AS Departamento
			from FUNCIONARIO as F
			FULL join DEPARTAMENTO AS D
			ON F.Dnr = D.Dnumero
			WHERE D.Dnome = @departamento
		END;
		
END

exec usp_Funcionario_por_Departamento ' '
exec usp_Funcionario_por_Departamento 'Pesquisa'
