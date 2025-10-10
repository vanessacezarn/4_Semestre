-- CASE

-- Classificar funcionarios por faixa salarial
-- salario <20k = baixo | 20k < salario < 40k = médio |salario > 40k = alto 

SELECT 
	F.Pnome, 
	F.Unome,
	F.Salario, 
	CASE 
		WHEN F.Salario < 20000 THEN 'BAIXO'
		WHEN F.Salario BETWEEN 20000 AND 40000 THEN 'MÉDIO'
		WHEN F.Salario > 40000 THEN 'ALTO'
		ELSE 'SEM REGISTRO'
	END AS 'Categoria_Salarial'
FROM FUNCIONARIO AS F

-- VERIFICAR SE O FUNCIONARIO FOI CONTRATADO RECENTEMENTE (ULTIMOS 3 MESES = 180 DIAS)
select 
	F.Pnome,
	F.Unome,
	F.Data_Admissao,
	CAST(GETDATE() AS DATE) AS 'HOJE',
	CASE
		WHEN DATEDIFF(DAY,F.Data_Admissao,GETDATE()) <= 180 THEN 'RECENTE'
		ELSE 'ANTIGO'
	END AS 'CONTRATO'
from FUNCIONARIO as F