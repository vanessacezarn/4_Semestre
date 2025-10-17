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