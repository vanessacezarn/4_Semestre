-- EXERCICIOS DA LISTA DE TRIGGERS | VANESSA CEZAR DO NASCIMENTO
--1) Crie um trigger que impeça a inserção de livros com o mesmo titulo na tabela Livro
use BIBLIOTECA;
GO;
CREATE or ALTER TRIGGER trg_inserirLivro
on Livro
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @titulo VARCHAR(50);
	SELECT @titulo = titulo
	FROM inserted

	IF EXISTS (SELECT 1 FROM Livro WHERE @titulo = titulo)
		PRINT 'Este nome de livro já está cadastrado'
	ELSE
		BEGIN
			INSERT INTO Livro(isbn,titulo,ano,fk_editora,fk_categoria)
			SELECT isbn,titulo,ano,fk_editora,fk_categoria
			FROM inserted
			print 'Inserção realizada com sucesso'
		END
END;

SELECT * FROM Livro
select * from Editora

INSERT INTO Livro(isbn,titulo,ano,fk_editora,fk_categoria)
VALUES ('123456','BANCO DE DADOS',2025,1,5);

-- 2) crie um trigger que atualize automaticamente o ano de publicação na tabela Livro para o ano atual quando um novo livro é inserido
GO
CREATE TRIGGER trg_anoAtual
on Livro
INSTEAD OF INSERT
AS
BEGIN
		BEGIN
			INSERT INTO Livro(isbn,titulo,ano,fk_editora,fk_categoria)
			SELECT isbn,titulo,Year(GETDATE()),fk_editora,fk_categoria
			FROM inserted
			print 'Inserção realizada com sucesso'
		END
END;


INSERT INTO Livro(isbn,titulo,ano,fk_editora,fk_categoria)
VALUES ('654321','ESTRURA DE DADOS',2020,2,5);

SELECT * FROM Categoria

-- 5) crie um trigger que restrinja a exclusão de categorias na tabela Categorias se houver livros associados a essa categoria
GO
CREATE OR ALTER TRIGGER trg_exclusãoCategoria
on categoria
INSTEAD OF DELETE
AS 
BEGIN
	DECLARE @cat int;
	SELECT	@cat = id
	FROM deleted

	IF EXISTS (SELECT 1 from Livro where fk_categoria = @cat)
		PRINT'NÃO É POSSIVEL EXCLUIR ESSA CATEGORIA POIS UM LIVRO ESTÁ ASSOCIADO A ELA'
	ELSE
		BEGIN
			DELETE FROM Categoria
			WHERE id = @cat
			PRINT 'CATEGORIA DELETADA COM SUCESSO'
		END

END

INSERT INTO Categoria (tipo_categoria)
VALUES ('teste')
select * from Categoria

INSERT INTO Livro(isbn,titulo,ano,fk_editora,fk_categoria)
VALUES ('123','teste delete',2020,2,6);
select * from LIVRO

DELETE FROM Categoria WHERE id = 6


-- 8) crie um trigger que restrinja a atualização do ISBN na tabela Livro para impedir que ele seja alterado
GO
CREATE TRIGGER trg_atualizaISBN
on livro
AFTER UPDATE
AS 
BEGIN
	if UPDATE(isbn)
		BEGIN
			PRINT 'NÃO É POSSIVEL ALTERAR O ISBN DE UM LIVRO'
			ROLLBACK TRANSACTION
		END
END

UPDATE Livro SET isbn = '987654' WHERE titulo = 'BANCO DE DADOS'

-- 6) crie um trigger que registre em uma tabela de auditoria sempre que um livro for atualizado na tabela livro
GO
create table aud_livros(
	logId int identity(1,1) primary key,
	data_hora DATETIME DEFAULT GETDATE(),
	campo_alterado varchar(50),
	anterior varchar(30),
	atual varchar(30)
);
select * from aud_livros

go
CREATE OR ALTER TRIGGER trg_atualizaLivro
ON livro
INSTEAD OF update
AS 
BEGIN
	DECLARE @tituloA varchar(30), @anoA int,@editoraA int, @catA int;
	SELECT @tituloA = titulo, @anoA = ano, @editoraA = fk_editora, @catA = fk_categoria
	FROM deleted;
	DECLARE @tituloN varchar(30), @anoN int,@editoraN int, @catN int;
	SELECT @tituloN= titulo, @anoN = ano, @editoraN = fk_editora, @catN = fk_categoria
	FROM inserted;

	if @tituloA<>@tituloN
		insert into aud_livros(campo_alterado,anterior,atual)
		values('titulo',@tituloA,@tituloN)
	if @anoA<>@anoN
		insert into aud_livros(campo_alterado,anterior,atual)
		values('ano',@anoA,@anoN)
	if @editoraA<>@editoraN
		insert into aud_livros(campo_alterado,anterior,atual)
		values('editora',@editoraA,@editoraN)
	if @catA<>@catN
		insert into aud_livros(campo_alterado,anterior,atual)
		values('categoria',@catA,@catN)
END;

UPDATE livro
SET titulo = 'Novo título',
    ano = 2008
WHERE isbn = '123';

-- 14) crie um trigger que registre automaticamente todas as exclusões de livros na tabela LogExclusoesLivros com detalhes sobre o livro excluido, data e hora
GO
create table LogExclusoesLivros(
	logId int identity(1,1) primary key,
	data_hora DATETIME DEFAULT GETDATE(),
	isbn varchar (50) not null,
	titulo varchar(50) not null,
	ano int not null,
	editora int not null,
	categoria int not null
);
select * from LogExclusoesLivros
go

CREATE TRIGGER trg_excluirLivro
on livro
AFTER DELETE
AS
BEGIN
	INSERT INTO LogExclusoesLivros(isbn,titulo,ano,editora,categoria)
	select isbn,titulo,ano,fk_editora,fk_categoria
	from deleted
END

delete from Livro where isbn = '123';




 