-- VANESSA CEZAR DO NASCIMENTO | PROVA 01 | 26/09/2025

-- 7) Liste o nome dos alunos e suas respctivas notas na disciplina "Banco de dados'
SELECT A.Nome, HE.Nota AS Nota_BD
FROM HISTORICO_ESCOLAR AS HE
INNER JOIN ALUNO AS A
ON HE.Numero_aluno = A.Numero_aluno
WHERE HE.Identificacao_turma = (select T.Identificacao_turma
								FROM DISCIPLINA AS D
								inner join Turma as T
								on D.Numero_disciplina = t.Numero_disciplina
								WHERE D.Nome_disciplina = 'Banco de dados')


-- 8) Quais são as disciplinas que têm pré-requisitos e quais são seus respctivos pré-requisitos
SELECT D.Nome_disciplina AS Disciplina_com_Pré_Requisito, Dd.Nome_disciplina as pré_quequisito
FROM PRE_REQUISITO AS PQ
INNER JOIN DISCIPLINA AS D
ON PQ.Numero_disciplina = D.Numero_disciplina
INNER JOIN DISCIPLINA AS Dd
ON PQ.Numero_pre_requisito = Dd.Numero_disciplina;


--9)Liste todas as disciplinas cursadas pelo aluno 'Silva', mostrando o nome da disciplina, o semestre, o ano e a nota final
DECLARE @N_ALUNO INT
select @N_ALUNO = a.Numero_aluno
from ALUNO AS a
where a.Nome = 'Silva'

select  D.Nome_disciplina, T.Semestre, T.Ano, he.Nota
from  TURMA as T
inner join DISCIPLINA AS D
ON T.Numero_disciplina = D.Numero_disciplina
INNER JOIN HISTORICO_ESCOLAR AS HE
ON HE.Numero_aluno = @N_ALUNO
WHERE T.Identificacao_turma IN (select he.Identificacao_turma 
								from HISTORICO_ESCOLAR as he
								where he.Numero_aluno = @N_ALUNO) 


--10) Crie uma funçao (recebe o nome do aluno em questão, e a respectiva disciplina) que verifique se o aluno APROVADO,esta em RECUPERAÇÃO, ou REPROVADO com base na nota final:
-- A e B = APROVADO, C = RECUPERAÇÃO, F = REPROVADO

CREATE FUNCTION fn_situacaoAluno (@nome varchar(100), @disciplina varchar(15))
RETURNS VARCHAR (15)
AS
BEGIN
	DECLARE @situacao varchar(15)
	DECLARE @nota varchar(1)
	select @nota = HE.Nota
	from HISTORICO_ESCOLAR as HE
	where he.Numero_aluno = (select a.Numero_aluno from aluno as a where a.Nome = @nome) 
	 AND HE.Identificacao_turma in (select t.Identificacao_turma 
									from turma as T
									where t.Numero_disciplina = @disciplina)

	IF @nota = 'A' OR @nota = 'B'
		set @situacao = 'APROVADO'
	ELSE IF @nota = 'C'
		set @situacao = 'EM RECUPERAÇÃO'
	ELSE IF @nota = 'F'
		SET @situacao = 'REPROVADO'
	RETURN @situacao
END	

select dbo.fn_situacaoAluno ('Alice Oliveira','MAT2410') as situacao
select dbo.fn_situacaoAluno ('Carla Souza','CC3380') as situacao

-- QUESTÃO 12
CREATE FUNCTION fn_situacaoTurma (@turma int)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @situacao varchar(30)
	DECLARE @qtd_alunos int
	SELECT @qtd_alunos = COUNT (he.Numero_aluno)
	FROM HISTORICO_ESCOLAR AS HE
	WHERE HE.Identificacao_turma = 85

	if @qtd_alunos >=5
		set @situacao = 'COMPLETAMENTE LOTADA'
	else if @qtd_alunos = 3 or @qtd_alunos = 4
			set @situacao = 'QUASE CHEIA'
	else if @qtd_alunos < 3
		set @situacao = 'COM VAGAS'

	return @situacao
END

--- consulta
DECLARE @qtd_alunos int
SELECT @qtd_alunos = COUNT (he.Numero_aluno)
FROM HISTORICO_ESCOLAR AS HE
where he.Identificacao_turma = 85
SELECT D.Nome_disciplina,T.Identificacao_turma, @qtd_alunos as n_alunos, dbo.fn_situacaoTurma (85) as situação
from turma as t
INNER JOIN DISCIPLINA AS D
ON T.Numero_disciplina = D.Numero_disciplina
where t.Identificacao_turma = 85

--13) Crie um procedimento armazenado chamado usp_CalcularIdadeAluno que receba o número do aluno como parâmetro e exiba a idade correta do aluno
create PROCEDURE usp_CalcularIdadeAluno (@n_aluno INT)
AS
BEGIN
	DECLARE @data_nasc DATE
	SELECT @data_nasc = A.Data_Nascimento FROM ALUNO AS A WHERE A.Numero_aluno = 1
	DECLARE @idade INT
	SET @idade = DATEDIFF(YEAR,@data_nasc,GETDATE())
	IF (MONTH(GETDATE()) < MONTH(@data_nasc) ) or (MONTH(GETDATE()) = MONTH(@data_nasc)  AND  DAY(GETDATE()) < DAY(@data_nasc))
		set @idade = @idade - 1
	print 'Idade do aluno '+CAST(@n_aluno as varchar(2)) + ' é de : ' + CAST (@idade as varchar (3))
END

EXEC usp_CalcularIdadeAluno 2;

--14) Crie uma procedure chamada usp_AtualizarNota que receba o número do aluno, a identificação da turma e a nova nota como parametro
-- e atualize a nota do aluno no historico escolar e exiba uma mensagem de sucesso ou falha

ALTER PROCEDURE usp_AtualizarNota (@n_aluno INT, @turma INT, @nota varchar(1))
as
BEGIN
	IF exists (select * from aluno as a where a.Numero_aluno = @n_aluno)
		begin
			if exists (select * from turma as t where t.Identificacao_turma = @turma)
			begin
				update HISTORICO_ESCOLAR
				set Nota = @nota
				where Numero_aluno = @n_aluno AND Identificacao_turma = @turma
			end
			else
			print 'Erro ao atualizar a nota! Não existe um turma com essa identificação'
		end
	ELSE
	PRINT 'Erro ao atualizar a nota! Não existe um aluno com esse número';
END;

EXEC usp_AtualizarNota 55, 112, 'C'
EXEC usp_AtualizarNota 17, 112, 'C'
EXEC usp_AtualizarNota 17, 200, 'C'


