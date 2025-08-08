--VANESSA CEZAR DO NASCIMENTO, aula 2 08/08/2025
-- CONSULTAS REALIZADAS EM AULA : 

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

-- AND: Liste os funcionários do sexo masculino com salário maior ou igual a 30.000,00R$
SELECT *
FROM FUNCIONARIO as F
WHERE f.Sexo = 'M' and f.Salario >= 30000

-- OR : Liste os funcionários que moram em São Paulo ou em Curitiba.
SELECT *
FROM FUNCIONARIO as F
WHERE F.Endereco LIKE '%São Paulo%' or F.Endereco LIKE '%Curitiba%';

-- NOT: Liste os funcionários que não moram em São Paulo.

SELECT *
FROM FUNCIONARIO as F
WHERE NOT F.Endereco LIKE '%São Paulo%';

-- ORDER BY : Preciso cortar orçamento, liste os funcionários em ordem decrescente de salário.
SELECT *
FROM FUNCIONARIO as F
ORDER BY F.Salario DESC;

-- IS NULL: Encontre os Funcionário que não possuem supervisor (Cpf_supervisor)
SELECT *
FROM FUNCIONARIO as F
WHERE F.Cpf_supervisor IS NULL;

-- IS NOT NULL: Recupere o(s) nome(s) do(s) funcionário(s) que possuem supervisor.
SELECT *
FROM FUNCIONARIO as F
WHERE F.Cpf_supervisor IS NOT NULL;

-- SELECT TOP: Recupere o registro dos 3 funcionários que têm o maior salário.
SELECT TOP 3 *
FROM FUNCIONARIO as F
ORDER BY F.Salario DESC

-- MIN(): Recupere as informações do funcionário com o menor salário.
SELECT *
FROM FUNCIONARIO as F
WHERE F.Salario = (SELECT MIN(F.salario) FROM FUNCIONARIO as F)

-- outra forma de resolver o MIN(): criar uma variavel: DECLARE,essa variavel só existe no tempo de execução
DECLARE @salario_min DECIMAL(10,2);
-- SELECT @salario_min = (SELECT MIN(F.salario) FROM FUNCIONARIO as F);
-- outra forma de atribuir valor a variavel:
SET @salario_min = (SELECT MIN(F.salario) FROM FUNCIONARIO as F);
PRINT @salario_min
SELECT *
FROM FUNCIONARIO as F
WHERE F.Salario = @salario_min

-- MAX(): Recupere as informações do funcionário com o maior salário.
SELECT *
FROM FUNCIONARIO as F
WHERE F.Salario = (SELECT MAX(F.salario) FROM FUNCIONARIO as F)

-- COUNT : Quantos funcionários possuímos cadastrados no banco?
SELECT COUNT(f.Cpf) as Qtd_Funcionario
FROM FUNCIONARIO as F;

-- COUNT : Quantas Pessoas possuímos cadastrados no banco?
SELECT
	(SELECT COUNT(*) FROM FUNCIONARIO) as Nr_Funcionario,
	(SELECT COUNT(*) FROM DEPENDENTE) as Nr_Dependentes, 
	(SELECT COUNT(*) FROM FUNCIONARIO) + (SELECT COUNT(*) FROM DEPENDENTE) as Total;

-- Outra forma de resolver 
DECLARE @nr_funcionario INT;
DECLARE @nr_dependente INT;
SET @nr_funcionario = (SELECT COUNT(*) FROM FUNCIONARIO);
SET @nr_dependente = (SELECT COUNT(*) FROM DEPENDENTE);
SELECT @nr_funcionario + @nr_dependente as Total_Pessoas;

-- AVG(): Qual é a média salarial dos meus funcionários?
SELECT AVG(F.Salario) as Media_Salarial
FROM FUNCIONARIO as F;

-- SUM(): Qual é o meu custo mensal com folha de pagamento dos funcionários?
SELECT SUM(F.Salario) as Total_Folha_Pagamento
FROM FUNCIONARIO as F;

-- Quanto a pessoa que tem o menor salario ganha a menos que a media salarial
DECLARE @salario_menor DECIMAL(10,2);
DECLARE @media DECIMAL(10,2);
SET @salario_menor = (SELECT MIN(F.salario) FROM FUNCIONARIO as F);
SET @media = (SELECT AVG(F.Salario) FROM FUNCIONARIO as F);
SELECT @media - @salario_menor as Desvio;

-- Quanto a pessoa que tem o maior salario ganha a mais que a media salarial
DECLARE @salario_maior DECIMAL(10,2);
DECLARE @mediaa DECIMAL(10,2);
SET @salario_maior = (SELECT MAX(F.salario) FROM FUNCIONARIO as F);
SET @mediaa = (SELECT AVG(F.Salario) FROM FUNCIONARIO as F);
SELECT @salario_maior - @mediaa  as Desvio;

-- LIKE: Recupere o(s) funcionário(s) nascido(s) no ano de 72.
SELECT *
FROM FUNCIONARIO as F
--WHERE F.Datanasc LIKE '%72%';
WHERE YEAR(F.Datanasc) LIKE '__72' -- utilizando a funçao year para recuperar uma data atraves do ano

-- IN: Recupere as informações dos funcionários que recebem 25000 ou 30000 R$
SELECT *
FROM FUNCIONARIO as F
WHERE F.Salario IN (25000,30000)

-- IN: Recupere os registros dos funcionários que trabalham (TRABALHA_EM) no mesmo projeto e na mesma quantidade de horas do “Fernando” (Fcpf = “33344555587” )
-- qual projeto e quantas horas cada funncionario trabalha
SELECT F.Pnome, TE.* 
FROM FUNCIONARIO as F
JOIN TRABALHA_EM as TE ON F.Cpf = TE.Fcpf;

-- projeto que o FERNANDO TRABALHA
/*SELECT DISTINCT T.Pnr as projetos, t.Horas
FROM FUNCIONARIO as F, TRABALHA_EM AS T
WHERE F.Pnome = 'Fernando' and F.Cpf = T.Fcpf;
*/
DECLARE @cpf_Fernando CHAR(11)
SET @cpf_Fernando = (select F.Cpf from FUNCIONARIO as F WHERE F.Pnome = 'Fernando')

-- QUEM TAMBEM TRABALHA NESSES PROJETOS e na mesma quantidade de horas
SELECT F.Pnome, TE.* 
FROM FUNCIONARIO as F
JOIN TRABALHA_EM as TE ON F.Cpf = TE.Fcpf
WHERE TE.Pnr IN (SELECT Pnr FROM TRABALHA_EM WHERE F.Cpf = @cpf_Fernando) 
AND TE.Horas IN (SELECT Horas FROM TRABALHA_EM WHERE F.Cpf = @cpf_Fernando)
AND NOT TE.Fcpf = @cpf_Fernando;

-- BETWEEN: Recuperar todos os funcionários no departamento 5 cujo salário esteja entre R$ 30.000 e R$ 40.000
SELECT F.*
FROM FUNCIONARIO as F, DEPARTAMENTO as D
WHERE D.Dnumero = 5 and F.Salario BETWEEN 30000 AND 40000

--Aliases AS: Recupere Pnome como Nome e Unome como Sobrenome da tabela Funcionario.
SELECT F.Pnome AS Nome, F.Unome AS Sobrenome
FROM FUNCIONARIO as F
