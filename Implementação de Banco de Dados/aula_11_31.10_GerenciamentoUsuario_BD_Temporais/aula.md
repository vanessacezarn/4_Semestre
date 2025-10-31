### revisão
 - Banco de dados ATIVOS
     - triggers: insert, update, delete ➔ after ou instead of
     - view: consultas armazenadas, tabelas vituais
### aula de hoje
- Gerenciamento de usuário
    - grant, deny, revoke
- Banco de dados TEMPORAIS  
    - informações ao passar do tempo

# GERENCIAMENTO DE ACESSOS SQL SERVER
## SEGURANÇA A NÍVEL DE SERVIDOR
- em segurança ➔ clicar com botão direito ➔ novo ➔logon ➔ criar novo usuário
### SERVIDOR
- configurações gerais e função servidor
<div align="center">
  <img width="683" height="756" alt="{56A40218-504E-4075-AC75-40B861C5FD48}" src="https://github.com/user-attachments/assets/700f2de1-a1ef-4f32-b56b-a67971c28d60" />
  <img width="682" height="756" alt="{D6F80958-6E39-44B8-A2AA-9C02A56B679F}" src="https://github.com/user-attachments/assets/8c74b624-fc8e-4310-98a0-ec6e59995a53" />
</div>

### DATABASE
- mapeamento de usuario
<div align="center">
  <img width="685" height="751" alt="{3B99CB97-640F-45A1-8A53-638D6EE5720A}" src="https://github.com/user-attachments/assets/9454d5f1-eb56-47b6-a4c9-4dccd96f2797" />

</div>
datareader ➔ permite realizar select

### OBJETO
- tabela
- view
- function
- procedure
---
- da pra criar um scipt do que esta sendo feito na interface ➔ apenas clicar em script
```sql
USE [master]
GO
CREATE LOGIN [Juca] WITH PASSWORD=N'12345', DEFAULT_DATABASE=[BIBLIOTECA], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
use [master];
GO
USE [BIBLIOTECA]
GO
CREATE USER [Juca] FOR LOGIN [Juca]
GO
USE [BIBLIOTECA]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Juca]
GO

```

---
- para abrir uma consulta pelo usuario ➔ botão direito em cima do servidor dele ➔ nova consulta
---
### Script de criação e permissões de usuários
```sql
CREATE LOGIN meuLogin WITH PASSWORD='senha';
CREATE USER meuLogin FROM LOGIN meuLogin;
EXEC SP_ADDROLEMEMBER 'DB_DATAREADER', 'meuLogin';
EXEC SP_ADDROLEMEMBER 'DB_DATAWRITER', 'meuLogin';

```
## COMANDO GRANT
- concede uma permissão específica a um usuário ou função
- permite que o usuário execute certas ações, como selecionar dados ou modificar uma tabela
```sql
GRANT permissao ON objeto TO usuario

GRANT SELECT, UPDATE, INSERT, DELETE ON objeto TO usuario;
GRANT EXECUTE ON objeto TO usuario;
```
## COMANDO DENY
- impede que o usuário realize uma determinada ação
- nega explicitamente uma permissão e tem precedência sobre o GRANT
```sql
DENY permissao ON objeto TO usuario

DENY SELECT, UPDATE, INSERT, DELETE ON objeto TO usuario;
DENY EXECUTE ON objeto TO usuario;
```

## COMANDO REVOKE
- remove um GRANT ou DENY que foi criado dado diretamente ao usuário
- depois de um REVOKE ele ainda pode herdar permissões de uma role
```sql
REVOKE permissao ON objeto TO usuario

REVOKE SELECT, UPDATE, INSERT, DELETE ON objeto TO usuario;
REVOKE EXECUTE ON objeto TO usuario;
```

# BANCO DE DADOS TEMPORAIS
 um banco é dito temporal, em um sentido mais amplo, quando possui na organização de suas informações algum aspecto de tempo
 - guarda os dados de quando o banco foi criado, data e horario até a sua alteração ou momento atual
## Aplicações Temporais
- saúde ➔ histórico de pacientes
- seguro ➔ histórico de acicles e sinisitros, data de vigor das apólices
- sistema de reservas ➔ hotelaria, companhia aérea
- sistema de gestão ➔ dados de funcionáios: salário, cargo, projetos
## Ordem do tempo
### ⮩ ordem linear
- forma mais usual de ordenaçaõ temporal, um dado com no máximo um sucessor e um predecessor
- exemplo: evolução do salário de um empregado
### ⮩ ordem ramificada
- um dado pode ter vários sucessores e/ou predecessores
- exemplo: hipóteses para a evolução do homem até os dias de hoje
### ⮩ ordem circular
- um conjunto de dados se repete periodicamente em uma certa ordem
- exemplo: períodos de promoção de uma loja: verão, páscoa,...
## Classificação do tempo
### ⮩ tempo instantâneo
- caracterísrico de BD convencional, registra apenas o dado válido no momento atual
- tempo implícito é a data do sistema Tempo de Transação ou Evolutivo: trata o tempo de transação
- tempo fornecido pelo SGBD (timestamp), característico de BD de tempo de transação ou BD Roolback
### ⮩ tempo de validade
- tempo em que o dado é válido no mundo real
- tempo fornecido pelo usuário
- característico de BD Histórico
### ⮩ tempo bitemporal
- manutenção conjunta do tempo de validade e do tempo de transação

## Granulidade temporal
- um **chronon** é um intervalo temporal que não pode ser decomposto
  - exemplo: ano, mês, dia, hora
- quanto menor for a granularidade, maior é o detalhamento de uma informações
- observação: Ao definir-se a granularidade de uma aplicação implica que todos os eventos que ocorrem dentro de uma mesma granularidade serão considerados eventos simultâneos, sendo que, pode acontecer dos mesmos não serem(ELMASRI, NAVATHE, 2005). Está definição deve ser tomada com plena consciência das características da aplicação.

## Modelagem Relacional Temporal
três formas usuais de representação, ou seja, como o banco vai salvar os dados
### ⮩ Relação instantânea/temporal
- mantém dados instantâneos e temporais em uma única relação
- cada vez que algum dado é alterado, cria-se uma nova linha para salvar as informações
    - ID, a1,...,an,Tinicio,Tfim
- vantagem: maior número de relações
- desvantagens: redundância de dados e baixo desempenho para consultas instantâneas 
### ⮩ Relação instantânea e relação temporal
- mantém dados instantâneos e temporais em relações separadas
  - R INST - ID, a1,...,an
  - R TEMP - ID, a1,...,an,Tinicio, Tfim
- vantagem: melhor desempenho para consultas instantâneas
- desvantagens: redundância de dados e maior número de relações
### ⮩ Relação temporal delta
- mantém relações temporais separadas para cada atributo - definidas apenas para atributos temporais
  - ID, a1,...,an
  - ID, a1, Tinicio, Tfim
  - ID, an, Tinicio, Tfim
- vantagem: evita redundância
- desvantagem: baixo desempenho para consultas temporais (tem que fazer join entre as tabelas) e maior número de relações  

## Forma Normal Temporal
- uma relação temporal possui duas chaves candidatas: (CPI, Ti) ou (CPI, Tf) na qual CPI
- chave primária invariante no tempo
- forma normal temporal: se existe dependência temporal (sincronismo) entre seus atributos não chave


## Criando um banco de dados temporal
```SQL
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

```







