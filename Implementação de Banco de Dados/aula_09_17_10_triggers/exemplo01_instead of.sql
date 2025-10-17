create or alter trigger trg_Instead_ofNomeDuplicados
on funcionario
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @Pnome VARCHAR(50), @Minicial char(1), 
			@Unome varchar(50);
	SELECT @Pnome = Pnome, @Minicial = Minicial, @Unome = Unome
	FROM inserted;
	-- verifica se existe alguem com o mesmo nome
	IF EXISTS (SELECT 1
			   FROM FUNCIONARIO 
			   WHERE @Pnome = Pnome AND	@Minicial = Minicial AND @Unome = Unome)
		BEGIN
			PRINT 'Já existe alguém com esse nome completo'
			RAISERROR('ERRO: nome duplicado',16,0);
			/*nivel de severidade do erro
				0 a 10 = informativo ou advertencia
				11 a 16 = problema com a consulta
				17 a 25 = erro grave que indica com falha no servidor
			*/
		END
	ELSE
		begin
			INSERT INTO FUNCIONARIO (Pnome,Minicial,Unome,Cpf,Datanasc,Endereco,Sexo,Salario,Cpf_supervisor,Dnr,Bonus,Data_Admissao)
			SELECT Pnome,Minicial,Unome,Cpf,Datanasc,Endereco,Sexo,Salario,Cpf_supervisor,Dnr,Bonus,Data_Admissao 
			FROM inserted;
		end

end;

select * from FUNCIONARIO

insert into FUNCIONARIO(cpf,Pnome,Unome,Minicial)
values ('0597898','jukinha','cezar','N')
