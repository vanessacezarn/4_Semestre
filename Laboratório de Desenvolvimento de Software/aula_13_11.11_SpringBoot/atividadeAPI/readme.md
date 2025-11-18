# API REST PARA CADASTRO DE PESSOAS
- utilizar o banco de dados bdaula01 que contém uma tabela pessoa com os atributos id, nome, sexo e idioma
- criar uma API REST em Java utilizando Spring Boot que permita cadastrar, consultar, atualizar e excluir pessoas do banco
### ➤ O projeto Spring Boot deve ter as dependências:
1) Spring Web
2) Spring Data JPA
3) MySQL Driver
### ➤ A configuração do acesso ao banco bdaula01 no arquivo application.properties deve ter:
- URL de conexão
- usuário e senha
- Dialect/Hibernate ddl-auto (update)
### ➤ A classe Model Pessoa deve ter os seguintes atributos:
- private Long id (pk e auto_increment)
- private String nome
- private String sexo
- private String idioma
### ➤ A interface Repository deve estender JpaRepository<Pessoa, Long>
### ➤ Deve-se ter uma Controller para expor os endpoints REST:
1) GET/pessoa ➔ listar todos
2) GET/pessoa/{id} ➔ buscar pelo id
3) POST/pessoa ➔ cadastrar uma nova pessoa
4) PUT/pessoa/{id} ➔atualizar cadastro
5) DELETE/pessoa/{id} ➔excluir pessoa
6) desafio: GET/pessoa/idioma/{idioma} ➔ busca pessoa pelo idioma
### ➤ Testar os endpoints via Postman
