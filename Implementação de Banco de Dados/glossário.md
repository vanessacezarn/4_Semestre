## Conceitos importantes da abordagem ENTIDADE-RELACIONAMENTO
#### ✦ ENTIDADE
- conjunto de objetos da realidade modelada sobre os quais deseja-se manter informações no banco de dados
- representada através de um retângulo
##### ✸ Identificador de entidade
- cada entidade de possuir um identificador ➔ conjunto propiedades de uma entidade cujos valores servem para distinguir uma ocorrência da entidade das demais ocorrências da mesma entidade
#### ✦ RELACIONAMENTO
- conjunto de associações entre entidades sobre as quais deseja-se manter informações na base de dados
##### ✸ CARDINALIDADE DE RELACIONAMENTOS
- propiedade que informa quantas ocorrências de uma entidade podem estar associadas a uma determinada ocorrência de entidade através do relacionamento
- relacionamento binário: é aquele cujas instâncias envolvem duas instâncias de entidades
    - 1:1 um-para-um
    - 1:n um-para-muitos
    - n:n muitos-para-muitos 
#### ✦ ATRIBUTO
- dado ou informação que é associado a cada ocorrência de uma entidade ou de um relacionamento
##### ✸ ATRIBUTOS COM CARDINALIDADE
- Cardinalidade mínima:  
    - atributo obrigatório ➔ cardinalidade mínima "1"
        - cada entidade possui no minimo um valor associado
    - atributo opcional ➔ cardinalidade mínima "0"
- Cardinalidade máxima:  
    - atributo monovalorado ➔ cardinalidade mínima "1"
        - cada entidade possui no máximo um valor associado
    - atributo multivalorado ➔ cardinalidade mínima "n"
#### ✦ GENERALIZAÇÃO/ESPECIALIZAÇÃO
- permite atribuir propiedades particulares a um subconjunto das ocorrências (especializadas) de uma entidade genética
- herança de propiedades significa cada ocorrência da entidade especializada possui além de suas própias propiedades e também as propriedades da ocorrência da entidade genérica correspondente
#### ✦ ENTIDADE ASSOCIATIVA
- é usada quando temos um relacionamento N:N (muitos para muitos) entre duas entidades e precisamos transformá-lo em uma entidade própria para representar melhor os dados.
- Representa um relacionamento transformado em entidade.
- Sempre contém chaves estrangeiras das entidades que conecta.
- Pode ter atributos próprios que só fazem sentido naquele relacionamento.

<div align="center">
  <img width="326" height="350" alt="image" src="https://github.com/user-attachments/assets/90cc9ffc-9a33-476a-a701-a8a8edb0b0d2" />
</div>

### ✦ CHAVES
- conceito usado para especificar restrições de integridade básicas de um SGBD relacional
- O uso adequado de PRIMARY KEY e FOREIGN KEY não só garante a integridade dos dados dentro de um banco de dados mas também define claramente as relações entre diferentes conjuntos de dados, facilitando a realização de consultas complexas e a manutenção da consistência dos dados.
#### ✸ Chave Primária
- é uma coluna ou uma combinação de colunas cujos valores distinguem uma linha das demais dentro de uma tabela
- unicidade ➔ garante que cada valor na coluna ou conjunto de colunas da chave primária seja único em toda a tabela
- não nulidade ➔ garante que cada registro na tabela tenha um valor na coluna ➔ não permite valores NULL
#### ✸ Chave Estrangeira
- uma coluna ou uma combinação de colunas, cujos valores aparecem necessariamente na chave primária de uma tabela
- mecanismo que permite a implementação de relacionamentos em um banco de dados relacional
- é uma restrição usada para estabelecer uma relação de "chave estrangeira" entre duas tabelas
- integridade referencial ➔ garante que as relações entre as tabelas permaneçam consistentes
- chaves compostas ➔ quando múltiplas colunas são usadas, elas são conhecidas como chaves compostas
- ações em cascata ➔ definir restrições de chave estrangeira, pode-se especificar ações em cascata para atualizações e exclusões, CASCATE, SET NULL ou NO ACTION, que determinam o que acontece com as linhs refernciadas quando os dados são alterados ou excluídos na tabela referência
#### ✸ Chave Alternativa 
- mais de uma coluna ou combinação de colunas podem servir para distinguir uma linha das demais
- uma das colunas é escolhida como chave primária
- as demais colunas ou combinações são denominadas chaves alternativas

# PRINCIPAIS COMANDOS
## DATA DEFINITION LANGUAGE - DDL
- usada para criar e modificar a estrutura de banco de dados e tabelas
```sql
-- criar um novo banco de dados
CREATE DATABASE nomeBanco;
-- selecionar o banco de dados que sera usado
USE nomeBanco;
-- remover um banco de dados
DROP DATABASE nomeBanco;
-- criar uma tabela
CREATE TABLE nomeTabela(
    nomeColuna tipoDado restricoes
);
-- excluir uma tabela existente
DROP TABLE nomeTabela;
-- deletar todos os dados de uma tabela
TRUNCATE TABLE nomeTabela;
-- alterar o nome de uma tabela
RENAME TABLE nomeTabela TO novoNomeTabela
-- fazer em alguma alteração ALTER
-- adicionar nova coluna
ALTER TABLE nomeTabela
ADD nomeNovaColuna tipoDado restricoes;
-- remover uma coluna
ALTER TABLE nomeTabela
DROP COLUMN nomeColuna;
-- modificar o tipo de dado de uma coluna
ALTER TABLE nomeTabela
MODIFY COLUMN nomeColuna novoTipoDado;
-- adicionar uma restrição de chave estrangeira
ALTER TABLE nomeTabela
ADD CONSTRAINT nomeRestricao
FOREIGN KEY (nomeColuna) REFERENCES outraTabela(colunaOutraTabela);
-- adicionar uma chave primária
ALTER TABLE nomeTabela
ADD PRIMARY KEY (nomeColuna)
```

### TIPOS DE DADOS
#### DADOS DO TIPO STRING
#### DADOS DO TIPO NUMERICO
#### DADOS DO TIPO DATA

### TIPOS DE RESTRIÇÕES
- Restrições
    - usadas para especificar regras para os dados em uma tabela
    - limita o tipo de dado que podem ser inseridos em uma tabela
    - garante a precisão e a confiabilidade dos dados na tabela
- Restrições comumente utilizadas em SQL

|RESTRIÇÃO|DESCRIÇÃO|
| :----:  |  :----: |
|NOT NULL| Garante que uma coluna não possa ter um valor NULL|
|UNIQUE| Garante que todos os valores em uma coluna sejam diferentes|
|PRIMARY KEY|Combinaçao de NOT NULL e UNIQUE. Identifica de forma **única** cada linha em uma tabela|
|FOREIGN KEY|Impede ações que destruiriam as ligações entre tabelas|
|CHECK|Garante que os valores em uma coluna satisfaçam uma condição específica|
|DEFAULT|define um valor padrão para uma coluna se nenhum valor for especificado|
|AUTO INCREMENT|Incrementa automaticamente o valor da coluna para cada nova linha inserida|
|CREATE INDEX| Criar e recuperar dados do banco de dados muito rapidamente|


  
## DATA MANIPULATION LANGUAGE - DML
- utilizada em sistemas de gerenciamento de banco de dados SQL para manipular dados dentro de tabelas
- operações permitem que os usuários insiram, consultem, atualizem e excluam dados
