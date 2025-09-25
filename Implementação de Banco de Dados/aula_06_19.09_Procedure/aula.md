# STORED PROCEDURE - SP (PROCEDIMENTO ARMAZENADO)- criação e execução no SQL Server 
### DEFINIÇÃO
- são lotes de declarações SQL que podem ser executadas como uma subrotina
- permite centralizar a lógica de acesso aos dados em único local, facilitando a manutenção e otimização de código
- também é possível ajustar permissões de acesso aos usuários, definindo quem pode ou não executá-las
### CRIAÇÃO DE PROCEDIMENTO ARMAZENADO

```sql
  CREATE PROCEDURE nome_procedimento (@parametro tipo_dado)
  AS
  BEGIN
    bloco de codigo
  END;
```
### EXECUTAR UM PROCEDIMENTO ARMAZENADO

```sql
  EXEC(UTE) nome_procedimento @DepartamentoID = valor
```
### MODIFICAR SP
```SQL
ALTER PROCEDURE nome_procedimento (@parametro tipo_dado)
  AS
  BEGIN
    bloco de codigo
  END;
```
#### Procedimento que exibe seu nome
```sql
CREATE PROCEDURE usp_ExibirMeuNome
	@nome VARCHAR(100)
AS
BEGIN
	print 'nome : '+ @nome;
END;

EXEC usp_ExibirMeuNome 'Vanessa';
```
#### Crie um procedure que liste o nome completo dos funcionarios e o nome dos seus respctivos departamentos
```SQL
--Crie um procedure que liste o nome completo dos funcionarios e o nome dos seus respctivos departamentos
CREATE PROCEDURE usp_Funcionario_Departamento 
AS
BEGIN
	select CONCAT (F.Pnome,' ',F.Minicial,' ', f.Unome) as Funcionario, D.Dnome AS Departamento
	from FUNCIONARIO as F
	FULL join DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
END;

EXEC usp_Funcionario_Departamento;
-- utilizado o full join para aparecer tanto funcionarios que não tem departamento quanto departamento que não tem funcionários
```
### Visualizar conteudo de SP
- utilizar o precodimento armazenado **sp_helptext** para extrair o conteúdo de texto de um stored procedure (sp)
- EXEC sp_helptext usp_Funcionario_Departamento
<img width="426" height="198" alt="{6AD51C80-829B-452C-B895-F4BB3ACA2E25}" src="https://github.com/user-attachments/assets/01bcb426-6f14-43fe-a1aa-d4f57f7668ae" />

- para não permitir essa visualização --> Criptografar --> abaixo de create --> WITH ENCRYPTION
    - O texto do objeto 'usp_Funcionario_Departamento' está criptografado.
``` sql
CREATE PROCEDURE sp_Funcionario
WITH ENCRYPTION
AS
SELECT *
FROM FUNCIONARIO
```

#### Crie uma procedure que atualiza o salário de um funcionário baseado no CPF, se
não encontrar nenhum funcionário com o CPF passado exiba uma mensagem.
```SQL
CREATE PROCEDURE usp_atualizaSalario (@cpf varchar(11), @salarioNovo DECIMAL (10,2))
AS
BEGIN 
	-- ATUALIZAR DADO DA TABELA
	UPDATE FUNCIONARIO
	SET Salario = @salarioNovo
	WHERE Cpf = @cpf

	IF @@ROWCOUNT = 0 -- nenhuma linha esta sendo afetada quando roda a atualização
		Print 'não ha funcionarios com o cpf: '+@cpf

END;

exec usp_atualizaSalario @cpf = '98765432288', @salarioNovo = '15000.00'
```
#### Crie um procedure que insira um novo funcionário no banco
```SQL
CREATE PROCEDURE usp_inserirFuncionarioNovo 
	(@Pnome varchar(15),
	@Minicial char,
	@Unome varchar(15),
	@cpf varchar(11),
	@datanasc date,
	@Endereco VARCHAR(255),
	@sexo char )
AS 
BEGIN 
	INSERT INTO FUNCIONARIO VALUES (@Pnome ,@Minicial, @Unome, @cpf ,@datanasc,@Endereco ,@sexo, null, null, null,null,null  )
END;

EXEC usp_inserirFuncionarioNovo 'vanessa','C','Nascimento','00011122233','2002-12-02','rua maq. lucas, sm,rs,br','F' 
SELECT * FROM FUNCIONARIO
```
#### Crie um procedure que insira um novo funcionário mas antes verifique se já não existe um funcionário com o mesmo nome (nome completo).
```SQL
ALTER PROCEDURE usp_inserirFuncionarioNovo 
	(@Pnome varchar(15),
	@Minicial char,
	@Unome varchar(15),
	@cpf varchar(11),
	@datanasc date,
	@Endereco VARCHAR(255),
	@sexo char )
AS 
BEGIN 
	IF EXISTS(SELECT *
			  FROM FUNCIONARIO AS F
			  WHERE F.Pnome = @Pnome and F.Minicial = @Minicial  and f.Unome = @Unome
			  )
	begin
		print 'Já exite um funcionario com esse nome: ' + CONCAT (@Pnome,' ',@Minicial,' ', @Unome)
		return -- funciona como um break
	end
	INSERT INTO FUNCIONARIO VALUES 
	(@Pnome ,@Minicial, @Unome, @cpf ,@datanasc,@Endereco ,@sexo, null, null, null,null,null  )
END;

EXEC usp_inserirFuncionarioNovo 'vanessa','C','Nascimento','00011122233','2002-12-02','rua maq. lucas, sm,rs,br','F' 
EXEC usp_inserirFuncionarioNovo 'Luiza','L','Karlec','00011122244','2004-10-27','JOBIM, sm,rs,br','F' 
EXEC usp_inserirFuncionarioNovo 'Guilherme','F','Rolim','00011133344','2006-01-20','Duque, sm,rs,br','M' 

```

#### Crie um procedure que insira um novo departamento com sua respectiva localidade
```SQL
ALTER PROCEDURE usp_inserirDepartamento
	 @Dnome VARCHAR(15),
     @Dnumero INT,
     @Dlocal varchar(15)
AS
BEGIN
    IF EXISTS (select * 
               from DEPARTAMENTO as D 
               WHERE D.Dnome = @Dnome)
    BEGIN
        INSERT INTO LOCALIZACAO_DEP (Dnumero,Dlocal)
    VALUES (@Dnumero, @Dlocal)
    END;

    INSERT INTO DEPARTAMENTO  (Dnome, Dnumero)
    VALUES (@Dnome, @Dnumero)
    INSERT INTO LOCALIZACAO_DEP (Dnumero,Dlocal)
    VALUES (@Dnumero, @Dlocal)
END;

EXEC usp_inserirDepartamento 'Salao', 11,'UFN - 3'
-- se já existir um departamento com esse nome, é adicionado apenas o novo local
```

#### Crie um procedure que faz uma listagem dos funcionários por departamento, mas se o departamento não for especificado, o procedimento lista todos os funcionarios
```sql
ALTER PROCEDURE usp_Funcionario_por_Departamento (@departamento varchar (150) = null )
AS 
BEGIN
	IF @departamento IS  NULL or @departamento = ''
		BEGIN
			select CONCAT (F.Pnome,' ',F.Minicial,' ', f.Unome) as Funcionario, D.Dnome AS Departamento
			from FUNCIONARIO as F
			FULL join DEPARTAMENTO AS D
			ON F.Dnr = D.Dnumero
		END;
	ELSE
		BEGIN
			select CONCAT (F.Pnome,' ',F.Minicial,' ', f.Unome) as Funcionario, D.Dnome AS Departamento
			from FUNCIONARIO as F
			FULL join DEPARTAMENTO AS D
			ON F.Dnr = D.Dnumero
			WHERE D.Dnome = @departamento
		END;
		
END

exec usp_Funcionario_por_Departamento ' '
exec usp_Funcionario_por_Departamento 'Pesquisa'

```
### PARÂMETROS DE SAÍDA
- habilitam um procedimento armazenado a retornar dados ao procedimento chamado
- é como se fosse uma variável compartilhada entre o procedure e quem chamou o procedure
- utilizado a palavrachave OUTPUT quando o procedimento é criado e também quando é chamadao 
- No procedimento armazenado, o procedimento de saída aparece como uma variável local --> é atribido um valor a esse parâmetro
- no procedimento chamador, uma variável deve ser criada para receber o parâmetro de saída --> recupera o valor
- 
```sql
CREATE PROCEDURE usp_dobro (@valor as INT OUTPUT)
AS
SELECT @valor*2
RETURN

--testando o procedimento
DECLARE @custo as INT = 15
EXEC usp_dobro @custo OUTPUT
print @custo8
```
#### crie uma procedure que retorna o nome completo de um funcionario com base no CPF passado como parâmetro de entrada
```SQL
CREATE PROCEDURE usp_retornsNomeCompleto(@cpf VARCHAR(11), @nome as VARCHAR(25) OUTPUT)
AS
begin
	SELECT CONCAT (F.Pnome,' ',F.Minicial,' ',F.Unome)
	FROM FUNCIONARIO AS F
	WHERE F.Cpf = @cpf
	RETURN @nome
END

DECLARE @nomecompleto AS VARCHAR(25)
EXEC usp_retornsNomeCompleto @cpf = '12312312311',@nome = @nomecompleto  OUTPUT
print @nomecompleto
```
### COMANDO RETURN
- termina incondicionalmente o procedimento e retorna um valor inteiro ao chamador
- pode ser usado para retornar status de sucesso ou falha de procedimento
 
