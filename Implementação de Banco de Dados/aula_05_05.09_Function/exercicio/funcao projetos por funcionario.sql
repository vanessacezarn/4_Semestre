CREATE FUNCTION fn_ProjetoPorFuncionario(@cpf varchar(11))
RETURNS TABLE
AS 
RETURN
(
	SELECT F.Pnome, TE.Fcpf, P.Projnome
	FROM FUNCIONARIO AS F
	INNER JOIN TRABALHA_EM AS TE 
	ON F.Cpf = TE.Fcpf
	INNER JOIN PROJETO AS P
	ON TE.Pnr = P.Projnumero
	WHERE TE.Fcpf = @cpf
);

GO
SELECT *
FROM dbo.fn_ProjetoPorFuncionario('45345345376');
