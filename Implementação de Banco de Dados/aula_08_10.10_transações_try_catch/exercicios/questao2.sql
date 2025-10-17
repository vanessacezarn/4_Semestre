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