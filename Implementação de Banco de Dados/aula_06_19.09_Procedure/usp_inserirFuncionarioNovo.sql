create PROCEDURE usp_inserirFuncionarioNovo 
	(@Pnome varchar(15),
	@Minicial char,
	@Unome varchar(15),
	@cpf varchar(11),
	@datanasc date,
	@Endereco VARCHAR(255),
	@sexo char )
AS 
BEGIN 
	IF EXISTS(SELECT *
			  FROM FUNCIONARIO AS F
			  WHERE F.Pnome = @Pnome and F.Minicial = @Minicial  and f.Unome = @Unome
			  )
	begin
		print 'Já exite um funcionario com esse nome: ' + CONCAT (@Pnome,' ',@Minicial,' ', @Unome)
		return -- funciona como um break
	end
	INSERT INTO FUNCIONARIO VALUES 
	(@Pnome ,@Minicial, @Unome, @cpf ,@datanasc,@Endereco ,@sexo, null, null, null,null,null  )
END;

EXEC usp_inserirFuncionarioNovo 'vanessa','C','Nascimento','00011122233','2002-12-02','rua maq. lucas, sm,rs,br','F' 
EXEC usp_inserirFuncionarioNovo 'Luiza','L','KarLec','00011122244','2004-10-27','JOBIM, sm,rs,br','F' 
EXEC usp_inserirFuncionarioNovo 'Guilherme','F','Rolim','00011133344','2006-01-20','Duque, sm,rs,br','M' 

SELECT * FROM FUNCIONARIO