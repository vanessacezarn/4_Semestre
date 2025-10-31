CREATE DATABASE BD_Temporal;
go
USE BD_Temporal;
go

CREATE TABLE InventarioCarros(
	Id int identity primary key,
	Ano int,
	Marca varchar(40),
	Modelo varchar(40),
	Cor varchar(10),
	Quilometragem int,
	Disponivel bit not null default 1,
	SysStartTime datetime2 GENERATED ALWAYS AS ROW START NOT NULL,
	SysEndTime datetime2 GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH
(
	SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.HistoricoInventarioCarros)
)


--Vamos preenchê-lo com os carros mais escolhidos das agências de locação de carros em todo o Brasil
Insert into dbo.InventarioCarros (Ano,Marca,Modelo,Cor,Quilometragem,Disponivel) 
values (2004, 'Fiat', 'Uno', 'Branco', 150000, 1);
Insert into dbo.InventarioCarros (Ano,Marca,Modelo,Cor,Quilometragem,Disponivel) 
values (2015, 'Ford', 'Ka', 'Preto', 30000, 1);
Insert into dbo.InventarioCarros (Ano,Marca,Modelo,Cor,Quilometragem,Disponivel) 
values (2022, 'Hyundai', 'HB20', 'Prata', 0, 1);
Insert into dbo.InventarioCarros (Ano,Marca,Modelo,Cor,Quilometragem,Disponivel) 
values (2022, 'Hyundai', 'HB20', 'Branco', 0, 1);

SELECT * FROM InventarioCarros;
SELECT * FROM dbo.HistoricoInventarioCarros;

-- simular emprestimos
UPDATE InventarioCarros SET Disponivel = 0 WHERE Id = 1;
UPDATE InventarioCarros SET Disponivel = 0 WHERE Id = 4;

-- carros devolvidos
UPDATE InventarioCarros
SET Disponivel = 1, Quilometragem = 160000  
WHERE Id = 1;

UPDATE InventarioCarros 
SET Disponivel = 1, Quilometragem = 5000 
WHERE Id = 4;

-- emprestando carro
UPDATE InventarioCarros SET Disponivel = 0 WHERE Id = 1;

-- removendo uno apos acidente
DELETE FROM InventarioCarros WHERE Id = 1;

-- olhando para um passado distante
SELECT *
FROM InventarioCarros
FOR SYSTEM_TIME AS OF '2025-10-31 14:19:33.60' ORDER BY Id

-- recuperar o historico do uno id =1
SELECT *
FROM InventarioCarros
FOR SYSTEM_TIME ALL
WHERE Id = 1;

--
SELECT DISTINCT H.Modelo
FROM InventarioCarros AS I
RIGHT JOIN dbo.HistoricoInventarioCarros AS H
ON I.Id = H.Id
WHERE I.Id IS NULL
