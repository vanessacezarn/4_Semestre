CREATE FUNCTION fn_NomeSupervisor(@cpf varchar(11))
RETURNS varchar(100)
AS
BEGIN
	declare @supervisor varchar(100);
	SELECT @supervisor = CONCAT(F_SUP.Pnome,' ',F_SUP.Minicial, ' ',F_SUP.Unome)
	FROM FUNCIONARIO AS F
	INNER JOIN FUNCIONARIO AS F_SUP
	ON f.Cpf_supervisor = F_SUP.Cpf
	WHERE F.Cpf = @cpf; 

	return @supervisor;
END;

go 
select dbo.fn_NomeSupervisor('12312312311') AS Supervisor

select * from FUNCIONARIO