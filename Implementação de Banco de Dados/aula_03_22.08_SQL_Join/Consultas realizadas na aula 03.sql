-- CONSULTAS AULA 03 - SQL JOIN | 22/08/25 | VANESSA CEZAR DO NASCIMENTO
USE EMPRESA;

--INNER JOIN 
-- Selecionar o primeiro nome, último nome, endereço dos funcionários que trabalham no departamento de “Pesquisa”.
SELECT F.Pnome, F.Unome, F.Endereco, D.Dnome
FROM FUNCIONARIO AS F
INNER JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'Pesquisa';

-- Liste o nome dos funcionários que estão desenvolvendo o “ProdutoX”. 
SELECT F.Pnome,F.Unome, p.Projnome
FROM FUNCIONARIO AS F
INNER JOIN TRABALHA_EM AS TE
ON TE.Fcpf = F.Cpf
INNER JOIN PROJETO AS P
ON TE.Pnr = P.Projnumero
WHERE P.Projnome = 'ProdutoX';

-- Para cada projeto localizado em “Mauá”, liste o número do projeto, o número do departamento que o controla e o sobrenome, endereço e data de nascimento do gerente do departamento.
SELECT P.Projnumero, P.Dnum, F.Unome, F.Endereco, F.Datanasc
FROM PROJETO AS P 
INNER JOIN DEPARTAMENTO AS D
ON P.Dnum = D.Dnumero
INNER JOIN FUNCIONARIO AS F
ON D.Cpf_gerente = F.Cpf
WHERE P.Projlocal = 'Mauá';

-- LEFT JOIN
-- Liste o último nome de TODOS os funcionários e o último nome dos respectivos gerentes, caso possuam
SELECT F.Unome as Funcionario, S.Unome as Supervisor
FROM FUNCIONARIO AS F
LEFT JOIN FUNCIONARIO AS S -- tabela dos supervisores/gerentes
ON F.Cpf_supervisor = S.Cpf
-- autorelacionamento, a tabela funcionario esta sendo comparada a ela mesma 

-- Encontre os departamentos que não possuem funcionarios a eles vinculados
SELECT D.Dnome, D.Dnumero
FROM DEPARTAMENTO AS D
LEFT JOIN FUNCIONARIO as F
ON D.Dnumero = F.Dnr
WHERE F.Dnr is NULL;

-- Encontre os funcionario que não possuem um departamento a eles vinculados
SELECT *
FROM FUNCIONARIO AS F
LEFT JOIN DEPARTAMENTO AS D
ON D.Dnumero = F.Dnr
WHERE F.Dnr is NULL;

-- RIGHT JOIN 
-- Encontre os departamentos que não possuem nenhum funcionário
SELECT D.Dnome
FROM FUNCIONARIO AS F
RIGHT JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
WHERE F.Cpf is null;

-- CROSS ou FULL JOIN
SELECT *
FROM FUNCIONARIO AS F
FULL JOIN DEPARTAMENTO AS D
ON  F.Dnr = D.Dnumero

-- UNION,
-- Listar todos os nomes, sexo e data de nascimento de todas as pessoas do banco.
SELECT F.Pnome, F.Sexo, F.Datanasc
FROM FUNCIONARIO as F
UNION
SELECT D.Nome_dependente,D.Sexo,D.Datanasc
FROM DEPENDENTE as D

-- Imagine que a diretoria da empresa quer uma lista de todas as cidades onde a empresa possui
-- alguma atividade, seja a localização de um departamento ou a localização de um projeto.
SELECT P.Projlocal
FROM PROJETO AS P
UNION
SELECT LP.Dlocal
FROM LOCALIZACAO_DEP AS LP

-- UNION ALL
SELECT P.Projlocal
FROM PROJETO AS P
UNION ALL
SELECT LP.Dlocal
FROM LOCALIZACAO_DEP AS LP

--EXCEPT
-- Listar os CPFs dos funcionários que não são gerentes de nenhum departamento
SELECT F.Cpf
FROM FUNCIONARIO AS F
EXCEPT
SELECT D.Cpf_gerente
FROM DEPARTAMENTO AS D

-- Encontre os NOME dos funcionarios que NÂO são supervisores 
SELECT F.Pnome, F.Unome
FROM FUNCIONARIO AS F
WHERE F.Cpf IN( SELECT F.Cpf
				FROM FUNCIONARIO AS F
				EXCEPT
				SELECT S.Cpf_supervisor
				FROM FUNCIONARIO AS S);

-- GROUP BY 
-- Contar o número de funcionarios por departamento
SELECT COUNT(F.Cpf) AS 'N_Funcionarios',D.Dnome as 'DEP'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome;

-- Somar os salários por departamento
SELECT SUM(f.Salario) as 'SALARIO DO DEP', D.Dnome as 'DEP'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome;

--Média de horas trabalhadas por projeto
SELECT AVG(TE.Horas) AS 'MEDIA DE HORAS', P.Projnome AS 'PROJETO'
FROM TRABALHA_EM AS TE
JOIN PROJETO AS P
	ON TE.Pnr = P.Projnumero
GROUP BY P.Projnome

-- Quantidade de funcionários por sexo
SELECT COUNT(F.Cpf) AS 'N_Funcionarios',f.Sexo as 'Sexo'
FROM FUNCIONARIO AS F
GROUP BY F.Sexo;

-- Maior salário em cada departamento
SELECT MAX(f.Salario) as 'Maior Salario', D.Dnome as 'DEP'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome;

-- Número de projetos em cada local
SELECT COUNT(P.Projnumero) AS 'Nº de projeto', P.Projlocal
FROM PROJETO AS P
GROUP BY P.Projlocal

-- HAVING
-- encontrar departamentos com mais de 3 funcionarios
SELECT COUNT(F.Cpf) AS 'N_Funcionarios',D.Dnome as 'DEP'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome
HAVING COUNT(F.Cpf) > 3;

-- listar projetos que exigem no minimo 50 horas de trabalho
SELECT SUM(TE.Horas) AS 'HORAS', P.Projnome AS 'PROJETO'
FROM TRABALHA_EM AS TE
JOIN PROJETO AS P
	ON TE.Pnr = P.Projnumero
GROUP BY P.Projnome
HAVING SUM(TE.Horas)>=50

--EXISTS
--Listar funcionarios que são gerentes de algum departamento
SELECT
FROM 
WHERE EXISTS

SELECT * FROM PROJETO
SELECT * FROM FUNCIONARIO
SELECT * FROM DEPARTAMENTO

SELECT * FROM TRABALHA_EM
SELECT * FROM LOCALIZACAO_DEP

