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