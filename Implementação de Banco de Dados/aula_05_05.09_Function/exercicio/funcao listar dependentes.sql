CREATE FUNCTION fn_ListarDependentes (@cpf varchar(11))
RETURNS TABLE
AS 
RETURN
(
	SELECT D.Nome_dependente, D.Parentesco
	FROM DEPENDENTE AS D
	WHERE D.Fcpf = @cpf
);

go 
select * 
from dbo.fn_ListarDependentes('12345678966');