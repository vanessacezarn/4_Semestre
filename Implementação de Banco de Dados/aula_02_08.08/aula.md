# Consultas Complexas
- utilizar EMPRESA.sql disponivel na github do professor
```.sql

```
## Consultas de recuperação básicas em SQL
## A estrutura SELECT-FROM-WHERE das consultas sql básicas
## SQL Arithmetic Operators

| Operador|  Descrição | 
| ------- | ---------- | 
|    +    |     Add    |

## SQL Bitwise Operators - Operadores Bitwise

| Operador|  Descrição | 
| ------- | ---------- | 
|    &    | Bitwise ADD |
|    |    | Bitwise OR |
|    ^    | Bitwise exclusive OR |

## SQL Comparison Operators - Operadores de Comparação
## SQL Compound Operators - Operadores Compostos
## SQL Logical Operators - Operadores Lógicos
## SQL SELECT DISTINCT
- usada para retornar apenas valores distintos (diferentes)
## SQL cláusula WHERE
- utilizada para filtrar registros
- usada para extrair apenas os registros que 
## SQL AND, OR, and NOT
-
## SQL ORDER BY
- quando tem restrição é usado depois do WHERE
- ASC
- DESC :  decrecente

## SQL Valores NULL
- IS NULL
- IS NOT NULL

## SQL Cláusula SELECT TOP
- recuperar um numero especifico de registro, por exemplo os 3 primeiros
- dependendo do banco é chamado de LIMIT

## SQL Função MIN() e MAX()
- A função MIN() retorna o valor mais baixo da coluna selecionada.
- A função MAX() retorna o valor mais alto da coluna selecionada.
### SELECT aninhado
- SELECT dentro de outro SELECT
- pode ser ussando tanto em WHERE tanto no proprio SELECT
```.SQL
SELECT *
FROM FUNCIONARIO as F
WHERE F.Salario = (SELECT MIN(F.salario) FROM FUNCIONARIO as F)
```
```.sql
SELECT
	(SELECT COUNT(*) FROM FUNCIONARIO) as Nr_Funcionario,
	(SELECT COUNT(*) FROM DEPENDENTE) as Nr_Dependentes, 
	(SELECT COUNT(*) FROM FUNCIONARIO) + (SELECT COUNT(*) FROM DEPENDENTE) as Total;
```

## SQL funções COUNT(), AVG() e SUM()
- COUNT() = retorna o valor médio de uma coluna numérica.
- AVG() = retorna o valor médio de uma coluna numérica.
- SUM() = retorna a soma total de uma coluna numérica.

## SQL Operador LIKE
