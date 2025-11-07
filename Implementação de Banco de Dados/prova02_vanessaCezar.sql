-- PROVA 02 DE IMPLEMENTAÇÃO DE BANCO DE DADOS | VANESSA CEZAR DO NASCIMENTO | 07/11/2025

USE PapelariaDB;
-- QUESTÃO 01: O que é transação e por que ela é importante, propiedades ACID
/*
Transação é o conjunto de operações que são tratadas como uma única unidade de trabalho, ela deve ser completamente concluida ou revertida integralmente para garantir
que o banco de dados permaneça em um estado consistente. As transações são importantes pois garantem a integridade e consistência do dos dados, possibilitam reverter alterações
em caso em erro e também permitem controlar multiplas operações simultâneas. As propiedades ACID são Atomicidade, em que a transação inteira é tratada como uma única unidadem, 
ou seja, toda ela está correta ou nenhuma parte dela será utilizada, Consistência, em que um banco de dados sempre vai de um estado válido para outro estado válido, Isolamento,
onde a operação de uma transação não pode afetar a operação de outra transação, e por fim, Durabilidade, após uma transação confirmada ela permanece no banco de dados mesmo que 
ocorra uma falha no sistema.
*/


-- QUESTÃO 02: Transação para atualizar o preço de um item da tabela Produtos
GO
BEGIN TRANSACTION
	UPDATE Produtos SET PrecoVenda = 5 WHERE Descricao = 'Caneta BIC cristal'          
	IF @@ROWCOUNT > 1
		BEGIN
			PRINT 'ERRO: mais de um registro foi alterado'
			ROLLBACK TRANSACTION
		END
	ELSE
		BEGIN
			PRINT 'SUCESSO: a atualização foi realizada com sucesso'
			COMMIT TRANSACTION
END;

GO
SELECT * FROM Produtos;

-- QUESTÃO 03: O que são triggers, seus prinicipais tipos quanto ao momento de execução e quais comandos podem ser vinculados
/*
Triggers são uma tipo de stored procedure que é executado quando o usuário realiza uma operação de modificação de dados em uma tabela específica, esse gatilho é disparado uma vez
para cada operação de modificação (insert, update, delete). Gatilhos possuem dois principais tipos quanto ao momento de execução são eles after e instead of, o primeiro o código é
executado após todas as operações terem sido completadas na tabela especificada, ou seja, após a operação de modificação ocorrer, ele geralmente é utilizado quando se quer reagir a
uma ação já confirmada como por exemplo registros das operações realizadas. Já o segundo, instead of, o código é executado no lugar da operação que causou seu disparo, sendo assim 
ele pode ser utilizado para controlar ou modificar o comportamento padrão de uma operação, esse modo de disparo é frequentemente utilizado em views de insert ou delete.
*/

-- QUESTÃO 04
go
CREATE or ALTER TRIGGER trg_Vendas
ON Vendas
INSTEAD OF UPDATE
AS
	DECLARE @idvenda int
	select @idvenda = VendaID  from inserted
	DECLARE @Quantidade int, @CodBarras varchar(50)
	select @Quantidade = Quantidade, @CodBarras = CodigoBarras FROM ItensVenda as IV WHERE IV.VendaID = @idvenda
	DECLARE @qtdEstoque int
	SELECT @qtdEstoque = P.QuantidadeEstoque FROM Produtos AS P

	IF @Quantidade > @qtdEstoque
		PRINT 'Erro: Estoque insuficiente para um ou mais produtos'

	ELSE
		UPDATE Produtos SET QuantidadeEstoque = (QuantidadeEstoque - @Quantidade) WHERE CodigoBarras = @CodBarras
		DECLARE @ValorTotal DECIMAL(10, 2)
		SELECT @ValorTotal = (Quantidade * PrecoUnitario) FROM ItensVenda WHERE VendaID = @idvenda
		UPDATE VENDAS SET ValorTotal = @ValorTotal WHERE VendaID = @idvenda
		PRINT 'Venda realizada com sucesso'


-- QUESTÃO 05: Registrar as operações realizadas na tabela Produtos na tabela LogProdutos e triggers que capturem automaticamente as operaçoes de atualização (inserção e delete) 
GO
CREATE TABLE LogProdutos(
	LogId INT PRIMARY KEY IDENTITY(1,1),
	ProdutoID VARCHAR(50),
	TipoOperacao CHAR(1) NOT NULL,
	DataOperacao DATETIME DEFAULT GETDATE()
);
SELECT * FROM LogProdutos;

GO
CREATE or ALTER TRIGGER trg_historicoAtualizacoes
on Produtos
AFTER update
AS
BEGIN
	DECLARE @IDproduto varchar(50);
	SELECT @IDproduto = CodigoBarras FROM inserted
	
	INSERT INTO LogProdutos(ProdutoID, TipoOperacao)
	VALUES (@IDproduto,'U');
END;

SELECT * FROM PRODUTOS;
UPDATE Produtos SET QuantidadeEstoque = '202' WHERE CodigoBarras = '0005113190827';
UPDATE Produtos SET QuantidadeEstoque = '200' WHERE CodigoBarras = '0005113190827';

GO 
CREATE or ALTER TRIGGER trg_historicoDelete
on Produtos
AFTER delete
AS
BEGIN
	DECLARE @IDproduto varchar(50);
	SELECT @IDproduto = CodigoBarras FROM deleted
	
	INSERT INTO LogProdutos(ProdutoID, TipoOperacao)
	VALUES (@IDproduto,'D');
END;

DELETE FROM Produtos WHERE CodigoBarras = '7891360643758'


-- QUESTÃO 06: Criar trigger para inativar um cliente
GO
CREATE TRIGGER trg_InativarCliente
ON Clientes
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @cliente int
	SELECT @cliente = ClienteID FROM deleted
	IF EXISTS (SELECT 1 FROM Clientes WHERE ClienteID = @cliente)
		BEGIN
			UPDATE Clientes SET Status = 'I' WHERE ClienteID = @cliente;
			PRINT 'Cliente agora é INATIVO'	
		END
	ELSE
		PRINT 'Não existe um cliente com esse ID'
END;
SELECT * FROM Clientes;
DELETE FROM Clientes WHERE ClienteID = 3

-- QUESTÃO 07: Propósito das restrições de integridade em um banco de dados, diferenças entre restrições declarativas e proceduais, exemplo de cada abordagem
/*
Restrições de integridade tem como finalidade a manutenção e garantia da consistência e precisão dos dados, as restrições integridade declarativas são parametrizadas na criação da
estrutura das tabelas, elas impedem valores nulos, definem o uso da chave primária, já nas restrições de integridade proceduais é possível fazer o uso de recursos como triggers, stored
procedure, esse tipo de restrição geralmente é implementada pelos programadores com o auxílio das regras de negócio definidas pelos clientes.
*/

-- QUESTÃO 08: Corrigir o CodigoBarras de um item e ajustar a restricao de chave estrangeira nas tabelas que referencial produtos
ALTER TABLE ItensVenda
add CONSTRAINT FK_ItensVendaProdutos 
	 FOREIGN KEY (CodigoBarras) 
	 REFERENCES Produtos(CodigoBarras)
	 ON UPDATE CASCADE;


-- QUESTÃO 09: O que são views e suas principais vantagens da sua utilização
/*
Views são tabelas virtuais baseadas no conjunto de resultados de uma consulta SQL, então ela possui linhas e colunas e pode conter join e where. As principais vantagens de sua utilização
são o reuso, segurança, pois permite ocultar determinadas colunas de uma tabela, simplificação de codigo, economia de tempo já que descarta retrabalhos, velocidade de acesso a informação,
simplifica o gerenciamento de usuários e organiza dados a serem exportados em DUMP.
*/

-- QUESTÃO 10: Criar uma view para relatorio detalhado das vendas
GO
CREATE VIEW vw_RelatorioDetalhadoVendas AS
WITH subtotalItem AS (
	SELECT IV.VendaID, (IV.Quantidade * IV.PrecoUnitario) AS Subtotal
	FROM ItensVenda AS IV
)
SELECT  V.VendaID, 
		V.DataVenda, 
		CASE 
			WHEN V.ClienteID IS NULL THEN 'Venda Balcao'
		ELSE C.Nome
		END AS 'NomeCliente',
		P.Nome AS NomeProduto,
		CT.Nome AS NomeCategoria,
		IV.Quantidade, 
		IV.PrecoUnitario,
		SI.Subtotal AS SubtotalItem
FROM Vendas AS V
JOIN Clientes AS C
ON V.ClienteID = C.ClienteID
JOIN ItensVenda AS IV
ON V.VendaID = IV.VendaID
JOIN Produtos AS P
ON IV.CodigoBarras = P.CodigoBarras
JOIN Categorias AS CT
ON P.CategoriaID = CT.CategoriaID
JOIN subtotalItem AS SI
ON SI.VendaID = IV.VendaID

GO
SELECT * FROM vw_RelatorioDetalhadoVendas;


-- QUESTÃO 11
-- SCRIPT DO CRIAÇÃO DO USUARIO
USE [master]
GO
CREATE LOGIN [Estagiario] WITH PASSWORD=N'123456', DEFAULT_DATABASE=[PapelariaDB], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [PapelariaDB]
GO
CREATE USER [Estagiario] FOR LOGIN [Estagiario]
GO
USE [PapelariaDB]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Estagiario]
GO
--permissoes e restrições
GRANT INSERT ON PRODUTOS TO Estagiario;
DENY DELETE TO Estagiario;
DENY UPDATE TO Estagiario;
