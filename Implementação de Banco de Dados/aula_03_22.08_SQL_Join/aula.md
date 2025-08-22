# SQL Join
<img width="1135" height="764" alt="{89678A88-0251-4509-ADEB-3116132223F4}" src="https://github.com/user-attachments/assets/5fba46e0-a006-4f34-940d-fc0b11bd2aec" />


- A cláusula JOIN é usada para combinar linhas de duas ou mais tabelas, com base em uma coluna relacionada entre elas
- join = juntando dados de duas tabelas
- exemplos uma tabela (circulo) é de funcionario e o outro é departamentos
<div align="center">
  <img width="817" height="198" alt="{7ACC1372-219A-4D8F-8F6C-B86BFDDDD5D5}" src="https://github.com/user-attachments/assets/48184007-5771-4c55-9030-b9648edad369" />
</div>

- INNER Join = recupera os dados em comuns,intersecção, departamentos que tem funcionario e os funcionarios que estão em algum departamento
- LEFT Join = retornar todos elemento do grupo esquerdo, nesse exemplo todos os funcionario, aqueles que não tem um departamento o campo fica null
- RIGHT Join = retorna todos os departamentos, tanto os que tem funcionario, tanto os que não tem 
- CROSS Join ou FULL Join = retorna tudo, todos os funcionarios, com ou sem departamento e todos os departametnos, com ou sem funcionario.

<div align="center">
  <img width="536" height="408" alt="{3BA74192-1D33-4A6F-B6F5-81C9E619C5F9}" src="https://github.com/user-attachments/assets/20291a37-ef38-470c-82da-2cfcc9794e21" />
</div>

## TIPOS DE JOINS SUPORTADOS NO MySQL
### INNER JOIN
- seleciona registros que têm valores correspo
- na consulta tem ON = ponto de interseção das tabelas, 
```.SQL

```
### LEFT JOIN
- retorna todos os registros da tabela à esquerda(tabela1) e os registros correspondentes(se houver) da tabela à direita (tabela2)
```.SQL

```

### RIGHT JOIN
- retorna todos os registros da tabela

### CROSS/FULL JOIN
- NO SQL Server usa p full

### SELF JOIN
- obrigatorio o uso do AS

## SQL UNION/INTERSECT/EXCEPT

### SQL UNION
- o operador UNION é usado para combinar o conjunto de resultados de duas ou mais instruções SELECT
- cada instrução SELECT dentro de UNION deve ter o **mesmo número de colunas**
- as colunas também devem ter **tipos de dados semelhantes**
- as colunas em cada instrução SELECT também devem estar na mesma ordem
- não salvam duplicatas
```.sql
```
#### UNION ALL
- permite valores duplicados
```.sql
```

### SQL EXCEPT
- valores que estão na primeira tabela e não estão na segunda

### SQL INTERSECT
- valores que estão nas duas tabelas sem duplicatas

## SQL GROUP BY
- agrupa linha com os mesmos valores em linhas de resumo, como "encontre o número de clientes em cada país"
- é frequentemente usada com funções agregadas (COUNT(),MAX(),MIN(),SUM(),AVG()) para agrupar o conjunto de resultados por uma ou mais colunas

## SQL cláusula HAVING
- foi adicionada ao SQL porque a palavra-chave WHERE não pode ser usada com funções agregadas

## SQL Operador EXISTS

## SQL Operadores ANY e ALL
