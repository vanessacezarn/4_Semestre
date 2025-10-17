
---- trigger instead of  para inserir funcionario
CREATE TRIGGER trg_inserirFunc
ON FUNCIONARIO
INSTEAD OF INSERT
AS 
PRINT 'NÃO INSERI NENHUM REGISTRO'
go

INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial)
VALUES ('03715566655','Vanessa','cezar','N');