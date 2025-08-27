# SQL Join
<img width="1135" height="764" alt="{89678A88-0251-4509-ADEB-3116132223F4}" src="https://github.com/user-attachments/assets/5fba46e0-a006-4f34-940d-fc0b11bd2aec" />

- A cláusula JOIN é usada para combinar linhas de duas ou mais tabelas, com base em uma coluna relacionada entre elas
- join = juntando dados de duas tabelas
- exemplos uma tabela (circulo) é de funcionario e o outro é departamentos
<div align="center">
  <img width="817" height="198" alt="{7ACC1372-219A-4D8F-8F6C-B86BFDDDD5D5}" src="https://github.com/user-attachments/assets/48184007-5771-4c55-9030-b9648edad369" />
  <img width="546" height="427" alt="image" src="https://github.com/user-attachments/assets/6288cbe9-ddce-4d59-9d7b-aa3ade32d483" />

</div>

## TIPOS DE JOINS SUPORTADOS NO MySQL
### INNER JOIN
- recupera os dados em comuns,intersecção, departamentos que tem funcionario e os funcionarios que estão em algum departamento
- seleciona registros que têm valores correspondentes em ambas as tabelas
- inner join seleciona todas as linhas de ambas as tabelas, desde que haja uma correspondência entre as colunas
- na consulta tem ON = ponto de interseção das tabelas, 
```sql
  SELECT nomeColuna
  FROM tabela1
  INNER JOIN tabela2
  ON tabela1.nomeColuna1 = tabela2.nomeColuna2
```
### LEFT JOIN
- retornar todos elemento do grupo esquerdo, nesse exemplo todos os funcionario, aqueles que não tem um departamento o campo fica null
- retorna todos os registros da tabela à esquerda(tabela1) e os registros correspondentes(se houver) da tabela à direita (tabela2)
```SQL
  SELECT nomeColuna
  FROM tabela1
  LEFT JOIN tabela2
  ON tabela1.nomeColuna1 = tabela2.nomeColuna2
```

### RIGHT JOIN
- retorna todos os departamentos, tanto os que tem funcionario, tanto os que não tem 
- retorna todos os registros da tabela da direita e os registro correpondentes(se houver) da tabela da esquerda
```SQL
  SELECT nomeColuna
  FROM tabela1
  RIGHT JOIN tabela2
  ON tabela1.nomeColuna1 = tabela2.nomeColuna2
```
### CROSS/FULL JOIN
- retorna todos os registros de ambas as tabelas
- NO SQL Server usa p full
```SQL
  SELECT nomeColuna
  FROM tabela1
  FULL JOIN tabela2
  ON tabela1.nomeColuna1 = tabela2.nomeColuna2
```
### SELF JOIN
- obrigatorio o uso do AS
- uma junção automática é uma junção regular, mas a tabela é unida a si mesma
```SQL
  SELECT nomeColuna
  FROM tabela1 AS T1 
  FULL JOIN tabela2 AS T2
  ON T1.nomeColuna1 = T2.nomeColuna2
```

### SQL UNION
- o operador UNION é usado para combinar o conjunto de resultados de duas ou mais instruções SELECT
- cada instrução SELECT dentro de UNION deve ter o **mesmo número de colunas**
- as colunas também devem ter **tipos de dados semelhantes**
- as colunas em cada instrução SELECT também devem estar na mesma ordem
- seleciona somente valores distintos
- não salvam duplicatas
```sql
  SELECT nomeColuna1
  FROM tabela1
  UNION
  SELECT nomeColuna2
  FROM tabela2
```
#### UNION ALL
- permite valores duplicados
```sql
  SELECT nomeColuna1
  FROM tabela1
  UNION ALL
  SELECT nomeColuna2
  FROM tabela2
```

### SQL EXCEPT
- valores que estão na primeira tabela e não estão na segunda
```sql
  SELECT nomeColuna1
  FROM tabela1
  EXCEPT
  SELECT nomeColuna2
  FROM tabela2
```
### SQL INTERSECT
- valores que estão nas duas tabelas sem duplicatas
```sql
  SELECT nomeColuna1
  FROM tabela1
  INTERSECT
  SELECT nomeColuna2
  FROM tabela2
```
## SQL GROUP BY
- agrupa linhas com os mesmos valores em linhas de resumo, como "encontre o número de clientes em cada país"
- é frequentemente usada com funções agregadas (COUNT(),MAX(),MIN(),SUM(),AVG()) para agrupar o conjunto de resultados por uma ou mais colunas
```SQL
  SELECT nomeColuna
  FROM tabela1 
  WHERE condição
  GROUP BY nomeColuna
```

## SQL cláusula HAVING
- foi adicionada ao SQL porque a palavra-chave WHERE não pode ser usada com funções agregadas
```SQL
  SELECT nomeColuna
  FROM tabela1 
  WHERE condição
  GROUP BY nomeColuna
  HAVING condição
  GROUP BY nomeColuna
```

## SQL Operador EXISTS
- é usado para testar a existência de qualquer registro em uma subconsulta
- retorna TRUE se a subconsulta retornar um ou mais registros
```SQL
  SELECT nomeColuna
  FROM tabela1 
  WHERE EXISTS
  (SELECT nomeColuna FROM tabela WHERE condição)
```
## SQL Operadores ANY e ALL
- permitem realizar uma comparação entre um único valor de coluna e um intervalo de outros valores
#### ANY
- retorna um valor booleano como resultado
- retorna TRUE se QUALQUER um dos valores da suconsulta atender à condição
- significa que a condição será verdadeira se a operação for verdadeira para qualquer um dos valores no intervalo
```SQL
  SELECT nomeColuna
  FROM tabela1 
  WHERE nomeColuna operator ANY
    (SELECT nomeColuna
    FROM tabela
    WHERE condição)
```
#### ALL
- retorna um valor booleano como resultado
- retorna TRUE se TODOS os valores da suconsulta atenderem à condição
- é usado com instruções SELECT, WHERE e HAVING
- significa que a condição será verdadeira se a operação for verdadeira para todos os valores no intervalo
```SQL
  SELECT ALL nomeColuna
  FROM tabela1 
  WHERE condição
```
```SQL
  SELECT nomeColuna
  FROM tabela1 
  WHERE nomeColuna operator ALL
    (SELECT nomeColuna
    FROM tabela
    WHERE condição)
```


