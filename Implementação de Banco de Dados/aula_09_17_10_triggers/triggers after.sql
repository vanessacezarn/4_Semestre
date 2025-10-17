CREATE TRIGGER trg_inserirFuncionario
ON FUNCIONARIO
AFTER INSERT
AS 
PRINT 'funcionario inserido com sucesso'
go

INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial)
VALUES ('03715566655','Vanessa','cezar','N');

