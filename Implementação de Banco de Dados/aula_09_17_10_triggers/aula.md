# TRIGGERS
### Banco de dados ativo
- regras que especificam ações que são disparadas automaticamente por certos eventos
- quando o banco faz algo para nós ➔ sem precisar pedindo para ele fazer toda hora
### Trigger 
- conceituação: uma técnica para especificar certos tipos de regras ativas
## Modelo generalizado para bancos de dados ativos e triggers
é um modelo utilizado para especificar regras de banco de dados ativo ➔ **Evento-Condição-Ação(ECA)**
### Eventos ➔ disparam a regra
- normalmente são operações de atualização do banco de dados (update, insert, delete)  que são aplicadas explicitamente ao banco de dadps
- no modelo geral: também poderia ser eventos temporais(token para troca de senha tem tempo para expirar) ou outros tipos de eventos externos.
### Condição ➔ determina se a ação da regra deve ser executada
quando o evento que dispara a ação tiver ocorrido, uma condição opcional pode ser avaliada
- se nenhuma condição for especificada: a ação será executada quando ocorrer o evento
- se uma condição for especificada: primeiro ela é avaliada e se for verdadeira, a ação da regra será executada
## TRIGGERS (gatilho)
- é um tipo especial de Stored Procedure que é executada automaticamente quando o usuário realiza uma operação de modificação de dados em uma tabela especificada
- operações que podem disparar um trigger são : INSERT, UPDATE, DELETE
- sql server: são disparados uma vez para cada operação de modificação e não uma vez por linha afetada
- não é possivel usar dentro de um select ou através de execute, usado para stored procedure
### Modos de disparo de um Triggers
- **AFTER** ➔ o código presente no trigger é execitado após todas as ações terem sido completadas na tabela especificada
- **INSTEAD OF** ➔ o código presente no trigger é executado no lugagr da operação que causou seu disparo
<div align="center">
  <img width="810" height="363" alt="{7657AE33-28C7-4A55-B746-457C11EB245D}" src="https://github.com/user-attachments/assets/b3bcfa6c-3421-4b57-84cc-565a0caa64da" />
</div>
- CUIDADO AO ESCOLHER QUE MODO DE DISPARO UTILIZAR: AFTER SÓ É EXECUTADO APÓS A DML, 

### Fluxo de transações
- é necessário conhecer o fluxo de transações para evitar conflitos entres triggers e constraints
- transações se movem através de verificações e código na ordem abaixo:
  - 1) Verificação de IDENTITY INSERT
    2) Restrição (constraint) de nulos (null)
    3) checagem de tipos de dados
    4) **Execução de triggers INSTEAD OF** (execução do DML para aqui, pois esse trigger não é recursivo)
    5) Restrição de chave primária
    6) Restrição de check
    7) Restrição de chave estrangeira
    8) Execuçao do DML e atualização do log de transações
    9) **Execução do triger AFTER**
    10) Commit de transação (confirmação)
#### testando erros
```sql
INSERT INTO FUNCIONARIO(Cpf,Pnome,Minicial,Datanasc,Dnr)
VALUES ('12365478','Juca','R','1987-06-06',666);
-- erro: de campo null
Mensagem 515, Nível 16, Estado 2, Linha 1
Não é possível inserir o valor NULL na coluna 'Unome', tabela 'EMPRESA.dbo.FUNCIONARIO'; a coluna não permite nulos. Falha em INSERT.

-- apos adicionar o campo que não pode ser null
INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial,Datanasc,Dnr)
VALUES ('12312312311','Juca','cezae','R','1987-06-06',666);
-- erro: já tem uma pessoa com esse cpf (erro de chave primaria)
Mensagem 2627, Nível 14, Estado 1, Linha 1
Violação da restrição PRIMARY KEY 'PK__FUNCIONA__C1FF930843222D1E'. Não é possível inserir a chave duplicada no objeto

-- apos ajustar para um cpf não registado no banco ainda
INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial,Datanasc,Dnr)
VALUES ('123123121','Juca','cezae','R','1987-06-06',666);
-- erro: não existe um departamento com esse numero (erro de chave estrangeira)
Mensagem 547, Nível 16, Estado 0, Linha 1
A instrução INSERT conflitou com a restrição do FOREIGN KEY "Dnr". O conflito ocorreu no banco de dados "EMPRESA", tabela "dbo.DEPARTAMENTO", column 'Dnumero'.
```
### Sintaxe do Triggers
```SQL
CREATE TRIGGERS nome_trigger(tr ou trg)
ON tabela
[WHIT ENCRYPTIO] - opcional
  AFTER|INSTEAF OF
    [INSERT,UPDATE,DELETE]
AS
codigo do trigger
```
#### criar um trigger after para inserção de funcionario
```SQL
CREATE TRIGGER trg_inserirFuncionario
ON FUNCIONARIO
AFTER INSERT
AS 
PRINT 'funcionario inserido com sucesso'
go

INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial)
VALUES ('03715566655','Vanessa','cezar','N');
```
#### trigger instead of  para inserir funcionario

```SQL
CREATE TRIGGER trg_inserirFunc
ON FUNCIONARIO
INSTEAD OF INSERT
AS 
PRINT 'NÃO INSERI NENHUM REGISTRO'
go

INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial)
VALUES ('03715566655','Vanessa','cezar','N');
```
**NO TRIGGER DA PARA PEGAR um BLOCO DE CODIGO e passar para ele atraves de palavras reservadas como inserted**
```SQL
---- trigger instead of  para inserir funcionario
CREATE or ALTER TRIGGER trg_inserirFunc
on funcionario
INSTEAD OF INSERT
AS 
declare @nome varchar(100)
select @nome = Pnome from inserted;
PRINT 'NÃO INSERI NENHUM REGISTRO '+@nome 
go

INSERT INTO FUNCIONARIO(Cpf,Pnome,Unome,Minicial)
VALUES ('089548978','bob','ES','N');

```


### HABILITAR E DESABILITAR TRIGGERS
```SQL
ALTER TABLE FUNCIONARIO
DISABLE TRIGGER trg_inserirFunc
```
### VERIFICAR A EXISTÊNCIA DE TRIGGERS
#### em uma tabela especifica
```SQL
exec sp_helptrigger @tabname = Funcionario
```
#### em todo banco de dados
```sql
use nome_bd
select *
from sys.triggers
where is_disabled = 0 or is_disabled = 1
-- 0 = triggers desabilitados
-- 1 = triggers habilitado
```
### DETERMINANDO AS COLUNAS ATUALIZADAS
- função UPDATE() retorna True se uma coluna especificada for altera por uma transação DML
- pode-se criar um gatilho que executa um código caso a coluna especificada seja alterada por comandos DML usando essa função
#### trigger after para update de nome
```sql
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
		print 'nome não foi modificado'
	end 

update FUNCIONARIO
set Pnome = 'juca'
where cpf = '0548978'

select * from FUNCIONARIO
```
#### exemplo 01 - evitar nomes completos duplicado AFTER
crie uma trigger que não deixe inserir um funcionario que tenha o nome completo que nem um funcionario já existente

```sql
create or alter trigger trg_AfterNomeDuplicados
on funcionario
AFTER INSERT /*
SERIA MELHOR TER USADO INSTEAD OF POIS COM AFTER QUANDO FOR FEITA A VERIFICACAO SE 
O NOME JA EXISTE NO BANCO, ELE JÁ ESTARA INSERIDO NELE DEVIDO AO DML SER EXECUTADO
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
			PRINT 'Já existe um funcionario com esse nome completo'
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
```


#### exemplo 01 - evitar nomes completos duplicado INSTEAD OF
```SQL
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
			PRINT 'Já existe alguém com esse nome completo'
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

```
**prova vai cair exercicio com log (data,hora,o que foi feito (se foi feito update, o que mudou)

### exercicio com log
Crie um trigger que seja disparado depois que uma operação de inserção ocorra na tabela FUNCIONARIO. Esse trigger deve registrar o CPF do novo funcionário inserido e a operação realizada (neste caso, "INSERT") em uma tabela de log (Log_Funcionario), juntamente com a data e hora da inserção. Esse trigger ajudará a manter um histórico das inserções realizadas na tabela de funcionários

```sql

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
SET Unome = 'DA ROÇA'
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
```
