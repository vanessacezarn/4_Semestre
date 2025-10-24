# RESTRIÇÕES DE INTEGRIDADE
## o que é integridade
manuteção e garantia de consistência e precisão dos dados, sendo um aspecto crítico no design, implementação e uso de sistemas de armazenamento de dados ➔ a integridade é atingida por meio da aplicação de restrições de integridade
## Tipos
as restrições de integridade dos dados podem ser constrídas no SGBD de duas formas 
### DECLARATIVA
- as restrições são parametrizadas durante a criação das estruturas das tabelas
- feita dentro do DDL
- faz uso de chaves primárias, impede valores não-nulos utiliza tipos e dominios de dados aplicando regras de integridade referencial
### PROCEDUAL ou SEMÂNTICA
- é possível fazer uso de recursos como triggers, stored procedure, assertion
- é implementada por programadores ou analistas especializados na linguagem e no SGBD, com auxílio das regras de negócio passadas pelos clientes
## PRINCIPAIS RESTRIÇÕES DE INTEGRIDADE
### INTEGRIDADE DE DOMÍNIO
- ...
- valores inseridos em uma coluna devem sempre obedecer à definição dos valores que são permitidos para essa coluna ➔ valores do domínio
- fatores:
  - tipo de dado do campo
  - representação interna do tipo de dado
  - presença ou não do dado
  - intervalos de valores no domínio
  - conjunto de valores discretos 
### INTEGRIDADE REFERENCIAL
- assegura que valores de uma coluna em uma tabela são válidos baseados nos valores em um outra tabela relacionada
- exemplo: se um produto foi cadastrado com id435 em uma tabela de vendas, então a tabela de produtos relacionada deve ter o produto com id435
#### atualização e exclusão
  - se um registro for excluído em uma tabela, então os registros relacionados em outra tabela que o referenciam talvez precisem ser excluídos ➔ caso contrário ocorrerá erro
  - CASADE: se um registro for excluído em uma tabela (operações DELETE e TRUNCATE) então os registro relacionados em outra tabelas que o referenciam talvez precisem ser excluídos ➔ caso contrário ocorrerá erro ➔ ocorre a mesma coisa para atualizações (UPDATE)
      - on delete cascade
      - on update cascade
### INTEGRIDADE DE VAZIO
- informa se a coluna é obrigatória ou opcional, ou seja, se é possível não inserir um valor na coluna
- um valor NULL não significa que não existe dados ➔ é diferente de zero, espaço, string vazia ou tabulação
- valores nulos podem ser problemátivcos pois indicam: valor da coluna não é apropiado, não foi especificado ou é desconhecido
### INTEGRIDADE DE CHAVE
- os valores na coluna de chave primária devem ser sempre úicos, não admitindo-se repetições nesses valors,
- dessa forma: as tuplas (registros) serão sempre distintas
- essa restrição afirma que nenhum valor de chave primária pode ser NULL pois seu valor é utilizado para identificar tuplas individuais em uma relação
### INTEGRIDADE DEFINIDA PELO USUÁRIO
- permite definir regras comerciais que não se encaixam em outras categorias de integridade
- todas as categorias de integridade oferecem suporte à integridade definida pelo usuário
- essa integridade refere-se a regras de negócio específicas que são definidas pelo usuário do banco de dados
  
# VIEWS
- uma exibição (view) é uma tabela virtual baseada no conjunto de resultados de uma consulta SQL
- contém linhas e colunas como uma tabela real, e pode receber comandos como declarações JOIN, WHERE e funções como uma tabela normal
- mostra sempre resultados de dados atualizados, pois o motoe do banco de dados recria os dados toda a vez que o usuário consulta a visão
## VANTAGENS
#### REUSO
#### SEGURANÇA
#### SIMPLIFICAÇÃO DE CÓDIGO
permitem criar um código de programação muito mais limpo ➔ pode conter um SELECT complexo
#### ECONOMIZAR TEMPO COM RETRABALHOS
não precisa ficar reescrevendo instruções enormes ➔ escrever uma vez e armazena-la
#### VELOCIDADE DE ACESSO ÀS INFORMAÇÕES
uma vez compilada o seu recordset (conjunto de dados) é armazenado em uma tabela tamporária (virtual)
#### MASCARAR COMPLEXIDADE DO BANCO DE DADOS
#### SIMPLIFICA O GERENCIAMENTO DE PERMISSÃO DE USUÁRIO
#### ORGANIZAR DADOS A SEREM EXPORTADOS

## ONDE USAR

## CRIAÇÃO
```SQL
CREATE VIEW [nome_exibição] AS
SELECT coluna
FROM tabela
WHERE condição
```
#### utilizando o banco bd_biblioteca, cire uma view para retornar todas as informações
```SQL
alter VIEW [nome_exibição] AS
SELECT L.isbn, L.titulo,l.ano, CONCAT(A.nome,'(', a.nacionalidade,')') AS Autor_Nacionalidade, e.nome as editora,c.tipo_categoria as categoria
FROM Livro as L
JOIN LivroAutor as LA
ON LA.fk_livro = L.isbn
JOIN Autor as A
on a.id = LA.fk_autor
JOIN Editora AS E
ON L.fk_editora = E.id
JOIN Categoria AS C
ON L.fk_categoria = C.id


SELECT * FROM nome_exibição order by titulo

```












