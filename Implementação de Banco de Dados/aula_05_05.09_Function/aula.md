# FUNCTION - funções
- no SQL funções permitem encapsular lógicas de processamento que podem ser reutilizadas em consultas
- retornam **obrigatoriamente** um valor (escalar ou tabela(conjunto de valores))
- podem ser usadas diretamente em instruções SELECT, WHERE,...
## TIPOS DE FUNÇÕES
### FUNÇÕES ESCALARES
- retornam um único valor (ex: número, string, data)
```sql
CREATE FUNCTION fn_Dobro(@Numero INT)
RETURNS INT 
AS
BEGIN
	RETURN @Numero*2;
END
```
```sql
-- USANDO FUNÇÃO 
--DIRETAMETNE NO SELECT
SELECT dbo.fn_Dobro(5) AS 'RESULTADO';

-- EM CONJUNTO COM UMA TABELA DE EXEMPLO
SELECT F.Pnome, F.Unome, F.Salario, dbo.fn_Dobro(F.Salario) AS 'dobro'
FROM FUNCIONARIO AS F
```
#### criar uma função que calcula a idade de um funcionario com base na data de nascimento

```sql
CREATE FUNCTION fn_CalculaIdade(@DataNasc DATE)
RETURNS INT
AS 
BEGIN
	DECLARE @Idade INT;
	SET @Idade = DATEDIFF(YEAR, @DataNasc, GETDATE());
	IF(MONTH(@DataNasc) > MONTH(GETDATE()) 
		OR (MONTH(@DataNasc) = MONTH(GETDATE())
		AND DAY(@DataNasc) > DAY(GETDATE())))
		SET @Idade = @Idade -1;
	RETURN @Idade
END;
-- testando a função
GO 
SELECT F.Pnome, F.Datanasc, dbo.fn_CalculaIdade(F.Datanasc)
FROM FUNCIONARIO AS F
```
### FUNÇÕES DE TABELA - INLINE
- retornam uma tabela como resultado de uma query
#### retornar todos os funcionarios de um determinado departamento

```sql
CREATE FUNCTION fn_FuncionarioPorDepartamento(@Nome VARCHAR(15))
RETURNS TABLE
AS 
RETURN
(
	SELECT F.Pnome, F.Unome, F.Salario
	FROM FUNCIONARIO AS F
	INNER JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
	WHERE D.Dnome = @Nome
);

GO
SELECT * 
FROM dbo.fn_FuncionarioPorDepartamento('Pesquisa');

```
### FUNÇÕES DE TABELA - MULTI-STATEMENT
- retornam uma tabela construída dentro da função com múltiplas instruções
#### CRIAR UMA FUNÇÃO QUE RETORNA NOME COMPLETO DOS FUNCIONARIOS E O VALOR DO SALARIO ANUAL
```sql
CREATE FUNCTION fn_SalarioAnual ()
RETURNS @Tabela TABLE
(
	nomeCompleto VARCHAR(100),
	salarioMensal DECIMAL(10,2),
	salarioAnual DECIMAL(12,2)
)
AS
BEGIN
	INSERT INTO @Tabela
	SELECT
		CONCAT(F.Pnome,' ',F.Minicial, ' ',F.Unome),
		F.Salario,
		F.Salario * 12
	FROM FUNCIONARIO AS F
	RETURN;
END;

GO 
SELECT * FROM fn_
```
