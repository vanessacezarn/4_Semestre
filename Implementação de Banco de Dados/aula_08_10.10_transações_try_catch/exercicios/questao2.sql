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