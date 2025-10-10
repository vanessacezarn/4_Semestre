-- update do salario do carlos, ele passara a receber 30000
-- se for somente assim afeta mais de um funcionrio
UPDATE FUNCIONARIO
SET Salario = 30000
WHERE Pnome = 'Carlos'

-- utilizando transação
BEGIN TRAN; 
DECLARE @registroAfetado INT =0
UPDATE FUNCIONARIO
SET Salario = 30000
WHERE Pnome = 'Carlos'

SET @registroAfetado = @@ROWCOUNT + @registroAfetado;

IF @registroAfetado <> 1
BEGIN
	ROLLBACK TRAN;
	PRINT 'Alteracao NÂO realizada'
END;
ELSE
BEGIN
	COMMIT TRANSACTION;
	PRINT 'Alteracao realizada com sucesso';
END