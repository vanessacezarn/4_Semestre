# Consultas Complexas
- utilizar EMPRESA.sql disponivel na github do professor
## Consultas de recuperação básicas em SQL
- SQL tem uma instrução básica para recuperar informações de um banco de dados ➔ SELECT
### A estrutura SELECT-FROM-WHERE das consultas sql básicas
- forma básica do comando SELECT ➔ composta por três cláusulas
```sql
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
|  +=  | add equals |
|  -=  | subtract equals |
|  *=  | multiply equals | 
|  /= |  divide equals |
|  %= |  modulo equals | 
|  &= | bitwise AND equals  |
|  ^-= |  bitwise exclusive equals  |
|  I*= |  bitwise OR equals  |
### SQL Logical Operators - Operadores Lógicos
| Operador|  Descrição | 
| :-------: | :----------: | 
|  ALL  | verdadeiro se todos os valores da subconsulta atenderem à condição  |
|  AND  | verdadeiro se todas as condições separadas por E forem verdadeira |
|  ANY  | verdadeiro se qualquer um dos valores da subconsulta atender à condição | 
|  BETWEEN | verdadeiro se o operando estiver dentro do intervalo de comparações |
|  EXISTS | verdadeiro se a subconsulta retornar um ou mais registros  | 
|  IN | verdadeiro se o operando for igual a uma de uma lista de expressões |
|  LIKE | verdadeiro se o operador corresponder a um padrão |
|  NOT | exibe um registro se a(s) condição(ões) não for(em) verdadeiras |
|  OR | verdadeiro se qualquer uma das condições sepearadas por OU for verdadeira |
|  SOME | verdadeiro se qualquer um dos valores da subconsulta atender à condição |

## SQL SELECT DISTINCT
- usada para retornar apenas valores distintos (diferentes)
  
```sql
	SELECT DISTINCT coluna
	FROM tabela;
```
## SQL cláusula WHERE
- utilizada para filtrar registros
- usada para extrair apenas os registros que atendem a uma condição especificada
```sql
	SELECT coluna
	FROM tabela
	WHERE condição;
```
### SQL AND, OR, and NOT
- a cláusula WHERE pode ser combinada com operadores AND, OR e NOT
- AND e OR são usados para filtrar registros com base em mais de uma condição
#### AND
- exibe um registro se todas as condições separadas por AND forem TRUE
```sql
	SELECT coluna
	FROM tabela
	WHERE condição AND condição2;
```
#### OR
- exibe um registro se alguma das condições separadas por OR forem TRUE
```sql
	SELECT coluna
	FROM tabela
	WHERE condição OR condição2;
```
#### NOT
- exibe um registro se todas as condições forem NOT TRUE
```sql
	SELECT coluna
	FROM tabela
	WHERE NOT condição ;
```
## SQL ORDER BY
- usado para classificar o conjunto de resultados em ordem ascendente ou descendentes
- quando tem restrição é usado depois do WHERE
- ASC : crescente ➔ quando não está especificado esse é o padrão
- DESC :  decrecente
```sql
	SELECT coluna
	FROM tabela
	ORDER BY coluna ASC|DESC
```
## SQL Valores NULL
- campo com um valor NULL é um campo sem valor, que foi deixado em branco durante a criação do registro
- valor NULL é diferente de um valor 0 ou de um campo que contém espaços
- IS NULL
```.sql
	SELECT coluna
	FROM tabela
	WHERE coluna IS NULL ;
```
- IS NOT NULL
```sql
	SELECT coluna
	FROM tabela
	WHERE coluna IS NOT NULL ;
```

## SQL Cláusula SELECT TOP/LIMIT
- usada para especificar o número de registro a serem retornados, por exemplo os 3 primeiros
- é útil em tabelas grandes com milhares de registros
- dependendo do banco é chamado de LIMIT
```sql
	SELECT coluna
	FROM tabela
	WHERE coluna
	LIMITIS number;
```
## SQL Função MIN() e MAX()
- A função MIN() retorna o valor mais baixo da coluna selecionada.
```sql
	SELECT MIN(coluna)
	FROM tabela
	WHERE condição ;
```
- A função MAX() retorna o valor mais alto da coluna selecionada.
```sql
	SELECT MAX(coluna)
	FROM tabela
	WHERE condição ;
```
### SELECT aninhado
- SELECT dentro de outro SELECT
- pode ser usado tanto em WHERE tanto no proprio SELECT
```SQL
SELECT *
FROM FUNCIONARIO as F
WHERE F.Salario = (SELECT MIN(F.salario) FROM FUNCIONARIO as F)
```
```sql
SELECT
	(SELECT COUNT(*) FROM FUNCIONARIO) as Nr_Funcionario,
	(SELECT COUNT(*) FROM DEPENDENTE) as Nr_Dependentes, 
	(SELECT COUNT(*) FROM FUNCIONARIO) + (SELECT COUNT(*) FROM DEPENDENTE) as Total;
```

## SQL funções COUNT(), AVG() e SUM()
- COUNT( ) = retorna o número de linhas que correspondem a um critério especificado.
```sql
	SELECT COUNT(coluna)
	FROM tabela
	WHERE condição ;
```
- AVG( ) = retorna o valor médio de uma coluna numérica.
```sql
	SELECT AVG(coluna)
	FROM tabela
	WHERE condição ;
```
- SUM( ) = retorna a soma total de uma coluna numérica.
```sql
	SELECT SUM(coluna)
	FROM tabela
	WHERE condição ;
```

## SQL Operador LIKE
- é usado em uma cláusula WHERE para pesquisar um padrão específico em uma coluna
- existe dois curinga comumente usados em conjunto com operador LIKE
	- % ➔ representa zero, um ou vários caracteres
    - _ ➔ representa um único caractere
      
| Operador LIKE|  Descrição | 
| :-------: | :----------: | 
|  WHERE coluna LIKE 'a%'  | encontrar quaisquer valores que comecem com "a" |
| WHERE coluna LIKE '%a'   | encontrar quaisquer valores que terminam com "a" |
| WHERE coluna LIKE '%ou%'   | encontrar quaisquer valores que tenham "ou" em qualquer posição | 
| WHERE coluna LIKE '_r%'  | encontrar quaisquer valores que tenha "r" na segunda posição |
| WHERE coluna LIKE 'a_%'   | encontrar quaisquer valores que comecem com "a" e tenham pelo menos 2 caracteres de comprimento | 
| WHERE coluna LIKE 'a__%'   | encontrar quaisquer valores que comecem com "a" e tenham pelo menos 3 caracteres de comprimento | 
| WHERE coluna LIKE 'a%o'   | encontrar quaisquer valores que comecem com "a" e terminem com "o" | 

## SQL Operador IN
- permite que você especifique vários valores em uma cláusula WHERE
- é uma forma abreviada para múltipla condições OR
```sql
	SELECT coluna
	FROM tabela
	WHERE condição IN (valor) ;
```
## SQL Operador BETWEEN
- seleciona valores dentro de um determinado intervalo, os valores podem ser números, texto ou datas
- é inclusivo, os valores de início e fim estão incluídos
```sql
	SELECT coluna
	FROM tabela
	WHERE coluna BETWEEN valor AND  valor2;
```

## SQL Aliases
- são usados para dar um nome temporário a uma tabela ou a uma coluna em uma tabela
- os aliases são frequentemente usados para tornar os nomes das colunas mais legíveis
- um alias existe apenas durante a execução daquela consulta
- um alias é criado com a palavra-chave AS
```sql
	SELECT coluna AS col
	FROM tabela
```
```sql
	SELECT coluna 
	FROM tabela AS T
```
