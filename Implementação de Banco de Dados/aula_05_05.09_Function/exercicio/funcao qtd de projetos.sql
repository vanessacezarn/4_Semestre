CREATE FUNCTION fn_QtdProjetosFuncionario(@cpf varchar(11))
RETURNS INT
BEGIN
	DECLARE @qtdProjetos INT;
	SELECT @qtdProjetos =  COUNT(TE.Pnr) 
	FROM TRABALHA_EM as TE
	WHERE TE.Fcpf = @cpf
	RETURN @qtdProjetos;

END;

SELECT dbo.fn_QtdProjetosFuncionario('45345345376') as QtdProjetos
