# Apresentação da disciplina
### Unidade 1 - Planejamento de projeto de software
* ambientes de desenvolvimento de software
* codificação em camadas
* arquitetura de software
### Unidade 2 - Interface grafica
* principais componentes gráficos
* desenvolvimento de software
* estudos de caso
### Unidade 3 - Integração com banco de dados
* fundamentos de banco de dados
* desenvolvimento de software
* configuração e comunicação em rede
### Unidade 4 - Desenvolvimento de software
* gerenciamento de dependências
* repositórios de dependências
* implementação e distribuição
  
# Revisão de conceitos de Programação Orientada a Objetos
### ✦ Classe
* estrutura que abstrai  um conjunto de objetos com características similares, ou seja, representa um conjunto de objetos
* define o comportamento dos objetos através de métodos e atributos
  * métodos = funções
  * atributos = variáveis
* descreve as características e funcionalidades dos objetos
*  Subclasse: classe filha que herda os atributos e os métodos da classe mãe (Herança)
### ✦ Objeto
* é a instância de uma classe
* é possível ter vários objetos a partir de uma classe
* o estado de um objeto é representado por seus atributos
* o comportamento é representado pelos seus métodos
### ✦ Encapsulamento 
* empacotamento dos atributos e métodos numa classe, através do uso de modificadores de acesso:
  * publico (+) : qualquer classe pode acessar o membro
  * privado (-) : somente a própia classe pode acessar o membro
  * protegido(#) : as subclasses e a classe do mesmo pacote podem acessar o membro
* Os getters e setters são métodos que permitem o acesso e a modificação dos atributos privados de uma classe, respeitando o conceito de encapsulamento.
   * **getters** são usados para obter o valor de um atributo, "getNome()" 
   * **setters** são usados para alterar o valor de um atributo, "setNome()"
* o encapsulamento não impede completamente o acesso aos atributos de uma, mas fornece uma camada de proteção adicional e ajuda a tornar o código mais robusto e seguro 
### ✦ Métodos
* podem ou não retornar um valor
  * se retornar, é preciso especificar qual é o tipo dess valor na declaração da método e usar a palavra-chave return
* parâmetro são valores que são passados para o método quando ele é chamado, precisa declarar quais são os tipos 
### ✦ Construtores
* é método construtor utilizado para inicializar um objeto de uma classe
* o java requer uma chamada de construtor para todo objeto que é criado
* a palavra-chave <ins> new </ins> chama o construtor da classe para realizar a inicialização
* o nome do construtor deve ser igual ao nome da classe
### ✦ Herança
* é uma forma de reutilização de software
* permite além de reutilização, manutenção simples e eficiente: alterações em cascata
* palavra chave <ins> extends </ins>
* O comando super serve para chamar o construtor da superclasse, ou seja, da classe que é herdada
### ✦ Polimorfismo
*  permite “programar no geral” ao invés de “programar no específico”
*  **override** - sobrescrita de métodos
    * mesmo nome, mesmos parâmetros e mesmo tipo de retorno,
    * modifica implementação
    * é o processo de fornecer uma implementação diferente para um método já definido em uma classe base.
    * permite que a classe derivada substitua o comportamento da classe base para o método em questão
*  **overload** - sobrecarga de métodos
    *  métodos com o mesmo nome, porém com parâmetros diferentes e/ou tipos de retorno diferentes
    *  permite que a classe tenha vários métodos com o mesmo nome, mas que façam coisas diferentes, dependendo dos parâmetros que são passados.
    *  o Java decide qual método chamar com base nos parâmetros que são passados durante a chamada do método
