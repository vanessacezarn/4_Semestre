CREATE FUNCTION fn_TemMaisQueNDependetes(@num int, @cpf varchar(11))
RETURNS INT
AS
BEGIN
	DECLARE @qtd_Dependente int
	DECLARE @resultado int
	SELECT @qtd_Dependente = COUNT(D.Nome_dependente)
	FROM DEPENDENTE AS D
	WHERE D.Fcpf = @cpf

	IF @qtd_Dependente > @num
		set @resultado = 1;
	ELSE
		set @resultado = 0;

	RETURN @resultado
end;

select dbo.fn_TemMaisQueNDependetes(5,'12345678966') 

select * from DEPENDENTE;