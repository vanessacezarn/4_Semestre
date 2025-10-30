# RESTRIÇÕES DE INTEGRIDADE
## ➤ o que é integridade de dados
manuteção e garantia de consistência e precisão dos dados, sendo um aspecto crítico no design, implementação e uso de sistemas de armazenamento de dados ➔ a integridade é atingida por meio da aplicação de restrições de integridade
## ➤ Tipos
as restrições de integridade dos dados podem ser constrídas no SGBD de duas formas 
### ⮩ DECLARATIVA
- as restrições são parametrizadas durante a criação das estruturas das tabelas, utilizando linguagem SQL
- feita dentro do DDL
- faz uso de chaves primárias, impede valores não-nulos utiliza tipos e dominios de dados aplicando regras de integridade referencial
### ⮩ PROCEDUAL ou SEMÂNTICA
- é possível fazer uso de recursos como triggers, stored procedure, assertion
- é implementada por programadores ou analistas especializados na linguagem e no SGBD, com auxílio das regras de negócio passadas pelos clientes
## ➤ PRINCIPAIS RESTRIÇÕES DE INTEGRIDADE
### ⮩ INTEGRIDADE DE DOMÍNIO
- se um atributo tiver que receber valores dentro de um intervalo pré-estabelecido para um domínio, ele só receberá valores dentro deste intervalo, caso contrário uma mensagem de erro aparecerá para o usuário para que ele possa ajustar os dados antes da entrada no banco de dados
- valores inseridos em uma coluna devem sempre obedecer à definição dos valores que são permitidos para essa coluna ➔ valores do domínio
- fatores:
  - tipo de dado do campo
  - representação interna do tipo de dado
  - presença ou não do dado
  - intervalos de valores no domínio
  - conjunto de valores discretos 
### ⮩ INTEGRIDADE REFERENCIAL
- assegura que valores de uma coluna em uma tabela são válidos baseados nos valores em um outra tabela relacionada
- exemplo: se um produto foi cadastrado com id435 em uma tabela de vendas, então a tabela de produtos relacionada deve ter o produto com id435
- **atualização e exclusão**
  - se um registro for excluído em uma tabela, então os registros relacionados em outra tabela que o referenciam talvez precisem ser excluídos ➔ caso contrário ocorrerá erro
  - CASCADE: se um registro for excluído em uma tabela (operações DELETE e TRUNCATE) então os registro relacionados em outra tabelas que o referenciam talvez precisem ser excluídos ➔ caso contrário ocorrerá erro ➔ ocorre a mesma coisa para atualizações (UPDATE)
      - on delete cascade
      - on update cascade
### ⮩ INTEGRIDADE DE VAZIO
- informa se a coluna é obrigatória ou opcional, ou seja, se é possível não inserir um valor na coluna
- um valor NULL significa que não existe dados ➔ é diferente de zero, espaço, string vazia ou tabulação
- valores nulos podem ser problemátivcos pois indicam: valor da coluna não é apropiado, não foi especificado ou é desconhecido
### ⮩ INTEGRIDADE DE CHAVE
- os valores na coluna de chave primária devem ser sempre úicos, não admitindo-se repetições nesses valores
- dessa forma: as tuplas (registros) serão sempre distintas
- essa restrição afirma que nenhum valor de chave primária pode ser NULL pois seu valor é utilizado para identificar tuplas individuais em uma relação
### ⮩ INTEGRIDADE DEFINIDA PELO USUÁRIO
- permite definir regras comerciais que não se encaixam em outras categorias de integridade
- todas as categorias de integridade oferecem suporte à integridade definida pelo usuário
- essa integridade refere-se a regras de negócio específicas que são definidas pelo usuário do banco de dados
  
# VIEWS
- uma exibição (view) é uma tabela virtual baseada no conjunto de resultados de uma consulta SQL
- contém linhas e colunas como uma tabela real, e pode receber comandos como declarações JOIN, WHERE e funções como uma tabela normal
- mostra sempre resultados de dados atualizados, pois o motoe do banco de dados recria os dados toda a vez que o usuário consulta a visão
## ➤ VANTAGENS
#### ⮩ REUSO
- as views são objetos de caráter permanente
- pelo lado produtivo é ótimo ➔ já que pode ser lidas por vários usuários simultaneamente
#### ⮩ SEGURANÇA
- views permitem que sejam ocultadas determinadas colunas de uma tabela ➔ é necessário apenas criar uma view com as colunas que precisam ser exibidas e a disponibilizar para o usuário
#### ⮩ SIMPLIFICAÇÃO DE CÓDIGO
- permitem criar um código de programação muito mais limpo ➔ pode conter um SELECT complexo ➔ o que pode aumentar a produtividade da equipe de desenvolvimento
#### ⮩ ECONOMIZAR TEMPO COM RETRABALHOS
- não precisa ficar reescrevendo instruções enormes ➔ escrever uma vez e armazena-la
#### ⮩ VELOCIDADE DE ACESSO ÀS INFORMAÇÕES
- uma vez compilada o seu recordset (conjunto de dados) é armazenado em uma tabela tamporária (virtual)
#### ⮩ MASCARAR COMPLEXIDADE DO BANCO DE DADOS
- as views isolam do usuário a complexidade do banco de dados
- nome de domínios podem ser referenciados com literias e outros recursos ➔ proporciona aos desenvolvedores a capacidade de alterar a estrutura sem afetar a interação do usuário com o banco de dados
#### ⮩ SIMPLIFICA O GERENCIAMENTO DE PERMISSÃO DE USUÁRIO
- os propietários de banco de dados podem conceder permissões para que os usuários consultem dados somente através de views
- também protege as alterações na estrutura das tabelas base subjacentes
- os usuários não serão interrompidos durante uma visuzalização de dados
#### ⮩ ORGANIZAR DADOS A SEREM EXPORTADOS
- pode-se criar uma view baseada em uma comsulta complexa, que associe até 32 tabelas e depois exportar os dados para outro aplicativo para análise adicional ➔ pode ser gerado um arquivo de DUMP automaticamente
    - DUMP (despejo) de banco de dados ➔ contém um registro da estrutura da tabela e/ou dados de um banco de dados, e normalmente está na forma de uma lista de declarações SQL

## ➤ ONDE USAR
#### ⮩ Restrição usuário x dados
exemplo: o departamento de vendas não precisa ter acesso a uma coluna que contém dados referentes aos salários dos desenvolvedores
#### ⮩ Restriçaõ usuário x domínio
exemplo: pode-se restringir o acesso de um usuário específico a colunas específicas de uma tabela
#### ⮩ Associar vários domínios formando uma única entidade
exemplo: pode-se ter várias 'JOIN' encapsulados em uma view, formando somente uma tabela atbitrariamente
#### ⮩ Agregar informações, em vez de fornecer detalhes
exemplo: pode-se apresentar um somatório de despesas em ligações de um determinado usuário, restringindo acesso aos detalhes da conta
## ➤ CRIAÇÃO ou ALTERAÇÃO
```SQL
CREATE or ALTER VIEW [nome_exibição] AS
SELECT coluna
FROM tabela
WHERE condição
```
#### utilizando o banco bd_biblioteca, cire uma view para retornar informações dos livros
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
## ➤ EXCLUSÃI
```SQL
DROP VIEW [nome_exibição] 
```










