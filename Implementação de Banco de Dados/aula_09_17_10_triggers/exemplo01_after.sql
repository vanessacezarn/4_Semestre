/*
exemplo 01 - evitar nomes completos duplicado
crie uma trigger que não deixe inserir um funcionario que tenha o nome completo
que nem um funcionario já existente
*/

create or alter trigger trg_AfterNomeDuplicados
on funcionario
AFTER INSERT /*
SERIA MELHOR TER USADO INSTEAD OF POIS COM AFTER QUANDO FOR FEITA A VERIFICACAO SE 
O NOME JA EXISTE NO BANCO, ELE JÁ ESTARA INSERIDO NELE DEVIDO AO DML SER EXECUTADO
ANTES DO AFTER*/
AS
BEGIN
	DECLARE @Pnome VARCHAR(50), @Minicial char(1), 
			@Unome varchar(50),@duplicados INT;
	SELECT @duplicados = COUNT(*)
	FROM (SELECT Pnome,Unome,Minicial 
		  FROM FUNCIONARIO
		  GROUP BY Pnome,Unome,Minicial
		  HAVING COUNT (*) > 1) AS Duplicados
	IF @duplicados > 0
		BEGIN
			PRINT 'Já existe um funcionario com esse nome completo'
			ROLLBACK TRANSACTION;
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION;
			PRINT 'Novo registro inserido com sucesso!!!'
		END

END;
GO

select * from FUNCIONARIO

insert into FUNCIONARIO(cpf,Pnome,Unome,Minicial)
values ('05978','jucinha','cezar','N')

ALTER TABLE FUNCIONARIO
DISABLE TRIGGER trg_AfterNomeDuplicados