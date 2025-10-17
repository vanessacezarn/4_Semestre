/*TRANSAÇÕES 
consultas realizadas nas aulas do dia 03/10 e 10/10
*/
--TRANSAÇÕES
BEGIN TRANSACTION;

DECLARE @E INT = 0

INSERT INTO FUNCIONARIO (Pnome,Unome,Minicial,Cpf)
VALUES ('gui','fr','R','5');
SET @E = @@ERROR+@E;

SELECT * FROM FUNCIONARIO

INSERT INTO DEPARTAMENTO (Dnome,Dnumero) VALUES ('Matriz',1)
SET @E = @@ERROR+@E;
select * from DEPARTAMENTO

IF @e <> 0
	begin
		ROLLBACK TRANSACTION;
		print 'erro detectado, transação revertida'
	end
ELSE
	begin
		COMMIT TRANSACTION;
	print 'transaçaõ realizada com sucesso'
	end

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
  END
  ELSE
  BEGIN
  	COMMIT TRANSACTION;
  	PRINT 'Alteracao realizada com sucesso';
  END

--transação tempo
set transaction isolation level serializable;
-- transacao 1
 BEGIN TRAN;
 SELECT * FROM FUNCIONARIO;
 PRINT 'SELECT concluido em:' + CONVERT(varchar(30),SYSDATETIME(),121);
 -- pausa de 20 segundos
 WAITFOR DELAY '00:00:20'
 COMMIT TRAN;
 PRINT 'commit:' + CONVERT(varchar(30),SYSDATETIME(),121);

 -- transacao 2 
 BEGIN TRAN;
 INSERT INTO FUNCIONARIO (Pnome,Minicial,Unome,Cpf)
 VALUES ('vanessa','C','nascimento','031212')
 PRINT 'insert concluido em:' + CONVERT(varchar(30),SYSDATETIME(),121);
 COMMIT TRAN;
 PRINT 'commit:' + CONVERT(varchar(30),SYSDATETIME(),121);

--SAVE POINT

BEGIN TRAN;
INSERT INTO DEPARTAMENTO (Dnome,Dnumero)
VALUES ('Marketing', 88);

SAVE TRAN dptOK;

INSERT INTO DEPARTAMENTO (Data_inicio_gerente,Dnumero)
VALUES('2024-10-10', 99);
ROLLBACK TRAN dptOK;
COMMIT TRANSACTION;

SELECT * FROM DEPARTAMENTO

/*
EXERCICIO DE CASE
FEITOS NA AULA 10/10
*/
-- CASE

-- Classificar funcionarios por faixa salarial
-- salario <20k = baixo | 20k < salario < 40k = medio |salario > 40k = alto 

SELECT 
	F.Pnome, 
	F.Unome,
	F.Salario, 
	CASE 
		WHEN F.Salario < 20000 THEN 'BAIXO'
		WHEN F.Salario BETWEEN 20000 AND 40000 THEN 'MEDIO'
		WHEN F.Salario > 40000 THEN 'ALTO'
		ELSE 'SEM REGISTRO'
	END AS 'Categoria_Salarial'
FROM FUNCIONARIO AS F

-- VERIFICAR SE O FUNCIONARIO FOI CONTRATADO RECENTEMENTE (ULTIMOS 3 MESES = 180 DIAS)
select 
	F.Pnome,
	F.Unome,
	F.Data_Admissao,
	CAST(GETDATE() AS DATE) AS 'HOJE',
	CASE
		WHEN DATEDIFF(DAY,F.Data_Admissao,GETDATE()) <= 180 THEN 'RECENTE'
		ELSE 'ANTIGO'
	END AS 'CONTRATO'
from FUNCIONARIO as F

/*
EXERCICIO DE TRY CATCH
FEITOS  NA AULA 10/10
*/
--TRY CATCH DO SQL

begin try
	SELECT 1/0; -- ERRO
	PRINT 'Nao cheguei aqui'
end try
begin catch
	PRINT 'DEU ERRO!'
	PRINT 'numero '+cast(ERROR_NUMBER() AS VARCHAR(10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();
end catch

-- FULL TRY CATCH
SELECT * FROM FUNCIONARIO;
BEGIN TRY
	BEGIN TRAN;
	UPDATE FUNCIONARIO
	SET Salario = 66666
	WHERE Cpf = '98765432168'

	UPDATE FUNCIONARIO 
	SET Dnr = 6666
	WHERE CPF = '98765432168'
	COMMIT TRAN
	PRINT 'alteracao de departamento!!!';
END TRY
BEGIN CATCH
	-- XACT_STATE() retorna o estado da transa��o 1
	-- 1 = transa��o em aberto
	-- 0 = n�o existe transa��o em aberto
	if XACT_STATE() <> 0
		ROLLBACK TRAN;
	PRINT 'Numero: ' +CAST(ERROR_NUMBER() AS VARCHAR(10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();	
END CATCH

SELECT * FROM FUNCIONARIO WHERE Cpf = '98765432168'