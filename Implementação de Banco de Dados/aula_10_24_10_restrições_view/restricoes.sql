
create table petShop(
	id INT PRIMARY KEY IDENTITY,
	nomeDono VARCHAR(50) UNIQUE,
	nomePet VARCHAR(50) NOT NULL,
	idadePet INT CHECK (idadePet >0),
	sexoPet CHAR CHECK (sexoPet IN ('M','F','N'))
);
SELECT * FROM petShop;

INSERT INTO petShop
VALUES('Lulu','Koda',1,'M');

GO;

CREATE TABLE Produtos(
	cod INT PRIMARY KEY,
	nome VARCHAR(50),
	categoria VARCHAR(50)
);

CREATE TABLE Inventario(
	id INT PRIMARY KEY IDENTITY,
	codProduto INT,
	quantidade INT,
	minLevel INT,
	maxLevel INT,
	CONSTRAINT fk_inv_produto
		FOREIGN KEY(codProduto)
		REFERENCES Produtos(cod)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

select * from Invetario
-- OUTRA FORMA DE CRIAR RESTRIÇÕES
ALTER TABLE Inventario
ADD CONSTRAINT fk_inv_produto
	FOREIGN KEY(codProduto)
	REFERENCES Produtos(cod)
	ON DELETE CASCADE
	ON UPDATE CASCADE;

-- CADASTRANDO PRODUTOS
INSERT INTO Produtos 
VALUES (1,'Sabão','Higiene'),
	   (2,'Coca','Bebidas'),
	   (3,'Spaten 473ml','Bebidas'),
	   (4,'Belinha','Bebidas'),
	   (5,'Catuaba','Bebidas'),
	   (6,'Energético','Bebidas');

INSERT INTO Inventario (codProduto,quantidade, minLevel, maxLevel)
VALUES (1,8,2,20),
	   (2,100,80,200),
	   (3,1000,800,5000),
	   (4,5,1,10),
	   (5,15,10,100),
	   (6,200,100,500);

SELECT * FROM Produtos AS P
INNER JOIN Inventario AS I
ON I.codProduto = P.cod


DELETE FROM Produtos WHERE cod = 1;

UPDATE Produtos SET cod = 2 WHERE cod = 87655;
CREATE TABLE Venda(
	id INT PRIMARY KEY IDENTITY,
	codProduto INT,
	quantidade INT
);
ALTER TABLE Venda
ADD CONSTRAINT fk_Venda_Produto
	FOREIGN KEY(codProduto)
	REFERENCES Produtos(cod)
	ON DELETE SET NULL
	ON UPDATE CASCADE;

INSERT INTO Venda
VALUES (87655,5),
		(3,10),
		(3,20),
		(3,5),
		(5,1),
		(4,2),
		(6,4);


SELECT * FROM Produtos AS P
RIGHT JOIN Venda AS V
ON V.codProduto = P.cod

DELETE FROM Produtos
WHERE cod = 4

ALTER TABLE Venda DROP CONSTRAINT fk_Venda_Produto;