CREATE TRIGGER trg_afterUpdateNome
ON FUNCIONARIO
AFTER UPDATE
AS
IF UPDATE(Pnome)
	BEGIN
		declare @nomeNovo varchar(100)
		declare @nomeAntigo varchar(100)
		select @nomeNovo = Pnome from inserted
		select @nomeAntigo = Pnome from deleted
		print 'o nome foi alterado com sucesso!!!'
		print 'o nome anterior era : ' +@nomeAntigo
		print 'nome nome : ' + @nomeNovo
	END
ELSE
	BEGIN
		print 'nome não foi modificado'
	end 

update FUNCIONARIO
set Pnome = 'juca'
where cpf = '0548978'

select * from FUNCIONARIO