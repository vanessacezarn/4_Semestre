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


-- CONSULTAS REALIZADAS EM AULA 

-- DISTINCT : Liste as diferentes faixas salariais dos funcionários.
SELECT DISTINCT F.Salario
FROM FUNCIONARIO as F;

select * from FUNCIONARIO;

-- WHERE : Recupere todas as informações do(s) funcionais com primeiro nome “João”.
SELECT *
FROM FUNCIONARIO as F
WHERE f.Pnome = 'João';

-- WHERE : Recupere todas as informações do(s) funcionais que tem salario menor ou igual a 30000

SELECT *
FROM FUNCIONARIO as F
WHERE f.Salario <= 30000;


