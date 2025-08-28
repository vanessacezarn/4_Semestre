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
#### ✸ Chave Primária
- é uma coluna ou uma combinação de colunas cujos valores distinguem uma linha das demais dentro de uma tabela
#### ✸ Chave Estrangeira
- uma coluna ou uma combinação de colunas, cujos valores aparecem necessariamente na chave primária de uma tabela
- mecanismo que permite a implementação de relacionamentos em um banco de dados relacional
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
-- remover um banco de dados
DROP DATABASE nomeBanco;
-- criar uma tabela
CREATE TABLE nomeTabela(
    nomeColuna tipoDado restricoes
);

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


  
## DATA MANIPULATION LANGUAGE - DML
