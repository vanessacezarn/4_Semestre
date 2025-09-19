CREATE PROCEDURE usp_dobro (@valor as INT OUTPUT)
AS
SELECT @valor*2
RETURN

--testando o procedimento
DECLARE @custo as INT = 15
EXEC usp_dobro @custo OUTPUT
print @custo