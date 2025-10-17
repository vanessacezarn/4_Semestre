/*questão 1: 
Autocommit × Transação Explícita Tarefa: Insira dois departamentos: um em modo autocommit e 
outro dentro de uma transação explícita. Em seguida, desfaça o segundo (Rollback) e confirme
o primeiro. Entregável: Demonstre, por consulta, qual linha permaneceu e explique por quê.
*/

INSERT INTO DEPARTAMENTO (Dnome,Dnumero)
VALUES ('jogos',11)

BEGIN TRAN;
INSERT INTO DEPARTAMENTO (Dnome,Dnumero)
VALUES ('bebida',10)
ROLLBACK TRAN;

select * from DEPARTAMENTO
/* somente o primeiro insert realmente inseriu dados no banco de dados pois o segundo insert 
está dentro de uma transação com rollback, o que desfaz tudo dentro da transação explícita
*/

/*
questão 2: SAVEPOINT e ROLLBACK Parcial Tarefa: Dentro de uma única transação, insira dois
departamentos. Crie um SAVEPOINT após o primeiro insert e faça ROLLBACK para o savepoint
(mantendo o primeiro e desfazendo o segundo). Entregável: Evidencie que apenas o primeiro
persiste após COMMIT.
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
UPDATE com Conferência e Decisão Tarefa: Inicie transação, atualize o endereço de um 
funcionário específico, conferir a alteração e então decidir entre COMMIT ou ROLLBACK
com base na conferência. Entregável: Registre a decisão e o estado final do registro.
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
		print 'Não foi possível realizar a transação'
	END
ELSE
	BEGIN
		COMMIT TRAN;
		print 'Transação realizada con sucesso!!!'
	END;

SELECT * FROM FUNCIONARIO