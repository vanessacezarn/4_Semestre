/*quest�o 1: 
Autocommit � Transa��o Expl�cita Tarefa: Insira dois departamentos: um em modo autocommit e 
outro dentro de uma transa��o expl�cita. Em seguida, desfa�a o segundo (Rollback) e confirme
o primeiro. Entreg�vel: Demonstre, por consulta, qual linha permaneceu e explique por qu�.
*/

INSERT INTO DEPARTAMENTO (Dnome,Dnumero)
VALUES ('jogos',11)

BEGIN TRAN;
INSERT INTO DEPARTAMENTO (Dnome,Dnumero)
VALUES ('bebida',10)
ROLLBACK TRAN;

select * from DEPARTAMENTO
/* somente o primeiro insert realmente inseriu dados no banco de dados pois o segundo insert 
est� dentro de uma transa��o com rollback, o que desfaz tudo dentro da transa��o expl�cita
*/

/*
quest�o 2: SAVEPOINT e ROLLBACK Parcial Tarefa: Dentro de uma �nica transa��o, insira dois
departamentos. Crie um SAVEPOINT ap�s o primeiro insert e fa�a ROLLBACK para o savepoint
(mantendo o primeiro e desfazendo o segundo). Entreg�vel: Evidencie que apenas o primeiro
persiste ap�s COMMIT.
*/
BEGIN TRAN;
INSERT INTO DEPARTAMENTO(Dnome,Dnumero)
VALUES ('Caixa',12);

SAVE TRAN pontoSalvamento;

INSERT INTO DEPARTAMENTO(Dnome,Dnumero)
VALUES ('Carro',15);

ROLLBACK TRAN pontoSalvamento;

COMMIT TRAN;

SELECT * FROM DEPARTAMENTO

-- EXERCICIO 3
/*
UPDATE com Confer�ncia e Decis�o Tarefa: Inicie transa��o, atualize o endere�o de um 
funcion�rio espec�fico, conferir a altera��o e ent�o decidir entre COMMIT ou ROLLBACK
com base na confer�ncia. Entreg�vel: Registre a decis�o e o estado final do registro.
*/
BEGIN TRAN;
DECLARE @registrosAfetados INT= 0

UPDATE FUNCIONARIO 
SET Endereco = 'Maq. Lucas,32. Santa Maria, RS'
WHERE Cpf = '32132132122'
SET @registrosAfetados = @@ROWCOUNT + @registrosAfetados
IF @registrosAfetados <> 1
	BEGIN
		ROLLBACK TRAN;
		print 'N�o foi poss�vel realizar a transa��o'
	END
ELSE
	BEGIN
		COMMIT TRAN;
		print 'Transa��o realizada con sucesso!!!'
	END;

SELECT * FROM FUNCIONARIO