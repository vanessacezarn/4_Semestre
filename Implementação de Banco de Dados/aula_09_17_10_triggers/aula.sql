-- aula de triggers VANESSA CEZAR DO NASCIMENTO
use EMPRESA
-- teste de erros 
INSERT INTO FUNCIONARIO(Cpf,Pnome,Minicial,Datanasc,Dnr)
VALUES ('12365478','Juca','R','1987-06-06',666);
/* erro: de campo null
Mensagem 515, N�vel 16, Estado 2, Linha 1
N�o � poss�vel inserir o valor NULL na coluna 'Unome', tabela 'EMPRESA.dbo.FUNCIONARIO'; a coluna n�o permite nulos. Falha em INSERT.
*/
-- apos adicionar o campo que n�o pode ser null
INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial,Datanasc,Dnr)
VALUES ('12312312311','Juca','cezae','R','1987-06-06',666);
/* erro: j� tem uma pessoa com esse cpf (erro de chave primaria)
Mensagem 2627, N�vel 14, Estado 1, Linha 1
Viola��o da restri��o PRIMARY KEY 'PK__FUNCIONA__C1FF930843222D1E'. N�o � poss�vel inserir a chave duplicada no objeto
*/
-- apos ajustar para um cpf n�o registado no banco ainda
INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial,Datanasc,Dnr)
VALUES ('123123121','Juca','cezae','R','1987-06-06',666);
/* erro: n�o existe um departamento com esse numero (erro de chave estrangeira)
Mensagem 547, N�vel 16, Estado 0, Linha 1
A instru��o INSERT conflitou com a restri��o do FOREIGN KEY "Dnr". O conflito ocorreu no banco de dados "EMPRESA", tabela "dbo.DEPARTAMENTO", column 'Dnumero'.
*/

-- criar um trigger after para inser��o de funcionario
go
CREATE TRIGGER trg_inserirFuncionario
ON FUNCIONARIO
AFTER INSERT
AS 
PRINT 'funcionario inserido com sucesso'
go

INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial)
VALUES ('03715566655','Vanessa','cezar','N');

--trigger instead of para inserir funcionario
go
CREATE TRIGGER trg_inserirFunc
ON FUNCIONARIO
INSTEAD OF INSERT
AS 
PRINT 'N�O INSERI NENHUM REGISTRO'
go

INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial)
VALUES ('03715566655','Vanessa','cezar','N');

-- trigger after para update de nome
CREATE TRIGGER trg_afterUpdateNome
ON FUNCIONARIO
AFTER UPDATE
AS
IF UPDATE(Pnome)
	BEGIN
		declare @nomeNovo varchar(100)
		declare @nomeAntigo varchar(100)
		select @nomeNovo = Pnome from inserted
		select @nomeAntigo = Pnome from deleted
		print 'o nome foi alterado com sucesso!!!'
		print 'o nome anterior era : ' +@nomeAntigo
		print 'nome nome : ' + @nomeNovo
	END
ELSE
	BEGIN
		print 'nome n�o foi modificado'
	end 

update FUNCIONARIO
set Pnome = 'juca'
where cpf = '0548978'

select * from FUNCIONARIO

/*
exemplo 01 - evitar nomes completos duplicado AFTER
crie uma trigger que n�o deixe inserir um funcionario que tenha o nome completo que nem um funcionario j� existente
*/
create or alter trigger trg_AfterNomeDuplicados
on funcionario
AFTER INSERT /*
SERIA MELHOR TER USADO INSTEAD OF POIS COM AFTER QUANDO FOR FEITA A VERIFICACAO SE 
O NOME JA EXISTE NO BANCO, ELE J� ESTARA INSERIDO NELE DEVIDO AO DML SER EXECUTADO
ANTES DO AFTER*/
AS
BEGIN
	DECLARE @Pnome VARCHAR(50), @Minicial char(1), 
			@Unome varchar(50),@duplicados INT;
	SELECT @duplicados = COUNT(*)
	FROM (SELECT Pnome,Unome,Minicial 
		  FROM FUNCIONARIO
		  GROUP BY Pnome,Unome,Minicial
		  HAVING COUNT (*) > 1) AS Duplicados
	IF @duplicados > 0
		BEGIN
			PRINT 'J� existe um funcionario com esse nome completo'
			ROLLBACK TRANSACTION;
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION;
			PRINT 'Novo registro inserido com sucesso!!!'
		END

END;
GO

select * from FUNCIONARIO

insert into FUNCIONARIO(cpf,Pnome,Unome,Minicial)
values ('05978','jucinha','cezar','N')

/*
exemplo 01 - evitar nomes completos duplicado INSTEAD OF
*/
create or alter trigger trg_Instead_ofNomeDuplicados
on funcionario
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @Pnome VARCHAR(50), @Minicial char(1), 
			@Unome varchar(50);
	SELECT @Pnome = Pnome, @Minicial = Minicial, @Unome = Unome
	FROM inserted;
	-- verifica se existe alguem com o mesmo nome
	IF EXISTS (SELECT 1
			   FROM FUNCIONARIO 
			   WHERE @Pnome = Pnome AND	@Minicial = Minicial AND @Unome = Unome)
		BEGIN
			PRINT 'J� existe algu�m com esse nome completo'
			RAISERROR('ERRO: nome duplicado',16,0);
			/*nivel de severidade do erro
				0 a 10 = informativo ou advertencia
				11 a 16 = problema com a consulta
				17 a 25 = erro grave que indica com falha no servidor
			*/
		END
	ELSE
		begin
			INSERT INTO FUNCIONARIO (Pnome,Minicial,Unome,Cpf,Datanasc,Endereco,Sexo,Salario,Cpf_supervisor,Dnr,Bonus,Data_Admissao)
			SELECT Pnome,Minicial,Unome,Cpf,Datanasc,Endereco,Sexo,Salario,Cpf_supervisor,Dnr,Bonus,Data_Admissao 
			FROM inserted;
		end

end;

select * from FUNCIONARIO

insert into FUNCIONARIO(cpf,Pnome,Unome,Minicial)
values ('0597898','jukinha','cezar','N')

/*
exercicio com log
Crie um trigger que seja disparado depois que uma opera��o de inser��o ocorra na tabela FUNCIONARIO. Esse trigger deve registrar o 
CPF do novo funcion�rio inserido e a opera��o realizada (neste caso, "INSERT") em uma tabela de log (Log_Funcionario), juntamente 
com a data e hora da inser��o. Esse trigger ajudar� a manter um hist�rico das inser��es realizadas na tabela de funcion�rios
*/


create table Log_Funcionario(
	LogId INT IDENTITY(1,1) PRIMARY KEY,
	Cpf CHAR(11),
	Operacao VARCHAR(10),
	Data_hora DATETIME DEFAULT GETDATE()

);

go
CREATE OR ALTER TRIGGER trg_logFuncionario
ON FUNCIONARIO
AFTER INSERT
AS 
BEGIN
	INSERT INTO Log_Funcionario(Cpf,Operacao)
	SELECT Cpf,'INSERT'
	FROM inserted
END;


-- para update
GO
CREATE OR ALTER TRIGGER trg_logFuncionarioUpdate
ON FUNCIONARIO
AFTER UPDATE
AS 
BEGIN
	INSERT INTO Log_Funcionario(Cpf,Operacao)
	SELECT Cpf,'UPDATE'
	FROM inserted
END;


select * from Log_Funcionario;

insert into FUNCIONARIO (Pnome,Cpf,Unome)
values('zezinho','11122233','gui')

UPDATE FUNCIONARIO
SET Unome = 'DA RO�A'
WHERE Cpf = '11122233'

-- para DELETE
GO
CREATE OR ALTER TRIGGER trg_logFuncionarioDelete
ON FUNCIONARIO
AFTER DELETE
AS 
BEGIN
	INSERT INTO Log_Funcionario(Cpf,Operacao)
	SELECT Cpf,'DELETE'
	FROM deleted
END;

DELETE FROM FUNCIONARIO WHERE Cpf = '05978'

select * from FUNCIONARIO