# Consultas Complexas
- utilizar EMPRESA.sql disponivel na github do professor
## Consultas de recuperação básicas em SQL
- SQL tem uma instrução básica para recuperar informações de um banco de dados ➔ SELECT
### A estrutura SELECT-FROM-WHERE das consultas sql básicas
- forma básica do comando SELECT ➔ composta por três cláusulas
```.sql
	SELECT <listaAtributos>
	FROM <listaTAbela>
	WHERE <condição>;
```
## SQL 

### Arithmetic Operators
| Operador|  Descrição |   
| :-------: | :--------: |
|    +    |     Add      | 
|    -    |     Subtract | 
|    *    |     Multiply | 
|    /    |     Divide   | 
|    %    |     Modulo   | 

### Bitwise Operators - Operadores Bitwise
| Operador|  Descrição | 
| :-------: | :----------: | 
|    &    | Bitwise ADD |
|    I    | Bitwise OR |
|    ^    | Bitwise exclusive OR |

### Comparison Operators - Operadores de Comparação
| Operador|  Descrição | 
| :-------: | :----------: | 
|  =  | igual |
|  >  | maior |
|  <  | menor | 
|  >= | maior igual |
|  <= | menor igual | 
|  <> | não é igual |

### SQL Compound Operators - Operadores Compostos
| Operador|  Descrição | 
| :-------: | :----------: | 
|  +=  |  |
|  -=  |  |
|  *=  |  | 
|  /= |   |
|  %= |   | 
|  &= |   |
|  ^-= |   |
|  I*= |   |
### SQL Logical Operators - Operadores Lógicos
| Operador|  Descrição | 
| :-------: | :----------: | 
|  ALL  |  |
|  AND  |  |
|  ANY  |  | 
|  BETWEEN |   |
|  EXISTS |   | 
|  IN |   |
|  LIKE |   |
|  NOT |   |
|  OR |   |
|  SOME |   |

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
