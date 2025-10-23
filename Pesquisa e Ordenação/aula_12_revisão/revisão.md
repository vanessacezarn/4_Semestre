# REVISÃO GERAL DE PESQUISA

### 1) O que é e para que serve? 
- pesquisar é localizar algo de forma simples e direta e devolvendo seu endereço, atualmente também é recuperar dados relevantes de forma significativa em grande ambientes muito grandes. Tem dois processos distintos: o buscar classico (localizar) e recuperação

* para poder pesquisar algo ele tem que estar armazenado, guardar bem
  
### 2) Loccalizar versus recuperar
- localizar ➔ achar um dado e mostrar seu endereço ➔ indexOf, contains, in
- recuperação ➔ trazer a tona com signignificado e grande volume ➔ também acha o dado e retorna seu endereço
    - indexação ≅  índices ➔ etiquetação + tabela hash
      - apontador de conteúdo ➔ dois tipos: remissivo e analítico
* tipos de índice
  * indice remissivo ➔ lista de palavras-chaves e termos, geralamente no fim do livro
    * google = indexação por etiquetação (tags) ➔ tabela hash
  * índice analítico ➔ análise mais aprofundada dos tópicos abordados, organizados em categorias, geralmente no inicio como sumário
    
### 3) Tipos de pesquisa e suas complexidades
- tem que saber quando usar cada pesquisa e quantas comparações precisam ser feitas
    - para pesquisas em estruturas em vetores e lista ➔ sequencial e binária
    - para pesquisa em textos ➔ digital
    - para pesquisa tanto em vetores e listas ➔ hash
#### Sequencial
- de forma bruta ➔ Complexidade: O(n)
- utilizada quando a estrutura não está ordenada
#### Binária 
- Complexidade: O(log n)
- depende da ordenação
- é baseada na dinâmica de árvores binárias
#### Digital 
- Complexidade: O(n)
- realiza a pesquisa caractere a caractere
- árvore trie?
  
#### Hash 
- O(1) ➔  tabela, função hahs
    - tabela hash não ordena

- saber quando usar elas, quantas comparações precisam ser feitas
### 4) Fluxo 
armazenar ➔ "ordenar" ➔ pesquisar

### 5) Algoritmo de pesquisa binária

### 6) Algoritmo de pesquisa digital

### 7) Teoria de tabelas hash
#### HASH
- tabela hash ➔ inserir e buscar via cálculo de endereço
- função hash de endereçamento

#### links do github
https://github.com/alexandrezamberlan/pesquisa_ordenacao/blob/master/04-pesquisa/Java/MetodosPesquisa.java
https://github.com/alexandrezamberlan/pesquisa_ordenacao/blob/master/04-pesquisa/resumoPesquisa.txt
https://github.com/alexandrezamberlan/pesquisa_ordenacao/blob/master/07-pesquisaDigital/src/Frame_principal.java
linha 101
