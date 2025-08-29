# VARIÁVEIS - SQL SERVER
- variáveis podem ser decladas no corpo de um batch ou procedimento
- são inicializadas por padrão como NULL
- para atribuir-lhes valores usa-se declarações SET ou SELECT
### Declaração de Variáveis
```sql
DECLARE @nome tipo
-- exemplo
DECLARE @idade INT,
        @nome varchar(40),
        @data DATE,
        @grana MONEY;
```
### Atribuir valores com SET
```sql
SET @nome = valor
-- exemplo
SET @nome = 'Vanessa Cezar';
SET @data = '2002-12-02';
SET @grana = 5;
SET @idade = YEAR(GETDATE()) - YEAR(@data);   
```
* atributo idade não tem valor definido pois muda com frequência, ela deve ser calculada a partir do ano de nascimento

### Exibir valores da consulta 
```sql
SELECT @nome AS 'Nome', @data AS 'Data_Nascimento',
	   @idade as 'Idade', @grana as 'Dinheiro';

PRINT 'Meu nome é: ' + @nome + ',nascido em: '+ CAST(@data AS VARCHAR (11));
```
* tem que selecionar tudo desde a declaração das variaveis
* CAST() converte de data para VARCHAR, ou tipo desejado,

### Atribuir valor com SELECT
##### Recuperar o nome do departamento com Dnumero = 4
```sql
DECLARE @departamento varchar(40);

SELECT @departamento = D.Dnome
FROM DEPARTAMENTO AS D
WHERE D.Dnumero = 4;

PRINT @departamento;
```
### Exemplo com cálculo
##### Calculando o novo salário com um aumento de 10% para Jennifer
```sql
DECLARE @salarioJennifer DECIMAL(10,2);;
DECLARE @salarioNovo DECIMAL(10,2);
DECLARE @nome_Funcionario VARCHAR(20);

SET @nome_Funcionario = 'Jennifer';

SELECT @salarioJennifer = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_Funcionario

PRINT 'Salario inicial : '+ CAST(@salarioJennifer AS VARCHAR(20));
SET @salarioNovo = @salarioJennifer * 1.1;
PRINT 'Salario com reajuste de 10% : '+ CAST(@salarioNovo AS VARCHAR(20));
```
##### Calculando a idade de Jennifer
```sql
DECLARE @nome_Fun VARCHAR(20),
		@data_n DATE,
		@idade_Jen INT;
SET @nome_Fun = 'Jennifer';

SELECT @data_n = F.Datanasc
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_Fun

SET @idade_Jen = YEAR(GETDATE()) - YEAR(@data_n);
PRINT 'A funcionaria '+@nome_Fun + 'tem a idade de '+ CAST(@idade_Jen AS VARCHAR(20)) + ' idade';
```

# CONVERSÕES DE DADOS
- para converter expressões de um tipo de dado em outro no SQL usando funções CAST ou CONVERT
### CAST
```sql
DECLARE @salarioJennifer DECIMAL(10,2);;
DECLARE @nome_Funcionario VARCHAR(20);
SET @nome_Funcionario = 'Jennifer';

SELECT @salarioJennifer = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_Funcionario

PRINT 'Salario inicial : '+ CAST(@salarioJennifer AS VARCHAR(20));
```
### CONVERT
- **estilo**
- trabalhando com datas
```sql
DECLARE @salarioJenni DECIMAL(10,2);
DECLARE @nome_F VARCHAR(20), @data_nas DATE;
SET @nome_F = 'Jennifer';

SELECT @salarioJenni = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_F

SELECT @data_nas = F.Datanasc
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_F

PRINT 'Salario de Jennifer : '+ CONVERT(VARCHAR(20),@salarioJenni );
PRINT @data_nas;
PRINT CONVERT (VARCHAR(10), @data_nas,103);
```
# IF - ELSE
- BEGIN E END quando tiver mais que uma linha de comando
##### Vericar se um funcionario recebe abaixo da media salarial
```sql
DECLARE @media DECIMAL(10,2);
SELECT @media = AVG(F.Salario)
FROM FUNCIONARIO AS F;

DECLARE @salarioJeni DECIMAL(10,2);
SELECT @salarioJeni = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Jennifer';

IF @salarioJeni < @media
	BEGIN
		PRINT 'SALARIO ABAIXO DA MEDIA';
	END
ELSE
	PRINT 'SALARIO ACIMA DA MEDIA';
```
##### Verificar se um Funcionário Está Próximo da Aposentadoria, considerar a idade para aposentadoria de 60 anos e acima de 80 aposentadoria Compulsoria
```sql
DECLARE @idades INT;
DECLARE @nasc DATE;

SELECT @nasc = F.Datanasc
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'João';

set @idades =  YEAR(GETDATE()) - YEAR(@nasc);
print CAST(@idades AS VARCHAR(20));

IF @idades BETWEEN 55 and 65
	PRINT 'Proximo a aposentadoria'
ELSE IF @idades > 80
	PRINT 'Aposentadoria compulsoria';
ELSE 
	PRINT 'Não esta perto da aposentadoria'

-- CALCULAR A IDADE DE TODOS NO BANCO
SELECT F.Pnome, YEAR(GETDATE()) - YEAR(F.Datanasc)
FROM FUNCIONARIO AS F
```
##### Verificar se um Funcionário Já Recebeu Bônus Este Ano
```sql
DECLARE @bonus DECIMAL (10,2);

SELECT @bonus = F.Bonus
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Carlos';

IF @bonus IS NOT NULL AND @bonus > 0
	print 'Recebeu bonus esse ano'
ELSE
	print 'Não recebeu bonus esse ano'

```
# WHILE
```sql
```
