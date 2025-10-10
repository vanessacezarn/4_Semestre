# CASE
- parecido com switch case
- pode ser usado dentro de um select
```SQL
CASE
  WHEN condição1 THEN valor1,
  WHEN condição2 THEN valor2,

  ELSE valorDefault
END
```
```SQL
-- Classificar funcionarios por faixa salarial
-- salario <20k = baixo | 20k < salario < 40k = médio |salario > 40k = alto 

SELECT 
	F.Pnome, 
	F.Unome,
	F.Salario, 
	CASE 
		WHEN F.Salario < 20000 THEN 'BAIXO'
		WHEN F.Salario BETWEEN 20000 AND 40000 THEN 'MÉDIO'
		WHEN F.Salario > 40000 THEN 'ALTO'
		ELSE 'SEM REGISTRO'
	END AS 'Categoria_Salarial'
FROM FUNCIONARIO AS F
```

```SQL
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
```

# CONTINUAÇÃO DE TRANSAÇÕES
- ACID
  - Atomicidade = não é divisivel
  - Consistência = estado válido para estado válido
  - Isolamento = transações são executadas uma por vez
  - Durabilidade =  commit, uma vez que foi salvo não tem como dar ctrl+z
- sempre que tiver uma duvida de como o banco ira ficar utilizar transações
  
```SQL
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
```

```SQL
set transaction isolation level serializable;
-- transaçãõ 1
 BEGIN TRAN;
 SELECT * FROM FUNCIONARIO;
 PRINT 'SELECT concluido em:' + CONVERT(varchar(30),SYSDATETIME(),121);
 -- pausa de 20 segundos
 WAITFOR DELAY '00:00:20'
 COMMIT TRAN;
 PRINT 'commit:' + CONVERT(varchar(30),SYSDATETIME(),121);

 -- transação 2 
 BEGIN TRAN;
 INSERT INTO FUNCIONARIO (Pnome,Minicial,Unome,Cpf)
 VALUES ('vanessa','C','nascimento','031212')
 PRINT 'insert concluido em:' + CONVERT(varchar(30),SYSDATETIME(),121);
 COMMIT TRAN;
 PRINT 'commit:' + CONVERT(varchar(30),SYSDATETIME(),121);
```

# TRY CATCH
```SQL
begin try
	SELECT 1/0; -- ERRO
	PRINT 'Não cheguei aqui'
end try
begin catch
	PRINT 'DEU ERRO!'
	PRINT 'número '+cast(ERROR_NUMBER() AS VARCHAR(10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();
end catch
```

```sql
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
	PRINT 'alteração de departamento!!!';
END TRY
BEGIN CATCH
	-- XACT_STATE() retorna o estado da transação 1
	-- 1 = transação em aberto
	-- 0 = não existe transação em aberto
	if XACT_STATE() <> 0
		ROLLBACK TRAN;
	PRINT 'Numero: ' +CAST(ERROR_NUMBER() AS VARCHAR(10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();	
END CATCH

SELECT * FROM FUNCIONARIO WHERE Cpf = '98765432168'
```
